Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EA3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+/2I2hmbkU9zkmHuYX1t9oqaBOTTvF7uTNap3Wsbsk=; b=1enPb7cMR32ViZhL+W0FX0fe6H
	kx6SfL99CENSWxQ9su15PnLo/qFq0/q8WvgJpkpa/DjNw8Q1FMl3c+aTAFJwBY2Ohbpr0Q80XY9N9
	vYxGKj37TDsddkGKQgOXsNglpk1Lp++n32f9rMv0Z8ktgGRBV3bHqGZRHj/86/SqRLQE3Ex1gEyYO
	McW3nyH6Us2gWOaMSGDMozalgsEYNA97gGHQGZaHcQIRrU/GypbWZs3q7+Zit/q78ayVnVEAQNdqS
	s2hDBDq+Boszyh/odnFzK3Yzr09i7r0RebBFDtEI9/gBWIqWEH7FWF5ps53jkAqsBWkLUSqGJ5QHZ
	4OKFSY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titVM-0000000EbhP-3Id0;
	Fri, 14 Feb 2025 11:05:08 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titTu-0000000EbR5-317I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:03:39 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso729672241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531017; x=1740135817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+/2I2hmbkU9zkmHuYX1t9oqaBOTTvF7uTNap3Wsbsk=;
        b=SclsaWUPAUPhWz9+jCf8GT+GtJGaWtBIMe/m8uCjvog16X6ohTyTM+QHTAfvlTJM71
         T4rHm7Am5c3co/xVWMn2rzt0qXA6YjUoDOpK6HR6ZnDuiHZr9B87V345h9KmKMn+SzVw
         CVOigbKt56T+x3o1z8Q4QS2nfuk7GuetzDrDE9ZSpMWGrMARhLdfKB0vC2SQYM8q/89X
         JWCkICiPZv+iX9ZBwg6uh3nTlAVzUzQgZ5kIUx5YwmrK1WLM+eU5aZYnVCHc0CeaGzAL
         AuOo7TetbsvXYjOE07X2OXP/OVR/czHWmjee8HMtqoC42OQM/eGNqeK3GUamf59ZxsZx
         QC+A==
X-Forwarded-Encrypted: i=1; AJvYcCW2pHjMO4sH1NykA4pg2W7Q3qpDKWQpl4ES6v7uqgZye+Op7ZTtR0KL6V7n3+qPeEn8NyKYqAsV5ikZQN0ywNtt@lists.infradead.org
X-Gm-Message-State: AOJu0YwKkYDStNL60jWCozoJEqEXOkMZAH4LiEu2xp0BJJbgmXpJjTY+
	+3x7vmvhLZBc4biyPyiyR9fc5GvXGkTCGu/J++0sxARdlQI8FRYXdBV3hHq1xxg=
X-Gm-Gg: ASbGncvqpth0ZQjsTP9oVu6g3uXL9a4uZrreGgvIUe2KTglow+yKDT5c66gLJWPxwdn
	OoBvz3rLGkNrlUJ5F84vDkrlweHsGa3qqa6JBRRZNVQr0Ka9V8/HyRh6xCoR0muJdrM2/HWO5qD
	eWgobKnU6bIRHMNoiECsF5lQKRrTa3taqnhRJuQ0RmQInfe3lJ9ciIknsiCoEbsJT6OawM6ATK2
	PSKGNZcJGWSjTvI9cOO+h9wl+HFzrN8FBLjbnDlPZYMozMYjpR/hwQKeIP+FzjLJZSKxnp0UJf5
	qc0lcxJdcajuki7a3VqMJzNRIjsEhh7R4k8QxEYXgVXR0HjUIJCUbg==
X-Google-Smtp-Source: AGHT+IHY9M/xSJ1rcEjD43/d8RMFAOTYr7Zcw6dWt79jKJuUlQIJO+at46lU6WxQLSpvwehfqTbS0g==
X-Received: by 2002:a05:6102:4a8b:b0:4b5:aa91:f29f with SMTP id ada2fe7eead31-4bc0549984fmr4446061137.8.1739531017016;
        Fri, 14 Feb 2025 03:03:37 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc07807aaasm497034137.13.2025.02.14.03.03.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:03:32 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4bd3989f027so84493137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8RdkslXk8u05dT/4DMm05EptkAQbbmF4AWYMZzZSlGfIV9/omUGfZS/yf8S0GhJs6oFrWVB35uLlxrtrbpQWA@lists.infradead.org
