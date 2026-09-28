Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE908CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llUYIUStfKzWGEiUSq/kXf7+E7RUJ4s4Q/3ArTaa+qQ=; b=uIDahegWQSYad52U6v4uETHylk
	KY0KkM1AoxQ6FSutPGMQKvjj0H0k2BWtbHd+SkqLGqJDMpjQGNgUJHFQF7vn9fJg40cJrKdqgKxiG
	tEJcRhmB1RVIfeNiKPt7JyCpX3IKi2mMBuPjzW7uVoaohZu4jkTar1w7gVM6MUcklO3747FqG2dxb
	NJCth5IylnsZvpJCkyGlDxw1VUK8gGCDP6ZYY5Bu5GYsdYMsZt5xq7no+xew+XbpfuuxPHU0/rDDV
	PyIyv9zwT65MUyhiEF43nXyX4gw0Sm0Wu8eMJjvdrRf40VditVKBHab7wf2PlJpXT/AzODrvVdKJX
	I5X4sKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDLC-00000000v4d-10ZL;
	Mon, 28 Sep 2026 15:32:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDLB-00000000v4T-01S9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:32:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EAE260052;
	Mon, 28 Sep 2026 15:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD021F000FF;
	Mon, 28 Sep 2026 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790609547;
	bh=llUYIUStfKzWGEiUSq/kXf7+E7RUJ4s4Q/3ArTaa+qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fs3Ja8i4qjApR6LthEA15//qePnT7LSflp7EONKutl5hrr9xCeZ8nsvtDgcdUlQYd
	 2OAqBnjB24xD37WhSPvFTEpmcuFv47XN3UK1uqxvGwEHhFBpia9a5/vEjBJQvLMrDi
	 MpIIDwY3XxdIOp3KU6m75l2KurbE+OqRO26B/cFd2Q10kPRvPAwie0AFQlTbSerfQt
	 KDao/gDp7DUADjZ/d2aCwh9D2+FtJTym2pXP3EoPVqh/YOFNt71HplBziQqjN6ex21
	 0qtsbvj8eW/mAJlcC1X9qppGIMhmWkaxXVxjt+w/+VHQIsHKKQw1XsW6e+bKJXbblH
	 4dOjXJr9QdMwg==
Date: Mon, 28 Sep 2026 16:32:21 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] KVM: selftests: arm64: Report register reset
 tests individually
Message-ID: <arqHe5v75qT2AJwd@gremlin>
References: <20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org>
 <20260901-kvm-arm64-set-id-regs-aarch64-v7-2-7b065b0bda9a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-kvm-arm64-set-id-regs-aarch64-v7-2-7b065b0bda9a@kernel.org>
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

On Tue, Sep 01, 2026 at 07:50:02PM +0100, Mark Brown wrote:
> set_id_regs tests that registers have their values preserved over reset.
> Currently it reports all registers in a single test with an instantly fatal
> assert which isn't great for diagnostics, it's hard to tell which register
> failed or if it's just one register. Change this to report each register as
> a separate test so that it's clear from the program output which registers
> have problems.

Sounds reasonable.

>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

All LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index db6414a93ad3..3aa8886e8b70 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -819,13 +819,21 @@ static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
>  static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, u32 encoding)
>  {
>  	size_t idx = encoding_to_range_idx(encoding);
> -	u64 observed;
> +	u64 observed, expected;
> +	bool pass;
>
>  	observed = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(encoding));
> -	TEST_ASSERT_EQ(reset_mutable_bits(encoding, test_reg_vals[idx]),
> -		       reset_mutable_bits(encoding, observed));
> +	observed = reset_mutable_bits(encoding, observed);
> +	expected = reset_mutable_bits(encoding, test_reg_vals[idx]);
> +	pass = expected == observed;
> +	if (!pass)
> +		ksft_print_msg("%lx != %lx\n", expected, observed);
> +	ksft_test_result(pass, "%s unchanged by reset\n",
> +			 get_reg_name(encoding));

Ah yeah -> individual tests.

>  }
>
> +#define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + NUM_EXTRA_REGS)

Yeah can see from original test_reset_preserves_id_regs() that this is correct.

> +
>  static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
>  {
>  	/*
> @@ -843,8 +851,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
>  	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
>  	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
>  	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
> -
> -	ksft_test_result_pass("%s\n", __func__);
>  }
>
>  int main(void)
> @@ -872,7 +878,8 @@ int main(void)
>
>  	ksft_print_header();
>
> -	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
> +	test_cnt = 2 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
> +		ID_REG_RESET_UNCHANGED_TEST;
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

