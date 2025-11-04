Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090A0CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnBmgltdB0ioImqveHX+xx4A4npVGPQ/LTprzZSJ+xY=; b=10MsISG5PwQeAEizrnNbXdcMYT
	vQrpNKeYwPYIN1gBtjZhtBBosoEYPbqKTctYEO3AuvaCKDqqwgtI4aiNNpKK7pcBf5moeNILfcJIn
	7WBWcV5zgJDKafg6mX4MaYRc9EUBtTy7d0SStCZlfPNugM+egghOwgeB1dxv1GF5qwgQxOyrfrmEt
	NbT3qsaIgxvQuR6VmBKdQqgQuIKxskKrDRObHdf4xu0+Ao03ZegLCMXT37No/ONJZ9HfPr3Z3bA6D
	xNUe1bB+1B2RgDfHRLuA3nmf0OPHoyqDEBlozik2bCybdDFHj9AHORVIz5hvSzJjqNW7SQyvi3SrR
	9+12uh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLNX-0000000CKRj-1D0q;
	Tue, 04 Nov 2025 18:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLNU-0000000CKQs-0vRc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:03:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A70B1CE0;
	Tue,  4 Nov 2025 10:03:22 -0800 (PST)
Received: from [10.57.71.89] (unknown [10.57.71.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D7923F694;
	Tue,  4 Nov 2025 10:03:28 -0800 (PST)
Message-ID: <fbe0d81a-c4c2-46f5-b809-1b74f9307c98@arm.com>
Date: Tue, 4 Nov 2025 18:03:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com
References: <20251104125906.1919426-1-tabba@google.com>
 <20251104125906.1919426-6-tabba@google.com>
 <a0b19558-dbcb-4231-b0c4-302cc10652db@arm.com>
 <CA+EHjTwPqm5wkmdGK60sn+S9BizK6LG5bSqWQLigsZVgXoJmUw@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTwPqm5wkmdGK60sn+S9BizK6LG5bSqWQLigsZVgXoJmUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_100332_308554_5A232846 
X-CRM114-Status: GOOD (  15.53  )
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

On 04/11/2025 17:56, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 4 Nov 2025 at 17:50, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 04/11/2025 12:59, Fuad Tabba wrote:
>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
>>> register accesses. These accesses are trapped to EL2 when the bits are
>>> clear.
>>>
>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
>>> had the polarity inverted. When a guest did not support the ExtTrcBuff
>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
>>> potentially allowing a protected guest to access registers for a feature
>>> it was not given.
>>>
>>> Fix this by inverting the operation.
>>>
>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>    arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>> index 43bde061b65d..df0c59a29b35 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>>>                val |= MDCR_EL2_TTRF;
>>>
>>>        if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
>>
>> Why are we checkin ExtTrcBuff ? Shouldn't that be TraceBuffer ?
> 
> This is an existing bug that needs to be fixed. Thank for spotting it.
> 
>>> -             val |= MDCR_EL2_E2TB_MASK;
>>> +             val &= ~MDCR_EL2_E2TB_MASK;
>> This looks correct to me.
> 
> I don't thin it's correct. E2TB traps when clear, not set:
> https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/MDCR-EL2--Monitor-Debug-Configuration-Register--EL2-

I meant your change to val looks correct.

Suzuki

> 
>> Suzuki
>>
>>>
>>>        /* Trap Debug Communications Channel registers */
>>>        if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
>>
>>


