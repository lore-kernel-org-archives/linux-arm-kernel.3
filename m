Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80IQwiIl4V2/MToMGOoJ8SmIIRKchxWe3CjM7ZCCf3o=; b=B5j9uCO98zFmUGwaGyJGhUk0Ad
	igLwbqLkLh7SdL1gRCjIYkhKU8QxmOzNWKAJayubpjRzHSnxpobapcPhymQSVqehB28gETginEBiJ
	h08HSwx8M0BLYPf7W2sa4qgekfzOurMeVcckLoRak6zXKpkyOjBn1YOqacvdaRxskX/rL3L2v8jaL
	tBBthq9q376CV/ZI+VAMODnoj/rlgON+AG0qNnthiJfm/ruPymimOW0eR2u0Pq6+AHMB8YJHwnpWD
	hx+cnJFO50IET80GiHXJ7O3W8T27SSRXj1e1IqQ5B/Ygxgik9QXFvPlQw3xzcu/EE7ADsQ1U9TuoH
	L86TTvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoHG-00000002OMg-2YYo;
	Fri, 14 Aug 2026 09:32:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoHE-00000002OKp-0fUD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:32:37 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 9645220B7168; Fri, 14 Aug 2026 02:32:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9645220B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786699929;
	bh=80IQwiIl4V2/MToMGOoJ8SmIIRKchxWe3CjM7ZCCf3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqdV6scuCBvLC5c5cAaRDU0HUkewp2NIQQoO1cvw+vidvjyZvO6LOcmdwbrIU0Unf
	 CanjPAeanUjR+wtYTm6EWtpjRyq9yMmb2/6uFoWR2/0ETsoVGazrV6zxHJpI5NNZMD
	 qIkvYhmSJXo/zMKD/I50/zfWdbIcRcl8h+ru4VWA=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>,
	Shradha Gupta <shradhagupta@microsoft.com>
Subject: [RFC PATCH 2/2] arm64/hyperv: Add kexec handler using machine_shutdown hook
Date: Fri, 14 Aug 2026 02:32:03 -0700
Message-ID: <20260814093208.3191430-1-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
References: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_023236_234556_5F3A14C7 
X-CRM114-Status: GOOD (  12.32  )
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

ARM64 Hyper-V guests currently lack the VMBus teardown that x86 performs
during kexec via hv_machine_shutdown(). Without this, kexec fails because:

1. The kexec'd kernel's vmbus_connect() hangs because the hypervisor
   still has the old VMBus connection active.
2. Stale SynIC state (message pending flags, event flags) causes
   message delivery failures or NULL pointer dereferences in the
   kexec'd kernel.

The VMBus driver already provides a kexec cleanup callback via the
existing hv_setup_kexec_handler() / hv_remove_kexec_handler() API
(drivers/hv/vmbus_drv.c). These call into arch-specific overrides;
on x86, the override is in mshyperv.c, while ARM64 currently uses
the __weak no-op stubs from hv_common.c.

This patch provides the ARM64 override of hv_setup_kexec_handler()
and hv_remove_kexec_handler(), wiring the registered hv_kexec_handler
to the new arm64_pre_smp_shutdown_hook so that it is invoked during
machine_shutdown(). This matches x86's ordering: the handler runs
AFTER device_shutdown() (so PCI drivers can clean up interrupt
mappings via PCI_DELETE_INTERRUPT_MESSAGE before VMBus UNLOAD
force-closes channels) and AFTER cpu_hotplug_enable() (so
cpuhp_remove_state() can disable SynIC on all CPUs).

hv_kexec_handler() (registered by vmbus_drv.c via
hv_setup_kexec_handler()) performs:
  - vmbus_initiate_unload(false): sends CHANNELMSG_UNLOAD to host
  - cpuhp_remove_state(): disables SynIC (SIMP, SIEFP, SINT) on all
    CPUs, ensuring the kexec'd kernel starts with clean SynIC state

Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d7..4176175060d3 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -15,10 +15,47 @@
 #include <linux/errno.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
+#include <linux/kexec.h>
 #include <asm/mshyperv.h>
+#include <asm/system_misc.h>
 
 static bool hyperv_initialized;
 
+/*
+ * Kexec/shutdown handler for ARM64 Hyper-V guests.
+ *
+ * On x86, hv_machine_shutdown() overrides machine_ops.shutdown and
+ * runs after device_shutdown() and cpu_hotplug_enable(). ARM64 uses
+ * the arm64_pre_smp_shutdown_hook to achieve the same ordering.
+ *
+ * hv_kexec_handler() (set by vmbus_drv.c) performs:
+ *   1. vmbus_initiate_unload(false) - sends CHANNELMSG_UNLOAD
+ *   2. cpuhp_remove_state(hyperv_cpuhp_online) - disables SynIC per CPU
+ *
+ * By running after device_shutdown(), PCI drivers (NVMe, MANA) can
+ * send PCI_DELETE_INTERRUPT_MESSAGE and clean up MMIO/interrupt
+ * mappings before VMBus channels are force-closed by UNLOAD.
+ */
+static void (*hv_kexec_handler)(void);
+
+static void hv_machine_shutdown(void)
+{
+	if (kexec_in_progress && hv_kexec_handler)
+		hv_kexec_handler();
+}
+
+void hv_setup_kexec_handler(void (*handler)(void))
+{
+	hv_kexec_handler = handler;
+	arm64_pre_smp_shutdown_hook = hv_machine_shutdown;
+}
+
+void hv_remove_kexec_handler(void)
+{
+	arm64_pre_smp_shutdown_hook = NULL;
+	hv_kexec_handler = NULL;
+}
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
-- 
2.43.0


