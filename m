Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90EFC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=; b=f+CXyaQ4/R6tqvcmYhCcD84WrC
	8jL2fw4lDPvVc4zvs+PH3t37W32YOsd5mjBz3vIOX3i2LHh0BAMiXKCH0EbqJCaB6MmMJKLxOMxoN
	YQYi9nhCQlBkBPPz09EWaPRdLzS2WfgoeZZ5qCsahtFjreHAX+TshbmRwxgTinDtkxP8iGJowT7FX
	XSmque0dQZSZ60mfwwUgdiXHepNFlAYgJuxQ6RKnzf9IYlXdldJ502OSVx+eY47DfAwJext+tA4bj
	TZeDqCcGUIkBarxe4xGrGCuDmZ2LZR66z2jf3yNZ3GOvJ7ny5YnkkK8ecUHVd320qLquUpmHM3Klt
	DW2OeSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01Ky-00000006JDD-0XgS;
	Fri, 28 Aug 2026 18:30:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01Kv-00000006JCr-3UA1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:29:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47db714766aso1801721f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 11:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941795; cv=none;
        d=google.com; s=arc-20260327;
        b=rJH2a7kjgxxKY0cdfpeekPqSmLCxVPLCBNxP1MBBtPqtt9IyJM7XKG+nLnF+gxafhg
         UCM5JLsGQr21R4EoXRsKUp/65jVqKWcDNWmT+EhthSutS5moQH0UzA57qiPUjxLewuE3
         cIDOOrcRZYlqDMuq1qprOw8egFFkdensHM1FMFsmZ7DbZiNJfqL94tJNpPFaKQYVb5Iu
         gWQbGjDMSjo6G9OyGYnHEr94+X8YMAP2Fg2PIgXlQIAttbddGppJj150wFql64s99y3M
         NtOqYJNKcfH5cJPilI+0WbjPebEmf2L80MzqbGWEJWfiosVur+QipGyLbLZ2KEznlT5B
         5xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        fh=uHVwm25vDvm49axkwB1nm57xffCcwET0kPfPHwOjKhs=;
        b=o+ExFgRlVmRieMOcitfCL8KVIdFN9hw//PV80/QiK06OVn120aWvyi8vbnckiKdeyq
         piBzvyaPYLrBJGQdzecmnPJR281ZdUyb9wGFbhbqMcGbVOCr7qt0ftWpmvhB4ibl42id
         diqvp3M4/wQCzeMObJz1pyLSQxAPQRVpl48XNqeqMUJe0UPuDeS1g7r8aREpEihi5pJH
         KKyItbzwv2ypOyUF4B8oGzxAp8M965mNPknoHrYVHsQqevH9F7xFiGWAMEX1ZlD79lwJ
         Fr7i+eA1LZY2eyGcJ+q1y28lpeRkHtIROt4ogkRlQpzR+NTu00lDN7EDZgkH5znbztOH
         7oAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787941795; x=1788546595; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=YqKegDLRZJWCsSktfa7vy/dd0X66W2sw83j+5Lkw3E+Iyeth4W4rNU5GaTq4Dw6Vqo
         zABZd668977O08yajbRDSrCnl7+Dl8iqh8005gyyao7xoYcUPaErKhbtIRsimmQ3GPdn
         mTNsGx7B7uKXawnHaNfxGNHVH5/IUyj1+zdtTqTCSqkZdntBe/BmZ3amwne4FRD8PD6a
         4a495U8WiQ156k4A7czAZZCOqHvlkAG8F3dt2anHW47c2sUrbl9znP6kcJPmBgfrAMZB
         zQ6hSTvhQ1dvMlsfyJj7Gkqgd1QZHu15duFm3lZisSvaT8XS2TkiuwJLxsZxiG74IUpI
         fVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941795; x=1788546595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YJ1kkWNwVyHRN4faZGYbumWsclnmyXO2DH4mLRwZU0=;
        b=Lq4+N07dQV9FP996Uk3D+cgA+CPaGIxyN9vtYl+H59ASsJLrPbbRiDnjJtIJkovvJV
         tLbtv5YPj4eMyXPb4O6OTRZXdlt1VzxH62Xz1nDChB4RNMmGy7LcZw3iwYWQzpTI7US1
         Hysoe4kPE/LbInXk8d6VA/7RV5hVgK2916ONINyxiP7xbWR1znODN26IymccbpfcUksh
         qX+wRbscZPdM5wwCc8Bvfuvm53xM6aDmb/d3xDupn9Ad0gAeIVHDWM3Xq+uCiHEggq+m
         Fa0wjOyllhcfE2BugeNkfGBtGcfAZ3ZW/NfDdhzJQmjiNX4EVNiDSraok8L6DuIutgGF
         HUyw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2HzURk8mDMM2ENkLFRGGNZxCX6UVevz+fC4ay2NQlg7tyLoDmj9DS3q66s/SYmYmhI5+EYGr1hJuCxzuDtCeQ@lists.infradead.org
