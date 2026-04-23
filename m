Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A784CF589B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLzms2JDLRJRnvdbHRjSQjPRubfamtoDlwMUbgfve34=; b=Bz04K/IRuABhs17jU25tFhBHlY
	T+4uGqI/Cm2/0UWNB01pd0J/RQcIm+cwRZeH7N9BTsNgmlBZ58/1isAkycYnP/gzPfVk1ZDGsGaMF
	p0F9eJfPQeeAF2B1qzhWsjh4XYLfAajviIsGh9jP6Dzm+YH5gfoPbb7O9dtBGAjxB6EQMDUCUSu1P
	nCWtPbIETINnqAuYI2XhAeJYWiyav3RTK0zAdWr+q01KvktPBbp3R0DJt6Oa3bMHNHsCS6eEEQTar
	xATgP+BkehWVN+jhKCAZnxdg15m7HPo4h/9tPpkofBLIKxcc5CScSJ90+zMubfAu5/2Oeu1ljqLOe
	hpRlrY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOJ-0000000Bdc1-1iu2;
	Thu, 23 Apr 2026 12:42:47 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtO9-0000000BdWl-42nE;
	Thu, 23 Apr 2026 12:42:45 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3897E20B7169;
	Thu, 23 Apr 2026 05:42:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3897E20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948154;
	bh=zLzms2JDLRJRnvdbHRjSQjPRubfamtoDlwMUbgfve34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUlDmye22rkeSlONYLXTNUDycGTkKyaZAW9hKnGf/4dlX2h/INs0GEIPhuIU0A4Br
	 Y/EzKEDkmn2j7HHcwARzseniD46X07CpcUXz+UTJzepzrklDfpFLTwH1Fi73l8V6z2
	 3graOJdNxm6PWIjh1jCyDaWhrMiYI2ByxcFZCMEI=
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
Subject: [PATCH v2 02/15] Drivers: hv: Move hv_vp_assist_page to common files
Date: Thu, 23 Apr 2026 12:41:52 +0000
Message-ID: <20260423124206.2410879-3-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054238_059669_1C7D5A11 
X-CRM114-Status: GOOD (  28.21  )
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

Move the logic to initialize and export hv_vp_assist_page from x86
architecture code to Hyper-V common code to allow it to be used for
upcoming arm64 support in MSHV_VTL driver.
Note: This change also improves error handling - if VP assist page
allocation fails, hyperv_init() now returns early instead of
continuing with partial initialization.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/x86/hyperv/hv_init.c       | 88 +-----------------------------
 arch/x86/include/asm/mshyperv.h | 14 -----
 drivers/hv/hv_common.c          | 94 ++++++++++++++++++++++++++++++++-
 include/asm-generic/mshyperv.h  | 16 ++++++
 include/hyperv/hvgdk_mini.h     |  6 ++-
 5 files changed, 115 insertions(+), 103 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 323adc93f2dc..75a98b5e451b 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -81,9 +81,6 @@ union hv_ghcb * __percpu *hv_ghcb_pg;
 /* Storage to save the hypercall page temporarily for hibernation */
 static void *hv_hypercall_pg_saved;
 
