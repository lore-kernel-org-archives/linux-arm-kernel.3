Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1DEFF6E91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jj8tN+NiPbKI+HJR+gZD8s27Lr8xMTFN9CWikCXcdE=; b=bAD2iU0qZwNPJPimMKFBfOpw0e
	6MbKEkEvyErdmtw8CcBbgVmAG41e6JnVZ3lFg3Xp9mnhnrxfkTxU8IrV3U3amOABWbV1GO/GsZunr
	OE5gQbN6xi0iF/4XX2w4slHpb2lVfDpBxhlemOWTgqciGoTYSmn+/Hi5EZewCX/AR2oc/TxHUePMF
	6gEr96gd8E2ct1SrHs+BHoPyqeToEIKM9Rh76i9BNF3WthYEQn/pUbyL9xfp53EoAKkBgJooeo3Kd
	0P7yI5CiCPEwErMzi6VEasrN6KiJ8PbOClJ+TrL6j/pnE8LF1mj+d93JTVWSoio5T3Q1dL9HFtlNL
	Vv4S51mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGQ-00000007Kd2-1NMX;
	Tue, 17 Mar 2026 22:51:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGC-00000007KWl-2yCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69C4143465;
	Tue, 17 Mar 2026 22:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6691C4AF09;
	Tue, 17 Mar 2026 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787896;
	bh=K2EF4WTRfHeASh1z8JUpsoYkCrO4xOH9SpbOyLu8+CI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1i67/Mov8XDpflXD5q0rfdgzON3t0UT4lemySE51+WujWg/iCL4b9vZVF+4vic+A
	 740ymHe1YmgUmrVDCwLDb5BOwxzgS/myW2+v81rajqq1rcTrjh9+Sq1cupUoBz6Heg
	 bhxVbtfQryBda/0svJrQxrRJSoKR8Ikct6hzUCPLtTjpqwUq595Bjf0tkeSJ6P81/t
	 RnShf8zyZ8h/WMq4+DVtR5eQyPAuD5PVVgPOXjaZ/r9q0Ty+yZrBeF5xhDeJP2MBpe
	 Cw6/vq8j9Y2iA3lnotGKezTD1nZO/+dLN3tXhBHxOp3TSdKZEWwTYQrr6BHGuk4T7q
	 gz4iBTfUEohWQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 07/12] kbuild: Only run objtool if there is at least one command
Date: Tue, 17 Mar 2026 15:51:07 -0700
Message-ID: <42418c5fa73a8876e91b3dfb38fa3f263e39f1c1.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155136_800791_B12916AF 
X-CRM114-Status: GOOD (  11.65  )
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

Split the objtool args into commands and options, such that if no
commands have been enabled, objtool doesn't run.

This is in preparation in enabling objtool and klp-build for arm64.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/boot/startup/Makefile |  2 +-
 scripts/Makefile.build         |  4 +--
 scripts/Makefile.lib           | 46 ++++++++++++++++++----------------
 scripts/Makefile.vmlinux_o     | 15 ++++-------
 4 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5..a08297829fc6 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -36,7 +36,7 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
 # relocations, even if other objtool actions are being deferred.
 #
 $(pi-objs): objtool-enabled	= 1
-$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-args-y)) --noabs
+$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-cmds-y) $(objtool-opts-y)) --noabs
 
 #
 # Confine the startup code by prefixing all symbols with __pi_ (for position
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3652b85be545..8a1bdfdb2fdb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
 ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y)))
 endif
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
@@ -501,7 +501,7 @@ define rule_ld_multi_m
 	$(call cmd,gen_objtooldep)
 endef
 
-$(multi-obj-m): private objtool-enabled := $(delay-objtool)
+$(multi-obj-m): private objtool-enabled := $(if $(objtool-cmds-y),$(delay-objtool))
 $(multi-obj-m): private part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
 	$(call if_changed_rule,ld_multi_m)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..40a462581666 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -183,27 +183,31 @@ ifdef CONFIG_OBJTOOL
 
 objtool := $(objtree)/tools/objtool/objtool
 
-objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
-objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
-objtool-args-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
-objtool-args-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
-objtool-args-$(CONFIG_FINEIBT)				+= --cfi
-objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
-ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
-objtool-args-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
-endif
-objtool-args-$(CONFIG_UNWINDER_ORC)			+= --orc
-objtool-args-$(CONFIG_MITIGATION_RETPOLINE)		+= --retpoline
-objtool-args-$(CONFIG_MITIGATION_RETHUNK)		+= --rethunk
-objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
-objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
-objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
-objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
-objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
-objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
-objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --werror
+# objtool commands
+objtool-cmds-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
+objtool-cmds-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
+objtool-cmds-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
+objtool-cmds-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
+objtool-cmds-$(CONFIG_FINEIBT)				+= --cfi
+objtool-cmds-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
+objtool-cmds-$(CONFIG_UNWINDER_ORC)			+= --orc
+objtool-cmds-$(CONFIG_MITIGATION_RETPOLINE)		+= --retpoline
+objtool-cmds-$(CONFIG_MITIGATION_RETHUNK)		+= --rethunk
+objtool-cmds-$(CONFIG_MITIGATION_SLS)			+= --sls
+objtool-cmds-$(CONFIG_STACK_VALIDATION)			+= --stackval
+objtool-cmds-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
+objtool-cmds-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
+objtool-cmds-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
+objtool-cmds-y						+= $(OBJTOOL_ARGS)
 
-objtool-args = $(objtool-args-y)					\
+# objtool options
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+objtool-opts-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
+endif
+objtool-opts-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
+objtool-opts-$(CONFIG_OBJTOOL_WERROR)			+= --werror
+
+objtool-args = $(objtool-cmds-y) $(objtool-opts-y)			\
 	$(if $(delay-objtool), --link)					\
 	$(if $(part-of-module), --module)
 
@@ -212,7 +216,7 @@ delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT),$(CONFIG_KLP_
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
-objtool-enabled := y
+objtool-enabled = $(if $(objtool-cmds-y),y)
 
 endif # CONFIG_OBJTOOL
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 527352c222ff..09af33203bd8 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -36,18 +36,13 @@ endif
 # For !delay-objtool + CONFIG_NOINSTR_VALIDATION, it runs on both translation
 # units and vmlinux.o, with the latter only used for noinstr/unret validation.
 
-objtool-enabled := $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
-
-ifeq ($(delay-objtool),y)
-vmlinux-objtool-args-y					+= $(objtool-args-y)
-else
-vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
+ifneq ($(delay-objtool),y)
+objtool-cmds-y					 =
+objtool-opts-y					+= --link
 endif
 
-vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
-							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
-
-objtool-args = $(vmlinux-objtool-args-y) --link
+objtool-cmds-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
+						   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
 
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
-- 
2.53.0


