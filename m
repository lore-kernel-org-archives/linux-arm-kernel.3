Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89509CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE/rNH0KWG/DAc/KpJx6sg3d1dpFFQa/4mtimD5bwT8=; b=nVhBiGuFND5aB5HOjKQdtD6YG4
	A/JJAptsQjFx0OvfoUbDj/sabU968xOzn4NBpvVN4dIxDJFO3nIlhW+PGnAST6TEr5xM1d+uA8KU9
	9yRSaW2nASi7D+S5Vgg+BjA6O2JE5Wu7XsqwCq3QxzggOD0Qh2UlFv4PezgNuvxlXUGu+CPsQO9+w
	kZCdOhAoQy9xcBqDIowN+RzYUzOBPp7SQzhOxtRqMw+YZFJzhQ8KpCvh74d9v0gTPmCU3MrEDd1Bc
	n1ggq/z4trd6FpMxjnEOTcj27SQyP0Q2RUzmIw72ZgUTxhyMisCBok95wptbTt9tXivptFWMHSBn8
	IYjwWBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcXP-0000000Axgo-38RL;
	Thu, 13 Nov 2025 18:59:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcXN-0000000Axg2-0ENf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA13D42B9E;
	Thu, 13 Nov 2025 18:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21328C4CEF8;
	Thu, 13 Nov 2025 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060356;
	bh=bRo43ZXqGD3NNIoHn1ylw4FbNh/9bqm8ocau1/+g3MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRuzrKzBGRvvGyf5octAUw8GZMPOADOHPj5iUgcRVkSC7YvgCvelXzadXqGZkVO+b
	 ne8eD2SEPpjPFW4m9XGy9OtNkspJGMFkL8P3K00moOM3bVYUII8vdPsBOvADnjlFHx
	 9GcOqyEKU1QYtbPbCDV9y4waZszEr/1XBfF0QQD6qRoSB6IEw7ECfc01cR5skwKjxV
	 htU9e/8Vfh3BDlZMwSefrHLzD4anwDcJtExMP4Xr+skrvgHoeezdo2bVLSHWjBhjN9
	 k8/WQLKyqQljzMP8ZLRNZuNftB1IZPt0F8lJMfsWGnZhTBfRhWnAwbpV/4PNwogVi3
	 TL5kj6AMEXssg==
From: Catalin Marinas <cmarinas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [PATCH v4 0/2] arm64/mm: prevent panic on -ENOMEM in arch_add_memory()
Date: Thu, 13 Nov 2025 18:59:03 +0000
Message-ID: <176306032237.2459767.15705296734744226735.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017051437.2836080-1-linu.cherian@arm.com>
References: <20251017051437.2836080-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_105917_115521_DFDAC038 
X-CRM114-Status: GOOD (  10.81  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Fri, 17 Oct 2025 10:44:35 +0530, Linu Cherian wrote:
> arch_add_memory() acts as a means to hotplug memory into a system. It
> invokes __create_pgd_mapping() which further unwinds to call
> pgtable_alloc(). Initially, this path was only invoked during early boot
> and therefore it made sense to BUG_ON() in case pgtable_alloc() failed.
> Now however, we risk running into a kernel crash if we try to hotplug
> memory into a system that is already extremely tight on available
> memory. This is undesirable and hence __create_pgd_mapping() and it's
> helpers are reworked to be able to propagate the error from
> pgtable_alloc() allowing the system to fail gracefully.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/2] arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc() errors
      https://git.kernel.org/arm64/c/bfc184cb1ba7
[2/2] arm64/mm: Rename try_pgd_pgtable_alloc_init_mm
      https://git.kernel.org/arm64/c/1b214452b6a7

-- 
Catalin


