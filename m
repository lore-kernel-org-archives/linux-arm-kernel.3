Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A1CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6gOAz78r5vvYxw3j29DNoIm+CngnMkAn2hvO8B4UoM=; b=W6teu2wFuLcEcLbTKi9dx/H7CB
	ZBdrqVJsWx4C2PRxx1fX4AC6iLcpTPd6OHmj+W/gFXA4mxKNadA6D3czjwUYpo0Wox3gpkG37TIWg
	aaNtLm3uqBypkX7o6L8VwZD42pmzxdvSPjJZNFBZiToZJwjsG7dUixUjiINtJG1o8/y50Tp0FgvPJ
	L9aSUjc3PRxPhxY3icaGPu098MYNgCu6C6mvOE2lCtAiT8sJJr/EE9ukYgYDXSpDsB9lvm6djmcEV
	0S3qUaQe1yQTOLm9IckN1RQckylFzuXrGWhcKT3kHe4QYkRwLTkn9VYz+hTZiafFX4nDVjRbzsEyJ
	LFl6s6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCkQ-0000000BSrG-3jFc;
	Tue, 04 Nov 2025 08:50:38 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCkN-0000000BSqB-2IyR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762246230; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=a6gOAz78r5vvYxw3j29DNoIm+CngnMkAn2hvO8B4UoM=;
	b=Lv6c52uWLwlfcfPR3VFDH/jHwJkQ3ALw1ErlXIoBq8OjY94Ia0BNlRTGwhux/98nrrSNz/zPRBsQI0nOGbGkHdHaYfskMmWxp0dbe5EfkUiZmPDlfl1c0rrb9IrmF1DOwLsCxHSH5wmT+tXFv/uWhhkHufIs7suaCZC1Zx4VVdo=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wrgcs7Z_1762246227 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 04 Nov 2025 16:50:27 +0800
Date: Tue, 4 Nov 2025 16:50:26 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 05/33] KVM: arm64: GICv3: Detect and work around the lack
 of ICV_DIR_EL1 trapping
Message-ID: <eossoxorxj5knjyx2xglsrzhrbi6rry3rcr2xryfmft3q7up4b@tr5yrg6lljzq>
References: <20251103165517.2960148-1-maz@kernel.org>
 <20251103165517.2960148-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103165517.2960148-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005036_211357_E09D6290 
X-CRM114-Status: GOOD (  24.56  )
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

On Mon, Nov 03, 2025 at 04:54:49PM +0800, Marc Zyngier wrote:
> A long time ago, an unsuspecting architect forgot to add a trap
> bit for ICV_DIR_EL1 in ICH_HCR_EL2. Which was unfortunate, but
> what's a bit of spec between friends? Thankfully, this was fixed
> in a later revision, and ARM "deprecates" the lack of trapping
> ability.
>
> Unfortuantely, a few (billion) CPUs went out with that defect,
> anything ARMv8.0 from ARM, give or take. And on these CPUs,
> you can't trap DIR on its own, full stop.
>
> As the next best thing, we can trap everything in the common group,
> which is a tad expensive, but hey ho, that's what you get. You can
> otherwise recycle the HW in the neaby bin.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/virt.h  |  7 ++++++-
>  arch/arm64/kernel/cpufeature.c | 34 ++++++++++++++++++++++++++++++++++
>  arch/arm64/kernel/hyp-stub.S   |  5 +++++
>  arch/arm64/kvm/vgic/vgic-v3.c  |  3 +++
>  arch/arm64/tools/cpucaps       |  1 +
>  5 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> index aa280f356b96a..8eb63d3294974 100644
> --- a/arch/arm64/include/asm/virt.h
> +++ b/arch/arm64/include/asm/virt.h
> @@ -40,8 +40,13 @@
>   */
>  #define HVC_FINALISE_EL2	3
>
> +/*
> + * HVC_GET_ICH_VTR_EL2 - Retrieve the ICH_VTR_EL2 value
> + */
> +#define HVC_GET_ICH_VTR_EL2	4
> +
>  /* Max number of HYP stub hypercalls */
> -#define HVC_STUB_HCALL_NR 4
> +#define HVC_STUB_HCALL_NR 5
>
>  /* Error returned when an invalid stub number is passed into x0 */
>  #define HVC_STUB_ERR	0xbadca11
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5ed401ff79e3e..44103ad98805d 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2303,6 +2303,31 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
>  }
>  #endif
>
> +static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
> +				 int scope)
> +{
> +	struct arm_smccc_res res = {};
> +
> +	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV3_CPUIF);
> +	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV5_LEGACY);
> +	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) ||
> +	    !cpus_have_cap(ARM64_HAS_GICV3_CPUIF))

Duplicated checking ?

> +		return false;
> +
> +	if (!is_hyp_mode_available())
> +		return false;
> +
> +	if (is_kernel_in_hyp_mode())
> +		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
> +	else
> +		arm_smccc_1_1_hvc(HVC_GET_ICH_VTR_EL2, &res);
> +
> +	if (res.a0 == HVC_STUB_ERR)
> +		return false;
> +
> +	return res.a1 & ICH_VTR_EL2_TDS;
> +}
> +
>  #ifdef CONFIG_ARM64_BTI
>  static void bti_enable(const struct arm64_cpu_capabilities *__unused)
>  {
> @@ -2814,6 +2839,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_gic_prio_relaxed_sync,
>  	},
>  #endif
> +	{
> +		/*
> +		 * Depends on having GICv3
> +		 */
> +		.desc = "ICV_DIR_EL1 trapping",
> +		.capability = ARM64_HAS_ICH_HCR_EL2_TDS,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = can_trap_icv_dir_el1,
> +	},
>  #ifdef CONFIG_ARM64_E0PD
>  	{
>  		.desc = "E0PD",
> diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> index 36e2d26b54f5c..ab60fa685f6d8 100644
> --- a/arch/arm64/kernel/hyp-stub.S
> +++ b/arch/arm64/kernel/hyp-stub.S
> @@ -54,6 +54,11 @@ SYM_CODE_START_LOCAL(elx_sync)
>  1:	cmp	x0, #HVC_FINALISE_EL2
>  	b.eq	__finalise_el2
>
> +	cmp	x0, #HVC_GET_ICH_VTR_EL2
> +	b.ne	2f
> +	mrs	x1, ich_vtr_el2
> +	b	9f
> +
>  2:	cmp	x0, #HVC_SOFT_RESTART
>  	b.ne	3f
>  	mov	x0, x2
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index 236d0beef561d..e0c6e03bf9411 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -648,6 +648,9 @@ void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
>  		dir_trap = true;
>  	}
>
> +	if (!cpus_have_cap(ARM64_HAS_ICH_HCR_EL2_TDS))
> +		common_trap = true;
> +
>  	if (group0_trap)
>  		hcr |= ICH_HCR_EL2_TALL0;
>  	if (group1_trap)
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 1b32c1232d28d..77f1bd230722d 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -40,6 +40,7 @@ HAS_GICV5_CPUIF
>  HAS_GICV5_LEGACY
>  HAS_GIC_PRIO_MASKING
>  HAS_GIC_PRIO_RELAXED_SYNC
> +HAS_ICH_HCR_EL2_TDS
>  HAS_HCR_NV1
>  HAS_HCX
>  HAS_LDAPR
> --
> 2.47.3
>

