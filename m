Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8425FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=; b=2FgXEgSChNgsNy44PfZJXYCBtd
	S4gaLr1tQ9UQlNrpY35YzGTRXji91Laxx39qS8Lw3I2Zw/pSnOQPp2dPywlrlLU0YQ+ZHNo1EBRrH
	Zc9QDe4QUJHSXlWisjQdvdSyo3c3tMLAg/7n40nonEo++FrRaVEn5/OxW0HZzNBNsgrW9VcGXMWMv
	+sRKyCrgdatx4p/NtCM2rluvZFM45w5NGRISiCRE1xr7ReFdHwqEqcOlodUiASgGaoDPI6WAyWLy9
	N1brFAHQfQML3TEvoAMzu0V8UgveR7czIUobdGfyVufjRzKmLmOfS28EsQYHdETb1I8NK52yLnYLX
	qPFUnvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7GY-00000001beG-2kkN;
	Wed, 29 Oct 2025 14:35:12 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7GW-00000001bdO-2eur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:35:09 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5d96756a292so1303495137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748507; x=1762353307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=;
        b=BwsOLXkBWgcN6ygYw4rEvTWNrAYEwcE1iirBtXuAc9InLPvcdvrls88HMS0chizRAG
         B0W9dGxoeKblkN0c1Loa1rQ1H4GPtrAT+OSKPZdzuJFhxmwb9CjIW7gEwcNb4DS7Mjfu
         S9tEb8k/E8K6cjl9Wo8qc13cHz/kmgvZaBMbLkhltAkULhKU/ed9Mxp6OowRHcXzyOjG
         ljQjv83d9L4p3PfyH00zMmKDvWj9UAS2xpYawY7WhAJ92Qle4kTQA6tnWD6LeFFOPdth
         g4BoCjBGUMtyNrx4FbWfphlXL+4bi+43K5vnMmHU59UPEkwT016WHMcWO/CvxgnqA5bj
         arUw==
X-Forwarded-Encrypted: i=1; AJvYcCXZLdyheI4gq4aeg1c05et5Mes3UJnieagKfbkm5EQ0syGXM2gI3/Ou1opeVgoOM5boCWrDMYY0j/onKb45i+Jo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/ZKuy+/Rp2UpHV0ib/CSQ7WuDMwJ8ahGItYzXEkm7y4qt1QB
	hsRIFc2Wgi1IQ8xuLp0L2NqaiV58N/cch50oQz0DPRx4CApxzvDZ93NvLFuSE37I
X-Gm-Gg: ASbGnctMC15p2aNjQVKYGIBVE4wVDtYdxxMR+Si7mSTjaKmQRP4lHXZHC8zMyBosxn5
	sED2r9wHGAxvOf615W52F3iwX18QKPKkAv4XGq6fgT6Zt97Ze7zRH5EVqr8zZwyRWovxtIXl1Q7
	mqjW2vtrlpiy1TUX2XiM8wMNsQs6X5V2uZcRQsSr3nFDNVWht1xq1M5pSLD+Hb7AtK5h1gmKamG
	/ZkrNVoETlya3h07HuWicZ1XtMz0m7PrhbocNLjax2cCA0qe1zhpoHJigDCVKgaydgMho1FdKU5
	3UHW80kL+vENbL5+yDi0HK4ltmwBdjn22TCZ20bbPbTGgiJFF96EdoMjEe6vkdsxTv1VXOjLl9a
	Dp5xLJQJ+kdTFUQMkOBE+MIQK5QnXvFFAN3wOZFaGoNi/2bmOcJ1eiWhU0+RGeLm3fNrCrLTMUe
	BIUbAQlAj3JloK9//W4rgXneoDg7bOwxRbssYCanPOSQ==
X-Google-Smtp-Source: AGHT+IEcx3eCvKpNjFc1xUgPEwHvF5DZPcE+Zgl565Vm9qIr2I83WQw+VDgzNNopNxh/prgdACB9bQ==
X-Received: by 2002:a05:6102:2928:b0:584:7aa3:a329 with SMTP id ada2fe7eead31-5db7e069220mr2778801137.4.1761748507007;
        Wed, 29 Oct 2025 07:35:07 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c3f431e3sm5201893241.8.2025.10.29.07.35.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:35:04 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932e88546a8so720933241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn2LjgV5V/bL+2JzpjMN/LIuc7OghMeTKTupnpJTcb/hC06b+4HOOz3dkhzr4y5YpXsQx+ed3Fk7b9wy7iX7HP@lists.infradead.org
X-Received: by 2002:a05:6102:2acd:b0:5db:9b88:1fec with SMTP id
 ada2fe7eead31-5db9b88219emr535412137.9.1761748503547; Wed, 29 Oct 2025
 07:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
 <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
In-Reply-To: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:34:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
X-Gm-Features: AWmQ_blZ8dUVr2aBwtWAAkAOaE93AtUSPNFDpslgvmXepFfW4tMWIOUWnRJkksY
Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
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
X-CRM114-CacheID: sfid-20251029_073508_682819_9D1DEE64 
X-CRM114-Status: GOOD (  20.50  )
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

On Wed, 29 Oct 2025 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Drop the driver-specific field_get() and field_prep() macros, in favor
> > of the globally available variants from <linux/bitfield.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - Extracted from "bitfield: Add non-constant field_{prep,get}()
> >     helpers".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> I guess this needs to go with the rest of the patches?

There is no hard requirement for that, but if 07/23 goes in, why not
include this one, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

