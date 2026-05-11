Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B6CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+mHaivvSxVuGabpkI+AAIbqLWFGcKnD2EZbza8et9I=; b=KMlPPtQO/EdK00bYJseM5GIcor
	T0w1MZW2Pj/Ni9CzxG6W4cKlpPBBaEtPvLtHEftMM2zCdkW3t1oeVX2DHSm9z9pddL7p+MQj/lFNt
	5HDQg+zo2v4PPlAVrlTns/5dY9c+DLCmH0jhHVu/1xbwSf64mtnRfK/K6XWJhEzXCMsOfVsFoTv3J
	TfRWibYFCXd9CrSuNkunIfpbHkrXEgqP5XAotW9U8XojrFbcRst56zeRzQyy+wOpmPJzfQdNwplnc
	9dCrtdwhf92vwdgXkWBvJnarsJPc1bKExe3hzQZeeEPxpIxtA6GCvp+cAnTkOoGGn8+N+kdJgHtvq
	zp+zMbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvd-0000000DLVC-0stY;
	Mon, 11 May 2026 11:36:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvb-0000000DLU6-29dD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=P+mHaivvSxVuGabpkI+AAIbqLWFGcKnD2EZbza8et9I=; b=We+TJptwrQUIPCdTFHKp0f5kLX
	t7MXPvamC6HFxmmEj04JOZ2jXPDlKcqkOd9XHz98+3ypRnIuxqcQMVSYyEGjDkVUxhxbs2zbHuHNX
	LRVfoDZyNL1C1GcxN1mmjFa1Ys8NndS2TkJFIFww5DQRl3irpJsfki8wPxOBgRR4KLbUJ+XQg/cqY
	A3BmfqE5j45y1er14F3rJIsTd4XvEinETF5wQUJNWDexLVskzVQmgOR3G3yRFHkDv+qkh97f7Tz40
	90bSHVzJyh+MJeVIheMHPqSY9x2jocRW2Ua3sYZdBhyJQU+7k5FiFDrVRaJSkCKSGHVW1YbTilp4p
	IM4LKCgg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvY-000000084dL-1sNR;
	Mon, 11 May 2026 11:36:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wMOvY-0000000Dx0Y-0umI;
	Mon, 11 May 2026 12:36:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Kees Cook <kees@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] KVM: arm64: selftests: Add vgic IIDR revision test
Date: Mon, 11 May 2026 12:30:44 +0100
Message-ID: <20260511113558.3325004-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511113558.3325004-1-dwmw2@infradead.org>
References: <20260511113558.3325004-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Test that the GICD_IIDR implementation revision correctly controls
guest-visible behaviour for GICv3:

  Revision 1: IGROUPR reads as all-ones (group 1), writes are ignored.
              GICR_CTLR.{IR,CES} not advertised.
  Revision 2: IGROUPR is guest-configurable (read/write).
              GICR_CTLR.{IR,CES} not advertised.
  Revision 3: IGROUPR is guest-configurable (read/write).
              GICR_CTLR.{IR,CES} advertised.

For each revision, the test sets the IIDR via KVM_DEV_ARM_VGIC_GRP_DIST_REGS
before initializing the vGIC, then runs a guest that verifies the
expected IGROUPR and GICR_CTLR behaviour.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vgic_group_iidr.c     | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/vgic_group_iidr.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..8cadfed4d79a 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -177,6 +177,7 @@ TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
 TEST_GEN_PROGS_arm64 += arm64/smccc_filter
 TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
+TEST_GEN_PROGS_arm64 += arm64/vgic_group_iidr
 TEST_GEN_PROGS_arm64 += arm64/vgic_init
 TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
