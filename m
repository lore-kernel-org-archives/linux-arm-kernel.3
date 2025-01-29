Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0685C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++vP7Pzm+0U/vbuzpGurQDME6fn3ZbIwZpBgDGBaFV0=; b=cfDWR1Dh/Vw0QmBb/BT07mqyLi
	3z93ZkganQnjb//HbAmXKOVVUBujhHUbVjMAXO5J22B05qBphr8tooU3Q0Q3QqP9HMs67SwkzYGRQ
	FMx6MQfOtHosFpIDXmFi5zFH2mh5KbeSD6F2VaOfMh+0oq7ebnSIIgMleFa+x2S5agAuU3PLXaToO
	egvntKkrYV9X+pGGwJAF5mJ0Ge+1rEKdjZMTkDg4OCmSdFFetq5MyF0IOxgPSDD0qU00T9lWZ7eE3
	9HcmJixAnXNcYHLUqW0NMec0We1p1n3BJ7R8U5rRFvuIiI+lGQ+rXc05JDoaUt/BXX/wRhCCwdcEQ
	kcvjXeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tczOK-00000006I4n-1aW9;
	Wed, 29 Jan 2025 04:09:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tczMz-00000006HzG-1Lbn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 04:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738123684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++vP7Pzm+0U/vbuzpGurQDME6fn3ZbIwZpBgDGBaFV0=;
	b=Rrh/n6XU7ItbvWIgftxewQro92ODBzRepdcht7RC+u6GEQpJxFb0KRqYUM2Mb2qf7FVsIX
	wZasUVqjeUkWfxP5vKV5Kaq9XolQwfy/23J/qLhsRcXMfGXvT/TlL4tkFRZP1L86wVXlDR
	OHJUMUp9ImYhjSSdd0B6BZDgPM8uTdA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-wXqrzuUINiKj7EUSaWEg0w-1; Tue, 28 Jan 2025 23:08:01 -0500
X-MC-Unique: wXqrzuUINiKj7EUSaWEg0w-1
X-Mimecast-MFC-AGG-ID: wXqrzuUINiKj7EUSaWEg0w
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2162259a5dcso200628885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 20:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738123680; x=1738728480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++vP7Pzm+0U/vbuzpGurQDME6fn3ZbIwZpBgDGBaFV0=;
        b=jSjD/MlI/gcHaB+Y3cegIJ7E/cP2VxxfgoNTrR71cyNcZggyPWfn/AL9YqC4dx//Ga
         ilPsZgyaaTPMju/TEGS+Kcc+0BMI6S1bDnMBJc1NSOmIUGP8t8ciCU0LXolqxwm2Ss/v
         pR6z/iRgxGUBn8hzRbwzGKNPU6x5qWgMd4nw11JYhF6qm27t4gTrYY2R3srMWhB88lTA
         sYvANaNmUE/3fHEojRpUQl7VWIvMy+wchFPZULyxA2kO6DAhjtWnHb5J7GIp3Wi856Cn
         rJtF9w4V6P0p4JuURPHJl3zJcNWe7CPY7U5QQxCKk2eh3duZdsCRCAEs9eqadrTRJ+6P
         Q6nA==
X-Forwarded-Encrypted: i=1; AJvYcCW6hpO/steAKiCkIHPEnarAOgDd5jECX1aDKkRmei1zwhaT4QvOyzqsD6M/CJMdWQDpPxRP+zm7U3bUohrPnCSb@lists.infradead.org
X-Gm-Message-State: AOJu0YwIuRSAFjW6mccL5Ar62SfAeTbULBT7f8tF4otyQNZtae1ijXp5
	Z5sJOQ6qKjehKI1QYRSgkJQQJ4CbfCOMJtuLpm/uknVGg1ajZU7gK+WwrSZG+y3FxLSZiF3FSuP
	Ff5I7SFJ9xeO/kkG6HX/atQQ3bQdxiOa64jKUomVY/ucI0XiQYFoW5rqtT0agyWnBNNc17Rsf
X-Gm-Gg: ASbGnctL97yeLSPYNxUgaDySBWuZjG81kP/kTZi8HXGyC1/k9FGFkE6u3ujteqG4mRs
	FS4VA46K+RUu/jKrJxIhicvSww2wvL/O5NdXvRo9QwfevLQdw58ujDc5iOtr7XrXB1Cpv5X256g
	zXTWclB6188Yu9sJ4ALXGPQpPL4UELy3gDX1cU4LVD+/dzdWjU7L5+FUKhd0CQLuc7fOk/88sRY
	m/ORBxICkrzqCeMGHLXUPbi33Hp3ycfpxz+GLbhMpKTV9eyG47z90yvBogscCa+hFk9Rsci5DtA
	FPdLpg==
X-Received: by 2002:a17:902:ce01:b0:215:3a42:dc17 with SMTP id d9443c01a7336-21dd7c4c298mr26327425ad.7.1738123680329;
        Tue, 28 Jan 2025 20:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQIoq8D2QaYFpzEq5kL3xdCHIiITAzdgGLjBLAtD4+BnGQNR/G88wzSm8jyqJiShrpZVo+NA==
X-Received: by 2002:a17:902:ce01:b0:215:3a42:dc17 with SMTP id d9443c01a7336-21dd7c4c298mr26327115ad.7.1738123680051;
        Tue, 28 Jan 2025 20:08:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da41415e9sm90098135ad.116.2025.01.28.20.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 20:07:59 -0800 (PST)
Message-ID: <a580d287-2fb0-4e9d-adbb-57e4dbf25765@redhat.com>
Date: Wed, 29 Jan 2025 14:07:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/43] arm64: kvm: Allow passing machine type in KVM
 creation
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-11-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-11-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oR--CeWAfdExkPOsuZ6HKHNml2h-Auxex7Sh37Gbnvg_1738123680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_200805_442697_E13A929E 
X-CRM114-Status: GOOD (  19.11  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c     | 17 +++++++++++++++++
>   arch/arm64/kvm/mmu.c     |  3 ---
>   include/uapi/linux/kvm.h | 19 +++++++++++++++----
>   3 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c505ec61180a..73016e1e0067 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -207,6 +207,23 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
> +		return -EINVAL;
> +
> +	switch (type & KVM_VM_TYPE_ARM_MASK) {
> +	case KVM_VM_TYPE_ARM_NORMAL:
> +		break;
> +	case KVM_VM_TYPE_ARM_REALM:
> +		kvm->arch.is_realm = true;
> +		if (!kvm_is_realm(kvm)) {
> +			/* Realm support unavailable */
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);

Corresponding to comments for PATCH[6], the block of the code can be modified
to avoid using kvm_is_realm() here. In this way, kvm_is_realm() can be simplifed
as I commented for PATCH[6].

	case KVM_VM_TYPE_ARM_REALM:
		if (static_branch_unlikely(&kvm_rme_is_available))
			return -EPERM;	/* -EPERM may be more suitable than -EINVAL */

		kvm->arch.is_realm = true;
		break;

Thanks,
Gavin


