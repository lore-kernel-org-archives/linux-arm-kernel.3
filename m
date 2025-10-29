Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E34CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=; b=EtnnPvmJgsydFQzNWAhAzlFYKQ
	/QBWBUOzfB4JnHAwTB9h2CViBP15WAwlQn9vVkYxU1GKPRrnf1WEPGtH1qHKbCm2nufMqYi4Wa9LR
	q5Yqq27lYxpd4lkQgB8ph9uvDy/TkgeAMdjZxjh/ci41gSFPaf6fv4DyE5VhEjZfWy7s6nWIhjUvp
	NlQTFlHnVbQqoTZw2IYJHeSgmbnkS38Pp03t3UnZtkzTMKTuZhqmRaOWkXghzMhMXMYBzJqh6CPGr
	qoYOT80CsTT8RNue7WkQfZXNuLkSKIGTwcUDn5lVyUD+amXzhSLUEAqV5HNeusJwNiXTmupMpnVtY
	QXp6BZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7aL-00000001gb2-1Xbv;
	Wed, 29 Oct 2025 14:55:37 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7aJ-00000001gaO-0q6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:55:36 +0000
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-89048f76ec2so812303385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749733; x=1762354533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=;
        b=Ch6peqS7vzEMXWJFMVsvqUrklRyNgZmymtZT1am9xaDtjoe8D9i4Whcidit1gHV/jF
         5d6V34J+wF83hcd1J8OXBhPcoAe5pnDluy32x3wYJR1YRowZLUSKxcg5dZcJMJ908DQl
         3EZP21tZRcLHSMFM2Hf3Ovb/ucSQyORMojIVtWJ2vGiYei/3ac2wKqov9SOQeVZFbII4
         AKUirPrizk+it+WrbhhVJ42tmV+Z4HVIk8EqQUTHQIsHuaj0LikLrTZ49C6EB/2p0QtE
         yYuLwEudeG+4cYzeUwWsfeNCOFGlXv71qxyVxsCwT4FCXK9lKBuqHfoD3Qrv95jmFzyL
         m3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVKcbz7E1Fh7ceU8YeRrtaej9PMxBYnIHBoyjxFpUAp4F12Zd9ZiMSbXF+EcI6/DyjVJHW116xt5IMkEEbRGPiP@lists.infradead.org
X-Gm-Message-State: AOJu0YzPG/iJAPuXu8fUUmZviDkUoUHVlm6a4XF+zKScHSmAbKGwQLq8
	10wrq1PB8UekjtmO6O0n+lCD9fTqgzBDq0FzjWVp+hCLXuueiNz3zkAci5nVtTuh
X-Gm-Gg: ASbGncsfoWFt4NbBdlzVS35KOR9X7zRLLuE2RarMX4ya15O4ttmcqajIy2hAxhDYUaF
	YSusKN5JAw3cArXl6R+5tqCvHJJei7HtBqGbRkw+WygchRzuOmIj1NTG8/0VYO7JXrUog8NuJg9
	y1OIWg7+a122d6306kXZP0/e4P1nLeRqM+oF3y8dA189mhg42V4fp4Ol0ZARursxqrCKV56Nnjl
	H9qVoYvMYtvsI4EGwALgoSF0nFerx1BBPRkdpVP6SPdsSp9RhYzEMFcqf47sNk0Bz5M9aF0H4o3
	xyyIQTbtjlUd54BZxvbupSzLj2qlWIcHDYye8JDLgOcqt6FspPaLeYFF4TiWUZ5eDTcd+PrKwyx
	srokFa972xqsgA17/q2yygrKKFgekOL6+RdH7YkupsgatCh+446CL65E/ht60SzU/9mvn8h2zO1
	i+Z6AjG2p7jq7MWE589m4TmfYSd6bdUl+OL03wSCYyqImHug==
X-Google-Smtp-Source: AGHT+IFDqnQqVzkueYFaqmwaf4FHIKcTqsvQ7LrTTAT0+epSoQFaLfQIdSR5iu5dGlQU8G24u93Ejg==
X-Received: by 2002:a05:620a:4151:b0:8a1:e059:ceb4 with SMTP id af79cd13be357-8a8e5f92a2amr481101285a.42.1761749733044;
        Wed, 29 Oct 2025 07:55:33 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25c8c71bsm1060447085a.47.2025.10.29.07.55.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:55:32 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-88f8f346c2cso717527185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:55:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvtH/Z4d293nRiyauOUAl1BhhR9Pwd5WgV6u5Ru5+lF7PTVJEBmHbfSnJIEpw1TucdoSpYiy/nw1qe5AJe0cH1@lists.infradead.org
X-Received: by 2002:a05:6102:3e95:b0:5db:38a1:213b with SMTP id
 ada2fe7eead31-5db90656011mr932905137.27.1761748238614; Wed, 29 Oct 2025
 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
X-Gm-Features: AWmQ_blleyKJMjc4oETFxToQhJJ0bdzSdD1fdMmRWAHt71coVgn8wIHcAFgDdM8
Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20251029_075535_249537_529D7CFF 
X-CRM114-Status: GOOD (  21.35  )
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

Hi Linus,

On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

My plan (cfr. cover letter) was to take it myself, as this is a hard
dependency for 11/23.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

