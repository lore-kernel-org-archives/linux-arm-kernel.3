Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A36C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lniNaSo1hUoB3R0uLY0fE5jF1IOAjXaMQncZzAQRLI=; b=PedE7HhoyO+21HeQBZhgKut4//
	+DzAbfZ0zA3PFtIwVT7xSJJI7Gl+KPxi5RtKqhpGy4KSY0AhxGv/uHqKneqnAJ3L2Io0DY8dwgu/S
	6UHwljMw+ZTaM0QxlsEViZ5Ms7Ago5I/vKcEu3Dqk7WF2ictuC/uPeSTnBQHk7BDsjuD0xQPu7bgy
	Uh3hfAKWtnyNyAUOS6nt9N5Lo1ohGcg6nPuyiu/nhmzPn8+7ed4a+WVntDyVf6+yhfrDNdwbIOGdA
	AYrJJ7jQGTAM7IjK7nk0XZoRN+IsLiRQ8eaXs8U77eYwxKhkR9e8APjLaWJidtpwRk4cyHRGt6JTb
	GnwH+xQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY5-0000000HKIo-0iuI;
	Sun, 20 Sep 2026 11:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY0-0000000HKBW-3e2M
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 11:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6lniNaSo1hUoB3R0uLY0fE5jF1IOAjXaMQncZzAQRLI=; b=XFlHew5bNrdd6G/n5Tmu45iJ9f
	MEOZ5HCYNzBh2r6FDyh7MhGL+DehVd54a2qGSFFLWRh6EDbd/TbyYHtV/W4HAhQeB9Aag66FcCQMe
	9HT/b54qGFTLuBPluzHxFNQEe/xMoxx2CUp0FrEDMZkY42/njKdyGTkfL4f+5rJiN2Xi8WHF8Chh7
	/gJsbqLQcU4WQulBMZo4iuIXYBFjMV9SuVeIQxPgIYqlsz+UxyqPExFo3GgQFZIatGBdWQmEUPsrF
	Pt7tsxcQJopkVBSQYrd++2YbdInQbmDmauG8xvK9ntm0Zl3gQ+Lm1uVTkQM6TUTO5w9sfkYJ4tHRj
	Xu0LFs2w==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8FXv-0000000BL3N-2yHI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:27 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36a088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:14 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=6lniNaSo1hUoB3R0uLY0fE5jF1IOAjXaMQncZzAQRLI=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902974; v=1;
        b=Ydv+XW7MqG3MpqFwfBQsTeZKK41NMdQ5o+i6/so/dXeVHaVb9X9TLrTIMRBSncwa
         0hKqvj8g9wIO93H7kZWijnxWEhjVFklH6yty7dfrLI0MOb9Mz3TJ2sz4nlP0O5nA
         aoKDoBmmZalSgSvKEDD0tIqdZo77NaD6L0TuSmApEGPulzvXBv3hkKEmW+/UjsiW
         TpUPIsVtyQVP+bZKwS8ZV78dHsJHfWEyr9PWIgjBKUS42EkQ8qo1qO9c5hRHCXCe
         bWGYUAbzOh0Lq9oQ765tvE8ZZstUs57XmG9pxPIS1y6P57ZKfyPCFtPJyN9HnLUm
         lVx9tcPCV3OvB10U1F5a9A==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:54 +0900
Subject: [PATCH v11 13/21] KVM: arm64: selftests: Cover PMU state in
 MDCR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-13-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=Tfgm9WXcmRxelzdJdDKljVp7Ced7YFV3TbgyJMrdSII=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A7kd4QLLu3UnPROc6DXX/OoquWsl9m3FR2NtamRi3
 JQaXlzqKGVhEONikBVTZEkp2s2tEV37qTAhvgVmDisTyBAGLk4BmMjiAwz/S6Y3hIeZ+5tv/Xwn
 pVVP2WFZw+1XrMeDd6m0N/+uWHUsm5Fh5crFHjYNCnMc0pOX1zX9YlaNjosvLLDcKdq02idxeSs
 /AA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_121725_945808_6D0F2166 
X-CRM114-Status: GOOD (  16.41  )
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

