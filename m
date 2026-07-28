Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1651C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM9KvTvYNxgKTJQYOm/eLnzfU+IxZ3yBMLPoqd43Ca4=; b=L3CGJ92BsITkbL1yEy/mtEPLU1
	kd7gqLozYVXoCp3v9bbTL9/XRrKIvyssahXqx6a9PiuuBzKakEBaXbVBPMVnzZ6M7rpX4fTySSIpn
	8La0WDVr5yBX1cltaq13lu0iouuOq5DP45jJyLy3z5uLVyHL8YmMfGsCkdXPqDo8K4dNx3z9z930k
	WpZrruN6D+0XWPZwFDuEyX/5wWDHwojUcqvrl6c+ljUuSDwp0lhAeintmrKpyrpW6aPRiLfZXVt9x
	2cSWaOR4DJEpw03UFmVXwxItVFXR3CQ2EKQzriHg6SWKq3iWGAosDK8AL5l5qXchOiLdHYN1g6vPF
	UwUNpkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodVN-00000004kcf-0pdl;
	Tue, 28 Jul 2026 08:49:41 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodVK-00000004kc9-0xKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:49:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tM9KvTvYNxgKTJQYOm/eLnzfU+IxZ3yBMLPoqd43Ca4=;
	b=VhWll1UAXXlaqNtPQcthjAy5pUa6tgVbelOoSCTnDdEdldFUU9T28EWzdYdDkrDxrLk7IVEzf
	x3hvQHuBM5lpCAlB+pVWE41TEEPCrdzFIXzwixkjWuBvEaR3ztjB1N7exD6LT3ooi26fUn3nOqE
	nYdohiMb2HXtR6csD31lsYk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h8TRm5MDzz12LDF;
	Tue, 28 Jul 2026 16:40:04 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 31C2540579;
	Tue, 28 Jul 2026 16:49:35 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 28 Jul 2026 16:49:30 +0800
Message-ID: <fdb4576e-d729-432e-9fab-928ffe6b1a7c@huawei.com>
Date: Tue, 28 Jul 2026 16:49:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware
 dirty tracking
To: Leonardo Bras <leo.bras@arm.com>
CC: Oliver Upton <oupton@kernel.org>, <maz@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>, <yezhenyu2@huawei.com>,
	<yubihong@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
 <20260709104026.2612599-4-zhengtian10@huawei.com>
 <aliKo7dTZzKcWHzI@kernel.org>
 <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com>
 <alpIfIOFfrudBzD5@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <alpIfIOFfrudBzD5@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_014938_570989_AAC7817A 
X-CRM114-Status: GOOD (  22.23  )
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



