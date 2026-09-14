Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A20FC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPxySZczGSklo6sItWGCoBKraOEj6tEcXZ+MDWoS6tc=; b=cbN/gI1RREnv29xae5bPH1rbx/
	edIeGoM2sUiJ8cOucgZCM8ZViu+yEHD44tVL9W9qDBW6QaP1sIVeJmO+1pfQM/dKcDp/OdEJaLn/D
	I8xQ8JMRNeCD5hcfyIzOrIfZ7ZjuPE32fsR1p5c0BW77gdQxKuELx4rUWpR/0hxCy6bw0PDc8hd1U
	fWnpBLQfw3wDe+eTC8aDEo9h/kdGTbjhxTN8KNE+mYWEU84ijeL0qOCduTkDl7/pJTIPcP8vFJN7p
	kXNIyHuQIbuVTPpJOYkBaD7+gs98BsBCzAXaqFmRqOohxVb6SrRp1rqjx896kfr4xsSiHO2go9pOZ
	6zwS1YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Ac-00000002Zxg-1UqD;
	Mon, 14 Sep 2026 07:32:06 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x619t-00000002ZrI-11Em
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789371081; x=1820907081;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=D/w0Nd7mMBMXBwcmirCSoGgamOmcMh+0zKgJNohHTyU=;
  b=JbgYu0lxkTvxebDMPDMggUJEpZvFIXEAL9LWJaNtfFsE/K6o1GMhpYN0
   gYf3AXyHJoCagm6lcgxtjekNNIAPo16xnabZ3o2WghBX7gIodxKJnj7pz
   +JiLB8TmynXFU6CZ8zHsSF44ShkDKt6aZKA8JkksTStvFTu3TCepi9Jqz
   /roq0YMFD8h3YdDt8FEeEgyUSgpHXHCDPkUgO34t6pbHGqKIRjgqP5mH3
   /ix80YDUCz60Pg3N3a7K765VvpqMe//3G1qkC8v2Lz3pfuTF8l0d7UPqS
   NJas+uC4bx+R4mWxUFWgl5+GPc0YMbszvDCozpaQ2cuPcibjTl5pzPLV/
   w==;
X-CSE-ConnectionGUID: SBrGTWPlSj2PDFuZWqFOqg==
X-CSE-MsgGUID: Rnjo5Qk8Sli0XNu1bqQTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="232694194"
X-IronPort-AV: E=Sophos;i="6.27,102,1786978800"; 
   d="scan'208";a="232694194"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:31:19 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A13A51C00083
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4E4AE1800EBA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:19 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 90E2A180012C;
	Mon, 14 Sep 2026 07:31:13 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Date: Mon, 14 Sep 2026 16:30:46 +0900
Subject: [PATCH v2 3/3] KVM: arm64: selftests: Test 52-bit guest virtual
 addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm64-52bit-va-v2-3-3911cb9d4ad4@fujitsu.com>
References: <20260914-arm64-52bit-va-v2-0-3911cb9d4ad4@fujitsu.com>
In-Reply-To: <20260914-arm64-52bit-va-v2-0-3911cb9d4ad4@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789371056; l=4315;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=D/w0Nd7mMBMXBwcmirCSoGgamOmcMh+0zKgJNohHTyU=;
 b=VA0ne9nO2NfJtWMm9NxCz3CmVr9fkGlNn8NDYp2vGUuIDTaOEeAvCHVW02A5c5d5QN+mOmvw6
 P533nSEpYopCtjYRq6O4Pb1k4WBfmehGom4eFkGDD9Sp51UzYxkxnBf
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003125_073515_CD7D247A 
X-CRM114-Status: GOOD (  16.72  )
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

