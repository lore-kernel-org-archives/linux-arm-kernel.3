Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE68DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jquUHZhr02eqGZ7in0usAmu07m9dgjh9vvvP3ukF8cI=; b=TMJgWkntVhjbyQlUElH10u3/nh
	XV81iCOf5UjxBe084BLSIS/6kItYS/6cIZrXDPrYlKmnvlbZJKWEcsUmolNoA3Pg6bWS8Jrs46YxO
	brtEKXg+FntTRPpFCu2dHHoflUHbLRlD39LSPdTf1HOmyddKhY8I9THUHk0ah9N52oVe2NDr67Rt6
	lbjA37MwOSNqa7gAJuQvFGVVSnvxxGLVu1+RoHKsxDSMZf4TY749keFqmoxNOi/aRUVjoPmaTOx8P
	a1A+Kt9CtXnsPXyk+EjovrwXx29NV7fFYusucbgmDmqGcDqEqxRBJoWVZLuz83vftKbAOUkEvOKyN
	lXKYf0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thygq-00000005T6E-1VWn;
	Tue, 11 Feb 2025 22:25:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thyeL-00000005Sdu-3Mce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:22:39 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 021152107AB1;
	Tue, 11 Feb 2025 14:22:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 021152107AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739312554;
	bh=jquUHZhr02eqGZ7in0usAmu07m9dgjh9vvvP3ukF8cI=;
	h=From:To:Cc:Subject:Date:From;
	b=GXfLrU81iMw/r/tA3amIqScOCvdRDD3HCnld2wcjtN0poms7xyvmPSgNZhnSuwKyt
	 dva4wynaLPXr3jKcVL1nQWOpeM7Qay/g1rwk9Wr4vx5nKX4HggdGgd+/5o8G+RcCSi
	 gud0c/W7/68Xa+qVgKrGfxeg94ryjn9VACXdUUy4=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	iommu@lists.linux.dev
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH] hyperv: Add CONFIG_MSHV_ROOT to gate hv_root_partition checks
Date: Tue, 11 Feb 2025 14:21:55 -0800
Message-Id: <1739312515-18848-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_142237_896088_830C882E 
X-CRM114-Status: GOOD (  27.29  )
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

Introduce CONFIG_MSHV_ROOT as a tristate to enable root partition
booting and future mshv driver functionality.

Change hv_root_partition into a function which always returns false
if CONFIG_MSHV_ROOT=n.

Introduce hv_current_partition_type to store the type of partition
(guest, root, or other kinds in future), and hv_identify_partition_type()
to it up early in Hyper-V initialization.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
Depends on
https://lore.kernel.org/linux-hyperv/1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com/

 arch/arm64/hyperv/mshyperv.c       |  2 ++
 arch/x86/hyperv/hv_init.c          | 10 ++++----
 arch/x86/kernel/cpu/mshyperv.c     | 24 ++----------------
 drivers/clocksource/hyperv_timer.c |  4 +--
 drivers/hv/Kconfig                 | 12 +++++++++
 drivers/hv/Makefile                |  3 ++-
 drivers/hv/hv.c                    | 10 ++++----
 drivers/hv/hv_common.c             | 32 +++++++++++++++++++-----
 drivers/hv/vmbus_drv.c             |  2 +-
 drivers/iommu/hyperv-iommu.c       |  4 +--
 include/asm-generic/mshyperv.h     | 39 +++++++++++++++++++++++++-----
 11 files changed, 92 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 29fcfd595f48..2265ea5ce5ad 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -61,6 +61,8 @@ static int __init hyperv_init(void)
 		ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
 		ms_hyperv.misc_features);
 
+	hv_identify_partition_type();
+
 	ret = hv_common_init();
 	if (ret)
 		return ret;
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 9be1446f5bd3..ddeb40930bc8 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -90,7 +90,7 @@ static int hv_cpu_init(unsigned int cpu)
 		return 0;
 
 	hvp = &hv_vp_assist_page[cpu];
