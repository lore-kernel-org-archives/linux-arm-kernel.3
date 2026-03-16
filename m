Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74506F4645C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brR9theQCqP7K9pyo73r1JXfQPBuayIYZqSB2HUPid4=; b=rMYc5rb0MCSA/SksqwfutQCwgZ
	1rU/qNTfQ6LU17jZHlzSOCijVBqP/5sxH5F6IIEwTZf1fx6QJdvdZRNa0VkEf8/KEEhGS9S9sMiPF
	lSaOVvCYMPk4zTVvinNIKzEngwRb2m4hrxxjOAzX7ZE7R7mvwwu/dJWP68Z4s/VNUnt4rAPSs3Oz7
	OisLObvfKvV1060xKFFu6SSgSfCaMxclqTXnOac7+srNaQwpYpvHK9nHdlhYKiJKuHbCFHJEUscDm
	VtOqIvrsLWSppscrLbl9ZTdjBN1WPgZdemR2NHm4TCG9epgcabPINL3lCgrIx5zBDjysPV6xH8fbw
	VYDsuU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pg-00000003vHm-0Wh7;
	Mon, 16 Mar 2026 12:14:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pd-00000003vC9-3PdA;
	Mon, 16 Mar 2026 12:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=brR9theQCqP7K9pyo73r1JXfQPBuayIYZqSB2HUPid4=; b=cyMED5Wx7J9iD6IXkCX7f5hNbb
	Pyc5kb2Ej7UNcb+RW5Qbfu6Wz5Q+C/GW1SKhchYbwh1Kckbf5CfuvqfkRHPq88+npVSAH3Ky6acTJ
	0GQmMGPV5FfOTuIy3Bnd4+s+xh0PaVOavRXLsL9JrXn0I3XaCBPhak8r5HQ1m7IzuGzozKPPb4NZM
	RCE3dWKapsrJU0lEu+yltp1zJbap07X/gIBX4vHWnqVGHZTNKC8Zw3QT7IUFaZv5U7QQw7YWqM14+
	JvVsM4yY+rbELzIltekHNG4BGY78LdnCYiDqBcd5R1d5RGgJUY2QY+iyapJ1LpVLDSrmFXDX16ApW
	gbk35Mdw==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pY-00000006gdm-0etO;
	Mon, 16 Mar 2026 12:13:58 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id DFB7C20B6F08;
	Mon, 16 Mar 2026 05:13:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFB7C20B6F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663232;
	bh=brR9theQCqP7K9pyo73r1JXfQPBuayIYZqSB2HUPid4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hj+uRwP4UTcKRFjAytMxjsCb5OQgvzAillEr6r8JYoXSqL83gJgbvUxTmaw//IEI4
	 aLRPdgDzTT28clUSYxT5RwVDnYcP1HNo4j0vdaJCWiuS0mKk/VHRh4BVHu0q3XXHzF
	 3agYTN2tB/AsoUCbiwtVkL6eomJxukXxrUFRYbes=
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
Subject: [PATCH 08/11] Drivers: hv: mshv_vtl: Move register page config to arch-specific files
Date: Mon, 16 Mar 2026 12:12:38 +0000
Message-ID: <20260316121241.910764-9-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121356_521485_01DFCF27 
X-CRM114-Status: GOOD (  18.19  )
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

Move mshv_vtl_configure_reg_page() implementation from
drivers/hv/mshv_vtl_main.c to arch-specific files:
- arch/x86/hyperv/hv_vtl.c: full implementation with register page setup
- arch/arm64/hyperv/hv_vtl.c: stub implementation (unsupported)

Move common type definitions to include/asm-generic/mshyperv.h:
- struct mshv_vtl_per_cpu
- union hv_synic_overlay_page_msr

Move hv_call_get_vp_registers() and hv_call_set_vp_registers()
declarations to include/asm-generic/mshyperv.h since these functions
are used by multiple modules.

While at it, remove the unnecessary stub implementations in #else
case for mshv_vtl_return* functions in arch/x86/include/asm/mshyperv.h.

This is essential for adding support for ARM64 in MSHV_VTL.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_vtl.c        |  8 +++++
 arch/arm64/include/asm/mshyperv.h |  3 ++
 arch/x86/hyperv/hv_vtl.c          | 32 ++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h   |  7 ++---
 drivers/hv/mshv.h                 |  8 -----
 drivers/hv/mshv_vtl_main.c        | 49 +++----------------------------
 include/asm-generic/mshyperv.h    | 42 ++++++++++++++++++++++++++
 7 files changed, 92 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/hyperv/hv_vtl.c b/arch/arm64/hyperv/hv_vtl.c
