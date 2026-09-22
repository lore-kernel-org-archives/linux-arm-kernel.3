Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=; b=s8WS+dWuGxYkKZQc5XJvOnJxSa
	90v30G0aeDw1i5P20oAVQktoHDP/xv+0v2YDGQn0ufL+bhCiarrmeDrSxE47Q5wO785P/AqdudWty
	5W048CmJIWh5ku1uYu+EijGPy0zJC/zAi/uX5ooZG6yMcLGDo+ggJyfRpdgli7+SgfB7EjkOPQO5J
	2DLaV/CBFYjqe6gMSv8Jzoq+CjeMdj5s4FKwZ2oj5Lp5gBhA7gkG2vcoZ0Jsjulme/3o/k9124xXp
	lO4i/id5Z6jr418SgwQ8Ku4A0CiC0VYbTG0wlT40MXjdKpGh8zKLm1JJ+JPZwulpqI38XW3Wnh8Li
	CVDlfk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98ip-00000006fIy-1xXn;
	Tue, 22 Sep 2026 22:12:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98im-00000006fIQ-35yP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:12:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCwa81166709
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=; b=Xi5iBYokt2Ym60y1
	vpsVpXo8tMWGOaetwjaQuZwvfcEM0uLpPU1gEgyshw/wom2fcML7yMokSyv/bN67
	aPzoeG3QveP9rSjDgKD6X7DEI+TDD2KRztD8yWHPGJC4Dv1hHaR34TrBwrqxAKgH
	xit/WxV4HJQg6GhWjom3Kks0KUcjV/MNt60Re4x1Z3XuDYRpTWIuKd7pxK5+4bN9
	6ylLrW5+P47ZKjuSE1vH9XSMXXmCeiaiUP/ZjdPsoGm3xsT/0g8XYPSBYqSK5dhQ
	oghfRPror1+lpoUXwjMxNR9csqCnxWGFBdinqWCmNv1vmhasJO9sOcaeQvliyR+i
	F6C7Kg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0ub1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:12:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso402169eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115135; x=1790719935; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=;
        b=PFlCxBCuHj+leULmCjD/oKpd5KiHzaD8SKssACXzflZpVEkdCCXe6wq5NWfycq1gtm
         6kJjQM+j8jCuQoch2Jgk7+gTzd1/PclKLLF5HXms1eosn2IRa/3PTgQOGmSxkVyVk+nx
         Omp0a08EZe9XZDz/cj+f8qIHSWAAYnbFrYn2PzJ3r+7qRQ9nzN0r2rKd+DrWo5yc4ORX
         HDmRgEm15pfqZvmfXC2kDbsCfz7TMCR7PZD1ELAyeX2XiVWmJfgtvmRZIis6LMd94L1w
         BPobSrssoxbfxldxlyqHr7PDUzx0S8Zq+iB/UcFQdClSxTHFIA40H5VhU8+7jIn0yDNE
         supg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115135; x=1790719935;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uALtqlrWboMDydUPTyFJwMEQxzN3BoTDOpL4FS6bPkg=;
        b=w+AYrHnVYmqocuAUHWZcy8tX9GmQg4g2dLHPMV13HoUlnrV8Qt53Q+hiURXYGXkT4Q
         zTANlOEUnrl5wpkzlLmBXbaAApV2yQmLzynnEo94bLgwMS1JxP4FhKi8VZ8Pdp/Y4goY
         6BORLgo3jk66Oo9mghJK4Rzl6g3hXjFU+MWtuMz31on1/XBUnVog0H/gqrmO4e+rLpfA
         J6crH+Qm1kOveF4KgpVvcw95da+3wEfSMjgdOUr1hQqQmRIbn0wzx9Cytb4UAEdZ1xFt
         LGs18cZDCLlT6yiZYDTjMCnWMS/BG8U5bfDBuD36yNCrG6N6xUBjfcuZ4XxQ4owGxUW0
         uXYA==
X-Forwarded-Encrypted: i=1; AKwUvBw/trxn9gsniOqES2ipyxjzzVEXiFaXwmKpGjGgiTU/PojJCMoI6IKobDJg1Z0ZYa0NCxzV3za4DKBnuage5t7J@lists.infradead.org
X-Gm-Message-State: AFuF++nEPkTviQq2Mm3+6OANvPilFgQ/SQpuxnij1fBxTWbKuvDbikw8
	oCglxwNss3LamxDhtuT/nWUxyK0iX1b4iDYyO+QaWEr+2ZplAqX0WLJCt82ndSQ4xi134YrT7kq
	XSPHfKFTtwwKq8Kkgl4lstJ1kWVUC4dhgKkaxmLBPN5khF6YBH/0HUvobwIh5pBG3Yt8ITQXeTw
	F5OA==
X-Gm-Gg: AYBFou08oE0245Nv5YB+Lq7qBJIcwE2e27tz1y3yHdrvcM9gSZWqkMUwK3Dgp/4Xu5H
	ImU3Jo3zF/FWz98FxKm0Y3ZI7OPWuMKuXF8AQwD2QQA1cWBr5aD60ApUW59gIUOAIbW8LdDpA3o
	i4fhFdX31/rj9J2+Pf/HZ9hHhdpnWXw/9r36e/V419h94a/huLh8T96YUmA3j78L/ysxyDnNNj4
	7XeSFI6r5MYnvvYTpMZ+sLP0eWJN4seY7wn2GIGPdsrYIUsz5him/TD2lkJqvQV04Q5r240aTAk
	TdPTujauCY4G1utFEScnmCMHOGNlb1xWlwFNrVDnUGtClWl9arJQVGegfKtYED7jXQLCq2iH8yn
	CtDXRBhBWRe6nhyhS7XwKTXRAga5EyB2fFpw0FZhzp0L+ogTo/wt1i3g=