Exercise reads and writes through low and high guest virtual addresses
in the 52-bit VA modes with 4K, 16K and 64K pages. Verify that mappings
to the same GPA share data and mappings to distinct GPAs remain
independent.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
---
 tools/testing/selftests/kvm/Makefile.kvm     |   1 +
 tools/testing/selftests/kvm/arm64/lpa_test.c | 124 +++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 96bab7002d39..1e9d059ffb24 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -179,6 +179,7 @@ TEST_GEN_PROGS_arm64 += arm64/hello_el2
 TEST_GEN_PROGS_arm64 += arm64/host_sve
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
+TEST_GEN_PROGS_arm64 += arm64/lpa_test
 TEST_GEN_PROGS_arm64 += arm64/mmio_sign_ext
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
diff --git a/tools/testing/selftests/kvm/arm64/lpa_test.c b/tools/testing/selftests/kvm/arm64/lpa_test.c
new file mode 100644
index 000000000000..8fe6f254db28
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/lpa_test.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Higher virtual addresses read/write test
+ */
+#include <test_util.h>
+
+#include "kvm_syscalls.h"
+#include "kvm_util.h"
+#include "ucall_common.h"
+#include "guest_modes.h"
+#include "processor.h"
+
+#define LOW_GVA		0xc0000000
+#define HIGH_GVA (LOW_GVA | BIT(48))
+
+static void guest_code(void)
+{
+	u64 *low = (u64 *)LOW_GVA;
+	u64 *high = (u64 *)HIGH_GVA;
+
+	WRITE_ONCE(*low, 1);
+	GUEST_ASSERT_EQ(READ_ONCE(*high), 1);
+	WRITE_ONCE(*high, 2);
+	GUEST_ASSERT_EQ(READ_ONCE(*low), 2);
+
+	GUEST_SYNC(0);
+
+	asm volatile("dsb sy\n\t"
+		     "tlbi vmalle1is\n\t"
+		     "dsb sy\n\t"
+		     "isb"
+		     : : : "memory");
+
+	GUEST_SYNC(1); /* Host installs HIGH_GVA -> gpa_b. */
+
+	asm volatile("dsb sy\n\t"
+		     "isb\n\t"
+		     : : : "memory");
+
+	/* low and high map to different GPAs. */
+	WRITE_ONCE(*low,  1);
+	WRITE_ONCE(*high, 2);
+
+	/* Check both after both writes to detect accidental aliasing. */
+	GUEST_ASSERT_EQ(READ_ONCE(*low),  1);
+	GUEST_ASSERT_EQ(READ_ONCE(*high), 2);
+
+	/* Updating the low mapping must not change the high mapping. */
+	WRITE_ONCE(*low, 3);
+
+	GUEST_ASSERT_EQ(READ_ONCE(*low),  3);
+	GUEST_ASSERT_EQ(READ_ONCE(*high), 2);
+
+	GUEST_DONE();
+}
+
+static void run_test(enum vm_guest_mode mode, void *arg)
+{
+	unsigned int *nr_tests = arg;
+	struct kvm_vcpu_init init;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	struct ucall uc;
+
+	if (mode != VM_MODE_P52V52_4K &&
+	    mode != VM_MODE_P52V52_16K &&
+	    mode != VM_MODE_P52V52_64K)
+		return;
+
+	vm = __vm_create(VM_SHAPE(mode), 1, 0);
+	kvm_get_default_vcpu_target(vm, &init);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
+	u64 gpa_a = vm_phy_pages_alloc(vm, 1, 0, 0);
+	u64 gpa_b = vm_phy_pages_alloc(vm, 1, 0, 0);
+
+	virt_pg_map(vm, LOW_GVA, gpa_a);
+	virt_pg_map(vm, HIGH_GVA, gpa_a);
+
+	for (;;) {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_DONE:
+			goto done;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_SYNC:
+			switch (uc.args[1]) {
+			case 0:
+				WRITE_ONCE(*virt_get_pte_hva(vm, HIGH_GVA), 0);
+				break;
+			case 1:
+				virt_pg_map(vm, HIGH_GVA, gpa_b);
+				break;
+			default:
+				TEST_FAIL("Unexpected sync stage: %lu\n", uc.args[1]);
+			}
+			/* Complete the host's PTE store before resuming the guest. */
+			asm volatile("dsb sy" : : : "memory");
+			break;
+		default:
+			TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
+		}
+	}
+
+done:
+	kvm_vm_free(vm);
+	(*nr_tests)++;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned int nr_tests = 0;
+
+	for_each_guest_mode(run_test, &nr_tests);
+	if (!nr_tests)
+		ksft_exit_skip("No supported 52-bit VA guest mode; skipping test\n");
+	return 0;
+}

-- 
2.43.0