X-Gm-Message-State: AFuF++momlh9+1/zAgE+/+LTW/y7CXWDgWU+S7aJw9HNEjSTEnVUVHUa
	q2zkbz0PUM/LiCntmMv2mdgpwEYjK1lYiiGuCIWauejRZSBVodGeqg3vJFxB5WxjIpnk7BHcTi9
	JrbulxcgzKY0GUeFnOWXIp0pEDtnEaXTFuwh04Vov
X-Gm-Gg: AR+sD10639ruTWpZlvL3yABP3iUyFifrvstvIC3HH/WKK7izq0OBpnGUFxDntybl/2e
	ZB31l+8LFQA6PwN7j1QAOLonVJPAbxqSyVxc8CMRAEkAmH9an2hlaC8k6OvZURL3DE2SQQ30wLx
	OYxKCGVnlHDDBjVzBVGTSFAe/aNEtG9bBY32arqlip2fDcWBsVoYr4KaDO0kw9pKam7tOzThMU+
	705KSDQn5TNejvUSVhiH7GCglmyXYshA625l+NJN9ldPy9X29/mjIwL9sEB746mxntbFJ+eun7L
	VWJYFJkEZgUClw516z7W+G6i/BxO3oBpq3cETSh8OkETiG+DdQjIpdm1DjlPw7KUUZ/SVWJJVWT
	mpo3y7u9nsAo/gcUY21zSam+Sy6lyRitT9opIWyQpYqZBRXuFM9ReFmpj+w==
X-Received: by 2002:a05:6000:25ee:b0:482:ea3e:882a with SMTP id
 ffacd0b85a97d-482eab75e7dmr25940329f8f.6.1787941794160; Fri, 28 Aug 2026
 11:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
In-Reply-To: <20260827194508.446733-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 11:29:42 -0700
X-Gm-Features: AcwNN1Wo8FotnJAZ3x2qyZAW16XADYe-Cm0K9lnOHcg75ObfT4YQxREeCDOy8I4
Message-ID: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_112957_912648_49D6713B 
X-CRM114-Status: GOOD (  38.04  )
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

On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:

Nice!  This is a pretty good progression.

>
> - Declare imx6_suspend() with SYM_TYPED_FUNC_START() so a type hash
>   is emitted for it. fncpy() requires the entry point to be 8-byte
>   aligned, and the macro's alignment applies to the hash rather than
>   the entry that follows it, so pad manually before the macro.
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL) running postmarketOS
> (clang/LLVM, CONFIG_CFI=3Dy): suspend and resume work.
>
> Changes in v4, all following Nick's suggestions:
> - Drop the v3 __nocfi wrapper; keep the indirect call CFI-checked.
> - Store the hash in a cfi_type member in the struct's tail padding
>   instead of open-coded pointer arithmetic.
> - Use cfi_get_func_hash() instead of reading the hash manually.
> - Use SYM_TYPED_FUNC_START()/SYM_FUNC_END() instead of ENTRY()/
>   ENDPROC() with a hand-rolled __CFI_TYPE.
>
> Note: linux/uaccess.h is included before linux/cfi.h because
> cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> include uaccess.h itself.

Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

