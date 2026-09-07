Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C01C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPDjSH5slQBe25Ysoz1GVKAw6+2usSTYsfQlxDFui6M=; b=inFAAz38csxSeZottu340EfiBV
	D3Uus3p6+EcrDa/ORiIQJ4PZRmtpZzBCP4aBXT1vs3YaQ408mB4Di+GemP5SChOZyYx1JC1W4QlIU
	df0wTs4jts2gaIS+kfbfc+U0cc7ew8C0O4QXg9Iog4RelItb9jD+RPejW8MYbsUbl1p8fPQhZaSh7
	xMWWge/LVTLTcQvT3eUoIcG6WXFMZGVAc7pZllpTPMjAzw476jG4aqhT1XmfDUN4aSPxqetTCyvJj
	dM0l7yVDlZd3iGAdZfi/Dw6qO6q9D2PaaT1GQbxhryigbnnbkXR1SQVf5apO5GSsdgxbGg3XQXvyo
	hMFr+LgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VcU-00000006MLB-1GiV;
	Mon, 07 Sep 2026 09:26:30 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VcS-00000006MKd-1epL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:26:29 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 55CB020B710C; Mon,  7 Sep 2026 02:25:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 55CB020B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1788773145;
	bh=tPDjSH5slQBe25Ysoz1GVKAw6+2usSTYsfQlxDFui6M=;
	h=From:To:Cc:Subject:Date:From;
	b=YgXtba/Bwm+UQF9r8NTrP0nYfIB6Uy8Z9/c0Lwo1xLApYad248+m+UAV6k9Awtyox
	 krEYZxoEoRFE/LjfefdduzF+S/fslhTgIEuDaObFZfgQeRrTWB40xxNpTGq8UGtbbd
	 EF0cLv1y8Cbqjfp9zikTv7iEfSE+OJfn1Txoysiw=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Kelley <mikelley@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	namjain@linux.microsoft.com
Subject: [PATCH v2] arm64: hyperv: run VMBus kexec handler via syscore shutdown
Date: Mon,  7 Sep 2026 02:25:42 -0700
Message-ID: <20260907092544.230338-1-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_022628_466745_0BA5BFE1 
X-CRM114-Status: GOOD (  14.01  )
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

On ARM64, machine_shutdown() does not provide a platform hook between
device_shutdown() and smp_shutdown_nonboot_cpus(), unlike x86's
machine_ops.shutdown. This prevents the Hyper-V VMBus kexec handler
from running at the correct point during kexec shutdown, causing
kexec reboot to fail on ARM64 Hyper-V guests.

Use syscore_ops.shutdown instead: syscore_shutdown() runs in the same
window (after device_shutdown(), before CPUs are taken offline) where
VMBus UNLOAD and cpuhp_remove_state() must execute.

Provide ARM64-specific overrides of hv_setup_kexec_handler() and
hv_remove_kexec_handler() that register/unregister a syscore_ops
shutdown callback, replacing the __weak no-op stubs in hv_common.c.
On x86, the existing machine_ops.shutdown mechanism is unchanged.

Fixes: 9d7cf2c96758 ("Drivers: hv: Add arch independent default functions for some Hyper-V handlers")
Link: https://lore.kernel.org/all/20260814093133.3191250-1-shradhagupta@linux.microsoft.com/
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
Reviewed-by: Naman Jain <namjain@linux.microsoft.com>
---
 Changes in V2
 * Use syscore_ops.shutdown instead of a bare function pointer hook in
   machine_shutdown(), per Catalin's suggestion.
---
 arch/arm64/hyperv/mshyperv.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d7..e608e546a395 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -15,10 +15,50 @@
 #include <linux/errno.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
+#include <linux/kexec.h>
+#include <linux/syscore_ops.h>
 #include <asm/mshyperv.h>
 
 static bool hyperv_initialized;
 
+/*
+ * Kexec handler registered by VMBus.
+ *
+ * On ARM64, machine_shutdown() does not provide a platform hook between
+ * device_shutdown() and smp_shutdown_nonboot_cpus(), unlike the
+ * machine_ops.shutdown mechanism used on x86.  Use a syscore_ops shutdown
+ * callback instead: syscore_shutdown() runs after device_shutdown() and
+ * before CPUs are taken offline, which is the same window VMBus needs to
+ * run its UNLOAD message and cpuhp_remove_state() during kexec.
+ */
+static void (*hv_kexec_handler_fn)(void);
+
+static void hv_kexec_syscore_shutdown(void *data)
+{
+	if (kexec_in_progress && hv_kexec_handler_fn)
+		hv_kexec_handler_fn();
+}
+
+static const struct syscore_ops hv_kexec_syscore_ops = {
+	.shutdown	= hv_kexec_syscore_shutdown,
+};
+
+static struct syscore hv_kexec_syscore = {
+	.ops		= &hv_kexec_syscore_ops,
+};
+
+void hv_setup_kexec_handler(void (*handler)(void))
+{
+	hv_kexec_handler_fn = handler;
+	register_syscore(&hv_kexec_syscore);
+}
+
+void hv_remove_kexec_handler(void)
+{
+	unregister_syscore(&hv_kexec_syscore);
+	hv_kexec_handler_fn = NULL;
+}
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
-- 
2.43.0


