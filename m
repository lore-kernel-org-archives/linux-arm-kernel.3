Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9E9F99C6D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwLjOoBEvxZWjkTapmkk3ylr04NGU4C4pEwCV1l862w=; b=os4UBAdirZkO13YhZb96ntpycE
	2xSmj0VCGAPcVpfM0etz+hrY/oDZE/Iu9GiuK9on7eCN6nVyaAOZDlFeexVv55sAewUV606V4yMpP
	Bc3hH/UtYZC0JE0H2rC04VAia+UyEHUQScDgPpcQo3+JHHACFSEaAtrwyhE8sFCrya0+/TAxdEU/Y
	7xDtaeogoTBWITGSg95OTWJdarHQPvZD7IxEbgB/3UqBdDoT4LoTHX41OqkNN6O3QHk6OtbekSPFI
	q5AubJ2tvhrz51yJgVAOTvUcoqblgrd9p0yEaGl20nCo52ulWlNMcKUQ3aU3B9BFnprFiQBGImfOz
	rJ1wYZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtRg-00000004api-1gbX;
	Sat, 18 Apr 2026 00:22:00 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtRc-00000004anX-34oD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471716; x=1808007716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qwLjOoBEvxZWjkTapmkk3ylr04NGU4C4pEwCV1l862w=;
  b=dZoW8o48Tlckmxy3ZCx9V/jGUxFnOme170WJCnWtSDd32uxpwUWgdLDR
   1800IIU3N/zG6pff0vDnCyr16u1BrYxLjvS9kv3gbEHbJO6+JAVUw5AxE
   ST5++9Ikn/xrGDuc3o0oKprFGZfVgOQeIBkWMSmq0/8Cr62vVyL/cVOe7
   J6YLCmgJ8wq6yZaxGoIRrw2MRG6SNQFwUPY5tozONnVw0GWw1f00fz5fR
   hivUZRBA7uakg273VIgGVqsJikrXm+JtrVHkb9oWW7mkcDADGjfsyTy8K
   IijxsHa8L2eRxqxN8TFBB1GqHmllSLMy1swCAMXgJY96Hd58LusGp5Nv/
   Q==;
X-CSE-ConnectionGUID: RPsEGr9kRiynAijjgakTYA==
X-CSE-MsgGUID: gKp5Y1NpTA6LaYz5FtrMGg==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17478620"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:54 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:27479]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.9.233:2525] with esmtp (Farcaster)
 id a091f604-8a8d-4872-a8ce-435bcb206830; Sat, 18 Apr 2026 00:21:54 +0000 (UTC)
X-Farcaster-Flow-ID: a091f604-8a8d-4872-a8ce-435bcb206830
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:51 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:50 +0000
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
Subject: [PATCH v2 05/19] module: allow kernel module loading directly from memory
Date: Sat, 18 Apr 2026 00:20:13 +0000
Message-ID: <20260418002032.2877-6-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172156_821917_069E3EEB 
X-CRM114-Status: GOOD (  27.73  )
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

From: Vegard Nossum <vegard.nossum@oracle.com>

To enable loading the crypto module earlier before file system is ready,
add a new helper function, load_crypto_module_mem(), which can load a kernel
module from a byte array in memory. When loading in this way, we don't
do signature verification as crypto is not ready yet before loaded.
To tell that a module is loaded in this way, a new module loader flag,
MODULE_INIT_CRYPTO_FROM_MEM, is added.

