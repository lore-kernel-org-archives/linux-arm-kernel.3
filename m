Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgRyh077JpOlPvbyS093nV19wXQoh7qJxnfwRw4w6lc=; b=K99G750llHuxVxQgARpOrZcNvy
	9CQuTPwyYibaVJWrd9QX0ijTc7phSelcOoyjHbxYdQcwCtMasK+226CY+Do9fGLvhleYVzXQZVJvC
	fxT8yvSqq3gk05yZtTsX0TcX55SSws9F+uji5D8KQeJOdIYNWjPpv5gRBbZIQBfQDhhcAZEc3Oks2
	KMBQNubwHDnG625uIyDs5elYAVMkBKiu/gVTVacydjOTXUUjbmDhe74stmzoL0FOs0T3+nLvjU3Se
	tbGljGbcu96T1i5DGndGQe5FGOd3vXxwJ4mbHbhvb/1f4qxQab/EpKVIR4ZccXF0hcediWwRvTOmq
	H97909Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzTt-00000005nVo-2EMj;
	Tue, 11 Mar 2025 13:17:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzQg-00000005mx7-2QEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 964E5A44D6B;
	Tue, 11 Mar 2025 13:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BB1C4CEF1;
	Tue, 11 Mar 2025 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741698833;
	bh=9mLY5RPTw27hiwcuML8iH9RHXhIJmFi/AX1Jr9j1JCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYoDqYaXzESca1O7TObIN8QSpxSi/xD2PB5a7T8nvZu0sEJsCWrrsMoJXaXy3Fb+N
	 X7A95Kqrb5awRQksIXyMSoiLCNYjl0o+kx7k8Wk5RKYDfjkxNQOzqlvA7yM6ZtDsn4
	 deqaqfMz09WXH5uLgU5IFZs3P7QKPkNn9njuibwzmyoJAo8UxOdeuW+VrQOPoOs1D3
	 yefAl2q65NMfEp+6AiAcunyhBorOrlsEdQ0MYRyOukfnB8uyTxezqeLid6YukzwDx2
	 mlh1HRPPRSA4aa+gJgZwu2yExKSzdcr09E2E1wrHuSihYDNTez4BmfZFnvmIM2izCO
	 Jk/h5MDUhypdw==
From: Will Deacon <will@kernel.org>
To: anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	david@redhat.com,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	chenfeiyang@loongson.cn,
	chenhuacai@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v9] arm64: mm: Populate vmemmap at the page level if not section aligned
Date: Tue, 11 Mar 2025 13:13:37 +0000
Message-Id: <174169292046.277676.9363571702356367812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
References: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_061354_683724_1F46245A 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 04 Mar 2025 15:27:00 +0800, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Populate vmemmap at the page level if not section aligned
      https://git.kernel.org/arm64/c/d4234d131b0a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

