Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCCD606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iU98aUcH;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=hjRU7vzd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IZO9hHewpI1vF88rTpwvcS4eIwOhB3E4KR10OH18Zcs=; b=iU98aUcH7akKYS
	blkFCZh+iuJc1diMCV5UCU6VdoQBmZ+nyvzBrX4U1bbQ++jidyP8Rue03AKk5htyvWQsovEvUl7cH
	xwpJSDbJ2AAGW/fwJjDFRQU5iRrD+sGTuYcvCWQ+5U+Ed/l2QTT+hgiNjq/DQw5EAB9Gx0+TdJIA8
	owqV2rb+X3V9icdkUSXD6Fr0i+04Blayk1/pPIiTKgg27NC3zE56jqnM3H/slUqBLGJAZS6OePSh+
	3Wl6JPsIH+irtWiFZKg3Yn1mGF2tMQJa2joB/a7GC7yHlPVwC7Bg9xGIBJqmgwW9FSsoP4qZvskCB
	kf9RmJK8ae/8CM7eIS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFq2-0000000BeO3-3vlH;
	Fri, 06 Nov 2026 09:02:22 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFpy-0000000BeNZ-3imn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:02:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IZO9hHewpI1vF88rTpwvcS4eIwOhB3E4KR10OH18Zcs=;
	b=hjRU7vzdg/I2Nu9I0mN5sdbYT0kFey2K901ZDMBOjEImYw2ZNl0YCPz2n08l6gN5gzgjTEDT3
	UiWdRSGdcbRhhJ9fuEMPeptb2aUqQ3ozspnVmQbHxAY4Ba+SCZepn1a1YX+RspQ6suiHa9Yi8uf
	CMPGrMQwBtz8FudL0/tAjF4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jLY843ZlNzcb3y;
	Fri,  6 Nov 2026 17:01:40 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id D977A40561;
	Fri,  6 Nov 2026 17:02:10 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 6 Nov 2026 17:02:09 +0800
Message-ID: <75b0ebcb-023a-4889-98b1-bf1d8b6327dd@huawei.com>
Date: Fri, 6 Nov 2026 17:02:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/15] KVM: arm64: Flush the HDBSS buffer on VM exit
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-9-zhengtian10@huawei.com> <auDpyRNpeDNzIk3W@LeoBrasDK>
 <5bbd0d3b-1026-43f3-bc45-245472603144@huawei.com>
 <auTLOIafIq4cjRho@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auTLOIafIq4cjRho@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_010219_619304_00009F18 
