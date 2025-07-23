Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4982CC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 05:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA1e6tIe1q/f8YKsxu0RC4sJJPF8dFYdwsq0PAFgbro=; b=omO84FUh2TqSTHEzezwu1+fxvS
	bfYmj+GOjJcKaMTZfh+UhbXHLt0ZhA4L50PH8WiotvKM36CPgc3v5EYqXC/jikyw3DdqOKjnsz4Xk
	QbCRP8UJZm68ygqpD9Tn2GSxy8exNBkI/c1HVhF4n/Ps5CRyDQF0E0d6NLUQOMHdGnJPvxlvUbS3/
	+FpzhXiLzcmZOAfmTtFx0re/5RVVkPsY5wXzSkQZpjhtz3XGJ21G2BXhKzEcJSPJ8jdewx6V9mj+3
	VAui8Yh/qZmRmOD2ds5rNIlz28FgwlWEtcaZ5Cl4YLKJFU95MsBCyiJrc2/180nbhgoPOpVSHbFJE
	+bNbT2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRdi-000000041v3-0grb;
	Wed, 23 Jul 2025 05:03:38 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRbD-000000041fu-2w7f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 05:01:06 +0000
Date: Wed, 23 Jul 2025 14:00:40 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753246848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MA1e6tIe1q/f8YKsxu0RC4sJJPF8dFYdwsq0PAFgbro=;
	b=s24ZxwtLfZeYsTN907uL220wg7rD/EG4VU9oloCdKKsdlq+BCt5WhZptejrfQeLnyriBpO
	AKy6yuSGZoF3fe5UTqHUVSlh/X+q1UO64wPUjmRqaIR7LhamQSbmfiiJzJDftl/ZgILqod
	Q25cNlqmmguuLt/oWXKNzRHObOLA1L4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 4/4] KVM: arm64: selftest: vgic-v3: Add basic GICv3
 sysreg userspace access test
Message-ID: <aIBseJ3aO+hMVAee@vm4>
References: <20250718111154.104029-1-maz@kernel.org>
 <20250718111154.104029-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718111154.104029-5-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_220103_883593_E8160B79 
X-CRM114-Status: GOOD (  27.27  )
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

On Fri, Jul 18, 2025 at 12:11:54PM +0100, Marc Zyngier wrote:
> We have a lot of more or less useful vgic tests, but none of them
> tracks the availability of GICv3 system registers, which is a bit
> annoying.
> 
> Add one such test, which covers both EL1 and EL2 registers.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I've tested this selftest on the RevC FVP with kvm-arm.mode=nested.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Running GIC_v3 tests.
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='657'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='682'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='682'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='657'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='657'
SKIP SYS_ICC_AP0R1_EL1 for read
SKIP SYS_ICC_AP0R1_EL1 for write
SKIP SYS_ICC_AP0R2_EL1 for read
SKIP SYS_ICC_AP0R2_EL1 for write
SKIP SYS_ICC_AP0R3_EL1 for read
SKIP SYS_ICC_AP0R3_EL1 for write
SKIP SYS_ICC_AP1R1_EL1 for read
SKIP SYS_ICC_AP1R1_EL1 for write
SKIP SYS_ICC_AP1R2_EL1 for read
SKIP SYS_ICC_AP1R2_EL1 for write
SKIP SYS_ICC_AP1R3_EL1 for read
SKIP SYS_ICC_AP1R3_EL1 for write
SKIP SYS_ICH_AP0R1_EL2 for read
SKIP SYS_ICH_AP0R1_EL2 for write
SKIP SYS_ICH_AP0R2_EL2 for read
SKIP SYS_ICH_AP0R2_EL2 for write
SKIP SYS_ICH_AP0R3_EL2 for read
SKIP SYS_ICH_AP0R3_EL2 for write
SKIP SYS_ICH_AP1R1_EL2 for read
SKIP SYS_ICH_AP1R1_EL2 for write
SKIP SYS_ICH_AP1R2_EL2 for read
SKIP SYS_ICH_AP1R2_EL2 for write
SKIP SYS_ICH_AP1R3_EL2 for read
SKIP SYS_ICH_AP1R3_EL2 for write
__vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='672'




