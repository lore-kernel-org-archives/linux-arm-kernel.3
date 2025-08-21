Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCE2CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r31fWWg+2kMjMmJjr+sR6b3as70jWLVhI1dnGZrUqlg=; b=AJrPCDfKpm128Pz+15kmheXdv4
	Tnz+/HzM3m2AxBdDFOPfRbHG3h4xdbViTuEuQwctt65+mcc8htqgMJjLHuaFawUXI2LpYZoKarRAI
	bipXfKnKpDEvCchChCOqgWy+ymDhZwskoMvVAh6t+4OV04t8az4gMqiUHAE0qesU1oB8xlZUW9M6n
	VK/0pBexlm/mJKUYOx1HKjQZxciykwUCTW5xYqNcPjs0Am7CXpe9vHT/UfnBNRRu2ggW9BAN3UgJL
	0cVA0yCO0BWjRNLqz3NHa9Gi1exKSyTzurpHf3/f7Xm1MIUKHPMXCgkh5DM6fD44fdoPFoT2vvU77
	5G1vFVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhl-00000000EMy-3Lvj;
	Thu, 21 Aug 2025 19:12:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5af-0000000H6KD-0NBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E77CD152B;
	Thu, 21 Aug 2025 06:44:19 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FB583F59E;
	Thu, 21 Aug 2025 06:44:26 -0700 (PDT)
Message-ID: <56e049d4-dc15-40e0-a3ba-62d45678780d@arm.com>
Date: Thu, 21 Aug 2025 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] KVM: arm64: Handle RASv1p1 registers
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-3-maz@kernel.org>
 <95819606-ef3b-46e1-8201-1abf0219659f@arm.com> <87ect4kd7a.wl-maz@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <87ect4kd7a.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_064429_164656_4AA843B2 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Marc,

On 8/21/25 14:37, Marc Zyngier wrote:
> On Thu, 21 Aug 2025 14:13:52 +0100,
> Ben Horgan <ben.horgan@arm.com> wrote:
>>
>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>> index 82ffb3b3b3cf7..feb1a7a708e25 100644
>>> --- a/arch/arm64/kvm/sys_regs.c
>>> +++ b/arch/arm64/kvm/sys_regs.c
>>> @@ -2697,6 +2697,18 @@ static bool access_ras(struct kvm_vcpu *vcpu,
>>>   	struct kvm *kvm = vcpu->kvm;
>>>     	switch(reg_to_encoding(r)) {
>>> +	case SYS_ERXPFGCDN_EL1:
>>> +	case SYS_ERXPFGCTL_EL1:
>>> +	case SYS_ERXPFGF_EL1:
>>> +	case SYS_ERXMISC2_EL1:
>>> +	case SYS_ERXMISC3_EL1:
>>> +		if (!(kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
>>> +		      (kvm_has_feat_enum(kvm, ID_AA64PFR0_EL1, RAS, IMP) &&
>>> +		       kvm_has_feat(kvm, ID_AA64PFR1_EL1, RAS_frac, RASv1p1)))) {
>>> +			kvm_inject_undefined(vcpu);
>>> +			return false;
>>> +		}
>>> +		break;
>>>   	default:
>>>   		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
>>>   			kvm_inject_undefined(vcpu);
>> The default condition needs updating for the case when
>> ID_AA64PFR0_EL1.RAS = b10 otherwise access to the non-v1 specific RAS
>> registers will result in an UNDEF being injected.
> 
> I don't think so. The RAS field is described as such:
> 
> 	UnsignedEnum    31:28   RAS
> 	        0b0000  NI
>         	0b0001  IMP
> 	        0b0010  V1P1
> 	        0b0011  V2
> 	EndEnum
> 
> Since this is an unsigned enum, this checks for a value < IMP. Only
> RAS not being implemented is this condition satisfied, and an UNDEF
> injected.
> 
> Or am I missing something obvious here (I wouldn't be surprised...)?

No, you are indeed correct. I missed the difference between
kvm_has_feat_enum() and kvm_has_feat(). Sorry for the noise.

> 
> 	M.
> 

-- 
Thanks,

Ben


