Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE00EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8sQBfTO8DEdAfK+iLEVvvM8f2iA6e8n+273DKpur94=; b=Rn4KgUDYEE8+8F0i7PwJyUDRGE
	mG0n98KO4pUdhTWhmEqfzV91qgHhSF8SibJe8pC6pYAcTVIKScsikawHuJVJ2wwE6Rr3kHzZEULYd
	ILySfRir3iad360U0HvnF6XgwHH3zVZuueYUb2OPFKBsEGN7C2+DaJqRBqBJfXGdQ/3FlZNhfMcmi
	XL52bOodcVvKw/kyCChLaeEeZPtyleQmx7QG7Na8Xh4cZQTS3sSuSY1rVYrgcG8T5a++YpUQi8Xfh
	ZPcqOL0eWjbYBO4BddrQKRl3Q6lwBmhKX5r8xD0BVFjewQ4lb3Az+5kOgle9Pd75uhqqXnh4iBtEC
	3Kvti3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMi5-00000001LQ5-0e7G;
	Thu, 12 Feb 2026 02:45:41 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMi2-00000001LOW-1diq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864338; x=1802400338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+8sQBfTO8DEdAfK+iLEVvvM8f2iA6e8n+273DKpur94=;
  b=H0gq1He/th85zghpw0W0e0hzY/8TiBfC2ahHY0T2KZ+SBxPM28NSs5zB
   zrNLzqZyLtKD10U1wDL0jMA0x2flHdjJWaiGv0p//u5Q9u9RIot6lMVUK
   iFG/1ngGz4AGwVgANJGp1IjCAwQ1X8OsZngzdRF/+Fzb82xsGh1If7IW6
   lABocfXzjgmv66ULYsP0bMNtMJ5wzgm5tFt6NDkKniyLwcu9wJvBDZOxr
   /8/beQHXTJIqjK1N1ef5GaMXJn/MMXjkbRQMDv3GRe5qv9ePESHAqEHTd
   F3YzgxShYXWy0DRew9Vx8EJ6lEaCJnoTPQewfwVxekVys38eTyOKkR0sA
   g==;
X-CSE-ConnectionGUID: x6vqso+ASkaQblCT4JBAMQ==
X-CSE-MsgGUID: O3MGKhbORhW5VJRucVWKHw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12912815"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:35 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:14427]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 4ddb9a8f-0eac-49c3-8f98-09c5ecdbf1fa; Thu, 12 Feb 2026 02:45:35 +0000 (UTC)
X-Farcaster-Flow-ID: 4ddb9a8f-0eac-49c3-8f98-09c5ecdbf1fa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:34 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 12/17] Execute crypto initcalls during module initialization
Date: Thu, 12 Feb 2026 02:42:16 +0000
Message-ID: <20260212024228.6267-13-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184538_478731_7BFA0DE3 
X-CRM114-Status: GOOD (  23.40  )
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

After moving builtin cryptos into the standalone crypto module, to ensure
all such cryptos are properly initialized as they were builtin, the
initcalls of the cryptos should be executed at proper booting time.

To do so, this patch adds run_initcalls() function to execute the
initialization calls of the collected cryptos right after the module is
loaded. The function iterates through initcalls in the __fips_initcalls
section (which stores all function addresses of the collected crypto
initcalls) and executes them.

A key consideration is to ensure the crypto initcalls are executed in
proper order, for instance, some crypto initcalls are ought to execute
at `late_initcall` boot time level while some should be executed at
`module_init` boot time level. To do so, this patch enables coordination
between kernel and the crypto module initialization to preserve proper
execution order by hijacking the kernel initialization function
`do_initcall_level` with added synchronization helpers.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-loader.c | 92 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.c | 50 ++++++++++++++++++
 crypto/fips140/fips140-module.h | 12 +++++
 include/linux/init.h            | 10 ++++
 init/main.c                     |  4 ++
 5 files changed, 168 insertions(+)

diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 826075928723..d9a477421063 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -107,3 +107,95 @@ static int __init fips_loader_init(void)
 	vfree(vmalloc_mem); // Free after successful module loading
 	return ret;
 }
+
+/* FIPS140 synchronization between kernel and module
+ *
+ * Synchronization levels map kernel initcall levels to FIPS module levels:
+ * - Level 0: subsys_initcall (kernel init level 4) - Basic subsystem initialization
+ * - Level 1: device_initcall (kernel init level 6) - Device driver initialization  
+ * - Level 2: late_initcall (kernel init level 7) - Late system initialization
+ *
+ * The kernel marks each level complete and waits for the FIPS module to
+ * complete the corresponding level before proceeding to ensure proper
+ * initialization ordering between kernel crypto and FIPS module.
+ */
+atomic_t fips140_kernel_level_complete = ATOMIC_INIT(0);
+atomic_t fips140_module_level_complete = ATOMIC_INIT(0);
+
+/* Wait queues for efficient synchronization */
+DECLARE_WAIT_QUEUE_HEAD(fips140_kernel_wq);
+DECLARE_WAIT_QUEUE_HEAD(fips140_module_wq);
+
+void fips140_mark_kernel_level_complete(int level)
+{
+	atomic_or(1 << level, &fips140_kernel_level_complete);
+	wake_up(&fips140_kernel_wq);
+}
+
+bool fips140_is_kernel_level_complete(int level)
+{
+	return atomic_read(&fips140_kernel_level_complete) & (1 << level);
+}
+
+bool fips140_is_module_level_complete(int level)
+{
+	return atomic_read(&fips140_module_level_complete) & (1 << level);
+}
+
+void fips140_mark_module_level_complete(int level)
+{
+	atomic_or(1 << level, &fips140_module_level_complete);
+	wake_up(&fips140_module_wq);
+}
+
+static int __init fips140_sync_thread(void *data)
+{
+	pr_info("FIPS 140: starting sync thread\n");
+	
+	/* Call FIPS loader explicitly */
+	int ret = fips_loader_init();
+	if (ret)
+		panic("FIPS 140: loader initialization failed: %d\n", ret);
+	
+	pr_info("FIPS 140: sync thread finished\n");
+	return 0;
+}
+
+void __init start_fips140_loader(void)
+{
+	struct task_struct *task;
+	
+	task = kthread_run(fips140_sync_thread, NULL, "fips140_sync");
+	if (IS_ERR(task)) {
+		panic("FIPS 140: failed to create sync thread\n");
+	}
+}
+
+void __init wait_until_fips140_level_sync(int level)
+{
+	/* Map kernel initcall levels to FIPS module levels */
+	int fips_level = -1;
+	if (level == 3) /* Start FIPS loader thread at arch_initcall_sync level */
+		start_fips140_loader(); 
+	if (level == 4) /* subsys_initcall */
+		fips_level = 0;
+	else if (level == 6) /* device_initcall */
+		fips_level = 1;
+	else if (level == 7) /* late_initcall */
+		fips_level = 2;
+
+	if (fips_level >= 0) {
+		/* Mark kernel level complete and wait for module level completion */
+		fips140_mark_kernel_level_complete(fips_level);
+		wait_event(fips140_module_wq, fips140_is_module_level_complete(fips_level));
+	}
+}
+
+EXPORT_SYMBOL(fips140_kernel_level_complete);
+EXPORT_SYMBOL(fips140_module_level_complete);
+EXPORT_SYMBOL(fips140_kernel_wq);
+EXPORT_SYMBOL(fips140_module_wq);
+EXPORT_SYMBOL(fips140_mark_kernel_level_complete);
+EXPORT_SYMBOL(fips140_is_kernel_level_complete);
+EXPORT_SYMBOL(fips140_is_module_level_complete);
+EXPORT_SYMBOL(fips140_mark_module_level_complete);
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index a942de8780ef..e0e669ba1b5e 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,9 +16,59 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static int __init run_initcalls(void)
+{
+	typedef int (*initcall_t)(void);
+	
+	extern initcall_t __fips140_initcall0_start[], __fips140_initcall0_end[];
+	extern initcall_t __fips140_initcall1_start[], __fips140_initcall1_end[];
+	extern initcall_t __fips140_initcall2_start[], __fips140_initcall2_end[];
+
+	initcall_t *starts[] = {
+		__fips140_initcall0_start,
+		__fips140_initcall1_start,
+		__fips140_initcall2_start,
+	};
+	
+	initcall_t *ends[] = {
+		__fips140_initcall0_end,
+		__fips140_initcall1_end,
+		__fips140_initcall2_end,
+	};
+
+	pr_info("FIPS 140: run_initcalls starting\n");
+
+	for (int level = 0; level < ARRAY_SIZE(starts); level++) {
+		
+		/* Run FIPS initcalls for this level */
+		for (initcall_t *initcall = starts[level]; initcall < ends[level]; ++initcall) {
+			int ret;
+			initcall_t fn = *initcall;
+			
+			ret = fn();
+			if (!ret || ret == -ENODEV)
+				continue;
+
+			pr_err("FIPS 140: initcall %pS failed: %d\n", fn, ret);
+		}
+	
+		if (level < 2)
+			fips140_mark_module_level_complete(level);
+		/* Wait for kernel to complete this level */
+		wait_event(fips140_kernel_wq, fips140_is_kernel_level_complete(level));
+	}
+
+	pr_info("FIPS 140: run_initcalls finished\n");
+	return 0;
+}
+
 /* Initialize the FIPS 140 module */
 static int __init fips140_init(void)
 {
+    pr_info("loading " FIPS140_MODULE_NAME "\n");
+
+	run_initcalls();
+	fips140_mark_module_level_complete(2);
     return 0;
 }
 
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index ed2b6e17969f..e95dac8eeda9 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -10,5 +10,17 @@
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
 #include <linux/init.h>
