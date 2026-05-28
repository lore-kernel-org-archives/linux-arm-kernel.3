Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F8CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 04:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWEMGPujLx2YkwfTu/wiSD5CRnNiDpNAFuXhLG9oPIs=; b=GynKcFTr7BJ2Vw8RVrij4SexDa
	JC1MFGV5m0YtqLb9brr+xi5JJJWETwDy30kQ4bQT7FVsSlexkXcuS1VJ/HTa7L7XJwBV68JDtmqTE
	iSAFZNfDkV3eHRPHxX4tFjk72yn/bg2aLmCUOIFqYx+j3iNfxakZ3L3wkB+S1UxmP35P3No7ncsHH
	ufjuI088PcYq3EpAYY81wD9Uf2AFf5laU9SBf/q3DSct14WGnDTmSBJHAs4RlcEnpn67gho4/Y2NM
	bAFVTIdPvLvGrzj7CRiVzt6EpU96cMrVNwblTFMiA0HeuNuk5oC/K6j54gaaVDggYiujd3ipSsY4+
	Tfy/u/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSS6C-000000055ug-1h3R;
	Thu, 28 May 2026 04:12:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSS69-000000055uL-2ydv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 04:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779941516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWEMGPujLx2YkwfTu/wiSD5CRnNiDpNAFuXhLG9oPIs=;
	b=BLXVqWWr/UOeJdWNCfgAo7X3+eeJdsp/GQpXxCeR4dfc2/YPQsAFftl5/XW0PdAYJLl1LJ
	GRxZXmcHERYvwt36zLc9N6krN+tXPMfj37cT87hVXmt1Fq1FOwJtiV4hlKrVGILTXROBh4
	NlW29QbVITEmv3CgW9Fg9bm9+jHYi8s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-uAXwlmPuMLO9h0H_ZhW54Q-1; Thu, 28 May 2026 00:11:54 -0400
X-MC-Unique: uAXwlmPuMLO9h0H_ZhW54Q-1
X-Mimecast-MFC-AGG-ID: uAXwlmPuMLO9h0H_ZhW54Q_1779941514
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso23323861a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 21:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941514; x=1780546314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWEMGPujLx2YkwfTu/wiSD5CRnNiDpNAFuXhLG9oPIs=;
        b=EW83gDkF6SC2lBeOZO6lVtieyrzllml0V9Hcj0fJuWEfLdJbH6VJfNc5G+JD683qg7
         SU6OI8tX8UPWMYXX4LGN6fkOhQSnpT9AnS/VCPZMdIMv0OZrtvuN1AycVgC3ZGyo7wDG
         6Dc4s43SuY8Q25wkb+OLsgY36hYP6TcUXUeeGQQjgZT9I4XEK0eqJ41HAVzzjPK/nqhb
         1dWUS6tcg7jfxsVvqTAXvqQ5YSOIx6RWVhex0EnOjPpungyRjC0P9cEqKZ0InchZAwsN
         Yu2AVhv7APpU/rHOdbqcE/s3xgX6fX8LWUbV/CjEf5g/OUdEDsCOYdblXpigF0NlPlC8
         aZpA==
X-Forwarded-Encrypted: i=1; AFNElJ8JkkY6YjWSU1HPqp3Nk0ZOEFeM4H8nKrhPY/JNcBuTjttBgSVlGdcQOUC4/xKMDjPf08gLtV7NHqMmj3yxFCjB@lists.infradead.org
X-Gm-Message-State: AOJu0YwwB3PutszAISbx6utEjHdLEScNpZtxmoFYBTrsccGdApinR5QA
	vLXPoh4phLRuR0V7z7u6n2DbuQ16+wc4sE4NfUAUdrfRBPRH0vH6FUTltJyAjposEr9sOOCA+Oo
	HLbcLZGDGSQOlhgmDwM5UpjxXYm4sqe8A8EWgYGYpy8l88pbHngQWkRGOf3pJw1A+zFtouXjfB7
	3g
X-Gm-Gg: Acq92OHfTEt3fFp6W4boJBrL6Ude0g2JgMJphIoBbzvB+ZnZnCcJrQLCOUzN5jFxSiV
	48aTKmg//0Wq6NX733Dt0n8izOQct7A5lNpphXM96MUhY1jOZMHNkk5iiUe1V1lMLmTCuLp6fSs
	dAzLlUmViz/fCYy0j9n3iwdHKUCJnOMj8apc0CdJt67dSGCROQT9xsKgPAZz1Dq4tcwxIC4vXoX
	kVeFHyEioxXJy61h7yXZ0cUfOlFFJ3YFeuGosMWhwKRfKiwceS1vrSLPlDc7d6H/9qGklCuCcEs
	Nb17E2Eu2byQA21/SkP7UUv9MJSeiEZoaDpmcfTlAJk7CN42dAz9NA8CFwhZ2GFsm0SHiUx0YAx
	71eFdJN5zEm1UIQ9C74wm9RsSSGb/5l8NaT4Liq0OXGzimqfQqZtc+rKvxra23XqfLI93wzgS0o
	4=
