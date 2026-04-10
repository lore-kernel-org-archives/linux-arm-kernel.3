Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E70F459EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzgi/0gdnE8bsg2R3HhTGobwLLNQfAz8Eho6HauV/3I=; b=dPFkswOD+Bknl7rlQ2Bmd8E2YZ
	aCY3yT+pc8kQzYn13A0wUoFyMhgpDxhqiTQgj4l1XJXiTkTDvFKuFuBbFl0oOR7UFbjB7AT7eJ0bo
	f3+aAsT23Uj8u4WhH4gW0D3N0ocV/M9KxeznOj35GM3wfuBfYnC0QI92il/Mc2o6BTTjLpAUluOl2
	y8q9ylJeYqflSKcX6da/1mbz3/phKrGcdEaHG4Abt6PK8y0T5xdlgedR3vIqcs/RiVgQ3cVfK3gIt
	muxs5PrptkMKA78AXGTHhN9i8CTy79IwtIyjfe3j3L2Jr72Jj9tcqUkS7FZrETgkt68aq0YvZhJsG
	JArwpyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDX7-0000000CQWl-21nO;
	Fri, 10 Apr 2026 15:12:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDX4-0000000CQUq-1Xho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74A191CE2;
	Fri, 10 Apr 2026 08:12:23 -0700 (PDT)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2AF33FAA1;
	Fri, 10 Apr 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775833949; bh=MHY1zIuJTnMcvfLgjeNfhsvhJAzG+2Wf6PamZxvC1Z4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KbYyqzXWMyZfA146oUepWmaULNpw1iRK3IFrwgwK/Pt9Q7Vg6r2pVVPexEvHtPggd
	 RrDq6AKUkx1X/M74yv/SwXGgEPPa2VsiIHzOU5USCOpbBpuv09GQeQGeUCnxmLdCP1
	 oJhB9X5X0eqNF+iBUC7Bx1yBmu4qXcN3zkOaAudE=
Message-ID: <22f3b6f0-cde1-4aa3-83b7-8477d74e7a3c@arm.com>
Date: Fri, 10 Apr 2026 16:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 37/48] arm64: RMI: Prevent Device mappings for Realms
To: Joey Gouly <joey.gouly@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-38-steven.price@arm.com>
 <20260319102734.GC3942350@e124191.cambridge.arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260319102734.GC3942350@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_081230_533727_2452E94F 
X-CRM114-Status: GOOD (  19.02  )
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

On 19/03/2026 10:27, Joey Gouly wrote:
> On Wed, Mar 18, 2026 at 03:54:01PM +0000, Steven Price wrote:
>> Physical device assignment is not supported by RMM v1.0, so it
> 
> But we're targetting 2.0 now!

Whoops ;) In my head it's still "in the future" but I guess the "future" 
is now!

I'll update this to say:

    Physical device assignment is not yet supported. RMM v2.0 does add the
    relevant APIs, but device assignment is a big topic so will be handled
    in a future patch series. For now prevent device mappings when the guest
    is a realm.

Thanks,
Steve

> I guess just change it to something about device support being a later feature.
> 
> Thanks,
> Joey
> 
>> doesn't make much sense to allow device mappings within the realm.
>> Prevent them when the guest is a realm.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v6:
>>  * Fix the check in user_mem_abort() to prevent all pages that are not
>>    guest_memfd() from being mapped into the protected half of the IPA.
>> Changes from v5:
>>  * Also prevent accesses in user_mem_abort()
>> ---
>>  arch/arm64/kvm/mmu.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index ad1300f366df..7d7caab8f573 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1222,6 +1222,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>>  	if (is_protected_kvm_enabled())
>>  		return -EPERM;
>>  
>> +	/* We don't support mapping special pages into a Realm */
>> +	if (kvm_is_realm(kvm))
>> +		return -EPERM;
>> +
>>  	size += offset_in_page(guest_ipa);
>>  	guest_ipa &= PAGE_MASK;
>>  
>> @@ -1965,6 +1969,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  		return 1;
>>  	}
>>  
>> +	/*
>> +	 * For now we shouldn't be hitting protected addresses because they are
>> +	 * handled in private_memslot_fault(). In the future this check may be
>> +	 * relaxed to support e.g. protected devices.
>> +	 */
>> +	if (vcpu_is_rec(vcpu) &&
>> +	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
>> +		return -EINVAL;
>> +
>>  	if (nested)
>>  		adjust_nested_fault_perms(nested, &prot, &writable);
>>  
>> -- 
>> 2.43.0
>>
>>


