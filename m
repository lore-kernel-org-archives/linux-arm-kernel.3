Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A00F4645C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIfrvp2Zb15HPzlWDtLGtp19d8nVZNMxlBCH9dINgV0=; b=GLBQr/+jLWG/79RfvCISBrtaeu
	OrSI0gapgpr8xifL7Crj+r90q991Vo2MCyCSWRC+JrbbeIeRililZxP7O7qbwRVsJMDPD8OCh51/5
	7qRFv2E5Nu5uKNBetm+INGq1eJnegZSsAT635g29YHIkTYI5vlxZBoui9S0XMSZgZ7qFg/XSOvpEb
	qjWEl5DosXYqTnbN88Mg0ElIUtU7I8GS1v46tihIVdH/+aINrOpgfxGJFHFhehN/OKJgA7wELZBlz
	yZxQ2EHuGQDJAvdMv7VaGgXWYPa3EEN3NmCmqLsNnNo6lwSrFtWFlXedQBs4z57DfcEFYIADZ0DWe
	zTg+Ooxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26p3-00000003ui7-3Th7;
	Mon, 16 Mar 2026 12:13:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26p1-00000003ufr-1zhE;
	Mon, 16 Mar 2026 12:13:24 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 81DE620B7007;
	Mon, 16 Mar 2026 05:13:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 81DE620B7007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663202;
	bh=VIfrvp2Zb15HPzlWDtLGtp19d8nVZNMxlBCH9dINgV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NmhsNMT3vtDvTLmAulaPhShGIoyisK20C/XW23aNcZ0GbqGZpFjYFykKgDIt/a2ZQ
	 pc+kmM4mwT3eyIhpTAXiHrQG1NAxFbO7ABh+nraQPR3oiTFOCzOfw/FaPNSy2vvEKd
	 6irJWUMbFuUGiksS/f63PhfsyqVSImzD9OQiBZs0=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 04/11] Drivers: hv: Refactor mshv_vtl for ARM64 support to be added
Date: Mon, 16 Mar 2026 12:12:34 +0000
Message-ID: <20260316121241.910764-5-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051323_608068_8EA68A89 
X-CRM114-Status: GOOD (  20.24  )
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

Refactor MSHV_VTL driver to move some of the x86 specific code to arch
specific files, and add corresponding functions for arm64.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/include/asm/mshyperv.h |  10 +++
 arch/x86/hyperv/hv_vtl.c          |  98 ++++++++++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h   |   1 +
 drivers/hv/mshv_vtl_main.c        | 102 +-----------------------------
 4 files changed, 111 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab6..804068e0941b 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -60,6 +60,16 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 				ARM_SMCCC_SMC_64,		\
 				ARM_SMCCC_OWNER_VENDOR_HYP,	\
 				HV_SMCCC_FUNC_NUMBER)
+#ifdef CONFIG_HYPERV_VTL_MODE
+/*
+ * Get/Set the register. If the function returns `1`, that must be done via
+ * a hypercall. Returning `0` means success.
+ */
+static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
+{
+	return 1;
+}
+#endif
 
 #include <asm-generic/mshyperv.h>
 
diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index 9b6a9bc4ab76..72a0bb4ae0c7 100644
--- a/arch/x86/hyperv/hv_vtl.c
+++ b/arch/x86/hyperv/hv_vtl.c
@@ -17,6 +17,8 @@
 #include <asm/realmode.h>
 #include <asm/reboot.h>
 #include <asm/smap.h>
+#include <uapi/asm/mtrr.h>
+#include <asm/debugreg.h>
 #include <linux/export.h>
 #include <../kernel/smpboot.h>
 #include "../../kernel/fpu/legacy.h"
@@ -281,3 +283,99 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
 	kernel_fpu_end();
 }
 EXPORT_SYMBOL(mshv_vtl_return_call);
