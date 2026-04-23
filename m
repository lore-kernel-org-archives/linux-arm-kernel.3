Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FAF589B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQw1PT6DTk9aMq/uyQg5ZP88ycqsrhH6HFR6Qo8Qtvo=; b=K0fInEAA5bK40zJik0/+8pkqWJ
	6OODogtCsz6gbMUM71JWelAFPO4Mim69snuEL6yGWaWCrgKfR7icUwfdzfZyFdyqucTDv9iabcHg3
	CgNvWrkKd+joHtkcoIrkwq7ViObTq5kOUsz2yye+PvxCrACSNC6tq5vuyRd8XcPm8JSC9n7UJM3UG
	jcaFTMZMpTQ9LfgHxnzjwmm2J2hO9/7tusq+0Ga69RMWwPOlMuaVNtoVY7kYq38lYz97aNUCobxpm
	piU6GUBG4r5gQYTJQf5RJFUhlNudItO+LOOBP/ntoiGq3VgDPZlv7tVm1cwBGmpqnvcP2T7D0aLzj
	i1Qzsgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPL-0000000BeaH-3L4q;
	Thu, 23 Apr 2026 12:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPK-0000000BeYu-3QF1;
	Thu, 23 Apr 2026 12:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uQw1PT6DTk9aMq/uyQg5ZP88ycqsrhH6HFR6Qo8Qtvo=; b=E+ElHR6X7Hrt0ECFJ6sJWdu7RQ
	69b4tsPv1CXUgGnNbKPlkwuAhtKx4Y38IOBoSM1wE1SKY8Y1BbtSvFurr36gGn7l6KKdbAv2QRWNc
	YJlQ4Yd+C7UffuUBqDisIV4xqvGNrEw2nTAv+p67qhldrh7byZSAMN4bnD00gLodVz4Gi4qRqKYjy
	3uODmv5x5XPWLCI/D3RTbu+D9fhgBTTVY7dkW496KzgfMuJyBgP8Y0o1dh8liVoUuZPmqUMR1WqkA
	liOZ31TrbHaUU120ouPacaLkk4byIk9SAD4MJbu+YF+hMMx3gMeZ9iSNPiSE7S5eRzXL/ejnkEYwA
	xITKfpcQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP7-0000000D3Dj-0PRY;
	Thu, 23 Apr 2026 12:43:49 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 45C5820B7169;
	Thu, 23 Apr 2026 05:43:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 45C5820B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948216;
	bh=uQw1PT6DTk9aMq/uyQg5ZP88ycqsrhH6HFR6Qo8Qtvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmSCk4YmnmzDUTARRleR7GDQGFC3wWT780ANEY8sBDC6VoRAKc1F1Pu5BC9WoCnMg
	 r/u12AZ5+4NrhrxhIlwandv1AmysWhK0cKlFyYYnR9i1JF53ayB68lBxA7/apqCUIj
	 lAWWPdgMd6mxfsTq7rhiVIrk3AHCq5ZseKLZPkJE=
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 09/15] Drivers: hv: mshv_vtl: Move hv_vtl_configure_reg_page() to x86
Date: Thu, 23 Apr 2026 12:41:59 +0000
Message-ID: <20260423124206.2410879-10-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134337_359008_6241F00C 
X-CRM114-Status: GOOD (  14.88  )
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

Move hv_vtl_configure_reg_page() from drivers/hv/mshv_vtl_main.c to
arch/x86/hyperv/hv_vtl.c. The register page overlay is an x86-specific
feature that uses HV_X64_REGISTER_REG_PAGE, so its configuration belongs
in architecture-specific code.

Move struct mshv_vtl_per_cpu and union hv_synic_overlay_page_msr to
include/asm-generic/mshyperv.h so they are visible to both arch and
driver code.

Change the return type from void to bool so the caller can determine
whether the register page was successfully configured and set
mshv_has_reg_page accordingly.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/x86/hyperv/hv_vtl.c       | 32 ++++++++++++++++++++++
 drivers/hv/mshv_vtl_main.c     | 49 +++-------------------------------
 include/asm-generic/mshyperv.h | 17 ++++++++++++
 3 files changed, 53 insertions(+), 45 deletions(-)

diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index 09d81f9b853c..f3ffb6a7cb2d 100644
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
index ef0b9466808c..9e86178c182e 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -420,12 +420,29 @@ static inline int hv_call_set_vp_registers(u32 vp_index, u64 partition_id,
 }
 #endif /* CONFIG_MSHV_ROOT || CONFIG_MSHV_VTL */
 
+struct mshv_vtl_per_cpu {
+	struct mshv_vtl_run *run;
+	struct page *reg_page;
+};
+
 #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
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
 void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
+bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu);
 #else
 static inline u8 get_vtl(void) { return 0; }
 static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
+static inline bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu) { return false; }
 #endif
 
 #endif
-- 
2.43.0


