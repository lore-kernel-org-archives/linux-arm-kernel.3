Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB4C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTFtgQvUStCLWm58c+Cl1OhMJYhsO+XdoCxoo3JcEgE=; b=UwCl1UV6MHNiTUZyYh3haG0nAR
	50IVFsNPc7XoTA/7Rsj2qs/xAwJcLHsaDPAIjy0oYw6zLjMdiuGeGoQRwqTGB+mA3XbPxNMJdZS95
	FPEYdm6e1bWKt7GgZoMEwab08q+VxM5zdkn+fW6u79+dOVpF+Fxc5hELXlrTzY/9DuDGc/4iCr0Cz
	eoHNx2OrV2GVAgLezX4QGjNU4dCu0RPU9ygAcOwxg73i/KxrQVpUBlgq0QoAaDfmsP9NNv5IOXj/J
	mK0/RVAOKIpMqoAb2+XdychfcOKIQrwqzWnaCHVEZ+eauNlhv/7vuzeiyme7tYqAfPFsTZ5GFhBI3
	OzDCVhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKkv-0000000Ecd1-39SZ;
	Thu, 01 May 2025 03:38:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKj2-0000000EcWv-1eLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTFtgQvUStCLWm58c+Cl1OhMJYhsO+XdoCxoo3JcEgE=;
	b=Xl+dQFBU/S0V9zv1+J0sxOeNcpVNkv5IPsVBRiDEuOj/KI2/fC9VFxI+AdH/8/WNZumecU
	VxpmfGvcb7u7vX/pA5Cu62Y+h9TGlapbbJQtf+nnIU6HrlxAaUj9rvnNC7kn1M3X632/uQ
	8makPYzzQMhgDWCfk5u2wm1+FQmnmWo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-p1MNEonNOtySLYmYx3tMJA-1; Wed, 30 Apr 2025 23:36:35 -0400
X-MC-Unique: p1MNEonNOtySLYmYx3tMJA-1
X-Mimecast-MFC-AGG-ID: p1MNEonNOtySLYmYx3tMJA_1746070594
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227ea16b03dso7755305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070594; x=1746675394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTFtgQvUStCLWm58c+Cl1OhMJYhsO+XdoCxoo3JcEgE=;
        b=l14Sd6zjH8BY4JjxHq9jw9jaXaIJoLJsH/BEQDtBytA+cS+uA8GDrCwWq6nVG+RPs2
         b4cN+COoT3UGQ41lcAUHEHYomy8BuOyUJNOqQXWtRk1i3wWM0E4QShE2p30QPdK/jQav
         S5e8ACOei48nPOPkmdGLBkKAnDZIvUYPxl5s2Btebk4CUj0CY8g4f/f7BJ6I6JRliqdl
         Zl0tXF+1myfbwbS3gPTbo2rEY+kEyo37TpJmnGXQc/qZZJYgJsZDcW5c1UoLXa2BfjKl
         hyBVIHZz9d1mk0mv/+OwcCEMLJrYv2f6chqBcANlhMemJVDM6wc1M7C6r9v8iWCjrteR
         tuPA==
X-Forwarded-Encrypted: i=1; AJvYcCUGMivMp5lekNr3d0WEo//gWaTp66f7v/PSuEKWH1ds/QJHq5cYzCgllxa7Giqn8Ilmy7SVP117qjuOwBUCC80m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt4nG7hmRRdchTS7OTgzDArpZ8ZU35lxYx7LKJDMoMW9z7mtQK
	igBCgsdWbp1khp2jTysz+TLHk+OKxvwvAOpDC3yaugq3dVf0tLqpmqYSFiqOtLiyMtcwxr5q1JN
	vUf1ZQES5gCVLuEjHMCP40+DdNI3PXSVm1r8ExgXcluVjk+KqYUTeekvElOvGYyXdS9joNi6e
X-Gm-Gg: ASbGnctGyMqfoR1494iq5WKTMOSy5fqdYOQGYbrsRinXB7VrT6alwZ8K4U6u9JQTTR1
	8C9IJRnotHekT1wrXgQbAr/NUqEpRgd8sNjqnKIC1yKrGKwOAI4rbOv1dRfnOFBRYXBqAKtpu58
	BOM0HBEaUQoyB6gzPdhoWV+xtjixUAgFbbh31TtvtVC8jVUCVdRHsNtca7uQqkCrGFu71lXzQmw
	A/fZSRlX/LL/tf0eePGAIbB3GWJON91gs3LwApMtZi7d1kyJ8d+50IitTqACCGNT2m8i919Swm7
	nVS45Qm7YQ04
X-Received: by 2002:a17:902:f689:b0:21f:564:80a4 with SMTP id d9443c01a7336-22df5821f58mr76534785ad.33.1746070594067;
        Wed, 30 Apr 2025 20:36:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRVQ709s9NlHNG/57ZQ0bX3xBINvQEcZ7cw6X19Wk71uY6m4FTQDBhudqbvsTzqwNROwGOtQ==
X-Received: by 2002:a17:902:f689:b0:21f:564:80a4 with SMTP id d9443c01a7336-22df5821f58mr76534535ad.33.1746070593712;
        Wed, 30 Apr 2025 20:36:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm130469695ad.180.2025.04.30.20.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:36:33 -0700 (PDT)
Message-ID: <19ec5533-ee10-4670-a9fd-da1345a6946a@redhat.com>
Date: Thu, 1 May 2025 13:36:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20250416134208.383984-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AHMXgDgy8mvATDCEBcV_4MT8h7Aog9LHGZq9_CdnkLY_1746070594
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_203640_521603_600BF15B 
X-CRM114-Status: GOOD (  22.21  )
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
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c        |  2 +-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 

If I don't miss anything, it's not enough to apply the filter on reading and
resetting path where sanitise_id_aa64dfr0_el1() is called. id_aa64dfr0_el1
is writable and it's possible that QEMU modifies its value. Afterwards, the
register is read from guest kernel, which will be trapped to host and the
modified value is returned, without this filter applied. So I think the same
filter need to be applied to the write path originated from QEMU.

Thanks,
Gavin

> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index f786fd978cf6..09cbb61816f3 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -94,6 +94,8 @@ void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   u32 kvm_realm_vgic_nr_lr(void);
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
> +
>   bool kvm_rme_supports_sve(void);
>   
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 297b13ef1729..0c358ce0a7a1 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -87,6 +87,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>   	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>   }
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> +{
> +	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
> +	u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
> +	u32 ctx_cmps;
> +
> +	if (!kvm_is_realm(vcpu->kvm))
> +		return val;
> +
> +	/* Ensure CTX_CMPs is still valid */
> +	ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
> +	ctx_cmps = min(bps, ctx_cmps);
> +
> +	val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
> +		 ID_AA64DFR0_EL1_CTX_CMPs);
> +	val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
> +
> +	return val;
> +}
> +
>   static int get_start_level(struct realm *realm)
>   {
>   	return 4 - ((realm->ia_bits - 8) / (RMM_PAGE_SHIFT - 3));
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index de7fe024dbff..36e22ed84e7e 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1844,7 +1844,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>   	/* Hide BRBE from guests */
>   	val &= ~ID_AA64DFR0_EL1_BRBE_MASK;
>   
> -	return val;
> +	return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>   }
>   
>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,