X-Received: by 2002:a05:693c:8948:10b0:33b:de3b:8b09 with SMTP id 5a478bee46e88-33e8e1b4b4cmr574492eec.40.1790115134456;
        Tue, 22 Sep 2026 15:12:14 -0700 (PDT)
X-Received: by 2002:a05:693c:8948:10b0:33b:de3b:8b09 with SMTP id 5a478bee46e88-33e8e1b4b4cmr574460eec.40.1790115133819;
        Tue, 22 Sep 2026 15:12:13 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm1032300eec.9.2026.09.22.15.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:12:13 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:12:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 07/20] KVM: arm64: Add vcpu load/put call backs for
 flavors
Message-ID: <20260922151202.0000549c@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-8-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-8-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX3o2OqiiMi/7g
 v5tR9kubZUyewlv4iJss+dX+6HiHw+ILgoHmnEjve+xgQ3K09KClBJBuJNabtKHbPaG/antk9Vi
 LIV5xJ+DwFIItd4WcvFgxfNz2MmeK9lHjXFm6SgLr/jPFnjhTQDoCMFPu32I4mMe0uifY/KIcDF
 OztsTIeMK/kjhOhupgNhaKxlJwpxD4LzIt1hAY81rTxR1T8lJhUDzrUzezUrM0W97EX3LzLRZ/i
 wWNLEs6PjZNkVSOLclCpmsL3aJqlQsoUgZHij5AMUy+r8O6oa78JPKN7h39OhAtxmx1LHZW+fzb
 csS6tfkYjDhFGmzZZe6HQuoQmDMQUuSWy2MBFy0Kkp8rlTztph999ZvlaKgdw3Jqcf4HFXusxZl
 yVNaaWsonFnDG0LrOAbcNeSOTrYV3v4mMVYUUFGQAI9nMyKnV/Nq8AHEkRhtRkwFQIvEm4020sJ
 uE2yEYz7sXQ38MBm9pA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2fd3f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=eF-YeP4ItYG6qj9G5aAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 0kH1fZHW_X9zB1F-R9861b0e5hRzhlhJ
X-Proofpoint-ORIG-GUID: 0kH1fZHW_X9zB1F-R9861b0e5hRzhlhJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX/mfAIGfdwkTB
 W5+HqVMkua21VzKgujDLEVKYFQ4qPJZZc+OzCJmu8jU/AvjLz/Co9iXf4uJpYgnp5FPVd56wWew
 3klRMUXCedLZykMY5YGzParOYo2j0cw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_151216_811864_68F7AA0B 
X-CRM114-Status: GOOD (  30.03  )
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

On Sun, 20 Sep 2026 22:28:32 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
 
A couple of comments on this one.

> ---
> Changes since v17:
>  - Use macro to initialize the per-flavor ops
>  - Add a wrapper to initialise ops in the vcpu structure.
>  - Add BUILD_BUG_ON for the array size
>  - Remove irrelevant comment about the order of timer loading for !VHE
>  - Use the explicti kvm_call_hyp_nvhe for nVHE flavor
>  - Don't call nvhe_vcpu_put from pkvm_vcpu_put, open code them
>  - Drop cpu argument for vcpu_load() callback. We set the cpu
>    before the callbacks are invoked


> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c74706ed9a531..9b977dc734220 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +static void nvhe_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);

Now it isn't called from the pkvm path can you remove the defenses
in there on !is_protected_kvm_enabled()?

> +}
> +

> +
> +static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_call_hyp_nvhe(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> +
> +	/* __pkvm_vcpu_put implies a sync of the state */
> +	if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
> +		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
> +	kvm_vcpu_put_debug(vcpu);
> +	kvm_arch_vcpu_put_fp(vcpu);
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +	kvm_vcpu_pmu_restore_host(vcpu);

May have been incorrect or pointless but wasn't kvm_arm_vmid_clear_active()
previously called in this path?  Would be nice to tweak that to be under
an appropriate gate in a precursor patch with explanation of why.

> +}
> +
> +void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>  	vcpu_clear_on_unsupported_cpu(vcpu);
>  	vcpu->cpu = -1;
>  }
> @@ -2136,6 +2187,37 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  	}
>  }

> +
> +#define KVM_VCPU_OPS(flavor, ops)		\
> +	[(flavor)] = (ops)
> +
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
> +	KVM_VCPU_OPS(VM_VHE, &vhe_vcpu_ops),
> +	KVM_VCPU_OPS(VM_NVHE, &nvhe_vcpu_ops),
> +	KVM_VCPU_OPS(VM_PKVM, &pkvm_vcpu_ops),
> +	KVM_VCPU_OPS(VM_PROTECTED_PKVM, &pkvm_vcpu_ops),

I'd put these in same order as the enum. Given the construction
doesn't really matter but just feels more natural when reading
the code to check they are all there (obviously the BUILD_BUG
below also does that).

> +};
> +
> +static void kvm_init_vcpu_ops(struct kvm_vcpu *vcpu)
> +{
> +	BUILD_BUG_ON(ARRAY_SIZE(arm64_vcpu_ops) != VM_FLAVOR_MAX);
> +	vcpu->arch.vcpu_ops = arm64_vcpu_ops[vcpu->kvm->arch.vm_flavor];
> +}
> +
>  static unsigned long nvhe_percpu_size(void)
>  {
>  	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -


