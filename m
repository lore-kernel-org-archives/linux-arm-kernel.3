Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=; b=qve211HuHpahVuHBNh2psv4LiU
	XwTAlFH4jJIRKTi7PHYpOWcVHieBM7HtU8LpQlcwQDmP5vWB9hhHAJkcHK0jJxuvqgq13jly17bWs
	lT0B/PISoArU9bRDhxxmCBIJ4TjTWqYjvcMElyMXYf+rjRglHpPcOBCUvc09qpjLPY2IPsQ8aE93B
	/FTw1euW04/Ox3YrMVd2HKQzNY5ZuDXO+RWTZQ/AbUBv0X2/WW+LL1qbJ2pv+PF/qciRwkO+be0LO
	cXeKCeHoxWk9LHLGtEsYazRbFWQ4uLYZ7+vTx1YMKciGGOPXhP5rzrZ39HR+nYK5fDagWp+lDD5p6
	oXZZsw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme6X-0000000Cmaq-32oA;
	Wed, 22 Jul 2026 21:03:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme6U-0000000CmZw-1tPP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:03:48 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so1006760966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784754223; cv=none;
        d=google.com; s=arc-20260327;
        b=OUWXpI5KAj+ckScor+5xKxijpp/oyhw8k/H8DYCiRurk6tHv1xsF+xKdGreg/so/pz
         b019oaATO5IJ/oZFw1ntfSGWFh4G1HuzWhCu4P4TvclEwEE4Z49Ps1C52YJ4mH4x2zGw
         WywZnwaywOsf+e4zYi6bR+oevjlSxE4AlTwGvfqwytBi+HTn0NTOsfONZFgY8GdoqF3Y
         yQVV2W6ShLMYAGVLN2tGtnboOkZTZfRpgRgyN7klaloZOtvvdgjGo6SyEplFqnyzrfah
         Yo9z7A6nQKteCIH3HzFMOqa3LB+si7ImJk+lkZEYaka62dkBvsDVatEOGQMvpR3kq8tT
         YScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        fh=qBVrYrRvo64uwtJQzZH1zFGtOZY+OKFnCmMvXuU41mk=;
        b=Hz+UMRKUN23mIg/AEde+5Qwh7dDdf2xx/thBc6SXGmgLV5BfM85csobiOhhMdx1Gj5
         g6W04i4htqzj9FxEDmtPf56Y4rMracs7yYtSD5zrNppzAzGOQdKk63+dOXHTy62z8RJ1
         WHkghaEYgHCee5Z7cfRBUu9gVx5O2UnaZ2LjFzXmeh9mcxvCYczWeTtHbJXAWsyxAmv0
         pFofCbFWNdjFdNg/oq0UZbtmKMtAygVXEAGm1EcMCla/1YlR47u6i+qN+bWObFfH9atF
         kVJ7jkQnrT0vm9Mm3dSB8bwHhYgMswNVNk1A61zghKVGDsDJ0ZCLK1gh6ah/jN2fT7N6
         4iBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784754223; x=1785359023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=duvywlyNWMsGiCzJnXfDcS3S/JKJnrLq3wBRkIyunTsQrV9yP1BFo/bhOxVbmqqQU6
         q4hPZx/MQgrPPd7aJToNwmXiBpp3uj31XXl7fXze+3Oki027EjnDMMQQdhZuiIuR56I2
         I1hoBdhX7bfCaC+xoXIzXwFFk5Xd8ASxdI0v6l+miQmVW5jnNiFOTO//c3oicC2BOQ0d
         Pz/dN3KhujmeN2BVy3hBotM4LMjnIe8jbJ7NunY7amv3p8Vdax1BDfSS6iRcHdo3Dv3k
         xwGb+5YI2HZmxhF7FN3+GWxTmcgH3l0Fl90+l4czTgv3NDvJ4MNs68u4k5qg7XHZmzIS
         aYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754223; x=1785359023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=MapHV6UfscDdWBw0+gdvXzxQnN541k+aPLn2PVAGWLyfclRsNX4zVigRtxDKqZ56vZ
         PVDmOF8SE2u7AQGQC8U1lS/uzSfcSFim0Brbmu4V9TOLW0EANvM9USlrNg0H5PXySqd7
         dO6Nm2hl8Wg76CRE1gQQz79J+d6Dhoutmnjc9S2czN3UY12DqQ8aY/uMfq07S5C8XSwS
         /PGER1c6SVJzy/t5sjzt8hB5kZkxyBavABDvGrnlPYxs7/471R/4/f6aedOzrPNsK7hy
         qwj+9fqlIZDjZzwzocL21PmR8DHGbhadkkzEMOqMVlH506plu6U5fGtOFBK6U/yrV2pk
         fv/w==
