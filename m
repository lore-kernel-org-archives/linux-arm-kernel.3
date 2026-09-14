Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52000C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpstWXsEGNxvTAnG53+JLBqVzfY5FoROk7Pvi0Mk+sY=; b=qFWwaSzi6Ri9ZteI9xF2BYDXir
	ulsg5+tBiCNphA8Jegrd5+TdDm3DW1KBgG2GDprEG+HnHEtpySqn6Pa+xf9dS5v676tHzIE8Qumtd
	/JNsBpmP7+UnJllLhWw0zQDq1+aB+OkcqgfYcGRu5IBRoyd/O/s/ZOGWeNFucM6bOkriwDpiyL35b
	9OmleCHhHx+QsI948Z3Stujy1OweFN0xUqichquL9iQ0euH9aY7KgwZCj6fdmmzgsOBY/1WsBse8S
	Fr/QCgSznOHD0Q3XWG1u52s8vFlOXGYsHjTKk/QVpi5s4AUZOLVaHKBzvAKx+fay0syzePHfSLP6/
	8BVU5QYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6553-00000003LH1-2I1x;
	Mon, 14 Sep 2026 11:42:37 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x654z-00000003LAS-0xN6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:36 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjs6084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:52 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=CpstWXsEGNxvTAnG53+JLBqVzfY5FoROk7Pvi0Mk+sY=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386113; v=1;
        b=KUM1bhIrNB5o0u7+SEav68b3BZwTf/oYxZ1Bd2HeDp4MMZ2D/DTusgAfYlkFR2qj
         GPHAzBR04pPcagwh7M56BHLp/xD6MgqDN5tZSxm3cXL6RWDGupkr5ub4bA2WQLCo
         iIegMATIE6GPZAgON7qJ1OQq6rBCNUpbix0qBvc1mUF0Mu/SjZJSl3Rtcw0FtsfB
         ZkwxfMZh2hfbOwLQTu7N3nSevkX+LdhBjBhKch7PvYcBhgJqwOwIDX8Z845ps0EM
         v5a5GnEB4vif+ay9jZwe9ZnPqQp0ohm70yL9O0LL13kceEVSl/jE33sEukrt5xKc
         xAH/1x00S4/Yz3YVuhjwJg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:43 +0900
Subject: [PATCH v10 04/20] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-4-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=7qyZ3yw8xwXvroToHAs5qx3zfIpA0akFceWmVOkFa8E=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu7li/+fc3Xds+zOzU6WzG66//Cfke4dZ5/I13dT6q
 bofU+8d7yhlYRDjYpAVU2RJKdrNrRFd+6kwIb4FZg4rE8gQBi5OAZjI7yeMDAu5U+4wm22+sai+
 3ltw+xnV1N9zU7wmRzLFP3OdsCOr3IWR4f7KXom5v1gSBYVYll67JObC9Vh2XozfXL1vm3p2JWw
 IZgUA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044233_716218_3B577738 
X-CRM114-Status: GOOD (  13.73  )
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