>
>  arch/arm/mach-imx/pm-imx6.c      | 25 ++++++++++++++++++++++---
>  arch/arm/mach-imx/suspend-imx6.S | 14 ++++++++++++--
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca4..2d3d3cd 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -4,6 +4,8 @@
>   * Copyright 2011 Linaro Ltd.
>   */
>
> +#include <linux/uaccess.h>
> +#include <linux/cfi.h>

This is a bug in include/linux/cfi.h; don't work around it. Fix it.

>  #include <linux/clk/imx.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> @@ -61,9 +63,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE                0x1000
>  #define MX6_MAX_MMDC_IO_NUM            33
>
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;
>
>  /*
>   * suspend ocram space layout:
> @@ -229,8 +231,18 @@ struct imx6_cpu_pm_info {
>         struct imx6_pm_base l2_base;
>         u32 mmdc_io_num; /* Number of MMDC IOs which need saved/restored.=
 */
>         u32 mmdc_io_val[MX6_MAX_MMDC_IO_NUM][2]; /* To save offset and va=
lue */
> +       u32 cfi_type; /* kCFI type hash of imx6_suspend() */
>  } __aligned(8);
>
> +/*
> + * The ocram copy of imx6_suspend() starts right after struct imx6_cpu_p=
m_info,
> + * and the CFI check on the indirect call reads the kCFI type hash from =
the
> + * four bytes preceding the function entry, so cfi_type must occupy the =
last
> + * four bytes of the struct, i.e. fit into its tail padding.
> + */
> +static_assert(offsetofend(struct imx6_cpu_pm_info, cfi_type) =3D=3D
> +             sizeof(struct imx6_cpu_pm_info));

on this IWYU thread, shall we also include linux/build_bug.h for
static_assert or linux/stddef.h for offsetofend?

> +
>  void imx6_set_int_mem_clk_lpm(bool enable)
>  {
>         u32 val =3D readl_relaxed(ccm_base + CGPR);
> @@ -568,6 +580,13 @@ static int __init imx6q_suspend_init(const struct im=
x6_pm_socdata *socdata)
>                         mmdc_offset_array[i]);
>         }
>
> +       /*
> +        * Mask out the Thumb bit, as cfi_get_func_hash() expects the
> +        * function's actual start address. Returns 0 if CONFIG_CFI=3Dn.
> +        */
> +       pm_info->cfi_type =3D
> +               cfi_get_func_hash((void *)((uintptr_t)&imx6_suspend & ~1U=
L));
> +
>         imx6_suspend_in_ocram_fn =3D fncpy(
>                 suspend_ocram_base + sizeof(*pm_info),
>                 &imx6_suspend,
> diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend=
-imx6.S
> index 63ccc2d..f60c4e5 100644
> --- a/arch/arm/mach-imx/suspend-imx6.S
> +++ b/arch/arm/mach-imx/suspend-imx6.S
> @@ -3,6 +3,7 @@
>   * Copyright 2014 Freescale Semiconductor, Inc.
>   */
>
> +#include <linux/cfi_types.h>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  #include <asm/asm-offsets.h>
> @@ -148,7 +149,16 @@
>
>         .endm
>
> -ENTRY(imx6_suspend)
> +#ifdef CONFIG_CFI
> +       /*
> +        * Pad the location counter so that the type hash emitted by
> +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> +        * fncpy() requires the function entry to be 8-byte aligned.
> +        */
> +       .align  3
> +       .4byte  0

I still don't like these assembler directives inline like this; this
feels like we should have perhaps a new macro in
include/linux/cfi_types.h. Thoughts, Sami?

One that garuntees the 8B alignment of the symbol for w/e that
function patching routine requires?

> +#endif
> +SYM_TYPED_FUNC_START(imx6_suspend)
>         ldr     r1, [r0, #PM_INFO_PBASE_OFFSET]
>         ldr     r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
>         ldr     r3, [r0, #PM_INFO_DDR_TYPE_OFFSET]
> @@ -329,4 +339,4 @@ resume:
>         resume_mmdc
>
>         ret     lr
> -ENDPROC(imx6_suspend)
> +SYM_FUNC_END(imx6_suspend)
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers

