Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F2EC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEi01wzquUeKsOuWlPz3FmEnLyYydz3TpWTcUcjiPCA=; b=1kJhC4obm1g8BPAF+evg2RVLG/
	t66u9/7U7G+/eTWHlvXY6OUH8coLyx0k1XgFSGPL8ZXXMoPotnALZFygiqUAIKbaS5Czk1i9GYvKT
	OSgGxzki04VVzM4QG2rLDYDNiSUvUiGzoqv9AIeS8+JfxsvEiM6oxR9FOLc96hDzaElPEjYfZV5Ks
	4v1ZKuqVPe8+o/01MCrudnxjPtw9u1KlYAElaOdGoeobNTdL4wGEHiq9N7Yx0WCTx1s6BFpWw3jhy
	ZoUL/n3iCecwUqhNqZajR1mrdRQ9ICwchFe8FssASP7cf3dD/294kG4z2CrHTdBqSOeI6tx3y60V9
	qSVpePbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTN0-0000000Am8t-1uQU;
	Fri, 07 Feb 2025 18:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRqB-0000000AQkH-2USd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:08:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 005A7113E;
	Fri,  7 Feb 2025 09:08:53 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCF433F63F;
	Fri,  7 Feb 2025 09:08:25 -0800 (PST)
Message-ID: <fb817590-19c4-4242-8942-14c9fa275f0c@arm.com>
Date: Fri, 7 Feb 2025 17:08:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/43] arm64: rme: Prevent Device mappings for Realms
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-31-steven.price@arm.com>
 <f339729a-00a8-40b5-af05-f0f019579e5e@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <f339729a-00a8-40b5-af05-f0f019579e5e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090831_722452_9F57845D 
X-CRM114-Status: GOOD (  19.76  )
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

On 02/02/2025 07:12, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> Physical device assignment is not yet supported by the RMM, so it
>> doesn't make much sense to allow device mappings within the realm.
>> Prevent them when the guest is a realm.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v5:
>>   * Also prevent accesses in user_mem_abort()
>> ---
>>   arch/arm64/kvm/mmu.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 9ede143ccef1..cef7c3dcbf99 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1149,6 +1149,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm,
>> phys_addr_t guest_ipa,
>>       if (is_protected_kvm_enabled())
>>           return -EPERM;
>>   +    /* We don't support mapping special pages into a Realm */
>> +    if (kvm_is_realm(kvm))
>> +        return -EINVAL;
>> +
> 
>         return -EPERM;
> 
>>       size += offset_in_page(guest_ipa);
>>       guest_ipa &= PAGE_MASK;
>>   @@ -1725,6 +1729,14 @@ static int user_mem_abort(struct kvm_vcpu
>> *vcpu, phys_addr_t fault_ipa,
>>       if (exec_fault && device)
>>           return -ENOEXEC;
>>   +    /*
>> +     * Don't allow device accesses to protected memory as we don't (yet)
>> +     * support protected devices.
>> +     */
>> +    if (device && kvm_is_realm(kvm) &&
>> +        kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
>> +        return -EINVAL;
>> +
> 
> s/kvm_is_realm/vcpu_is_rec
> 
> I don't understand the check very well. What I understood is mem_abort()
> is called
> only when kvm_gpa_from_fault(kvm, fault_ipa) != fault_ipa, meaning only
> the page
> faults in the shared address space is handled by mem_abort(). So I guess
> we perhaps
> need something like below.

private_memslot_fault() is only when the memslot is a private
guest_memfd(). So there's also the situation of a 'normal' memslot which
can still end up in user_mem_abort().

As things currently stand we can't really deal with this (the bottom
part of the IPA is protected, and therefore must come from
guest_memfd()). But in the future we are expecting to be able to support
protected devices.

So I think really the correct solution for now is to drop the "device"
check and update the comment to reflect the fact that
private_memslot_fault() should be handling all protected address until
we get support for assigning devices.

Thanks,
Steve

>     if (vcpu_is_rec(vcpu) && device)
>         return -EPERM;
> 
> kvm_handle_guest_abort
>   kvm_slot_can_be_private
>     private_memslot_fault    // page fault in the private space is
> handled here
>   io_mem_abort            // MMIO emulation is handled here
>   user_mem_abort                // page fault in the shared space is
> handled here
> 
>>       /*
>>        * Potentially reduce shadow S2 permissions to match the guest's
>> own
>>        * S2. For exec faults, we'd only reach this point if the guest
> 
> Thanks,
> Gavin
> 


