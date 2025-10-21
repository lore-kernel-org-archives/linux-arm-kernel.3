Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1462CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL71gVTw3MqaJ1wyfLF5OK2fdbbxrDQY9KKFXNaG0q4=; b=HV48i/aVpZ3wsIpC25CEscTCWl
	4MCeeu+soIUjKWlXhRMEfdDT+52naAkGmVwspjwHhWNvdvKzn3kh55adSbkMLFhL0R7MHWcbpxkxO
	GEbDnALAgiYrb65ZNN9/F6Qf54QI4Qgj0Rx1ahlJQEPbqnH0pUTrMMbeBmmc6AU9NdEOHeQ0dPQKK
	hwSRckjpjaY0FVH8Fd4NuR4ytiO9K56MHMNoEMTQVzmM7lhvX/cCiTmIi90rprVE47OEHCo2Xy5YO
	VzBRwedXk0noXwjnPP2D2Ahr6DuS9YHVe11p+7LiJSe6L9d/cuU3ZpEeeMgcbxGyNL2rhmRnKqUAA
	GYCUoIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBF59-000000005AR-3V3L;
	Tue, 21 Oct 2025 16:19:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBF57-0000000059i-27tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAC7245AD1;
	Tue, 21 Oct 2025 16:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B22C4CEF7;
	Tue, 21 Oct 2025 16:19:14 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Huang Ying <ying.huang@linux.alibaba.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
Date: Tue, 21 Oct 2025 17:19:05 +0100
Message-ID: <176106354573.3697793.9595844737584948515.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
References: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_091929_557279_E8A7B371 
X-CRM114-Status: UNSURE (   8.57  )
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

On Wed, 15 Oct 2025 10:37:12 +0800, Huang Ying wrote:
> Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
> mark some pages that are never written dirty wrongly.  For example,
> do_swap_page() may map the exclusive pages with writable and clean PTEs
> if the VMA is writable and the page fault is for read access.
> However, current pte_mkwrite_novma() implementation always dirties the
> PTE.  This may cause unnecessary disk writing if the pages are
> never written before being reclaimed.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
      https://git.kernel.org/arm64/c/143937ca51cc

-- 
Catalin


