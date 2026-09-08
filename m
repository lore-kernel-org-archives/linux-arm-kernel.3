Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A6CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmsX8TJTtUIRUHrt4sWMd0a+v9JHbWfSkNY/BVrfhy8=; b=Annzcf3n9Lk+wQ3AFgDSGsPVCK
	BQGMk6p67TX3taLQfp6ueM3ATPcybUFfbIfza5zJUH81tGysPiZkz3+6ZuSsjNPIFIlgWQmNHbjbX
	0knk26qwYNOVOAx7+b7LKgCEL+ZLyMcyDatgN9tKhHGeGEggU742PB4DqvLc85B4pn2Tx7NE4Uw4E
	GLMjNMvAVUVR01D+EI9ROZgc5yro8PZwZiEPbA90raaSRGk9pGLhWtRCEqsE40kadKGBhfjxGHjNZ
	ErzSJduLD3BJLLAq7f/9QLepfCRRXQruNih5Xtj3ggQlig91g9t30CRVcRc3k0Eo3BDODAMw7VSET
	GHWOhvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r4Q-00000008NTu-0nwh;
	Tue, 08 Sep 2026 08:20:46 +0000
Received: from [113.46.200.226] (helo=canpmsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3r4L-00000008NRJ-1Mpz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:20:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QmsX8TJTtUIRUHrt4sWMd0a+v9JHbWfSkNY/BVrfhy8=;
	b=CK65Pz33vWuPKCmRGDQemRKi9ybOqNv+2pZ3z0cqnzo5ZZdHzkAJ9NHwIXu9wgwDOYRId5+Zo
	a0zffzbs4lsCC5eVraU7c4xHyCirFef0u6vnngRIMJ1fzoe9iVdQpeQxv8Z1mkA1WeKfrUlmTe7
	jHYz3M+rERBHET2+ol5sgso=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hfGmz1bNZzKm6K;
	Tue,  8 Sep 2026 16:09:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 92DF34058E;
	Tue,  8 Sep 2026 16:20:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 16:20:19 +0800
Message-ID: <b6c45b5c-06ca-4774-b749-ddbf887fe976@huawei.com>
Date: Tue, 8 Sep 2026 16:20:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: smp: Defer update of secondary CPU
 capabilities
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-8-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-8-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_012042_022583_2F8CCB1D 
X-CRM114-Status: GOOD (  35.41  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> check_local_cpu_capabilities() runs relatively early during the boot of
> each secondary CPU and, despite its name, calls update_cpu_capabilities()
> to manipulate the global 'system_cpucaps' based on the features detected
> by the incoming CPU.
> 
> In preparation for parallel bringup of secondary CPUs, move the call
> to update_cpu_capabilities() into update_cpu_features(), allowing
> check_local_cpu_capabilities() to run concurrently in future, as it now
> only performs local verification of the incoming CPU.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 311 +++++++++++++++++----------------
>  1 file changed, 157 insertions(+), 154 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 33279a264145..fadc36cdff99 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1408,156 +1408,6 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
>  	return taint;
>  }
>  
> -/*
> - * Update system wide CPU feature registers with the values from a
> - * non-boot CPU. Also performs SANITY checks to make sure that there
> - * aren't any insane variations from that of the boot CPU.
> - */
> -void update_cpu_features(int cpu)
> -{
> -	struct cpuinfo_arm64 *boot, *info;
> -	int taint = 0;
> -
> -	boot = &boot_cpu_data;
> -	info = per_cpu_ptr(&cpu_data, cpu);
> -
> -	/*
> -	 * The kernel can handle differing I-cache policies, but otherwise
> -	 * caches should look identical. Userspace JITs will make use of
> -	 * *minLine.
> -	 */
> -	taint |= check_update_ftr_reg(SYS_CTR_EL0, cpu,
> -				      info->reg_ctr, boot->reg_ctr);
> -
> -	/*
> -	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
> -	 * could result in too much or too little memory being zeroed if a
> -	 * process is preempted and migrated between CPUs.
> -	 */
> -	taint |= check_update_ftr_reg(SYS_DCZID_EL0, cpu,
> -				      info->reg_dczid, boot->reg_dczid);
> -
> -	/* If different, timekeeping will be broken (especially with KVM) */
> -	taint |= check_update_ftr_reg(SYS_CNTFRQ_EL0, cpu,
> -				      info->reg_cntfrq, boot->reg_cntfrq);
> -
> -	/*
> -	 * The kernel uses self-hosted debug features and expects CPUs to
> -	 * support identical debug features. We presently need CTX_CMPs, WRPs,
> -	 * and BRPs to be identical.
> -	 * ID_AA64DFR1 is currently RES0.
> -	 */
> -	taint |= check_update_ftr_reg(SYS_ID_AA64DFR0_EL1, cpu,
> -				      info->reg_id_aa64dfr0, boot->reg_id_aa64dfr0);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64DFR1_EL1, cpu,
> -				      info->reg_id_aa64dfr1, boot->reg_id_aa64dfr1);
> -	/*
> -	 * Even in big.LITTLE, processors should be identical instruction-set
> -	 * wise.
> -	 */
> -	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR0_EL1, cpu,
> -				      info->reg_id_aa64isar0, boot->reg_id_aa64isar0);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR1_EL1, cpu,
> -				      info->reg_id_aa64isar1, boot->reg_id_aa64isar1);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR2_EL1, cpu,
> -				      info->reg_id_aa64isar2, boot->reg_id_aa64isar2);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR3_EL1, cpu,
> -				      info->reg_id_aa64isar3, boot->reg_id_aa64isar3);
> -
> -	/*
> -	 * Differing PARange support is fine as long as all peripherals and
> -	 * memory are mapped within the minimum PARange of all CPUs.
> -	 * Linux should not care about secure memory.
> -	 */
> -	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR0_EL1, cpu,
> -				      info->reg_id_aa64mmfr0, boot->reg_id_aa64mmfr0);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR1_EL1, cpu,
> -				      info->reg_id_aa64mmfr1, boot->reg_id_aa64mmfr1);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR2_EL1, cpu,
> -				      info->reg_id_aa64mmfr2, boot->reg_id_aa64mmfr2);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR3_EL1, cpu,
> -				      info->reg_id_aa64mmfr3, boot->reg_id_aa64mmfr3);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR4_EL1, cpu,
> -				      info->reg_id_aa64mmfr4, boot->reg_id_aa64mmfr4);
> -
> -	taint |= check_update_ftr_reg(SYS_ID_AA64PFR0_EL1, cpu,
> -				      info->reg_id_aa64pfr0, boot->reg_id_aa64pfr0);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64PFR1_EL1, cpu,
> -				      info->reg_id_aa64pfr1, boot->reg_id_aa64pfr1);
> -	taint |= check_update_ftr_reg(SYS_ID_AA64PFR2_EL1, cpu,
> -				      info->reg_id_aa64pfr2, boot->reg_id_aa64pfr2);
> -
> -	taint |= check_update_ftr_reg(SYS_ID_AA64ZFR0_EL1, cpu,
> -				      info->reg_id_aa64zfr0, boot->reg_id_aa64zfr0);
> -
> -	taint |= check_update_ftr_reg(SYS_ID_AA64SMFR0_EL1, cpu,
> -				      info->reg_id_aa64smfr0, boot->reg_id_aa64smfr0);
> -
> -	taint |= check_update_ftr_reg(SYS_ID_AA64FPFR0_EL1, cpu,
> -				      info->reg_id_aa64fpfr0, boot->reg_id_aa64fpfr0);
> -
> -	/* Probe vector lengths */
> -	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
> -	    id_aa64pfr0_sve(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> -		if (!system_capabilities_finalized()) {
> -			unsigned long cpacr = cpacr_save_enable_kernel_sve();
> -
> -			vec_update_vq_map(ARM64_VEC_SVE);
> -
> -			cpacr_restore(cpacr);
> -		}
> -	}
> -
> -	if (IS_ENABLED(CONFIG_ARM64_SME) &&
> -	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
> -		unsigned long cpacr = cpacr_save_enable_kernel_sme();
> -
> -		/* Probe vector lengths */
> -		if (!system_capabilities_finalized())
> -			vec_update_vq_map(ARM64_VEC_SME);
> -
> -		cpacr_restore(cpacr);
> -	}
> -
> -	if (detect_ftr_has_mpam()) {
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> -		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
> -					info->reg_mpamidr, boot->reg_mpamidr);
> -	}
> -
> -	/*
> -	 * The kernel uses the LDGM/STGM instructions and the number of tags
> -	 * they read/write depends on the GMID_EL1.BS field. Check that the
> -	 * value is the same on all CPUs.
> -	 */
> -	if (gmid_el1_accessible(info))
> -		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
> -					      info->reg_gmid, boot->reg_gmid);
> -
> -	/*
> -	 * If we don't have AArch32 at all then skip the checks entirely
> -	 * as the register values may be UNKNOWN and we're not going to be
> -	 * using them for anything.
> -	 *
> -	 * This relies on a sanitised view of the AArch64 ID registers
> -	 * (e.g. SYS_ID_AA64PFR0_EL1), so we call it last.
> -	 */
> -	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
> -		lazy_init_32bit_cpu_features(info, boot);
> -		taint |= update_32bit_cpu_features(cpu, &info->aarch32,
> -						   &boot->aarch32);
> -	}
> -
> -	/*
> -	 * Mismatched CPU features are a recipe for disaster. Don't even
> -	 * pretend to support them.
> -	 */
> -	if (taint) {
> -		pr_warn_once("Unsupported CPU feature variation detected.\n");
> -		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> -	}
> -}
> -
>  u64 read_sanitised_ftr_reg(u32 id)
>  {
>  	struct arm64_ftr_reg *regp = get_arm64_ftr_reg(id);
> @@ -3902,16 +3752,169 @@ void check_local_cpu_capabilities(void)
>  	 */
>  	check_early_cpu_features();
>  
> +	/*
> +	 * Verify that this CPU has all the system advertised
> +	 * capabilities.
> +	 */
> +	if (system_capabilities_finalized())
> +		verify_local_cpu_capabilities();
> +}

