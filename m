Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AD8CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rKsaF96H0ao5LtAeB6Jowvi3N+dV7tElJWwhr8XO8PU=; b=MA1kWxRfzm9Cur
	FJ0HK5JIRj4eLSt0M5b1ilfM8H0YiYyGFHWp8wMqEl/jKkTONkGIG7sMhOLQPfpiZgDLSbl0owOPQ
	IhaWErWAtSzkN7d3vYagUa1+DG+JAHpVt/lH1/b2Kydk9VJbWym3oC4DyZqK93iTW6tZpoAv2KX/V
	nL6UMWx+McZQpay0MRvTHtJ4sfDYqfEuChdUWZ4VwRB31V5IxM6ZECb+Gxt8g6/cR4JrORb90Uh5p
	NAYv5UEu5j89T+JzDOGrE8AWQQCC0vmaofNxJ366jwSD32f4xuRtCbZwGz3KjBaABpqbQ+v/2D6Z7
	Eiizldp2I90zLZ3mOC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb1w-00000006Lrb-3wZd;
	Thu, 14 May 2026 18:43:32 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb1v-00000006LrB-0dHf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:43:32 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-439d43ddfa9so3661766fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784209; x=1779389009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKsaF96H0ao5LtAeB6Jowvi3N+dV7tElJWwhr8XO8PU=;
        b=aWxHUG3OAeknI/m95eu2pAxDZPw8BxNr3cGHcfYkpmIfHoTukz5t1YXlP4PVweZhTL
         nexq/f04G+mNhlJrbtbs2cFjpR2sLz6kV2TPqCnnWbmA3uV/vyae0IEUyY0E+UTZQUKJ
         QdhNiIWdLK/1FtTLJRNWPBmjK1Qb/CrwZmYn8PNVw8cV88qZQEVVvGeNpVmEBN96u1sT
         21GcrYa2Tle58aZQ7KgI5oYkFgRfyMw9kKekgdzCYYwLVYKhL6uPUItH5MaH5g9aNLz+
         GKlRyh9drIa9+OI3UiZwD/Q4kE2dQWjKmfQHwCTiRhOEXdimHGiqgMOWASREUNXJSRJJ
         8fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784209; x=1779389009;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKsaF96H0ao5LtAeB6Jowvi3N+dV7tElJWwhr8XO8PU=;
        b=AutqbuSTUaiI/aG0frjGWKhi3GjYpx2YZRU5CF21LzsTbNMxyugAykruQwGuxPzOL+
         JCtWZGSHXXy6g6ds1NWpKA86p/4Thwhs9XSDBwQMtcz/7hXulxxR4JV/BGbyGpGBUmX3
         q0jV0GCZ/csnhfIn4ZW0hOwRifdka5wSBJOu4WSKLadvuzI8pVe71SyELH9SUE3VS15F
         31faBHeTgAKUzu4sekcidfuBk2RQlqcLXbKmZYTbLy/kGCQAUyd7WXjf/mbQOByWYTrB
         /cxpmQInXRubkiZGgNnrCEJkgFb8pABajfklyecXdD2TW/6Mp503uPRha6mylglrEJPn
         /Xqg==
X-Forwarded-Encrypted: i=1; AFNElJ+5J0QegiF6Tpokg6MefP8xVPFPUlAP6t8ewm34s0nCIHQL+zU91dOPQ8vGXzTxFxrYjrGLsAknReYuTLsfHnrL@lists.infradead.org
X-Gm-Message-State: AOJu0YysbA8m9otYxbs2VA2o1/wwv4doVWKV1+FcwxxGLpiw7leY2sqj
	XThwXHtQDm8E6jPGc+nBuKj+wDJLMxrR6XRbaxG5ulQwlJ3/b8wzBMmvuoPvVtAPrl0yOwtzgWt
	Dh6PCmYCvJZgUqBv/h1N/ro0trw==
