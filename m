Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QXb7I5ISK2eyUB28iO3XdQ43tFZeAsjauIQ7utsE2JM=; b=PpMKUgWMtcQsUaXM+gL+PfwZlM
	MKx4gSP9I/FGCoD+s2pCBWvm+f6cxzy6f9PKdJi1BQNowpNzd5MXI5f3RxmpiPVWx6nqrLxxuMBb4
	04C+zWMFlqfki3kbQRVChdd2GKlNgAV+iRxvr/NxmqHCI2sEjVpD/kqNHq8LSD7cG+UEJehpJwSiS
	C0vnG+jQo6JxGrLJ6/smayn28mxfPlmhLEgDPGl/bAHSedW0TeZf5qn7/4kyoyDGkoLkPGnyz25G5
	a2GmgESeZHwNpO5QtKBvm00wk/vgsoTHf/WhS2t1rpamKxNec0FAI2UciNY1IIIzltoJ9j464ygvF
	yceHdf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduK3-00000000Jr6-3GS4;
	Mon, 21 Jul 2025 17:29:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsnr-000000007RX-1gGJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0E965C5F3B;
	Mon, 21 Jul 2025 15:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6982CC4CEED;
	Mon, 21 Jul 2025 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753113106;
	bh=VorkCIfYnj7vmwv7ZzNhcKzHZkJ7O3RYK53j5I6L8r8=;
	h=From:To:Cc:Subject:Date:From;
	b=NdejrZHvsrvTqLWyUXBZrfvBkmifO+w7JV0xzvU559yvRrMC3HgIkI251X96cBhlX
	 G/7QvuRzgMUnqFP01vKT10CGFvKzLZXyJA09oXTC5BR7PQQFES1WJH3r85MWuPDgf9
	 C4lsKLiiPzBDFWkuLpQcd8/0Toxye0GMMEWuKfxVYYnJW5f9rH/9GV8sdAoUH7VP3v
	 NxZyPA/ix3TmkT8ZjHONCXlldXtrSXENlzdqce9zWTMVqOkRv2bptD0ECE42Pcy8JC
	 IdsfSrvwl/DnLAfzb/p4S3bZoXp8ONu62hDDRZnsJejcOjLRa50DIorxvi0qV2KZ30
	 lSmgIv9zJ5c1A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1udsno-0004Du-F5;
	Mon, 21 Jul 2025 16:51:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	jackabt@amazon.com
Subject: [PATCH] KVM: arm64: selftest: Add standalone test checking for KVM's own UUID
Date: Mon, 21 Jul 2025 16:51:36 +0100
Message-Id: <20250721155136.892255-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, mark.rutland@arm.com, jackabt@amazon.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085147_522405_BE02C5C9 
X-CRM114-Status: GOOD (  17.27  )
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
Link: https://lore.kernel.org/r/20250721130558.50823-1-jackabt.amazon@gmail.com
---
 tools/testing/selftests/kvm/Makefile.kvm     |  1 +
 tools/testing/selftests/kvm/arm64/kvm-uuid.c | 67 ++++++++++++++++++++
 2 files changed, 68 insertions(+)
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
index 0000000000000..89d9c8b182ae5
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/kvm-uuid.c
@@ -0,0 +1,67 @@
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
+	__GUEST_ASSERT(res.a0 != SMCCC_RET_NOT_SUPPORTED, "a0 = %lx\n", res.a0);
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