X-Received: by 2002:a17:90b:5447:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-36b71e64033mr3269512a91.24.1779941513623;
        Wed, 27 May 2026 21:11:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5447:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-36b71e64033mr3269490a91.24.1779941513150;
        Wed, 27 May 2026 21:11:53 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b908e15acsm409862a91.2.2026.05.27.21.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 21:11:52 -0700 (PDT)
Message-ID: <58143176-8311-4eb8-85ef-625c5249fd0f@redhat.com>
Date: Thu, 28 May 2026 14:11:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/44] KVM: arm64: Support timers in realm RECs
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-22-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-22-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jb4dZBOZRdoTFpqE1zbIl7WGGZ60KYavY2NtRWBKwxQ_1779941514
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_211157_825655_463A160F 
X-CRM114-Status: GOOD (  29.21  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and calling kvm_realm_timers_update().
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v12:
>   * Adapt to upstream changes.
> Changes since v11:
>   * Drop the kvm_is_realm() check from timer_set_offset(). We already
>     ensure that the offset is 0 when calling the function.
> Changes since v10:
>   * KVM_CAP_COUNTER_OFFSET is now already hidden by a previous patch.
> Changes since v9:
>   * No need to move the call to kvm_timer_unblocking() in
>     kvm_timer_vcpu_load().
> Changes since v7:
>   * Hide KVM_CAP_COUNTER_OFFSET for realm guests.
> ---
>   arch/arm64/kvm/arch_timer.c  | 28 +++++++++++++++++++++++++---
>   include/kvm/arm_arch_timer.h |  2 ++
>   2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index cbea4d9ee955..88ed01edc136 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -470,6 +470,21 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
>   			    timer_ctx);
>   }
>   
> +void kvm_realm_timers_update(struct kvm_vcpu *vcpu)
> +{
> +	struct arch_timer_cpu *arch_timer = &vcpu->arch.timer_cpu;
> +	int i;
> +
> +	for (i = 0; i < NR_KVM_EL0_TIMERS; i++) {
> +		struct arch_timer_context *timer = &arch_timer->timers[i];
> +		bool status = timer_get_ctl(timer) & ARCH_TIMER_CTRL_IT_STAT;
> +		bool level = kvm_timer_irq_can_fire(timer) && status;
> +
> +		if (level != timer->irq.level)
> +			kvm_timer_update_irq(vcpu, level, timer);
> +	}
> +}
> +
>   /* Only called for a fully emulated timer */
>   static void timer_emulate(struct arch_timer_context *ctx)
>   {
> @@ -1079,7 +1094,7 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
>   
>   	ctxt->timer_id = timerid;
>   
> -	if (!kvm_vm_is_protected(vcpu->kvm)) {
> +	if (!kvm_vm_is_protected(vcpu->kvm) && !kvm_is_realm(vcpu->kvm)) {
>   		if (timerid == TIMER_VTIMER)
>   			ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
>   		else

s/!kvm_is_realm(vcpu->kvm)/!vcpu_is_rec(vcpu)

> @@ -1110,7 +1125,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>   		timer_context_init(vcpu, i);
>   
>   	/* Synchronize offsets across timers of a VM if not already provided */
> -	if (!vcpu_is_protected(vcpu) &&
> +	if (!vcpu_is_protected(vcpu) && !kvm_is_realm(vcpu->kvm) &&
>   	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>   		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>   		timer_set_offset(vcpu_ptimer(vcpu), 0);

Same as above.

> @@ -1611,6 +1626,13 @@ int kvm_timer_enable(struct kvm_vcpu *vcpu)
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * We don't use mapped IRQs for Realms because the RMI doesn't allow
> +	 * us setting the LR.HW bit in the VGIC.
> +	 */
> +	if (vcpu_is_rec(vcpu))
> +		return 0;
> +
>   	get_timer_map(vcpu, &map);
>   
>   	ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
> @@ -1740,7 +1762,7 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
>   	if (offset->reserved)
>   		return -EINVAL;
>   
> -	if (kvm_vm_is_protected(kvm))
> +	if (kvm_vm_is_protected(kvm) || kvm_is_realm(kvm))
>   		return -EINVAL;
>   
>   	mutex_lock(&kvm->lock);
> diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
> index bf8cc9589bd0..ffdb90dcad58 100644
> --- a/include/kvm/arm_arch_timer.h
> +++ b/include/kvm/arm_arch_timer.h
> @@ -113,6 +113,8 @@ int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>   int kvm_arm_timer_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>   int kvm_arm_timer_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>   
> +void kvm_realm_timers_update(struct kvm_vcpu *vcpu);
> +
>   u64 kvm_phys_timer_read(void);
>   
>   void kvm_timer_vcpu_load(struct kvm_vcpu *vcpu);

Thanks,
Gavin


