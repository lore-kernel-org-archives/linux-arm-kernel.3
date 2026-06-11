Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4AECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73HCQzBDvqqnWgZya1hqAaSIcsbsxhvTlwaeNFLjp9o=; b=OHXMR+/jKDoIEDpL5vyqqlkU4F
	shUwL27VjSllTHX1Iq6EFxqGRTGq+8IrROCtR1MBcUdL7PpqPrhgKJOZ33/zTofywSj0snEmXks1U
	bfRFMzHE3Dhn+kHSTwNyl+xW4SnvQkHo4iWQybOgMvgtUl4IDlaKLlm86/HyqAZcCSazWYngY+NDU
	qROayjsrVlVEqz7iFfP0EJ1hS3vkZ/RFbefCsoN19XevuxsCcapFeF3OQjfrB6z957DdTL9HQcIqR
	pc1JN+1/0xxG1nsAf3agWDomAdnYA2wZ5oasJGTgPDmBinCDJ22jDNxDno3zKtUxVDhyosLsJLu/t
	6rolfEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdMw-00000009I9V-1VtF;
	Thu, 11 Jun 2026 11:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdMu-00000009I93-05dA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:14:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1480B1E2F;
	Thu, 11 Jun 2026 04:14:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57C703F99C;
	Thu, 11 Jun 2026 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781176476; bh=jqEfeaKy1cws55DOS6rs5gSZGwNp6LsQg+WD+PXBkJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQeQ+fOfyqgZQB8FuaD041IjUolkuGWu3iBJY2dW8RjzzTTQYETBuku+5y6qBaCe4
	 S5zJtY3owR7uMiZOyQS/A0wTKqNvRDNbBIln9itzMah2vhtdwfdXmCWhIQTaZAmf7l
	 0fByKbyr+wSnvjWxWSLys/p9EqCD4HlCM7YPwUnA=
Date: Thu, 11 Jun 2026 12:14:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, ardb@kernel.org, lpieralisi@kernel.org,
	mark.rutland@arm.com, steven.price@arm.com, aneesh.kumar@kernel.org,
	sudeep.holla@arm.com, robh@kernel.org, maz@kernel.org
Subject: Re: [RFC PATCH v2 0/4] arm64: realm: Support for probing RSI earlier
Message-ID: <aiqYlCpuq3TongP8@arm.com>
References: <20260505155742.623287-1-suzuki.poulose@arm.com>
 <ahhoD3HbKMo_vP8K@arm.com>
 <470678cb-b8b0-4b09-bf32-97fb037ed849@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <470678cb-b8b0-4b09-bf32-97fb037ed849@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_041440_239373_ECC0DF3F 
X-CRM114-Status: GOOD (  34.90  )
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

On Fri, May 29, 2026 at 01:27:01PM +0100, Suzuki K Poulose wrote:
> On 28/05/2026 17:06, Catalin Marinas wrote:
> > On Tue, May 05, 2026 at 04:57:38PM +0100, Suzuki K Poulose wrote:
> > > This is an updated series, addressing the review comments from AI agent on
> > > the version 1 [0] of the series, (some of which were documented as short comings).
> > > See below for the changes.
> > > 
> > > The Realm Guest linux support is broken without rodata=full (fortunately default
> > > for arm64), as we detect the RSI support after we have created the Linear map
> > > with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
> > > (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
> > > we are then not able to split the page tables down to PTE level if the system
> > > as such doesn't support BBML2.
> > > 
> > > See the following link for the discussion.
> > > 
> > > https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
> > > 
> > > The available options are :
> > >   1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
> > >      to Block/Cont mappings after we have the full picture available. Looking at the
> > >      future (with BBML3), this might mean "additional work" for most of the systems
> > >      at boot. But not bad as splitting them ?
> > >   2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
> > >      by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
> > >      with the page allocations required to add the page-tables.
> > >   3. Move the detection of Realm support earlier to make a better decision for
> > >      paging_init(), with an added bonus of earlycon support for Realms without
> > >      the user having to work out the "top bit" for the Realm.
> > > 
> > > This series is an attempt to implement (3) (without the earlycon support). We try
> > > to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.
[...]
> > Could we instead add a more informative message in arm64_rsi_init() if
> > !force_pte_mappings() && !cpu_supports_bbml2_noabort() (before
> > is_realm_world() becomes true)? Well, it may not print anything if the
> > early console is not set up yet.
> 
> That is true, but with some expertise you may be able to enable earlycon
> and may be we could get some new mechanism for "earlycon"  for Realms.
> 
> The other way to look at is:
> 
> When the system doesn't support BBML2 Abort:
> 
> Creating block/Cont mappings to start with and then splitting it to PTE
> is quite difficult as we :
> 1. Need to allocate pages for leaf level tables
> 2. Hold the other CPUs in tight loop

Agree, that's not easily possible at runtime.

> Instead, creating the block/CONT levels from a fully "page level"
> mappings are easier, as we can:
> 
> 1. Can easily fold the tables to Block mapping with reclaiming the leaf
> level pagetables.
> 
> 2. Avoid the secondary CPUs dance, as they all support BBML2_NOABORT.
> 
> This shouldn't be that bad as the opposite ?

I don't think it solves our problem. Aren't we concerned with the
rodata=off && !BBML2_NOABORT && is_realm_world() case? I don't think
your second point stands.

Currently we have:

rodata=full && BBML2_NOABORT => block mappings irrespective of realms

rodata=off && BBML2_NOABORT  => block mappings first, can be split later
				if is_realm_world()

rodata=off && !BBML2_NOABORT => block mappings first, serious problem if
				is_realm_world()

It's the last case we need to fix. Starting with page mappings does
avoid the in-realm failure but the !is_realm_world() case folding to
block mappings still requires proper BBM.

-- 
Catalin

