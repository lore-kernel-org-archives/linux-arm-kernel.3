Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1BFC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KXEtpc2eZOzFLNgU6BIxcnmmI4v3hM2iwSC1MNAdVg=; b=QEh6Et4Hb0wNZGC9GYJ4nXBOgV
	Y4TXPLZmUALJk96xNNu8xbY8VSbdwndCcKiDXBvDr8OVEKePJdnwv27sOB8XwYRBmy5UEy5RHbzLb
	Zf2HdAu/i3+Y9NnJOZe+LWg3xP/76bCCR9nYfc26B8LtIeJQ7ipXTu6v8UCahEWX+MbMFzz9n7una
	2OXARpd/N7w0sf+LUU7zo/BlstZctDDOzmflPFYQ7RjWtUGcapVJ+0PCEZSH3/kVMgxanh7DRTjjw
	iQsC0J5EP4KrWxmV6afdFD/60U2GeFuMcOQvMd4vmZMwFv3DEcj2oiaKuiSLLsR0dh1jWI9kjn0vY
	GsRlfaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gjl-0000000AjrS-3mhW;
	Thu, 24 Sep 2026 10:31:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gjX-0000000Ajnk-48AC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B8B060202;
	Thu, 24 Sep 2026 10:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422371F00893;
	Thu, 24 Sep 2026 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790245878;
	bh=7KXEtpc2eZOzFLNgU6BIxcnmmI4v3hM2iwSC1MNAdVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NEoo3VWIyOplC/opylAofAG/oV3i0WzEkZSaGQ2AcrpyotAPEZJSL6jgesPeUk4OQ
	 BHcfkL190UQNx6Gkp6yEdEZ0kzrzafpyWv/mDKtvap5QPb5CiCG1RmsTNiEjp1GYCk
	 DPt3fLD33JB6R8a9DQ7k7CnoEoAHlX+/lLYfH1Y8ExCnZuDrk/WLUtqsBMmzWYN//8
	 P4ywCrVZxZm1hDcLmlpJtsHB93/U0a2Xx3qH6aBWLvpF4pXvmDNysHcbEl3hyoiJ2M
	 dblzkb4QsMo8zsEOW0S3rk/2HuWCDyPmW5+gPG0bPOR7et3NjUjqq99+RsJ9HxI/70
	 59e0epli+M9fg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Fix the break-before-make flush range for erratum 2645198
Date: Thu, 24 Sep 2026 11:31:06 +0100
Message-ID: <179023970437.1597741.12909890449648716020.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923143636.89480-1-parri.andrea@gmail.com>
References: <20260923143636.89480-1-parri.andrea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 23 Sep 2026 16:36:32 +0200, Andrea Parri wrote:
> modify_prot_start_ptes() performs the break-before-make TLB invalidation
> required by erratum 2645198 with __flush_tlb_range(), whose third
> argument is the end address of the range.  It passes nr * PAGE_SIZE
> instead of addr + nr * PAGE_SIZE, so __do_flush_tlb_range() computes the
> page count as (nr * PAGE_SIZE - addr) >> PAGE_SHIFT.
> 
> For addr > nr * PAGE_SIZE that subtraction underflows, the page count
> exceeds the batching limit and the flush degenerates to flush_tlb_mm(),
> so a single-page mprotect broadcasts an ASID-wide invalidation and a
> full-range mmu notifier call.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Fix the break-before-make flush range for erratum 2645198
      https://git.kernel.org/arm64/c/1fef81669147

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

