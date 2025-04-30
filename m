Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B287C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIGWFGarGyFIijKMOzGh/uSVQg6azY82PqS3bKeu+Kk=; b=Tf16Wc7osyE1bjlGdnlPJhvHdH
	A/+uadyasHcwl4JydSBp/jHQkxW/AX1Nwuw3qOjk/HUJQxmn2m3N7VxFER6CcquPzJLOqt8cJlJf+
	tIJCVdx97OuxAKr8WpuURLO2+1DqqdksThkGDUsCQKodlgOhHuA/Zlr/91lqIMlINNBV3FZN3Lma+
	uBO94RGjj69rzWT16zkedeqoZETGNLMJMo4RoPW9qflNqLobHE9UFA/G5varPrqSh1uiCpZKeEjRA
	aF6uBt4IjT3L9giK9NhKoCPkgYbEWWkW1lI0YaW8xxi2OUrjxv/IOvlXzxP+eNPrqtgEsgFBvHtAL
	UdIJe6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0db-0000000BpZl-0Gfq;
	Wed, 30 Apr 2025 06:09:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Oi-0000000BnqB-2eZr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745992459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIGWFGarGyFIijKMOzGh/uSVQg6azY82PqS3bKeu+Kk=;
	b=hZwUs5rWgk56EPiga55icA2l4rDrSxK2Db74ZHyyIwn01rgLnJETFFYfg5Z05IDGOo3H/Z
	R9WuQcLKgCDqg+3sPFZlGE8fXJHbhgf50QNUtsjcsBokeNu9roPy/4++Hen65v7m42lH+u
	LMaRgglVaxMgispzxKwcsMQXO/ILlqY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-R7anw_zoPgy5twSpW5ttEg-1; Wed, 30 Apr 2025 01:54:18 -0400
X-MC-Unique: R7anw_zoPgy5twSpW5ttEg-1
X-Mimecast-MFC-AGG-ID: R7anw_zoPgy5twSpW5ttEg_1745992457
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b431ee0dso5121886b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 22:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992457; x=1746597257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGWFGarGyFIijKMOzGh/uSVQg6azY82PqS3bKeu+Kk=;
        b=qIUdHQD6vKDfd+igx1O4phVNPfTn56OYYBzb0m5mbMbjMjHKZ8csJ75W2LHLH+DvgH
         +vgK+dnp/zgndv/cSOjjbq+8EJ6aSONrPIFxY9AT9kfbySWhxhLmcL2cr+x1x1vPFq/U
         41Ys8w7JD5HLHR918aW8ZCIEtFTF4PgVNibOoDENNCn8kG9A5Q5g2TNQhFqp32hlUWqP
         wwkhtpCMMtRvf9KObiwrf0vPliX/YGdtWsldbGx45ZJn7nYzNk5S0gIyXpuA2EVqwPX2
         CL/D49ycANPJDHCe+dSiLABvBOnJ6BEmaHX4Lj1RrV13gmu95ZLixLI4pgM8rZhPB2l3
         IB2A==
X-Forwarded-Encrypted: i=1; AJvYcCVv0pP2J+/8GDMz7jusYZSkhILHOl6SEgBiI3y+6E27RYkGWwLy+Riux4Qo2daPvYcqarhCfypr4ZIdCuDlf/jf@lists.infradead.org
X-Gm-Message-State: AOJu0YzJInIJMLDMGyPaUiAxZCslo00UE4pnmln04t8u37tKaEgLrVcg
	x56hyecezzazmPjhqChGMOPd9QZ595n6uvJOWm4b8tG54fGg51gKCl3k0LcDqtYS+SNrpafnCK7
	ugrNcrXq6c8gkHCfe/q5o2DQSQ/w90xqhJG7jWlCjUzCb5M0SRbD7Y+Vx2BUdNWwN9c/4a0q9
