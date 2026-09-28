Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA73CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzW+DoplX+7bWCCIqR4EX9cR3RPfTWP4kuyc+eFgZqU=; b=QKVvQDXUQvLcROqBWJZ5b5AURX
	CkS25d4t9Q+dnqWomqXE5ty/XJTPhKowPf6hTRyVcifh72z3LAXrBkBIhyY2cyGk3uyL1RW1vATsb
	95TIbyQMIphutkL12udUg9yK/mNJjejrSn6zCZX0Vnjj0wmAtUBTan9VRENo8hfwRuN26cOPV2vi6
	iW9h5nxzly+iVOxj3jYD2DXiUY4MCChs0S1gSGc/xDCrWem1mp6KJ4N55eUECW2Q3JKg49UP3/VfP
	azZlRlm1Rra3iICWXB3fHoPeRtFeVsZPB8ieg6NVjUtI8BbHfID9dqmz/8pRFEcd+MIHK86rqedFY
	axZV0d6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFz-00000000uBB-1Nmh;
	Mon, 28 Sep 2026 15:27:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFw-00000000u9U-2nAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:27:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3109600D1;
	Mon, 28 Sep 2026 15:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457CC1F000FF;
	Mon, 28 Sep 2026 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790609223;
	bh=uzW+DoplX+7bWCCIqR4EX9cR3RPfTWP4kuyc+eFgZqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oo5JqlvrZUIxEHjV2gwVYY9/SCCN51ptPDGYSqgi0rW4AVfJbbzryHTw8aUc+yisj
	 vMHEVCFQEq0EfLesrRLTFumbyg4T5L4jGTo+eQRIYWUa+zpsB0ydZPs+Zw8KxLrp1J
	 DFOiY6beLZmLhTFPyEpNCyKtOpmSsNAQcEfcMPLtaKrJ9xoIvch/9XtX6+ZIQ3oh1Z
	 w6GQativWszEl3aJroiqiV4xejPP3/7u2FFHed44eeGN9VjKz7Y2dtPixcMMgh+mbQ
	 qQND9+28OXmfpVqiYshyQiH6XLY7zqrAkvxDnNkBO1WphVkDbQYSgJ4ugDICQUZ5dr
	 SEyzrQdLHlS5Q==
Date: Mon, 28 Sep 2026 16:26:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] KVM: selftests: arm64: Report set_id_reg reads of
 test registers as tests
Message-ID: <arqE3CNeYyQpgcMf@gremlin>
References: <20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org>
 <20260901-kvm-arm64-set-id-regs-aarch64-v7-1-7b065b0bda9a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-kvm-arm64-set-id-regs-aarch64-v7-1-7b065b0bda9a@kernel.org>
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

On Tue, Sep 01, 2026 at 07:50:01PM +0100, Mark Brown wrote:
> Currently when we run guest code to validate that the values we wrote to
> the registers are seen by the guest we assert that these values match using
> a KVM selftests level assert, resulting in unclear diagnostics if the test
> fails. Replace this assert with reporting a kselftest test per register.
>
> In order to support getting the names of the registers we repaint the array
> of ID_ registers to store the names and open code the rest.
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

All looks reasonable to me.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Couple comments below but more like understanding-your-changes stuff.

> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 82 +++++++++++++++++++------
>  1 file changed, 63 insertions(+), 19 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 7429a1055df5..db6414a93ad3 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -43,6 +43,7 @@ struct reg_ftr_bits {
>  };
>
>  struct test_feature_reg {
> +	const char *name;
>  	u32 reg;
>  	const struct reg_ftr_bits *ftr_bits;
>  };
> @@ -227,30 +228,32 @@ static const struct reg_ftr_bits ftr_id_aa64zfr0_el1[] = {
>
>  #define TEST_REG(id, table)			\
>  	{					\
> -		.reg = id,			\
> +		.name = #id,			\
> +		.reg = SYS_ ## id,		\
>  		.ftr_bits = &((table)[0]),	\
>  	}
>
>  static struct test_feature_reg test_regs[] = {
> -	TEST_REG(SYS_ID_AA64DFR0_EL1, ftr_id_aa64dfr0_el1),
> -	TEST_REG(SYS_ID_DFR0_EL1, ftr_id_dfr0_el1),
> -	TEST_REG(SYS_ID_AA64ISAR0_EL1, ftr_id_aa64isar0_el1),
> -	TEST_REG(SYS_ID_AA64ISAR1_EL1, ftr_id_aa64isar1_el1),
> -	TEST_REG(SYS_ID_AA64ISAR2_EL1, ftr_id_aa64isar2_el1),
> -	TEST_REG(SYS_ID_AA64ISAR3_EL1, ftr_id_aa64isar3_el1),
> -	TEST_REG(SYS_ID_AA64PFR0_EL1, ftr_id_aa64pfr0_el1),
> -	TEST_REG(SYS_ID_AA64PFR1_EL1, ftr_id_aa64pfr1_el1),
> -	TEST_REG(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
> -	TEST_REG(SYS_ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
> -	TEST_REG(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
> -	TEST_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3_el1),
> -	TEST_REG(SYS_ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
> +	TEST_REG(ID_AA64DFR0_EL1, ftr_id_aa64dfr0_el1),
> +	TEST_REG(ID_DFR0_EL1, ftr_id_dfr0_el1),
> +	TEST_REG(ID_AA64ISAR0_EL1, ftr_id_aa64isar0_el1),
> +	TEST_REG(ID_AA64ISAR1_EL1, ftr_id_aa64isar1_el1),
> +	TEST_REG(ID_AA64ISAR2_EL1, ftr_id_aa64isar2_el1),
> +	TEST_REG(ID_AA64ISAR3_EL1, ftr_id_aa64isar3_el1),
> +	TEST_REG(ID_AA64PFR0_EL1, ftr_id_aa64pfr0_el1),
> +	TEST_REG(ID_AA64PFR1_EL1, ftr_id_aa64pfr1_el1),
> +	TEST_REG(ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
> +	TEST_REG(ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
> +	TEST_REG(ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
> +	TEST_REG(ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3_el1),
> +	TEST_REG(ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
>  };
>
>  #define GUEST_REG_SYNC(id) GUEST_SYNC_ARGS(0, id, read_sysreg_s(id), 0, 0);
>
>  static void guest_code(void)
>  {
> +	/* Registers in test_regs array */
>  	GUEST_REG_SYNC(SYS_ID_AA64DFR0_EL1);
>  	GUEST_REG_SYNC(SYS_ID_DFR0_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64ISAR0_EL1);
> @@ -264,6 +267,8 @@ static void guest_code(void)
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
>  	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
> +
> +	/* Additional registers counted in NUM_EXTRA_REGS */
>  	GUEST_REG_SYNC(SYS_MPIDR_EL1);
>  	GUEST_REG_SYNC(SYS_CLIDR_EL1);
>  	GUEST_REG_SYNC(SYS_CTR_EL0);
> @@ -274,6 +279,35 @@ static void guest_code(void)
>  	GUEST_DONE();
>  }
>
> +#define NUM_EXTRA_REGS 6
> +#define GUEST_READ_TEST (ARRAY_SIZE(test_regs) + NUM_EXTRA_REGS)
> +
> +static const char *get_reg_name(u64 id)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
> +		if (test_regs[i].reg == id)
> +			return test_regs[i].name;
> +
> +	switch (id) {
> +	case SYS_MPIDR_EL1:
> +		return "MPIDR_EL1";
> +	case SYS_CLIDR_EL1:
> +		return "CLIDR_EL1";
> +	case SYS_CTR_EL0:
> +		return "CTR_EL0";
> +	case SYS_MIDR_EL1:
> +		return "MIDR_EL1";
> +	case SYS_REVIDR_EL1:
> +		return "REVIDR_EL1";
> +	case SYS_AIDR_EL1:
> +		return "AIDR_EL1";
> +	default:
> +		TEST_FAIL("Unknown register");
> +	}

I guess these are for GUEST_REG_SYNC() registers, etc. that don't appear in the
TEST_REG() list?

> +}
> +
>  /* Return a safe value to a given ftr_bits an ftr value */
>  u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
>  {
> @@ -674,7 +708,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
>  	struct ucall uc;
>
>  	while (!done) {
> -		u64 val;
> +		u64 reg_id, expected_val, guest_val;
> +		bool match;
>
>  		vcpu_run(vcpu);
>
> @@ -683,11 +718,20 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
>  			REPORT_GUEST_ASSERT(uc);
>  			break;
>  		case UCALL_SYNC:
> -			val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> -			val = reset_mutable_bits(uc.args[2], val);
> +			expected_val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> +			expected_val = reset_mutable_bits(uc.args[2], expected_val);
>
>  			/* Make sure the written values are seen by guest */
> -			TEST_ASSERT_EQ(val, reset_mutable_bits(uc.args[2], uc.args[3]));
> +			reg_id = uc.args[2];
> +			guest_val = reset_mutable_bits(uc.args[2], uc.args[3]);
> +
> +			match = expected_val == guest_val;
> +			if (!match)
> +				ksft_print_msg("%lx != %lx\n",
> +					       expected_val, guest_val);
> +			ksft_test_result(match,
> +					 "%s value seen in guest\n",
> +					 get_reg_name(reg_id));
>  			break;
>  		case UCALL_DONE:
>  			done = true;
> @@ -828,7 +872,7 @@ int main(void)
>
>  	ksft_print_header();
>
> -	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
> +	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;

I guess because you made things use TAP now?

>  	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
>  		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
>  			test_cnt++;
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

