Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE388C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=; b=3m/G2nBnXeMyfHOnxS8oCMe9Xl
	t5D6OMj0kU8+et7Ma9TPkrF3Q+FqEe8qNfmxBuObVzQ85wifNAX9dKN+l6bUQONqAe+eVcUV9Tn01
	FbZH/khgsac2Ut6O12P8lCYIey1yqrhAOzXQq1hcnySuUr+mvWZPmM3MWthKu2D2O2Ivf/H8PcH5s
	Gs4EEbTkAX+KvFf3/EcKtBfEoanmR2Fzpf3m8hg98VlQAbNajo+GBX9EIIVwZGQ1GwsWcIGcKBMy5
	5O/1uA+SIgWxNTEx4Xf6ludfWR84wNIkTVA+BpI4ZDFUGtunNYu/9QcTXGezMLWbAh4ICrbw/YUo6
	Fodob4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99C0-00000006hMV-3Zba;
	Tue, 22 Sep 2026 22:42:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Bx-00000006hLz-3zXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:42:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7U8d900517
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=; b=my4HTeXumBECvXzV
	j4c3b7Ko5e6iN9r2j3NaIr1WpIryDMswNKztKULaiH8U/S7ed7WOZ7+wYlE1HGpZ
	Hjt7hlE+tqLbaKwoCMBzhnekwiW98RiuAjhMEWROURtje/dnsQNi5K9t8cLsfksg
	OK5dM07a0eZwN2xql6E+x7ZfZEREKFLZPhzP9ZLMIgCam6nPMdqMyypmmVAAAYrv
	cun2124+4GbE74oUkP+6ObMz39ad7IIGsV7TCdtRhCrD78bkU6Z2gexaPF3J59kR
	LDm5IvrdJQsW9cIS9LhubQ23adBqpJUs9wuxdR6EaJcni9Eeo5LQzoGg++obw/VM
	PV28Qg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyv56b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:42:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-331b2ec616fso1091624eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116944; x=1790721744; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=eYmnQM2gyCVgGeIukDXetZ2XaHND6C9KNQqAcoQ4l5VchmP4/09AP5ol1R9oP53XWA
         QwpCf9UjQpHCdBS6H1IMOZnTYowBIeUel1WMDlLyNU2WZEAG4Lfd86tNfz9/EHRTAY04
         zfQY7prEXDrDZZJHQ7vur17w5WK/mOSx7jFh7gplV3qSUsSIK/M8qK3rJcusHsy0JY2N
         F+dSc+f62xMLrCW4xbGPtoRMEkgmkxsKJt/A6IboRxvW4zFToEB5x7vhNytZrAUDbPt9
         IDN4u7bojlOnWfbtVdqcIt7WP8iODfiEY2ib76dqrZ9vczEbQ3cehPX2NnA5LykCvTIt
         xV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116944; x=1790721744;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xvk7yaRvmx3POKolJ3kCG15kscgZd6Hbrm/vBfl0Qo=;
        b=TtTgEiZZyT6VGtxpHELfn1JokI1Dj42GOFTwuMAry/Xbv4ic6ESN3ecNTTmHZQWZKt
         76J7NbL0m+oqMIK6JaeEfnYhLi4lRHQ7IsOriSpNI+JcJJJwMGZTeZLLKYwKKmzfno+u
         lS/37rx9Ye9kIdSPQ8Qhoc1h+dXXAClPuuZt9KePpI0x/SML5d8Q4Pf49OpMcDnlqDhl
         PVNmx0nHkESEtVT0c7DyVqgyiD8eoFedj099U3hBQ5bEdlF+PAXjlFWsIfTBGZ3DdgGB
         F5PjqKuRh+nL4O4hxCw3fTrwL8Ntb832hD4s1BQd1QgBGrkJ9gqAaYrhkkAO9gv4obo7
         xcTg==
X-Forwarded-Encrypted: i=1; AKwUvBx/IFXtPIFYRigzQDIFfq4YnllKkFxXHfOOa1UPsN6vIw1nvIViXZdYmnJO+bWkIKKxUziLZ+PzMPadZSqtgcHR@lists.infradead.org
X-Gm-Message-State: AFuF++lukxMUKvVU09aiH8BvwffPGWcsJrlXac1rd8dMtEARv7LKIjqb
	jfiuaT9CIwPpKZFproM1XtFlzL8gJPsz+Ijy2+V2mN858Cl+Ol5LNe0eftKZS3thNjw6sRptUKE
	7f1+mJ3tL9NsPd2E22e44+3hhVD5xvzJy+J/c01sc71I448HG3QJs9YbW2gLgSc38z4jFQbVYbb
	EYvQ==