+
+/* Static table mapping register names to their corresponding actions */
+static const struct {
+	enum hv_register_name reg_name;
+	int debug_reg_num;  /* -1 if not a debug register */
+	u32 msr_addr;       /* 0 if not an MSR */
+} reg_table[] = {
+	/* Debug registers */
+	{HV_X64_REGISTER_DR0, 0, 0},
+	{HV_X64_REGISTER_DR1, 1, 0},
+	{HV_X64_REGISTER_DR2, 2, 0},
+	{HV_X64_REGISTER_DR3, 3, 0},
+	{HV_X64_REGISTER_DR6, 6, 0},
+	/* MTRR MSRs */
+	{HV_X64_REGISTER_MSR_MTRR_CAP, -1, MSR_MTRRcap},
+	{HV_X64_REGISTER_MSR_MTRR_DEF_TYPE, -1, MSR_MTRRdefType},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE0, -1, MTRRphysBase_MSR(0)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE1, -1, MTRRphysBase_MSR(1)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE2, -1, MTRRphysBase_MSR(2)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE3, -1, MTRRphysBase_MSR(3)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE4, -1, MTRRphysBase_MSR(4)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE5, -1, MTRRphysBase_MSR(5)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE6, -1, MTRRphysBase_MSR(6)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE7, -1, MTRRphysBase_MSR(7)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE8, -1, MTRRphysBase_MSR(8)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE9, -1, MTRRphysBase_MSR(9)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEA, -1, MTRRphysBase_MSR(0xa)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEB, -1, MTRRphysBase_MSR(0xb)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEC, -1, MTRRphysBase_MSR(0xc)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASED, -1, MTRRphysBase_MSR(0xd)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEE, -1, MTRRphysBase_MSR(0xe)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEF, -1, MTRRphysBase_MSR(0xf)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK0, -1, MTRRphysMask_MSR(0)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK1, -1, MTRRphysMask_MSR(1)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK2, -1, MTRRphysMask_MSR(2)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK3, -1, MTRRphysMask_MSR(3)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK4, -1, MTRRphysMask_MSR(4)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK5, -1, MTRRphysMask_MSR(5)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK6, -1, MTRRphysMask_MSR(6)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK7, -1, MTRRphysMask_MSR(7)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK8, -1, MTRRphysMask_MSR(8)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK9, -1, MTRRphysMask_MSR(9)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKA, -1, MTRRphysMask_MSR(0xa)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKB, -1, MTRRphysMask_MSR(0xb)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKC, -1, MTRRphysMask_MSR(0xc)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKD, -1, MTRRphysMask_MSR(0xd)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKE, -1, MTRRphysMask_MSR(0xe)},
+	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKF, -1, MTRRphysMask_MSR(0xf)},
+	{HV_X64_REGISTER_MSR_MTRR_FIX64K00000, -1, MSR_MTRRfix64K_00000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX16K80000, -1, MSR_MTRRfix16K_80000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX16KA0000, -1, MSR_MTRRfix16K_A0000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KC0000, -1, MSR_MTRRfix4K_C0000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KC8000, -1, MSR_MTRRfix4K_C8000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KD0000, -1, MSR_MTRRfix4K_D0000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KD8000, -1, MSR_MTRRfix4K_D8000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KE0000, -1, MSR_MTRRfix4K_E0000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KE8000, -1, MSR_MTRRfix4K_E8000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KF0000, -1, MSR_MTRRfix4K_F0000},
+	{HV_X64_REGISTER_MSR_MTRR_FIX4KF8000, -1, MSR_MTRRfix4K_F8000},
+};
+
+int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
+{
+	u64 *reg64;
+	enum hv_register_name gpr_name;
+	int i;
+
+	gpr_name = regs->name;
+	reg64 = &regs->value.reg64;
+
+	/* Search for the register in the table */
+	for (i = 0; i < ARRAY_SIZE(reg_table); i++) {
+		if (reg_table[i].reg_name != gpr_name)
+			continue;
+		if (reg_table[i].debug_reg_num != -1) {
+			/* Handle debug registers */
+			if (gpr_name == HV_X64_REGISTER_DR6 && !shared)
+				goto hypercall;
+			if (set)
+				native_set_debugreg(reg_table[i].debug_reg_num, *reg64);
+			else
+				*reg64 = native_get_debugreg(reg_table[i].debug_reg_num);
+		} else {
+			/* Handle MSRs */
+			if (set)
+				wrmsrl(reg_table[i].msr_addr, *reg64);
+			else
+				rdmsrl(reg_table[i].msr_addr, *reg64);
+		}
+		return 0;
+	}
+
+hypercall:
+	return 1;
+}
+EXPORT_SYMBOL(hv_vtl_get_set_reg);
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index f64393e853ee..d5355a5b7517 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -304,6 +304,7 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
 void mshv_vtl_return_call_init(u64 vtl_return_offset);
 void mshv_vtl_return_hypercall(void);
 void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
+int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared);
 #else
 static inline void __init hv_vtl_init_platform(void) {}
 static inline int __init hv_vtl_early_init(void) { return 0; }
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 5856975f32e1..b607b6e7e121 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -19,10 +19,8 @@
 #include <linux/poll.h>
 #include <linux/file.h>
 #include <linux/vmalloc.h>
-#include <asm/debugreg.h>
 #include <asm/mshyperv.h>
 #include <trace/events/ipi.h>
-#include <uapi/asm/mtrr.h>
 #include <uapi/linux/mshv.h>
 #include <hyperv/hvhdk.h>
 
@@ -505,102 +503,6 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 	return 0;
 }
 