X-Forwarded-Encrypted: i=1; AHgh+RrmCgzXBWXIPPramSbk19XEwNqU7szT81nvNx9VrDXcGaQ3GIgcCNql5Dl28e/5XT/jHam6wLY2/9wYQNBKHyzJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzUWR590U2bRNTF61WG9p2JMWS5ZE7sOpyfRloXEcES1AtAobC4
	JwEDnwyWoX9jhzwwdLFAj7YnpVFoQ6ZeOE4pGEJhtTKpU6O3E7s34xApAklckpt/M7zE8/4Hpvv
	0eo1w2fts8xJVj6+2PL3ZI2nnPB/iJagD1jCEbr/p
X-Gm-Gg: AR+sD111VPRf3r2rcLvsipdl34aK1TiSE99ea86uNf/k+xGsNW5WzAsWBugwZja+u2T
	cpb3UokHww7VfnAQW7dzbdT9YDovczksSmBY9YNSrBYIkQbtnjVfaHr6r/1zPvPXEXdaF4AfRG9
	YpEhVIFmyJSJHF2OhoTPEbHo/amR6TtRJ6rEzjumGwiIIgAKqTtmu6H7IEExs7dAl6xbVDP9C21
	p7EUnAfyVY978RVWvGQMFvcU+8u5D61fOrMIF1dymXeODnC/Ddo5CJ3cvdV9mkgHQzpLLIApzF5
	fXJYkNWwv+d5Ieh5nUqGxxxRo+7ED4eb1riR/Qa3GuU/tsyRbc36bBZUGbkfisLajkvTe8E=
X-Received: by 2002:a17:907:7245:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c1c507c5992mr22090766b.27.1784754223030; Wed, 22 Jul 2026
 14:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260722172443.534251-1-akkun11.open@gmail.com>
In-Reply-To: <20260722172443.534251-1-akkun11.open@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Jul 2026 14:03:31 -0700
X-Gm-Features: AUfX_mzKunA_ErzQZrqRUgnl5wCMQPxyOcP43n29TIvcYdToB-p2ggVGLa6Vk7o
Message-ID: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Ard Biesheuvel <ardb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140346_519933_EF067B00 
X-CRM114-Status: GOOD (  27.60  )
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

On Wed, Jul 22, 2026 at 10:25=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmai=
l.com> wrote:
>
> When building with CONFIG_THUMB2_KERNEL=3Dy and Clang, secondary CPUs

Specifically, was LLVM=3D1 or CC=3Dclang or something else used?

> fail to come online with "CPU1: failed to come online". The address
> written to the jump register has bit 0 set, causing the secondary CPU
> to start in Thumb mode.

Ah, yeah missing those is going to be a noticeable perf hit!

>
> secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> expects to be entered in ARM mode in order to switch to Thumb via the
> standard sequence at that label. Starting in Thumb mode causes the CPU
> to execute ARM instructions as Thumb, resulting in an immediate crash.
>
> Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Thanks for the patch. Any idea why this isn't an issue for
GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
need to address?

There's definitely some difference between clang and GAS here.
https://github.com/llvm/llvm-project/issues/211376

I wonder if perhaps a better machine-agnostic assembler-agnostic
assembler-version-agnostic patch would be something like:

```
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index f22c50d4bd41..687ee7063a73 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
 ENTRY(secondary_startup_arm)
  THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
  THUMB(        bx      r9              )       @ If this is a Thumb-2 kern=
el,
+ENDPROC(secondary_startup_arm)
  THUMB(        .thumb                  )       @ switch to Thumb now.
  THUMB(1:                      )
 ENTRY(secondary_startup)
@@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
without using a temp reg.
                                                @ (return control reg)
        ret     r12
 ENDPROC(secondary_startup)
-ENDPROC(secondary_startup_arm)

 ENTRY(__secondary_switched)
 #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)

```

Can you perhaps help test/verify that Akari?


>
> Tested on Lenovo YOGA Tablet 10 (Wi-Fi).
>
> Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
> Assisted-by: DeepSeek:deepseek-v4-pro
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  arch/arm/mach-mediatek/platsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/pl=
atsmp.c
> index 6b0943d95555..9a7c65fc3ae1 100644
> --- a/arch/arm/mach-mediatek/platsmp.c
> +++ b/arch/arm/mach-mediatek/platsmp.c
> @@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned in=
t max_cpus, int trustzone)
>          * write the address of slave startup address into the system-wid=
e
>          * jump register
>          */
> -       writel_relaxed(__pa_symbol(secondary_startup_arm),
> +       writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
>                         mtk_smp_base + mtk_smp_info->jump_reg);
>  }
>
> --
> 2.54.0
>


--=20
Thanks,
~Nick Desaulniers

