Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B03CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=; b=BB7cpc3cbOFCIyJUZLK6DdvFrZ
	uw/syb09Yqwb6I9u0VcdIaDP9kgURLk5+R1eFc89SrTDhamtpYzNCZmGufrBoEDF1pOrhT6KwQGMw
	lcSxjV3nWb3P3mKNIffHrWSQktx7aEDZ1zwJGbp/kVb0VS2700SUQxk91DtRur+Mo+lNTsYHZ1tjg
	b/GLlEbWZWfLKtalZgz8SmPHuB2LV7yR/MsY2aTH/ca6meyvCZu26qq+93TKVsVSWhp97zBa1dxtj
	HWCMqnn1+/Cu4ReEWXcwvORsJSU4+8uwpbfFfRzC8MjvHol6RbJcXyt+VxA0A7Vp1lqF/2RtxM5KF
	IKLk48yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE73d-00000001YWV-3qHY;
	Wed, 29 Oct 2025 14:21:49 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE73b-00000001YVa-1dDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:21:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5930f751531so2405407e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747705; x=1762352505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=AQ8k/m671N8yDNIM90sSmTGVQkoQhZGCiy10tU1LfkZYR672Hu1OqdY1JZyUiiy074
         8stjbeONYbVl9pVgqzuNlys87J6HTrWOm616Kej/U8SkAJoJdYXxu08NJFs0Ka6Zrvsa
         iDMdQosTDMS7b11PsS1IAwFZe8JCfQpJDK7h5rRg2wk2VM/XMiqWD7IoV8eZadR72lar
         KkWakC7gEWqB4NZ4WwHcb8UJCY1m/ZYGfqVWRr5DGzwBl/VRyg3GfmmYIVlz2KzEevUm
         T4C96ol6ojSpnAtP6Npkm9RtXiLCWwJ2l02LqfdsWaI9Wh9ENUcxLO/rxTEBPaa55Qka
         pxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747705; x=1762352505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=cM390tyHmsMzyzMWUwT3JzY+iDKQn8lFmCGQAJjLNas9n3rgxFsefdXmkXGGHh91WY
         KELOLC0IuYw1dXAOd9HKLqXipGq4deUsKgeBZePz64GKgTfVz5oek8Oe5FLeDwXrd56H
         Pnger6Xp2zC4zwl1AE2GoC05Pbot8dtWyzAcRYQXjP1hE0yFx7oC4JB75XQep7eOHauW
         XTgx4ctDO9BdqV75Ks10lZKyYDPq3lTjFfxnjuIrTYcpj+5Qe2gx+YoN71Dzfhj9DbSM
         Dm6Nv24sEMC0BWmWN8J0eVhv+KQH4AyNeDrnjhs23Ujrk8SGvxHnAFzYf5BRq/S3crDd
         17mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlbfEDDlvC7OvNT+7HhL8znUqpe35rE9Isw0oRFbrOXpXId8EMvnjtjvuMBhMcJ10L1yCZdXskstJH0avCJXNR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Ows6b+mtsfCEGRsaIvVPY+wNYCw+dVm8IQxMw348gmQuIRze
	9yexSoo5PRE+6uiQj/G2/Ep64LyrZI0M0DheOuFpx4vhL7GJQ8RIA0O3OO23niOOCyXGvMKJSG1
	izM5wNnzF4f34Tt+09rNSErAuOE1Zr1NkVvkvPrC5Zw==
X-Gm-Gg: ASbGncuOL3Bi/US0Ep5czuVQ+xNrIaSLKRzEnhqROkHXaUQhDutO8iP4GFhjANNkiwy
	sUkCyPGdk6twIPglkH4iOFaDu/4Camm+SxQpTkk7/cOUhk3zJXybVrzUsmooMH1QU+dRUyeQFWy
	ZCPQZsJloFhlZIcRD/81FQZeGX20OXXsBha0dA0+VqqIlj7smGxRRevhmKzj6j/IJSOY6xDvMrz
	+HSY/Srn+HoPlnVmhMvSH4fRRolU2sRPd5rBx6tME+uEEKJchKPyBn1yIHy
X-Google-Smtp-Source: AGHT+IH/WV9TTRDue/YlQPKqZJ/rOmSLCumqELYgQ//HXfU7luOPdKKEVQrj3vn51BUY/zZkRojEs9B5VMPxZwJpOnE=
X-Received: by 2002:a05:6512:238f:b0:592:f814:3852 with SMTP id
 2adb3069b0e04-594128b7bd8mr1157709e87.20.1761747703432; Wed, 29 Oct 2025
 07:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:21:32 +0100
X-Gm-Features: AWmQ_bn0qj1HdhGI-E5owVSGvqmNxBgXc48MF5-9CHRtkVWKXcvNelNuCdps5kE
Message-ID: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
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
X-CRM114-CacheID: sfid-20251029_072147_453023_305BADE5 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Extracted from "bitfield: Add non-constant field_{prep,get}()
>     helpers".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to go with the rest of the patches?

Yours,
Linus Walleij

