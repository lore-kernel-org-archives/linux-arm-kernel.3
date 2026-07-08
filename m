Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7963C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7P8bedxastxyO1uTVgppI9h4J2Pv4B68FFkbXcYxvI=; b=vzggiVfauoWAPpkE/X8eOdDR57
	vzML4RdySbks3cuEM/6UotpBsyPXDrIkT0ATmcQAtZOVBjJlqeaQijPsENKHa8wfMYgS46+w59P3m
	wIWED4eAmPo+gXIcErNnVHW1U89Ppf8js138DoKyk3sthhTuIh6r/mDJ5FYYLqugrwBIReYaLyK3Q
	PBNu7e2wb2Wz9pCKWv9P4MlSkDzgf/0MpQpgd+rCVBksNV/O4U4woNYYNnteCrrgrdNVbL4rDSelM
	pZoKA0JIRXjl/E/5Kw+rPCkHndVCAzpCqjTIbBm7oOOsgT3uhpfO6la/NJrPE8UKWfx3I2JgMgBBi
	nnGHCZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVn-0000000GT6y-06UT;
	Wed, 08 Jul 2026 07:16:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVl-0000000GT6C-3q8g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0154943D41;
	Wed,  8 Jul 2026 07:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6B9FC2BCB9;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783494960;
	bh=nOsULZjZbVA2mBgEIT5SVodSejvaPfgFr2B4sY5qQhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OhI42u4/TFum2sWXzVkF/vWkXx6bIAPWt6CE28NafJBV6KOoVuNu8iVtcxlwR/Bhk
	 YIe3u6JaupzEBysjKDepBFKFSQjgrFNgw0UGUUavyfo/RkycNYcJfkeLJ1xExZjckD
	 nXSV4i/BwjIPoAECHK3TupPci94BiAcgqi81Dm4JRIbNjkPcw7sSNS5vlweaywadmk
	 6xbWk7i8An2o37wyKWOTIA/ExpEDvK02GNLc6n7A3wA6KjYOJnQm7+J8v7pkMNgL3s
	 U0FQKIVdpw2+Hle7nHVUshXhtL1allqce/+o4g06kurZS/cc9TjUBtohRX8zU8TS3k
	 l4VnM/YW/1OOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96921C44501;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 08 Jul 2026 09:15:38 +0200
Subject: [PATCH RFC 2/6] arm64/efi: Add and parse custom PSCI EFI
 configuration table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-efi-psci-v1-2-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7959; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=nOsULZjZbVA2mBgEIT5SVodSejvaPfgFr2B4sY5qQhk=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ5bvT81ftSelW0tlt+9u/prB9fhjnU7c6592857xrLrre
 aH6mzhbRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiXNcZGY78DCqeec827IFI
 7cEDs+TTvJk/+faVJYTF/N0ast66+TfDP+PtS4Kj53aul5lep3Zot9D0hLsmwXN2n9/E2y96VdW
 okg8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

On Apple Silicon, the kernel runs in the highest privilege level (EL2)
leaving no higher level to trap into for PSCI firmware calls. Instead,
we keep the firmware in the same level and expose it as an EFI runtime
service. Add a new custom EFI configuraiton table and extract the
pointer to the PSCI handler from it such that it can later be used by
the PSCI code.

The handler is invoked as a plain call under the EFI virtual mapping rather
than through the EFI runtime services dispatch path, so the usual runtime
call environment is not set up around it. This relies on two guarantees
from the firmware: the handler must not use FP/SIMD or any other
lazily-saved CPU state, so the caller can skip saving and restoring it,
and it must be reentrant and independent of the other EFI runtime
services, so it can be invoked from the cpuidle and secondary CPU
bring-up paths which cannot take the sleeping efi_runtime_lock.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/include/asm/efi.h | 56 ++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/efi.c      | 58 ++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c    |  2 +-
 include/linux/efi.h          |  1 +
 4 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..bc7cf4dd00ae 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -14,10 +14,12 @@
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
+extern void arm64_efi_init(void);
 
 bool efi_runtime_fixup_exception(struct pt_regs *regs, const char *msg);
 #else
 #define efi_init()
+#define arm64_efi_init()
 
 static inline
 bool efi_runtime_fixup_exception(struct pt_regs *regs, const char *msg)
@@ -151,4 +153,58 @@ efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f);
 
 void efi_icache_sync(unsigned long start, unsigned long end);
 
