Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33061F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTqWYvmvHKg8OZXgeVTuyVjBmXzz6zHcOPAB0cTHcgg=; b=f/1gC5XV8DrPM/IxNmt1nQeNb0
	4J+7uR08zkbklnJ+84+8AFg20f2OFudZnDvoO8qDmVSvudJ9YQ1pn61ayXzKQsjGzEchm27Q9yscc
	q2+cyg2BwX+Btu+bPrSPdKU6+dHh8LIG/QnEMoznaLOZX/RwVJI8rt5625J2qE02tdStYzWLykKae
	WECAFY0VhHu3SA6btR6DhGYU/NR3JKtCTLwTH/3M+NCSbr0WLMRZV8Az77dFiVR6Uk/htSumQQanU
	3dqpzjNMdnb5tnh+ED7slbxwUjVwbbo0O3zESrZeMuIhu5HWssuzTK1ocj/qTfwbooL9AwA1+93Z4
	5urI1zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtS7-00000004b3j-02Zt;
	Sat, 18 Apr 2026 00:22:27 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtS4-00000004b2X-2at3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471744; x=1808007744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fTqWYvmvHKg8OZXgeVTuyVjBmXzz6zHcOPAB0cTHcgg=;
  b=a9Nd1n+2AXT5lhMg0/PH8OXwjGSxHwOcFJiRrX+EArbZ6L7wLxSwtkor
   V3VZEcTbvmCPkKpuRyE8BBtZ+KZ0icT/1q9y3vJokDDtxyt4Ru8BeWDs2
   fCeH4ZPqnDSBOAqV+sTg38ZMkhhjMEfb38QBgZYaCb9R60Nm4NZNdQfB6
   BnVDA2guHnax5NyZpMghVyn2FuGmA0y756LUBZPodqn1o+zrUuXjF1lQN
   XMIKzbFrLlxSFMyspXKF0exLDoUjpEvuCWC/++rR8+enkp9QW95DX4sqK
   sPZJhO92zp1vFCrn6DE5gT/jOsd6hqMTPZq3zMbJl5E2A2clparFB9tpP
   w==;
X-CSE-ConnectionGUID: nwiX+4hEQcmKSresJxCspg==
X-CSE-MsgGUID: 9m254sEbTmGYT3atTkrorg==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17586403"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:22:23 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:27347]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id e56849f5-5c48-4116-80ca-9d214ab04fc1; Sat, 18 Apr 2026 00:22:22 +0000 (UTC)
X-Farcaster-Flow-ID: e56849f5-5c48-4116-80ca-9d214ab04fc1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:22 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:22 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 07/19] crypto: dedicated ELF sections for collected crypto initcalls
Date: Sat, 18 Apr 2026 00:20:15 +0000
Message-ID: <20260418002032.2877-8-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172224_709206_179F635B 
X-CRM114-Status: GOOD (  19.98  )
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

Cryptographic components must be properly initialized
before use. This initialization is typically achieved
through dedicated init functions registered via wrappers
such as module_init() or late_initcall(). Traditionally,
these init functions are executed automatically as part of
the kernel boot sequence. However, now that the crypto code
is moved into a standalone module (fips140.ko), there needs
to be a way to collect and later execute them from within
the module.

To collect these init functions, the init wrappers
(module_init(), subsys_initcall(), late_initcall()) are
modified so that when compiled for the FIPS module (under
-DFIPS_MODULE), they automatically place the wrapped crypto
init function pointer into a dedicated ELF section instead
of the normal initcall mechanism. A custom linker script
crypto/fips140/fips140.lds is introduced to organize these
sections. Since the init functions must be called in proper
ordering in a later patch (e.g., subsys_initcall before
module_init, and module_init before late_initcall), the
linker script allocates separate leveled sections
(.fips_initcall0, .fips_initcall1, .fips_initcall2) with
corresponding boundary symbols (e.g.,
__fips140_initcall0_start/end) to preserve the correct
execution order.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                   |  2 +-
 crypto/fips140/fips140.lds | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/module.h     | 23 +++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 crypto/fips140/fips140.lds

