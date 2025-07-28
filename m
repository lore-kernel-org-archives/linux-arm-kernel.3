Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27804C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teGULzlLhQelXQxFvtnY0vIFSRRR6DL2DW3iUjOhfaI=; b=Fg99OwXjQazO6yGqEhfyH/KzJf
	6xoCKUv7wXDx6iH+D7afJGD7tc43ch/Lx104WmiZwgfEPiP1tIH0jok0jjG8amC2fB0GKGQAUfGHQ
	yJaUzLA7tWJrfBDcqbbcm62FKZVVKxTgv8vlGihjOASvsDFBJ7GqbvKIcOjAJNoFgfl+JVL3wGZUp
	NSbCaHehrD1oi3/+HAU/GIMicAGlxjil0N+11a20QF8nb2wQMmTbRFH5p4IZCin8aJbuMExNdkGDo
	FsbypnQgF9vh3+q3pHd9bXy5ph1I/Vq3PABYMZpPhsB3ao1WFQtKLcV2QkrGHF6+SafBVTeAusObd
	YztGqS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPNO-0000000EkcP-06YW;
	Mon, 28 Jul 2025 15:02:54 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPHk-0000000Ejrl-19hP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:57:05 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4f133d4c615so1498631137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753714622; x=1754319422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teGULzlLhQelXQxFvtnY0vIFSRRR6DL2DW3iUjOhfaI=;
        b=V5fccOz7SSEZ3B5xdCD7VciuEtX7X6gut1DymW/moL2YTjHAfyYHM+uz6g7zOE2y3c
         FSC3ROelUiJ8ZuKORiJGFe5OJziAKlLd875EthLOPqdxMG5bp7fjvtQymK21Gua7mAH2
         63nPRMeU1yglUv4VHmAb+fSVZEBiso/wGXzupBg+yViT1npbWu1h5oekgs7poFbLeA2w
         Iz3lg9JQedBRpI7UL3sfLIhEDwY6xCjKGhmtjbuZuazn31wk2++MQvI4ef0NFbYHSrBO
         qKVYyUNIdxzRPh4xunl/ADIdYrCtx8LHkqesAj0Tw7UoA5WE3/IwnSUJRu2rliOtlmQC
         PMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn6SIfwijEbcWzkfnWS5BThW5PGru6q4qpGACqn9MlsrQZQlhN2q/yR2UBQoGg86pp00zB4dI6UeopxXuKJxtC@lists.infradead.org
X-Gm-Message-State: AOJu0YyOudB6ZP6zF85OqgqzqBdopzCUdB6pT96WCHCdFxVV929E76Tj
	NbVM98CpJ8wav1KAncCVbtTAEXaR0S7np+LpqsztyQ8Zq33vXgyCyCeAVSVLAEbO
X-Gm-Gg: ASbGncurwE8f+L9i6HLS77EJKwtdjDpVW6vKna8yCb/3g+TmAzGfqY/xmrqbsPZMdaQ
	lbDhotX/lFybRgzvINKoBAdwzaiNsp8miKrhYhCbiIJK3QLoerPvobvDw+CungsPEUzjOJiEday
	0uD3xp7H+UJEKIQF0WA3dKaveSZMciD+90Z4xlYeycjr2L2l2YdNQmmlsg1pgKGFKuUf2qJyL+k
	zaxefYlnpO+AwhVah+Ar7ZM/xSZCKsv3qP1jX1eMUVl16q82jzE37SJubli7QrEpkn3CdXpLoHX
	Bf4Pvvp3FV6mVSrsL08bYMLLXWmfl09pI5SuPDruUfvhig/u8ib1wq/1y+Fwa0CzVwy3Qyd7+1o
	OPwP5Yrwlb1zMF/u09CdrT506pfj9EDR9d/bsS4qu6S+/fYsfuoiYbNZJ2Kkq
X-Google-Smtp-Source: AGHT+IGhmt2qXRkHJujuzUNSWdF/PodmdVmpFbuYlDFJlB07ehe7BIANrnFlbHub8wjIOcoidr5TFQ==
X-Received: by 2002:a05:6102:fa9:b0:4e5:9149:7cb3 with SMTP id ada2fe7eead31-4fa3ff441a2mr5033522137.13.1753714622338;
        Mon, 28 Jul 2025 07:57:02 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8dcd50cesm1310175241.15.2025.07.28.07.57.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:57:01 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7949d9753so1503471137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCtQEcyF2Dc0XNcEAiC+eYvpfRfE/auFuQGYFtST8O7nrlf375X9upTCfnf/nOSQjPN9lt232dBibzH0KkfySR@lists.infradead.org
X-Received: by 2002:a05:6102:3053:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4fa3fc4c5b4mr3860343137.5.1753714621079; Mon, 28 Jul 2025
 07:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Jul 2025 16:56:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
X-Gm-Features: Ac12FXyEDH2NSp2bCLnd8Wr6kjCgr2iKQZxQ0eQ7QGuMAe4WKYn1g0GaAKVr-S8
Message-ID: <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_075704_312030_5F9D9836 
X-CRM114-Status: GOOD (  22.19  )
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

Hi Morimoto-san,

On Fri, 18 Jul 2025 at 04:09, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> In these days, I got a lot of compile error about frame size on ARM.
> like below.
>
>     ${linux}/lib/maple_tree.c:3818:1: error: the frame size of 1304 bytes is\
>      larger than 1280 bytes [-Werror=frame-larger-than=]
>
> I can avoid these errors by modifing like below
> (The new size is unreliable)
>
>         > grep CONFIG_FRAME_WARN .config
>         CONFIG_FRAME_WARN=2040
>
>         > git diff
>         diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
>         index d61369b1eabe..c5173bd82380 100644
>         --- a/arch/arm/boot/compressed/Makefile
>         +++ b/arch/arm/boot/compressed/Makefile
>         @@ -80,7 +80,7 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
>
>          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>          CFLAGS_REMOVE_atags_to_fdt.o += -Wframe-larger-than=${CONFIG_FRAME_WARN}
> -        CFLAGS_atags_to_fdt.o += -Wframe-larger-than=1280
> +        CFLAGS_atags_to_fdt.o += -Wframe-larger-than=2040
>          OBJS   += $(libfdt_objs) atags_to_fdt.o
>          endif
>          ifeq ($(CONFIG_USE_OF),y)
>
>
> Is it known issue ?

Yes it is.  And it is hard to fix, according to the maple_tree maintainer:
https://lore.kernel.org/all/troejyyno7oiokx4njv7cbahwhkvkovlopj2igwlsexxqmrmaj@f3cjalwkpvf6

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

