Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gopo8p3LUJrB8DWqw9iqVed8qBTy2vgRbFIk0fXLIk=; b=KDnFssIrt2c9jDiCNsMP0Ql7Ku
	R01CBHi+cZHb/pr7zdlR/Y5W/gyooWD1kjQmxdovrYO/Jxn6BddctDeBYFhyGJ36cVMlFgVnaMf/1
	o3SUHVi5/GzcsyOEsc4fIB1bpNLUQpWnU4eH20TVZyHHBPCxoNlKAxh2i72hzaafdsqKjFTrVTs+d
	50wCJRwgdVKvEF4jNd11KjHk/xtvFbwrbkAAqJq7BrsJ/AhYodB+qNboyLaNdOtoLxq5cT5U+Cvxw
	gdAl5OtNPAegdDWTTcohBYHXP2b6T3Om+VlJbz/reiyWIfD1vxLD3aBtpQ2bi7MRn9fFrapYNK+A3
	oozu4UZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZBY-00000006iCI-3G9X;
	Fri, 21 Feb 2025 19:59:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZ8e-00000006hcy-04OV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:56:45 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 15BFA205367B;
	Fri, 21 Feb 2025 11:56:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 15BFA205367B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740167803;
	bh=4gopo8p3LUJrB8DWqw9iqVed8qBTy2vgRbFIk0fXLIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mW3rffXNvkpoJ5hFKcQPEodHXaNV1KedZAOxSZI92MIKF9Fs4wWfCnEQXRhh45eMa
	 zzARADBeSCIko0eI9mLPybE0qITzAAxPdUCDXO1aXwNRnwjrWM2OPDTldxA6EYo8v8
	 CyZgawwICMNL4L0ZnYlZX4I6o7HaXdidSAe+NzeM=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	iommu@lists.linux.dev,
	mhklinux@outlook.com,
	eahariha@linux.microsoft.com,
	mukeshrathor@microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
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
	skinsburskii@linux.microsoft.com
Subject: [PATCH v3 3/3] hyperv: Add CONFIG_MSHV_ROOT to gate root partition support
Date: Fri, 21 Feb 2025 11:56:35 -0800
Message-Id: <1740167795-13296-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_115644_098221_DF1FA819 
X-CRM114-Status: GOOD (  14.53  )
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

CONFIG_MSHV_ROOT allows kernels built to run as a normal Hyper-V guest
to exclude the root partition code, which is expected to grow
significantly over time.

This option is a tristate so future driver code can be built as a
(m)odule, allowing faster development iteration cycles.

If CONFIG_MSHV_ROOT is disabled, don't compile hv_proc.c, and stub
hv_root_partition() to return false unconditionally. This allows the
compiler to optimize away root partition code blocks since they will
be disabled at compile time.

In the case of booting as root partition *without* CONFIG_MSHV_ROOT
enabled, print a critical error (the kernel will likely crash).

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/hv/Kconfig             | 16 ++++++++++++++++
 drivers/hv/Makefile            |  3 ++-
 drivers/hv/hv_common.c         |  5 ++++-
 include/asm-generic/mshyperv.h | 24 ++++++++++++++++++++----
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 862c47b191af..794e88e9dc6b 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -55,4 +55,20 @@ config HYPERV_BALLOON
 	help
 	  Select this option to enable Hyper-V Balloon driver.
 
+config MSHV_ROOT
+	tristate "Microsoft Hyper-V root partition support"
+	depends on HYPERV
+	depends on !HYPERV_VTL_MODE
+	# The hypervisor interface operates on 4k pages. Enforcing it here
+	# simplifies many assumptions in the root partition code.
+	# e.g. When withdrawing memory, the hypervisor gives back 4k pages in
+	# no particular order, making it impossible to reassemble larger pages
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
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 3d9cfcfbc854..9804adb4cc56 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -734,6 +734,9 @@ void hv_identify_partition_type(void)
 	    (ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
 	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
 		pr_info("Hyper-V: running as root partition\n");
-		hv_curr_partition_type = HV_PARTITION_TYPE_ROOT;
+		if (IS_ENABLED(CONFIG_MSHV_ROOT))
+			hv_curr_partition_type = HV_PARTITION_TYPE_ROOT;
+		else
+			pr_crit("Hyper-V: CONFIG_MSHV_ROOT not enabled!\n");
 	}
 }
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 54ebd630e72c..b13b0cda4ac8 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -223,10 +223,6 @@ void *hv_alloc_hyperv_page(void);
 void *hv_alloc_hyperv_zeroed_page(void);
 void hv_free_hyperv_page(void *addr);
 
-int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
-int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
-int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
-
 /**
  * hv_cpu_number_to_vp_number() - Map CPU to VP.
  * @cpu_number: CPU number in Linux terms
@@ -327,9 +323,29 @@ static inline enum hv_isolation_type hv_get_isolation_type(void)
 }
 #endif /* CONFIG_HYPERV */
 
+#if IS_ENABLED(CONFIG_MSHV_ROOT)
 static inline bool hv_root_partition(void)
 {
 	return hv_curr_partition_type == HV_PARTITION_TYPE_ROOT;
 }
+int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
+int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
+int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
+
+#else /* CONFIG_MSHV_ROOT */
+static inline bool hv_root_partition(void) { return false; }
+static inline int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
+{
+	return -EOPNOTSUPP;
+}
+static inline int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id)
+{
+	return -EOPNOTSUPP;
+}
+static inline int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
+{
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_MSHV_ROOT */
 
 #endif
-- 
2.34.1


