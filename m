Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB13E9DE6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQvhiCtULeI5Kpyiu3qdjopaP2yiyCbzrbBNgDJg4p0=; b=tpp2M0ch0hFWxlR8VveSbphvcw
	rtsg5hCfe/k/Sbt+aDSc2H4dlZMAQ10Y88h/ebOQYm7z0gg0vGKkxcUB2ZL6c3UWlQ9VqpltIRz2h
	UfrfcFQlo8OlJouXFHE5WjW5r6Ixh4+Ywd5oa/Qngh1nakPlSB/dl+JF409hlJOEF3Wn4CSy4gJsr
	HC4NYooZKfP5+hdruaFQ2gqBOj0ReNautYNjxSW/RXkC3Fm0ZANtcmxPkxe7RVJinSRZsT4ws6J2D
	cjS3i3EXYCO7hY68f4zG1wIEPELNxC3dlLR7fa/TvFYS8rwOIsSzlUJVBptYX0vCy7e4qxakta14v
	0RBcMjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlq0-0000000A4CC-0C8c;
	Thu, 09 Apr 2026 09:38:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlpw-0000000A4Ba-3sBm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:38:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 141813561;
	Thu,  9 Apr 2026 02:38:01 -0700 (PDT)
Received: from [10.57.62.20] (unknown [10.57.62.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63D833F641;
	Thu,  9 Apr 2026 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775727486; bh=hgmnPKQeJdguRlzqCxqX311nWdNqYCRj8dOAtXBPPzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hC/IvXMS8TJYS+ZWAlgtGthk/NXbUKaJl/BHJKb0sN78HuIrXfz5kLE6MTDTAlHLH
	 6CfRBzNFwh+7vksFuaerj4PNEU7FXahuGZImTHrVJl7s8vasz3GOIFGZWLxVp5dE2h
	 ARuPsj61IbfCGD+1Z9HcmG2GwWR3rZfJp5W3Hiis=
Message-ID: <d1ecba64-898f-433b-93d4-7a33b9c3f378@arm.com>
Date: Thu, 9 Apr 2026 10:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Jinjiang Tu <tujinjiang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
 <1db93bd3-cb47-445b-b8ca-6de6f04b41cc@arm.com> <adU9KxLC7yKgmyJy@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <adU9KxLC7yKgmyJy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_023810_114472_33675527 
X-CRM114-Status: GOOD (  34.56  )
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

On 07/04/2026 18:21, Catalin Marinas wrote:
> On Tue, Apr 07, 2026 at 10:57:35AM +0100, Suzuki K Poulose wrote:
>> On 02/04/2026 21:43, Catalin Marinas wrote:
>>> On Mon, Mar 30, 2026 at 05:17:02PM +0100, Ryan Roberts wrote:
>>>>    int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>>>    {
>>>>    	int ret;
>>>> -	/*
>>>> -	 * !BBML2_NOABORT systems should not be trying to change permissions on
>>>> -	 * anything that is not pte-mapped in the first place. Just return early
>>>> -	 * and let the permission change code raise a warning if not already
>>>> -	 * pte-mapped.
>>>> -	 */
>>>> -	if (!system_supports_bbml2_noabort())
>>>> -		return 0;
>>>> -
>>>>    	/*
>>>>    	 * If the region is within a pte-mapped area, there is no need to try to
>>>>    	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>>>>    	 * change permissions from atomic context so for those cases (which are
>>>>    	 * always pte-mapped), we must not go any further because taking the
>>>> -	 * mutex below may sleep.
>>>> +	 * mutex below may sleep. Do not call force_pte_mapping() here because
>>>> +	 * it could return a confusing result if called from a secondary cpu
>>>> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
>>>> +	 * what we need.
>>>>    	 */
>>>> -	if (force_pte_mapping() || is_kfence_address((void *)start))
>>>> +	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
>>>>    		return 0;
>>>> +	if (!system_supports_bbml2_noabort()) {
>>>> +		/*
>>>> +		 * !BBML2_NOABORT systems should not be trying to change
>>>> +		 * permissions on anything that is not pte-mapped in the first
>>>> +		 * place. Just return early and let the permission change code
>>>> +		 * raise a warning if not already pte-mapped.
>>>> +		 */
>>>> +		if (system_capabilities_finalized())
>>>> +			return 0;
>>>> +
>>>> +		/*
>>>> +		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
>>>> +		 * page allocator. Can't split until it's available.
>>>> +		 */
>>>> +		if (WARN_ON(!page_alloc_available))
>>>> +			return -EBUSY;
>>>> +
>>>> +		/*
>>>> +		 * Boot-time: Started secondary cpus but don't know if they
>>>> +		 * support BBML2_NOABORT yet. Can't allow splitting in this
>>>> +		 * window in case they don't.
>>>> +		 */
>>>> +		if (WARN_ON(num_online_cpus() > 1))
>>>> +			return -EBUSY;
>>>> +	}
>>>
>>> I think sashiko is over cautions here
>>> (https://sashiko.dev/#/patchset/20260330161705.3349825-1-ryan.roberts@arm.com)
>>> but it has a somewhat valid point from the perspective of
>>> num_online_cpus() semantics. We have have num_online_cpus() == 1 while
>>> having a secondary CPU just booted and with its MMU enabled. I don't
>>> think we can have any asynchronous tasks running at that point to
>>> trigger a spit though. Even async_init() is called after smp_init().
>>>
>>> An option may be to attempt cpus_read_trylock() as this lock is taken by
>>> _cpu_up(). If it fails, return -EBUSY, otherwise check num_online_cpus()
>>> and unlock (and return -EBUSY if secondaries already started).
>>>
>>> Another thing I couldn't get my head around - IIUC is_realm_world()
>>> won't return true for map_mem() yet (if in a realm).
>>
>> That is correct. map_mem() comes from paginig_init(), which gets called
>> before arm64_rsi_init(). Realm check was delayed until psci_xx_init().
>> We had a version which parsed the DT for PSCI conduit early enough
>> to be able to make the SMC calls to detect the Realm. But there
>> were concerns around it.
> 
> Ah, yes, I remember.
> 
> Does it mean that commit 42be24a4178f ("arm64: Enable memory encrypt for
> Realms") was broken without rodata=full w.r.t. the linear map? Commit

Apparently, it looks like we missed this when we demoted the RSI
detection later.

> a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> introduced force_pte_mapping() but it just copied the logic in the
> existing can_set_direct_map(). Looking at the linear_map_requires_bbml2
> assignment, we get (!is_realm_world() && is_realm_world()) and it
> cancels out, no effect on it but we don't get pte mappings either (even
> if we don't have BBML2).

Yep, that's right.
> 
> I think we need at least some safety checks:
> 
> 1. BBML2_NOABORT support on the boot CPU - continue with the existing
>     logic (as per Ryan's series)
> 
> 2. !system_supports_bbml2_noabort() - split in
>     linear_map_maybe_split_to_ptes(). This does not currently happen
>     because linear_map_requires_bbml2 may be false in the absence of
>     rodata=full. Not sure how to fix this without some variable telling
>     us how the linear map was mapped. The requires_bbml2 flag doesn't
> 
> 3. Panic in arm64_rsi_init() if !BBML2_NOABORT on the boot CPU _and_ we
>     have block mappings already. People can avoid it with rodata=full

It looks like this will be a common case :-(

> 
> 4. If (3) is a common case, a better alternative is to rewrite the
>     linear map sometime after arm64_rsi_init() but before we call
>     split_kernel_leaf_mapping().

We will explore this route.

The other option is to move the RSI detection (and the PSCI probe)
earlier to be able to make better decisions early on. I will play with
that a bit too.

Suzuki


> 


