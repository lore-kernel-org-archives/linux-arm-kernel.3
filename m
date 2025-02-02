Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF05C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 02:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSlKml/+kejUBtq+rKq08KSBVq8nnU94jjP3M+wY8SY=; b=CDrsFhDx8KHojs0adM4g2E3kjX
	wlHjmmHo/76RAj5lzEdVSx40uMqVYbPCOvQ9AX2uwxT/FkNfOrS6ne549ikPsU/sdsuX2IpOjfYYV
	WUjMbjRjuVpeuZzMTWvOxt4ISNu/oVl1P0nAuAHeR8LDP7cUNSJKYYoK66KOxqABz8Pks6PyScuxQ
	RNon0BrQmDgHONm3Q0720xwy47y7Vanm/JZRX+59QrBpJHKLt94qyYW8KC4B5ZeZVDgbqtM6f2mL8
	nrtE4DPNrCyaZgKMKaILUcJTA3YdSQuTwZKEjRLeAilyY7uzSV+KBn4s8YVktka4dILr9T5wo5OpM
	+h/0fC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tePPP-0000000DI6j-1w9Z;
	Sun, 02 Feb 2025 02:08:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tePNy-0000000DI1B-1VE5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 02:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSlKml/+kejUBtq+rKq08KSBVq8nnU94jjP3M+wY8SY=;
	b=f/Rthgzn84xgwTDoR62H7DK8W7vCrAatAD/mhxU8frJXZrAB8DnAsK28qncwuBAZ2ewTdn
	QuLsdoTOP3QCzHMKuU8X3BaB3lK3r2s/9MVDok2K5NnHYwNQHaNhhRF4QrrO6G23VdWlsp
	/YdqztwtH8r77yq4X7T4VRuqsmgo/yc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-UYOKYHnNPO-bf4Qdo94t6Q-1; Sat, 01 Feb 2025 21:06:55 -0500
X-MC-Unique: UYOKYHnNPO-bf4Qdo94t6Q-1
X-Mimecast-MFC-AGG-ID: UYOKYHnNPO-bf4Qdo94t6Q
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216266cc0acso72916515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 18:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462014; x=1739066814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSlKml/+kejUBtq+rKq08KSBVq8nnU94jjP3M+wY8SY=;
        b=tVIC829vWH78ME5GJZTrP98mcft+PlQ9fvKA+F7xjdNn/bELLuXQ1gZg/o7ml4Z62h
         RxuQuiGzO2XZpgv7sLhTKwx52bKUqWalpiSpfYl/OkCRHAcR4dbvRRDKM6YM5WU5Y88w
         LTKxu+0V+cOBM6AmKi8VEvKJfitHUV32rPuflM1Cug1pAcuiR1LqYZEd3lugSXEES5j7
         czb0otqPL4poXiWdqjUZoosXAH5zYZ7HV1v+gUQN3lFGpsm8NB4CjRX7nhWiO6qwajYp
         FCtulRRrog0Px43XDBNrSK9IJchIaeAKWyNJqM/dnkSFgPil7E+9F6PxOVxNWzUTiSrN
         zQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXW5Kx4kwUJRXMUjLJR5ZHTpZuGCCbE089UxlJZOqH4GAHR/kfTDWMo0r8YuHNhIUIL3q2SIeYWHz1bDWVQvxAT@lists.infradead.org
X-Gm-Message-State: AOJu0YzfhnRtDp1DIwRx7EAlfruj3niWFHmOjrWmECYZ36QWMACZR+8J
	v/I11QDgR6AsXilt/KxpSJec0UQi+6UQeB/mRf/KU3NRWmPYRIgJ793LxG1P9cTaYV6oa5xeJSh
	3yK5QNU7IP2BXHaWNbQ1tGv2IxxLFJZEy6/rYuDpl+cPT1lLXWMFVlA7Vce6kWvdU9k7atdtAWu
	iszZZ2
X-Gm-Gg: ASbGncucCHbJLN4uqBKkoDSO7DQCKAb6AlPQIgkYZNw86zvDF9jiFRrp5mUxHqBBMmP
	Q5l6daMSSOQ/8HTy3cDjyF8Dvg8VPcRoB2nStOSiZdSO1wLAe8dne6jd02QhtgUGrFeLeU//uzh
	Zjza6ZkQ0LYUsHRY9puP87JFpNoiOcSwcJViKk2MVZFuRRB9ZBzfkmSyJL86GqHywVWrOVShgdV
	jkxx5S3zejKyTxsOaRkxhwE1ByNKGB7F9XCW9JK9Xx9Hu0gqvYpRZ/NRXJI43bKMoYq14rpdZjp
	Z96+Gg==
X-Received: by 2002:a05:6300:7111:b0:1ed:a4b1:9124 with SMTP id adf61e73a8af0-1eda4b195bcmr6482944637.8.1738462014133;
        Sat, 01 Feb 2025 18:06:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuAmakbdVZEYfdxlzFY/5lw1yKumpAmcjFfn5o/6n2SOgtQbAy8hTNJJ7loIVoDWvimSAuIQ==
X-Received: by 2002:a05:6300:7111:b0:1ed:a4b1:9124 with SMTP id adf61e73a8af0-1eda4b195bcmr6482907637.8.1738462013708;
        Sat, 01 Feb 2025 18:06:53 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf29sm5625326b3a.20.2025.02.01.18.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:06:53 -0800 (PST)
Message-ID: <489025af-a0c3-449f-a746-f898b77fc660@redhat.com>
Date: Sun, 2 Feb 2025 12:06:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/43] KVM: arm64: Handle Realm PSCI requests
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
 <20241212155610.76522-24-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-24-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F0sJad-Ks774oLXZjMT2YNkhEIBte4peoRDHThQ0ij4_1738462015
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_180700_847334_57E4E37B 
X-CRM114-Status: GOOD (  28.20  )
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
> The RMM needs to be informed of the target REC when a PSCI call is made
> with an MPIDR argument. Expose an ioctl to the userspace in case the PSCI
> is handled by it.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  3 +++
>   arch/arm64/kvm/arm.c             | 25 +++++++++++++++++++++++++
>   arch/arm64/kvm/psci.c            | 29 +++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             | 15 +++++++++++++++
>   4 files changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 158f77e24a26..90a4537ad38d 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -113,6 +113,9 @@ int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>   			unsigned long addr, unsigned long end,
>   			unsigned long ripas,
>   			unsigned long *top_ipa);
> +int realm_psci_complete(struct kvm_vcpu *calling,
> +			struct kvm_vcpu *target,
> +			unsigned long status);
>   

The 'calling' may be renamed to 'source', consistent to the names in arch/arm64/kvm/psci.c.
Other nitpicks can be found below.

>   #define RMM_RTT_BLOCK_LEVEL	2
>   #define RMM_RTT_MAX_LEVEL	3
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f588b528c3f9..eff1a4ec892b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1745,6 +1745,22 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>   	return __kvm_arm_vcpu_set_events(vcpu, events);
>   }
>   
> +static int kvm_arm_vcpu_rmm_psci_complete(struct kvm_vcpu *vcpu,
> +					  struct kvm_arm_rmm_psci_complete *arg)
> +{
> +	struct kvm_vcpu *target = kvm_mpidr_to_vcpu(vcpu->kvm, arg->target_mpidr);
> +
> +	if (!target)
> +		return -EINVAL;
> +
> +	/*
> +	 * RMM v1.0 only supports PSCI_RET_SUCCESS or PSCI_RET_DENIED
> +	 * for the status. But, let us leave it to the RMM to filter
> +	 * for making this future proof.
> +	 */
> +	return realm_psci_complete(vcpu, target, arg->psci_status);
> +}
> +
>   long kvm_arch_vcpu_ioctl(struct file *filp,
>   			 unsigned int ioctl, unsigned long arg)
>   {
> @@ -1867,6 +1883,15 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   
>   		return kvm_arm_vcpu_finalize(vcpu, what);
>   	}
> +	case KVM_ARM_VCPU_RMM_PSCI_COMPLETE: {
> +		struct kvm_arm_rmm_psci_complete req;
> +
> +		if (!kvm_is_realm(vcpu->kvm))
> +			return -EINVAL;

We probably need to check with vcpu_is_rec(). -EPERM seems more precise
than -EINVAL.

> +		if (copy_from_user(&req, argp, sizeof(req)))
> +			return -EFAULT;
> +		return kvm_arm_vcpu_rmm_psci_complete(vcpu, &req);
> +	}
>   	default:
>   		r = -EINVAL;
>   	}
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index 3b5dbe9a0a0e..9dc161abc30c 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -103,6 +103,12 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>   
>   	reset_state->reset = true;
>   	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
> +	/*
> +	 * Make sure we issue PSCI_COMPLETE before the VCPU can be
> +	 * scheduled.
> +	 */
> +	if (vcpu_is_rec(vcpu))
> +		realm_psci_complete(source_vcpu, vcpu, PSCI_RET_SUCCESS);
>   
>   	/*
>   	 * Make sure the reset request is observed if the RUNNABLE mp_state is
> @@ -115,6 +121,10 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>   
>   out_unlock:
>   	spin_unlock(&vcpu->arch.mp_state_lock);
> +	if (vcpu_is_rec(vcpu) && ret != PSCI_RET_SUCCESS)
> +		realm_psci_complete(source_vcpu, vcpu,
> +				    ret == PSCI_RET_ALREADY_ON ?
> +				    PSCI_RET_SUCCESS : PSCI_RET_DENIED);

{} is needed here.

>   	return ret;
>   }
>   
> @@ -142,6 +152,25 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
>   	/* Ignore other bits of target affinity */
>   	target_affinity &= target_affinity_mask;
>   
> +	if (vcpu_is_rec(vcpu)) {
> +		struct kvm_vcpu *target_vcpu;
> +
> +		/* RMM supports only zero affinity level */
> +		if (lowest_affinity_level != 0)
> +			return PSCI_RET_INVALID_PARAMS;
> +
> +		target_vcpu = kvm_mpidr_to_vcpu(kvm, target_affinity);
> +		if (!target_vcpu)
> +			return PSCI_RET_INVALID_PARAMS;
> +
> +		/*
> +		 * Provide the references of running and target RECs to the RMM
                                              ^^^^^^^
                                              the source
> +		 * so that the RMM can complete the PSCI request.
> +		 */
> +		realm_psci_complete(vcpu, target_vcpu, PSCI_RET_SUCCESS);
> +		return PSCI_RET_SUCCESS;
> +	}
> +
>   	/*
>   	 * If one or more VCPU matching target affinity are running
>   	 * then ON else OFF
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 146ef598a581..5831d379760a 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -118,6 +118,21 @@ static void free_delegated_granule(phys_addr_t phys)
>   	free_page((unsigned long)phys_to_virt(phys));
>   }
>   
> +int realm_psci_complete(struct kvm_vcpu *calling, struct kvm_vcpu *target,
> +			unsigned long status)
> +{
> +	int ret;
> +
> +	ret = rmi_psci_complete(virt_to_phys(calling->arch.rec.rec_page),
> +				virt_to_phys(target->arch.rec.rec_page),
> +				status);
> +
         ^^^^^
Unnecessary blank line.

> +	if (ret)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   static int realm_rtt_create(struct realm *realm,
>   			    unsigned long addr,
>   			    int level,

Thanks,
Gavin