X-Gm-Gg: ASbGncv1TIb020lWy/8lv2wb/ZSPZUjAmIKFQbUdz+2EkgfmsJLV401lRRWsdLFXaFC
	0vD4wCjW5XwQAej/pu1V5giiwLtJ7LQPXoVNz7/0Bqt0TQz37SEbltJersd9y9U/UsoG8D7lZ6A
	T+ySk7R29266LDTDTY5arNLIDM0QsD5aJuG3BOdcFBHrr26caxniVEk5eUi9L9agR7MQssiEezz
	cGJq0z0iGzPSqdbTnJaxO/fs8eYxsHv0vg7COYBW0x3tdkYYNhPT/GKgHTbHq39fJyUbvPRaFiX
	FJIYNJIvjuFa
X-Received: by 2002:a05:6a20:6f09:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20a89a00bbcmr2861329637.36.1745992457138;
        Tue, 29 Apr 2025 22:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUXFSfIAhV0jE/BzfNUpot5jDexa8qPOr5xBP2FVKQDAqbgwsZM0ilxjtUmRqioxNOvLSyig==
X-Received: by 2002:a05:6a20:6f09:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20a89a00bbcmr2861303637.36.1745992456803;
        Tue, 29 Apr 2025 22:54:16 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a94aecsm792360b3a.178.2025.04.29.22.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:54:16 -0700 (PDT)
Message-ID: <dda34de7-703b-4d9c-8666-c1a195327f32@redhat.com>
Date: Wed, 30 Apr 2025 15:54:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/43] KVM: arm64: vgic: Provide helper for number of
 list registers
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-13-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-13-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 07SnVKMIDn1EdBY-PfF9m5P8_EQD9I-c3Vp73Nd8FqA_1745992457
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_225420_752890_4F4ACB8F 
X-CRM114-Status: GOOD (  21.61  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> Currently the number of list registers available is stored in a global
> (kvm_vgic_global_state.nr_lr). With Arm CCA the RMM is permitted to
> reserve list registers for its own use and so the number of available
> list registers can be fewer for a realm VM. Provide a wrapper function
> to fetch the global in preparation for restricting nr_lr when dealing
> with a realm VM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v6
> ---
>   arch/arm64/kvm/vgic/vgic.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 

With below nitpick addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 8f8096d48925..8d189ce18ea0 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -21,6 +21,11 @@ struct vgic_global kvm_vgic_global_state __ro_after_init = {
>   	.gicv3_cpuif = STATIC_KEY_FALSE_INIT,
>   };
>   
> +static inline int kvm_vcpu_vgic_nr_lr(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_vgic_global_state.nr_lr;
> +}
> +
>   /*
>    * Locking order is always:
>    * kvm->lock (mutex)
> @@ -802,7 +807,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   	lockdep_assert_held(&vgic_cpu->ap_list_lock);
>   
>   	count = compute_ap_list_depth(vcpu, &multi_sgi);
> -	if (count > kvm_vgic_global_state.nr_lr || multi_sgi)
> +	if (count > kvm_vcpu_vgic_nr_lr(vcpu) || multi_sgi)
>   		vgic_sort_ap_list(vcpu);
>   
>   	count = 0;
> @@ -831,7 +836,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   
>   		raw_spin_unlock(&irq->irq_lock);
>   
> -		if (count == kvm_vgic_global_state.nr_lr) {
> +		if (count == kvm_vcpu_vgic_nr_lr(vcpu)) {
>   			if (!list_is_last(&irq->ap_list,
>   					  &vgic_cpu->ap_list_head))
>   				vgic_set_underflow(vcpu);
> @@ -840,7 +845,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>   	}
>   
>   	/* Nuke remaining LRs */
> -	for (i = count ; i < kvm_vgic_global_state.nr_lr; i++)
> +	for (i = count ; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)
>   		vgic_clear_lr(vcpu, i);
>   

The unnecessary space before the semicolon can be dropped.

	for (i = count; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)

>   	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))

Thanks,
Gavin


