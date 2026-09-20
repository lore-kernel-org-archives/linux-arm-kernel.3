Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787FBC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpstWXsEGNxvTAnG53+JLBqVzfY5FoROk7Pvi0Mk+sY=; b=fZN83Dg0LIG2a8Saf+PyEsoyBK
	SoPswV3GE6SaK7HaMGspULLNiqWv7+/dGJvlsqxrmlfEx6KHtPl38SEyHu/rrgRQLTrrptcPT7Wmd
	042PrvDJXh9INjWp0FW1VSyGDaD0KyzXzz+7fL4pRsq6L4knEEHf3pCKoScdQKQ4/D3BLqzyHRVkV
	G/4JIQ4VN4yYXrD6ntknnfozZaBBVG0b6nuJiwjjr2psd2TA+6jy1avQgfu712XzeW+P6VHP7r48i
	dUduLuAOH6sbJcIixEUyGmTjtVVyEFPVQyGezOBIT1Sk+obeRXI5tqK8kH5qj+pwGaBNXeIoW4Cmk
	lWg3//iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY3-0000000HKEm-3DXb;
	Sun, 20 Sep 2026 11:17:31 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXr-0000000HK69-2p4h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:22 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36R088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:09 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=CpstWXsEGNxvTAnG53+JLBqVzfY5FoROk7Pvi0Mk+sY=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902970; v=1;
        b=swLXvuxCmaz8hB04AEW2oFrcON647nR1UZTKe4ffJumEjp8MwV04mAcw7Tszh5kk
         rIR4jQq2ERwzr3gHkpCW8a4XMpn/b0O/7or2OjHupmFhUHQaG04SlEx2aKcTQv+C
         eBnAvwCtAlI881VIIebctlKfQPILNl6dRbCuPMELx0Wdu1AAZR9wO+naO366C7BT
         I1eWgTPvMegh3THZvdq7orqHnUt/MeP8ZDF65Vfuh5ZRMVTQiATHXOFH25lvHuEF
         1j7sxL2da5EF+ei3qtnc3hq8y54tJzMEEdLcZUk4gvaPgCFpSNyxGEMThPCWESMK
         6qaXH5Qy00xhxk8BOH7kpg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:45 +0900
Subject: [PATCH v11 04/21] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-4-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=7qyZ3yw8xwXvroToHAs5qx3zfIpA0akFceWmVOkFa8E=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A2lXr+g7PReYfHOn6usjIZ/dmvRe1F09wP3FpOeE3
 9l5R7lcOkpZGMS4GGTFFFlSinZza0TXfipMiG+BmcPKBDKEgYtTACYSvpzhv9tLz/1h7+6p8CiL
 MO7inyL9vfzY2p8dzsLpJ7sF2R5VXWb4K/w1d+XRP88/m8rJORQ/Y9YuEbTuLtA7O/fsp/8KXS6
 u3AA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041719_957425_D853917C 
X-CRM114-Status: GOOD (  14.03  )
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

Add a regression test that runs one vCPU and then tries to change the
VM-scoped PMU counter count through an idle sibling. Verify that
SET_NR_COUNTERS fails with EBUSY once any vCPU has run.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c      | 47 ++++++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e..05135bcdb462 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -443,11 +443,10 @@ static void destroy_vpmu_vm(void)
 	kvm_vm_free(vpmu_vm.vm);
 }
 
-static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
+static void run_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
 
-	vcpu_args_set(vcpu, 1, pmcr_n);
 	vcpu_run(vcpu);
 	switch (get_ucall(vcpu, &uc)) {
 	case UCALL_ABORT:
@@ -461,6 +460,11 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
 	}
 }
 
+static void guest_code_done(void)
+{
+	GUEST_DONE();
+}
+
 static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
 {
 	struct kvm_vcpu *vcpu;
@@ -503,7 +507,8 @@ static void run_access_test(u64 pmcr_n)
 	/* Save the initial sp to restore them later to run the guest again */
 	sp = vcpu_get_reg(vcpu, ctxt_reg_alias(vcpu, SYS_SP_EL1));
 
-	run_vcpu(vcpu, pmcr_n);
+	vcpu_args_set(vcpu, 1, pmcr_n);
+	run_vcpu(vcpu);
 
 	/*
 	 * Reset and re-initialize the vCPU, and run the guest code again to
@@ -516,7 +521,8 @@ static void run_access_test(u64 pmcr_n)
 	vcpu_set_reg(vcpu, ctxt_reg_alias(vcpu, SYS_SP_EL1), sp);
 	vcpu_set_reg(vcpu, ARM64_CORE_REG(regs.pc), (u64)guest_code);
 
-	run_vcpu(vcpu, pmcr_n);
+	vcpu_args_set(vcpu, 1, pmcr_n);
+	run_vcpu(vcpu);
 
 	destroy_vpmu_vm();
 }
@@ -622,6 +628,37 @@ static bool kvm_supports_nr_counters_attr(void)
 	return supported;
 }
 
+static void test_set_nr_counters_after_vcpu_run(void)
+{
+	struct kvm_vcpu *running_vcpu, *stopped_vcpu;
+	unsigned int nr_counters = 0;
+	struct kvm_vcpu_init init;
+	struct kvm_vm *vm;
+	int ret;
+	u64 irq = 23;
+
+	vm = vm_create(2);
+	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
+	init.features[0] |= BIT(KVM_ARM_VCPU_PMU_V3);
+	running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
+	stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code_done);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
+	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	run_vcpu(running_vcpu);
+
+	ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS,
+				     &nr_counters);
+	TEST_ASSERT(ret == -1 && errno == EBUSY,
+		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+
+	kvm_vm_free(vm);
+}
+
 int main(void)
 {
 	u64 i, pmcr_n;
@@ -630,6 +667,8 @@ int main(void)
 	TEST_REQUIRE(kvm_supports_vgic_v3());
 	TEST_REQUIRE(kvm_supports_nr_counters_attr());
 
+	test_set_nr_counters_after_vcpu_run();
+
 	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
 		run_access_test(i);

-- 
2.55.0