index 66318672c242..d699138427c1 100644
--- a/arch/arm64/hyperv/hv_vtl.c
+++ b/arch/arm64/hyperv/hv_vtl.c
@@ -10,6 +10,7 @@
 #include <asm/boot.h>
 #include <asm/mshyperv.h>
 #include <asm/cpu_ops.h>
+#include <linux/export.h>
 
 void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
 {
@@ -142,3 +143,10 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
 		"v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31");
 }
 EXPORT_SYMBOL(mshv_vtl_return_call);
+
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu)
+{
+	pr_debug("Register page not supported on ARM64\n");
+	return false;
+}
+EXPORT_SYMBOL_GPL(hv_vtl_configure_reg_page);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index de7f3a41a8ea..36803f0386cc 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -61,6 +61,8 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 				ARM_SMCCC_OWNER_VENDOR_HYP,	\
 				HV_SMCCC_FUNC_NUMBER)
 
+struct mshv_vtl_per_cpu;
+
 struct mshv_vtl_cpu_context {
 /*
  * NOTE: x18 is managed by the hypervisor. It won't be reloaded from this array.
@@ -82,6 +84,7 @@ static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u
 }
 
 void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu);
 #endif
 
 #include <asm-generic/mshyperv.h>
diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index 72a0bb4ae0c7..ede290985d41 100644
--- a/arch/x86/hyperv/hv_vtl.c
+++ b/arch/x86/hyperv/hv_vtl.c
@@ -20,6 +20,7 @@
 #include <uapi/asm/mtrr.h>
 #include <asm/debugreg.h>
 #include <linux/export.h>
+#include <linux/hyperv.h>
 #include <../kernel/smpboot.h>
 #include "../../kernel/fpu/legacy.h"
 
@@ -259,6 +260,37 @@ int __init hv_vtl_early_init(void)
 	return 0;
 }
 
+static const union hv_input_vtl input_vtl_zero;
+
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu)
+{
+	struct hv_register_assoc reg_assoc = {};
+	union hv_synic_overlay_page_msr overlay = {};
+	struct page *reg_page;
+
+	reg_page = alloc_page(GFP_KERNEL | __GFP_ZERO | __GFP_RETRY_MAYFAIL);
+	if (!reg_page) {
+		WARN(1, "failed to allocate register page\n");
+		return false;
+	}
+
+	overlay.enabled = 1;
+	overlay.pfn = page_to_hvpfn(reg_page);
+	reg_assoc.name = HV_X64_REGISTER_REG_PAGE;
+	reg_assoc.value.reg64 = overlay.as_uint64;
+
+	if (hv_call_set_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
+				     1, input_vtl_zero, &reg_assoc)) {
+		WARN(1, "failed to setup register page\n");
+		__free_page(reg_page);
+		return false;
+	}
+
+	per_cpu->reg_page = reg_page;
+	return true;
+}
+EXPORT_SYMBOL_GPL(hv_vtl_configure_reg_page);
+
 DEFINE_STATIC_CALL_NULL(__mshv_vtl_return_hypercall, void (*)(void));
 
 void mshv_vtl_return_call_init(u64 vtl_return_offset)
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index d5355a5b7517..d592fea49cdb 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -271,6 +271,8 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg) { return 0; }
 static inline int hv_apicid_to_vp_index(u32 apic_id) { return -EINVAL; }
 #endif /* CONFIG_HYPERV */
 
+struct mshv_vtl_per_cpu;
+
 struct mshv_vtl_cpu_context {
 	union {
 		struct {
@@ -305,13 +307,10 @@ void mshv_vtl_return_call_init(u64 vtl_return_offset);
 void mshv_vtl_return_hypercall(void);
 void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
 int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared);
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu);
 #else
 static inline void __init hv_vtl_init_platform(void) {}
 static inline int __init hv_vtl_early_init(void) { return 0; }
-static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
-static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
-static inline void mshv_vtl_return_hypercall(void) {}
-static inline void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
 #endif
 
 #include <asm-generic/mshyperv.h>
diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index d4813df92b9c..0fcb7f9ba6a9 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -14,14 +14,6 @@
 	memchr_inv(&((STRUCT).MEMBER), \
 		   0, sizeof_field(typeof(STRUCT), MEMBER))
 
-int hv_call_get_vp_registers(u32 vp_index, u64 partition_id, u16 count,
-			     union hv_input_vtl input_vtl,
-			     struct hv_register_assoc *registers);
-
-int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
-			     union hv_input_vtl input_vtl,
-			     struct hv_register_assoc *registers);
-
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 91517b45d526..c79d24317b8e 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -78,21 +78,6 @@ struct mshv_vtl {
 	u64 id;
 };
 
-struct mshv_vtl_per_cpu {
-	struct mshv_vtl_run *run;
-	struct page *reg_page;
-};
-
-/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
-union hv_synic_overlay_page_msr {
-	u64 as_uint64;
-	struct {
-		u64 enabled: 1;
-		u64 reserved: 11;
-		u64 pfn: 52;
-	} __packed;
-};
-
 static struct mutex mshv_vtl_poll_file_lock;
 static union hv_register_vsm_page_offsets mshv_vsm_page_offsets;
 static union hv_register_vsm_capabilities mshv_vsm_capabilities;
@@ -201,34 +186,6 @@ static struct page *mshv_vtl_cpu_reg_page(int cpu)
 	return *per_cpu_ptr(&mshv_vtl_per_cpu.reg_page, cpu);
 }
 
