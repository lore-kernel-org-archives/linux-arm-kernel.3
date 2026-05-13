Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D26CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vgEh0TaFfkzOHI9XhKqh1xr0/jsu4b46xg3eva7m4w=; b=IdSVH9DeHrg2Xg1zg0iWtaPqZ/
	rEmjsHRA8BjOlOPvbPzy+jc+8JuBVmpw15wBY41fjiM8vplF7kwxvfCs9lpmupXi3hfAXULZc24JZ
	r7qrsjo7+RX9q4hCnqedNk0AYo8KaocrKA31YNP5lwLr9Gp4gMvlbAdHN/Ux7S16vwal6rm3If8//
	JxpfqDwYJcwQaLZFlcdvjTqm8TrRkm+v5ZD2Za4gMDZQR1Nf2TqflFueG+S79ZSHw/fVs4R782vuh
	7S9641sRVmZKk4yyL/ehU0fu3tFpze1Y+15dY6HccjUcKTRm9z96ReIcFiBxsV4T/uT3kmFZ6W09v
	dv5jpHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Ni-0000000151b-3CYH;
	Wed, 13 May 2026 03:35:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0N1-0000000142d-0xOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B71DD44492;
	Wed, 13 May 2026 03:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09837C2BCC9;
	Wed, 13 May 2026 03:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643290;
	bh=6qM6eS73y/2HGC/l7RWciS6d5w9G1tF/qeUGxjijkEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohMOmZv+7PioVmwuGWUJEydizZIPCjZOmiUg7Bx08ndx/aDUunDHXY1eOxD1eEjvc
	 tO6+d2dZ93dMtA58RXZlBIQjT6/t8eIUkPnwLnAX7A5ly0DuEygwp4h8hEHmThhkjx
	 oXxc94HReQGW27VAaSyHdq6PWmJTgVCmW8sMuG39AFvUReJavru9JDhy0rN4MzhKmf
	 qLxo3F3plA6FbesptXmdaxyAFiLRyp5TpcKiKLyYZmUD0BMM5NHRcFgRPejtvoqFhr
	 PmByC1BETVjCC54xh1dXgPnd1Qrq8NqS7N4YOHmjvo64qWgKsyhpwYLN+LHw9yxN8C
	 2LW/LPxlPKszQ==
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
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v3 09/21] kbuild: Only run objtool if there is at least one command
Date: Tue, 12 May 2026 20:34:05 -0700
Message-ID: <8699672b82fef17e73a5f2e5528478778dbdab31.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203451_305007_03517B61 
X-CRM114-Status: GOOD (  12.23  )
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
Message-ID: <20260513033405.ylH_1D7BVLE81Xlb9tygz0lD2ijxrRQilAWeGh8BtkU@z>

Split the objtool args into commands and options, such that if no
commands have been enabled, objtool doesn't run.

This is in preparation for enabling objtool and klp-build for arm64.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/boot/startup/Makefile |  2 +-
 scripts/Makefile.build         |  4 +--
 scripts/Makefile.lib           | 52 ++++++++++++++++++----------------
 scripts/Makefile.vmlinux_o     | 15 ++++------
 4 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5c..a08297829fc63 100644
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
index 3498d25b15e85..c4accfcd177d4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
 ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+$(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y))
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
index 7e216d82e9887..7f803796d20cf 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -183,30 +183,34 @@ ifdef CONFIG_OBJTOOL
 
 objtool := $(objtree)/tools/objtool/objtool
 
-objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
-objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
-objtool-args-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
-objtool-args-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
-objtool-args-$(CONFIG_CALL_PADDING)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
-ifdef CONFIG_CALL_PADDING
-objtool-args-$(CONFIG_CFI)				+= --cfi
-objtool-args-$(CONFIG_FINEIBT)				+= --fineibt
-endif
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
-objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --werror
+# objtool commands
+objtool-cmds-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
+objtool-cmds-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
+objtool-cmds-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
+objtool-cmds-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
+objtool-cmds-$(CONFIG_CALL_PADDING)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
+objtool-cmds-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
+objtool-cmds-$(CONFIG_UNWINDER_ORC)			+= --orc
+objtool-cmds-$(CONFIG_MITIGATION_RETPOLINE)		+= --retpoline
+objtool-cmds-$(CONFIG_MITIGATION_RETHUNK)		+= --rethunk
+objtool-cmds-$(CONFIG_MITIGATION_SLS)			+= --sls
+objtool-cmds-$(CONFIG_STACK_VALIDATION)			+= --stackval
+objtool-cmds-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
+objtool-cmds-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
+objtool-cmds-y						+= $(OBJTOOL_ARGS)
 
-objtool-args = $(objtool-args-y)					\
+# objtool options
+ifdef CONFIG_CALL_PADDING
+objtool-opts-$(CONFIG_CFI)				+= --cfi
+objtool-opts-$(CONFIG_FINEIBT)				+= --fineibt
+endif
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+objtool-opts-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
+endif
+objtool-opts-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
+objtool-opts-$(CONFIG_OBJTOOL_WERROR)			+= --werror
+
+objtool-args = $(objtool-cmds-y) $(objtool-opts-y)			\
 	$(if $(delay-objtool), --link)					\
 	$(if $(part-of-module), --module)
 
@@ -215,7 +219,7 @@ delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT),$(CONFIG_KLP_
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
-objtool-enabled := y
+objtool-enabled = $(if $(objtool-cmds-y),y)
 
 endif # CONFIG_OBJTOOL
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 527352c222ff6..09af33203bd8d 100644
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


