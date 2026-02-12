Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E29EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03t1at+3Nf87Qdcv9MODlTGw0Kd2uEXxTVkBRgYefsU=; b=iyVujHKPBpTG3jOJvkxeISI2h9
	x80UwCiAFdzmPH/tcTprwuWjdv2PsTMFxXSH6pmyx9xn0ZLPy614QFfVsar//3mnCbL453/F4ZBv9
	gZ92zAkwr3DvS4taj4JcT4wRMl99/sy+1v/A6yiYnKK4sklIG0vVqI7WUKSu2ywBh/OCxjS/p4qsY
	Iyb4cr7tuThL2qiZLtDF1Qw70bUg5r8fozI05yU1R8KpULTD/wFA9YpEdaA+zVsYheYVCz+MAlcSW
	kZfwsy0XMpVHZ6jhSjkh6TvebKFmv/XapGlybA7uZ/qNqAowf3qxaCQWw0HscXhLZlTllLU3hKaFT
	Pyjyb5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMhZ-00000001LCs-2zfJ;
	Thu, 12 Feb 2026 02:45:09 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMhX-00000001LBP-1h7A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864307; x=1802400307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=03t1at+3Nf87Qdcv9MODlTGw0Kd2uEXxTVkBRgYefsU=;
  b=lQojfyUso0G21IwtLiVHucaI+WJmwVI1oY8+iQA0ado2+BdZWwdk27vO
   gnXmBTDRiLOYyA+rctuzr5t53n+josz4UP1XYw4+Q8cZkYhOz3sNwGs+E
   A/5R+Ys1MyOjONQ3nVcMBVnju9AfS6azt6jN7c5mClQsFtwOHrkRBysPB
   K1UKX5QamI+0KZDqdS5y1ZKIUvXVlqnobM96Bw/+AasxLhJjwyvur1cdR
   BDPe2p359NHw4FoYE39cxJZGgpMIolreMP215PZPuRdjwNnl79xuam/AJ
   aejL9xy68dxTNsLDenpiqk+Q36oNIyXOd9EMFimQBFPPg1n6kpBxO5V+j
   Q==;
X-CSE-ConnectionGUID: fIX52Ux1QMKiUOGDbFAzzw==
X-CSE-MsgGUID: JVB4uuanSFigl/IpAjRUqA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12793220"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:06 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:22850]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 953a58b7-7c51-4d0b-9d9b-81077bf02aa6; Thu, 12 Feb 2026 02:45:06 +0000 (UTC)
X-Farcaster-Flow-ID: 953a58b7-7c51-4d0b-9d9b-81077bf02aa6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:03 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:03 +0000
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
Subject: [PATCH 10/17] build: add CONFIG_DEBUG_INFO_BTF_MODULES support for the standalone crypto kernel module
Date: Thu, 12 Feb 2026 02:42:14 +0000
Message-ID: <20260212024228.6267-11-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB004.ant.amazon.com (10.13.139.164) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184507_500038_83B33B3F 
X-CRM114-Status: GOOD (  22.90  )
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

When CONFIG_DEBUG_INFO_BTF_MODULES=y, there are two problems for the
standalone crypto kernel module.

First, it requires a make dependency `.ko: vmlinux` because it takes
vmlinux as input to generate BTF info for the module, and inserts such
info into the `.ko` module binary as a dedicated ELF section. This can
cause an unwanted circular make rule dependency `fips140.ko:vmlinux`
because fips140.ko is already embedded into vmlinux.

To address this issue, we reuse the same script to explicitly generate
fips140.ko's BTF info in the vmlinux generation process to avoid the
circular make dependency. We link vmlinux first, then use it to generate
fips140.ko's BTF info, and then embed the fips140.ko and its BTF info
back with vmlinux by re-linking. Since the fips140.ko's BTF info is
embedded as data only into vmlinux, the BTF info generated using the
first linked vmlinux will be the same as if using the latest vmlinux.

Second, CONFIG_DEBUG_INFO_BTF_MODULES=y will insert BTF info into
fips140.ko binary, which means the previously generated module signature
on "fips140.ko" binary becomes invalid, thus needing regeneration.

