Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16795C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYEs9xswMzBDyBjUxtxtigy4/JLKkYUFuFgFozAQkI0=; b=U7ERfGpMiOla+duHXqwmJOKMFF
	RF6B3a/TK1LNrZFRxa3L7bVC+dzXcQh7n37dKKAekQbHKZSjHdPqHdQIxzzHeHltK8InCYwD83k2O
	YqABxy09YyxRXClqWVksLFcx7/0iiPCuY43FoQV6XLliJAOyTqe4FGuDEoWcdvsWKkDanvTboVNx7
	+KnnpYoH3mD3QTdlTcD0LhPgyjCAiiI1T7Jsy8S+7cH5qvGqwv402BIwxE/7I/1Wjmp9Ei5lnWfWk
	1OHBi+ZOeNmQiqzIdYdF8ZFxamQfjfabkkLToRRBzIIZYCMcBtgvAoECMoEUepAyNMI4/Mx6pgoKo
	519XgX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhno-0000000FtGG-05CK;
	Wed, 06 Aug 2025 17:19:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhi1-0000000Frhb-0OG4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D6F601DC;
	Wed,  6 Aug 2025 17:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C76EC4CEE7;
	Wed,  6 Aug 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500428;
	bh=8Vggf2SHfGzqRxDTnJWCQ5dqoRdquclLk4o1w8m9LAY=;
	h=From:To:Cc:Subject:Date:From;
	b=WrScxnv5OUixV5aL9DREM83KxjMw3FTOVgzNslxJDOEal41plYlUNIzbs8c6hmrHg
	 yznHJAT9kF9YgzFC0ZfEj+YThXOuIUcjKoSGw8qWo2qAfZncP7xYgnMBA2qZ+2a09U
	 92YVK0IFtTWsCzJWyVyZFgleVkm/+vd74u7fEa8h1/CgB7++Pk/i3AN1TSE2nKhVjG
	 XzIqI26Mu5uqfzrpACpDxNT3IaLo/ayyRnfhBjFxo2t7SRoAmNGJIzsey3ad9t46/8
	 /0QcorrKNt9r//Zjg9tPwRLOf8lZjo9YyU1wdGKPgs5WjcUJEPXkTOz5ljwZSi1tWf
	 Lrq3PF8LE5NEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ujhhy-004Ztc-33;
	Wed, 06 Aug 2025 18:13:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	ajones@ventanamicro.com,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2] KVM: arm64: selftest: Add standalone test checking for KVM's own UUID
Date: Wed,  6 Aug 2025 18:13:41 +0100
Message-Id: <20250806171341.1521210-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, ajones@ventanamicro.com, sebott@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Tinkering with UUIDs is a perilious task, and the KVM UUID gets
broken at times. In order to spot this early enough, add a selftest
that will shout if the expected value isn't found.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Link: https://lore.kernel.org/r/20250721130558.50823-1-jackabt.amazon@gmail.com
---
 tools/testing/selftests/kvm/Makefile.kvm     |  1 +
 tools/testing/selftests/kvm/arm64/kvm-uuid.c | 70 ++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/kvm-uuid.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ce817a975e50a..e1eb1ba238a2a 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -167,6 +167,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
+TEST_GEN_PROGS_arm64 += arm64/kvm-uuid
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/arm64/kvm-uuid.c b/tools/testing/selftests/kvm/arm64/kvm-uuid.c
new file mode 100644
index 0000000000000..af9581b860f14
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/kvm-uuid.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Check that nobody has tampered with KVM's UID
+
+#include <errno.h>
+#include <linux/arm-smccc.h>
+#include <asm/kvm.h>
+#include <kvm_util.h>
+
+#include "processor.h"
+
+/*
+ * Do NOT redefine these constants, or try to replace them with some
+ * "common" version. They are hardcoded here to detect any potential
+ * breakage happening in the rest of the kernel.
+ *
+ * KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74
+ */
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0	0xb66fb428U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1	0xe911c52eU
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2	0x564bcaa9U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3	0x743a004dU
+
+static void guest_code(void)
+{
+	struct arm_smccc_res res = {};
+
+	smccc_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, 0, 0, 0, 0, 0, 0, 0, &res);
+
+	__GUEST_ASSERT(res.a0 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 &&
+		       res.a1 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 &&
+		       res.a2 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 &&
+		       res.a3 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3,
+		       "Unexpected KVM-specific UID %lx %lx %lx %lx\n", res.a0, res.a1, res.a2, res.a3);
+	GUEST_DONE();
+}
+
+int main (int argc, char *argv[])
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	bool guest_done = false;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	while (!guest_done) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			break;
+		case UCALL_DONE:
+			guest_done = true;
+			break;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			printf("%s", uc.buffer);
+			break;
+		default:
+			TEST_FAIL("Unexpected guest exit");
+		}
+	}
+
+	kvm_vm_free(vm);
+
+	return 0;
+}
-- 
2.39.2


