Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C59C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Op4uME76G6UMaRr2ln07MEne4xFeGkJi8pLfnJFAkJQ=; b=VYK0+3ojHtvQdTO4eDt00zy3U/
	P4kjWxjGT+lx7sabV6xiWQf7UYQGav1SRxHPZ+ULM+lppwiNAHCvIAJO1G4E0WVGZrMNNuCJ9+wzq
	Nys8Zo8y2ma6BeUJsZzfa54U+7L4zwzYcHF9D24qnRwam89bpJ6p3eBl8U5IawfTi2bliHDxuBZO1
	GJfPZ6CfX+3WmHPMiJmgmgzs0P4ilR3W1t+yGLD+VSiZZdJpoSxw+8YSdJVR1Yki/Ar1BiZvFA6yh
	6bkmJtQ45I32dCIvSRLUKjFCHpA+3Kcc3BDR7DTD0qI2YswK+jQFXJENqc+BZuyYs7+r/yU9qLEOj
	eibSgwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YAv-00000007rpc-3rph;
	Wed, 09 Apr 2025 16:21:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xyc-00000007pjG-1i7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CEBF4A2C2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Apr 2025 16:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62109C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Apr 2025 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214913;
	bh=UeISwS9y3lU/oQu7T7xyKZsM9KiV5qGEixeP6JETyEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n/jgB6Gsjv1i0qlLY1nBumLDo98W9dCINpuwbo/duD0w6nTdDewzI5cFEioHm2zoo
	 RYlHiq9ouIS7iDlrc4vWOpdCA2A6M06RB0d1G6CtkTKk9u5Iy2jqBhnvtUyCZ7y91F
	 8Z04d+/8kY5i8f2uQBGCcIdEV9HpRywc6MPeViv6oJ1IYFNVhMIEeZoeHa3U+R/vus
	 ulkcI77SaSR6wf+IWdfF9P7NbKRX4eKFC9tSZ3V5yhh8hLsCfNy16eMfWfH6Q3CaRi
	 AYo+jA9iCT+I4ChFdshLKonVCpj+a+YIOArQ6NyYS5Lhoa+NHpnwzqA+BrDLZOo8Nn
	 WtO+/V90GuWzA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db3f3c907so63101771fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 09:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRJWws6iQNU20ypvtDzrMsZo2bCFCdD20TGyImF/tuJrrBizYdrTABPRl3tQYlEmu554ltM9FVAYLha1v+arRs@lists.infradead.org
X-Gm-Message-State: AOJu0YzVSH+ENMZ4fizq/CmHgLLU7ckGpeOEPM43gwhTnsuwQlCcN8kj
	gKDJyUFQvg/uWS94lHutq4E0aEKzao5hxEhuYKghU4r38uD9NFEFlDyImgwWvpEqjBVkJJNokl4
	3b7CWe8C07WUDL4nJ3ytYeC+H97U=
X-Google-Smtp-Source: AGHT+IH1f90QFFxZc7443QxPxjRfbyPZM2F/wtr8cixknUNRSj+QhdIqvEVXWa56LSQzmNQ3nhi5t+kOxBzbECfTATo=
X-Received: by 2002:a2e:bcc5:0:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-30f44f4b784mr11569621fa.2.1744214911615; Wed, 09 Apr 2025
 09:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250409160409.work.168-kees@kernel.org>
In-Reply-To: <20250409160409.work.168-kees@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Apr 2025 18:08:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
X-Gm-Features: ATxdqUGTZiuSmGYhSGBrMgZkO_TFJf73mCS8XUbFOLk-qWt97OZAcKf2VyJwGh8
Message-ID: <CAMj1kXHks1_eC=cAmkPC45deMp3_VdxckjyRoWvMovdBekg2bQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Remove ARM_SSP_PER_TASK plugin
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Douglas Anderson <dianders@chromium.org>, Russell King <linux@armlinux.org.uk>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Davis <afd@ti.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Xin Li <xin3.li@intel.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>, Yuntao Liu <liuyuntao12@huawei.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Dave Vasilevsky <dave@vasilevsky.ca>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_090834_487880_0074D3BB 
X-CRM114-Status: GOOD (  28.96  )
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