To avoid this issue, we don't re-insert module's BTF info into
fips140.ko binary (as normally done), but keep such info as a separate
file, and embed into vmlinux as separate ELF section. By doing this,
the fips140.ko binary remains unchanged while its latest up-to-date BTF
info is available to kernel.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/kernel/vmlinux.lds.S |  8 ++++++++
 arch/x86/kernel/vmlinux.lds.S   |  8 ++++++++
 crypto/fips140/Makefile         |  2 +-
 crypto/fips140/fips140-loader.c | 19 +++++++++++++++++++
 kernel/bpf/btf.c                | 20 ++++++++++++++++++++
 kernel/module/main.c            | 27 +++++++++++++++++++++++++++
 scripts/Makefile.vmlinux        | 28 ++++++++++++++++++++++++++++
 scripts/link-vmlinux.sh         |  3 +++
 8 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 8de7dba3ac12..41223fa3f14e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -214,6 +214,14 @@ SECTIONS
 		KEEP(*(.fips140_digest))
 		_binary_fips140_hmac_end = .;
 	}
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	.fips140_btf : {
+		. = ALIGN(8);
+		__start_fips140_btf = .;
+		KEEP(*(.fips140_btf))
+		__stop_fips140_btf = .;
+	}
+#endif
 #endif
 
 	HYPERVISOR_RODATA_SECTIONS
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 25fdea6b9f27..e07c1b5c52cf 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -185,6 +185,14 @@ SECTIONS
 		KEEP(*(.fips140_digest))
 		_binary_fips140_hmac_end = .;
 	}
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	.fips140_btf : AT(ADDR(.fips140_btf) - LOAD_OFFSET) {
+		. = ALIGN(8);
+		__start_fips140_btf = .;
+		KEEP(*(.fips140_btf))
+		__stop_fips140_btf = .;
+	}
+#endif
 #endif
 
 	/* Data */
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index 8f9d3c06ac98..ac8ae42eb0fa 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -15,4 +15,4 @@ $(obj)/fips140-api-fips.o: $(src)/fips140-api.c FORCE
 CFLAGS_fips140-api-main.o += -I$(srctree)
 CFLAGS_fips140-api-fips.o += -I$(srctree)
 
-clean-files:= .fips140.order .fips140.symvers .fips140.hmac
\ No newline at end of file
+clean-files:= .fips140.order .fips140.symvers .fips140.hmac .fips140.ko.btf
\ No newline at end of file
diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 7fcb420997cb..13c82ffdc65b 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -26,6 +26,20 @@ EXPORT_SYMBOL_GPL(_binary_crypto_hmac_start);
 const u8 *_binary_crypto_hmac_end;
 EXPORT_SYMBOL_GPL(_binary_crypto_hmac_end);
 
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+extern const u8 __start_fips140_btf[];
+extern const u8 __stop_fips140_btf[];
+const u8 *__start_crypto_btf;
+const u8 *__stop_crypto_btf;
+#endif
+
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+extern const u8 __start_fips140_btf[];
+extern const u8 __stop_fips140_btf[];
+const u8 *__start_crypto_btf;
+const u8 *__stop_crypto_btf;
+#endif
+
 /* Function to load crypto module from memory */
 extern int load_crypto_module_mem(const char *mem, size_t size);
 
@@ -35,6 +49,11 @@ static void load_prepare(void)
 	_binary_crypto_ko_end = _binary_fips140_ko_end;
 	_binary_crypto_hmac_start = _binary_fips140_hmac_start;
 	_binary_crypto_hmac_end = _binary_fips140_hmac_end;
+	
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	__start_crypto_btf = __start_fips140_btf;
+	__stop_crypto_btf = __stop_fips140_btf;
+#endif
 }
 
 static int __init fips_loader_init(void)
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 7708958e3fb8..7e3b0d0acb9c 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -8408,6 +8408,26 @@ static int __init btf_module_init(void)
 	return 0;
 }
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(CONFIG_DEBUG_INFO_BTF_MODULES)
+/* Handle deferred BTF registration for FIPS140 loaded before btf_kobj exists */
+struct module *fips140_deferred_mod = NULL;
+
+static int __init register_deferred_fips140_btf(void)
+{	
+	if (fips140_deferred_mod && btf_kobj) {
+		/* Manually trigger BTF registration for FIPS140 */
+		btf_module_notify(NULL, MODULE_STATE_COMING, fips140_deferred_mod);
+		fips140_deferred_mod = NULL;
+		pr_info("FIPS140 BTF registration completed\n");
+	} else {
+		pr_info("FIPS140 BTF registration skipped: deferred_mod=%p, btf_kobj=%p\n",
+			fips140_deferred_mod, btf_kobj);
+	}
+	return 0;
+}
+late_initcall(register_deferred_fips140_btf);
+#endif
+
 fs_initcall(btf_module_init);
 #endif /* CONFIG_DEBUG_INFO_BTF_MODULES */
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index dad84f0548ac..7e34c8408705 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2651,6 +2651,23 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->btf_data = any_section_objs(info, ".BTF", 1, &mod->btf_data_size);
 	mod->btf_base_data = any_section_objs(info, ".BTF.base", 1,
 					      &mod->btf_base_data_size);
+	
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	/* Inject embedded BTF for FIPS140 module */
+	if (!mod->btf_data && !strcmp(mod->name, "fips140")) {
+		extern u8 *__start_crypto_btf;
+		extern u8 *__stop_crypto_btf;
+		size_t btf_size = __stop_crypto_btf - __start_crypto_btf;
+		
+		pr_info("FIPS140: Attempting BTF injection, btf_size=%zu\n", btf_size);
+		
+		if (btf_size > 0) {
+			mod->btf_data = __start_crypto_btf;
+			mod->btf_data_size = btf_size;
+			pr_info("FIPS140: Injected embedded BTF data, size %zu\n", btf_size);
+		}
+	}
+#endif
 #endif
 #ifdef CONFIG_JUMP_LABEL
 	mod->jump_entries = section_objs(info, "__jump_table",
@@ -3333,6 +3350,16 @@ static int prepare_coming_module(struct module *mod)
 	err = blocking_notifier_call_chain_robust(&module_notify_list,
 			MODULE_STATE_COMING, MODULE_STATE_GOING, mod);
 	err = notifier_to_errno(err);
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(CONFIG_DEBUG_INFO_BTF_MODULES)
+	/* Since fips140 module is loaded too early when BTF subsystem is not ready,
+	 * record this module for later BTF registration processing */
+	if (!strcmp(mod->name, "fips140")) {
+		pr_info("FIPS140 BTF MODULE_STATE_COMING: processing BTF registration\n");
+		extern struct module *fips140_deferred_mod;
+		fips140_deferred_mod = mod;  /* Store for later reference */
+	}
+#endif
+
 	if (err)
 		klp_module_going(mod);
 
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 93b382e08892..b30d65f8b6b3 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -62,10 +62,38 @@ endif
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
+fips140_build = .
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+fips140_build = fips140_build
+endif
+
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+      cmd_link_vmlinux += ; \
+	cp $(fips140_build)/crypto/fips140/fips140.ko crypto/fips140/fips140.ko.tmp; \
+	LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $@ crypto/fips140/fips140.ko.tmp; \
+	$(RESOLVE_BTFIDS) -b $@ crypto/fips140/fips140.ko.tmp; \
+	$(OBJCOPY) --dump-section=.BTF=crypto/fips140/.fips140.ko.btf crypto/fips140/fips140.ko.tmp; \
+	cp crypto/fips140/.fips140.ko.btf crypto/fips140/.fips140.ko.btf.first; \
+	rm -f crypto/fips140/fips140.ko.tmp; \
+	$(LD) -r -b binary -o crypto/fips140/fips140_btf.o crypto/fips140/.fips140.ko.btf; \
+	$(OBJCOPY) --rename-section .data=.fips140_btf crypto/fips140/fips140_btf.o; \
+	rm -f $@; \
+	FIPS140_BTF_RELINK=1 $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@"; \
+	cp $(fips140_build)/crypto/fips140/fips140.ko crypto/fips140/fips140.ko.tmp2; \
+	LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $@ crypto/fips140/fips140.ko.tmp2; \
+	$(RESOLVE_BTFIDS) -b $@ crypto/fips140/fips140.ko.tmp2; \
+	$(OBJCOPY) --dump-section=.BTF=crypto/fips140/.fips140.ko.btf.second crypto/fips140/fips140.ko.tmp2; \
+	rm -f crypto/fips140/fips140.ko.tmp2; \
+	diff crypto/fips140/.fips140.ko.btf.first crypto/fips140/.fips140.ko.btf.second >/dev/null || echo "Module BTF differs"; \
+	rm -f crypto/fips140/.fips140.ko.btf.first crypto/fips140/.fips140.ko.btf.second; \
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+endif
+endif
 
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 fips140-deps := crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 34c0a162da84..37c9b8576ec7 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -78,6 +78,9 @@ vmlinux_link()
 
 	if is_enabled CONFIG_CRYPTO_FIPS140_EXTMOD; then
 		objs="${objs} crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o"
+		if is_enabled CONFIG_DEBUG_INFO_BTF_MODULES && [ -n "${FIPS140_BTF_RELINK}" ] && [ -f crypto/fips140/fips140_btf.o ]; then
+			objs="${objs} crypto/fips140/fips140_btf.o"
+		fi
 	fi
 
 	objs="${objs} init/version-timestamp.o"
-- 
2.47.3