> ---
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 219 +++++++++++++++++-
>  1 file changed, 217 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
> index b3b5fb0ff0a9a..7d508dcdbf23d 100644
> --- a/tools/testing/selftests/kvm/arm64/vgic_init.c
> +++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
> @@ -9,6 +9,8 @@
>  #include <asm/kvm.h>
>  #include <asm/kvm_para.h>
>  
> +#include <arm64/gic_v3.h>
> +
>  #include "test_util.h"
>  #include "kvm_util.h"
>  #include "processor.h"
> @@ -18,8 +20,6 @@
>  
>  #define REG_OFFSET(vcpu, offset) (((uint64_t)vcpu << 32) | offset)
>  
> -#define GICR_TYPER 0x8
> -
>  #define VGIC_DEV_IS_V2(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V2)
>  #define VGIC_DEV_IS_V3(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V3)
>  
> @@ -715,6 +715,220 @@ int test_kvm_device(uint32_t gic_dev_type)
>  	return 0;
>  }
>  
> +struct sr_def {
> +	const char	*name;
> +	u32		encoding;
> +};
> +
> +#define PACK_SR(r)						\
> +	((sys_reg_Op0(r) << 14) |				\
> +	 (sys_reg_Op1(r) << 11) |				\
> +	 (sys_reg_CRn(r) << 7) |				\
> +	 (sys_reg_CRm(r) << 3) |				\
> +	 (sys_reg_Op2(r)))
> +
> +#define SR(r)							\
> +	{							\
> +		.name		= #r,				\
> +		.encoding	= r,				\
> +	}
> +
> +static const struct sr_def sysregs_el1[] = {
> +	SR(SYS_ICC_PMR_EL1),
> +	SR(SYS_ICC_BPR0_EL1),
> +	SR(SYS_ICC_AP0R0_EL1),
> +	SR(SYS_ICC_AP0R1_EL1),
> +	SR(SYS_ICC_AP0R2_EL1),
> +	SR(SYS_ICC_AP0R3_EL1),
> +	SR(SYS_ICC_AP1R0_EL1),
> +	SR(SYS_ICC_AP1R1_EL1),
> +	SR(SYS_ICC_AP1R2_EL1),
> +	SR(SYS_ICC_AP1R3_EL1),
> +	SR(SYS_ICC_BPR1_EL1),
> +	SR(SYS_ICC_CTLR_EL1),
> +	SR(SYS_ICC_SRE_EL1),
> +	SR(SYS_ICC_IGRPEN0_EL1),
> +	SR(SYS_ICC_IGRPEN1_EL1),
> +};
> +
> +static const struct sr_def sysregs_el2[] = {
> +	SR(SYS_ICH_AP0R0_EL2),
> +	SR(SYS_ICH_AP0R1_EL2),
> +	SR(SYS_ICH_AP0R2_EL2),
> +	SR(SYS_ICH_AP0R3_EL2),
> +	SR(SYS_ICH_AP1R0_EL2),
> +	SR(SYS_ICH_AP1R1_EL2),
> +	SR(SYS_ICH_AP1R2_EL2),
> +	SR(SYS_ICH_AP1R3_EL2),
> +	SR(SYS_ICH_HCR_EL2),
> +	SR(SYS_ICC_SRE_EL2),
> +	SR(SYS_ICH_VTR_EL2),
> +	SR(SYS_ICH_VMCR_EL2),
> +	SR(SYS_ICH_LR0_EL2),
> +	SR(SYS_ICH_LR1_EL2),
> +	SR(SYS_ICH_LR2_EL2),
> +	SR(SYS_ICH_LR3_EL2),
> +	SR(SYS_ICH_LR4_EL2),
> +	SR(SYS_ICH_LR5_EL2),
> +	SR(SYS_ICH_LR6_EL2),
> +	SR(SYS_ICH_LR7_EL2),
> +	SR(SYS_ICH_LR8_EL2),
> +	SR(SYS_ICH_LR9_EL2),
> +	SR(SYS_ICH_LR10_EL2),
> +	SR(SYS_ICH_LR11_EL2),
> +	SR(SYS_ICH_LR12_EL2),
> +	SR(SYS_ICH_LR13_EL2),
> +	SR(SYS_ICH_LR14_EL2),
> +	SR(SYS_ICH_LR15_EL2),
> +};
> +
> +static void test_sysreg_array(int gic, const struct sr_def *sr, int nr,
> +			      int (*check)(int, const struct sr_def *, const char *))
> +{
> +	for (int i = 0; i < nr; i++) {
> +		u64 val;
> +		u64 attr;
> +		int ret;
> +
> +		/* Assume MPIDR_EL1.Aff*=0 */
> +		attr = PACK_SR(sr[i].encoding);
> +
> +		/*
> +		 * The API is braindead. A register can be advertised as
> +		 * available, and yet not be readable or writable.
> +		 * ICC_APnR{1,2,3}_EL1 are examples of such non-sense, and
> +		 * ICH_APnR{1,2,3}_EL2 do follow suit for consistency.
> +		 *
> +		 * On the bright side, no known HW is implementing more than
> +		 * 5 bits of priority, so we're safe. Sort of...
> +		 */
> +		ret = __kvm_has_device_attr(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +					    attr);
> +		TEST_ASSERT(ret == 0, "%s unavailable", sr[i].name);
> +
> +		/* Check that we can write back what we read */
> +		ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +					    attr, &val);
> +		TEST_ASSERT(ret == 0 || !check(gic, &sr[i], "read"), "%s unreadable", sr[i].name);
> +		ret = __kvm_device_attr_set(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +					    attr, &val);
> +		TEST_ASSERT(ret == 0 || !check(gic, &sr[i], "write"), "%s unwritable", sr[i].name);
> +	}
> +}
> +
> +static u8 get_ctlr_pribits(int gic)
> +{
> +	int ret;
> +	u64 val;
> +	u8 pri;
> +
> +	ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +				    PACK_SR(SYS_ICC_CTLR_EL1), &val);
> +	TEST_ASSERT(ret == 0, "ICC_CTLR_EL1 unreadable");
> +
> +	pri = FIELD_GET(ICC_CTLR_EL1_PRI_BITS_MASK, val) + 1;
> +	TEST_ASSERT(pri >= 5 && pri <= 7, "Bad pribits %d", pri);
> +
> +	return pri;
> +}
> +
> +static int check_unaccessible_el1_regs(int gic, const struct sr_def *sr, const char *what)
> +{
> +	switch (sr->encoding) {
> +	case SYS_ICC_AP0R1_EL1:
> +	case SYS_ICC_AP1R1_EL1:
> +		if (get_ctlr_pribits(gic) >= 6)
> +			return -EINVAL;
> +		break;
> +	case SYS_ICC_AP0R2_EL1:
> +	case SYS_ICC_AP0R3_EL1:
> +	case SYS_ICC_AP1R2_EL1:
> +	case SYS_ICC_AP1R3_EL1:
> +		if (get_ctlr_pribits(gic) == 7)
> +			return 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	pr_info("SKIP %s for %s\n", sr->name, what);
> +	return 0;
> +}
> +
> +static u8 get_vtr_pribits(int gic)
> +{
> +	int ret;
> +	u64 val;
> +	u8 pri;
> +
> +	ret = __kvm_device_attr_get(gic, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +				    PACK_SR(SYS_ICH_VTR_EL2), &val);
> +	TEST_ASSERT(ret == 0, "ICH_VTR_EL2 unreadable");
> +
> +	pri = FIELD_GET(ICH_VTR_EL2_PRIbits, val) + 1;
> +	TEST_ASSERT(pri >= 5 && pri <= 7, "Bad pribits %d", pri);
> +
> +	return pri;
> +}
> +
> +static int check_unaccessible_el2_regs(int gic, const struct sr_def *sr, const char *what)
> +{
> +	switch (sr->encoding) {
> +	case SYS_ICH_AP0R1_EL2:
> +	case SYS_ICH_AP1R1_EL2:
> +		if (get_vtr_pribits(gic) >= 6)
> +			return -EINVAL;
> +		break;
> +	case SYS_ICH_AP0R2_EL2:
> +	case SYS_ICH_AP0R3_EL2:
> +	case SYS_ICH_AP1R2_EL2:
> +	case SYS_ICH_AP1R3_EL2:
> +		if (get_vtr_pribits(gic) == 7)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	pr_info("SKIP %s for %s\n", sr->name, what);
> +	return 0;
> +}
> +
> +static void test_v3_sysregs(void)
> +{
> +	struct kvm_vcpu_init init = {};
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	u32 feat = 0;
> +	int gic;
> +
> +	if (kvm_check_cap(KVM_CAP_ARM_EL2))
> +		feat |= BIT(KVM_ARM_VCPU_HAS_EL2);
> +
> +	vm = vm_create(1);
> +
> +	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	init.features[0] |= feat;
> +
> +	vcpu = aarch64_vcpu_add(vm, 0, &init, NULL);
> +	TEST_ASSERT(vcpu, "Can't create a vcpu?");
> +
> +	gic = kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
> +	TEST_ASSERT(gic >= 0, "No GIC???");
> +
> +	kvm_device_attr_set(gic, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
> +
> +	test_sysreg_array(gic, sysregs_el1, ARRAY_SIZE(sysregs_el1), check_unaccessible_el1_regs);
> +	if (feat)
> +		test_sysreg_array(gic, sysregs_el2, ARRAY_SIZE(sysregs_el2), check_unaccessible_el2_regs);
> +	else
> +		pr_info("SKIP EL2 registers, not available\n");
> +
> +	close(gic);
> +	kvm_vm_free(vm);
> +}
> +
>  void run_tests(uint32_t gic_dev_type)
>  {
>  	test_vcpus_then_vgic(gic_dev_type);
> @@ -730,6 +944,7 @@ void run_tests(uint32_t gic_dev_type)
>  		test_v3_last_bit_single_rdist();
>  		test_v3_redist_ipa_range_check_at_vcpu_run();
>  		test_v3_its_region();
> +		test_v3_sysregs();
>  	}
>  }
>  
> -- 
> 2.39.2
> 

