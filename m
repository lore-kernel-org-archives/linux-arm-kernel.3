Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D022CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTtS07MfviJyEaY+N9R7ajICJvCSMgvCSOy+KIG93PE=; b=QUQplVMWNqG9B8fCDuJOicE9Sv
	OOd1lHpPI/LmSIjfwbC5/tOZS2cAcl5c3zn5HXzm0IEGy76SB4e/h5FB3AHebGdwa8hu5GxjxD+hB
	LR0TXJaSh/JVLQ+VXxSxskLn6LIA2SRoVF+KNa/eUTcBgvS4KAtKTFySkttNAHG7TrgoMTjRWP006
	6xVFYEfoNrnOvFidMHM72zLKV5skz56KmmOkMgbQM1sWLybgt5sMORGBzdZn3M0ze13irNU6i5JDE
	V3W9GaT1M5A02q6TEm5BaWZbejLALw+E6pEF89A7aKv+b1+qj3pl8nnd6MqtNHfYYHB/aGIKyg4wj
	rFlJDeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaX-0000000ErT2-04cp;
	Wed, 17 Sep 2025 21:21:17 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaP-0000000ErLe-3Fd1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:21:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTtS07MfviJyEaY+N9R7ajICJvCSMgvCSOy+KIG93PE=;
	b=VTVEZUYzQHby6xuEAEJVK96hOMdAJF6djJ77NFyt6qrVxpMrgtMVX+RVvC7+wRlc8Twn9Q
	6/D0qERl19yWqSEhklVuroPArxUrBnJNHoe/qP0jmuNr4OvTciCEJpb7I/AEzMeF6MxHzx
	GzfUzHMFn1KVxDoP20x0XTCshn0AIt8=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 03/13] KVM: arm64: selftests: Add helper to check for VGICv3 support
Date: Wed, 17 Sep 2025 14:20:33 -0700
Message-ID: <20250917212044.294760-4-oliver.upton@linux.dev>
In-Reply-To: <20250917212044.294760-1-oliver.upton@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142110_003081_7AC573EC 
X-CRM114-Status: GOOD (  14.46  )
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

Introduce a proper predicate for probing VGICv3 by performing a 'test'
creation of the device on a dummy VM.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 tools/testing/selftests/kvm/arm64/arch_timer.c        |  3 ++-
 .../selftests/kvm/arm64/arch_timer_edge_cases.c       |  3 ++-
 tools/testing/selftests/kvm/arm64/vgic_irq.c          |  3 ++-
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c   |  4 ++--
 .../testing/selftests/kvm/arm64/vpmu_counter_access.c |  3 +--
 tools/testing/selftests/kvm/include/arm64/vgic.h      |  1 +
 tools/testing/selftests/kvm/lib/arm64/vgic.c          | 11 +++++++++++
 7 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer.c b/tools/testing/selftests/kvm/arm64/arch_timer.c
index eeba1cc87ff8..aaf4285f832a 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer.c
@@ -184,6 +184,8 @@ struct kvm_vm *test_vm_create(void)
 	unsigned int i;
 	int nr_vcpus = test_args.nr_vcpus;
 
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 
 	vm_init_descriptor_tables(vm);
@@ -205,7 +207,6 @@ struct kvm_vm *test_vm_create(void)
 
 	test_init_timer_irq(vm);
 	gic_fd = vgic_v3_setup(vm, nr_vcpus, 64);
-	__TEST_REQUIRE(gic_fd >= 0, "Failed to create vgic-v3");
 
 	/* Make all the test's cmdline args visible to the guest */
 	sync_global_to_guest(vm, test_args);
diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index ce74d069cb7b..d349d80d8418 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -952,7 +952,6 @@ static void test_vm_create(struct kvm_vm **vm, struct kvm_vcpu **vcpu,
 
 	test_init_timer_irq(*vm, *vcpu);
 	gic_fd = vgic_v3_setup(*vm, 1, 64);
-	__TEST_REQUIRE(gic_fd >= 0, "Failed to create vgic-v3");
 
 	sync_global_to_guest(*vm, test_args);
 	sync_global_to_guest(*vm, CVAL_MAX);
@@ -1042,6 +1041,8 @@ int main(int argc, char *argv[])
 	/* Tell stdout not to buffer its content */
 	setbuf(stdout, NULL);
 
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index a09dd423c2d7..9fc9e8e44ecd 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -752,7 +752,6 @@ static void test_vgic(uint32_t nr_irqs, bool level_sensitive, bool eoi_split)
 	vcpu_args_set(vcpu, 1, args_gva);
 
 	gic_fd = vgic_v3_setup(vm, 1, nr_irqs);
-	__TEST_REQUIRE(gic_fd >= 0, "Failed to create vgic-v3, skipping");
 
 	vm_install_exception_handler(vm, VECTOR_IRQ_CURRENT,
 		guest_irq_handlers[args.eoi_split][args.level_sensitive]);
@@ -802,6 +801,8 @@ int main(int argc, char **argv)
 	int opt;
 	bool eoi_split = false;
 
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+
 	while ((opt = getopt(argc, argv, "hn:e:l:")) != -1) {
 		switch (opt) {
 		case 'n':
diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index fc4fe52fb6f8..cc2b21d374af 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -215,8 +215,6 @@ static void setup_test_data(void)
 static void setup_gic(void)
 {
 	gic_fd = vgic_v3_setup(vm, test_data.nr_cpus, 64);
-	__TEST_REQUIRE(gic_fd >= 0, "Failed to create GICv3");
-
 	its_fd = vgic_its_setup(vm);
 }
 
@@ -374,6 +372,8 @@ int main(int argc, char **argv)
 	u32 nr_threads;
 	int c;
 
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+
 	while ((c = getopt(argc, argv, "hv:d:e:i:")) != -1) {
 		switch (c) {
 		case 'v':
diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index a0c4ab839155..01f61657de45 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -436,8 +436,6 @@ static void create_vpmu_vm(void *guest_code)
 	vpmu_vm.vcpu = aarch64_vcpu_add(vpmu_vm.vm, 0, &init, guest_code);
 	vcpu_init_descriptor_tables(vpmu_vm.vcpu);
 	vpmu_vm.gic_fd = vgic_v3_setup(vpmu_vm.vm, 1, 64);
-	__TEST_REQUIRE(vpmu_vm.gic_fd >= 0,
-		       "Failed to create vgic-v3, skipping");
 
 	/* Make sure that PMUv3 support is indicated in the ID register */
 	dfr0 = vcpu_get_reg(vpmu_vm.vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64DFR0_EL1));
@@ -634,6 +632,7 @@ int main(void)
 	uint64_t i, pmcr_n;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+	TEST_REQUIRE(kvm_supports_vgic_v3());
 
 	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
diff --git a/tools/testing/selftests/kvm/include/arm64/vgic.h b/tools/testing/selftests/kvm/include/arm64/vgic.h
index c481d0c00a5d..b858fa8195b4 100644
--- a/tools/testing/selftests/kvm/include/arm64/vgic.h
+++ b/tools/testing/selftests/kvm/include/arm64/vgic.h
@@ -16,6 +16,7 @@
 	((uint64_t)(flags) << 12) | \
 	index)
 
+bool kvm_supports_vgic_v3(void);
 int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs);
 
 #define VGIC_MAX_RESERVED	1023
diff --git a/tools/testing/selftests/kvm/lib/arm64/vgic.c b/tools/testing/selftests/kvm/lib/arm64/vgic.c
index 64e793795563..661744c6532e 100644
--- a/tools/testing/selftests/kvm/lib/arm64/vgic.c
+++ b/tools/testing/selftests/kvm/lib/arm64/vgic.c
@@ -15,6 +15,17 @@
 #include "gic.h"
 #include "gic_v3.h"
 
+bool kvm_supports_vgic_v3(void)
+{
+	struct kvm_vm *vm = vm_create_barebones();
+	int r;
+
+	r = __kvm_test_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
+	kvm_vm_free(vm);
+
+	return !r;
+}
+
 /*
  * vGIC-v3 default host setup
  *
-- 
2.47.3