Add MDCR_EL2 coverage to vpmu_counter_access when EL2 is available.

For each configured PMCR_EL0.N value, verify that an arbitrary HPMN
value, including one above the configured counter count, round-trips
through KVM_SET_ONE_REG and survives SET_NR_COUNTERS. Also verify that
HPME can be toggled without disturbing HPMN and that KVM_ARM_VCPU_INIT
resets HPMN from the configured count.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 90 ++++++++++++++++++++--
 1 file changed, 85 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 05135bcdb462..73b4f1870d3d 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -25,6 +25,14 @@
 /* The cycle counter bit position that's common among the PMU registers */
 #define ARMV8_PMU_CYCLE_IDX		31
 
+#ifndef MDCR_EL2_HPMN
+#define MDCR_EL2_HPMN			GENMASK_ULL(4, 0)
+#endif
+
+#ifndef MDCR_EL2_HPME
+#define MDCR_EL2_HPME			BIT_ULL(7)
+#endif
+
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
@@ -465,15 +473,12 @@ static void guest_code_done(void)
 	GUEST_DONE();
 }
 
-static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
+static void set_nr_counters(struct kvm_vcpu *vcpu,
+			    unsigned int nr_counters, bool expect_fail)
 {
-	struct kvm_vcpu *vcpu;
 	unsigned int prev;
 	int ret;
 
-	create_vpmu_vm(guest_code);
-	vcpu = vpmu_vm.vcpu;
-
 	prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
 
 	ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
@@ -485,6 +490,17 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
 			    nr_counters, prev);
 	else
 		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+}
+
+static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
+						 bool expect_fail)
+{
+	struct kvm_vcpu *vcpu;
+
+	create_vpmu_vm(guest_code);
+	vcpu = vpmu_vm.vcpu;
+
+	set_nr_counters(vcpu, nr_counters, expect_fail);
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
 }
@@ -589,6 +605,69 @@ static void run_pmregs_validity_test(u64 pmcr_n)
 	destroy_vpmu_vm();
 }
 
+static void run_mdcr_el2_validity_test(u64 pmcr_n)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	u64 expected_mdcr, mdcr;
+
+	pr_debug("MDCR_EL2 test with pmcr_n %lu\n", pmcr_n);
+
+	create_vpmu_vm(guest_code);
+	if (!vm_supports_el2(vpmu_vm.vm)) {
+		destroy_vpmu_vm();
+		return;
+	}
+
+	vcpu = vpmu_vm.vcpu;
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	expected_mdcr = u64_replace_bits(mdcr, FIELD_MAX(MDCR_EL2_HPMN),
+					 MDCR_EL2_HPMN);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     expected_mdcr);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 was not properly updated after HPMN write (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	set_nr_counters(vcpu, pmcr_n, false);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 changed after PMU_V3_SET_NR_COUNTERS (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 changed after PMU_V3_INIT (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	expected_mdcr = mdcr ^ MDCR_EL2_HPME;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2),
+		     expected_mdcr);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(mdcr == expected_mdcr,
+		    "MDCR_EL2 was not properly updated after HPME write (expected 0x%lx, got 0x%lx)",
+		    expected_mdcr, mdcr);
+
+	kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	aarch64_vcpu_setup(vcpu, &init);
+
+	mdcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MDCR_EL2));
+	TEST_ASSERT(FIELD_GET(MDCR_EL2_HPMN, mdcr) == pmcr_n,
+		    "MDCR_EL2.HPMN is not reset after INIT (expected %lu, got %lu)",
+		    pmcr_n, FIELD_GET(MDCR_EL2_HPMN, mdcr));
+
+	destroy_vpmu_vm();
+}
+
 /*
  * Create a guest with one vCPU, and attempt to set the PMCR_EL0.N for
  * the vCPU to @pmcr_n, which is larger than the host value.
@@ -673,6 +752,7 @@ int main(void)
 	for (i = 0; i <= pmcr_n; i++) {
 		run_access_test(i);
 		run_pmregs_validity_test(i);
+		run_mdcr_el2_validity_test(i);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)

-- 
2.55.0


