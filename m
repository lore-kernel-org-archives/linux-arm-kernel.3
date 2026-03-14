Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77720107BCEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 00:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fad+bc6/L/kx2jLnvEvBbO4q8EAqBdUMPQN8dvikrL4=; b=1YqMaDRUqfQd+GPFN4SX0lDjhH
	DCcj3qf4mExDWm+Ml8Rxq58DhAW9ukFB4Iq3YWSiEwtIHP3uowuSRiUDMAh3MgX8HkusYkpGSUCN9
	AuA4SJwUspwI4Xx6+RaT0QGfwu/6OaIuVOMN+1k8bxcSE+WV8gRmDNl97UrriG5UpIcFEfnqRbD2q
	k16zE4uVzMbqmn+NFSA2mr3ewpi2W9cmyJcGcmyhctRY9LOXVs0ZEC+lsEl8ltcgy7k6OVRDLjfQk
	DzN3aGVvx+iETTAN9jjHSamZxBmZk7MaDNdt5XaCTWRb0yfsYlmk8l8UILH4BbsnqV9sHRFDjZLXe
	zUNTI9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D8G-00000001Msy-2N9z;
	Sat, 14 Mar 2026 00:45:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D8E-00000001MsE-1Yff
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 00:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34B9043ADC;
	Sat, 14 Mar 2026 00:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920F3C19421;
	Sat, 14 Mar 2026 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773449128;
	bh=/V0uuyTzcQCpPt9FAfdP68pgwdCXchE6IRs8x/fuKmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nY0/fL187q+R4CU2/4X+/6CEvQzvajl5IhjeFhmLw6SAABAzmlYETnlapZ1bFX7L3
	 7IFQC3US5b3dBBbEZ7Cy6dvr667FcoJbE/N5hCs+z2jP6+Ix8w3eitB2tUVsu8I3y2
	 JYY4Mgm22Num9+1VwufG2hZjmBFDC5e5gkSgqlje9FKKHQb7jblC6b7IYLPfj/b/ww
	 PHhc10cvDxevO4Fe/DzdU4IWuG9yi7PFtIVhg0u/f463YRsNYndFitFkQXZzNHnsHh
	 oLwyrz22RyTTwlGG9DSEJar3wWa+/IGjn8bMrHtXCbRgb7ZkwV2D0LA6KrBxAlDavl
	 2TS9swuXAFxoA==
Date: Fri, 13 Mar 2026 17:45:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 09/14] kbuild: Only run objtool if there is at least one
 command
Message-ID: <20260314004522.GA3886710@ax162>
References: <cover.1772681234.git.jpoimboe@kernel.org>
 <b5f73df0d598e77104f7d2de5a84d69e75e80b9f.1772681234.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f73df0d598e77104f7d2de5a84d69e75e80b9f.1772681234.git.jpoimboe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_174530_455030_B25D5C6A 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Mar 04, 2026 at 07:31:28PM -0800, Josh Poimboeuf wrote:
> Split the objtool args into commands and options, such that if no
> commands have been enabled, objtool doesn't run.
> 
> This is in preparation in enabling objtool and klp-build for arm64.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

I assume this will go with the rest of the series.