+/*
+ * PSCI handler exposed by the firmware through
+ * LINUX_EFI_ARM_PSCI_HANDLER_TABLE_GUID.
+ *
+ * Unlike the regular EFI runtime services, this handler is invoked as a plain
+ * call under the EFI virtual mapping and not through the runtime services
+ * dispatch path. The OS therefore does not set up the usual runtime call
+ * environment around it, which imposes two requirements on the firmware:
+ *
+ *  - The handler must not corrupt FP/SIMD/SVE or any other lazily-saved CPU
+ *    state.
+ *
+ *  - The handler must be reentrant and independent of the other EFI runtime
+ *    services. It is only guaranteed to run with interrupts disabled on the
+ *    core it is called.
+ */
+typedef unsigned long efi_psci_handler_t(unsigned long function_id,
+					 unsigned long arg0,
+					 unsigned long arg1,
+					 unsigned long arg2);
+
+#define EFI_PSCI_MAX_FN 0x20
+
+/**
+ * struct efi_psci_table - firmware-provided PSCI conduit table
+ * @version:      PSCI version implemented by the firmware, in the format
+ *                returned by PSCI_VERSION (major in bits 16-30, minor in
+ *                bits 0-15).
+ * @num_features: Number of valid entries in @features. Function numbers at
+ *                or above this value are treated as not supported. Guaranteed
+ *                to be at least 0x20.
+ * @psci_handler: Firmware entry point invoked for PSCI calls that are not
+ *                served from the cached fields above. Called via
+ *                arm64_efi_psci_call() with the EFI runtime mapping active.
+ * @features:     PSCI_FEATURES results indexed by PSCI function number (the
+ *                low byte of the function ID, which is identical for the
+ *                SMC32 and SMC64 variants).
+ *
+ * Populated at boot from the firmware's PSCI handler configuration table
+ * (LINUX_EFI_ARM_PSCI_HANDLER_TABLE_GUID). @version, @num_features and
+ * @features cache the answers to the PSCI calls that must be serviced before
+ * EFI runtime services can be invoked. All other calls are forwarded to
+ * @psci_handler using arm64_efi_psci_call().
+ */
+extern struct efi_psci_table {
+	u32 version;
+	u32 num_features;
+	efi_psci_handler_t *psci_handler;
+	s32 features[EFI_PSCI_MAX_FN];
+} efi_psci;
+
+unsigned long arm64_efi_psci_call(unsigned long function_id, unsigned long arg0,
+				  unsigned long arg1, unsigned long arg2);
+
 #endif /* _ASM_EFI_H */
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 30cd7f804398..e40885567f9e 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -18,6 +18,7 @@
 #include <asm/stacktrace.h>
 #include <asm/vmap_stack.h>
 
+
 static bool region_is_misaligned(const efi_memory_desc_t *md)
 {
 	if (PAGE_SIZE == EFI_PAGE_SIZE)
@@ -242,6 +243,63 @@ bool efi_runtime_fixup_exception(struct pt_regs *regs, const char *msg)
 /* EFI requires 8 KiB of stack space for runtime services */
 static_assert(THREAD_SIZE >= SZ_8K);
 
+struct efi_psci_table efi_psci __ro_after_init;
+static unsigned long efi_psci_handler_table __initdata = EFI_INVALID_TABLE_ADDR;
+const efi_config_table_type_t efi_arch_tables[] __initconst = {
+	{LINUX_EFI_ARM_PSCI_HANDLER_TABLE_GUID, &efi_psci_handler_table},
+	{}
+};
+
+static void __init arm64_efi_init_psci(void)
+{
+	struct efi_psci_table *psci;
+
+	if (efi_psci_handler_table == EFI_INVALID_TABLE_ADDR)
+		return;
+
+	psci = early_memremap_ro(efi_psci_handler_table, sizeof(*psci));
+	if (psci == NULL) {
+		pr_warn("Unable to map PSCI table.\n");
+		return;
+	}
+
+	memcpy(&efi_psci, psci, sizeof(*psci));
+	early_memunmap(psci, sizeof(*psci));
+}
+
+void __init arm64_efi_init(void)
+{
+	efi_init();
+	arm64_efi_init_psci();
+}
+
+unsigned long arm64_efi_psci_call(unsigned long function_id, unsigned long arg0,
+				  unsigned long arg1, unsigned long arg2)
+{
+	unsigned long ret, flags;
+
+	/*
+	 * Note that unlike for regular EFI runtime calls we don't have to save
+	 * FP/SIMD state here because the handler ABI forbids using those.
+	 * Likewise, we do not take any lock here because the handler has to be
+	 * re-entrant. We couldn't take the sleeping efi_runtime_lock here
+	 * anyway because we may be called from atomic context for cpuidle
+	 * and CPU bring-up.
+	 */
+	local_irq_save(flags);
+	efi_virtmap_load();
+	uaccess_ttbr0_enable();
+	post_ttbr_update_workaround();
+
+	ret = efi_psci.psci_handler(function_id, arg0, arg1, arg2);
+
+	uaccess_ttbr0_disable();
+	efi_virtmap_unload();
+	local_irq_restore(flags);
+
+	return ret;
+}
+
 static int __init arm64_efi_rt_init(void)
 {
 	void *p;
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..01735fcacf2a 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -320,7 +320,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	cpu_uninstall_idmap();
 
 	xen_early_init();
-	efi_init();
+	arm64_efi_init();
 
 	if (!efi_enabled(EFI_BOOT)) {
 		if ((u64)_text % MIN_KIMG_ALIGN)
diff --git a/include/linux/efi.h b/include/linux/efi.h
index ccbc35479684..f3db3a18b540 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -422,6 +422,7 @@ void efi_native_runtime_setup(void);
 #define LINUX_EFI_COCO_SECRET_AREA_GUID		EFI_GUID(0xadf956ad, 0xe98c, 0x484c,  0xae, 0x11, 0xb5, 0x1c, 0x7d, 0x33, 0x64, 0x47)
 #define LINUX_EFI_BOOT_MEMMAP_GUID		EFI_GUID(0x800f683f, 0xd08b, 0x423a,  0xa2, 0x93, 0x96, 0x5c, 0x3c, 0x6f, 0xe2, 0xb4)
 #define LINUX_EFI_UNACCEPTED_MEM_TABLE_GUID	EFI_GUID(0xd5d1de3c, 0x105c, 0x44f9,  0x9e, 0xa9, 0xbc, 0xef, 0x98, 0x12, 0x00, 0x31)
+#define LINUX_EFI_ARM_PSCI_HANDLER_TABLE_GUID	EFI_GUID(0xf9b47651, 0x4674, 0x4ed9,  0x94, 0x3b, 0x5c, 0xea, 0xd2, 0x10, 0x9a, 0x8b)
 
 #define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
 

-- 
2.55.0



