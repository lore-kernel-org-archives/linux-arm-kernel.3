Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A90CF4645C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3StM9+iDpcoit1RWPxAyV+2hPmFkaB3kEah6gv3o8Y=; b=mJt69TlCMyXJ8NpmwQmiIyz0pW
	jzXDVrhUw/5vuFSn1E0xwVSOJUZBxEHtVy+i6vZP43uYFZRezn/JCDl1UE5ClK+V9Hv+Jgwnr0fkJ
	qv7p0YBYxx9Gy68Kn51lPMlPPEAtb/D6rGB5eepZLxmOH9g2awdb9Glau/oE8g8asoFFsiea8nMqj
	s+Z0cIDPbC8XAGIFBI+4sppWVkfIjc7z3nKUHzR4iu1y5auQMuZQ8WkBZ8J4Wbzxwdmw4r7FKLkTJ
	qGnPHwYpLCeAnZXgA2btucME2ySS5qPrbavQBNRIRopn0fIBxy4PzI3cYuRnN2FlGaQeJcOy1admM
	w8NFHgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26ow-00000003ub7-0Gyu;
	Mon, 16 Mar 2026 12:13:18 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26ot-00000003uZD-0wSx;
	Mon, 16 Mar 2026 12:13:16 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id ECDB820B712B;
	Mon, 16 Mar 2026 05:13:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ECDB820B712B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663194;
	bh=E3StM9+iDpcoit1RWPxAyV+2hPmFkaB3kEah6gv3o8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMDm6OU2yqAfZL7t2pqxQXx0b+7Tzsl4B3jaASsVyXx4EtKOat/05+uslxY9NnP2z
	 2qsH8BP+y+pNNzM6HR60ValkMckk/IJ3+xUNijOYFVQ2x1XUoFaNp//Gzxc3sCXm1o
	 mbW5a0iAOYbxtYDeW/Is9Z2foXY/L41i7tMDtNB4=
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
Subject: [PATCH 03/11] Drivers: hv: Add support to setup percpu vmbus handler
Date: Mon, 16 Mar 2026 12:12:33 +0000
Message-ID: <20260316121241.910764-4-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051315_294758_4F3BEC1D 
X-CRM114-Status: GOOD (  13.83  )
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

Add a wrapper function - hv_setup_percpu_vmbus_handler(), similar to
hv_setup_vmbus_handler() to allow setting up custom per-cpu VMBus
interrupt handler. This is required for arm64 support, to be added
in MSHV_VTL driver, where per-cpu VMBus interrupt handler will be
set to mshv_vtl_vmbus_isr() for VTL2 (Virtual Trust Level 2).

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c   | 13 +++++++++++++
 drivers/hv/hv_common.c         | 11 +++++++++++
 drivers/hv/vmbus_drv.c         |  7 +------
 include/asm-generic/mshyperv.h |  3 +++
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d7..d4494ceeaad0 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -134,3 +134,16 @@ bool hv_is_hyperv_initialized(void)
 	return hyperv_initialized;
 }
 EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
+
+static void (*vmbus_percpu_handler)(void);
+void hv_setup_percpu_vmbus_handler(void (*handler)(void))
+{
+	vmbus_percpu_handler = handler;
+}
+
+irqreturn_t vmbus_percpu_isr(int irq, void *dev_id)
+{
+	if (vmbus_percpu_handler)
+		vmbus_percpu_handler();
+	return IRQ_HANDLED;
+}
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index d1ebc0ebd08f..a5064f558bf6 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -759,6 +759,17 @@ void __weak hv_setup_vmbus_handler(void (*handler)(void))
 }
 EXPORT_SYMBOL_GPL(hv_setup_vmbus_handler);
 
+irqreturn_t __weak vmbus_percpu_isr(int irq, void *dev_id)
+{
+	return IRQ_HANDLED;
+}
+EXPORT_SYMBOL_GPL(vmbus_percpu_isr);
+
+void __weak hv_setup_percpu_vmbus_handler(void (*handler)(void))
+{
+}
+EXPORT_SYMBOL_GPL(hv_setup_percpu_vmbus_handler);
+
 void __weak hv_remove_vmbus_handler(void)
 {
 }
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index bc4fc1951ae1..f99d4f2d3862 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1413,12 +1413,6 @@ void vmbus_isr(void)
 }
 EXPORT_SYMBOL_FOR_MODULES(vmbus_isr, "mshv_vtl");
 
-static irqreturn_t vmbus_percpu_isr(int irq, void *dev_id)
-{
-	vmbus_isr();
-	return IRQ_HANDLED;
-}
-
 static void vmbus_percpu_work(struct work_struct *work)
 {
 	unsigned int cpu = smp_processor_id();
@@ -1520,6 +1514,7 @@ static int vmbus_bus_init(void)
 	if (vmbus_irq == -1) {
 		hv_setup_vmbus_handler(vmbus_isr);
 	} else {
+		hv_setup_percpu_vmbus_handler(vmbus_isr);
 		ret = request_percpu_irq(vmbus_irq, vmbus_percpu_isr,
 				"Hyper-V VMbus", &vmbus_evt);
 		if (ret) {
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 108f135d4fd9..b147a12085e4 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -22,6 +22,7 @@
 #include <linux/bitops.h>
 #include <acpi/acpi_numa.h>
 #include <linux/cpumask.h>
+#include <linux/interrupt.h>
 #include <linux/nmi.h>
 #include <asm/ptrace.h>
 #include <hyperv/hvhdk.h>
@@ -179,6 +180,8 @@ static inline u64 hv_generate_guest_id(u64 kernel_version)
 
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info);
 
+irqreturn_t vmbus_percpu_isr(int irq, void *dev_id);
+void hv_setup_percpu_vmbus_handler(void (*handler)(void));
 void hv_setup_vmbus_handler(void (*handler)(void));
 void hv_remove_vmbus_handler(void);
 void hv_setup_stimer0_handler(void (*handler)(void));
-- 
2.43.0


