Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D429ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuDPZaYYAfopdeD0t98yIj/d5daq3JxT45C7zZszKMM=; b=ebZdIY4Q1Y0Dz2BoJq2tW5RgUK
	CFqukvuzcQy68S860DatwvTHQ2M2csVRPYbSEDL0BH42ZLjsNyTxw76miDOGhA70S1fbfbe6O+Yf6
	EUUbN6CN8+sknWMg1jFcZBMpskbZV7lqEUNQJDr3a9mzB+3PtMjyt6xkejdSNq8jM4bJjbyyijZtI
	F2/lo02hi4kEtzRFqjmf1r9HYzpBx+jFHgbSYnyI31E4W8CixMtCj1wxanF2bwSZYruwQ6Yy6ntNt
	VU1NZCknc4lmzGrud+6iobr3Ghr/gyonLVXCLwW77R5a2ywILi5REb/eBzatsY4ZNFCFUZQk0c4Bl
	17wmEhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdFw-00000005y1R-3WVg;
	Thu, 28 May 2026 16:06:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdFu-00000005y0k-3QWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:06:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C6C22BE;
	Thu, 28 May 2026 09:06:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB903F905;
	Thu, 28 May 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779984403; bh=NX8pGsjXpWIOj8RHTxeL1h/KeK5pNVRCwcxkfpVvbuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8V5UgnIN094t19F9kgtm9FSUpQWps81SskOL2BCBHytyJPJY0gkIWS5Ygv+EusIE
	 anNP5uvIUxtNdq7qM7avQR/sThshe7UXh0NeCahwa3eXnqrKXOav9PobLCVTCWqQCW
	 G8zTOKw1j+oE7GfOjMxIF18U9YSAn1TtYh3gNrB4=
Date: Thu, 28 May 2026 17:06:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, ardb@kernel.org, lpieralisi@kernel.org,
	mark.rutland@arm.com, steven.price@arm.com, aneesh.kumar@kernel.org,
	sudeep.holla@arm.com, robh@kernel.org, maz@kernel.org
Subject: Re: [RFC PATCH v2 0/4] arm64: realm: Support for probing RSI earlier
Message-ID: <ahhoD3HbKMo_vP8K@arm.com>
References: <20260505155742.623287-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505155742.623287-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090646_928706_17CDD37A 
X-CRM114-Status: GOOD (  24.93  )
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

Hi Suzuki,

On Tue, May 05, 2026 at 04:57:38PM +0100, Suzuki K Poulose wrote:
> This is an updated series, addressing the review comments from AI agent on
> the version 1 [0] of the series, (some of which were documented as short comings).
> See below for the changes.
> 
> The Realm Guest linux support is broken without rodata=full (fortunately default
> for arm64), as we detect the RSI support after we have created the Linear map
> with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
> (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
> we are then not able to split the page tables down to PTE level if the system
> as such doesn't support BBML2.
> 
> See the following link for the discussion.
> 
> https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
> 
> The available options are :
>  1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
>     to Block/Cont mappings after we have the full picture available. Looking at the
>     future (with BBML3), this might mean "additional work" for most of the systems
>     at boot. But not bad as splitting them ?
>  2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
>     by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
>     with the page allocations required to add the page-tables.
>  3. Move the detection of Realm support earlier to make a better decision for
>     paging_init(), with an added bonus of earlycon support for Realms without
>     the user having to work out the "top bit" for the Realm.
> 
> This series is an attempt to implement (3) (without the earlycon support). We try
> to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.

Looking at the patches, I'm no longer sure it's worth justifying the
complexity. Trying to recall the previous thread - does it only matter
if BBML2_NOABORT is not supported and the kernel boots with rodata=off?
I guess we can ignore big.LITTLE configurations for now since the
deployment of CCA doesn't target mobile yet.

Could we instead add a more informative message in arm64_rsi_init() if
!force_pte_mappings() && !cpu_supports_bbml2_noabort() (before
is_realm_world() becomes true)? Well, it may not print anything if the
early console is not set up yet.

-- 
Catalin

