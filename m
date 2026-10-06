Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C85DCA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=; b=ShJUG5xjNRGb4NdliQqLBePaxX
	rG5OG7xH14e9MZKIKdp9rF7XB18nj40+YlunXRFzXt0eHbh62ISszhjBeLkjTRB2GKkzsJJfPLJWz
	imW5ngLcrr8s8DWSwA+GwRuyhqM9rrK1gBwJ8jbpqzM8ksyoRRBQjOr0vMJPoXH3rvt3Rw+hJVQS4
	VaNCBFgrg7OHCJLa/L5Bswq4wqCYUzeukQREhN27cMbpEKynJR+awZx5NVIG/4a6zbNVaI9gyg4Oe
	HyskX6OP6Nrdtz1iJ1DcoHzebkOsX7duk3XXu+NqdrGQzqYkfpMqV4A32E+Gh1UlOzJmqmS/0bPGb
	x/Zs8v0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDus3-0000000HVCa-3uST;
	Tue, 06 Oct 2026 02:25:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDus1-0000000HVC1-2QfG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791253532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
	b=Wtl6uyeeCg8FZENGFwUCfPmHeF4+CzCWPYudtizeDTzT83cKjsprIfbLfurkfqemRqr2pm
	pvW/HZBOp0ztOjgmkMO4pkoBGcN/j2txYKkfGZBQGWdQTt13w9wvr5Tla0/LFrswdfq1mN
	T6D6JzpeLRhlFLtz7wbYs+7f4iiae+I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-eqBuEhv_Of65Zyk6mTkBkA-1; Mon, 05 Oct 2026 22:25:30 -0400
X-MC-Unique: eqBuEhv_Of65Zyk6mTkBkA-1
X-Mimecast-MFC-AGG-ID: eqBuEhv_Of65Zyk6mTkBkA_1791253529
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a85a33333cso325607a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 19:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253529; x=1791858329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugMxefZ1qIEDU/oRAsn8b/LDZMC+9ePrF31NK37FBF8=;
        b=SyUoceRi3N8mPEE/L71cUxrRqv+uYSh55JzQEBM8MgEB8OBl4NDYPRcLluoBJB0FNF
         ejVnS1WSfqnmMVbELykOFyF+otHyfdvCKgArXu9W6h8uE21vJWfFlUNVmWw1O5u2V3sq
         k4XHv8u+sg0Pdc7zwU3zmEC/rfeI5m4zoROBLgB02zKHNFvVo23OyzCVADTa51vr0/zW
         lJV0V6QmkycOKymw+feH8e8r2o+eoi7o3vyIwNCetTNo9S/8luigY/fiVAYCSGiN/pEH
         sarOIV/JniQlh1ISaoGbFLiGBzEe/ajdPE6CTWKxgVZwQU/mDYhru/lgV0hBe3xwZaH2
         EXdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVQQfX6WZawltTe+Ub3JXpyUYil3s8msjEha+hAubkKa/Exsn7GV/jf3aWQm2p8fvPLNNLznHHXH03TO3lHDNr@lists.infradead.org
X-Gm-Message-State: AFq9FYKepBokWaOPoEGOo8Ua+RlkRIuCLs+R9OG3yvMQRbFR4gXArgBQ
	6UCRcCwDakDTeKiHkvL9TYOyFjzN1PQwtqYVIX4f/+s06bVeUfpOT3nMxzYaC3TgmPMSpISGW4i
	WUfm2Luwk/VQpEggD+O0Hp3cOJ6QaUV6DZPZLJGQh+vAZeUjvwhK0XNoZ8NQdTc5G/xqp8w4GkM
	08
X-Gm-Gg: AYBFou1u4WlS6cf2suZeHKsqUYhxqc8iBjku5BWtrBL3vf7Q4pRQFcRGzKd+ee1xapB
	FuvHdZYTI488adtuP5WMJSMkvDfRwnkfkHC9E7u1l/4bWr24lg4AfZbUMpxLlg7pEk0TuWrNKEQ
	7C5Zd6KQ+vbXGNWtUF1NGUQ/J55olw4ajaBwZ2aC0IY9JRdcAZXUSlCEMe2l2RPibjflE6KTJ2g
	Xh87baQUEfySoA+tHsS7ms8JpG8DnnLl4OyqVnc522leLFiYBAImQhr5Bh9gvV9ySZE7QEsnbL9
	RVidHGAFxiCzUMCRB+I63x0ExgadLYiayNpEKSvAOp2p+4jJlFYwj0yFyJBWv9K67Tvx46/iBmk
	bE3t3R7TcEvakIRDbWPoTDMLGUSwU+b6p0XaaXn0QZg==
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr4459081a91.33.1791253529333;
        Mon, 05 Oct 2026 19:25:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr4459071a91.33.1791253528874;
        Mon, 05 Oct 2026 19:25:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85388c664sm2351690a91.4.2026.10.05.19.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:25:25 -0700 (PDT)
Message-ID: <32c662e1-0de9-44a7-81e5-2b1e6c824114@redhat.com>
Date: Tue, 6 Oct 2026 12:25:15 +1000
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
X-Mimecast-MFC-PROC-ID: qQdvVfwS1sfE-hjrD5VGV4qSVX6EsO521nYh5uNnzuI_1791253529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_192533_693943_BD73CDF5 
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