X-Received: by 2002:a05:6102:829:b0:4bb:c670:7ef4 with SMTP id
 ada2fe7eead31-4bc04dbedfdmr3900426137.3.1739531008576; Fri, 14 Feb 2025
 03:03:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738329458.git.geert+renesas@glider.be> <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr> <Z5-xMUqrDuaE8Eo_@thinkpad>
 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
 <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr> <CAMuHMdXZKNtAmiMP8uuSngZMsDLGcYwrLS0xNWzN4UfLaccdyA@mail.gmail.com>
 <16e1568d-8747-41e0-91b9-ce23c5592799@wanadoo.fr> <Z6DzQHebEKBb12Wo@thinkpad>
In-Reply-To: <Z6DzQHebEKBb12Wo@thinkpad>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 12:03:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFG57rUVC-XXk6bsZupVTeV0YAcue=zKWGnm4owjDiEA@mail.gmail.com>
X-Gm-Features: AWEUYZnx82TO-9m0J2Kj8kCR7cxX7DuFclptN97k0_3_zHZhXPo2iBI5bXbywtI
Message-ID: <CAMuHMdVFG57rUVC-XXk6bsZupVTeV0YAcue=zKWGnm4owjDiEA@mail.gmail.com>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030338_758678_11B501CE 
X-CRM114-Status: GOOD (  38.76  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hu Yury,

On Mon, 3 Feb 2025 at 17:48, Yury Norov <yury.norov@gmail.com> wrote:
> On Tue, Feb 04, 2025 at 12:41:55AM +0900, Vincent Mailhol wrote:
> > On 03/02/2025 at 22:59, Geert Uytterhoeven wrote:
> > > On Mon, 3 Feb 2025 at 14:37, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> > >> On 03/02/2025 at 16:44, Johannes Berg wrote:
> > >>> On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
> > >>>>> Instead of creating another variant for
> > >>>>> non-constant bitfields, wouldn't it be better to make the existing macro
> > >>>>> accept both?
> > >>>>
> > >>>> Yes, it would definitely be better IMO.
> > >>>
> > >>> On the flip side, there have been discussions in the past (though I
> > >>> think not all, if any, on the list(s)) about the argument order. Since
> > >>> the value is typically not a constant, requiring the mask to be a
> > >>> constant has ensured that the argument order isn't as easily mixed up as
> > >>> otherwise.
> > >>
> > >> If this is a concern, then it can be checked with:
> > >>
> > >>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
> > >>                    __builtin_constant_p(_val),
> > >>                    _pfx "mask is not constant");
> > >>
> > >> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
> > >> any other combination.
> > >
> > > Even that case looks valid to me. Actually there is already such a user
> > > in drivers/iio/temperature/mlx90614.c:
> > >
> > >     ret |= field_prep(chip_info->fir_config_mask, MLX90614_CONST_FIR);
> > >
> > > So if you want enhanced safety, having both the safer/const upper-case
> > > variants and the less-safe/non-const lower-case variants makes sense.
>
> I agree with that. I just don't want the same shift-and operation to be
> opencoded again and again.
>
> What I actually meant is that I'm OK with whatever number of field_prep()
> macro flavors, if we make sure that they don't duplicate each other. So
> for me, something like this would be the best solution:
>
>  #define field_prep(mask, val) \
>        (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))
>
>  #define FIELD_PREP(mask, val)                                         \
>          (                                                             \
>                  FIELD_PREP_INPUT_CHECK(_mask, _val,);                 \
>                  field_prep(mask, val);                                \
>          )
>
> #define FIELD_PREP_CONST(_mask, _val)                                  \
>         (                                                              \
>                 FIELD_PREP_CONST_INPUT_CHECK(mask, val);
>                 FIELD_PREP(mask, val); // or field_prep()
>         )
>
> We have a similar macro GENMASK() in linux/bits.h. It is implemented
> like this:
>
>  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>  #define GENMASK(h, l) \
>          (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>
> And it works just well. Can we end up with a similar approach here?

Note that there already exists a FIELD_PREP_CONST() macro, which is
intended for struct member initialization.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

