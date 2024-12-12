Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfH9CDQItSGbjRtAwv0m16VJBn1228BzN7Z0gOdZwbk=; b=y7SIeK3UP2Bp5MryVjyN8CJSmy
	ZGjDZ4Jsuogj7ar/d/oiI72ujINTwFT6iGXaBr4m+ILs2NOHHfpzNGBPuTIq8y1WhKaKGPlbZW1ZA
	UlFFibs2NRF/Zzc5grUYK9tJSA+Xa3kl09wJ5Cr0VKvBnnytMwOJmhFGKMDIM2oMT59lsfDAjCrws
	tcJCYHNsw5DQnYTZQd9u6tH3M2uP77KSwiH4BkPEvjz78nbTG2u6L1O79RfcgYCjBQFC8/5IAUpsX
	nSys/ZZ8KlQml2kXjNC+C3tZ+pmHo/JwXM/RA9kWvMAEg+5le6ps1KpVOUU7Ts7L8DvopPb9aNVsY
	dq/fUkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfgu-0000000HX3f-3Hb2;
	Thu, 12 Dec 2024 09:41:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfPp-0000000HTct-3LZB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:23:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0F1169E;
	Thu, 12 Dec 2024 01:23:52 -0800 (PST)
Received: from [10.57.92.2] (unknown [10.57.92.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50E893F5A1;
	Thu, 12 Dec 2024 01:23:22 -0800 (PST)
Message-ID: <5d4ccb2c-da45-4471-9bb1-90212b50dad7@arm.com>
Date: Thu, 12 Dec 2024 09:23:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH v1 1/5] arm64: Add TLB Conflict Abort Exception
 handler to KVM
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-2-miko.lenczewski@arm.com>
 <86o71irucr.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <86o71irucr.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_012325_927196_587C9D6D 
X-CRM114-Status: GOOD (  28.59  )
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

On 11/12/2024 17:40, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 16:01:37 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
>>
>> Currently, KVM does not handle the case of a stage 2 TLB conflict abort
>> exception. The Arm ARM specifies that the worst-case handling of such an
>> exception requires a `tlbi vmalls12e1`.
> 
> Not quite. It says (I_JCCRT):
> 
> <quote>
> * For the EL1&0 translation regime, when stage 2 translations are in
>   use, either VMALLS12E1 or ALLE1.
> </quote>
> 
>> Perform such an invalidation when this exception is encountered.
> 
> What you fail to describe is *why* this is needed. You know it, I know
> it, but not everybody does. A reference to the ARM ARM would
> definitely be helpful.
> 
>>
>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>> ---
>>  arch/arm64/include/asm/esr.h | 8 ++++++++
>>  arch/arm64/kvm/mmu.c         | 6 ++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
>> index d1b1a33f9a8b..8a66f81ca291 100644
>> --- a/arch/arm64/include/asm/esr.h
>> +++ b/arch/arm64/include/asm/esr.h
>> @@ -121,6 +121,7 @@
>>  #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
>>  #define ESR_ELx_FSC_SECC	(0x18)
>>  #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
>> +#define ESR_ELx_FSC_TLBABT	(0x30)
>>  
>>  /* Status codes for individual page table levels */
>>  #define ESR_ELx_FSC_ACCESS_L(n)	(ESR_ELx_FSC_ACCESS + (n))
>> @@ -464,6 +465,13 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
>>  	       (esr == ESR_ELx_FSC_ACCESS_L(0));
>>  }
>>  
>> +static inline bool esr_fsc_is_tlb_conflict_abort(unsigned long esr)
>> +{
>> +	esr = esr & ESR_ELx_FSC;
>> +
>> +	return esr == ESR_ELx_FSC_TLBABT;
>> +}
>> +
>>  /* Indicate whether ESR.EC==0x1A is for an ERETAx instruction */
>>  static inline bool esr_iss_is_eretax(unsigned long esr)
>>  {
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index c9d46ad57e52..c8c6f5a97a1b 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1756,6 +1756,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>  	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
>>  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
>>  
>> +	if (esr_fsc_is_tlb_conflict_abort(esr)) {
>> +		// does a `tlbi vmalls12e1is`
> 
> nit: this isn't a very useful comment.
> 
>> +		__kvm_tlb_flush_vmid(&vcpu->kvm->arch.mmu);
>> +		return 1;
>> +	}
> 
> That's not enough, unfortunately. A nested VM has *many* VMIDs (the
> flattening of all translation contexts that the guest uses).
> 
> So you can either iterate over all the valid VMIDs owned by this
> guest, or more simply issue a TLBI ALLE1, which will do the trick in a
> much more efficient way.
> 
> The other thing is that you are using an IS invalidation, which is
> farther reaching than necessary. Why would you invalidate the TLBs for
> CPUs that are only innocent bystanders? A non-shareable invalidation
> seems preferable to me.
> 
>> +
>>  	if (esr_fsc_is_translation_fault(esr)) {
>>  		/* Beyond sanitised PARange (which is the IPA limit) */
>>  		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
> 
> But it also begs the question: why only KVM, and not the host? This
> handler will only take effect for a TLB Conflict abort delivered from
> an EL1 guest to EL2.

Hi Marc,

I believe the intent of this patch is to protect the host/KVM against a guest
that is using BBML2. The host/KVM always assumes BBML0 and therefore doesn't do
any operations that are allowed by the arch to cause a conflict abort. Therefore
the host doesn't need to handle it. But a guest could be taking advantage of
BBML2 and therefore it's architiecturally possible for a conflict abort to be
raised to EL2. I think today that would take down the host?

So really I think this could be considered a stand-alone KVM hardening improvement?

> 
> However, it doesn't seem to me that the host is equipped to deal with
> this sort of exception for itself. Shouldn't you start with that?

If the host isn't doing any BBML2 operations it doesn't need to handle it, I
don't think? Obviously that changes later in the series and Miko is adding the
required handling to the host.

Thanks,
Ryan

> 
> Thanks,
> 
> 	M.
> 


