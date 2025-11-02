Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36855CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 23:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhefXJf25nlZX433BsR2ypBCZ8ChrLrkfTMoigu+ucU=; b=ZRpx45qECoG9IvobzlDwVl5Ym4
	FtnOg+3EmrVIwsx9fU5AZnKIsEzfmG2f6rlFFWBZ2lOIU5QW5ntkzPO5kAWWzL/TpKO614Fr3pxCd
	MNjFEVkHHnVWttfmx9BzumIzOk7ePeNhcDQp+LBsdJRaCpiXTdiAgL/5AZyDe9ORWlFKW/5zzog4O
	tA2m+ELResTslmrFklUOihQ0yR5qj5/f9L4RJ+D87kMHsIDyhTO6gJA3WrFxiXJR44FtvArQg4iFD
	aizagQNuyEZ73H+x0iPmeEc3b65tKMklyxf2ZhP3V9Nzgf7j6a4BGmlxRPmTgdZfzd5KNohTx2tk3
	Qw69BBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhHw-00000008vPy-2BA0;
	Sun, 02 Nov 2025 23:15:08 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhHs-00000008vOm-1fGn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 23:15:06 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-378d710caedso35467741fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762125301; x=1762730101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhefXJf25nlZX433BsR2ypBCZ8ChrLrkfTMoigu+ucU=;
        b=EBIokasvG4ec0gdxT2LaYMnzubZe6golKHEBphlIDNKDKyIaK83Rre1Ql8Bhhc9K9/
         3XZD4u+i9apUeEKv3mCsXDB3q1E6+YEEo4Wbif+qdS2Wy0FS0/Au2VXz/MRMVEJ9gcgY
         tp6OnaGeTntHQ7eACDmJaQsch4vDFoLqTuYp69VLmrSkvMcSxpO4lpSWuy/yaBXOc+CC
         EdOQCkePv/OQv6r77g3mhZpD+PFEyf4SDg8nWtbH9lIzqDfQSiukqxhnJPxpYB29zw92
         Ek4GLlXnH3BZc7vkFcMzsYiOhhWDlEHYoDukAXX6L1QysUxqySkZCfKippzoXfg7CXY7
         Lktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762125301; x=1762730101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhefXJf25nlZX433BsR2ypBCZ8ChrLrkfTMoigu+ucU=;
        b=q4EaVrRfTqqQuRZtlsa2XpCFXvK/UJr6ZhF9vI85n50yQJo8E+evU/94thdvgQ54Bt
         ID6brxrkASTMb3B3x7fyc035x/zBBuzc6vrF4UUb6ZmljtlOEHlMuQd5mBueINwUYL0f
         IzrY15mHxxiNRgjFIR8hTtAaNINtG8goiUT8dsWcqV17hpZ2MnKrWloQAELE37HlP1Vh
         +tuGA1CNz5VvcvBI2S2AsssNhpgna0nXEleQUqDqeIqH9XAZzUpvly9dU/L2AUH3v1Be
         0lo8uc4YMPYVp22seg3JmATFCnpTosy8DbQsMDUd06pB2+rLamqL7AwmiXwwc4vZRCBs
         i9lg==
X-Forwarded-Encrypted: i=1; AJvYcCWGi+20a8SSbEk0OwzzwhWoTe+gAp39RtNTWwQrzFNbCYEqGQaJ+kYgVzKZjeglNNuP4f3dP12TXCiNsjlqEcj6@lists.infradead.org
X-Gm-Message-State: AOJu0Yww/dg3HD/Ev2Yz1XbKFgb5ep8VwtgAg/N3kBmVdzU3cogM5PkY
	OtAzbGwjGbU0d08zVYsaeDNKOzt7fzulqlnP4TP45e2mlU/0gkfg4cMNfg3j7g8HT4/ZESuDF0S
	/d5d1zfqjJe/+WwJ14XJ9ZZl4KZsh9aieJRMggIcgqg==
X-Gm-Gg: ASbGncvUi2cGcCqqxpW1OlPnm8xrtg9Vd0zsBY2/Q2Au0Qhe2U8A2MSYyaSibJ2AwB1
	Yw5RicRW1211hXtkAmxKEn9FAqvhAS9/vKe9bLKDXnk+viSaOtRxxaBvWgIPBvoi2ZbLJiQEN4w
	4RKoXih4rzVYSerf7Or2nSEQhqW3BJqE+3xZzpVCPpaTvqRQAgnf2Gmg+SheCb5H+aNpiSawLRr
	aKFsb8OLm94G1MCdrwYr2PyDLY+ZmujRZFmIOxG8zQPkvzA2I3UYNbtQNBsg4uN3EdjK2qAFuAJ
	26ZKuA==
X-Google-Smtp-Source: AGHT+IHNOSftU4LA4kaZ2zit5fbsUjeer+Cqtnxd6HV9vMAwCSf0ZxvdazFj8kc8iFBA+Oyhy9hRt9pMH+krWfgjY8s=
X-Received: by 2002:a05:6512:1453:20b0:594:2646:2350 with SMTP id
 2adb3069b0e04-594264628f8mr1107502e87.21.1762125301355; Sun, 02 Nov 2025
 15:15:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
In-Reply-To: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Nov 2025 00:14:50 +0100
X-Gm-Features: AWmQ_bkG07aYa3yfLgn8mo--U0KGtThYfcOHYFtKUjSupbZy0y5m0bQWTypUrbs
Message-ID: <CACRpkdbR+5jh+OqYAU4vyUP-aQSjgMG3RRBkUTWnWz=VEy2Oew@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_151504_471641_0ED6CBA2 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Oct 29, 2025 at 3:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> My plan (cfr. cover letter) was to take it myself, as this is a hard
> dependency for 11/23.

OK go ahead:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I see there are other review comments, I trust you will fix them up
and merge the result nicely.

Yours,
Linus Walleij