+#include <linux/atomic.h>
+#include <linux/wait.h>
+
+/* FIPS140 synchronization between kernel and module */
+extern atomic_t fips140_kernel_level_complete;
+extern atomic_t fips140_module_level_complete;
+extern wait_queue_head_t fips140_kernel_wq;
+
+void fips140_mark_kernel_level_complete(int level);
+bool fips140_is_kernel_level_complete(int level);
+bool fips140_is_module_level_complete(int level);
+void fips140_mark_module_level_complete(int level);
 
 #endif /* _CRYPTO_FIPS140_MODULE_H */
diff --git a/include/linux/init.h b/include/linux/init.h
index 40331923b9f4..eefbdfac1d41 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -392,4 +392,14 @@ void __init parse_early_options(char *cmdline);
 #define __exit_p(x) NULL
 #endif
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(__ASSEMBLY__)
+/* FIPS140 synchronization between kernel and module */
+void fips140_mark_kernel_level_complete(int level);
+bool fips140_is_kernel_level_complete(int level);
+bool fips140_is_module_level_complete(int level);
+void fips140_mark_module_level_complete(int level);
+void start_fips140_loader(void);
+void wait_until_fips140_level_sync(int level);
+#endif /* CONFIG_CRYPTO_FIPS140_EXTMOD && !__ASSEMBLY__ */
+
 #endif /* _LINUX_INIT_H */
diff --git a/init/main.c b/init/main.c
index b84818ad9685..0324226fe7b9 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1438,6 +1438,10 @@ static void __init do_initcall_level(int level, char *command_line)
 	do_trace_initcall_level(initcall_level_names[level]);
 	for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
 		do_one_initcall(initcall_from_entry(fn));
+
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	wait_until_fips140_level_sync(level);
+#endif
 }
 
 static void __init do_initcalls(void)
-- 
2.47.3


