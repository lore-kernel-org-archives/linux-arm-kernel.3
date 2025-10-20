Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pomt2ITXhIHlFit8dq3w5svz3PMdwi8h98cx9ZzxHC0=; b=iS1Ht9aO+aJGLlv+CJQWogdlok
	QSeHH3OguW0Sks0MmbzlL07wgE2SeK5atJFhC3rZkmtETQCaMV+swDveZCj8pG0rf6weD/Rexb4LO
	yIwvpOGcgMPn8TKheFINn77ianEjg0T3GnTml+762lr1bB+2SS6fC7VN8Ri5iQ+0r6T6sB5R0tkhZ
	DPAnGN1S7uvn3cs3Ax2LkvRZ3tCdajrEzrzWwomnomL3ilDq6+7CA3AHntqP6TuK2slWwq5lTs39T
	/JYluzBKlKrQah9d0LmTE3jfFxPt/XsPMPadw/A8dpCkSN2UP5jvmu+kQZNfOdIpNkevk2itSyu0R
	1oJDjt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAolk-0000000DKVr-3lsD;
	Mon, 20 Oct 2025 12:13:44 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAolh-0000000DKRa-09Md
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:13:43 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59dff155dc6so2120957137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 05:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962419; x=1761567219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pomt2ITXhIHlFit8dq3w5svz3PMdwi8h98cx9ZzxHC0=;
        b=okZUNvgjpv4th0FDMpN2n9T+rtYeT/ujXrn/at8rJAI44ZhlRBJR+rIB8XhSqqdmLk
         PswCRc3Am7I9aX5u2/qMLcwpkjHjVVoq15phr8BSzq4mltUeyYn4Li09NfX/ib9RGnnj
         /FHHO9JlaTHr2P61E6M65Pwq6m5279k9x3MkdAzvWIza1bDk4tVik2GWDuMnG2Ac62+Y
         qLlQfc8cVmuMVc2XmdCBTgE0abQ0ydN3uIVbMz+aNIxQXx8up5vNwgroc5kQ0k9ufr+b
         ceAyFdYCBG1+VfcUIEtLnM22aHnFA/Lob3JQBAYp0LmH4rAXDt0SG3TeWD2NR5ute62e
         tPcA==
X-Forwarded-Encrypted: i=1; AJvYcCUmADNvQq6eO+K05j1+Cf1RH3rFMoFsopxFk3XyAcO2uJQcM5VSvTVxszim+kb4U/oDvO9UaPCEg1RRpLKxLXgV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv1IhxHl4Mj0+BxrXq3UD5k+4zkWqB0o1XX7OdYfuEUew3Du3D
	MrkJPqv2ygfmEYeVClNF+eeXgBPkrYnvFWCrSTu1hePu4nIBp0SZuxVYjBI/CPRe
X-Gm-Gg: ASbGncundf8eQBksykO/AkTvH165sCLs/OJ1nAgTQnEnWh3zBZkCT2a6NhIMyhqGhtJ
	wo8IEy4AZ55rx6kDz1j0niA94H+yy8LU7eZyoHHgw1bWyZgKMjgwkq/vSGgXm2FyvyApuPt4aXb
	1Zf/VqkVCLDdG4ThsYpaXW0K5Pqf235i7SPJdM/V8YS1A1BaPNpWO02oF8ooX9nGNmiIZqM5vFH
	g6a+BCqtgxO3t93Z1BvwjtIr8PimHR9wRyUzJxw1hD7uBRz4Oa10HxdtZdXiDOTK7rKj9pBMPi/
	5kvhxUXyPm4ay4vfefkJJe3qh5caWfVPDWQET+LFSF1FT9gcbd5el3LjxrEOpk1GiuY954/GqZU
	KwRWi8kY7ZMw6wEAb+K6HYu+89e73/ODNycMaqoqDv0mKcx01yzftum4ArvJ3iMge7QgTqGfnSL
	1QR8hTlQUfIgK0YfG+GMhBZlVsbG1XiuhYP9fdcY8U2Q==
