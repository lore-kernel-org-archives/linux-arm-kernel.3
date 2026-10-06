Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87DCA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVWHebib2+PaxqGfX8DYOd3/6naf8L3Knlt4kbfFSlY=; b=UU7FJegq5h/P5/fRSscpXd9MiV
	ApbJ7fBgEw07lIxgOeir61ggC9RqHYSzOtxGEi0tZAJcxBVTf2ScMSGvUo7eZYjE5SyA9G/0Nfsxe
	GQOz/vGVBpvCqehlQSkIC3222H+WJ/S1lFYq47IXKJIUAKosX9LnsT6CJY3dHH71LDLc4JWdr81hQ
	niTUytEqxcJ2p9uttmdlBYUHPAphJ0nHlbDWTupa8XTAyX+iugDNU8A3rtT3i2tfsh5mhqyyLp6KL
	NR5Vyf42XKN/UbHT+I4gnH5E8vZlTgs2gDTfA/rC5XvyCJe+OvBmiJ637/SVe8olOkDMRjklN9/hw
	pdd/+mFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDy1L-000000005HX-0Hwf;
	Tue, 06 Oct 2026 05:47:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDy1I-000000005HB-3s3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791265639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVWHebib2+PaxqGfX8DYOd3/6naf8L3Knlt4kbfFSlY=;
	b=HgDUh8ezzFbFkLXf/VanLzQtDB+1cUdCWSXw7ivSXQsDCGJg+oKH4m39290PSIAL0mldd+
	IIGTSC+mbUKZwMkpFq04xwKTPq6AhmcGA2mDfA2WdJRSWIZAk/XUO3hAut2n9SMbRMJwqM
	fPh9P7gkU80yw3SSIqH5AsrE2jTxZs8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-bGH4yG6cM8WZj5kJ41lsvQ-1; Tue, 06 Oct 2026 01:47:17 -0400
X-MC-Unique: bGH4yG6cM8WZj5kJ41lsvQ-1
X-Mimecast-MFC-AGG-ID: bGH4yG6cM8WZj5kJ41lsvQ_1791265637
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so29297355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 22:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791265637; x=1791870437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVWHebib2+PaxqGfX8DYOd3/6naf8L3Knlt4kbfFSlY=;
        b=lICVByzQx0xf13eFW7G2Ff8DGK/kvKwHvJOzHv65HwbbOlfNn6ruf1gyTgT2GvMwTD
         FmPyo2UxE1TgxZ2IQhGbwlQX/uPaMFePSLNhAgzf26JWwQWOJjv3fvwgkxwE+1yZU+j9
         KmOpFJhvH4jtXIB/mOEQNOyegdlEXqX219mCsWyAaYTYepwc99eB9d5rTTZHOp2kcM0C
         WWEVh9UCYDTzV3K7vZvcOGcMR+1Jfilc/X/NxK6cLKxGfnOzBjDkf3eUQHWE9XBgNa6z
         5B9SbbI0N470SKSc9rEkQ3wHUknFUMN5zUF2loU6T1hxf+UyQH2MfwcvepAvGHvXukZX
         lQZg==
X-Forwarded-Encrypted: i=1; AKwUvBzEYjV9DhZ+yUYOfLiEg4a/7fFzo+l2zv7B3485UoRQzz+agS6ZPmlK/BBmjWeZDFKPoLPSsyW88j0XekA9XJNM@lists.infradead.org
X-Gm-Message-State: AFq9FYLxT92oKOqnh2da0Gg9QDu1B8bGV3oRpKehjZrjTkkbNdMtXLej
	aNixBDKSVQL1UL9FQ0ckfRvSW3fqNBfh4ClRs++DqUMPOofrR4ejODJ3pnA3IF4ARY3p7D7cHJq
	Yq32czSSZRnoQWEDF9DZ0qgcOfb/f+pv/ROlFCRE60c87VZLkN25mlmFBuPMyzAGq1gcbqpFfxU
	OU
X-Gm-Gg: AYBFou1pTpuB/Krm8UzkfJQv9iOn2OJnNMbkCnclTi8x9alAt9AK7pK4IOoll9mwX+7
	B94dlWqOY4Kqfm5bB2E4V3cHhj6rRCRzr0/0imSvgtlJqTzeDOpYuLskOgL9UKbUlZxLQXg4Wkd
	fFQJoq2n5c5keAXt+j8QJTqjEq/M95cIQ5/SlFbxxDb5RzashCdnz04NSb7jDqncmIckq3Yoz2p
	gV6hU6vmQ4177yTaMZcWTNmgGodu2R4M7Ctt1nB8QzpAvedC+hvrQe70QT2ZtjOgm79khg/fCYm
	Foiz4AK9mFza0sORvg6MaoldQPqe1zrCU7yTFmUNzCaeUWKvGbej8ZiCGLlBN+3iJaXgrrLZjCC
	8cLIm9H7OTDN9mUkRbI12nFOOGrJBWbDL6MQ54rkMpg==
