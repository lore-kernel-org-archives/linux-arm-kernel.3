Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C600C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 23:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEorSgFKgFJuDrUUhtFm3PBvl23oSWqfsEHani8D+OI=; b=eYz27E4fVTA6Y1pGinm87lUjeA
	PsV+eRaCwNrlQdUL/Zr2EvFJkbejcPyKnR/lFsi8HInn91FktO/zx2aBzPr+6u6CB9NC0cCF2+HSS
	IyskX/oBoaB4Z0neHA6XYmRYU0EFj7nAQd+D5mngSStCtAQcG70rrzPXWnRVfrMvqOkxf4tO4N4DZ
	jj5p7l2npqc2SMrG0/D/Z2YBaw4fFzT6DJodfH64IoHHTjuPhmOm1fd0lpNzcVi0hAqx+LusNylLv
	P4z6fXdD4u7n0U5RDtgmMmHNRfKhmnVDV1OOeH5RHjBdGOw7/cckQqba0tsBUK+N666cF98fb7SCt
	+lyRrFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tejNk-0000000EISg-0150;
	Sun, 02 Feb 2025 23:28:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tejMP-0000000EIIN-2wUe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 23:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738538800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEorSgFKgFJuDrUUhtFm3PBvl23oSWqfsEHani8D+OI=;
	b=RZY2n8TjMUIScnxBCZpiZcHESS79uoFdQYoQ0racPq7ebIhcp20DfzQ3HcsQd3H3nCct0M
	3TSkPX3hF1OElarSTEtJbCRU2N6FyfJE21Hlvucr8e84QsdGcveSXvVB+pfScz7teKYlmD
	niRruhCGdQPt1miFwznJLOE7RykY274=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-gppUA6XJO2-4e5UgUCOAzQ-1; Sun, 02 Feb 2025 18:26:39 -0500
X-MC-Unique: gppUA6XJO2-4e5UgUCOAzQ-1
X-Mimecast-MFC-AGG-ID: gppUA6XJO2-4e5UgUCOAzQ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2178115051dso81135005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 15:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738538798; x=1739143598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEorSgFKgFJuDrUUhtFm3PBvl23oSWqfsEHani8D+OI=;
        b=qkyNeecQPZieMwvmFTDM7VnZ9seC0QPQp9lhzjygo/Dgxtd+C9uyr6f9iHMkvf9PNq
         sSHOWIbyBcL+zCZdHgaEDH0K6bv/vj34HUYJCYKBLesu3ZATo0eQRKmDKuN2/QXi/nx9
         YqbtbZhHFaJfjaBlq0rEikTIKBO1jyI3/TFVBKCEK58+FlLaPZPkCfSnYpG/HDBUpOdM
         veW+vm+g6bFV5EHQaQu9RhGVaRY1FVTmc2YPx0BF5AGTKpKjnv+EHW7Iw7LF5a/yDtML
         hsb6QYZgleHz5PbL6/UOOJvaQb427GdB5l3v6Ef2Enh4kgY4RCczl0SPV7/f2md/oxqB
         xjmA==
X-Forwarded-Encrypted: i=1; AJvYcCWChMnknjc1qptRX6OK35ymnLZoF09VQkgH+JPnlLywbAHWPLjbH1qfzJMHgJGuuaufEsK6uXifd3vcDXs6s5kj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7R1E39FgY0MUTZ+QbYVNDgq9ct8TOK4kdDv88YRSdN8GeTbFq
	b2CyaWvhplKrLX5QPicTNMYAgoDK3nNAVmbzQgdsXn+4395ddHWU9Am16k/MSnSE7ayDjurZQRX
	Tjcl32BY3qKwyAttbjEQMg0sbo4JspVL4OgFGB1rfdMIKJCG6wNCaVAv+BXaCYIQY5YhdpqC+
X-Gm-Gg: ASbGncvKXvoEtC/Ur5HaBq5zlfC2gSq+6OGPmfRrmR1428GjvOLpxKULW78snM4rBIh
	IP9kSaSJ1LUL3yy+/m28ahuo0UAO/HraSQk+Rt3VUqdWmIM146Csv1HRCcbJnsZIMZBQNbndea1
	IzHSTXR17djG54/Pb/W1/O6q2emxlVLz/72RPQTdRaslpWkWMCKsDrPyeMtcmcarKwS2rlwzfda
	Ka5AX1VL50n4G9XNNHbueEKjzVJeYQC14Le0y7j4lsFlUBDl4pO3de9Ar9cOCfLsC86h70zFDCi
	k6RHNA==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21dd7dd88e6mr310304595ad.36.1738538798023;
        Sun, 02 Feb 2025 15:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfTk8xGUBI61+sXaogs4siFVAtjNe8wBT4NdlyuKENiA8v7HLfkeSD7O9+S9Z2x6jnkLdTWg==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21dd7dd88e6mr310304415ad.36.1738538797668;
        Sun, 02 Feb 2025 15:26:37 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3303472sm63313735ad.195.2025.02.02.15.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 15:26:36 -0800 (PST)