-	if (hv_root_partition) {
+	if (hv_root_partition()) {
 		/*
 		 * For root partition we get the hypervisor provided VP assist
 		 * page, instead of allocating a new page.
@@ -242,7 +242,7 @@ static int hv_cpu_die(unsigned int cpu)
 
 	if (hv_vp_assist_page && hv_vp_assist_page[cpu]) {
 		union hv_vp_assist_msr_contents msr = { 0 };
-		if (hv_root_partition) {
+		if (hv_root_partition()) {
 			/*
 			 * For root partition the VP assist page is mapped to
 			 * hypervisor provided page, and thus we unmap the
@@ -317,7 +317,7 @@ static int hv_suspend(void)
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
 
-	if (hv_root_partition)
+	if (hv_root_partition())
 		return -EPERM;
 
 	/*
@@ -518,7 +518,7 @@ void __init hyperv_init(void)
 	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
 	hypercall_msr.enable = 1;
 
-	if (hv_root_partition) {
+	if (hv_root_partition()) {
 		struct page *pg;
 		void *src;
 
@@ -592,7 +592,7 @@ void __init hyperv_init(void)
 	 * If we're running as root, we want to create our own PCI MSI domain.
 	 * We can't set this in hv_pci_init because that would be too late.
 	 */
-	if (hv_root_partition)
+	if (hv_root_partition())
 		x86_init.irqs.create_pci_msi_domain = hv_create_pci_msi_domain;
 #endif
 
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index f285757618fc..4f01f424ea5b 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -33,8 +33,6 @@
 #include <asm/numa.h>
 #include <asm/svm.h>
 
-/* Is Linux running as the root partition? */
-bool hv_root_partition;
 /* Is Linux running on nested Microsoft Hypervisor */
 bool hv_nested;
 struct ms_hyperv_info ms_hyperv;
@@ -451,25 +449,7 @@ static void __init ms_hyperv_init_platform(void)
 	pr_debug("Hyper-V: max %u virtual processors, %u logical processors\n",
 		 ms_hyperv.max_vp_index, ms_hyperv.max_lp_index);
 
-	/*
-	 * Check CPU management privilege.
-	 *
-	 * To mirror what Windows does we should extract CPU management
-	 * features and use the ReservedIdentityBit to detect if Linux is the
-	 * root partition. But that requires negotiating CPU management
-	 * interface (a process to be finalized). For now, use the privilege
-	 * flag as the indicator for running as root.
-	 *
-	 * Hyper-V should never specify running as root and as a Confidential
-	 * VM. But to protect against a compromised/malicious Hyper-V trying
-	 * to exploit root behavior to expose Confidential VM memory, ignore
-	 * the root partition setting if also a Confidential VM.
-	 */
-	if ((ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
-	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
-		hv_root_partition = true;
-		pr_info("Hyper-V: running as root partition\n");
-	}
+	hv_identify_partition_type();
 
 	if (ms_hyperv.hints & HV_X64_HYPERV_NESTED) {
 		hv_nested = true;
@@ -618,7 +598,7 @@ static void __init ms_hyperv_init_platform(void)
 
 # ifdef CONFIG_SMP
 	smp_ops.smp_prepare_boot_cpu = hv_smp_prepare_boot_cpu;
-	if (hv_root_partition ||
+	if (hv_root_partition() ||
 	    (!ms_hyperv.paravisor_present && hv_isolation_type_snp()))
 		smp_ops.smp_prepare_cpus = hv_smp_prepare_cpus;
 # endif
diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index f00019b078a7..09549451dd51 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -582,7 +582,7 @@ static void __init hv_init_tsc_clocksource(void)
 	 * mapped.
 	 */
 	tsc_msr.as_uint64 = hv_get_msr(HV_MSR_REFERENCE_TSC);
-	if (hv_root_partition)
+	if (hv_root_partition())
 		tsc_pfn = tsc_msr.pfn;
 	else
 		tsc_pfn = HVPFN_DOWN(virt_to_phys(tsc_page));
@@ -627,7 +627,7 @@ void __init hv_remap_tsc_clocksource(void)
 	if (!(ms_hyperv.features & HV_MSR_REFERENCE_TSC_AVAILABLE))
 		return;
 
-	if (!hv_root_partition) {
+	if (!hv_root_partition()) {
 		WARN(1, "%s: attempt to remap TSC page in guest partition\n",
 		     __func__);
 		return;
diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 862c47b191af..aac172942f6c 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -55,4 +55,16 @@ config HYPERV_BALLOON
 	help
 	  Select this option to enable Hyper-V Balloon driver.
 
+config MSHV_ROOT
+	tristate "Microsoft Hyper-V root partition support"
+	depends on HYPERV
+	depends on !HYPERV_VTL_MODE
+	depends on PAGE_SIZE_4KB
+	default n
+	help
+	  Select this option to enable support for booting and running as root
+	  partition on Microsoft Hyper-V.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index 9afcabb3fbd2..2b8dc954b350 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -13,4 +13,5 @@ hv_vmbus-$(CONFIG_HYPERV_TESTING)	+= hv_debugfs.o
 hv_utils-y := hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
 
 # Code that must be built-in
-obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o hv_proc.o
+obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o
+obj-$(subst m,y,$(CONFIG_MSHV_ROOT)) += hv_proc.o
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 36d9ba097ff5..93d82382351c 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -144,7 +144,7 @@ int hv_synic_alloc(void)
 		 * Synic message and event pages are allocated by paravisor.
 		 * Skip these pages allocation here.
 		 */
-		if (!ms_hyperv.paravisor_present && !hv_root_partition) {
+		if (!ms_hyperv.paravisor_present && !hv_root_partition()) {
 			hv_cpu->synic_message_page =
 				(void *)get_zeroed_page(GFP_ATOMIC);
 			if (!hv_cpu->synic_message_page) {
@@ -272,7 +272,7 @@ void hv_synic_enable_regs(unsigned int cpu)
 	simp.as_uint64 = hv_get_msr(HV_MSR_SIMP);
 	simp.simp_enabled = 1;
 
-	if (ms_hyperv.paravisor_present || hv_root_partition) {
+	if (ms_hyperv.paravisor_present || hv_root_partition()) {
 		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
 		u64 base = (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
 				~ms_hyperv.shared_gpa_boundary;
@@ -291,7 +291,7 @@ void hv_synic_enable_regs(unsigned int cpu)
 	siefp.as_uint64 = hv_get_msr(HV_MSR_SIEFP);
 	siefp.siefp_enabled = 1;
 
-	if (ms_hyperv.paravisor_present || hv_root_partition) {
+	if (ms_hyperv.paravisor_present || hv_root_partition()) {
 		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
 		u64 base = (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
 				~ms_hyperv.shared_gpa_boundary;
@@ -367,7 +367,7 @@ void hv_synic_disable_regs(unsigned int cpu)
 	 * addresses.
 	 */
 	simp.simp_enabled = 0;
-	if (ms_hyperv.paravisor_present || hv_root_partition) {
+	if (ms_hyperv.paravisor_present || hv_root_partition()) {
 		iounmap(hv_cpu->synic_message_page);
 		hv_cpu->synic_message_page = NULL;
 	} else {
@@ -379,7 +379,7 @@ void hv_synic_disable_regs(unsigned int cpu)
 	siefp.as_uint64 = hv_get_msr(HV_MSR_SIEFP);
 	siefp.siefp_enabled = 0;
 
-	if (ms_hyperv.paravisor_present || hv_root_partition) {
+	if (ms_hyperv.paravisor_present || hv_root_partition()) {
 		iounmap(hv_cpu->synic_event_page);
 		hv_cpu->synic_event_page = NULL;
 	} else {
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index cb3ea49020ef..d1227e85c5b7 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -34,8 +34,11 @@
 u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
 EXPORT_SYMBOL_GPL(hv_current_partition_id);
 
+enum hv_partition_type hv_current_partition_type;
+EXPORT_SYMBOL_GPL(hv_current_partition_type);
+
 /*
- * hv_root_partition, ms_hyperv and hv_nested are defined here with other
+ * ms_hyperv and hv_nested are defined here with other
  * Hyper-V specific globals so they are shared across all architectures and are
  * built only when CONFIG_HYPERV is defined.  But on x86,
  * ms_hyperv_init_platform() is built even when CONFIG_HYPERV is not
@@ -43,9 +46,6 @@ EXPORT_SYMBOL_GPL(hv_current_partition_id);
  * here, allowing for an overriding definition in the module containing
  * ms_hyperv_init_platform().
  */
-bool __weak hv_root_partition;
-EXPORT_SYMBOL_GPL(hv_root_partition);
-
 bool __weak hv_nested;
 EXPORT_SYMBOL_GPL(hv_nested);
 
@@ -283,7 +283,7 @@ static void hv_kmsg_dump_register(void)
 
 static inline bool hv_output_page_exists(void)
 {
-	return hv_root_partition || IS_ENABLED(CONFIG_HYPERV_VTL_MODE);
+	return hv_root_partition() || IS_ENABLED(CONFIG_HYPERV_VTL_MODE);
 }
 
 void __init hv_get_partition_id(void)
@@ -594,7 +594,7 @@ EXPORT_SYMBOL_GPL(hv_setup_dma_ops);
 
 bool hv_is_hibernation_supported(void)
 {
-	return !hv_root_partition && acpi_sleep_state_supported(ACPI_STATE_S4);
+	return !hv_root_partition() && acpi_sleep_state_supported(ACPI_STATE_S4);
 }
 EXPORT_SYMBOL_GPL(hv_is_hibernation_supported);
 
@@ -683,3 +683,23 @@ u64 __weak hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
 	return HV_STATUS_INVALID_PARAMETER;
 }
 EXPORT_SYMBOL_GPL(hv_tdx_hypercall);
+
+void hv_identify_partition_type(void)
+{
+	/*
+	 * Check partition creation and cpu management privileges
+	 *
+	 * Hyper-V should never specify running as root and as a Confidential
+	 * VM. But to protect against a compromised/malicious Hyper-V trying
+	 * to exploit root behavior to expose Confidential VM memory, ignore
+	 * the root partition setting if also a Confidential VM.
+	 */
+	if ((ms_hyperv.priv_high & HV_CREATE_PARTITIONS) &&
+	    (ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
+	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
+		hv_current_partition_type = HV_PARTITION_TYPE_ROOT;
+		pr_info("Hyper-V: running as root partition\n");
+	} else {
+		hv_current_partition_type = HV_PARTITION_TYPE_GUEST;
+	}
+}
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 0f6cd44fff29..844eba0429fa 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2646,7 +2646,7 @@ static int __init hv_acpi_init(void)
 	if (!hv_is_hyperv_initialized())
 		return -ENODEV;
 
-	if (hv_root_partition && !hv_nested)
+	if (hv_root_partition() && !hv_nested)
 		return 0;
 
 	/*
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index 2a86aa5d54c6..53e4b37716af 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -130,7 +130,7 @@ static int __init hyperv_prepare_irq_remapping(void)
 	    x86_init.hyper.msi_ext_dest_id())
 		return -ENODEV;
 
-	if (hv_root_partition) {
+	if (hv_root_partition()) {
 		name = "HYPERV-ROOT-IR";
 		ops = &hyperv_root_ir_domain_ops;
 	} else {
@@ -151,7 +151,7 @@ static int __init hyperv_prepare_irq_remapping(void)
 		return -ENOMEM;
 	}
 
-	if (hv_root_partition)
+	if (hv_root_partition())
 		return 0; /* The rest is only relevant to guests */
 
 	/*
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 7adc10a4fa3e..6f898792fb51 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -28,6 +28,11 @@
 
 #define VTPM_BASE_ADDRESS 0xfed40000
 
+enum hv_partition_type {
+	HV_PARTITION_TYPE_GUEST,
+	HV_PARTITION_TYPE_ROOT,
+};
+
 struct ms_hyperv_info {
 	u32 features;
 	u32 priv_high;
@@ -59,6 +64,7 @@ struct ms_hyperv_info {
 extern struct ms_hyperv_info ms_hyperv;
 extern bool hv_nested;
 extern u64 hv_current_partition_id;
+extern enum hv_partition_type hv_current_partition_type;
 
 extern void * __percpu *hyperv_pcpu_input_arg;
 extern void * __percpu *hyperv_pcpu_output_arg;
@@ -190,8 +196,6 @@ void hv_remove_crash_handler(void);
 extern int vmbus_interrupt;
 extern int vmbus_irq;
 
-extern bool hv_root_partition;
-
 #if IS_ENABLED(CONFIG_HYPERV)
 /*
  * Hypervisor's notion of virtual processor ID is different from
@@ -213,15 +217,12 @@ void __init hv_common_free(void);
 void __init ms_hyperv_late_init(void);
 int hv_common_cpu_init(unsigned int cpu);
 int hv_common_cpu_die(unsigned int cpu);
+void hv_identify_partition_type(void);
 
 void *hv_alloc_hyperv_page(void);
 void *hv_alloc_hyperv_zeroed_page(void);
 void hv_free_hyperv_page(void *addr);
 
-int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
-int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
-int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
-
 /**
  * hv_cpu_number_to_vp_number() - Map CPU to VP.
  * @cpu_number: CPU number in Linux terms
@@ -309,6 +310,7 @@ void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 void hv_setup_dma_ops(struct device *dev, bool coherent);
 #else /* CONFIG_HYPERV */
+static inline void hv_identify_partition_type(void) {}
 static inline bool hv_is_hyperv_initialized(void) { return false; }
 static inline bool hv_is_hibernation_supported(void) { return false; }
 static inline void hyperv_cleanup(void) {}
@@ -320,4 +322,29 @@ static inline enum hv_isolation_type hv_get_isolation_type(void)
 }
 #endif /* CONFIG_HYPERV */
 
+#if IS_ENABLED(CONFIG_MSHV_ROOT)
+static inline bool hv_root_partition(void)
+{
+	return	hv_current_partition_type == HV_PARTITION_TYPE_ROOT;
+}
+int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
+int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
+int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
+
+#else /* CONFIG_MSHV_ROOT */
+static inline bool hv_root_partition(void) { return false; }
+static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
+{
+	return hv_result(U64_MAX);
+}
+static inline int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id)
+{
+	return hv_result(U64_MAX);
+}
+static inline int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
+{
+	return hv_result(U64_MAX);
+}
+#endif /* CONFIG_MSHV_ROOT */
+
 #endif
-- 
2.34.1