X-Received: by 2002:a17:902:d4c9:b0:2e3:913:31a2 with SMTP id d9443c01a7336-2e5dcdd5eb5mr3865105ad.66.1791265636623;
        Mon, 05 Oct 2026 22:47:16 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e3:913:31a2 with SMTP id d9443c01a7336-2e5dcdd5eb5mr3864895ad.66.1791265636092;
        Mon, 05 Oct 2026 22:47:16 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5caea69sm16749185ad.16.2026.10.05.22.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 22:47:15 -0700 (PDT)
Message-ID: <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
Date: Tue, 6 Oct 2026 15:47:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-24-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: faLiBOIt0XOeMIQKKZRz2H38bKoPzByoqtSXCNqGi3A_1791265637
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_224721_045939_C97C2530 
X-CRM114-Status: GOOD (  39.10  )
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
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM restricts the access to the register states that the host can
> read/modify for a given Realm.
> 
> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>        requests.
>        MMIO emulation in the unprotected space.
> 
> Additionally we use the sysreg configuration to advertise/configure the
> following Realm parameters, which are required before the Realm Descriptor
> is created:
>   - SVE Vector Length
>   - Number of HW Breakpoints/Watchpoints
>   - PMU Counters.
> 
> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
> the configuration of Realm creation parameters. We don't support PMUs for
> the Realm VMs yet, so PMCR is not exposed.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/guest.c      | 63 +++++++++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hypercalls.c |  4 +--
>   arch/arm64/kvm/sys_regs.c   | 28 +++++++++++++----
>   3 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index c3ca369882273..ffe3f5ce4b3cf 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -73,6 +73,25 @@ static u64 core_reg_offset_from_id(u64 id)
>   	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
>   }
>   
> +static bool kvm_realm_validate_core_reg(u64 off)
> +{
> +	/*
> +	 * Note that GPRs can only sometimes be controlled by the VMM.
> +	 * For PSCI only X0-X6 are used, higher registers are ignored (restored
> +	 * from the REC).
> +	 * For HOST_CALL all of X0-X30 are copied to the RsiHostCall structure.
> +	 * For emulated MMIO X0 is always used.
> +	 * PC can only be set before the realm is activated.
> +	 */
> +	switch (off) {
> +	case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
> +	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
> +	case KVM_REG_ARM_CORE_REG(regs.pc):
> +		return true;
> +	}
> +	return false;
> +}
> +
>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>   {
>   	int size;
> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>   		u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>   		int size = core_reg_size_from_offset(vcpu, i);
>   
> +		if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
> +			continue;
> +
>   		if (size < 0)
>   			continue;
>   
> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> +	if (kvm_vm_is_realm(vcpu->kvm))
> +		return 1; /* KVM_REG_ARM64_SVE_VLS */
> +
>   	if (!kvm_arm_vcpu_sve_finalized(vcpu))
>   		return 1; /* KVM_REG_ARM64_SVE_VLS */
> 

Aren't above two checks conflicting to each other?

   
> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   		return -EFAULT;
>   	++num_regs;
>   
> +	/* For Realms only support SVE_VLS */
> +	if (kvm_vm_is_realm(vcpu->kvm))
> +		return num_regs;
> +
>   	if (!kvm_arm_vcpu_sve_finalized(vcpu))
>   		return num_regs;
>   

Same question here.

> @@ -705,6 +734,11 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
>   		return -EINVAL;
>   
> +	/*
> +	 * We don't filter out the register reads for Realms, like we do for
> +	 * the user writes. We expose junk data for the VMM instead of
> +	 * denying the requests.
> +	 */
>   	switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
>   	case KVM_REG_ARM_CORE:	return get_core_reg(vcpu, reg);
>   	case KVM_REG_ARM_FW:
> @@ -716,12 +750,41 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   	return kvm_arm_sys_reg_get_reg(vcpu, reg);
>   }
>   
> +#define KVM_REG_ARM_ID_AA64DFR0_EL1	ARM64_SYS_REG(3, 0, 0, 5, 0)
> +/*
> + * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
> + * that are available depends on the Realm state and the reason for the last
> + * exit.  All other registers are reset to architectural or otherwise defined
> + * reset values by the RMM, except for a few configuration fields that
> + * correspond to Realm parameters.
> + */
> +static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg)
> +{
> +	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_CORE) {
> +		u64 off = core_reg_offset_from_id(reg->id);
> +
> +		return kvm_realm_validate_core_reg(off);
> +	}
> +
> +	switch (reg->id) {
> +	case KVM_REG_ARM_ID_AA64DFR0_EL1:
> +	case KVM_REG_ARM64_SVE_VLS:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   {
>   	/* We currently use nothing arch-specific in upper 32 bits */
>   	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
>   		return -EINVAL;
>   
> +	if (kvm_vm_is_realm(vcpu->kvm) && !validate_realm_set_reg(vcpu, reg))
> +		return -EINVAL;
> +
>   	switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
>   	case KVM_REG_ARM_CORE:	return set_core_reg(vcpu, reg);
>   	case KVM_REG_ARM_FW:
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index b11b8821c9fbc..2b1e6fdeb4d5c 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -414,14 +414,14 @@ void kvm_arm_teardown_hypercalls(struct kvm *kvm)
>   
>   int kvm_arm_get_fw_num_regs(struct kvm_vcpu *vcpu)
>   {
> -	return ARRAY_SIZE(kvm_arm_fw_reg_ids);
> +	return vcpu_is_rec(vcpu) ? 0 : ARRAY_SIZE(kvm_arm_fw_reg_ids);
>   }
>   
>   int kvm_arm_copy_fw_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
>   {
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(kvm_arm_fw_reg_ids); i++) {
> +	for (i = 0; i < kvm_arm_get_fw_num_regs(vcpu); i++) {
>   		if (put_user(kvm_arm_fw_reg_ids[i], uindices++))
>   			return -EFAULT;
>   	}
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d7..47ebde943a09e 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5638,18 +5638,18 @@ int kvm_arm_sys_reg_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
>   				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
>   }
>   
> -static unsigned int num_demux_regs(void)
> +static inline unsigned int num_demux_regs(struct kvm_vcpu *vcpu)
>   {
> -	return CSSELR_MAX;
> +	return vcpu_is_rec(vcpu) ? 0 : CSSELR_MAX;
>   }
>   
> -static int write_demux_regids(u64 __user *uindices)
> +static int write_demux_regids(struct kvm_vcpu *vcpu, u64 __user *uindices)
>   {
>   	u64 val = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX;
>   	unsigned int i;
>   
>   	val |= KVM_REG_ARM_DEMUX_ID_CCSIDR;
> -	for (i = 0; i < CSSELR_MAX; i++) {
> +	for (i = 0; i < num_demux_regs(vcpu); i++) {
>   		if (put_user(val | i, uindices))
>   			return -EFAULT;
>   		uindices++;
> @@ -5693,11 +5693,27 @@ static bool copy_reg_to_user(const struct sys_reg_desc *reg, u64 __user **uind)
>   	return true;
>   }
>   
> +static inline bool kvm_realm_sys_reg_hidden_user(const struct kvm_vcpu *vcpu,
> +						 u64 reg)
> +{
> +	if (!vcpu_is_rec(vcpu))
> +		return false;
> +
> +	switch (reg) {
> +	case SYS_ID_AA64DFR0_EL1:
> +		return false;
> +	}
> +	return true;
> +}
> +
>   static int walk_one_sys_reg(const struct kvm_vcpu *vcpu,
>   			    const struct sys_reg_desc *rd,
>   			    u64 __user **uind,
>   			    unsigned int *total)
>   {
> +	if (kvm_realm_sys_reg_hidden_user(vcpu, reg_to_encoding(rd)))
> +		return 0;
> +
>   	/*
>   	 * Ignore registers we trap but don't save,
>   	 * and for which no custom user accessor is provided.
> @@ -5735,7 +5751,7 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
>   
>   unsigned long kvm_arm_num_sys_reg_descs(struct kvm_vcpu *vcpu)
>   {
> -	return num_demux_regs()
> +	return num_demux_regs(vcpu)
>   		+ walk_sys_regs(vcpu, (u64 __user *)NULL);
>   }
>   
> @@ -5748,7 +5764,7 @@ int kvm_arm_copy_sys_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
>   		return err;
>   	uindices += err;
>   
> -	return write_demux_regids(uindices);
> +	return write_demux_regids(vcpu, uindices);
>   }
>   
>   #define KVM_ARM_FEATURE_ID_RANGE_INDEX(r)			\

Thanks,
Gavin


