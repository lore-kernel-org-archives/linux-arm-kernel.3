Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B85C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVk5iqQhJpF1WLegpUDTFKMMv70U69Syt0MEa8AVqmA=; b=4qcNWQDcxvovZrFQD2zA9fqZH0
	xHUtjVFUvYhJjgvxZ4rnErDe6uNoNXrs6NDZnSUmLVJ1JZeoZYbCw2aP73uB7PWXb1cpdSD87a+2d
	ImJ9WUupJ6Q7Zugee1u3lrwu/IhrCH9sFOhkgLhQ+4AM4rUkM0siwSXJquhvbtOtUxRN1fd4w+INn
	XED5ZX186O11IgNcBHI1+4eOFxigiUM+qhrp3WgVTY5XSOpe8TWx5XmZOVecXutbjguoZtNPW26Fg
	4WOoGcNoXmDtkHjHD/5VRk3NLXgoUPxEam/lGmra+6fx32xxKLTZ/Kc3tdbMgzVffq+fe71FsgFEL
	QY/e528w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgThh-0000000Ar0O-2Nqr;
	Fri, 07 Feb 2025 19:07:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTdb-0000000Apsi-2eM7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:03:41 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5BC5E2107307;
	Fri,  7 Feb 2025 11:03:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5BC5E2107307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738955017;
	bh=pVk5iqQhJpF1WLegpUDTFKMMv70U69Syt0MEa8AVqmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqGwZwBgXd+iGoG+wOoOypOQ0xDw6ts0Tn3+nRPVh1fBP3ByT+MA8uhWrj2OVgPrk
	 cOthrprK3I4HkPWv6XVLFB3BTgIC6oSptOcUrE2FmwJBBCfInMqsSltCFFZSC7Rxxf
	 sVdX4KtYQUq/WdX0dqe+yY8v5za7gyZfYt3tfhuc=
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
Subject: [PATCH v3 2/2] hyperv: Move arch/x86/hyperv/hv_proc.c to drivers/hv
Date: Fri,  7 Feb 2025 11:03:22 -0800
Message-Id: <1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_110339_713550_8C8586BB 
X-CRM114-Status: GOOD (  10.50  )
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

These helpers are not specific to x86_64 and will be needed by common code.
Remove some unnecessary #includes.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/x86/hyperv/Makefile                  | 2 +-
 arch/x86/include/asm/mshyperv.h           | 4 ----
 drivers/hv/Makefile                       | 2 +-
 {arch/x86/hyperv => drivers/hv}/hv_proc.c | 4 ----
 include/asm-generic/mshyperv.h            | 4 ++++
 5 files changed, 6 insertions(+), 10 deletions(-)
 rename {arch/x86/hyperv => drivers/hv}/hv_proc.c (98%)

diff --git a/arch/x86/hyperv/Makefile b/arch/x86/hyperv/Makefile
index 3a1548054b48..d55f494f471d 100644
--- a/arch/x86/hyperv/Makefile
+++ b/arch/x86/hyperv/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y			:= hv_init.o mmu.o nested.o irqdomain.o ivm.o
-obj-$(CONFIG_X86_64)	+= hv_apic.o hv_proc.o
+obj-$(CONFIG_X86_64)	+= hv_apic.o
 obj-$(CONFIG_HYPERV_VTL_MODE)	+= hv_vtl.o
 
 ifdef CONFIG_X86_64
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 8d3ada3e8d0d..7dfca93ef048 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -56,10 +56,6 @@ u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2);
 #define HV_AP_INIT_GPAT_DEFAULT		0x0007040600070406ULL
 #define HV_AP_SEGMENT_LIMIT		0xffffffff
 
-int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
-int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
-int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
-
 /*
  * If the hypercall involves no input or output parameters, the hypervisor
  * ignores the corresponding GPA pointer.
diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index b992c0ed182b..9afcabb3fbd2 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -13,4 +13,4 @@ hv_vmbus-$(CONFIG_HYPERV_TESTING)	+= hv_debugfs.o
 hv_utils-y := hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
 
 # Code that must be built-in
-obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o
+obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o hv_proc.o
diff --git a/arch/x86/hyperv/hv_proc.c b/drivers/hv/hv_proc.c
similarity index 98%
rename from arch/x86/hyperv/hv_proc.c
rename to drivers/hv/hv_proc.c
index ac4c834d4435..3e410489f480 100644
--- a/arch/x86/hyperv/hv_proc.c
+++ b/drivers/hv/hv_proc.c
@@ -6,11 +6,7 @@
 #include <linux/slab.h>
 #include <linux/cpuhotplug.h>
 #include <linux/minmax.h>
-#include <asm/hypervisor.h>
 #include <asm/mshyperv.h>
-#include <asm/apic.h>
-
-#include <asm/trace/hyperv.h>
 
 /*
  * See struct hv_deposit_memory. The first u64 is partition ID, the rest
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index febeddf6cd8a..7adc10a4fa3e 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -218,6 +218,10 @@ void *hv_alloc_hyperv_page(void);
 void *hv_alloc_hyperv_zeroed_page(void);
 void hv_free_hyperv_page(void *addr);
 
+int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
+int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
+int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags);
+
 /**
  * hv_cpu_number_to_vp_number() - Map CPU to VP.
  * @cpu_number: CPU number in Linux terms
-- 
2.34.1


