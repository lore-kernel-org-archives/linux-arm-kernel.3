Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D12ACA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=; b=SbNbiy1ihFNqPc39dI2077zWp8
	6BfJaHIHLHcwINmInI+lYCLpxrvEEnVgeNKkMgwPtYYx/tn6rLUchVJRv3OPw2Yp6fNL5CDCKvNss
	alg/8KVoCeWRXQXsGKnyEUPtjT87SPF6wLhEKfLH9LSz4ib763W6y/cnsGiDSWCKnUyTSEMYFLakN
	N6Jq+gBpRiPcJDnB0eudVhwJMw8by5Ih5Lk/4iBLHl1PducxAaUKN4Tt2/AYJGfgZ9JtQ+Sb6Ytgb
	ZAXj97mAgy+kZUO6diox6Uac/EltDRgyjJCCA/tzHjFcQLV+yG/oass/o/HSGgMIA3p46V2DjLbuC
	eINLFd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDurE-0000000HV7Q-36Sl;
	Tue, 06 Oct 2026 02:24:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDurC-0000000HV73-0MLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791253480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
	b=AkBGYy5zhUpXNv6jCeKlBZIcQYZcDv8nWCqebRuA51PVg/alI0xdUhxTcLTj6hNIG2YBg6
	66DwdziOQOqcO58vFJzzSND4F/zN68Ca7E+OzL7pwGSrn+FDTJ09JeDrcTgvC+McCEPCBy
	boyPgPPTFrEmQovv078x6IGRE03pNVw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-urf_D1uhOOOWkjNzDmXwMQ-1; Mon, 05 Oct 2026 22:24:39 -0400
X-MC-Unique: urf_D1uhOOOWkjNzDmXwMQ-1
X-Mimecast-MFC-AGG-ID: urf_D1uhOOOWkjNzDmXwMQ_1791253478
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so2507146a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 19:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253478; x=1791858278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
        b=w42Adh8Rr5KxWpMWMnVcF8f/bxdAVTMYfAU71ea/J8NIy6dEEndCE234HodOlEEWQB
         7sYRiwTtB5aH5n/G3oaRGIXbFmVgrj98Zie/o4HRpa+kQMpYBC78Z7PshUvy4Jn73JOa
         2w3QV3BCwt+Ai/rFJShNW47YA4+D9E/e05xJP99FthbxpGmK1s94FrjIJUJIHzxLFG0i
         lKDTlwV9PsMoHLBU9uenB8Q3BGHEuk1C7SZYfLejYnYSMHNpom2cMV89NolAq0/IFo5I
         Ta67vK3XNzRiHdButyI5K83VJ3RS60esQudj738fKuge6nS3EmFpF9pFKndGmj3D6owb
         7Lxw==
X-Forwarded-Encrypted: i=1; AKwUvBwpRGW+fefrBo2ijMIX22JyVwKtWKJNObmoJBIQuTczV2aP13xsAqRiaeuc0gTyIZn6UsqTx8ehqh56fTjonm0F@lists.infradead.org
X-Gm-Message-State: AFq9FYK05vlrnmwKrVxksRBSxP1ICDmxAbUaLPCbPbEs67Vv6OPdzd8Z
	r5jwkoQvyz6njUfjrM0r7ezwXbZgMi0qXjJPGrnWcaTvZygCUJm3Ngi1HvQtx5NaAWrgh6zjJQb
	TMdFr7AejCAiZ8ZGei88kVx/wftrt16RqIgb7Fx947m7ER3ByzNbsLhx8aXp6ixzyaBjZEooSlP
	8m
X-Gm-Gg: AYBFou2l7jA/pRc79GhdjNNDSPbkXug92bV+HzhD513eQbMXCXHSKBjCi8MstCENHqj
	lACHwQ/+JmhTBALXY5vV8Nx08PK2FlGzG3qSHgZJ3kiGFOB8xHW6CwYzDbFfbOjaM4R3LmSs4XZ
	v1I8pBh64BE+so0hp6u3NjYJQKd2ObfyVemr6ACyUvlZH6G9gjFvd5m/zinalPCyAzQJl5cwpAd
	d02wqGeLiBGKsdAzDdjy1K3IxwWA3vN3S4Xxtt8hZ7sWotSh69YndL5D7FnM6kBdbSiGm3giByn
	LXPZ6WtDn3NYNn4qlZZAud0uvOUibhFefv2vkrsr9IjTiPbh47yD6ok3tDcJZzZBpuDdbs1amwI
	AvzmIVGbMbbwVrrhnujau7+n7jijxmrLJrSemknMiWg==
X-Received: by 2002:a17:90b:58e8:b0:3a4:9b8b:2ab9 with SMTP id 98e67ed59e1d1-3a6ce34d7f8mr8521726a91.8.1791253477863;
        Mon, 05 Oct 2026 19:24:37 -0700 (PDT)
X-Received: by 2002:a17:90b:58e8:b0:3a4:9b8b:2ab9 with SMTP id 98e67ed59e1d1-3a6ce34d7f8mr8521712a91.8.1791253477385;
        Mon, 05 Oct 2026 19:24:37 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm3352206a91.10.2026.10.05.19.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:24:36 -0700 (PDT)
Message-ID: <7f42005b-b840-4a5a-978d-18877bea3481@redhat.com>
Date: Tue, 6 Oct 2026 12:24:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 09/23] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-10-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-10-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ldNSD6_JMW4QphbyaaZZKNn98VAKxBewDzKvuHIdBz4_1791253478
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_192442_205881_656A8337 
X-CRM114-Status: GOOD (  18.55  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Prevent unsupported VCPU features for the protected VCPUs. Realms and pVMs
> not support 32bit EL1 or NV yet. pKVM doesn't rely on the host vcpu
> features and it clears the unsupported features while hyp_vcpu is
> initialised. Block the features early in the vcpu init if we detect
> incompatible features.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f31d31fa27ad9..9c2ef7ca6a961 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1668,11 +1668,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
>   	return -EINVAL;
>   }
>   
> -static unsigned long system_supported_vcpu_features(void)
> +static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
>   {
>   	unsigned long features = KVM_VCPU_VALID_FEATURES;
>   
> -	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
> +	if (vcpu_is_protected(vcpu) ||
> +	    !cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
>   		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
>   
>   	if (!kvm_supports_guest_pmuv3()) {
> @@ -1688,7 +1689,8 @@ static unsigned long system_supported_vcpu_features(void)
>   		clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
>   	}
>   
> -	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> +	if (vcpu_is_protected(vcpu) ||
> +	    !cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>   		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
>   
>   	return features;
> @@ -1708,7 +1710,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
>   			return -ENOENT;
>   	}
>   
> -	if (features & ~system_supported_vcpu_features())
> +	if (features & ~system_supported_vcpu_features(vcpu))
>   		return -EINVAL;
>  

The following check at the beginning of kvm_vcpu_init_check_features() is redundant to
the check here. We can drop that in this patch or a preparatory patch.

static int kvm_vcpu_init_check_features(...)
{
        /*
         * This check can be dropped since the same check has been done
	* by the followup "if (features & ~system_supported_vcpu_features(vcpu))"
         */
        if (features & ~KVM_VCPU_VALID_FEATURES)
                 return -ENOENT;
}

  
>   	/*

Thanks,
Gavin


