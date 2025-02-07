Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C616C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjmYEBpw4pgF8uT3VONgUY7vC1qroMcePTtvtHC0fK0=; b=Nz+RAqcUTAk/rhLEDaPQXWm4up
	R6TfuYY/d40LSGGm0eQiHuCLt8efobC8tTFfgGTb2p1EtDpbBqAdfm0hK8sqdle0xX4cAzsDugpgE
	dVTTSef+21oOuu30+mHWLnHJ+y1ZywlDRhPUux6LiqwfYK8aIlpE5OskROC1l4UE+HTGP1buDyzxA
	I7u2BMB1NGxZKddwf8ehph+G+G1BfsCjFay3bvtmzjg3pNQm+CnwdTlpwnENM1Oorr3kzSIVhiO2f
	bq9WqFoP/w/pp1NWtU64jbHAVX9IrpAJRUvqgfP9Cm4UHoe4ZqIZ+C7s8z5yn3zelpl8cBbkeNxMM
	hF7ZKllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTgL-0000000Aqit-3MFa;
	Fri, 07 Feb 2025 19:06:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTda-0000000Apsg-48Vh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:03:41 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 40F6E2107306;
	Fri,  7 Feb 2025 11:03:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 40F6E2107306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738955017;
	bh=QjmYEBpw4pgF8uT3VONgUY7vC1qroMcePTtvtHC0fK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BxmqxAmgLi6cEdpdjAePwMNP95z9f5DlN/7vpwCnLxFos7A4p4oDMeksvkUKaEblC
	 i4k4cDhmHdiFplQJrg4wF2J8FDVF0atW/A57+2A+9xnNhKqKfbr6+mzIUr2Rj0NItB
	 HDaeyZ+cCeexbt8chAHn9Mg02BngnvzKboB4LfLE=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH v3 1/2] hyperv: Move hv_current_partition_id to arch-generic code
Date: Fri,  7 Feb 2025 11:03:21 -0800
Message-Id: <1738955002-20821-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_110339_076249_C7AFB449 
X-CRM114-Status: GOOD (  18.62  )
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

Move hv_current_partition_id and hv_get_partition_id() to hv_common.c,
and call hv_get_partition_id() on arm64 in hyperv_init(). These aren't
specific to x86_64 and will be needed by common code.

Set hv_current_partition_id to HV_PARTITION_ID_SELF by default.

Rename struct hv_get_partition_id to hv_output_get_partition_id, to
make it distinct from the function hv_get_partition_id(), and match
the original Hyper-V struct name.

Remove the BUG()s. Failing to get the id need not crash the machine.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c    |  3 +++
 arch/x86/hyperv/hv_init.c       | 25 +------------------------
 arch/x86/include/asm/mshyperv.h |  2 --
 drivers/hv/hv_common.c          | 22 ++++++++++++++++++++++
 include/asm-generic/mshyperv.h  |  2 ++
 include/hyperv/hvgdk_mini.h     |  2 +-
 6 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index fc49949b7df6..29fcfd595f48 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -72,6 +72,9 @@ static int __init hyperv_init(void)
 		return ret;
 	}
 
+	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
+		hv_get_partition_id();
+
 	ms_hyperv_late_init();
 
 	hyperv_initialized = true;
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 173005e6a95d..9be1446f5bd3 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -34,9 +34,6 @@
 #include <clocksource/hyperv_timer.h>
 #include <linux/highmem.h>
 
-u64 hv_current_partition_id = ~0ull;
-EXPORT_SYMBOL_GPL(hv_current_partition_id);
-
 void *hv_hypercall_pg;
 EXPORT_SYMBOL_GPL(hv_hypercall_pg);
 
@@ -393,24 +390,6 @@ static void __init hv_stimer_setup_percpu_clockev(void)
 		old_setup_percpu_clockev();
 }
 
