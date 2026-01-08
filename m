Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB5DD1D485
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSwdRmf82yj9ukADZbWAWQ+4GFW8lurapv33SD1yfIY=; b=YZNiFoKBkA6PHJmEj1HTzf9JVj
	x3w5Bp2z4hahH+4VuFEVuKTbShqmqer/B7DWWae/1KR4c10JTnqVk6onRwxTcmaPtF/Vhp1ynrLZQ
	lJUgWEDiPExGGip1YSaLwmk1EkpTCuLH3YjKCH/xnBcWPUec7tkAQipvNbp1QKysc7j1RdjPWl8u2
	sQzUiU9u8QanWkD7SN//uvnMpjxna1Ykp1PPXB3qSYxpIuh1y947XrEgfwcrYzcrFxfu0qg0y3Xmr
	GVVj2DJwhwJUu/UC6BiJBg3aj4z0VDkbS5p7hUmAweKosDfC93/nDZJ/bbzzl2rLFC10sgH70z5Hl
	+VWzTmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsP-00000000PYU-01Hi;
	Thu, 08 Jan 2026 17:32:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsI-00000000PRY-2Jb1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51F6944467;
	Thu,  8 Jan 2026 17:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D6BC19423;
	Thu,  8 Jan 2026 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893560;
	bh=mFCIxq1Io1+/8/dZGLdbcj7k0ZlOIgAOc6ZXHvORl48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZFoHH2UyToVVW/qc7LMVz7hAwYVrLiM1mZ/93mXB5aQzpPwOkKJ5NubTXGxB0zi/
	 pm56bsAmGehEeCQD8Uk692AwBHvIv5T4Q8s4vXbod2DYAnWNRGFjwYTqlo0vOTxMZZ
	 dEM4hCp8D349wPnIkBRX9ecoCj/+WUsAmpNO711bOD6IH8D9Q1EEZySZhxVvTFG7hC
	 KJ36TDOy3ZKg3LKkQIRfq0SwiYN3iPNxxoiH2hesoX+wtnlqTxgLo0QBT+NuC7VSlh
	 YLuXbSGuXw8n1kFtAWiP95YXXGroWCDVXoLGPaWTgelKqTJyEz+fPczRh0WLve2FYV
	 UsmdYroJAun5A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsE-00000000W9F-1fZP;
	Thu, 08 Jan 2026 17:32:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 9/9] KVM: arm64: selftests: Add a test for FEAT_IDST
Date: Thu,  8 Jan 2026 17:32:33 +0000
Message-ID: <20260108173233.2911955-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093242_652001_E57A3293 
X-CRM114-Status: GOOD (  16.69  )
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

Add a very basic test checking that FEAT_IDST actually works for
the {GMID,SMIDR,CSSIDR2}_EL1 registers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/idreg-idst.c  | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/idreg-idst.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ba5c2b643efaa..bfa2fad0aba12 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -175,6 +175,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
+TEST_GEN_PROGS_arm64 += arm64/idreg-idst
 TEST_GEN_PROGS_arm64 += arm64/kvm-uuid
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
diff --git a/tools/testing/selftests/kvm/arm64/idreg-idst.c b/tools/testing/selftests/kvm/arm64/idreg-idst.c
new file mode 100644
index 0000000000000..9ca9f125abdb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/idreg-idst.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Access all FEAT_IDST-handled registers that depend on more than
+ * just FEAT_AA64, and fail if we don't get an a trap with an 0x18 EC.
+ */
+
+#include <test_util.h>
+#include <kvm_util.h>
+#include <processor.h>
+
+static volatile bool sys64, undef;
+
+#define __check_sr_read(r)					\
+	({							\
+		uint64_t val;					\
+								\
+		sys64 = false;					\
+		undef = false;					\
+		dsb(sy);					\
+		val = read_sysreg_s(SYS_ ## r);			\
+		val;						\
+	})
+
+/* Fatal checks */
+#define check_sr_read(r)					\
+	do {							\
+		__check_sr_read(r);				\
+		__GUEST_ASSERT(!undef, #r " unexpected UNDEF");	\
+		__GUEST_ASSERT(sys64, #r " didn't trap");	\
+	} while(0)
+
+
+static void guest_code(void)
+{
+	check_sr_read(CCSIDR2_EL1);
+	check_sr_read(SMIDR_EL1);
+	check_sr_read(GMID_EL1);
+
+	GUEST_DONE();
+}
+
+static void guest_sys64_handler(struct ex_regs *regs)
+{
+	sys64 = true;
+	undef = false;
+	regs->pc += 4;
+}
+
+static void guest_undef_handler(struct ex_regs *regs)
+{
+	sys64 = false;
+	undef = true;
+	regs->pc += 4;
+}
+
+static void test_run_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	do {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			printf("%s", uc.buffer);
+			break;
+		case UCALL_DONE:
+			break;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	} while (uc.cmd != UCALL_DONE);
+}
+
+static void test_guest_feat_idst(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	/* This VM has no MTE, no SME, no CCIDX */
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+				ESR_ELx_EC_SYS64, guest_sys64_handler);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+				ESR_ELx_EC_UNKNOWN, guest_undef_handler);
+
+	test_run_vcpu(vcpu);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	uint64_t mmfr2;
+
+	test_disable_default_vgic();
+
+	vm = vm_create_with_one_vcpu(&vcpu, NULL);
+	mmfr2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1));
+	__TEST_REQUIRE(FIELD_GET(ID_AA64MMFR2_EL1_IDS, mmfr2) > 0,
+		       "FEAT_IDST not supported");
+	kvm_vm_free(vm);
+
+	test_guest_feat_idst();
+
+	return 0;
+}
-- 
2.47.3