-struct hv_vp_assist_page **hv_vp_assist_page;
-EXPORT_SYMBOL_GPL(hv_vp_assist_page);
-
 static int hyperv_init_ghcb(void)
 {
 	u64 ghcb_gpa;
@@ -117,59 +114,12 @@ static int hyperv_init_ghcb(void)
 
 static int hv_cpu_init(unsigned int cpu)
 {
-	union hv_vp_assist_msr_contents msr = { 0 };
-	struct hv_vp_assist_page **hvp;
 	int ret;
 
 	ret = hv_common_cpu_init(cpu);
 	if (ret)
 		return ret;
 
-	if (!hv_vp_assist_page)
-		return 0;
-
-	hvp = &hv_vp_assist_page[cpu];
-	if (hv_root_partition()) {
-		/*
-		 * For root partition we get the hypervisor provided VP assist
-		 * page, instead of allocating a new page.
-		 */
-		rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
-		*hvp = memremap(msr.pfn << HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT,
-				PAGE_SIZE, MEMREMAP_WB);
-	} else {
-		/*
-		 * The VP assist page is an "overlay" page (see Hyper-V TLFS's
-		 * Section 5.2.1 "GPA Overlay Pages"). Here it must be zeroed
-		 * out to make sure we always write the EOI MSR in
-		 * hv_apic_eoi_write() *after* the EOI optimization is disabled
-		 * in hv_cpu_die(), otherwise a CPU may not be stopped in the
-		 * case of CPU offlining and the VM will hang.
-		 */
-		if (!*hvp) {
-			*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
-
-			/*
-			 * Hyper-V should never specify a VM that is a Confidential
-			 * VM and also running in the root partition. Root partition
-			 * is blocked to run in Confidential VM. So only decrypt assist
-			 * page in non-root partition here.
-			 */
-			if (*hvp && !ms_hyperv.paravisor_present && hv_isolation_type_snp()) {
-				WARN_ON_ONCE(set_memory_decrypted((unsigned long)(*hvp), 1));
-				memset(*hvp, 0, PAGE_SIZE);
-			}
-		}
-
-		if (*hvp)
-			msr.pfn = vmalloc_to_pfn(*hvp);
-
-	}
-	if (!WARN_ON(!(*hvp))) {
-		msr.enable = 1;
-		wrmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
-	}
-
 	/* Allow Hyper-V stimer vector to be injected from Hypervisor. */
 	if (ms_hyperv.misc_features & HV_STIMER_DIRECT_MODE_AVAILABLE)
 		apic_update_vector(cpu, HYPERV_STIMER0_VECTOR, true);
@@ -286,23 +236,6 @@ static int hv_cpu_die(unsigned int cpu)
 
 	hv_common_cpu_die(cpu);
 
-	if (hv_vp_assist_page && hv_vp_assist_page[cpu]) {
-		union hv_vp_assist_msr_contents msr = { 0 };
-		if (hv_root_partition()) {
-			/*
-			 * For root partition the VP assist page is mapped to
-			 * hypervisor provided page, and thus we unmap the
-			 * page here and nullify it, so that in future we have
-			 * correct page address mapped in hv_cpu_init.
-			 */
-			memunmap(hv_vp_assist_page[cpu]);
-			hv_vp_assist_page[cpu] = NULL;
-			rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
-			msr.enable = 0;
-		}
-		wrmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
-	}
-
 	if (hv_reenlightenment_cb == NULL)
 		return 0;
 
@@ -460,21 +393,6 @@ void __init hyperv_init(void)
 	if (hv_common_init())
 		return;
 
-	/*
-	 * The VP assist page is useless to a TDX guest: the only use we
-	 * would have for it is lazy EOI, which can not be used with TDX.
-	 */
-	if (hv_isolation_type_tdx())
-		hv_vp_assist_page = NULL;
-	else
-		hv_vp_assist_page = kzalloc_objs(*hv_vp_assist_page, nr_cpu_ids);
-	if (!hv_vp_assist_page) {
-		ms_hyperv.hints &= ~HV_X64_ENLIGHTENED_VMCS_RECOMMENDED;
-
-		if (!hv_isolation_type_tdx())
-			goto common_free;
-	}
-
 	if (ms_hyperv.paravisor_present && hv_isolation_type_snp()) {
 		/* Negotiate GHCB Version. */
 		if (!hv_ghcb_negotiate_protocol())
@@ -483,7 +401,7 @@ void __init hyperv_init(void)
 
 		hv_ghcb_pg = alloc_percpu(union hv_ghcb *);
 		if (!hv_ghcb_pg)
-			goto free_vp_assist_page;
+			goto free_ghcb_page;
 	}
 
 	cpuhp = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "x86/hyperv_init:online",
@@ -613,10 +531,6 @@ void __init hyperv_init(void)
 	cpuhp_remove_state(CPUHP_AP_HYPERV_ONLINE);
 free_ghcb_page:
 	free_percpu(hv_ghcb_pg);
-free_vp_assist_page:
-	kfree(hv_vp_assist_page);
-	hv_vp_assist_page = NULL;
-common_free:
 	hv_common_free();
 }
 
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index f64393e853ee..95b452387969 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -155,16 +155,6 @@ static inline u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
 	return _hv_do_fast_hypercall16(control, input1, input2);
 }
 
-extern struct hv_vp_assist_page **hv_vp_assist_page;
-
-static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
-{
-	if (!hv_vp_assist_page)
-		return NULL;
-
-	return hv_vp_assist_page[cpu];
-}
-
 void __init hyperv_init(void);
 void hyperv_setup_mmu_ops(void);
 void set_hv_tscchange_cb(void (*cb)(void));
@@ -254,10 +244,6 @@ static inline void hyperv_setup_mmu_ops(void) {}
 static inline void set_hv_tscchange_cb(void (*cb)(void)) {}
 static inline void clear_hv_tscchange_cb(void) {}
 static inline void hyperv_stop_tsc_emulation(void) {};
-static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
-{
-	return NULL;
-}
 static inline int hyperv_flush_guest_mapping(u64 as) { return -1; }
 static inline int hyperv_flush_guest_mapping_range(u64 as,
 		hyperv_fill_flush_list_func fill_func, void *data)
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 6b67ac616789..e8633bc51d56 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -28,7 +28,11 @@
 #include <linux/slab.h>
 #include <linux/dma-map-ops.h>
 #include <linux/set_memory.h>