-static void __init hv_get_partition_id(void)
-{
-	struct hv_get_partition_id *output_page;
-	u64 status;
-	unsigned long flags;
-
-	local_irq_save(flags);
-	output_page = *this_cpu_ptr(hyperv_pcpu_output_arg);
-	status = hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, output_page);
-	if (!hv_result_success(status)) {
-		/* No point in proceeding if this failed */
-		pr_err("Failed to get partition ID: %lld\n", status);
-		BUG();
-	}
-	hv_current_partition_id = output_page->partition_id;
-	local_irq_restore(flags);
-}
-
 #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
 static u8 __init get_vtl(void)
 {
@@ -605,11 +584,9 @@ void __init hyperv_init(void)
 
 	register_syscore_ops(&hv_syscore_ops);
 
-	if (cpuid_ebx(HYPERV_CPUID_FEATURES) & HV_ACCESS_PARTITION_ID)
+	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
 		hv_get_partition_id();
 
-	BUG_ON(hv_root_partition && hv_current_partition_id == ~0ull);
-
 #ifdef CONFIG_PCI_MSI
 	/*
 	 * If we're running as root, we want to create our own PCI MSI domain.
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index f91ab1e75f9f..8d3ada3e8d0d 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -43,8 +43,6 @@ extern bool hyperv_paravisor_present;
 
 extern void *hv_hypercall_pg;
 
-extern u64 hv_current_partition_id;
-
 extern union hv_ghcb * __percpu *hv_ghcb_pg;
 
 bool hv_isolation_type_snp(void);
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index af5d1dc451f6..cb3ea49020ef 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -31,6 +31,9 @@
 #include <hyperv/hvhdk.h>
 #include <asm/mshyperv.h>
 
+u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
+EXPORT_SYMBOL_GPL(hv_current_partition_id);
+
 /*
  * hv_root_partition, ms_hyperv and hv_nested are defined here with other
  * Hyper-V specific globals so they are shared across all architectures and are
@@ -283,6 +286,25 @@ static inline bool hv_output_page_exists(void)
 	return hv_root_partition || IS_ENABLED(CONFIG_HYPERV_VTL_MODE);
 }
 
+void __init hv_get_partition_id(void)
+{
+	struct hv_output_get_partition_id *output;
+	unsigned long flags;
+	u64 status, pt_id;
+
+	local_irq_save(flags);
+	output = *this_cpu_ptr(hyperv_pcpu_input_arg);
+	status = hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, &output);
+	pt_id = output->partition_id;
+	local_irq_restore(flags);
+
+	if (hv_result_success(status))
+		hv_current_partition_id = pt_id;
+	else
+		pr_err("Hyper-V: failed to get partition ID: %#lx\n",
+		       hv_result(status));
+}
+
 int __init hv_common_init(void)
 {
 	int i;
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index a7bbe504e4f3..febeddf6cd8a 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -58,6 +58,7 @@ struct ms_hyperv_info {
 };
 extern struct ms_hyperv_info ms_hyperv;
 extern bool hv_nested;
+extern u64 hv_current_partition_id;
 
 extern void * __percpu *hyperv_pcpu_input_arg;
 extern void * __percpu *hyperv_pcpu_output_arg;
@@ -207,6 +208,7 @@ extern u64 (*hv_read_reference_counter)(void);
 #define VP_INVAL	U32_MAX
 
 int __init hv_common_init(void);
+void __init hv_get_partition_id(void);
 void __init hv_common_free(void);
 void __init ms_hyperv_late_init(void);
 int hv_common_cpu_init(unsigned int cpu);
diff --git a/include/hyperv/hvgdk_mini.h b/include/hyperv/hvgdk_mini.h
index 155615175965..58895883f636 100644
--- a/include/hyperv/hvgdk_mini.h
+++ b/include/hyperv/hvgdk_mini.h
@@ -182,7 +182,7 @@ struct hv_tsc_emulation_control {	 /* HV_TSC_INVARIANT_CONTROL */
 
 #endif /* CONFIG_X86 */
 
-struct hv_get_partition_id {	 /* HV_OUTPUT_GET_PARTITION_ID */
+struct hv_output_get_partition_id {
 	u64 partition_id;
 } __packed;
 
-- 
2.34.1


