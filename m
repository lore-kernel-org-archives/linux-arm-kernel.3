Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C3BCCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=; b=krzzrdE+uR7Di91qWxde+NdRlY
	ND1JfJHTQZa5S6a64WiA7+aiFcyhSxzqvBr88aPs5BpUs0xMlh0obcA6+gr/ykaoMgFgn7aPLYhZ9
	Lv22R6IU92Uf9LaNOyT/edh6YIDM7NTPyYi/XdgJg45CZCCNOLgMdLCtFnK5KVJwxsCTxdufdNtNq
	wobjVTupqpxEr0rkCGBDCB5X1PsYxbypfPEZYGWwtS5RNUP6zMqBOF31Z87GY9gIDXqHgyC2BcEjc
	Q6zFCzHX4cvjOOeXNTuV4DQmxQTke2BqIqsGvs+NUNe3dmGV0QfxW+bUJmKeJHTvzdgW8SiKYyMLB
	tTWyb9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbF-00000009ahQ-0Ws7;
	Mon, 03 Nov 2025 10:15:45 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbC-00000009acs-1QKz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:15:44 +0000
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so3875803a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164941; x=1762769741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=;
        b=vPTfumDsuvB9+/amIsHwUZASgSROzUID8Rxx9eKkRjk3yFbSgN0HXPfOuLJZg1TKa/
         DLzKsoEPgB4XuGkKp89GLG3TH3lmRkHB7wG/YcAI+qLEd7OxY1bAciNdg3qzG4iBIbIO
         fPTjbJDzfqgq88EtrzI88zaJtW5RxBQtbzabeEnyeICAhmKN/mlHI+ZCq3NU0ZIovpip
         1rW0ejd4/o6pN+VRfkLW+wxnNoA2HO8hzGFKeBsArmLC9QxW5ALYSokN3TICs3Iwx8VE
         hT7MtHQ/9nFamrTl4+31MjSMEhuqDZ8nSpqO5RJzpnb/KUyatcMmiJKoovCrrn32eq8T
         1TFw==
X-Forwarded-Encrypted: i=1; AJvYcCVD1zbUWKZWWkjqGyZY0G8YGzDaQ1X9nTkFsBAcozXaUJud/3A/awxPeCLq9N9Bp0vvZocIDvumnb5TpjgSyXvV@lists.infradead.org
X-Gm-Message-State: AOJu0YxhQTthBgL4lzLpkqQU/XlvtDGTARrHxkoyZfBaEw6wxxqZH6Ss
	sRCbQwMRquooDCDtQGdxee/BDYN7nqI6xjiYaek7xsjUO+yZ7toK26Yiqr7UyU6z
X-Gm-Gg: ASbGncuSMoX9otXP3zDt3rmTOJtTvXyuqSN/04ddpgESVgUAkcn2QOD8/Hef6Uj2TId
	ntDd5RG0m0hLoJfmSBSIBALWESAs52FlryHtNsyBNuatE6vIY2msq+EQoO6/0+zODsC+Sdo0uJb
	KzdZeDwRmCOD71CFveIuYKsaZuTUu0RQVMqVQaURy5x+0333aKWSapTw6ohT2NvnMXrFWob/tji
	bmi+VdOaYKGmVZS5pcGaFCuiHzW+02qJn3/VmQlQ1qiEkEOJi0HigFLdmYGpvYg6cg/IbM6C9CP
	xRjS4xk9fJRFENYM4TpgApT7MBfpN0To0dln81ioYB1bxAcJ/N2zP9d9RfT22g9LceapAkedEad
	1YlQcAphJK1BtixO9ugpYzSfa3XtJu+AGEzALDwhGIykLTIZP0eNakhRoS8wBbBps+pZtOQJy6z
	VEeHUqFp0+ho2EWujnTO8p+azemSL4TVe1usyCLoMG+UzLNJaJtuteVgex
X-Google-Smtp-Source: AGHT+IFuLk7B8AIvoAmXjl2hcIh6Vjl87I25w2QZUNnqnR1oy+3S3szmglZ9z+0kJ5Ei0ffIMvwR1Q==
X-Received: by 2002:a17:903:41ce:b0:295:745a:8016 with SMTP id d9443c01a7336-295745a855amr84844735ad.11.1762164940935;
        Mon, 03 Nov 2025 02:15:40 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29546185f17sm91462865ad.31.2025.11.03.02.15.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:15:40 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so1620077b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:15:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA7iL+MTH260ut3iM0Y9Ob/Ni1tgKN2zy/nyoUMxSDL5kgg+pBu9tCEmZJtywxe0Y3NJ5d94A5CDVHDfEI/JbM@lists.infradead.org
X-Received: by 2002:a05:6102:418d:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5dbf031902dmr85155137.29.1762164587067; Mon, 03 Nov 2025
 02:09:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <20251102104326.0f1db96a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Nov 2025 11:09:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmxzzzgoIljXMDy5wJmHF15bg4ZKICGjY8c2_gWom3ME9XAPzMw0ghLXn4
Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021542_397061_384F42FE 
X-CRM114-Status: GOOD (  28.24  )
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

Hi Jonathan,

On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 27 Oct 2025 19:41:44 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So this is going to make a mess of merging your series given this is
> queued up for next merge window.
>
> I can pick this one up perhaps and we loop back to the replacement of
> these in a future patch?  Or perhaps go instead with a rename
> of these two which is probably nicer in the intermediate state than
> undefs.

Renaming would mean a lot of churn.
Just picking up the #undef patch should be simple and safe? The
removal of the underf and redef can be done in the next cycle.
Thanks!

> > --- a/drivers/iio/imu/smi330/smi330_core.c
> > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > @@ -68,7 +68,9 @@
> >  #define SMI330_SOFT_RESET_DELAY 2000
> >
> >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#undef field_get
> >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > +#undef field_prep
> >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

