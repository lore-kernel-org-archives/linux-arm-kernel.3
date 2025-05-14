Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFDBC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Efv2+D3fngzLhVRyNKVL2x7Q6UIjL8RLlym8T6LHZaE=; b=wF++6V/LgpgBZ6Vie/ANhQsxCC
	ujlXiJPoOlvnlPSUmvOwOiMm+0RSdW/fGk6Fksc3CTw/8Iqgl3U/C3q0AEYWdOoP4TfUn54GAXV6C
	AVYKRgGKfXKUbTzNdH0SiI4s8eJB0eAuxqUR69ZrJvoGbguQpBVYnFtTzV4bzGE7QBdzNTikuAVCO
	nBNOLgyOPUEsS6tlMiIBspWQY9N/GnBRCbddqTg/WCdUfwOm2ZO15lOl4ioo56BLkHEcEtahRdw9b
	nLyEEO8HE4HVvIP9mXOq75utSUrA+kOlBCKQujhm6dTneZY/vGKnEkMhl2u+2gvUP/8+uFV3fDdxF
	EtYMz9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5o-0000000F3d7-1qLO;
	Wed, 14 May 2025 12:20:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9Hf-0000000EmJq-3F0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:24:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6673E14BF;
	Wed, 14 May 2025 03:24:05 -0700 (PDT)
Received: from [10.57.24.82] (unknown [10.57.24.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A00C53F673;
	Wed, 14 May 2025 03:24:12 -0700 (PDT)
Message-ID: <36c46f16-85c2-43f8-b460-942f34631e0d@arm.com>
Date: Wed, 14 May 2025 11:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/43] arm64: RME: Allow VMM to set RIPAS
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-16-steven.price@arm.com>
 <83071e55-cbe4-4786-b60e-d26ce16368b3@arm.com>
 <f4ee678d-112d-46d1-8b87-70e55d6617e1@arm.com>
 <d0cbb637-6ba1-4858-b326-31271e9949ea@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <d0cbb637-6ba1-4858-b326-31271e9949ea@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_032419_912306_41FCB62B 
X-CRM114-Status: GOOD (  32.71  )
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

On 13/05/2025 11:43, Suzuki K Poulose wrote:
> On 12/05/2025 15:45, Steven Price wrote:
>> On 06/05/2025 14:23, Suzuki K Poulose wrote:
>>> Hi Steven
>>>
>>> On 16/04/2025 14:41, Steven Price wrote:

[...]

> 
>>
>>>> +    }
>>>> +
>>>> +    realm_fold_rtt_level(realm, get_start_level(realm) + 1,
>>>> +                 start, end);
>>>
>>> We don't seem to be reclaiing the RTTs from shared mapping case ?
>>
>> I'm not sure I follow: realm_fold_rtt_level() will free any RTTs that
>> are released.
>>
>> Or are you referring to the fact that we don't (yet) fold the shared
>> range? I have been purposefully leaving that for now as normally we'd
> 
> sorry it was a bit vague. We don't seem to be reclaiming the RTTs in
> realm_unmap_shared_range(), like we do for the private range.

Ah, you mean we potentially leave empty RTTs which are only reclaimed
when destroying the realm. Whereas in the private range we
opportunistically fold which will (usually) cause these to be freed.

>> follow the page size in the VMM to choose the page size on the guest,
>> but that doesn't work when the RMM might have a different page size to
>> the host. So my reasons for leaving it for later are:
>>
>>   * First huge pages is very much a TODO in general.
>>
>>   * When we support >4K host pages then a huge page on the host may not
>>     be available in the RMM, so we can't just follow the VMM.
>>
>>   * We don't have support in realm_unmap_shared_range() to split a block
>>     mapping up - it could be added, but it's not clear to me if it's best
>>     to split a block mapping, or remove the whole and refault as
>>     required.
>>
>>   * guest_memfd might well be able to provide some good hints here, but
>>     we'll have to wait for that series to settle.
> 
> I am not sure I follow. None of this affects folding, once we have
> "unmapped". For that matter, we could easily DESTROY the RTTs in
> shared side without unmapping, but we can do that later as an
> optimisation.

Yeah, ignore the above - like you say it's not relevant to unmapping, I
hadn't understood your point ;)

I'll stick a call to realm_fold_rtt_level() at the end of
realm_unmap_shared_range() which should opportunistically free unused
RTTs. Like you say there's a optimisation to just straight to destroying
the RTTs in the shared region - but I think that's best left until later.

>>
>>>> +}
>>>> +
>>>> +void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
>>>> +               unsigned long size, bool unmap_private)
>>>> +{
>>>> +    unsigned long end = start + size;
>>>> +    struct realm *realm = &kvm->arch.realm;
>>>> +
>>>> +    end = min(BIT(realm->ia_bits - 1), end);
>>>> +
>>>> +    if (realm->state == REALM_STATE_NONE)
>>>> +        return;
>>>> +
>>>> +    realm_unmap_shared_range(kvm, find_map_level(realm, start, end),
>>>> +                 start, end);
>>>> +    if (unmap_private)
>>>> +        realm_unmap_private_range(kvm, start, end);
>>>> +}
>>>> +
>>>> +static int realm_init_ipa_state(struct realm *realm,
>>>> +                unsigned long ipa,
>>>> +                unsigned long end)
>>>> +{
>>>> +    phys_addr_t rd_phys = virt_to_phys(realm->rd);
>>>> +    int ret;
>>>> +
>>>> +    while (ipa < end) {
>>>> +        unsigned long next;
>>>> +
>>>> +        ret = rmi_rtt_init_ripas(rd_phys, ipa, end, &next);
>>>> +
>>>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>>> +            int err_level = RMI_RETURN_INDEX(ret);
>>>> +            int level = find_map_level(realm, ipa, end);
>>>> +
>>>> +            if (WARN_ON(err_level >= level))
>>>
>>> I am wondering if WARN_ON() is required here. A buggy VMM could trigger
>>> the WARN_ON(). (e.g, INIT_IPA after POPULATE, where L3 table is
>>> created.). The only case where it may be worth WARNING is if the level
>>> == 3.
>>
>> I have to admit I've struggled to get my head round this ;)
>>
>> init_ripas will fail with ERROR_RTT in three cases:
>>
>>   1. (base_align) The base address isn't aligned for the level reached.
>>
>>   2. (rtt_state) The rtte state is !UNASSIGNED.
>>
>>   3. (no_progress) base==walk_top - the while condition should prevent
>>      this.
>>
>> So I think case 1 is the case we're expecting, and creating RTTs should
>> resolve it.
>>
>> Case 2 is presumably the case you are concerned about, although it's not
>> because tables have been created, but because INIT_RIPAS is invalid on
>> areas that have been populated already.
> 
> Correct, this is the case I was referring to.
> 
>>
>> If my reading of the spec is correct, then level == 3 isn't a possible
>> result, so beyond potentially finding RMM bugs I don't think a WARN for
> 
> It is almost certainly possible, with L3 page mapping created for
> POPULATE and a follow up INIT_RIPAS with 2M or even 1G alignment, could
> lead us to expect that only L1 or L2 is required (find_map_level) but
> the RTT walk reached L3 and failed. This is not a case of RMM bug, but
> a VMM not following the rules.

Sorry, I wasn't clear. I mean "level == 3" isn't something that we
should be WARNing on.

>> that is very interesting. So for now I'll just drop the WARN_ON here
>> altogether.
> 
> Thanks, that is much safer

Ack.

Thanks,
Steve

> Suzuki
> 