Message-ID: <b8b5501b-f5fd-44da-8445-53516cad8a3e@redhat.com>
Date: Mon, 3 Feb 2025 09:26:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 38/43] arm64: RME: Configure max SVE vector length for
 a Realm
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-39-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-39-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c14zz4g_T11UGAg0YeV2xtitYnC0IaAVZXAudgb3ZS0_1738538798
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_152641_829110_56189448 
X-CRM114-Status: GOOD (  26.60  )
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

On 12/13/24 1:56 AM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Obtain the max vector length configured by userspace on the vCPUs, and
> write it into the Realm parameters. By default the vCPU is configured
> with the max vector length reported by RMM, and userspace can reduce it
> with a write to KVM_REG_ARM64_SVE_VLS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/guest.c |  3 ++-
>   arch/arm64/kvm/rme.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 429c8f10b76a..5562029368c5 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -363,7 +363,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   	if (!vcpu_has_sve(vcpu))
>   		return -ENOENT;
>   
> -	if (kvm_arm_vcpu_sve_finalized(vcpu))
> +	if (kvm_arm_vcpu_sve_finalized(vcpu) || kvm_realm_is_created(vcpu->kvm))
>   		return -EPERM; /* too late! */
>   
>   	if (WARN_ON(vcpu->arch.sve_state))
> @@ -825,6 +825,7 @@ static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
>   		switch (reg->id) {
>   		case KVM_REG_ARM_PMCR_EL0:
>   		case KVM_REG_ARM_ID_AA64DFR0_EL1:
> +		case KVM_REG_ARM64_SVE_VLS:
>   			return true;
>   		}
>   	}
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 39dbc19e4a42..3116ecee37a8 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -297,6 +297,44 @@ static void realm_unmap_shared_range(struct kvm *kvm,
>   	}
>   }
>   
> +static int realm_init_sve_param(struct kvm *kvm, struct realm_params *params)
> +{
> +	int ret = 0;
> +	unsigned long i;
> +	struct kvm_vcpu *vcpu;
> +	int max_vl, realm_max_vl = -1;
> +

I would suggest to rename 'max_vl' and 'realm_max_vl' to 'vl' and 'last_vl'
since we're not looking for the maximal VLs. Instead, we're making sure the
VLs on all vCPUs are equal.

> +	/*
> +	 * Get the preferred SVE configuration, set by userspace with the
> +	 * KVM_ARM_VCPU_SVE feature and KVM_REG_ARM64_SVE_VLS pseudo-register.
> +	 */
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		mutex_lock(&vcpu->mutex);
> +		if (vcpu_has_sve(vcpu)) {
> +			if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +				ret = -EINVAL;
> +			max_vl = vcpu->arch.sve_max_vl;
> +		} else {
> +			max_vl = 0;
> +		}
> +		mutex_unlock(&vcpu->mutex);
> +		if (ret)
> +			return ret;
> +
> +		/* We need all vCPUs to have the same SVE config */
> +		if (realm_max_vl >= 0 && realm_max_vl != max_vl)
> +			return -EINVAL;
> +
> +		realm_max_vl = max_vl;
> +	}
> +
> +	if (realm_max_vl > 0) {
> +		params->sve_vl = sve_vq_from_vl(realm_max_vl) - 1;
> +		params->flags |= RMI_REALM_PARAM_FLAG_SVE;
> +	}
> +	return 0;
> +}
> +
>   static int realm_create_rd(struct kvm *kvm)
>   {
>   	struct realm *realm = &kvm->arch.realm;
> @@ -344,6 +382,10 @@ static int realm_create_rd(struct kvm *kvm)
>   		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
>   	}
>   
> +	r = realm_init_sve_param(kvm, params);
> +	if (r)
> +		goto out_undelegate_tables;
> +
>   	params_phys = virt_to_phys(params);
>   
>   	if (rmi_realm_create(rd_phys, params_phys)) {

Thanks,
Gavin


