Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC74C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeRo16GwGxWMem/Vo4ri2U5hfNnBxk9Oq5X7cUuthyE=; b=Y73KZ0h0sVH/BKZPI9xDjKr0eO
	vvGHZBuzSA3VBjGXH9Cusj1cFYQNMw77Gn7ukPRqQmTLXy6aZLUtHpkHyaR+GOiNzraDT8/5nBCjx
	2bOcTEtCsKF4JgQ0OX/kCDDMVgqKJ2rEvCi7OPzlB72MXl5O04kFDQwmW8FHnZpVF/ghMgo2mdDiS
	UD3patdxcIK070jD3cA9w9TXpPLczIoabkOml6cXN+pxBgy6r3qYkTOy0qS3Tbi4m76482SDnlvSn
	Ea/gVNrLrhxomfkdFXiKIzxfOirXXf/1MoMf5SOCOEQELCAMTAhEuc5ZDD6+5sfI5riPEMq8Xy5TU
	sxXR0hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8NX-00000008jk0-3UI3;
	Wed, 29 Jul 2026 17:47:39 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8NU-00000008jiy-31Mv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:47:38 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqDEC5l/NtFPQySDuiSPpdgJRZyazo/TQLwu6/okyLGk66OVb8QZbtRL2U/G8mG5HJr7vq2oSfkrhWj4ZjKDzdi@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IeRo16GwGxWMem/Vo4ri2U5hfNnBxk9Oq5X7cUuthyE=;
	b=LvIDRLjWEGPcykfMeIYjpAZvtrEjZvqijvEHTTbqyoUJeOLPZYSyDWisDzaK88Dw+wUPqB
	PKthOESFKzBQtaKmgBPmRJ2Y4yJW3ho2Hn8cl8bXc99wkAxHuNGDOchS5Ot7HuQJl8rAms
	qbdXYWgCKMBmmri+fWsdkTcn6wkjN1g=
X-Gm-Message-State: AOJu0Yycfy+aKZpDfdkg/QmjTpeq5BHZxJgkM2eZYv5tzDTUiIIsFWCt
	i4wA4Wp7r+zUOCGR6vO6+jDFUE1+byF7AHMdqlEZ8WaPpCXDlhlhh5ShbegbseL6oYGtiHFmW+T
	8S3Lh60QuIPzgJnWvPmlpP4YpUXbNBX39YOVTHP1o
X-Received: by 2002:a05:6512:1314:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b2d9b614acmr37313e87.6.1785347243412; Wed, 29 Jul 2026
 10:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-8-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-8-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:46:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyEnNGrZHbHKK9cW0-kOynrDqZVwRb0MeLAM=wGUYFbRw@mail.gmail.com>
X-Gm-Features: AUfX_mwpeXBo_K7R-ZzBlG5aqjhgeVn_6sJDBLp3FQhFslgMr5nn9WZIS1Jgf5E
Message-ID: <CA+EHjTyEnNGrZHbHKK9cW0-kOynrDqZVwRb0MeLAM=wGUYFbRw@mail.gmail.com>
Subject: Re: [PATCH v9 08/16] KVM: arm64: selftests: Cover PMU state in MDCR_EL2
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_104736_928011_92E58A55 
X-CRM114-Status: GOOD (  24.28  )
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

