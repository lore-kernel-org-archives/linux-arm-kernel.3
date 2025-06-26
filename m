Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7435CC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwtxDTRrUKY8k6GUEk9c/+FavOCB8G+OUGX8S/qOf1Q=; b=wWDK1wGRQJ+XwZA08RlMBUAiGq
	f4wsb4db6UTq/2LG136mLY+ND9ipDSY7QVMx2KX3fvAaE4o+qv9LjskizDg+UquhPkOflk58kvT/x
	6ASNCIvymDouvirhYyjjJzEC6I0+r38Mw8VT2/2YE262A9AZBj2+UdIPWxIEEeht/0c96GJe+Y5G0
	Oo3xPdNoSRyLIoXbzXYsNrn7pUfN+SwdpklHd4mgu0gM80YkCckd/rvdjBUuxXYWAaPIfUZoH754n
	Bs+LaBXrwT17pVJyuRCPbyMnmsrWKDmm+si7oHUUlIclV1YaMptbLPvdxHA0n8MnFApakbRhQBcOY
	a8fxwYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlxD-0000000BZNr-3clS;
	Thu, 26 Jun 2025 12:43:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkxI-0000000BRHp-3MHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:39:50 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bSc7j1trPzdbk3;
	Thu, 26 Jun 2025 19:35:45 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8703D180450;
	Thu, 26 Jun 2025 19:39:43 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 19:39:43 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 19:39:42 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: Re: [PATCH v3 3/7] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
To: Marc Zyngier <maz@kernel.org>, <oliver.upton@linux.dev>
References: <20250626080906.64230-1-yangyicong@huawei.com>
 <20250626080906.64230-4-yangyicong@huawei.com> <86zfduc2ca.wl-maz@kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <44993060-7eb1-400c-9887-3d438aeb8ee9@huawei.com>
Date: Thu, 26 Jun 2025 19:39:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <86zfduc2ca.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_043949_148928_9FADC294 
X-CRM114-Status: GOOD (  29.53  )
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

On 2025/6/26 16:51, Marc Zyngier wrote:
> On Thu, 26 Jun 2025 09:09:02 +0100,
> Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> If FEAT_LS64WB not supported, FEAT_LS64* instructions only support
>> to access Device/Uncacheable memory, otherwise a data abort for
>> unsupported Exclusive or atomic access (0x35) is generated per spec.
>> It's implementation defined whether the target exception level is
>> routed and is possible to implemented as route to EL2 on a VHE VM
>> according to DDI0487K.a Section C3.2.12.2 Single-copy atomic 64-byte
>> load/store.
> 
> Nit: in DDI0487L.b (the latest as I write), this is in C3.2.6.
> 

will update the reference.

>>
>> If it's implemented as generate the DABT to the final enabled stage
>> (stage-2), since no valid ISV indicated in the ESR, it's better for
>> the userspace to decide how to handle it. Reuse the
>> NISV_IO_ABORT_TO_USER path with exit reason KVM_EXIT_ARM_LDST64B.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/include/asm/esr.h |  8 ++++++++
>>  arch/arm64/kvm/mmu.c         | 21 ++++++++++++++++++++-
>>  2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
>> index e1deed824464..63cd17f830da 100644
>> --- a/arch/arm64/include/asm/esr.h
>> +++ b/arch/arm64/include/asm/esr.h
>> @@ -124,6 +124,7 @@
>>  #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
>>  #define ESR_ELx_FSC_SECC	(0x18)
>>  #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
>> +#define ESR_ELx_FSC_EXCL_ATOMIC	(0x35)
>>  #define ESR_ELx_FSC_ADDRSZ	(0x00)
>>  
>>  /*
>> @@ -488,6 +489,13 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
>>  	       (esr == ESR_ELx_FSC_ACCESS_L(0));
>>  }
>>  
>> +static inline bool esr_fsc_is_excl_atomic_fault(unsigned long esr)
>> +{
>> +	esr = esr & ESR_ELx_FSC;
>> +
>> +	return esr == ESR_ELx_FSC_EXCL_ATOMIC;
>> +}
>> +
>>  static inline bool esr_fsc_is_addr_sz_fault(unsigned long esr)
>>  {
>>  	esr &= ESR_ELx_FSC;
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 2942ec92c5a4..5f05d1c4b5a2 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1665,6 +1665,24 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  	if (exec_fault && device)
>>  		return -ENOEXEC;
>>  
>> +	/*
>> +	 * Target address is normal memory on the Host. We come here
>> +	 * because:
>> +	 * 1) Guest map it as device memory and perform LS64 operations
>> +	 * 2) VMM report it as device memory mistakenly
>> +	 * Hand it to the userspace.
>> +	 */
>> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
>> +		struct kvm_run *run = vcpu->run;
>> +
>> +		run->exit_reason = KVM_EXIT_ARM_LDST64B;
>> +		run->arm_nisv.esr_iss = kvm_vcpu_dabt_iss_nisv_sanitized(vcpu);
>> +		run->arm_nisv.fault_ipa = fault_ipa |
>> +			(kvm_vcpu_get_hfar(vcpu) & (vma_pagesize - 1));
>> +
>> +		return -EAGAIN;
>> +	}
> 
> I'm not sure that's the right thing to do.
> 
> If:
> 
> - the guest was told it doesn't have LS64WB,
> 
> - it was told that some range is memory,
> 
> - it uses that range as device,
> 
> - thanks to FWB the resulting memory type is "Normal-Cacheable"
> 
> - which results in an Unsupported Atomic exception
> 
> why would we involve the VMM at all? The VMM clearly said it didn't
> want to be involved in this (we have a memslot).
> 

ok I thought we should make VMM do the decision in all the cases(both
here and emulated MMIO) based on the last discussion[*], I may
misunderstand it. If this is the case...

> I think we should simply inject the corresponding S1 fault back into
> the guest.
> 

let's simply inject a corresponding DABT back here and only make the VMM
handle the emulated MMIO case. will update if no further comment.

thanks.

[*] https://lore.kernel.org/linux-arm-kernel/Z_NkHWStDJLo0cmY@linux.dev/