-/* Static table mapping register names to their corresponding actions */
-static const struct {
-	enum hv_register_name reg_name;
-	int debug_reg_num;  /* -1 if not a debug register */
-	u32 msr_addr;       /* 0 if not an MSR */
-} reg_table[] = {
-	/* Debug registers */
-	{HV_X64_REGISTER_DR0, 0, 0},
-	{HV_X64_REGISTER_DR1, 1, 0},
-	{HV_X64_REGISTER_DR2, 2, 0},
-	{HV_X64_REGISTER_DR3, 3, 0},
-	{HV_X64_REGISTER_DR6, 6, 0},
-	/* MTRR MSRs */
-	{HV_X64_REGISTER_MSR_MTRR_CAP, -1, MSR_MTRRcap},
-	{HV_X64_REGISTER_MSR_MTRR_DEF_TYPE, -1, MSR_MTRRdefType},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE0, -1, MTRRphysBase_MSR(0)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE1, -1, MTRRphysBase_MSR(1)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE2, -1, MTRRphysBase_MSR(2)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE3, -1, MTRRphysBase_MSR(3)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE4, -1, MTRRphysBase_MSR(4)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE5, -1, MTRRphysBase_MSR(5)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE6, -1, MTRRphysBase_MSR(6)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE7, -1, MTRRphysBase_MSR(7)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE8, -1, MTRRphysBase_MSR(8)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE9, -1, MTRRphysBase_MSR(9)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEA, -1, MTRRphysBase_MSR(0xa)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEB, -1, MTRRphysBase_MSR(0xb)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEC, -1, MTRRphysBase_MSR(0xc)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASED, -1, MTRRphysBase_MSR(0xd)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEE, -1, MTRRphysBase_MSR(0xe)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEF, -1, MTRRphysBase_MSR(0xf)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK0, -1, MTRRphysMask_MSR(0)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK1, -1, MTRRphysMask_MSR(1)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK2, -1, MTRRphysMask_MSR(2)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK3, -1, MTRRphysMask_MSR(3)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK4, -1, MTRRphysMask_MSR(4)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK5, -1, MTRRphysMask_MSR(5)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK6, -1, MTRRphysMask_MSR(6)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK7, -1, MTRRphysMask_MSR(7)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK8, -1, MTRRphysMask_MSR(8)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK9, -1, MTRRphysMask_MSR(9)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKA, -1, MTRRphysMask_MSR(0xa)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKB, -1, MTRRphysMask_MSR(0xb)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKC, -1, MTRRphysMask_MSR(0xc)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKD, -1, MTRRphysMask_MSR(0xd)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKE, -1, MTRRphysMask_MSR(0xe)},
-	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKF, -1, MTRRphysMask_MSR(0xf)},
-	{HV_X64_REGISTER_MSR_MTRR_FIX64K00000, -1, MSR_MTRRfix64K_00000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX16K80000, -1, MSR_MTRRfix16K_80000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX16KA0000, -1, MSR_MTRRfix16K_A0000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KC0000, -1, MSR_MTRRfix4K_C0000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KC8000, -1, MSR_MTRRfix4K_C8000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KD0000, -1, MSR_MTRRfix4K_D0000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KD8000, -1, MSR_MTRRfix4K_D8000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KE0000, -1, MSR_MTRRfix4K_E0000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KE8000, -1, MSR_MTRRfix4K_E8000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KF0000, -1, MSR_MTRRfix4K_F0000},
-	{HV_X64_REGISTER_MSR_MTRR_FIX4KF8000, -1, MSR_MTRRfix4K_F8000},
-};
-
-static int mshv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set)
-{
-	u64 *reg64;
-	enum hv_register_name gpr_name;
-	int i;
-
-	gpr_name = regs->name;
-	reg64 = &regs->value.reg64;
-
-	/* Search for the register in the table */
-	for (i = 0; i < ARRAY_SIZE(reg_table); i++) {
-		if (reg_table[i].reg_name != gpr_name)
-			continue;
-		if (reg_table[i].debug_reg_num != -1) {
-			/* Handle debug registers */
-			if (gpr_name == HV_X64_REGISTER_DR6 &&
-			    !mshv_vsm_capabilities.dr6_shared)
-				goto hypercall;
-			if (set)
-				native_set_debugreg(reg_table[i].debug_reg_num, *reg64);
-			else
-				*reg64 = native_get_debugreg(reg_table[i].debug_reg_num);
-		} else {
-			/* Handle MSRs */
-			if (set)
-				wrmsrl(reg_table[i].msr_addr, *reg64);
-			else
-				rdmsrl(reg_table[i].msr_addr, *reg64);
-		}
-		return 0;
-	}
-
-hypercall:
-	return 1;
-}
-
 static void mshv_vtl_return(struct mshv_vtl_cpu_context *vtl0)
 {
 	struct hv_vp_assist_page *hvp;
@@ -720,7 +622,7 @@ mshv_vtl_ioctl_get_regs(void __user *user_args)
 			   sizeof(reg)))
 		return -EFAULT;
 
-	ret = mshv_vtl_get_set_reg(&reg, false);
+	ret = hv_vtl_get_set_reg(&reg, false, mshv_vsm_capabilities.dr6_shared);
 	if (!ret)
 		goto copy_args; /* No need of hypercall */
 	ret = vtl_get_vp_register(&reg);
@@ -751,7 +653,7 @@ mshv_vtl_ioctl_set_regs(void __user *user_args)
 	if (copy_from_user(&reg, (void __user *)args.regs_ptr, sizeof(reg)))
 		return -EFAULT;
 
-	ret = mshv_vtl_get_set_reg(&reg, true);
+	ret = hv_vtl_get_set_reg(&reg, true, mshv_vsm_capabilities.dr6_shared);
 	if (!ret)
 		return ret; /* No need of hypercall */
 	ret = vtl_set_vp_register(&reg);
-- 
2.43.0


