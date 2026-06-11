Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E06CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcSPlA8NYAz0RMlfSwLuumch5wjn/0xJTm+wN8dYgFU=; b=ELKXx8i2qTjaLAqLuGNF/l87Vn
	TnUTyunUAKql0rpYYvvJ3O2piXxhvI52zLi+u6pr4DOZ+1CgqVDAxLLeyFtOdsJqfKiXpFHDosMae
	bfEzFRE9B4eq23xWhcQPvD7KrXkUOKZ8q24a8f+QZyG/lGw8VTfgEkfxwISrh0LKZraG9Ql+6Wfoo
	oEQ2AtrbC1wRHnQ+aR+IDZeZNts/Ml3Z99prTKdlvFwEBW7PVH+qV5wxoA+kdAkPZZPndN5DyEIs/
	+ZjE1A/Nz5LXhqkTYd8UVF4mke4ua6DfcwR46Pb1f/NvM102vs+RZORiohyC/5kZN2JCVIs4pr1u5
	LeKIJxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgkv-00000009cTV-1EgK;
	Thu, 11 Jun 2026 14:51:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgkn-00000009cKe-42EO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 14:51:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EFDC2661;
	Thu, 11 Jun 2026 07:51:27 -0700 (PDT)
Received: from [192.168.1.148] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1053FD88;
	Thu, 11 Jun 2026 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781189491; bh=A7fU4LmkiZqHlzam0PtixzHFSmv7SqvsxdhZrNJlTiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uYAF7xOscmn2ISAlk4HMx7PU3T2t6cyEa6MW5v4v6BLCAxal9zT14FF18YsmwEP/i
	 acyCo9+YYSAF+GEt6IkbPLOy/s5yXfqlG3+RikAQ+zY5tUzlkon7Mqjm4E+1JFHt+x
	 HC/88TKJSFTiC8KN8/HRnbnXZOnjL5JaMKX0o9dE=
Message-ID: <ef15fbdc-e48b-446c-9d5c-ff8d648d0f2c@arm.com>
Date: Thu, 11 Jun 2026 15:51:28 +0100
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
 <ahhoD3HbKMo_vP8K@arm.com> <470678cb-b8b0-4b09-bf32-97fb037ed849@arm.com>
 <aiqYlCpuq3TongP8@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aiqYlCpuq3TongP8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_075134_107702_ED20DD9B 
X-CRM114-Status: GOOD (  29.32  )
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

On 11/06/2026 12:14, Catalin Marinas wrote:
> On Fri, May 29, 2026 at 01:27:01PM +0100, Suzuki K Poulose wrote:
>> On 28/05/2026 17:06, Catalin Marinas wrote:
>>> On Tue, May 05, 2026 at 04:57:38PM +0100, Suzuki K Poulose wrote:
>>>> This is an updated series, addressing the review comments from AI agent on
>>>> the version 1 [0] of the series, (some of which were documented as short comings).
>>>> See below for the changes.
>>>>
>>>> The Realm Guest linux support is broken without rodata=full (fortunately default
>>>> for arm64), as we detect the RSI support after we have created the Linear map
>>>> with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
>>>> (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
>>>> we are then not able to split the page tables down to PTE level if the system
>>>> as such doesn't support BBML2.
>>>>
>>>> See the following link for the discussion.
>>>>
>>>> https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
>>>>
>>>> The available options are :
>>>>    1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
>>>>       to Block/Cont mappings after we have the full picture available. Looking at the
>>>>       future (with BBML3), this might mean "additional work" for most of the systems
>>>>       at boot. But not bad as splitting them ?
>>>>    2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
>>>>       by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
>>>>       with the page allocations required to add the page-tables.
>>>>    3. Move the detection of Realm support earlier to make a better decision for
>>>>       paging_init(), with an added bonus of earlycon support for Realms without
>>>>       the user having to work out the "top bit" for the Realm.
>>>>
>>>> This series is an attempt to implement (3) (without the earlycon support). We try
>>>> to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.
> [...]
>>> Could we instead add a more informative message in arm64_rsi_init() if
>>> !force_pte_mappings() && !cpu_supports_bbml2_noabort() (before
>>> is_realm_world() becomes true)? Well, it may not print anything if the
>>> early console is not set up yet.
>>
>> That is true, but with some expertise you may be able to enable earlycon
>> and may be we could get some new mechanism for "earlycon"  for Realms.
>>
>> The other way to look at is:
>>
>> When the system doesn't support BBML2 Abort:
>>
>> Creating block/Cont mappings to start with and then splitting it to PTE
>> is quite difficult as we :
>> 1. Need to allocate pages for leaf level tables
>> 2. Hold the other CPUs in tight loop
> 
> Agree, that's not easily possible at runtime.
> 
>> Instead, creating the block/CONT levels from a fully "page level"
>> mappings are easier, as we can:
>>
>> 1. Can easily fold the tables to Block mapping with reclaiming the leaf
>> level pagetables.
>>
>> 2. Avoid the secondary CPUs dance, as they all support BBML2_NOABORT.
>>
>> This shouldn't be that bad as the opposite ?
> 
> I don't think it solves our problem. Aren't we concerned with the
> rodata=off && !BBML2_NOABORT && is_realm_world() case? I don't think
> your second point stands.
> 
> Currently we have:
> 
> rodata=full && BBML2_NOABORT => block mappings irrespective of realms
> 
> rodata=off && BBML2_NOABORT  => block mappings first, can be split later
> 				if is_realm_world()
> 
> rodata=off && !BBML2_NOABORT => block mappings first, serious problem if
> 				is_realm_world()
> 
> It's the last case we need to fix. Starting with page mappings does
> avoid the in-realm failure but the !is_realm_world() case folding to
> block mappings still requires proper BBM.

I see, the case I was missing is : !is_realm_world() and !BBML2_NO_ABORT
and we want Block mapping if rodata=off. Yes, in this case we need the 
secondaries on hold, with proper BBM on the boot CPU too. Again, it is
easier to "collapsing the tables to Block" than the reverse.

Suzuki






> 


