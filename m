Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AABCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=321duBp0aPp9ESQIUn3PgEtVLnGlcLT2lvoMXfWxb2Y=; b=IoBtNJQZ5Ak6x5
	rloIIwWTDr64wcN/BbTEy9LOHiFgMELu0ZJCp7Rk5gg2fhdXomy85fTu82QA72D6BN86v8BhcFstA
	WJreZwZMK+JpuS0Hkd1MY2b/UfNbuDMR2wV1PxUm7N411yqUlojnDR26ltYUcBczsBM0s4hXhONUs
	L/wC56RTOaCfI2nOZ5KVIjpyhryFSuWNMMaK1lDH+2Rn9yoNIKbKbMuPpaMU2cpKwAwICoPXDNTCU
	iFomeF+njgnkz/xXRSfDiuOM9rG5LtwR2PH4b9IjVexUHPclri7em2PUi4yzujiANKILVA5OPbNRC
	KdmE/bF0uxJ7efyMgyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcOQ-0000000Fk0J-27iH;
	Mon, 05 Oct 2026 06:41:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcOM-0000000FjzL-1fMM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:41:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBACF1595;
	Sun,  4 Oct 2026 23:41:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A5B3F763;
	Sun,  4 Oct 2026 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791182498; bh=gPS4BaPCtTXPkS/p8WI2ZOze4/Fjezx1OmLe4zcOaeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iJBOFkhyRkxDNSYu02g9UxsbHGxbruPrgL0D5tGBG06toBL2lw8y5vZyyuenf0q+4
	 1eOIIWsEa7tWNBClthYMJ/VFcNqRFOCoGaSYEujimXlW7ms7jJX8ZxyFPait/jXuUx
	 Hrf3cEXGPzzoFMxv490xa3FwfIB0J1XyQUHUg8/M=
Date: Mon, 5 Oct 2026 12:11:34 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, 
	catalin.marinas@arm.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 0/4] arm64/mm: Convert pgtable READ_ONCE() as
 pxdp_get()
Message-ID: <6eghulpg35z63dpimrtw6p6x3zwfllfzjhpkpmgs5vcz4mpoda@poqgboea7nz5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924062214.1635078-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_234143_483315_85A3445F 
X-CRM114-Status: GOOD (  22.68  )
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

On Thu, Sep 24, 2026 at 11:52:10AM +0530, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation a well.
> 
> This is similar to generic MM where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v7.3-rc4 but after applying the following patches on
> pgtable entry print standardization posted earlier.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> 
> https://lore.kernel.org/linux-mm/20260916044933.2689426-1-anshuman.khandual@arm.com/

Hello Catalin/Andrew,

The above mentioned dependencies are already in mm-unstable, thus reflecting
in linux-next as well. Just to rule out merge conflict - this series applies
cleanly, builds and boots on latest tag next-20261002, which contains above
dependencies. But please do let me know if there are still some issues in
resolving this situation - will be happy to help. Thank you.

- Anshuman

> 
> These patches have been hosted here as well.
> 
> git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v3)
> 
> Changes in V3:
> 
> - Added overrides for pxdp_get() and replaced remaining READ_ONCE()
> - Updated all commit messages as required
> - Dropped previous tags
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/
> 
> - Rebased on v7.3-rc4 along with all latest dependencies
> - Updated commit messages per Ryan
> - Added tags from Ryan
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Use pmdp_get() for PMD accesses
>   arm64/mm: Use pudp_get() for PUD accesses
>   arm64/mm: Use p4dp_get() for P4D accesses
>   arm64/mm: Use pgdp_get() for PGD accesses
> 
>  arch/arm64/include/asm/pgtable.h | 40 +++++++++++++++++----
>  arch/arm64/mm/fault.c            |  8 ++---
>  arch/arm64/mm/fixmap.c           |  6 ++--
>  arch/arm64/mm/hugetlbpage.c      | 10 +++---
>  arch/arm64/mm/kasan_init.c       | 18 +++++-----
>  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
>  arch/arm64/mm/pageattr.c         |  8 ++---
>  arch/arm64/mm/trans_pgd.c        | 14 ++++----
>  8 files changed, 95 insertions(+), 69 deletions(-)
> 
> -- 
> 2.43.0
> 

