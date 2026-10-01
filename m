Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E178CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN28dDZAe3K3lZfF9l0NcUjkfaMwwyHxEzgGdlfdeXA=; b=Og1VKjQL4TeaCyFJ2c2Uhqc83r
	r5oWtQ/J77L07LllfCckloI8qZTw6mn4t/3nKH9zodn3os2dHGbgWzHxthKAAZluOK2twNhYPfBwE
	k0x8OWirxc76DMwWxngFrQKbYpWpuwKVZXuSn1kGeDTxkOH5wQsyfh9CMqCAeeorQGYnBrQrLdUAb
	g1EoJm8pTv4vxYmgnmUxlIrlvI29CvNsvOLxqdelOM/DmEKYoQajJQCcPaEDVg2LGgf16i6PRU8JJ
	oRWvJ1ckE/+m9Ye14bk+uC6Kv4SVKT7ie/QmSWkWvlgp9SnBfSZGDTaml54b4x5BV8guwPblN4Aw+
	Gu2JreWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJlB-00000009jIz-0vzv;
	Thu, 01 Oct 2026 16:35:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJl8-00000009jIF-40x2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8BF6022E;
	Thu,  1 Oct 2026 16:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7932B1F000FF;
	Thu,  1 Oct 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790872549;
	bh=IN28dDZAe3K3lZfF9l0NcUjkfaMwwyHxEzgGdlfdeXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QTrcsHxLZfdUzd6ODa3W8s7j3stVcwcHmwFTAYHF3VmC+oZmCppphB/aUNnA8p2sD
	 NF1a8gRKtWbGWw6QOC4C6eWmwR6FnhmXZudN5GOfcUg2THMXCT9FGQ+NH6NGSvVedU
	 J1Wb+cOAMN+ghusW1AuzeEpLmjzuG77iChkIXQrAIZolPZONjUa52XuNJmN6Z6gBMP
	 AQrsFWjWKANiuKw6uDKO0IrbtAIXNkvYN+lkcTJqOas84YO6eonrUwkIjOUYmDRusM
	 PG6X93IAIm54Uv8qvuNgLSukcuVKAYnizP42ticMm4jbrMSmHQbqBnv880IFBh1AMN
	 f6xzeYYMtkrLw==
Date: Thu, 1 Oct 2026 17:35:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 10/15] KVM: selftests: arm64: Check that invalid
 feature combinations are rejected
Message-ID: <ar6LVCUSUILd8K_d@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-10-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-10-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:20PM +0100, Mark Brown wrote:
> In order to optimise fast paths KVM explicitly rejects configurations with
> S1PIE or S1POE but not TCR2, add coverage of this in the set_id_regs test.
> We have a list of invalid configurations, for each of them we try to run a
> VM and fail the test if it succeeds. We do feature detection by validating
> that we can write the fields with failing values.
>
> Since this misfiring can disrupt some of the other tests due to the kernel
> refusing to start guests we run the new tests first, improving diagnostics
> in the failing case.

Ah so this reflects the changes done to enforce the arch-valid s1pie/poe -> tcr
requirement it seems.

>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Everything seems sensible, so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 87 +++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 7429a1055df5..cb5e6358c59c 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -803,6 +803,89 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
>  	ksft_test_result_pass("%s\n", __func__);
>  }
>
> +struct reg_ftr_val {
> +	u64 reg;
> +	u64 mask;
> +	u64 val;
> +};
> +
> +#define REG_FTR_VAL(r, f, v)					\
> +	{ .reg = ARM64_SYS_REG(sys_reg_Op0(SYS_ ## r),		\
> +			       sys_reg_Op1(SYS_ ## r),		\
> +			       sys_reg_CRn(SYS_ ## r),		\
> +			       sys_reg_CRm(SYS_ ## r),		\
> +			       sys_reg_Op2(SYS_ ## r)),		\
> +	  .mask = r ## _ ## f ## _MASK,				\
> +	  .val = (r ## _ ## f ## _ ## v  << r ## _ ## f ## _SHIFT) }
> +
> +static const struct reg_ftr_val s1pie_no_tcr2[] = {
> +	REG_FTR_VAL(ID_AA64MMFR3_EL1, TCRX, NI),
> +	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1PIE, IMP),
> +	{ }
> +};
> +
> +static const struct reg_ftr_val s1poe_no_tcr2[] = {
> +	REG_FTR_VAL(ID_AA64MMFR3_EL1, TCRX, NI),
> +	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1POE, IMP),
> +	{ }
> +};
> +
> +struct ftr_config {
> +	const char *name;
> +	const struct reg_ftr_val *regs;
> +};
> +
> +static const struct ftr_config invalid_configs[] = {
> +	{ .name = "S1PIE without TCRX", .regs = s1pie_no_tcr2 },
> +	{ .name = "S1POE without TCRX", .regs = s1poe_no_tcr2 },
> +};
> +
> +static void test_invalid_config(const struct ftr_config *config)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	const struct reg_ftr_val *field;
> +	u64 val;
> +	int ret;
> +
> +	vm = vm_create(1);
> +	vm_enable_cap(vm, KVM_CAP_ARM_WRITABLE_IMP_ID_REGS, 0);
> +	vcpu = vm_vcpu_add(vm, 0, guest_code);
> +	kvm_arch_vm_finalize_vcpus(vm);
> +
> +	/*
> +	 * If we don't manage to set any of the fields assume the
> +	 * system does not support the feature and skip the test.
> +	 */
> +	for (field = config->regs; field->reg; field++) {
> +		val = vcpu_get_reg(vcpu, field->reg);
> +		val &= ~field->mask;
> +		val |= field->val;
> +		__vcpu_set_reg(vcpu, field->reg, val);
> +
> +		if (vcpu_get_reg(vcpu, field->reg) != val) {
> +			ksft_print_msg("Test setup not supported\n");
> +			ksft_test_result_skip("refuse %s\n", config->name);
> +			goto out;
> +		}
> +	}
> +
> +	ret = _vcpu_run(vcpu);
> +	ksft_test_result(ret < 0 && errno == EINVAL, "refuse %s\n",
> +			 config->name);
> +out:
> +	kvm_vm_free(vm);
> +}
> +
> +static void test_invalid_configs(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(invalid_configs); i++) {
> +		test_invalid_config(&invalid_configs[i]);
> +	}

VERY NITTY: This is insanely pedantic and I don't mind too much _really_
but in theory should be no {}'s :)

> +}
> +
>  int main(void)
>  {
>  	struct kvm_vcpu *vcpu;
> @@ -829,12 +912,16 @@ int main(void)
>  	ksft_print_header();
>
>  	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
> +	test_cnt += ARRAY_SIZE(invalid_configs);
>  	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
>  		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
>  			test_cnt++;
>
>  	ksft_set_plan(test_cnt);
>
> +	/* Do this first in case a break interferes with other tests */
> +	test_invalid_configs();
> +
>  	test_vm_ftr_id_regs(vcpu, aarch64_only);
>  	test_vcpu_ftr_id_regs(vcpu);
>  	test_vcpu_non_ftr_id_regs(vcpu);
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

