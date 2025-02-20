Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97278C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cM0W5qUd693Fr3OrdVtsWGhuROfGGe7HnF5gUiDq5aQ=; b=sULxZ+CxGy45jUQ8H/UCMeqALl
	LGgnHKNztKHaD5AKfPMLHCIkj/3c64u6ULhrSmTfC/e63cnzQnPe8FSXtaE+o0LQGLG/3ch97sU1K
	i/Xhntx68cRoNT9N4d8mSBmPh96kWVmIY+Ady8STHs7VuLSLIOexfQGxAeEokCZJDRH0vyjyYUvrP
	+au7NCbVwpEqfKzV6mxll5sXzYHVyL5f6qFpkJ9VbkDmrxHzTtLJ2NWtth0KH0C5PyqMVhsGnrOBH
	qt8uoasmigpzqvNKC0kOBtvZkQoguqj5ASfeRQnQ9g4KzcQwPXusZcsIaKZAOnw5kdd5hdVgW5skI
	Hv2qvv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBTM-00000002QKv-3EzU;
	Thu, 20 Feb 2025 18:40:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBMg-00000002OPH-3GpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:33:41 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 232D22059197;
	Thu, 20 Feb 2025 10:33:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 232D22059197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740076418;
	bh=cM0W5qUd693Fr3OrdVtsWGhuROfGGe7HnF5gUiDq5aQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hYATQJd042Mb9AA2hOEuQb9t0B829p6m3wx38QlmCxkMU+kJ0xwtX834q7kzRzZ8A
	 uZVmHxLfDiD1AGB9IeRTLuD0LSb1nxl+76/RDFBUw6kVWQRhpINSjrtdamGqIcVYOZ
	 T9zPcMzpFEiryHLygzSoAi1824np2JNH/a00mNLk=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	iommu@lists.linux.dev,
	mhklinux@outlook.com,
	eahariha@linux.microsoft.com
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
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH v2 3/3] hyperv: Add CONFIG_MSHV_ROOT to gate root partition support
Date: Thu, 20 Feb 2025 10:33:16 -0800
Message-Id: <1740076396-15086-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_103338_869681_FFA44ACE 
X-CRM114-Status: GOOD (  13.05  )
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

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 drivers/hv/Kconfig             | 16 ++++++++++++++++
 drivers/hv/Makefile            |  3 ++-
 include/asm-generic/mshyperv.h | 24 ++++++++++++++++++++----
 3 files changed, 38 insertions(+), 5 deletions(-)

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
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index d2b1a8fc074c..b29357cff2f7 100644
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
 	return hv_current_partition_type == HV_PARTITION_TYPE_ROOT;
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