On 7/17/2026 11:21 PM, Leonardo Bras wrote:
> On Fri, Jul 17, 2026 at 11:58:06AM +0800, Tian Zheng wrote:
>>
>> On 7/16/2026 3:39 PM, Oliver Upton wrote:
>>> Hi Tian,
>>>
>>> On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
>>>> -	if (prot & KVM_PGTABLE_PROT_W)
>>>> +	if (prot & KVM_PGTABLE_PROT_W) {
>>>>    		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>>>>
>>>> +		/*
>>>> +		 * No DEVICE filter needed here: relax_perms is only called
>>>> +		 * on FSC_PERM faults. Device pages always get full RW from
>>>> +		 * initial mapping and are never write-protected during
>>>> +		 * migration, so they never trigger a permission fault.
>>>> +		 */
>>>> +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
>>>> +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
>>>> +	} else {
>>>> +		/*
>>>> +		 * Clear DBM on W→RO downgrade to prevent hardware from
>>>> +		 * silently upgrading RO+DBM back to W+dirty, which would
>>>> +		 * bypass KVM's write tracking and cause data corruption.
>>>> +		 */
>>>> +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
>>>> +	}
>>>> +
>>> This block makes it pretty evident that the DBM bit really *is* the
>>> write permission bit. I'd much rather we introduce the concept of dirty
>>> state to the page table library and migrate the abstract write
>>> permission to the DBM field, even if we don't have FEAT_HAFDBS.
>>>
> 
> Ohh, that's an amazing idea!
> 
>   
>>> That way everything 'just works' from outside the page-table library:
>>> write-protecting hugepages would have the effect of clearing DBM and we
>>> can separately reap dirty state from page descriptors.
>>>
>>> If/when the architecture forces FEAT_S2PIE upon us we will need to make
>>> this change anyway since dirty state management is unconditional and
>>> handled separately from the actual permissions.
>>>
>>> Thanks,
>>> Oliver
>>
>> Hi Oliver,
>>
>> Thanks again for your insightful review. Following your suggestion, I've
>>
>> reworked the design around a unified three-state model that works regardless
>>
>> of whether FEAT_HAFDBS is implemented:
>>
>> **State table**
>> State               | DBM    | S2AP[1] | Without HTTU            | With  HTTU  (HAFDBS)
>> Non-writable   (N)  |  0     |    0    | write -> fault, inject  | write -> fault, inject
>> Writable-clean (C)  |  1     |    0    | write -> fault, sw C->D | write -> hw C->D, no fault, HDBSS logs
>> Writable-dirty (D)  |  1     |    1    | writable, no fault      | writable, no fault
>>
> 
> Yeah, that's how the table works with HAFDBS/HDBSS/HACDBS.
> 
>> **Proposed changes**
>> 1. Remove KVM_PGTABLE_S2_DBM from enum kvm_pgtable_stage2_flags
>>
>> — VTCR_EL2.{HD,HDBSS,HA} enablement in kvm_arm_enable_hdbss_global()
>>
>> already keys off kvm->arch.enable_hdbss / system_supports_hdbss().
>>
> 
> We may need a system_support_hdbss() for the actual hdbss routines, though.

Yes, and sorry for the unclear phrasing. What I meant is:

Setting DBM unconditionally is safe because hardware only interprets it 
when VTCR_EL2.HD is set. That only happens in 
kvm_arm_enable_hdbss_global() after checking both 
system_supports_hdbss() and migration state.

> 
> 
>> 2. stage2_set_prot_attr() — set DBM unconditionally on writable pages:
>> ```
>> if (prot & KVM_PGTABLE_PROT_W) {
>>      attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>>      /* Writable-dirty: DBM=1 conveys write intent, S2AP[1]=1 marks dirty */
>>      attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
>> }
>> ```
>>
>> 3. kvm_pgtable_stage2_relax_perms() — drop the else branch entirely:
>> ```
>> if (prot & KVM_PGTABLE_PROT_W) {
>>      set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>>      /* Non-writable -> Writable-dirty: restore both write intent and dirty state */
>>      set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> 
> In the future, depending on the setup of HDBSS/splitting, we may want to
> change this behavior. But for software only, it looks nice.
> 
>> }
>> /* no else: callers passing !W (e.g. exec faults) must not touch DBM */
>> ```
>>
>> 4. kvm_pgtable_stage2_wrprotect() — unchanged: it only clears S2AP1 (D->C).
>>
>> DBM is preserved so HDBSS re-arms next round.
>>   ```
>> int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64
>> size)
>> {
>>     /* Writable-dirty -> Writable-clean: clear dirty state (S2AP_W),
>>     * preserve write intent (DBM) so HDBSS re-arms for next write.
>>      */
>>      return stage2_update_leaf_attrs(pgt, addr, size, 0,
>>                           KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
>>                           NULL, NULL,
>>                           KVM_PGTABLE_WALK_IGNORE_EAGAIN);
>> }
>> ```
>>
>> **One clarification**
>> In the three-state model above, wrprotect() clears S2AP[1] but preserves DBM
>> (D->C).
>>
>> This allows HDBSS to re-arm on the next write. If we instead cleared DBM as
>> well (->N),
>>
>> HDBSS would be permanently disabled on that page and we'd lose the benefit
>> of hardware
>>
>> dirty tracking.
>>
>>
>> So my understanding is:
>>
>> wrprotect() (dirty tracking): D->C — clears S2AP[1], preserves DBM
>>
>> mkreadonly() (true RO, future): ->N — clears both S2AP[1] and DBM
>>
>> Does this match what you had in mind?
>>
>> Looking forward to your thoughts.
>>
>> Thanks,
>> Tian
>>
>>
>   
> Thanks!
> Leo
> 