> ---
>  arch/x86/boot/startup/Makefile |  2 +-
>  scripts/Makefile.build         |  4 +--
>  scripts/Makefile.lib           | 46 ++++++++++++++++++----------------
>  scripts/Makefile.vmlinux_o     | 15 ++++-------
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> index 5e499cfb29b5..a08297829fc6 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -36,7 +36,7 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
>  # relocations, even if other objtool actions are being deferred.
>  #
>  $(pi-objs): objtool-enabled	= 1
> -$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-args-y)) --noabs
> +$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-cmds-y) $(objtool-opts-y)) --noabs
>  
>  #
>  # Confine the startup code by prefixing all symbols with __pi_ (for position
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 32e209bc7985..d2d0776df947 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>  is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
>  
>  ifdef CONFIG_OBJTOOL
> -$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
> +$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y)))
>  endif
>  
>  ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
> @@ -499,7 +499,7 @@ define rule_ld_multi_m
>  	$(call cmd,gen_objtooldep)
>  endef
>  
> -$(multi-obj-m): private objtool-enabled := $(delay-objtool)
> +$(multi-obj-m): private objtool-enabled := $(if $(objtool-cmds-y),$(delay-objtool))
>  $(multi-obj-m): private part-of-module := y
>  $(multi-obj-m): %.o: %.mod FORCE
>  	$(call if_changed_rule,ld_multi_m)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0718e39cedda..40a462581666 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -183,27 +183,31 @@ ifdef CONFIG_OBJTOOL
>  
>  objtool := $(objtree)/tools/objtool/objtool
>  
> -objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
> -objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
> -objtool-args-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
> -objtool-args-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
> -objtool-args-$(CONFIG_FINEIBT)				+= --cfi
> -objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
> -ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> -objtool-args-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
> -endif
> -objtool-args-$(CONFIG_UNWINDER_ORC)			+= --orc
> -objtool-args-$(CONFIG_MITIGATION_RETPOLINE)		+= --retpoline
> -objtool-args-$(CONFIG_MITIGATION_RETHUNK)		+= --rethunk
> -objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
> -objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
> -objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
> -objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
> -objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
> -objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
> -objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --werror
> +# objtool commands
> +objtool-cmds-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
> +objtool-cmds-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
> +objtool-cmds-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
> +objtool-cmds-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
> +objtool-cmds-$(CONFIG_FINEIBT)				+= --cfi
> +objtool-cmds-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
> +objtool-cmds-$(CONFIG_UNWINDER_ORC)			+= --orc
> +objtool-cmds-$(CONFIG_MITIGATION_RETPOLINE)		+= --retpoline
> +objtool-cmds-$(CONFIG_MITIGATION_RETHUNK)		+= --rethunk
> +objtool-cmds-$(CONFIG_MITIGATION_SLS)			+= --sls
> +objtool-cmds-$(CONFIG_STACK_VALIDATION)			+= --stackval
> +objtool-cmds-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
> +objtool-cmds-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
> +objtool-cmds-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
> +objtool-cmds-y						+= $(OBJTOOL_ARGS)
>  
> -objtool-args = $(objtool-args-y)					\
> +# objtool options
> +ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> +objtool-opts-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
> +endif
> +objtool-opts-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
> +objtool-opts-$(CONFIG_OBJTOOL_WERROR)			+= --werror
> +
> +objtool-args = $(objtool-cmds-y) $(objtool-opts-y)			\
>  	$(if $(delay-objtool), --link)					\
>  	$(if $(part-of-module), --module)
>  
> @@ -212,7 +216,7 @@ delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT),$(CONFIG_KLP_
>  cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
>  cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
>  
> -objtool-enabled := y
> +objtool-enabled = $(if $(objtool-cmds-y),y)
>  
>  endif # CONFIG_OBJTOOL
>  
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 527352c222ff..09af33203bd8 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -36,18 +36,13 @@ endif
>  # For !delay-objtool + CONFIG_NOINSTR_VALIDATION, it runs on both translation
>  # units and vmlinux.o, with the latter only used for noinstr/unret validation.
>  
> -objtool-enabled := $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
> -
> -ifeq ($(delay-objtool),y)
> -vmlinux-objtool-args-y					+= $(objtool-args-y)
> -else
> -vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
> +ifneq ($(delay-objtool),y)
> +objtool-cmds-y					 =
> +objtool-opts-y					+= --link
>  endif
>  
> -vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
> -							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
> -
> -objtool-args = $(vmlinux-objtool-args-y) --link
> +objtool-cmds-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
> +						   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
>  
>  # Link of vmlinux.o used for section mismatch analysis
>  # ---------------------------------------------------------------------------
> -- 
> 2.53.0
> 