On Wed, 9 Apr 2025 at 18:04, Kees Cook <kees@kernel.org> wrote:
>
> As part of trying to remove GCC plugins from Linux, drop the
> ARM_SSP_PER_TASK plugin. The feature is available upstream since GCC
> 12, so anyone needing newer kernels with per-task ssp can update their
> compiler[1].
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Xin Li <xin3.li@intel.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  arch/arm/Kconfig                              |   3 +-
>  arch/arm/boot/compressed/Makefile             |   2 +-
>  scripts/Makefile.gcc-plugins                  |   6 -
>  scripts/gcc-plugins/Kconfig                   |   4 -
>  scripts/gcc-plugins/arm_ssp_per_task_plugin.c | 107 ------------------
>  5 files changed, 2 insertions(+), 120 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/arm_ssp_per_task_plugin.c
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 835b5f100e92..6f037edf0f41 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1379,8 +1379,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
>  config STACKPROTECTOR_PER_TASK
>         bool "Use a unique stack canary value for each task"
>         depends on STACKPROTECTOR && CURRENT_POINTER_IN_TPIDRURO && !XIP_DEFLATED_DATA
> -       depends on GCC_PLUGINS || CC_HAVE_STACKPROTECTOR_TLS
> -       select GCC_PLUGIN_ARM_SSP_PER_TASK if !CC_HAVE_STACKPROTECTOR_TLS
> +       depends on CC_HAVE_STACKPROTECTOR_TLS
>         default y
>         help
>           Due to the fact that GCC uses an ordinary symbol reference from
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 945b5975fce2..d61369b1eabe 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -96,7 +96,7 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
>
>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
>              -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> -            -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
> +            -I$(obj)
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
>  asflags-y := -DZIMAGE
>
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 6da109d563a5..194122d969a8 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -36,12 +36,6 @@ ifdef CONFIG_GCC_PLUGIN_STACKLEAK
>  endif
>  export DISABLE_STACKLEAK_PLUGIN
>
> -gcc-plugin-$(CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK) += arm_ssp_per_task_plugin.so
> -ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
> -    DISABLE_ARM_SSP_PER_TASK_PLUGIN += -fplugin-arg-arm_ssp_per_task_plugin-disable
> -endif
> -export DISABLE_ARM_SSP_PER_TASK_PLUGIN
> -
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index ba868d1eef3d..6b34ba19358d 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -36,8 +36,4 @@ config GCC_PLUGIN_LATENT_ENTROPY
>            * https://grsecurity.net/
>            * https://pax.grsecurity.net/
>
> -config GCC_PLUGIN_ARM_SSP_PER_TASK
> -       bool
> -       depends on GCC_PLUGINS && ARM
> -
>  endif
> diff --git a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c b/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
> deleted file mode 100644
> index 7328d037f975..000000000000
> --- a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -#include "gcc-common.h"
> -
> -__visible int plugin_is_GPL_compatible;
> -
> -static unsigned int canary_offset;
> -
> -static unsigned int arm_pertask_ssp_rtl_execute(void)
> -{
> -       rtx_insn *insn;
> -
> -       for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
> -               const char *sym;
> -               rtx body;
> -               rtx current;
> -
> -               /*
> -                * Find a SET insn involving a SYMBOL_REF to __stack_chk_guard
> -                */
> -               if (!INSN_P(insn))
> -                       continue;
> -               body = PATTERN(insn);
> -               if (GET_CODE(body) != SET ||
> -                   GET_CODE(SET_SRC(body)) != SYMBOL_REF)
> -                       continue;
> -               sym = XSTR(SET_SRC(body), 0);
> -               if (strcmp(sym, "__stack_chk_guard"))
> -                       continue;
> -
> -               /*
> -                * Replace the source of the SET insn with an expression that
> -                * produces the address of the current task's stack canary value
> -                */
> -               current = gen_reg_rtx(Pmode);
> -
> -               emit_insn_before(gen_load_tp_hard(current), insn);
> -
> -               SET_SRC(body) = gen_rtx_PLUS(Pmode, current,
> -                                            GEN_INT(canary_offset));
> -       }
> -       return 0;
> -}
> -
> -#define PASS_NAME arm_pertask_ssp_rtl
> -
> -#define NO_GATE
> -#include "gcc-generate-rtl-pass.h"
> -
> -#if BUILDING_GCC_VERSION >= 9000
> -static bool no(void)
> -{
> -       return false;
> -}
> -
> -static void arm_pertask_ssp_start_unit(void *gcc_data, void *user_data)
> -{
> -       targetm.have_stack_protect_combined_set = no;
> -       targetm.have_stack_protect_combined_test = no;
> -}
> -#endif
> -
> -__visible int plugin_init(struct plugin_name_args *plugin_info,
> -                         struct plugin_gcc_version *version)
> -{
> -       const char * const plugin_name = plugin_info->base_name;
> -       const int argc = plugin_info->argc;
> -       const struct plugin_argument *argv = plugin_info->argv;
> -       int i;
> -
> -       if (!plugin_default_version_check(version, &gcc_version)) {
> -               error(G_("incompatible gcc/plugin versions"));
> -               return 1;
> -       }
> -
> -       for (i = 0; i < argc; ++i) {
> -               if (!strcmp(argv[i].key, "disable"))
> -                       return 0;
> -
> -               /* all remaining options require a value */
> -               if (!argv[i].value) {
> -                       error(G_("no value supplied for option '-fplugin-arg-%s-%s'"),
> -                             plugin_name, argv[i].key);
> -                       return 1;
> -               }
> -
> -               if (!strcmp(argv[i].key, "offset")) {
> -                       canary_offset = atoi(argv[i].value);
> -                       continue;
> -               }
> -               error(G_("unknown option '-fplugin-arg-%s-%s'"),
> -                     plugin_name, argv[i].key);
> -               return 1;
> -       }
> -
> -       PASS_INFO(arm_pertask_ssp_rtl, "expand", 1, PASS_POS_INSERT_AFTER);
> -
> -       register_callback(plugin_info->base_name, PLUGIN_PASS_MANAGER_SETUP,
> -                         NULL, &arm_pertask_ssp_rtl_pass_info);
> -
> -#if BUILDING_GCC_VERSION >= 9000
> -       register_callback(plugin_info->base_name, PLUGIN_START_UNIT,
> -                         arm_pertask_ssp_start_unit, NULL);
> -#endif
> -
> -       return 0;
> -}
> --
> 2.34.1
>