Co-developed-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[With code change and revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 include/linux/module.h      |   2 +
 include/uapi/linux/module.h |   5 ++
 kernel/module/main.c        | 100 +++++++++++++++++++++++++-----------
 kernel/params.c             |   3 +-
 4 files changed, 79 insertions(+), 31 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 7566815fabbe8..0ff24c45ef61d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -588,6 +588,8 @@ struct module {
 
 #ifdef CONFIG_MODULES
 
+extern int load_crypto_module_mem(const char *mem, size_t size);
+
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
 void *__symbol_get_gpl(const char *symbol);
diff --git a/include/uapi/linux/module.h b/include/uapi/linux/module.h
index 03a33ffffcba8..6941497350893 100644
--- a/include/uapi/linux/module.h
+++ b/include/uapi/linux/module.h
@@ -7,4 +7,9 @@
 #define MODULE_INIT_IGNORE_VERMAGIC	2
 #define MODULE_INIT_COMPRESSED_FILE	4
 
+#ifdef __KERNEL__
+/* Internal flags */
+#define MODULE_INIT_CRYPTO_FROM_MEM		(1 << 8)
+#endif
+
 #endif /* _UAPI_LINUX_MODULE_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a6058..a8358088b010e 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2632,11 +2632,14 @@ static void module_augment_kernel_taints(struct module *mod, struct load_info *i
 
 static int check_modinfo(struct module *mod, struct load_info *info, int flags)
 {
-	const char *modmagic = get_modinfo(info, "vermagic");
+	const char *modmagic = NULL;
 	int err;
 
-	if (flags & MODULE_INIT_IGNORE_VERMAGIC)
-		modmagic = NULL;
+	if (flags & MODULE_INIT_CRYPTO_FROM_MEM)
+		return 0;
+
+	if (!(flags & MODULE_INIT_IGNORE_VERMAGIC))
+		modmagic = get_modinfo(info, "vermagic");
 
 	/* This is allowed: modprobe --force will invalidate it. */
 	if (!modmagic) {
@@ -3074,7 +3077,7 @@ module_param(async_probe, bool, 0644);
  * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  * helper command 'lx-symbols'.
  */
-static noinline int do_init_module(struct module *mod)
+static noinline int do_init_module(struct module *mod, int flags)
 {
 	int ret = 0;
 	struct mod_initfree *freeinit;
@@ -3141,8 +3144,10 @@ static noinline int do_init_module(struct module *mod)
 	ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
 			mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
 	mutex_lock(&module_mutex);
-	/* Drop initial reference. */
-	module_put(mod);
+	/* Drop initial reference for normal modules to allow unloading.
+	 * Keep reference for MODULE_INIT_CRYPTO_FROM_MEM modules to prevent unloading. */
+	if (!(flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		module_put(mod);  
 	trim_init_extable(mod);
 #ifdef CONFIG_KALLSYMS
 	/* Switch to core kallsyms now init is done: kallsyms may be walking! */
@@ -3418,31 +3423,17 @@ static int early_mod_check(struct load_info *info, int flags)
 /*
  * Allocate and load the module: note that size of section 0 is always
  * zero, and we rely on this for optional sections.
+ *
+ * NOTE: module signature verification must have been done already.
  */
-static int load_module(struct load_info *info, const char __user *uargs,
-		       int flags)
+static int _load_module(struct load_info *info, const char __user *uargs,
+			int flags)
 {
 	struct module *mod;
 	bool module_allocated = false;
 	long err = 0;
 	char *after_dashes;
 
-	/*
-	 * Do the signature check (if any) first. All that
-	 * the signature check needs is info->len, it does
-	 * not need any of the section info. That can be
-	 * set up later. This will minimize the chances
-	 * of a corrupt module causing problems before
-	 * we even get to the signature check.
-	 *
-	 * The check will also adjust info->len by stripping
-	 * off the sig length at the end of the module, making
-	 * checks against info->len more correct.
-	 */
-	err = module_sig_check(info, flags);
-	if (err)
-		goto free_copy;
-
 	/*
 	 * Do basic sanity checks against the ELF header and
 	 * sections. Cache useful sections and set the
@@ -3476,7 +3467,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	 * We are tainting your kernel if your module gets into
 	 * the modules linked list somehow.
 	 */
-	module_augment_kernel_taints(mod, info);
+	if (!(flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		module_augment_kernel_taints(mod, info);
 
 	/* To avoid stressing percpu allocator, do this once we're unique. */
 	err = percpu_modalloc(mod, info);
@@ -3523,7 +3515,11 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	flush_module_icache(mod);
 
 	/* Now copy in args */
-	mod->args = strndup_user(uargs, ~0UL >> 1);
+	if ((flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		mod->args = kstrdup("", GFP_KERNEL);
+	else
+		mod->args = strndup_user(uargs, ~0UL >> 1);
+
 	if (IS_ERR(mod->args)) {
 		err = PTR_ERR(mod->args);
 		goto free_arch_cleanup;
@@ -3571,13 +3567,10 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	if (codetag_load_module(mod))
 		goto sysfs_cleanup;
 
-	/* Get rid of temporary copy. */
-	free_copy(info, flags);
-
 	/* Done! */
 	trace_module_load(mod);
 
-	return do_init_module(mod);
+	return do_init_module(mod, flags);
 
  sysfs_cleanup:
 	mod_sysfs_teardown(mod);
@@ -3627,7 +3620,54 @@ static int load_module(struct load_info *info, const char __user *uargs,
 		audit_log_kern_module(info->name ? info->name : "?");
 		mod_stat_bump_becoming(info, flags);
 	}
+	return err;
+}
+
+/*
+ * Load crypto module from kernel memory without signature check.
+ */
+int load_crypto_module_mem(const char *mem, size_t size)
+{
+	int err;
+	struct load_info info = { };
+
+	if (!mem) {
+		pr_err("load_crypto_module_mem: mem parameter is NULL\n");
+		return -EINVAL;
+	}
+
+	info.sig_ok = true;
+	info.hdr = (Elf_Ehdr *) mem;
+	info.len = size;
+
+	err = _load_module(&info, NULL, MODULE_INIT_CRYPTO_FROM_MEM);
+	return err;
+}
+
+static int load_module(struct load_info *info, const char __user *uargs,
+		       int flags)
+{
+	int err;
+
+	/*
+	 * Do the signature check (if any) first. All that
+	 * the signature check needs is info->len, it does
+	 * not need any of the section info. That can be
+	 * set up later. This will minimize the chances
+	 * of a corrupt module causing problems before
+	 * we even get to the signature check.
+	 *
+	 * The check will also adjust info->len by stripping
+	 * off the sig length at the end of the module, making
+	 * checks against info->len more correct.
+	 */
+	err = module_sig_check(info, flags);
+	if (!err)
+		err = _load_module(info, uargs, flags);
+
+	/* Get rid of temporary copy. */
 	free_copy(info, flags);
+
 	return err;
 }
 
diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc25217..1fcf1b00082c3 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -957,7 +957,8 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+/* Use arch_initcall instead of subsys_initcall for early module loading */
+arch_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter
-- 
2.47.3