As I commented below, this order avoids concurrency issues, as after
cpuhp_ap_sync_alive(), the secondary CPUs are woken up serially by the
boot CPU.

It also eliminates the problem of boot CPUs being stuck in deadlock wait
for the secondary CPUs, because update_cpu_capabilities() does not call
cpu_die_early() or cpu_panic_kernel().

secondary_start_kernel()
   -> check_local_cpu_capabilities()
   -> cpuhp_ap_sync_alive()
   -> update_cpu_features()
      -> update_cpu_capabilities()

So LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Link:
https://lore.kernel.org/all/3501828e-7dd4-4587-b29a-71eabcc05ab8@huawei.com/

> +
> +/*
> + * Update system wide CPU feature registers with the values from a
> + * non-boot CPU. Also performs SANITY checks to make sure that there
> + * aren't any insane variations from that of the boot CPU.
> + */
> +void update_cpu_features(int cpu)
> +{
> +	struct cpuinfo_arm64 *boot, *info;
> +	int taint = 0;
> +
>  	/*
>  	 * If we haven't finalised the system capabilities, this CPU gets
>  	 * a chance to update the errata work arounds and local features.
> -	 * Otherwise, this CPU should verify that it has all the system
> -	 * advertised capabilities.
>  	 */
>  	if (!system_capabilities_finalized())
>  		update_cpu_capabilities(SCOPE_LOCAL_CPU);
> -	else
> -		verify_local_cpu_capabilities();
> +
> +	boot = &boot_cpu_data;
> +	info = per_cpu_ptr(&cpu_data, cpu);
> +
> +	/*
> +	 * The kernel can handle differing I-cache policies, but otherwise
> +	 * caches should look identical. Userspace JITs will make use of
> +	 * *minLine.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_CTR_EL0, cpu,
> +				      info->reg_ctr, boot->reg_ctr);
> +
> +	/*
> +	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
> +	 * could result in too much or too little memory being zeroed if a
> +	 * process is preempted and migrated between CPUs.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_DCZID_EL0, cpu,
> +				      info->reg_dczid, boot->reg_dczid);
> +
> +	/* If different, timekeeping will be broken (especially with KVM) */
> +	taint |= check_update_ftr_reg(SYS_CNTFRQ_EL0, cpu,
> +				      info->reg_cntfrq, boot->reg_cntfrq);
> +
> +	/*
> +	 * The kernel uses self-hosted debug features and expects CPUs to
> +	 * support identical debug features. We presently need CTX_CMPs, WRPs,
> +	 * and BRPs to be identical.
> +	 * ID_AA64DFR1 is currently RES0.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_ID_AA64DFR0_EL1, cpu,
> +				      info->reg_id_aa64dfr0, boot->reg_id_aa64dfr0);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64DFR1_EL1, cpu,
> +				      info->reg_id_aa64dfr1, boot->reg_id_aa64dfr1);
> +	/*
> +	 * Even in big.LITTLE, processors should be identical instruction-set
> +	 * wise.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR0_EL1, cpu,
> +				      info->reg_id_aa64isar0, boot->reg_id_aa64isar0);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR1_EL1, cpu,
> +				      info->reg_id_aa64isar1, boot->reg_id_aa64isar1);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR2_EL1, cpu,
> +				      info->reg_id_aa64isar2, boot->reg_id_aa64isar2);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64ISAR3_EL1, cpu,
> +				      info->reg_id_aa64isar3, boot->reg_id_aa64isar3);
> +
> +	/*
> +	 * Differing PARange support is fine as long as all peripherals and
> +	 * memory are mapped within the minimum PARange of all CPUs.
> +	 * Linux should not care about secure memory.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR0_EL1, cpu,
> +				      info->reg_id_aa64mmfr0, boot->reg_id_aa64mmfr0);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR1_EL1, cpu,
> +				      info->reg_id_aa64mmfr1, boot->reg_id_aa64mmfr1);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR2_EL1, cpu,
> +				      info->reg_id_aa64mmfr2, boot->reg_id_aa64mmfr2);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR3_EL1, cpu,
> +				      info->reg_id_aa64mmfr3, boot->reg_id_aa64mmfr3);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64MMFR4_EL1, cpu,
> +				      info->reg_id_aa64mmfr4, boot->reg_id_aa64mmfr4);
> +
> +	taint |= check_update_ftr_reg(SYS_ID_AA64PFR0_EL1, cpu,
> +				      info->reg_id_aa64pfr0, boot->reg_id_aa64pfr0);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64PFR1_EL1, cpu,
> +				      info->reg_id_aa64pfr1, boot->reg_id_aa64pfr1);
> +	taint |= check_update_ftr_reg(SYS_ID_AA64PFR2_EL1, cpu,
> +				      info->reg_id_aa64pfr2, boot->reg_id_aa64pfr2);
> +
> +	taint |= check_update_ftr_reg(SYS_ID_AA64ZFR0_EL1, cpu,
> +				      info->reg_id_aa64zfr0, boot->reg_id_aa64zfr0);
> +
> +	taint |= check_update_ftr_reg(SYS_ID_AA64SMFR0_EL1, cpu,
> +				      info->reg_id_aa64smfr0, boot->reg_id_aa64smfr0);
> +
> +	taint |= check_update_ftr_reg(SYS_ID_AA64FPFR0_EL1, cpu,
> +				      info->reg_id_aa64fpfr0, boot->reg_id_aa64fpfr0);
> +
> +	/* Probe vector lengths */
> +	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
> +	    id_aa64pfr0_sve(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		if (!system_capabilities_finalized()) {
> +			unsigned long cpacr = cpacr_save_enable_kernel_sve();
> +
> +			vec_update_vq_map(ARM64_VEC_SVE);
> +
> +			cpacr_restore(cpacr);
> +		}
> +	}
> +
> +	if (IS_ENABLED(CONFIG_ARM64_SME) &&
> +	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
> +		unsigned long cpacr = cpacr_save_enable_kernel_sme();
> +
> +		/* Probe vector lengths */
> +		if (!system_capabilities_finalized())
> +			vec_update_vq_map(ARM64_VEC_SME);
> +
> +		cpacr_restore(cpacr);
> +	}
> +
> +	if (detect_ftr_has_mpam()) {
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
> +					info->reg_mpamidr, boot->reg_mpamidr);
> +	}
> +
> +	/*
> +	 * The kernel uses the LDGM/STGM instructions and the number of tags
> +	 * they read/write depends on the GMID_EL1.BS field. Check that the
> +	 * value is the same on all CPUs.
> +	 */
> +	if (gmid_el1_accessible(info))
> +		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
> +					      info->reg_gmid, boot->reg_gmid);
> +
> +	/*
> +	 * If we don't have AArch32 at all then skip the checks entirely
> +	 * as the register values may be UNKNOWN and we're not going to be
> +	 * using them for anything.
> +	 *
> +	 * This relies on a sanitised view of the AArch64 ID registers
> +	 * (e.g. SYS_ID_AA64PFR0_EL1), so we call it last.
> +	 */
> +	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
> +		lazy_init_32bit_cpu_features(info, boot);
> +		taint |= update_32bit_cpu_features(cpu, &info->aarch32,
> +						   &boot->aarch32);
> +	}
> +
> +	/*
> +	 * Mismatched CPU features are a recipe for disaster. Don't even
> +	 * pretend to support them.
> +	 */
> +	if (taint) {
> +		pr_warn_once("Unsupported CPU feature variation detected.\n");
> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +	}
>  }
>  
>  bool this_cpu_has_cap(unsigned int n)


