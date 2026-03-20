Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A93410987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8A7MUMDqVZFCZLVYofCcTwqFcIFMNv4PRgO1ZgYUf8=; b=wPmKoj1ilN+MdqR2ZdTySiPm2m
	+UDqBMihFOiL0QcZzpJ2lbBE5xqnB/3ah10BDIQwUufi1nGP9J+GEg5og1gQv3DJ+RgMBCXz9I+Z7
	biFHIbDQECynuwFJLAufMADJorrxHRlk1G2yZymxGm4WNq9PlXgjsJlDNyzS82Yia+GLQ8ipuoHrN
	gss7QzsLLw/cT35pnz0BskBhQbrB0nUwxsiSkruht3xK5hfO0iwDXP4Nf3J6K70HAPvrqVHKaOYEE
	4abQ4FaeL12ouBl2mkYF24ApNPlZzjrd+UsINvwPhv9qU1jwMZN029USY7/l4fZm6zMkFzOsrMhRK
	b+XXvosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cyM-0000000DAnj-2p1s;
	Fri, 20 Mar 2026 16:45:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cyI-0000000DAma-1Zb8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:45:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 501C71682;
	Fri, 20 Mar 2026 09:45:06 -0700 (PDT)
Received: from [10.1.29.20] (unknown [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D5063F7BD;
	Fri, 20 Mar 2026 09:45:07 -0700 (PDT)
Message-ID: <a0584809-31b0-4055-a73f-cddd9760cb9b@arm.com>
Date: Fri, 20 Mar 2026 16:45:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 37/48] arm64: RMI: Prevent Device mappings for Realms
To: Wei-Lin Chang <weilin.chang@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-38-steven.price@arm.com>
 <t3ge5bfjteubidjhcupkvzi4zdvepv2mtp7tan4mma6xd4jgnb@a6kjjbmt4aqk>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <t3ge5bfjteubidjhcupkvzi4zdvepv2mtp7tan4mma6xd4jgnb@a6kjjbmt4aqk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094515_978954_0E225498 
X-CRM114-Status: GOOD (  19.46  )
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

On 19/03/2026 18:46, Wei-Lin Chang wrote:
> On Wed, Mar 18, 2026 at 03:54:01PM +0000, Steven Price wrote:
>> Physical device assignment is not supported by RMM v1.0, so it
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
> 
> Hi,
> 
> What is private_memslot_fault()? I don't see it anywhere in the series &
> upstream.

Oh dear, that comment is out of date ;) It's now become gmem_abort()...

>> +	 * relaxed to support e.g. protected devices.
>> +	 */
>> +	if (vcpu_is_rec(vcpu) &&
>> +	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
>> +		return -EINVAL;
>> +
> 
> Additionally, there is a hunk almost identical to this one here in added
> in patch 27.

Which is what this chunk says. It appears I screwed up a rebase at some
point! This whole patch can really be dropped and the
kvm_phys_addr_ioremap() change moved into another patch.

Thanks,
Steve

> Thanks,
> Wei-Lin Chang
> 
>>  	if (nested)
>>  		adjust_nested_fault_perms(nested, &prot, &writable);
>>  
>> -- 
>> 2.43.0
>>