X-Received: from ioym2.prod.google.com ([2002:a05:6602:3142:b0:964:6792:360])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1795:b0:694:9a67:edf6 with SMTP id 006d021491bc7-69c942ffd04mr447091eaf.17.1778784209181;
 Thu, 14 May 2026 11:43:29 -0700 (PDT)
Date: Thu, 14 May 2026 18:43:28 +0000
In-Reply-To: <agQu9kLnbHjSni-C@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 00:57:42 -0700)
Mime-Version: 1.0
Message-ID: <gsntqzndbzn3.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 09/20] KVM: arm64: Set up MDCR_EL2 to handle a
 Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_114331_193396_ACB1996B 
X-CRM114-Status: GOOD (  20.76  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:02PM +0000, Colton Lewis wrote:
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 3ad6b7c6e4ba7..0ab89c91e19cb 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -36,20 +36,43 @@ static int cpu_has_spe(u64 dfr0)
>>    */
>>   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>>   {
>> +	int hpmn = kvm_pmu_hpmn(vcpu);
>> +
>>   	preempt_disable();

>>   	/*
>>   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>>   	 * to disable guest access to the profiling and trace buffers
>>   	 */
>> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
>> -					 *host_data_ptr(nr_event_counters));
>> +
>> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
>>   	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>>   				MDCR_EL2_TPMS |
>>   				MDCR_EL2_TTRF |
>>   				MDCR_EL2_TPMCR |
>>   				MDCR_EL2_TDRA |
>> -				MDCR_EL2_TDOSA);
>> +				MDCR_EL2_TDOSA |
>> +				MDCR_EL2_HPME);
>> +
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
>> +		/*
>> +		 * Filtering these should be redundant because we trap
>> +		 * all the TYPER and FILTR registers anyway and ensure
>> +		 * they filter EL2, but set the bits if they are here.
>> +		 */
>> +		if (is_pmuv3p1(read_pmuver()))
>> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
>> +		if (is_pmuv3p5(read_pmuver()))
>> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;

> Neither of these controls are of any consequence on unsupported
> hardware (RES0). Set them unconditionally?

Sure.

>> +		/*
>> +		 * Take out the coarse grain traps if we are using
>> +		 * fine grain traps.
>> +		 */
>> +		if (kvm_vcpu_pmu_use_fgt(vcpu))

> I think open coding the check here would actually improve readability.

> 		if (cpus_have_final_cap(ARM64_HAS_FGT) &&
> 		    (cpus_have_final_cap(ARM64_HAS_HPMN0) ||
> 		     vcpu->kvm->arch.nr_pmu_counters != 0))
> 			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);

I disagree but I'll do it.

>> +
>> +/**
>> + * kvm_pmu_hpmn() - Calculate HPMN field value
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Calculate the appropriate value to set for MDCR_EL2.HPMN. If
>> + * partitioned, this is the number of counters set for the guest if
>> + * supported, falling back to max_guest_counters if needed. If we are  
>> not
>> + * partitioned or can't set the implied HPMN value, fall back to the
>> + * host value.
>> + *
>> + * Return: A valid HPMN value
>> + */
>> +u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>> +{
>> +	u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
>> +
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)
>> +	    && !vcpu_on_unsupported_cpu(vcpu)
>> +	    && (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0))
>> +		return nr_guest_cntr;
>> +
>> +	return *host_data_ptr(nr_event_counters);
>> +}

> This helper isn't helpful. Just open code it in the place where we are
> computing MDCR_EL2.

I disagree but I'll do it.

>> @@ -542,6 +542,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
>>   		return 1;

>> +	/*
>> +	 * If partitioned then we are limited by the max counters in
>> +	 * the guest partition.
>> +	 */
>> +	if (kvm_pmu_is_partitioned(arm_pmu))
>> +		return arm_pmu->max_guest_counters;
>> +

> Ok, this is exactly what I was getting at earlier. What about a VM with
> an emulated PMU? It should use cntr_mask calculation, not the guest
> range.

True. I should use something different here.


> Thanks,
> Oliver