X-Google-Smtp-Source: AGHT+IGfN7tHyqmtqpq2bFYABZ0bqWvezYzus2IJk7IQL0P+N+NOigxaVZwOF9PoQ1or5/0U9bkXaw==
X-Received: by 2002:a05:6102:162b:b0:5d6:12fb:d188 with SMTP id ada2fe7eead31-5d7dd59d57amr3741316137.18.1760962419118;
        Mon, 20 Oct 2025 05:13:39 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3d855a0sm2391808241.3.2025.10.20.05.13.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:13:38 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5563c36f5dfso1655968e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 05:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKP5I14vqe7sGfBQ2+Qa2dgMFBGzLHWqk0g3WkVEX9NS8hmzWWLH4W8sEt2vAt5HN+93sqFoQAu6dUGvh7oHFU@lists.infradead.org
X-Received: by 2002:a05:6102:50a2:b0:5d5:f6ae:38ca with SMTP id
 ada2fe7eead31-5d7dd6f4c27mr3609494137.41.1760962417639; Mon, 20 Oct 2025
 05:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
In-Reply-To: <aPJwtZSMgZLDzxH8@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 14:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
X-Gm-Features: AS18NWDS1vbUG4-z_--VlQ3gjSspwjijy0fs8EPqX7O88cWCZQUNQKHTmAYei1k
Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
To: Yury Norov <yury.norov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
X-CRM114-CacheID: sfid-20251020_051341_433312_12DD6BCA 
X-CRM114-Status: GOOD (  28.18  )
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

Hi Yury,

On Fri, 17 Oct 2025 at 18:37, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Oct 17, 2025 at 12:54:09PM +0200, Geert Uytterhoeven wrote:
> > There is no need to prefix macro parameters with underscores.
> > Remove the underscores.
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - Update recently introduced FIELD_MODIFY() macro,

> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -60,68 +60,68 @@
> >
> >  #define __bf_cast_unsigned(type, x)  ((__unsigned_scalar_typeof(type))(x))
> >
> > -#define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                    \
> > +#define __BF_FIELD_CHECK(mask, reg, val, pfx)                                \
> >       ({                                                              \
> > -             BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
> > -                              _pfx "mask is not constant");          \
> > -             BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
> > -             BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> > -                              ~((_mask) >> __bf_shf(_mask)) &        \
> > -                                     (0 + (_val)) : 0,               \
> > -                              _pfx "value too large for the field"); \
> > -             BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
> > -                              __bf_cast_unsigned(_reg, ~0ull),       \
> > -                              _pfx "type of reg too small for mask"); \
> > -             __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
> > -                                           (1ULL << __bf_shf(_mask))); \
> > +             BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),           \
> > +                              pfx "mask is not constant");           \
> > +             BUILD_BUG_ON_MSG((mask) == 0, pfx "mask is zero");      \
> > +             BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?            \
> > +                              ~((mask) >> __bf_shf(mask)) &  \
> > +                                     (0 + (val)) : 0,                \
> > +                              pfx "value too large for the field"); \
> > +             BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       \
> > +                              __bf_cast_unsigned(reg, ~0ull),        \
> > +                              pfx "type of reg too small for mask"); \
> > +             __BUILD_BUG_ON_NOT_POWER_OF_2((mask) +                  \
> > +                                           (1ULL << __bf_shf(mask))); \
> >       })
>
> I agree that underscored parameters are excessive. But fixing them has
> a side effect of wiping the history, which is a bad thing.
>
> I would prefer to save a history over following a rule that seemingly
> is not written down. Let's keep this untouched for now, and if there
> will be a need to move the code, we can drop underscores as well.

Fair enough.
So I assume you are fine with not having underscored parameters in
new code, like in [PATCH v4 2/4]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