On Mon, 20 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Add MDCR_EL2 coverage to vpmu_counter_access when EL2 is available.
>
> For each configured PMCR_EL0.N value, verify that an arbitrary HPMN
> value, including one above the configured counter count, round-trips
> through KVM_SET_ONE_REG and survives SET_NR_COUNTERS. Also verify that
> HPME can be toggled without disturbing HPMN and that KVM_ARM_VCPU_INIT
> resets HPMN from the configured count.
>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  .../selftests/kvm/arm64/vpmu_counter_access.c      | 90 ++++++++++++++++++++--
>  1 file changed, 85 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index 3b5bb421f401..73f04e4c6ca3 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -25,6 +25,14 @@
>  /* The cycle counter bit position that's common among the PMU registers */
>  #define ARMV8_PMU_CYCLE_IDX            31
>
> +#ifndef MDCR_EL2_HPMN
> +#define MDCR_EL2_HPMN                  GENMASK_ULL(4, 0)
> +#endif
> +
> +#ifndef MDCR_EL2_HPME
> +#define MDCR_EL2_HPME                  BIT_ULL(7)
> +#endif
> +
>  struct vpmu_vm {
>         struct kvm_vm *vm;
>         struct kvm_vcpu *vcpu;
> @@ -466,15 +474,12 @@ static void guest_code_done(void)
>         GUEST_DONE();
>  }
>
> -static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
> +static void set_nr_counters(struct kvm_vcpu *vcpu,
> +                           unsigned int nr_counters, bool expect_fail)
>  {
> -       struct kvm_vcpu *vcpu;
>         unsigned int prev;
>         int ret;
>
> -       create_vpmu_vm(guest_code);
> -       vcpu = vpmu_vm.vcpu;
> -
>         prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
>
>         ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> @@ -486,6 +491,17 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
>                             nr_counters, prev);
>         else
>                 TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +}
> +
> +static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
> +                                                bool expect_fail)
> +{
> +       struct kvm_vcpu *vcpu;
> +
> +       create_vpmu_vm(guest_code);
> +       vcpu = vpmu_vm.vcpu;
> +
> +       set_nr_counters(vcpu, nr_counters, expect_fail);
>
>         vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
>  }
> @@ -588,6 +604,69 @@ static void run_pmregs_validity_test(u64 pmcr_n)
>         destroy_vpmu_vm();
>  }
>
> +static void run_mdcr_el2_validity_test(u64 pmcr_n)
> +{
> +       struct kvm_vcpu_init init;
> +       struct kvm_vcpu *vcpu;
> +       u64 expected_mdcr, mdcr;
> +
> +       pr_debug("MDCR_EL2 test with pmcr_n %lu\n", pmcr_n);
> +
> +       create_vpmu_vm(guest_code);
> +       if (!vm_supports_el2(vpmu_vm.vm)) {
> +               destroy_vpmu_vm();
> +               return;
> +       }
> +
> +       vcpu = vpmu_vm.vcpu;
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       expected_mdcr = u64_replace_bits(mdcr, FIELD_MAX(MDCR_EL2_HPMN),
> +                                        MDCR_EL2_HPMN);
> +       vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
> +                    expected_mdcr);
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       TEST_ASSERT(mdcr == expected_mdcr,
> +                   "MDCR_EL2 was not properly updated after HPMN write (expected 0x%lx, got 0x%lx)",
> +                   expected_mdcr, mdcr);
> +
> +       set_nr_counters(vcpu, pmcr_n, false);
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       TEST_ASSERT(mdcr == expected_mdcr,
> +                   "MDCR_EL2 changed after PMU_V3_SET_NR_COUNTERS (expected 0x%lx, got 0x%lx)",
> +                   expected_mdcr, mdcr);
> +
> +       vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       TEST_ASSERT(mdcr == expected_mdcr,
> +                   "MDCR_EL2 changed after PMU_V3_INIT (expected 0x%lx, got 0x%lx)",
> +                   expected_mdcr, mdcr);
> +
> +       expected_mdcr = mdcr ^ MDCR_EL2_HPME;
> +       vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
> +                    expected_mdcr);
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       TEST_ASSERT(mdcr == expected_mdcr,
> +                   "MDCR_EL2 was not properly updated after HPME write (expected 0x%lx, got 0x%lx)",
> +                   expected_mdcr, mdcr);
> +
> +       kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
> +       init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
> +       aarch64_vcpu_setup(vcpu, &init);
> +
> +       mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
> +       TEST_ASSERT(FIELD_GET(MDCR_EL2_HPMN, mdcr) == pmcr_n,
> +                   "MDCR_EL2.HPMN is not reset after INIT (expected %lu, got %lu)",
> +                   pmcr_n, FIELD_GET(MDCR_EL2_HPMN, mdcr));
> +
> +       destroy_vpmu_vm();
> +}
> +
>  /*
>   * Create a guest with one vCPU, and attempt to set the PMCR_EL0.N for
>   * the vCPU to @pmcr_n, which is larger than the host value.
> @@ -672,6 +751,7 @@ int main(void)
>         for (i = 0; i <= pmcr_n; i++) {
>                 run_access_test(i);
>                 run_pmregs_validity_test(i);
> +               run_mdcr_el2_validity_test(i);
>         }
>
>         for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
>
> --
> 2.55.0
>
>