+#include <linux/vmalloc.h>
+#include <linux/io.h>
+#include <linux/hyperv.h>
 #include <hyperv/hvhdk.h>
+#include <hyperv/hvgdk.h>
 #include <asm/mshyperv.h>
 
 u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
@@ -78,6 +82,8 @@ static struct ctl_table_header *hv_ctl_table_hdr;
 u8 * __percpu *hv_synic_eventring_tail;
 EXPORT_SYMBOL_GPL(hv_synic_eventring_tail);
 
+struct hv_vp_assist_page **hv_vp_assist_page;
+EXPORT_SYMBOL_GPL(hv_vp_assist_page);
 /*
  * Hyper-V specific initialization and shutdown code that is
  * common across all architectures.  Called from architecture
@@ -92,6 +98,9 @@ void __init hv_common_free(void)
 	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE)
 		hv_kmsg_dump_unregister();
 
+	kfree(hv_vp_assist_page);
+	hv_vp_assist_page = NULL;
+
 	kfree(hv_vp_index);
 	hv_vp_index = NULL;
 
@@ -394,6 +403,23 @@ int __init hv_common_init(void)
 	for (i = 0; i < nr_cpu_ids; i++)
 		hv_vp_index[i] = VP_INVAL;
 
+	/*
+	 * The VP assist page is useless to a TDX guest: the only use we
+	 * would have for it is lazy EOI, which can not be used with TDX.
+	 */
+	if (hv_isolation_type_tdx()) {
+		hv_vp_assist_page = NULL;
+#ifdef CONFIG_X86_64
+		ms_hyperv.hints &= ~HV_X64_ENLIGHTENED_VMCS_RECOMMENDED;
+#endif
+	} else {
+		hv_vp_assist_page = kzalloc_objs(*hv_vp_assist_page, nr_cpu_ids);
+		if (!hv_vp_assist_page) {
+			hv_common_free();
+			return -ENOMEM;
+		}
+	}
+
 	return 0;
 }
 
@@ -471,6 +497,8 @@ void __init ms_hyperv_late_init(void)
 
 int hv_common_cpu_init(unsigned int cpu)
 {
+	union hv_vp_assist_msr_contents msr = { 0 };
+	struct hv_vp_assist_page **hvp;
 	void **inputarg, **outputarg;
 	u8 **synic_eventring_tail;
 	u64 msr_vp_index;
@@ -539,7 +567,53 @@ int hv_common_cpu_init(unsigned int cpu)
 						sizeof(u8), flags);
 		/* No need to unwind any of the above on failure here */
 		if (unlikely(!*synic_eventring_tail))
-			ret = -ENOMEM;
+			return -ENOMEM;
+	}
+
+	if (!hv_vp_assist_page)
+		return ret;
+
+	hvp = &hv_vp_assist_page[cpu];
+	if (hv_root_partition()) {
+		/*
+		 * For root partition we get the hypervisor provided VP assist
+		 * page, instead of allocating a new page.
+		 */
+		msr.as_uint64 = hv_get_msr(HV_MSR_VP_ASSIST_PAGE);
+		*hvp = memremap(msr.pfn << HV_VP_ASSIST_PAGE_ADDRESS_SHIFT,
+				HV_HYP_PAGE_SIZE, MEMREMAP_WB);
+	} else {
+		/*
+		 * The VP assist page is an "overlay" page (see Hyper-V TLFS's
+		 * Section 5.2.1 "GPA Overlay Pages"). Here it must be zeroed
+		 * out to make sure that on x86/x64, we always write the EOI MSR in
+		 * hv_apic_eoi_write() *after* the EOI optimization is disabled
+		 * in hv_cpu_die(), otherwise a CPU may not be stopped in the
+		 * case of CPU offlining and the VM will hang.
+		 */
+		if (!*hvp) {
+			*hvp = __vmalloc(HV_HYP_PAGE_SIZE, flags | __GFP_ZERO);
+
+			/*
+			 * Hyper-V should never specify a VM that is a Confidential
+			 * VM and also running in the root partition. Root partition
+			 * is blocked to run in Confidential VM. So only decrypt assist
+			 * page in non-root partition here.
+			 */
+			if (*hvp &&
+			    !ms_hyperv.paravisor_present &&
+			    hv_isolation_type_snp()) {
+				WARN_ON_ONCE(set_memory_decrypted((unsigned long)(*hvp), 1));
+				memset(*hvp, 0, HV_HYP_PAGE_SIZE);
+			}
+		}
+
+		if (*hvp)
+			msr.pfn = page_to_hvpfn(vmalloc_to_page(*hvp));
+	}
+	if (!WARN_ON(!(*hvp))) {
+		msr.enable = 1;
+		hv_set_msr(HV_MSR_VP_ASSIST_PAGE, msr.as_uint64);
 	}
 
 	return ret;
