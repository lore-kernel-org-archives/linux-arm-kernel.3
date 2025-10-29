Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51755CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=; b=LclYetSc/THzgQGoznpUJMbDNO
	vDGifmD/qgU2jQRwIx9vquDaDALfXhCuH9eCsYnupqITy/syr0L9p/BJesIue2CX552ncI7jrbKA3
	9JP2fvHOmTAzpfIIMhjPgL/siNTnS4SvEqEBQ7/96/MFOXLNZpW+6Q/KHOtIVybcYCC/zIqpbYljU
	P7GT6T+B8lgqVvMmmmB0wK7kgbA8I8ibJdT8wraW3e2xR3mZNAbGe+8DRziRASXfFcN4jCTtW3jim
	5UxvE4Mn5OZFN1Lk2Me3uscudbSwOj4p4Q7eZfVj/Riz4wMUkAWEnFw8AT/wzqR97mYI5lcJwO1JW
	UM/9ywFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE71u-00000001Y47-2uXk;
	Wed, 29 Oct 2025 14:20:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE71s-00000001Y2f-1tRn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:20:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so7346544e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747598; x=1762352398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=xgNonF0Jki8kh5rWKohF9g146BOOM61PxC5aHZYdidiSZLsild1MXP4lbBr+6/h9eo
         4op0KbEPP5BNp7UNRhA7wli7iO894Wo601rJ7Bc1yaRoWxOjK94QT8WWFaHSj3H+Yb9x
         EryUKGOKRUggyveBmiZ2E/SlfB+xls5YEMiqal3EtigEqkICYM4YIQXeXns/RBOcyGel
         /a3Zmn3BN25BRyLKQdyYIGm9eVcDnzjkwSU7WJHtiIAObHINo4LnvcGl4QVMx41ANYyB
         tmx27mjuqiVwW19QqeZe2DWv3drE5zoJPnuwUuZuCiCWSbNm/3M3fIDajJ5s51sAA03o
         kQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747598; x=1762352398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=XGx4rbUlDmWlRFsyOENAZnzCXpD4HIU4r7rJ3j5AMJYG4wwNqC2G5gKC7ZYo5IEG2p
         LTTt7OTOhAK257Kb8jRAcmqNZ/HGQX0T2Dy2IokvM4uDDnCuuAjjueRMVExhDD3JzbBz
         l49h/Nnwl6PoRzk2Qun2r42WrZSJGvPd2elSTyM6yH6N4EWIniJ53U/xxS2QAAaGpwc8
         ti7YlKUhoWS/Tr2Ld3ayKzctXIbP6Z4XW3bQcVh0GRYHv0QuICtnQlvNGQeR0A+RtOWz
         R4w/n0qzuB9od37kU82ay+zYoR6bh40xibA5cIJM7nuS7Ge567YMXmhl3x/+mFll2rp3
         GkQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8nTPcWR33K2G17lVYhc2PmAO4NmC5KhunevLi/hSEimof+GSWzNZrAPfp0Ea9rI62DQObmKwElpqBd2EPKdC0@lists.infradead.org
X-Gm-Message-State: AOJu0YyTQ2Kor0vmqglEJZxGIMg2krjipgluChUtrfDSVQgKmXqJWbuI
	tDsfbjXvAjBIRfEzu1LaLUzEQYqKd38a1CSUohTQAdTRpgni6i0FKumT3l4GY6fFUaq4UKtz1y+
	KnHHW1M7amhY5nl5gFb7bOkQKP8b+UtLBS0YXAEebNw==
X-Gm-Gg: ASbGncvbWuu9gx5GblGy2VdruL+PMK+8vukxZKubZ6EzOgH8S64MJSV0PB+zgVtfKBu
	Xalnj4VtsoYCWVsqmmwY7JMz6tsRFs80nyclieABok5EpkM+keX2li+EaHW9GCSx/CSAkqSzucB
	as8CITFcPVNP4di+OZKVOJ54ustenD0xuNyFbUeFlDrG9YXKYHXzmdsNcHgOodYJ/yNAqjPue31
	N9ua+nl5VVApXJPgnV9cuE9yeP1jboPcH/hAyXY0HdZiU8gP4htbvg9xLS4/D89AuHoMmrIcHuq
	zJnSIw==
X-Google-Smtp-Source: AGHT+IG59+bQUerf6uihfCFWCYSjQICr8Xo4ZbiwSS1E65/x2rl3ls+2t5ioYCJKzMBcQXa5Sk43LYjN69G8TJb8SWg=
X-Received: by 2002:a05:6512:3055:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-594128623cfmr1174582e87.10.1761747597543; Wed, 29 Oct 2025
 07:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:19:45 +0100
X-Gm-Features: AWmQ_bk2MMp0FQz04qrj-8hmhOAMRkHeQZjiqCVvFpO75M_-67m5zTnOfqmkGUQ
Message-ID: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
X-CRM114-CacheID: sfid-20251029_072000_514162_9E7934FE 
X-CRM114-Status: GOOD (  11.14  )
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

Hi Geert,

thanks for your patch!

On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Do you want me to just merge this patch to the pinctrl tree or do
you have other plans?

Yours,
Linus Walleij