-static void mshv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu)
-{
-	struct hv_register_assoc reg_assoc = {};
-	union hv_synic_overlay_page_msr overlay = {};
-	struct page *reg_page;
-
-	reg_page = alloc_page(GFP_KERNEL | __GFP_ZERO | __GFP_RETRY_MAYFAIL);
-	if (!reg_page) {
-		WARN(1, "failed to allocate register page\n");
-		return;
-	}
-
-	overlay.enabled = 1;
-	overlay.pfn = page_to_hvpfn(reg_page);
-	reg_assoc.name = HV_X64_REGISTER_REG_PAGE;
-	reg_assoc.value.reg64 = overlay.as_uint64;
-
-	if (hv_call_set_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
-				     1, input_vtl_zero, &reg_assoc)) {
-		WARN(1, "failed to setup register page\n");
-		__free_page(reg_page);
-		return;
-	}
-
-	per_cpu->reg_page = reg_page;
-	mshv_has_reg_page = true;
-}
-
 static void mshv_vtl_synic_enable_regs(unsigned int cpu)
 {
 	union hv_synic_sint sint;
@@ -329,8 +286,10 @@ static int mshv_vtl_alloc_context(unsigned int cpu)
 	if (!per_cpu->run)
 		return -ENOMEM;
 
-	if (mshv_vsm_capabilities.intercept_page_available)
-		mshv_vtl_configure_reg_page(per_cpu);
+	if (mshv_vsm_capabilities.intercept_page_available) {
+		if (hv_vtl_configure_reg_page(per_cpu))
+			mshv_has_reg_page = true;
+	}
 
 	mshv_vtl_synic_enable_regs(cpu);
 
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index b147a12085e4..b53fcc071596 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -383,8 +383,50 @@ static inline int hv_deposit_memory(u64 partition_id, u64 status)
 	return hv_deposit_memory_node(NUMA_NO_NODE, partition_id, status);
 }
 
+#if IS_ENABLED(CONFIG_MSHV_ROOT) || IS_ENABLED(CONFIG_MSHV_VTL)
+int hv_call_get_vp_registers(u32 vp_index, u64 partition_id, u16 count,
+			     union hv_input_vtl input_vtl,
+			     struct hv_register_assoc *registers);
+
+int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
+			     union hv_input_vtl input_vtl,
+			     struct hv_register_assoc *registers);
+#else
+static inline int hv_call_get_vp_registers(u32 vp_index, u64 partition_id,
+					   u16 count,
+					   union hv_input_vtl input_vtl,
+					   struct hv_register_assoc *registers)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int hv_call_set_vp_registers(u32 vp_index, u64 partition_id,
+					   u16 count,
+					   union hv_input_vtl input_vtl,
+					   struct hv_register_assoc *registers)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_MSHV_ROOT || CONFIG_MSHV_VTL */
+
 #define HV_VP_ASSIST_PAGE_ADDRESS_SHIFT	12
+
 #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
+struct mshv_vtl_per_cpu {
+	struct mshv_vtl_run *run;
+	struct page *reg_page;
+};
+
+/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
+union hv_synic_overlay_page_msr {
+	u64 as_uint64;
+	struct {
+		u64 enabled: 1;
+		u64 reserved: 11;
+		u64 pfn: 52;
+	} __packed;
+};
+
 u8 __init get_vtl(void);
 #else
 static inline u8 get_vtl(void) { return 0; }
-- 
2.43.0