@@ -566,6 +640,24 @@ int hv_common_cpu_die(unsigned int cpu)
 		*synic_eventring_tail = NULL;
 	}
 
+	if (hv_vp_assist_page && hv_vp_assist_page[cpu]) {
+		union hv_vp_assist_msr_contents msr = { 0 };
+
+		if (hv_root_partition()) {
+			/*
+			 * For root partition the VP assist page is mapped to
+			 * hypervisor provided page, and thus we unmap the
+			 * page here and nullify it, so that in future we have
+			 * correct page address mapped in hv_cpu_init.
+			 */
+			memunmap(hv_vp_assist_page[cpu]);
+			hv_vp_assist_page[cpu] = NULL;
+			msr.as_uint64 = hv_get_msr(HV_MSR_VP_ASSIST_PAGE);
+			msr.enable = 0;
+		}
+		hv_set_msr(HV_MSR_VP_ASSIST_PAGE, msr.as_uint64);
+	}
+
 	return 0;
 }
 
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index d37b68238c97..2810aa05dc73 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -25,6 +25,7 @@
 #include <linux/nmi.h>
 #include <asm/ptrace.h>
 #include <hyperv/hvhdk.h>
+#include <hyperv/hvgdk.h>
 
 #define VTPM_BASE_ADDRESS 0xfed40000
 
@@ -299,6 +300,16 @@ do { \
 #define hv_status_debug(status, fmt, ...) \
 	hv_status_printk(debug, status, fmt, ##__VA_ARGS__)
 
+extern struct hv_vp_assist_page **hv_vp_assist_page;
+
+static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
+{
+	if (!hv_vp_assist_page)
+		return NULL;
+
+	return hv_vp_assist_page[cpu];
+}
+
 const char *hv_result_to_string(u64 hv_status);
 int hv_result_to_errno(u64 status);
 void hyperv_report_panic(struct pt_regs *regs, long err, bool in_die);
@@ -327,6 +338,11 @@ static inline enum hv_isolation_type hv_get_isolation_type(void)
 {
 	return HV_ISOLATION_TYPE_NONE;
 }
+
+static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
+{
+	return NULL;
+}
 #endif /* CONFIG_HYPERV */
 
 #if IS_ENABLED(CONFIG_MSHV_ROOT)
diff --git a/include/hyperv/hvgdk_mini.h b/include/hyperv/hvgdk_mini.h
index 056ef7b6b360..c72d04cd5ae4 100644
--- a/include/hyperv/hvgdk_mini.h
+++ b/include/hyperv/hvgdk_mini.h
@@ -149,6 +149,7 @@ struct hv_u128 {
 #define HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT	12
 #define HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_MASK	\
 		(~((1ull << HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT) - 1))
+#define HV_MSR_VP_ASSIST_PAGE              (HV_X64_MSR_VP_ASSIST_PAGE)
 
 /* Hyper-V Enlightened VMCS version mask in nested features CPUID */
 #define HV_X64_ENLIGHTENED_VMCS_VERSION		0xff
@@ -410,6 +411,7 @@ union hv_x64_msr_hypercall_contents {
 #if defined(CONFIG_ARM64)
 #define HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE	BIT(8)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE		BIT(13)
+#define HV_VP_ASSIST_PAGE_ADDRESS_SHIFT 12
 #endif /* CONFIG_ARM64 */
 
 #if defined(CONFIG_X86)
@@ -1163,6 +1165,8 @@ enum hv_register_name {
 #define HV_MSR_STIMER0_CONFIG	(HV_X64_MSR_STIMER0_CONFIG)
 #define HV_MSR_STIMER0_COUNT	(HV_X64_MSR_STIMER0_COUNT)
 
+#define HV_VP_ASSIST_PAGE_ADDRESS_SHIFT HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT
+
 #elif defined(CONFIG_ARM64) /* CONFIG_X86 */
 
 #define HV_MSR_CRASH_P0		(HV_REGISTER_GUEST_CRASH_P0)
@@ -1185,7 +1189,7 @@ enum hv_register_name {
 
 #define HV_MSR_STIMER0_CONFIG	(HV_REGISTER_STIMER0_CONFIG)
 #define HV_MSR_STIMER0_COUNT	(HV_REGISTER_STIMER0_COUNT)
-
+#define HV_MSR_VP_ASSIST_PAGE    (HV_REGISTER_VP_ASSIST_PAGE)
 #endif /* CONFIG_ARM64 */
 
 union hv_explicit_suspend_register {
-- 
2.43.0


