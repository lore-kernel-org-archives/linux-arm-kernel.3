Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB33CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg8UhYyfIcptC8xMkqg0NZVGQx0oq9KUEmx/oB+LJ1Y=; b=19G1zEH4mV3El4e+yM4wnKdcsJ
	VI4fTUBSIO0a7qEmamMTVHkaq775AysIBo1gd6ERopRpRHjp91EuBmynLxi/auKoHF4is7MGk0S+V
	jDcv4wc983E2V3ha+2UIjHJmXo0JERbNZPhT/V6jblvnPywy2eW5c/NDhSAaG+TPcIl0KwCBiqDxj
	xhvHuSOBqEZeKsvHrBvnjvPbmqLoLv1xCWUoDUsVGMlFSFhK/6JrM7Em0XjNrlvg2DWwG30pVeQXV
	XyB/fz1J3qoIhkUlpIJpPR6LDKNbZgGHxqLDy5AuixKBFA0NOqCS7i33q5vlNbFn+ImqgE8zTpEMM
	b47jnYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJunb-0000000CNWM-3Pav;
	Fri, 14 Nov 2025 14:29:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuna-0000000CNUp-1b5s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:29:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b403bb7843eso390863866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130552; x=1763735352; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg8UhYyfIcptC8xMkqg0NZVGQx0oq9KUEmx/oB+LJ1Y=;
        b=RKClVgziXcdUM0RAPJHSiWwr8K+Wa9S902Azd6ILTG3KdtEifajpOuYnZibUnjIhkw
         Lkd2I/VkL/MvxTas3nLmnbUTDkJ4UR4qhqJ0tp/VD8kFWO9TwZsw4kzuHbQ+QxNEJKQg
         TkdDvIsq1VV7a0JkvuSVEmFcpRWK7dQIOhiy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130552; x=1763735352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg8UhYyfIcptC8xMkqg0NZVGQx0oq9KUEmx/oB+LJ1Y=;
        b=qDraFjBogMeii1N+cLH3meszMJppq7RVVMTaX2U8ELRy+yRl/9dgzvDCAqvab0BBa5
         f5B1mUT0wfIUbQZqCUsmvS7Zx1xT8KGCwGJ0T1u0webbZIuQCgJ2iUjJFtuMu5T34yeR
         jDu+cBTJ8a9AXcPOGx6xaLRTbU3xJiFiVJDTNVZacY2F2UB3qqfT7LlAqBH/NbIOYu7v
         pN4g1bkgI0v2nLHhj99SHV72TR0llmy23QedPx00CspOvB935HdUZrVJqex9oxVMIpf/
         sjR8sx3OudFxNxVwCy9wh7aDWK3oW9UzPFWhZ+pbN9b3BVD1FRX0iHoxrCBN57rceud2
         ctMg==
X-Gm-Message-State: AOJu0YzRj4SORh1hIh2AQEYSWUwNucgLCVHQ+bez0RlcfOKjANgnYXuh
	3mkU9nEWdqFMDXr+U2elaRU4afFDsHwBvJq8gGVLiUJmDHBNIrgiKg2+9dTsuo1iVVzsI9JcoDi
	FaWbNNM3jgyQ52mxeQrIYLN+vc/03RH9okXBKMSYlnq8IPZfE//M=
X-Gm-Gg: ASbGnctD30RGu0TuVmplje/i9QtiaYw+0XJVTbBrKaV7r4NhuR8H0eL4jg81fTr6aLc
	lRljViba6E1iqc5AVV5Cg/Nw9/h2mbXSjVxBgMd61YCeWG+jiIT9/rZD7fkacCxVu1rVfv1l4GE
	NrgdIShNiXtWV1H3a434xXFO2/3SW85RnyQ7YKIy3xOclka4wOMYSATWhP3PHDaDJwfqLfcdqyD
	btjJz6Fg6H0/b0KGYiMCBYX5OacazrgCWWR/T0gX1/h9AGhvTuXeabshRKmBtIG64jGzQCwje7M
	WVInjeXS/gQjl5Y=
X-Google-Smtp-Source: AGHT+IEQrcEjm+EwruWenAD1SgftvhKZnuypLhuDVZI95EhaYlc+y/sSIShAmiZrhKlBtwl5CPR0wrJpmGlKlp8F3Xs=
X-Received: by 2002:a17:906:4885:b0:b73:6e0d:4f6b with SMTP id
 a640c23a62f3a-b736e0d5e13mr150352766b.36.1763130552454; Fri, 14 Nov 2025
 06:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20251006230205.521341-1-sjg@chromium.org> <20251006230205.521341-6-sjg@chromium.org>
 <aQ-zXyOr2FPz2V0Z@levanger>
In-Reply-To: <aQ-zXyOr2FPz2V0Z@levanger>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 14 Nov 2025 07:29:01 -0700
X-Gm-Features: AWmQ_bkevTI3W156k4lC19DtSJXiQDIHESMbZpsCHrIX0hT8ilR8Z93eB4aaz1A
Message-ID: <CAFLszTgCh7GS6yoJB53zf+Bw8_72F5DyfnvgKD8-bz-dbW6L-g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Tom Rini <trini@konsulko.com>, Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Rong Xu <xur@google.com>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062914_442722_971B33D3 
X-CRM114-Status: GOOD (  24.61  )
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

Hi Nicolas,

On Sat, 8 Nov 2025 at 14:19, Nicolas Schier <nsc@kernel.org> wrote:
>
> On Mon, Oct 06, 2025 at 05:01:56PM -0600, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> >
> >  arch/arm64/boot/Makefile |  4 ++++
> >  scripts/Makefile.lib     | 10 ++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> > index b5a08333bc57..d10c85f96aea 100644
> > --- a/arch/arm64/boot/Makefile
> > +++ b/arch/arm64/boot/Makefile
> > @@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
> >  $(obj)/Image.xz: $(obj)/Image FORCE
> >       $(call if_changed,xzkern)
> >
> > +ifeq ($(FIT_MODULES),1)
> > +.PHONY: modules
> > +$(obj)/image.fit: modules
> > +endif
>
> This does not work for me.  I tried:
>
>     make clean
>     make image.fit FIT_MODULES=1
>
> but modules are not built as KBUILD_MODULES is not set in top-level
> Makefile.  Works for me with the following diff:
>
>
> diff --git a/Makefile b/Makefile
> index d14824792227..e6b8bcbdb073 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,13 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += $(if $(FIT_MODULES), image.fit)
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..f7f0c144908a 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -174,6 +174,7 @@ endif
>  all:   $(notdir $(KBUILD_IMAGE))
>
>  image.fit: dtbs
> +image.fit: $(if $(FIT_MODULES), modules)
>
>  vmlinuz.efi image.fit: Image
>  $(BOOT_TARGETS): vmlinux
> diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> index d10c85f96aea..b5a08333bc57 100644
> --- a/arch/arm64/boot/Makefile
> +++ b/arch/arm64/boot/Makefile
> @@ -43,10 +43,6 @@ $(obj)/Image.zst: $(obj)/Image FORCE
>  $(obj)/Image.xz: $(obj)/Image FORCE
>         $(call if_changed,xzkern)
>
> -ifeq ($(FIT_MODULES),1)
> -.PHONY: modules
> -$(obj)/image.fit: modules
> -endif
>  $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
>         $(call if_changed,fit)
>

Thanks for trying this and for suggesting the fix. Indeed I had not
tried the module feature starting from a fresh build.

Regards,
Simon

