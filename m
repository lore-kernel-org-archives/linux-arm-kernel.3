Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FCACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00b5Af4DZyjSyonUtZMHwBhvkcHrX7yeGsqleFt03iY=; b=rRiSCBAypMjXTlg0Hh2GHw/RtV
	7RIbHXb3/n8Tt2pc1Btr5Jd6VcIukr71dkrtJLO93l+vpkJv2ZM/213Mj2rvkOnHdNaLvrpw9mkQq
	4soDs/t8gd53uroVbOtVAOPmPAOLygxJFmnYkdH6mFkzDJxVJ26sADoLzMSaLww6kTglLIGsrDP7U
	sDBbHsot/Z1KAOjBx1Wsl+WuQh5NYLSKs51tWFxuAK7ZxbRSfXHUTZxguoZqg84v7n4Cx315mls8c
	wpVutoGVoUOjopGvqiNmGkvzk+RdLXP6/KgwS3Ou3Wt/Y5BJawXusqSr2pkH3uGK9a2Kjb20f8keW
	gmaqA8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwJ3-00000007Nc6-0GgX;
	Fri, 29 May 2026 12:27:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwJ0-00000007NbV-3I0N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:27:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CF97204C;
	Fri, 29 May 2026 05:27:08 -0700 (PDT)
Received: from [10.57.24.26] (unknown [10.57.24.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C5EF3F632;
	Fri, 29 May 2026 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780057633; bh=BiG2vC2KMDGUwoHzfebs29I/Qh1fkHPj9wHNQBi85H0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPg3jTx77VA+epSAL/NzMWxEFwt3RUeScKe2ghqKEvm2Ruke4B+SmB9qTakiVZhxf
	 hzTDwlk1kBeGOIJTVO0dvm7dgjDuSRvqwhsrgWd95FgFIPPIyoPxpH2hhBvy7Qsa0S
	 4UYMQ3uBgru7eEvQLdreSRf0gA8sJGsFecYi2cXo=
Message-ID: <470678cb-b8b0-4b09-bf32-97fb037ed849@arm.com>
Date: Fri, 29 May 2026 13:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/4] arm64: realm: Support for probing RSI earlier
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org, ardb@kernel.org, lpieralisi@kernel.org,
 mark.rutland@arm.com, steven.price@arm.com, aneesh.kumar@kernel.org,
 sudeep.holla@arm.com, robh@kernel.org, maz@kernel.org
References: <20260505155742.623287-1-suzuki.poulose@arm.com>
 <ahhoD3HbKMo_vP8K@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ahhoD3HbKMo_vP8K@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_052714_919631_4D16DC3F 
X-CRM114-Status: GOOD (  28.37  )
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

On 28/05/2026 17:06, Catalin Marinas wrote:
> Hi Suzuki,
> 
> On Tue, May 05, 2026 at 04:57:38PM +0100, Suzuki K Poulose wrote:
>> This is an updated series, addressing the review comments from AI agent on
>> the version 1 [0] of the series, (some of which were documented as short comings).
>> See below for the changes.
>>
>> The Realm Guest linux support is broken without rodata=full (fortunately default
>> for arm64), as we detect the RSI support after we have created the Linear map
>> with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
>> (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
>> we are then not able to split the page tables down to PTE level if the system
>> as such doesn't support BBML2.
>>
>> See the following link for the discussion.
>>
>> https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
>>
>> The available options are :
>>   1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
>>      to Block/Cont mappings after we have the full picture available. Looking at the
>>      future (with BBML3), this might mean "additional work" for most of the systems
>>      at boot. But not bad as splitting them ?
>>   2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
>>      by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
>>      with the page allocations required to add the page-tables.
>>   3. Move the detection of Realm support earlier to make a better decision for
>>      paging_init(), with an added bonus of earlycon support for Realms without
>>      the user having to work out the "top bit" for the Realm.
>>
>> This series is an attempt to implement (3) (without the earlycon support). We try
>> to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.
> 
> Looking at the patches, I'm no longer sure it's worth justifying the
> complexity. 

Yep, it is not simple with ACPI.

> Trying to recall the previous thread - does it only matter
> if BBML2_NOABORT is not supported and the kernel boots with rodata=off?

Correct.

> I guess we can ignore big.LITTLE configurations for now since the
> deployment of CCA doesn't target mobile yet.

True.

> 
> Could we instead add a more informative message in arm64_rsi_init() if
> !force_pte_mappings() && !cpu_supports_bbml2_noabort() (before
> is_realm_world() becomes true)? Well, it may not print anything if the
> early console is not set up yet.

That is true, but with some expertise you may be able to enable earlycon
and may be we could get some new mechanism for "earlycon"  for Realms.

The other way to look at is:

When the system doesn't support BBML2 Abort:

Creating block/Cont mappings to start with and then splitting it to PTE
is quite difficult as we :
1. Need to allocate pages for leaf level tables
2. Hold the other CPUs in tight loop

Instead, creating the block/CONT levels from a fully "page level"
mappings are easier, as we can:

1. Can easily fold the tables to Block mapping with reclaiming the leaf 
level pagetables.

2. Avoid the secondary CPUs dance, as they all support BBML2_NOABORT.

This shouldn't be that bad as the opposite ?

I understand there are concerns on the boot time. May be we could add
a kernel command line to force block mappings and slowly deprecate it ?

Suzuki

> 


