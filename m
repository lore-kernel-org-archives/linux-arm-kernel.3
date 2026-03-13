Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64358107BCE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdjQJ+OVvT+c/3pEr4ZB1HuGriiw+Av79y99oNLyjik=; b=AQktIjHudC14oLnftzucmUdi1d
	XEUVhxA3q96sD5IJm08cDGUBk3Mee+Q/zyW3KyyiqohM8xmoNGGAWYtXr5ewX/QhbOOcnkoDTpDlC
	D74urjC33t078wTvdqIle4Hg/JjLamBMUNV+nmiIfadEstKN/kxHPcwm+W6uxsir7K0ES4QX8jhmd
	jsXjoy7flTQTnL3gmsmrI9x3B6azgDaL1uVQO3tVKsxGexbkxDssnNPZm8LIdoLBGJFmUBhaFH4Yo
	iuwPdyif4OVS6V9SYMsqspjfwY/L5klYhuKfT8KxvY6fQKWkAVZEwCFoDF9MuR8eW7OAxyDSR3jQP
	lZXEIXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18QK-000000016PJ-0OCh;
	Fri, 13 Mar 2026 19:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18QF-000000016Oa-45Bs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:43:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4AD1758;
	Fri, 13 Mar 2026 12:43:39 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A333F694;
	Fri, 13 Mar 2026 12:43:43 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:43:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Oliver Upton <oupton@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/13] arm64: Refactor TLB invalidation API and
 implementation
Message-ID: <177343096304.936952.3325300863465495091.b4-ty@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_124348_047162_240BD357 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, 02 Mar 2026 13:55:47 +0000, Ryan Roberts wrote:
> This series refactors the TLB invalidation API to make it more general and
> flexible, and refactors the implementation, aiming to make it more robust,
> easier to understand and easier to add new features in future.
> 
> It is heavily based on the series posted by Will back in July at [1]; I've
> attempted to maintain correct authorship and tags - apologies if I got any of
> the etiquette wrong.
> 
> [...]

Applied to arm64 (for-next/tlbflush), thanks!

Slight tweak to patch 13 around the last-level vs level 3 comment (both
source comment and the commit log).

[01/13] arm64: mm: Re-implement the __tlbi_level macro as a C function
        https://git.kernel.org/arm64/c/5b3fb8a6b429
[02/13] arm64: mm: Introduce a C wrapper for by-range TLB invalidation
        https://git.kernel.org/arm64/c/d2bf3226952c
[03/13] arm64: mm: Implicitly invalidate user ASID based on TLBI operation
        https://git.kernel.org/arm64/c/edc55b7abb25
[04/13] arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
        https://git.kernel.org/arm64/c/a3710035604f
[05/13] arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
        https://git.kernel.org/arm64/c/d4b048ca145f
[06/13] arm64: mm: Re-implement the __flush_tlb_range_op macro in C
        https://git.kernel.org/arm64/c/5e63b73f3deb
[07/13] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
        https://git.kernel.org/arm64/c/057bbd8e0610
[08/13] arm64: mm: Simplify __flush_tlb_range_limit_excess()
        https://git.kernel.org/arm64/c/c753d667d959
[09/13] arm64: mm: Refactor flush_tlb_page() to use __tlbi_level_asid()
        https://git.kernel.org/arm64/c/64212d689306
[10/13] arm64: mm: Refactor __flush_tlb_range() to take flags
        https://git.kernel.org/arm64/c/11f6dd8dd283
[11/13] arm64: mm: More flags for __flush_tlb_range()
        https://git.kernel.org/arm64/c/0477fc56960d
[12/13] arm64: mm: Wrap flush_tlb_page() around __do_flush_tlb_range()
        https://git.kernel.org/arm64/c/15397e3c3850
[13/13] arm64: mm: Provide level hint for flush_tlb_page()
        https://git.kernel.org/arm64/c/752a0d1d483e

-- 
Catalin