diff --git a/Makefile b/Makefile
index feacb5bd6235a..f3c43f87d6786 100644
--- a/Makefile
+++ b/Makefile
@@ -1378,7 +1378,7 @@ crypto/fips140/.fips140.symvers: fips140-ready
 	@:
 modpost: crypto/fips140/.fips140.symvers
 quiet_cmd_ld_fips140 = LD [M]  $@
-      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none --whole-archive $< --no-whole-archive -o $@
+      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none -T $(srctree)/crypto/fips140/fips140.lds --whole-archive $< --no-whole-archive -o $@
 
 cmd_fips140_mod = ar -t $< > $@
 
diff --git a/crypto/fips140/fips140.lds b/crypto/fips140/fips140.lds
new file mode 100644
index 0000000000000..6b5c63b1c6028
--- /dev/null
+++ b/crypto/fips140/fips140.lds
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * FIPS 140 module initcall section layout.
+ *
+ * The overridden subsys_initcall/module_init/late_initcall macros
+ * (include/linux/module.h) place function pointers into these
+ * sections when compiled with FIPS_MODULE defined.
+ *
+ * Section mapping:
+ *   .fips_initcall0  <-  subsys_initcall()
+ *                        Syncs with kernel subsys_initcall (initcall level 4)
+ *   .fips_initcall1  <-  module_init()
+ *                        Syncs with kernel device_initcall (initcall level 6)
+ *   .fips_initcall2  <-  late_initcall()
+ *                        Syncs with kernel late_initcall (initcall level 7)
+ *
+ * The fips140 loader thread (fips140-loader.c) starts at
+ * arch_initcall_sync (level 3) and run_initcalls() in
+ * fips140-module.c executes each level in order, synchronizing
+ * with the kernel's initcall progression via wait queues.
+ */
+
+SECTIONS {
+	.init.data : {
+		__fips140_initcalls_start = .;
+		__fips140_initcall0_start = .;
+		*(.fips_initcall0)
+		__fips140_initcall0_end = .;
+		__fips140_initcall1_start = .;
+		*(.fips_initcall1)
+		__fips140_initcall1_end = .;
+		__fips140_initcall2_start = .;
+		*(.fips_initcall2)
+		__fips140_initcall2_end = .;
+		__fips140_initcalls_end = .;
+	}
+}
\ No newline at end of file
diff --git a/include/linux/module.h b/include/linux/module.h
index 0ff24c45ef61d..6a10b70b5e92c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -115,18 +115,40 @@ extern void cleanup_module(void);
 #define postcore_initcall(fn)		module_init(fn)
 #define postcore_initcall_sync(fn)	module_init(fn)
 #define arch_initcall(fn)		module_init(fn)
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+#define subsys_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall0") \
+		__fips_##fn = fn;
+#else
 #define subsys_initcall(fn)		module_init(fn)
+#endif
 #define subsys_initcall_sync(fn)	module_init(fn)
 #define fs_initcall(fn)			module_init(fn)
 #define fs_initcall_sync(fn)		module_init(fn)
 #define rootfs_initcall(fn)		module_init(fn)
 #define device_initcall(fn)		module_init(fn)
 #define device_initcall_sync(fn)	module_init(fn)
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+#define late_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall2") \
+		__fips_##fn = fn;
+#else
 #define late_initcall(fn)		module_init(fn)
+#endif
 #define late_initcall_sync(fn)		module_init(fn)
 
 #define console_initcall(fn)		module_init(fn)
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+/* FIPS module: place init/exit in special sections for fips140 loader */
+#define module_init(initfn) \
+	static initcall_t __used __section(".fips_initcall1") \
+		__fips_##initfn = initfn;
+
+#define module_exit(exitfn) \
+	static unsigned long __used __section(".fips_exitcall") \
+		__fips_##exitfn = (unsigned long)&exitfn;
+#else
 /* Each module must use one module_init(). */
 #define module_init(initfn)					\
 	static inline initcall_t __maybe_unused __inittest(void)		\
@@ -142,6 +164,7 @@ extern void cleanup_module(void);
 	void cleanup_module(void) __copy(exitfn)		\
 		__attribute__((alias(#exitfn)));		\
 	___ADDRESSABLE(cleanup_module, __exitdata);
+#endif /* CONFIG_CRYPTO_FIPS140_EXTMOD && FIPS_MODULE && !FIPS140_CORE */
 
 #endif
 
-- 
2.47.3


