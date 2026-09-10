Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7DDC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=; b=iBM+ahc0nFUzcrA3YJdriB7RKR
	HB5KBlRuAO31UL9bM8tePfphqyWH9OG+JSFnSEV3TAcnhy/BFf3ID/YgKXMZjvmv/S0y/ZoQgoVAV
	eMuFIZIpw5lMdohvhcC1ZcJK7pHUPk28k74EPiRJD5vZmOCuI/uuxn8yLS2ORGtPhFB3aqsPkUiUC
	kmIxWnCaF1D7QH721Sif49xEAQQs/9BGhQQfNnC86uhN2RvlHt6cUJdj+zscBcALHplT4JkFok84B
	Pf+8KNap7C1A9fk44wRvMAt+Dl+noccTc0yooHOrnPQK7VyryzHTJoPCSFeAdoQtP26xGPu7Gj4H4
	wg5JNtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vxa-0000000DKoG-2Xy5;
	Thu, 10 Sep 2026 04:00:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VxY-0000000DKnt-0N54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789012822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=;
	b=HHeQhTIkmuESr+NZ+XPjh4G34hLdj1MTWpnRxq32YTmByWxGJWnwC7pcMXspxadyExJIj9
	s+VX0lwKbg2DIBZQp6GztmQ9+NRu/nAuMGi2RZwYWqyO/LmqChsIo2YOEfDhcq5FHZ8V4r
	5zN2I4m98SRAD9ClaZm6xgzsP59zakM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-WO1pldVBMXu1MiljuBhLOw-1; Thu, 10 Sep 2026 00:00:20 -0400
X-MC-Unique: WO1pldVBMXu1MiljuBhLOw-1
X-Mimecast-MFC-AGG-ID: WO1pldVBMXu1MiljuBhLOw_1789012819
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so114470595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 21:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012819; x=1789617619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=;
        b=fMYD4D1l4rLFFjJahWFV6o13sJryLCSiCN8mfkVqhr6ldw4tnzS6im8ufDG37sGqZk
         Kj3eh+CHzqcIjwu5gS3l192N2QgPtHsbP6PVrecpE4xDYVvYi5+XjeJY7toUOwGDPhp4
         7EJ6ZRbsElbB/Hd1CvZkgRiFd2dn4EZ/8Uisy0p02wClphXudzTizR7d94HbGSqontXx
         0TSaYhSOwGkG8p+4FcfUKDi/FVZC9tzQQ3nALKDHog6QqMsQo3f4M7J3yFJlzmBVOw+f
         BdU1yYPQzKyueLcyeUjNu3QRXloffQvyXv7oXOctEuqBNuV4C2NCBO687MARUeuVLNRS
         uKvA==
X-Forwarded-Encrypted: i=1; AKwUvBxi2RSgoQV5pn8D2Hhk+q0Zyee+fuBtm0eTjXNQubm2ZkbkCT04NTPsiKsdNfyGuU/uZ7HA3RskRpuRuFxuP1Qr@lists.infradead.org
X-Gm-Message-State: AFuF++kDWxFkUNefY5KSuAy5vJPUbU7AYDwwh/Kcg9uYPB6vgtoTUyyy
	hSGU3LH9NN35Yi7UhBq0MHozRpcQXnKIxwokI5azn+Qrt2n5k+GJlwXu92N6oCc+r+rWCsCS1qB
	mtol+NSeKCWRENl7LtqpcEAgByjM09f1u6UTYcGoToVPmUqn8mgVBv+Ovv6rz/FMLWmIwo0Syuw
	lv
X-Gm-Gg: AYBFou0tuF+09Cgn/6+a/biTIn8pG9HE1MQRr+GNrcwelbvA6PNsIJ3VVQTnRLXzhmA
	NtmXGVdWtKsiTCXHC7QPOj0dsK5iwu8uD8GtaSoo9hYqSqfNdJ5x7WtBei1EYmvEoeZT1XKoLxa
	UTQ/V6Qobp7cvDVi6go9Kg+LvARGcXCPVHImwNtBQ0edXVpjHb26FuiJqICcPYzWCZ0dDXKwqhx
	VDVeTgN0pnlREgr0rjFr4eAk3f/XZjw745H5wka+V+elY8LujXzmaQXriG4op6zj+gjzVW/40VZ
	aLFjpa11L6XOyoQKnNbQzILov+v1DQ48BaIBmXCTf+IAVbcVKZFVbe1C0nIUDb09OcozhKjfc3/
	rryPiD2XlQdCeBQouc3l1VkQcEq0T1Mxj7LmC1Ri4MA==
