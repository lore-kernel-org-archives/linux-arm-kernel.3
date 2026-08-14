Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4E7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No/zDZeaE888y2RYsuLS6yyL8hMk8BBFN1bhFZYlYUI=; b=09yGPmOKlBysLkJl6UGAL9RLVY
	HLTKiZfUQpfc0hgJTPg/hUfdoLl/scD4TFQFR64t8LU9UffwugfjyP+jvLxv4wyViSOvIxJc6S0D7
	es7u9wKhGCH9EKzbjqAqtXNRHiUdlZERtVdjcCtEgGJW9yyBit+1gSCruR9EEkzF3NB8v4/un34Lz
	YMz0JNdWzvIvx5QQnJWnMNjFpHM250yah7sePatQrY8EQCQjCegOzgrGktkrlumSNnNpwJsByaFSZ
	KwhpAMnZnANqVRPShAeEGRHz5iwreV2HWUKlXd+KNhU3DiffnFPQ+IJ4szblvjD6++WCfVE7rFMzl
	RUYt7dyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoH2-00000002OGl-274G;
	Fri, 14 Aug 2026 09:32:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoGz-00000002OFu-3xmY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:32:23 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 57D5B20B7168; Fri, 14 Aug 2026 02:31:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 57D5B20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786699915;
	bh=No/zDZeaE888y2RYsuLS6yyL8hMk8BBFN1bhFZYlYUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jkd6+r2klqHCSVds0fZKKCNznzXD03Z4C3nryTpGmTGn7Nm6R3PyGKEF00J/rEvs5
	 Elig570zbLCGrSgpgVUV4TZgaJ25EAqJ4zBKbm1r4z9WTBp76ea/IP+afj8zXvf3tD
	 zOWistMRgmTAITANSHJYYcBXwD9CdEPhFoXdS8o4=
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
Subject: [RFC PATCH 1/2] arm64: Add pre-shutdown hook to machine_shutdown()
Date: Fri, 14 Aug 2026 02:31:50 -0700
Message-ID: <20260814093154.3191311-1-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
References: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_023222_008714_440F9328 
X-CRM114-Status: GOOD (  12.60  )
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

Add a function pointer hook (arm64_pre_smp_shutdown_hook) that is invoked
from machine_shutdown() before smp_shutdown_nonboot_cpus(). This allows
platform code (e.g., hypervisors) to perform cleanup that must happen
after device_shutdown() but before secondary CPUs go offline.

In the kexec path, the call sequence is:
  kernel_kexec()
    kernel_restart_prepare()
      device_shutdown()         // drivers shut down here
    migrate_to_reboot_cpu()
    cpu_hotplug_enable()
    machine_shutdown()
      arm64_pre_smp_shutdown_hook()  // new: platform cleanup
      smp_shutdown_nonboot_cpus()    // CPUs go offline

x86 achieves this via machine_ops.shutdown; ARM64 currently has no
equivalent mechanism. Rather than introducing the full machine_ops
structure, add a targeted hook for the shutdown path.

Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
---
 arch/arm64/include/asm/system_misc.h |  2 ++
 arch/arm64/kernel/process.c          | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
index d316a804eb38..7c37b9f33e96 100644
--- a/arch/arm64/include/asm/system_misc.h
+++ b/arch/arm64/include/asm/system_misc.h
@@ -28,6 +28,8 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
 struct mm_struct;
 extern void __show_regs(struct pt_regs *);
 
+extern void (*arm64_pre_smp_shutdown_hook)(void);
+
 #endif	/* __ASSEMBLER__ */
 
 #endif	/* __ASM_SYSTEM_MISC_H */
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..41c0e9840913 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -88,8 +88,21 @@ void __noreturn arch_cpu_idle_dead(void)
  * avoid any code or data used by any SW CPU pin loop. The CPU hotplug
  * functionality embodied in smpt_shutdown_nonboot_cpus() to achieve this.
  */
+
+/*
+ * Hook for platform code to perform cleanup after device_shutdown()
+ * but before secondary CPUs are offlined. This runs in the kexec path
+ * from kernel_kexec() after device_shutdown() and cpu_hotplug_enable()
+ * have been called, matching the point at which x86 invokes
+ * machine_ops.shutdown.
+ */
+void (*arm64_pre_smp_shutdown_hook)(void);
+
 void machine_shutdown(void)
 {
+	if (arm64_pre_smp_shutdown_hook)
+		arm64_pre_smp_shutdown_hook();
+
 	smp_shutdown_nonboot_cpus(reboot_cpu);
 }
 
-- 
2.43.0