diff --git a/tools/testing/selftests/kvm/arm64/vgic_group_iidr.c b/tools/testing/selftests/kvm/arm64/vgic_group_iidr.c
new file mode 100644
index 000000000000..0073ccc19e92
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/vgic_group_iidr.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * vgic_group_iidr.c - Test IGROUPR behaviour across IIDR revisions
+ *
+ * Validate that the GICD_IIDR implementation revision controls
+ * IGROUPR semantics for GICv3:
+ *   Rev 1: IGROUPR reads as all-ones (group 1), writes ignored
+ *   Rev 2+: IGROUPR is guest-configurable (read/write)
+ */
+#include <linux/sizes.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "gic.h"
+#include "gic_v3.h"
+#include "vgic.h"
+
+#define NR_IRQS		128
+#define SPI_IGROUPR	(GICD_IGROUPR + (32 / 32) * 4) /* intids 32-63 */
+
+static uint64_t shared_rev;
+
+static void guest_code(void)
+{
+	uint32_t val;
+
+	val = readl(GICD_BASE_GVA + SPI_IGROUPR);
+
+	if (shared_rev == 1) {
+		/* Rev 1: all group 1, guest writes must be ignored */
+		GUEST_ASSERT_EQ(val, 0xffffffff);
+		writel(0x0, GICD_BASE_GVA + SPI_IGROUPR);
+		val = readl(GICD_BASE_GVA + SPI_IGROUPR);
+		GUEST_ASSERT_EQ(val, 0xffffffff);
+		writel(0x55aa55aa, GICD_BASE_GVA + SPI_IGROUPR);
+		val = readl(GICD_BASE_GVA + SPI_IGROUPR);
+		GUEST_ASSERT_EQ(val, 0xffffffff);
+	} else {
+		/* Rev 2/3: guest-configurable */
+		writel(0xa5a5a5a5, GICD_BASE_GVA + SPI_IGROUPR);
+		val = readl(GICD_BASE_GVA + SPI_IGROUPR);
+		GUEST_ASSERT_EQ(val, 0xa5a5a5a5);
+		writel(0x0, GICD_BASE_GVA + SPI_IGROUPR);
+		val = readl(GICD_BASE_GVA + SPI_IGROUPR);
+		GUEST_ASSERT_EQ(val, 0x0);
+	}
+
+	/* Rev 3: GICR_CTLR advertises IR and CES. Rev 1/2: it does not. */
+	val = readl(GICR_BASE_GVA + GICR_CTLR);
+	if (shared_rev >= 3)
+		GUEST_ASSERT(val & (GICR_CTLR_IR | GICR_CTLR_CES));
+	else
+		GUEST_ASSERT(!(val & (GICR_CTLR_IR | GICR_CTLR_CES)));
+
+	GUEST_DONE();
+}
+
+static void run_test(int rev)
+{
+	struct kvm_vcpu *vcpus[1];
+	struct kvm_vm *vm;
+	struct ucall uc;
+	uint32_t iidr;
+	int gic_fd;
+
+	pr_info("Testing IIDR revision %d\n", rev);
+
+	test_disable_default_vgic();
+	vm = vm_create_with_vcpus(1, guest_code, vcpus);
+
+	gic_fd = __vgic_v3_setup(vm, 1, NR_IRQS);
+	TEST_ASSERT(gic_fd >= 0, "Failed to create vGICv3");
+
+	/* Set the requested IIDR revision before init. */
+	kvm_device_attr_get(gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+			    GICD_IIDR, &iidr);
+	iidr &= ~GICD_IIDR_REVISION_MASK;
+	iidr |= rev << GICD_IIDR_REVISION_SHIFT;
+	kvm_device_attr_set(gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+			    GICD_IIDR, &iidr);
+
+	__vgic_v3_init(gic_fd);
+
+	/* Verify the revision was applied. */
+	kvm_device_attr_get(gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+			    GICD_IIDR, &iidr);
+	TEST_ASSERT(((iidr & GICD_IIDR_REVISION_MASK) >> GICD_IIDR_REVISION_SHIFT) == rev,
+		    "IIDR revision readback: expected %d, got %d",
+		    rev, (iidr & GICD_IIDR_REVISION_MASK) >> GICD_IIDR_REVISION_SHIFT);
+
+	/* Tell the guest which revision we set. */
+	sync_global_to_guest(vm, shared_rev);
+	shared_rev = rev;
+	sync_global_to_guest(vm, shared_rev);
+
+	vcpu_run(vcpus[0]);
+	switch (get_ucall(vcpus[0], &uc)) {
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_DONE:
+		break;
+	default:
+		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+	}
+
+	close(gic_fd);
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	run_test(1);
+	run_test(2);
+	run_test(3);
+	return 0;
+}
-- 
2.51.0


