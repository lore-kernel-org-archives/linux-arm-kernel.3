Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B6BF589B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgOk9CuNiMb2ueZsexw1395h43OXuM/ZLDHAurB/vUw=; b=S7hYeOp/3wcGHmJ6lQgCAweiL/
	6dgNAF5hul0KJPHsSdG6PM1v/+dKOcg8J4A7MMfRrUnsu3/y/OI6a9i/aYHhIZhfkCyrDBtejRdyX
	8owWif3JJZ8R4oZYAaA+aK5V/vCSj9mP++NcfITcZP2p/TOXnHy08f9gn4ERf6l4YGsWfYve44AMJ
	i4/qrK0FFKebCWOw2mecxuPGXVeEfBZpbjoiJF9WirULFgMn8Rdy68FCaPxnvKwe0yGYbmj8RB876
	7ZbL7ob3JnMn5SsUwU815vVOvGz+5tyI1/UKxuedzF6ntHfRHTYWegId8EEHZdKorJmtRYkkXjvPc
	olfIYENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOS-0000000Bdkw-3Yy3;
	Thu, 23 Apr 2026 12:42:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOI-0000000BdbE-3C2G;
	Thu, 23 Apr 2026 12:42:54 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6A37520B716E;
	Thu, 23 Apr 2026 05:42:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6A37520B716E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948165;
	bh=RgOk9CuNiMb2ueZsexw1395h43OXuM/ZLDHAurB/vUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XxtnKmAZkBsl1fo5vHmG1yFvwFiMsZTf0tpny7IxDVM9D9co5+6lVoSiRvy5ZEWXL
	 m/QTC0zSPOY++7G88l5sW5gq6ud3jQim6h/EFnC2Hp3qNkNFTjTwp2dqZtRDLlCAfk
	 FJuSJjmd4QdYK/ZdtpBJGsvpEESRR2oihG4xQh/I=
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
Subject: [PATCH v2 03/15] Drivers: hv: Move vmbus_handler to common code
Date: Thu, 23 Apr 2026 12:41:53 +0000
Message-ID: <20260423124206.2410879-4-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054246_858154_23827D9E 
X-CRM114-Status: GOOD (  14.94  )
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

Move the vmbus_handler global variable and hv_setup_vmbus_handler()/
hv_remove_vmbus_handler() from arch/x86 to drivers/hv/hv_common.c.

hv_setup_vmbus_handler() is called unconditionally in vmbus_bus_init()
and works for both x86 (sysvec handler) and arm64 (vmbus_percpu_isr).

This eliminates the need for separate percpu vmbus handler setup
functions and __weak stubs, that are needed for adding ARM64 support
in MSHV_VTL driver where we need to set a custom per-cpu vmbus handler.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/x86/kernel/cpu/mshyperv.c | 12 ------------
 drivers/hv/hv_common.c         |  9 +++++++--
 drivers/hv/vmbus_drv.c         | 17 +++++++++--------
 include/asm-generic/mshyperv.h |  1 +
 4 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 89a2eb8a0722..68706ff5880e 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -145,7 +145,6 @@ void hv_set_msr(unsigned int reg, u64 value)
 EXPORT_SYMBOL_GPL(hv_set_msr);
 
 static void (*mshv_handler)(void);
-static void (*vmbus_handler)(void);
 static void (*hv_stimer0_handler)(void);
 static void (*hv_kexec_handler)(void);
 static void (*hv_crash_handler)(struct pt_regs *regs);
@@ -172,17 +171,6 @@ void hv_setup_mshv_handler(void (*handler)(void))
 	mshv_handler = handler;
 }
 
-void hv_setup_vmbus_handler(void (*handler)(void))
-{
-	vmbus_handler = handler;
-}
-
-void hv_remove_vmbus_handler(void)
-{
-	/* We have no way to deallocate the interrupt gate */
-	vmbus_handler = NULL;
-}
-
 /*
  * Routines to do per-architecture handling of stimer0
  * interrupts when in Direct Mode
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index e8633bc51d56..eb7b0028b45d 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -758,13 +758,18 @@ bool __weak hv_isolation_type_tdx(void)
 }
 EXPORT_SYMBOL_GPL(hv_isolation_type_tdx);
 
-void __weak hv_setup_vmbus_handler(void (*handler)(void))
+void (*vmbus_handler)(void);
+EXPORT_SYMBOL_GPL(vmbus_handler);
+
+void hv_setup_vmbus_handler(void (*handler)(void))
 {
+	vmbus_handler = handler;
 }
 EXPORT_SYMBOL_GPL(hv_setup_vmbus_handler);
 
-void __weak hv_remove_vmbus_handler(void)
+void hv_remove_vmbus_handler(void)
 {
+	vmbus_handler = NULL;
 }
 EXPORT_SYMBOL_GPL(hv_remove_vmbus_handler);
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index bc4fc1951ae1..052ca8b11cee 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1415,7 +1415,8 @@ EXPORT_SYMBOL_FOR_MODULES(vmbus_isr, "mshv_vtl");
 
 static irqreturn_t vmbus_percpu_isr(int irq, void *dev_id)
 {
-	vmbus_isr();
+	if (vmbus_handler)
+		vmbus_handler();
 	return IRQ_HANDLED;
 }
 
@@ -1517,8 +1518,10 @@ static int vmbus_bus_init(void)
 		vmbus_irq_initialized = true;
 	}
 
+	hv_setup_vmbus_handler(vmbus_isr);
+
 	if (vmbus_irq == -1) {
-		hv_setup_vmbus_handler(vmbus_isr);
+		/* x86: sysvec handler uses vmbus_handler directly */
 	} else {
 		ret = request_percpu_irq(vmbus_irq, vmbus_percpu_isr,
 				"Hyper-V VMbus", &vmbus_evt);
@@ -1553,9 +1556,8 @@ static int vmbus_bus_init(void)
 	return 0;
 
 err_connect:
-	if (vmbus_irq == -1)
-		hv_remove_vmbus_handler();
-	else
+	hv_remove_vmbus_handler();
+	if (vmbus_irq != -1)
 		free_percpu_irq(vmbus_irq, &vmbus_evt);
 err_setup:
 	if (IS_ENABLED(CONFIG_PREEMPT_RT) && vmbus_irq_initialized) {
@@ -3026,9 +3028,8 @@ static void __exit vmbus_exit(void)
 	vmbus_connection.conn_state = DISCONNECTED;
 	hv_stimer_global_cleanup();
 	vmbus_disconnect();
-	if (vmbus_irq == -1)
-		hv_remove_vmbus_handler();
-	else
+	hv_remove_vmbus_handler();
+	if (vmbus_irq != -1)
 		free_percpu_irq(vmbus_irq, &vmbus_evt);
 	if (IS_ENABLED(CONFIG_PREEMPT_RT) && vmbus_irq_initialized) {
 		smpboot_unregister_percpu_thread(&vmbus_irq_threads);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 2810aa05dc73..db183c8cfb95 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -179,6 +179,7 @@ static inline u64 hv_generate_guest_id(u64 kernel_version)
 
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info);
 
+extern void (*vmbus_handler)(void);
 void hv_setup_vmbus_handler(void (*handler)(void));
 void hv_remove_vmbus_handler(void);
 void hv_setup_stimer0_handler(void (*handler)(void));
-- 
2.43.0