X-Gm-Gg: AYBFou3ho9AS/FuX9eW6DbDAPyl3NyMdj7uIo50a/X9AkZpais5XDfZXUYLAkyMn7Fq
	uEHus1J+LJ2gVjCAVTdRdbmVXx02kMPApNWU10SAAXoMpVV0P9ygEgC/+tciim108bbizB9PH93
	VSZqUT7b66BdbqtEAFHsMiReCucF7qQKWIBz/iwhHXVD/XLyrw3iKJw70wkd5ef6MfDFeG9/Epe
	qKcWRJaREbD2YP/5m2VRNBrCe9Dtj+1csyJAw60Emu84gf7Fx0jvOd7mI2osslNJTYwz1wxwoYB
	a1VQQqBf4mltFnwgqCKVndk4dhOZ58doe6ExsIYqpQ2EWZpIgBkLCVXGiY11/3B8vqa5ASzVgvI
	/G2KsDszOmzXtVN7KjmKwZg8dSyBLmltRZYt4v7LTiT5K+NnHZTLfJ5I=
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr743985eec.19.1790116943603;
        Tue, 22 Sep 2026 15:42:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6211:b0:33b:de13:9574 with SMTP id 5a478bee46e88-33e8dbc4479mr743958eec.19.1790116942985;
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1266199eec.26.2026.09.22.15.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:42:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:42:19 -0700
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
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs
 running on hyp that don't trust the host
Message-ID: <20260922154219.00000999@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-12-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EOnIsFwL83t2SjS5gqWzf8qYEM4P0yqA
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab30450 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=7nvTRwv7b12_b2Z3:21 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=99P15FIpgWgLHUSX_UoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX7Pd+/mwSS7+S
 oYgVtMmwYQ/zmGZfqcvOhpRek8tsPYgP0bnpGZhTEz/eD0IPRtBS6Y1w+4s46VvA7ulHKJIs/O/
 maBwCRcsxQM6gsaiHJkeiOWmFTjgX6LTTbrsYfc+lI8AcLzBvBme2HpR8uT1HVaRbQh8Dd0kDzQ
 SU9yHl6GQ3Db2Hb2eyj4t9pCR7TroAUilil3s8+FuoALyUElpC7GCIWGWlqaWe3O/bF5Gd58COl
 mCDasLR8f3qS3qT2gc6fZOjZBJakCqpxfsO6m2ob2rbHqRkpUKwiW9EU4cU/m6Udin6hoP/Cwnr
 mCF5s8uo/rn/vSJetetr3zaFIttGKDCbnHkyOugDYqTITWaMSNEPk1JcgtbRUO9NES593FMb1pr
 Tn+C9/X96VozrqwojykTuQ3HGxR1910dP/utTy/mjOO2CN8Eq9+L2vL6PD4U43p7YNJ7tgg9Tw3
 NNrxHzNu+1vkKU9+FPA==
X-Proofpoint-ORIG-GUID: EOnIsFwL83t2SjS5gqWzf8qYEM4P0yqA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXzDTlLk6/R2ma
 KbCg8jsPUUG8yMx5IHtoMcclXMY0IPep6m30h82luP6I+Dm1984Le44vHdiFH6o/WO0z/7Nncky
 38XLMVd3yvZnCDZJC4yvvZqqm/vL2IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_154226_108870_2B2E5E85 
X-CRM114-Status: GOOD (  24.99  )
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

On Sun, 20 Sep 2026 22:28:36 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs

Maybe don't mention RMM yet, or make it clear that isn't here in this
patch.

> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Other than minor comments, it feels to me like these first 11
patches are good cleanup even without the RMM stuff that follows.
Perhaps can get these upstream faster than the rest?

Jonathan

> ---
> Changes since v18:
>  - Cover pKVM guests for VGIC v3 mandate.
>  - Merge the VGIC mandate check in here.
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/mmu.c              | 2 +-
>  arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3211543a85b38..bb156a633ab75 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -328,6 +328,8 @@ enum fgt_group_id {
>  enum kvm_arm_vm_flavor {
>  	VM_NVHE,
>  	VM_VHE,
> +	/* VMs running on a hyp that doesn't trust */
> +	MARKER(__VM_DISTRUSTING_HYP),
>  	VM_PKVM,		/* Normal guests on pKVM */
>  	MARKER(__VM_PROTECTED),
>  	VM_PROTECTED_PKVM,	/* Protected VM */
> @@ -1546,6 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  #define kvm_vm_is_unprotected_pkvm(kvm)		\
>  	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PKVM))
>  
> +#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>  
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index cf293d09e940a..413c4b114d75d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1251,7 +1251,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  				     KVM_PGTABLE_PROT_R |
>  				     (writable ? KVM_PGTABLE_PROT_W : 0);
>  
> -	if (is_protected_kvm_enabled())
> +	if (kvm_vm_hyp_is_distrusting(kvm))
>  		return -EPERM;
>  
>  	size += offset_in_page(guest_ipa);
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 4012df6002ea6..874025513afcc 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  		!kvm_vgic_global_state.can_emulate_gicv2)
>  		return -ENODEV;
>  
> +	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		return -ENODEV;
>  	/*
>  	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
>  	 *


