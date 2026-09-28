Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9410CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvjIK8lMJjZQ6TYt7Ry3gctA6WmwroJ6f2WMOorPUPQ=; b=nwWwm+5X4dVhBiZHQHCidt1ip0
	4bvLltYdhPgggM0Azu1Z3qb8u4MctoYOgfkLKIOIBxLTCRraCtHF0HHYdBTkyW06wXwun1oeQKO+H
	RM+3IKUisp5FJmpdak03HwRddV0Gx+Q5PTsvBCYjy0dXPiF2Cek+o27MczduXAKgrq+F6UDXBBQ8t
	C0ty4WSYzbZ1dIlq+0CAB4AWXZXDwB9B49sMwcH903bRh7lTO/Fapzhp89Hp839hVqnxhY31Th8nb
	2e255i+VM4Nsk27ZeMDkxSWS6k7yPGPu4g0kP1Nz25MAHYMD5kQo+2TKxD28YWt79Idwes++7o9qo
	j+9ws/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDVb-00000000w1O-20Pz;
	Mon, 28 Sep 2026 15:43:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDVa-00000000w1F-0bId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4877560052;
	Mon, 28 Sep 2026 15:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20611F000FF;
	Mon, 28 Sep 2026 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790610193;
	bh=WvjIK8lMJjZQ6TYt7Ry3gctA6WmwroJ6f2WMOorPUPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcT7OKmuAFs0uf8ul2TBIRFuaFueW7Kb6CkzFZ6XOaDunxOrqBe3KUlh+ZEoGfa87
	 0sFowvcUP1n3cQ9adY6DXnGNtxKliItjrZLIi1dzwLIu2B69nx2HEeuPisLLMIXS7B
	 Ipbw7ltcGWYiwYGy/ZpT+Loe+Ro15NquMCbhIUxVi8E6ns+fWEGvcG8SRFTOsnTUaH
	 UKob4f0VJ5rmvuZS0XKoe0csPSxFdsEIt8eWw2yZ1w+GTPlHToC3Lb3DS3b76k3+RJ
	 1jPorzDrT/qUDBznGdaeIQGbtNGG64lPI0jSEGHv+WvAU5TweAl2ClO3M2pY36cIdB
	 yUD8iGWfYi0bw==
Date: Mon, 28 Sep 2026 16:43:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] KVM: selftests: arm64: Make set_id_regs bitfield
 validatity checks non-fatal
Message-ID: <arqIqSd33vvr1_lC@gremlin>
References: <20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org>
 <20260901-kvm-arm64-set-id-regs-aarch64-v7-3-7b065b0bda9a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-kvm-arm64-set-id-regs-aarch64-v7-3-7b065b0bda9a@kernel.org>
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

Typo in subject: validatity -> validity

On Tue, Sep 01, 2026 at 07:50:03PM +0100, Mark Brown wrote:
> Currently when set_id_regs encounters a problem checking validation of
> writes to feature registers it uses an immediately fatal assert to report
> the problem. This is not idiomatic for kselftest, and it is also not great
> for usability. The affected bitfield is not clearly reported and further
> tests do not have their results reported.
>
> Switch to using standard kselftest result reporting for the two asserts
> we do, these are non-fatal asserts so allow the program to continue and the
> test names include the affected field.
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

One NIT below and typo noted above, with those addressed LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 3aa8886e8b70..385e1f1c0133 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -422,6 +422,7 @@ static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
>  	u8 shift = ftr_bits->shift;
>  	u64 mask = ftr_bits->mask;
>  	u64 val, new_val, ftr;
> +	bool match;
>
>  	val = vcpu_get_reg(vcpu, reg);
>  	ftr = (val & mask) >> shift;
> @@ -434,7 +435,10 @@ static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
>
>  	vcpu_set_reg(vcpu, reg, val);
>  	new_val = vcpu_get_reg(vcpu, reg);
> -	TEST_ASSERT_EQ(new_val, val);
> +	match = new_val == val;
> +	if (!match)
> +		ksft_print_msg("%lx != %lx\n", new_val, val);
> +	ksft_test_result(match, "%s valid write succeeded\n", ftr_bits->name);

Same pattern (I wonder, not for this series, but perhaps a follow up whether
this could be generalised?)

>
>  	return new_val;
>  }
> @@ -446,6 +450,7 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
>  	u64 mask = ftr_bits->mask;
>  	u64 val, old_val, ftr;
>  	int r;
> +	bool match;
>
>  	val = vcpu_get_reg(vcpu, reg);
>  	ftr = (val & mask) >> shift;
> @@ -462,7 +467,10 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
>  		    "Unexpected KVM_SET_ONE_REG error: r=%d, errno=%d", r, errno);
>

NIT:

There's a:

	TEST_ASSERT(r < 0 && errno == EINVAL,
		    "Unexpected KVM_SET_ONE_REG error: r=%d, errno=%d", r, errno);

Above, do we want to make that non-fatal too?

>  	val = vcpu_get_reg(vcpu, reg);
> -	TEST_ASSERT_EQ(val, old_val);
> +	match = val == old_val;
> +	if (!match)
> +		ksft_print_msg("%lx != %lx\n", val, old_val);
> +	ksft_test_result(match, "%s invalid write rejected\n", ftr_bits->name);
>  }
>
>  static u64 test_reg_vals[KVM_ARM_FEATURE_ID_RANGE_SIZE];
> @@ -502,7 +510,11 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
>  		for (int j = 0;  ftr_bits[j].type != FTR_END; j++) {
>  			/* Skip aarch32 reg on aarch64 only system, since they are RAZ/WI. */
>  			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
> -				ksft_test_result_skip("%s on AARCH64 only system\n",
> +				ksft_print_msg("%s on AARCH64 only system\n",
> +					       ftr_bits[j].name);
> +				ksft_test_result_skip("%s invalid write rejected\n",
> +						      ftr_bits[j].name);
> +				ksft_test_result_skip("%s valid write succeeded\n",
>  						      ftr_bits[j].name);
>  				continue;
>  			}
> @@ -514,8 +526,6 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
>
>  			test_reg_vals[idx] = test_reg_set_success(vcpu, reg,
>  								  &ftr_bits[j]);
> -
> -			ksft_test_result_pass("%s\n", ftr_bits[j].name);
>  		}
>  	}
>  }
> @@ -882,7 +892,7 @@ int main(void)
>  		ID_REG_RESET_UNCHANGED_TEST;
>  	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
>  		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
> -			test_cnt++;
> +			test_cnt += 2;
>
>  	ksft_set_plan(test_cnt);
>
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

