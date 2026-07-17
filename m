Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA6C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZieNmbL4He5C8K2KrAUxxR7EUcsvEBRn9bKC7gbbrA=; b=xhRxPgQ7+yzkRDMp6MbU0cOcIf
	HPbXqwHXh+n/DTDvrzqh4LrZoABOwWGsA4VfT/XUpKLSprx0XGXD7PvlUhh4uPVOx69fOgkurXkwU
	B8v/qHdl+OqNqXWLYzYcSHL0qss0uVPCsPQOV6Zci+fr1tPergub2jJJR+g7pkgh5IJdola8mXea/
	l5RYqEE4aMRz12hC4xHBaDIQ2R1wLZTiq5Q9FVMjGResk9t/+7OJSLWa5pP07sSy9bYCWdVCr8Zwj
	SGoCWxgnXX2lOEHIElPPi3ymsXm0VGYKwv1GZBjMtLk/HErXOwsPtJjFQz41yQM4nWLC87ptvw/Ae
	WVcqld3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZiQ-000000015tt-4BQH;
	Fri, 17 Jul 2026 03:58:23 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZiN-000000015sh-0fLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 03:58:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EZieNmbL4He5C8K2KrAUxxR7EUcsvEBRn9bKC7gbbrA=;
	b=TmsvjBY+r52h7d3mKD6Mh6hjchO30XC+iREPzrU9HRz+p2uD+pzog53GVUa+RdKMp/CCivGIl
	/VuPY7lVtEIM9VAd+Hv/taTFJ0lSsoNtilJ5idIAEzoBUaPp2kCFHGNh5yh1Nmx68wrYJ0mT+CZ
	rqE7JNbGFpMZ/EfVKK6CUjc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h1bVQ05c1z12LDV;
	Fri, 17 Jul 2026 11:48:30 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id C2E754056E;
	Fri, 17 Jul 2026 11:58:06 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 17 Jul 2026 11:58:05 +0800
Message-ID: <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com>
Date: Fri, 17 Jul 2026 11:58:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware
 dirty tracking
To: Oliver Upton <oupton@kernel.org>
CC: <maz@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>, <yezhenyu2@huawei.com>,
	<yubihong@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <leo.bras@arm.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
 <20260709104026.2612599-4-zhengtian10@huawei.com>
 <aliKo7dTZzKcWHzI@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <aliKo7dTZzKcWHzI@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_205819_813405_FA12989A 
X-CRM114-Status: GOOD (  18.52  )
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


On 7/16/2026 3:39 PM, Oliver Upton wrote:
> Hi Tian,
>
> On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
>> -	if (prot & KVM_PGTABLE_PROT_W)
>> +	if (prot & KVM_PGTABLE_PROT_W) {
>>   		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>>
>> +		/*
>> +		 * No DEVICE filter needed here: relax_perms is only called
>> +		 * on FSC_PERM faults. Device pages always get full RW from
>> +		 * initial mapping and are never write-protected during
>> +		 * migration, so they never trigger a permission fault.
>> +		 */
>> +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
>> +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
>> +	} else {
>> +		/*
>> +		 * Clear DBM on W→RO downgrade to prevent hardware from
>> +		 * silently upgrading RO+DBM back to W+dirty, which would
>> +		 * bypass KVM's write tracking and cause data corruption.
>> +		 */
>> +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
>> +	}
>> +
> This block makes it pretty evident that the DBM bit really *is* the
> write permission bit. I'd much rather we introduce the concept of dirty
> state to the page table library and migrate the abstract write
> permission to the DBM field, even if we don't have FEAT_HAFDBS.
>
> That way everything 'just works' from outside the page-table library:
> write-protecting hugepages would have the effect of clearing DBM and we
> can separately reap dirty state from page descriptors.
>
> If/when the architecture forces FEAT_S2PIE upon us we will need to make
> this change anyway since dirty state management is unconditional and
> handled separately from the actual permissions.
>
> Thanks,
> Oliver


Hi Oliver,

Thanks again for your insightful review. Following your suggestion, I've

reworked the design around a unified three-state model that works regardless

of whether FEAT_HAFDBS is implemented:

**State table**
State                       | DBM | S2AP[1] | Without HTTU         | 
With HTTU (HAFDBS)
Non-writable   (N)  |  0     |    0         | write -> fault, inject    
     | write -> fault, inject
Writable-clean (C)  |  1     |    0         | write -> fault, sw C->D  
  | write -> hw C->D, no fault, HDBSS logs
Writable-dirty (D)   |  1     |    1         | writable, no fault       
     | writable, no fault

**Proposed changes**
1. Remove KVM_PGTABLE_S2_DBM from enum kvm_pgtable_stage2_flags

— VTCR_EL2.{HD,HDBSS,HA} enablement in kvm_arm_enable_hdbss_global()

already keys off kvm->arch.enable_hdbss / system_supports_hdbss().

2. stage2_set_prot_attr() — set DBM unconditionally on writable pages:
```
if (prot & KVM_PGTABLE_PROT_W) {
     attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
     /* Writable-dirty: DBM=1 conveys write intent, S2AP[1]=1 marks dirty */
     attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
}
```

3. kvm_pgtable_stage2_relax_perms() — drop the else branch entirely:
```
if (prot & KVM_PGTABLE_PROT_W) {
     set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
     /* Non-writable -> Writable-dirty: restore both write intent and 
dirty state */
     set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
}
/* no else: callers passing !W (e.g. exec faults) must not touch DBM */
```

4. kvm_pgtable_stage2_wrprotect() — unchanged: it only clears S2AP1 (D->C).

DBM is preserved so HDBSS re-arms next round.
  ```
int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 
size)
{
    /* Writable-dirty -> Writable-clean: clear dirty state (S2AP_W),
    * preserve write intent (DBM) so HDBSS re-arms for next write.
     */
     return stage2_update_leaf_attrs(pgt, addr, size, 0,
                          KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
                          NULL, NULL,
                          KVM_PGTABLE_WALK_IGNORE_EAGAIN);
}
```

**One clarification**
In the three-state model above, wrprotect() clears S2AP[1] but preserves 
DBM (D->C).

This allows HDBSS to re-arm on the next write. If we instead cleared DBM 
as well (->N),

HDBSS would be permanently disabled on that page and we'd lose the 
benefit of hardware

dirty tracking.


So my understanding is:

wrprotect() (dirty tracking): D->C — clears S2AP[1], preserves DBM

mkreadonly() (true RO, future): ->N — clears both S2AP[1] and DBM

Does this match what you had in mind?

Looking forward to your thoughts.

Thanks,
Tian



