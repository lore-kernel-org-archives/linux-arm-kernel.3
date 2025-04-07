Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EFDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrO20usQ+PK3/nm8QZq7fuDfcwOxcHE8r2bm/p76mWs=; b=nu8DKYHcZobLDA3ExfZo/7ldUk
	0XSqoZ1Kag1e3NnyNEh+WD9phGFkojr+z73HIo7HPhD4YQohHdsMLouoOoYV8xw1op7RluGnV/w8h
	JZWI1SyIZqXKxLFWfkP8IbMKmSTRc9Y9iCcQV7UJouKAvOsxMeGcTQCqcFxkF4P2JtfUfdr0pLVyt
	OwC/+MXHcz7p8nhOTV/8V4MUCVCBGrJR4bT+4/a+sO2f873d/WeAFyjYLR16obsrkykqR5Xq9ImPS
	k9IWcUHHA3kktdeuGCFjRfM0eGUChUCOJvMrdNVrDLxYG0qQSJJzkODCpHB/TYvsEovT5dqeK0Ltc
	zXeL1dJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dGJ-0000000GGjz-2W9I;
	Mon, 07 Apr 2025 03:35:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dEX-0000000GGcV-3ZBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 03:33:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZWF7M0xCmzCsMj;
	Mon,  7 Apr 2025 11:29:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B81D140135;
	Mon,  7 Apr 2025 11:33:03 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 7 Apr 2025 11:33:02 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<maz@kernel.org>, <corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
To: Oliver Upton <oliver.upton@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-7-yangyicong@huawei.com> <Z-wQuJAefT3xNipl@linux.dev>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e9674079-9a22-c3cd-3b00-5989f6926303@huawei.com>
Date: Mon, 7 Apr 2025 11:33:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <Z-wQuJAefT3xNipl@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_203314_221115_A189130B 
X-CRM114-Status: GOOD (  25.83  )
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

On 2025/4/2 0:13, Oliver Upton wrote:
> Hi Yicong,
> 
> On Mon, Mar 31, 2025 at 05:43:20PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> If FEAT_LS64WB not supported, FEAT_LS64* instructions only support
>> to access Device/Uncacheable memory, otherwise a data abort for
>> unsupported Exclusive or atomic access (0x35) is generated per spec.
>> It's implementation defined whether the target exception level is
>> routed and is possible to implemented as route to EL2 on a VHE VM.
>> Per DDI0487K.a Section C3.2.12.2 Single-copy atomic 64-byte load/store:
>>
>>   The check is performed against the resulting memory type after all
>>   enabled stages of translation. In this case the fault is reported
>>   at the final enabled stage of translation.
> 
> Just use section citations, this quote isn't very useful since it
> doesn't adequately describe the different IMPLEMENTATION DEFINED
> behavior.
> 

will drop the quote here.

>> If it's implemented as generate the DABT to the final enabled stage
>> (stage-2), inject a DABT to the guest to handle it.
> 
> This should be ordered _before_ the patch that exposes FEAT_LS64* to the
> VM.

will make this patch ahead.

> 
>> @@ -1658,6 +1658,25 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  	if (exec_fault && device)
>>  		return -ENOEXEC;
>>  
>> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
>> +		/*
>> +		 * Target address is normal memory on the Host. We come here
>> +		 * because:
>> +		 * 1) Guest map it as device memory and perform LS64 operations
>> +		 * 2) VMM report it as device memory mistakenly
>> +		 * Warn the VMM and inject the DABT back to the guest.
>> +		 */
>> +		if (!device)
>> +			kvm_err("memory attributes maybe incorrect for hva 0x%lx\n", hva);
> 
> No, kvm_err() doesn't warn the VMM at all. KVM should never log anything
> for a situation that can be caused by the guest, e.g. option #1 in your
> comment.
> 

ok will drop the log here and only inject a DABT back.

> Keep in mind that data aborts with DFSC == 0x35 can happen for a lot
> more than LS64 instructions, e.g. an atomic on a Device-* mapping.
> 

got it. 0x35 should be caused by LS64* or IMPLEMENTATION DEFINED fault, but no
further hint to distinguish between these two faults. hope it's also the right
behaviour to inject a DABT back for the latter case.

>> @@ -1919,6 +1939,21 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>  			goto out_unlock;
>>  		}
>>  
>> +		/*
>> +		 * If instructions of FEAT_{LS64, LS64_V} operated on
>> +		 * unsupported memory regions, a DABT for unsupported
>> +		 * Exclusive or atomic access is generated. It's
>> +		 * implementation defined whether the exception will
>> +		 * be taken to, a stage-1 DABT or the final enabled
>> +		 * stage of translation (stage-2 in this case as we
>> +		 * hit here). Inject a DABT to the guest to handle it
>> +		 * if it's implemented as a stage-2 DABT.
>> +		 */
>> +		if (esr_fsc_is_excl_atomic_fault(esr)) {
>> +			kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
>> +			return 1;
>> +		}
>> +
> 
> A precondition of taking such a data abort is having a valid mapping at
> stage-2. If KVM can't resolve the HVA of the fault then there couldn't
> have been a stage-2 mapping.
> 

Here's handling the case for emulated mmio, I thought there's no valid stage-2 mapping
for the emulated MMIO? so this check is put just before entering io_mem_abort(). should
it be put into io_mem_abort() or we just don't handle the emulated case?

For the case where's a valid stage-2 mapping, the LS64 DABT is handled in user_mem_abort().

Thanks.