X-CRM114-Status: GOOD (  24.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/31/2026 12:52 AM, Leonardo Bras wrote:
> On Fri, Oct 30, 2026 at 12:57:06PM +0800, Tian Zheng wrote:
>>
>>
>> On 10/28/2026 2:13 AM, Leonardo Bras wrote:
>>> On Tue, Sep 29, 2026 at 06:36:48PM +0800, Tian Zheng wrote:
>>>> From: Eillon <yezhenyu2@huawei.com>
>>>>
>>>> HDBSS entries accumulate in the per-vCPU buffer while the guest runs,
>>>> and must be drained into the dirty bitmap or dirty ring before
>>>> userspace can observe them.
>>>>
>>>> Drain the buffer at a single point: kvm_arch_vcpu_ioctl_run() flushes
>>>> it on every VM exit, before the exit reason is handled. Flushing
>>>> inside the run loop keeps the dirty-ring feedback timely: when a flush
>>>> pushes the ring past its soft limit, kvm_dirty_ring_push() raises
>>>> KVM_REQ_DIRTY_RING_SOFT_FULL, which check_vcpu_requests() observes at
>>>> the top of the next loop iteration, so the vCPU exits to userspace for
>>>> the harvest before re-entering the guest.
>>>>
>>>> kvm_arch_sync_dirty_log() relies on the exit path to flush: it kicks
>>>> vCPUs out of guest mode, and the GET/CLEAR protocol tolerates
>>>> concurrent bitmap writes, so the snapshot is complete without extra
>>>> synchronization.
>>>>
>>>> Signed-off-by: Eillon <yezhenyu2@huawei.com>
>>>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>>>> ---
>>>>    arch/arm64/include/asm/kvm_dirty_bit.h | 15 +++++++++
>>>>    arch/arm64/kvm/arm.c                   | 20 ++++++++++++
>>>>    arch/arm64/kvm/dirty_bit.c             | 45 ++++++++++++++++++++++++++
>>>>    3 files changed, 80 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
>>>> index fe703f02626b..d828e6b43fe9 100644
>>>> --- a/arch/arm64/include/asm/kvm_dirty_bit.h
>>>> +++ b/arch/arm64/include/asm/kvm_dirty_bit.h
>>>> @@ -13,6 +13,9 @@
>>>>    #include <asm/sysreg.h>
>>>>    #include <linux/sizes.h>
>>>>
>>>> +#define HDBSS_ENTRY_VALID	BIT(0)
>>>> +#define HDBSS_ENTRY_IPA	GENMASK_ULL(55, 12)
>>>> +
>>>>    #define KVM_ARM_HDBSS_DEFAULT_SIZE  PAGE_SIZE
>>>>    #define KVM_ARM_HDBSS_MAX_SIZE      SZ_2M
>>>>
>>>> @@ -22,7 +25,19 @@ static inline u32 kvm_hdbss_buffer_size(struct kvm *kvm)
>>>>    	return kvm->arch.hdbss_buffer_size ?: KVM_ARM_HDBSS_DEFAULT_SIZE;
>>>>    }
>>>>
>>>> +static inline bool kvm_hdbss_enabled(struct kvm *kvm)
>>>> +{
>>>> +	return kvm->arch.mmu.vtcr & VTCR_EL2_HDBSS;
>>>> +}
>>>> +
>>>> +static inline bool vcpu_hdbss_enabled(struct kvm_vcpu *vcpu)
>>>> +{
>>>> +	return vcpu->arch.hw_mmu &&
>>>> +		(vcpu->arch.hw_mmu->vtcr & VTCR_EL2_HDBSS);
>>>> +}
>>>> +
>>>
>>> IIUC, arch.mmu is always the canonical s2_mmu, while hw_mmu can be the
>>> nested s2_mmu, if enabled.
>>>
>>> Was that your intend here?
>>> If not, we could use only kvm* version, which can be called with vcpu->kvm.
>>>
>>> If it was, then I would like to understand the logic here, as IIUC the
>>> buffer is accessible only for the non-nested guest, as it's
>>> allocated in a per-vcpu structure. (vcpu->arch)
>>>
>>
>> Hi leo,
>>
>> Yes, that was the intent. The shadow MMU never carries VTCR_EL2.HDBSS,
>> so the flush is naturally skipped when running nested.
> 
> Ah, right. If we always test the kvm one, we may enable it for the nested
> guest, which is undesired.
> 
> [...]
>>
>>>
>>>> @@ -2017,7 +2025,19 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
>>>>
>>>>    void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>>>>    {
>>>> +	unsigned long i;
>>>> +	struct kvm_vcpu *vcpu;
>>>>
>>>> +	if (!kvm_hdbss_enabled(kvm))
>>>> +		return;
>>>> +
> 
> And then here you check for the L1 VM because during migration the host
> could have dirtied memory, and you want to track that as well.
> 
> Makes sense
> 
>>>> +	/*
>>>> +	 * The buffer is drained on every VM exit, so kicking running
>>>> +	 * vCPUs is enough to flush them; the dirty-log GET/CLEAR
>>>> +	 * protocol tolerates bits set concurrently with the snapshot.
>>>> +	 */
>>>> +	kvm_for_each_vcpu(i, vcpu, kvm)
>>>> +		kvm_vcpu_kick(vcpu);
>>>>    }
>>>>
>>>>    static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
>>>> diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
>>>> index f9aeb9f34ad0..be0d12555c84 100644
>>>> --- a/arch/arm64/kvm/dirty_bit.c
>>>> +++ b/arch/arm64/kvm/dirty_bit.c
>>>> @@ -13,6 +13,7 @@
>>>>    #include <linux/kconfig.h>
>>>>    #include <linux/log2.h>
>>>>    #include <linux/mm.h>
>>>> +#include <linux/srcu.h>
>>>>
>>>
>>> Out of curiosity, could you please explain you reasoning on selecting srcu
>>> as locking here?
>>>
>>> (Like, what are you protecting against, and why srcu is a good choice)
>>>
>>
>> kvm_vcpu_mark_page_dirty() resolves the memslot under SRCU
>> (kvm_vcpu_gfn_to_memslot), and the flush loop calls it for each entry,
>> so the whole loop needs the read lock held.
> 
> Oh, right, it's just about getting the memslot... now I see it :)
> 
> Thanks!
> Leo

Awesome!