X-Received: by 2002:a17:902:ef44:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2db1259d1f8mr542225235ad.14.1789012819322;
        Wed, 09 Sep 2026 21:00:19 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2db1259d1f8mr542224465ad.14.1789012818867;
        Wed, 09 Sep 2026 21:00:18 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ccf2esm82468805ad.73.2026.09.09.21.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:00:18 -0700 (PDT)
Message-ID: <a0c5c373-b5c2-4ad2-9e53-ede58c392972@redhat.com>
Date: Thu, 10 Sep 2026 14:00:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/20] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-5-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-5-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Jc-8rimTugQOQYiNIoy81XxaMj-iyW3Ybk1zyWh5-0_1789012819
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_210024_226250_495399F5 
X-CRM114-Status: GOOD (  21.65  )
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

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Based on a work by Marc Zyngier
> 
> To keep the VCPU load/put handling cleaner with the different kinds of VM types,
> we are about to introduce VM specific callbacks to do just the right thing.
> In preparation for that, make some refactoring to add the change easier.
> 
> No functional changes intended.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 46 +++++++++++++++++++++++++++-----------------
>   1 file changed, 28 insertions(+), 18 deletions(-)
> 

Nitpicks below, none of them are introduced by this patch itself. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 67f1ff9bc4fbe..51fc651267157 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -683,14 +683,11 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
>   	return single_task_running();
>   }
>   
> -void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +static void vcpu_prepare_mmu(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_s2_mmu *mmu;
>   	int *last_ran;
>   
> -	if (is_protected_kvm_enabled())
> -		goto nommu;
> -
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_load_hw_mmu(vcpu);
>   
> @@ -720,10 +717,33 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
>   		*last_ran = vcpu->vcpu_idx;
>   	}
> +}
> +
> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_should_clear_twe(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWE;
> +
> +	if (kvm_vcpu_should_clear_twi(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWI;
> +}
> +

It seems FIELD_MODIFY() can be applied here if no visible constraints exist:

	FIELD_MODIFY(HCR_TWE, vcpu->arch.hcr_el2, !kvm_vcpu_should_clear_twe(vcpu));
	FIELD_MODIFY(HCR_TWI, vcpu->arch.hcr_el2, !kvm_vcpu_should_clear_twi(vcpu));

> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +}
> +
> +void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	if (!is_protected_kvm_enabled())
> +		vcpu_prepare_mmu(vcpu);
>  

I think we probably try to depend on kvm->arch.vm_flavor instead
of !is_protected_kvm_enabled().

	struct kvm *kvm = vcpu->kvm;

	if (kvm_vm_is_protected(kvm) || kvm_vm_flavor_eq(kvm, VM_PKVM))
		vcpu_prepare_mmu(vcpu);
  
> -nommu:
>   	vcpu->cpu = cpu;
> -
>   	/*
>   	 * The timer must be loaded before the vgic to correctly set up physical
>   	 * interrupt deactivation in nested state (e.g. timer interrupt).
> @@ -736,19 +756,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_vcpu_load_vhe(vcpu);
>   	kvm_arch_vcpu_load_fp(vcpu);
>   	kvm_vcpu_pmu_restore_guest(vcpu);
> -	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> -		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> -
> -	if (kvm_vcpu_should_clear_twe(vcpu))
> -		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> -	else
> -		vcpu->arch.hcr_el2 |= HCR_TWE;
> -
> -	if (kvm_vcpu_should_clear_twi(vcpu))
> -		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> -	else
> -		vcpu->arch.hcr_el2 |= HCR_TWI;
>   
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
>   	vcpu_set_pauth_traps(vcpu);
>   
>   	if (is_protected_kvm_enabled()) {

Thanks,
Gavin


