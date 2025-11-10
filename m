Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3196CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=; b=nDcX4AKTz3pyCofuN5qNDNnCx2
	jy3G9ciVahCIOAkrB0OVL5/hhx5vMhEJAFgKSOv1vNJRGFOTer0+Ywkz77IoyesZnI5xlvvcwwNij
	g0dXoNrXBLEVzQYya6XHqB7ytC6LFIZGOkzWV21xGjhSUrfdOV7//GJ/ohbJVXxSBwp3RfyTkC/0u
	IhnhCXlemLE2LRpLos9TZ9nmJhX8E61dDD8RjERcQixM7ZsVH1s6Pqc72bBGbToVMDNOvow9hbVlC
	SN1BLr2Vtftmquips2jY52eiNyKjNasd+e21dPkJOTkPl1YVQ6VLW0RspwVVIr9z/CMsfB2SMbuSl
	rdfn27jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINpv-000000053Cq-07EJ;
	Mon, 10 Nov 2025 09:05:19 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINpq-000000053B9-3uiU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:05:17 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aace33b75bso2895332b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765514; x=1763370314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=;
        b=sMZczhZSAufQl1tPIaIk1KbroO+4z6SyqKSSIr2x1winshCzYG3zD1nIk6SEpk+Ny9
         TQ50ija7RGfxMN0R7BE+1ky9unBa+aoGGyBiU8ZfJV4AVZZgLJTau2lkAKAXCnTAFeh0
         jGJHn/z2VIqu6DF65tCAPeTf/LZTCAVNkk8sdPos4ONTU3Rd+IY9r24GIkBolvGQ1W58
         4f4BOipmLwTDLaxIUWVBA8v93aI45cjhsWKLY1rVE/uSAHUhuItEmremCR3iNSALLHAB
         CfxcYTnoIj8i+uTfzF+uCHe4gXq84WJGlFTVq/zGabcfuDM0fAYn1DJIzYb69clkB3ev
         LHrA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ89z+q9ZYnxnBUT0PcJbExmpi4YH9UHI3io84TYqDWSqG2cKWvndeWqrrNS3RXdSm+UY//Rn5qA7RP5XOyRDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcjl/jY61JaN66G8ep9H7FpzU2thpevWKjLINy93+60l52GYvv
	yGVywkvVENQrCDCioaa8nP7L2MDBvs8z1RjQMo8XhGmQWrMd03RWjvp4kDqokHq8
X-Gm-Gg: ASbGnctSm2MVqqTKX0JBpc4cObuUpXWTvZwFFM5VXqt70DJCMkvvmf4iVZpJMb/VF3s
	pH2GM8bCjWQ+6EjaRRqLuUDzVFGbSmDpCIYziJV+5RnvmZwdQu6ABuGmh1pQ3Zyn3k04/wDqoiO
	T/ZUxLEySKX/QlTBX3OpvM3V+rauWdHVgnSvQeGfiIdhmt6bCvxVxv0wbjEzOTXcvXv7MWgduoH
	xcXPq+057KP6dFsB09C8AbFv3P9semTmXVOD8S02yUmHKdhFICXNROnz6oYr3N0vG8AxvXgQeaV
	3kw2gSO+4TOJDlKnaMXMxyLDkrB8+qYO0sNuD5DUO2f+o+Hf+YBI3h2gQcXHn5D4VQKJIqT0/Sv
	4+29Ruun2xE+3kG1sfuqXhFcB/TEhnuwRb65BKVQcet1VfqWtmHVQCGS/r58yISJR1GIiIDpbRQ
	i4JucWglE/7laDvP/ijPSfgQkW3mjdKWN3UIc+VMzNXaqZdQ==
X-Google-Smtp-Source: AGHT+IG5mgsXKaRsy2yDErwbsgerffc46R+6LJ4a0pCpGRLe4tS3Vfzsm3zBKQpRAQSvOgzK/jLyNQ==
X-Received: by 2002:a05:6a20:939e:b0:350:ee00:3cc1 with SMTP id adf61e73a8af0-353a3563007mr10025887637.30.1762765513465;
        Mon, 10 Nov 2025 01:05:13 -0800 (PST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f0d16483sm11722264a12.0.2025.11.10.01.05.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:05:13 -0800 (PST)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29555415c5fso35077675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiRbGcUOyJtF/0xZNCjKQH645pE9YV+AGWIV0LiH7mxrBW5sfckgErGkUGrqDsWbjCXTwJZH1BrxTMAfiQhA32@lists.infradead.org
X-Received: by 2002:a05:6102:950:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5ddc471358fmr2304047137.19.1762765185596; Mon, 10 Nov 2025
 00:59:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei> <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
 <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <20251109125956.106c9a1a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
X-Gm-Features: AWmQ_bmD7LCstBufqr7pTwqKUhf3WnheTdaFZy-l1C13xKAmQ3xomq2Nqy5MxZo
Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251110_010515_538746_26212651 
X-CRM114-Status: GOOD (  33.96  )
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

On Sun, 9 Nov 2025 at 14:01, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 3 Nov 2025 11:09:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > > On Mon, 27 Oct 2025 19:41:44 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > So this is going to make a mess of merging your series given this is
> > > queued up for next merge window.
> > >
> > > I can pick this one up perhaps and we loop back to the replacement of
> > > these in a future patch?  Or perhaps go instead with a rename
> > > of these two which is probably nicer in the intermediate state than
> > > undefs.
> >
> > Renaming would mean a lot of churn.
> > Just picking up the #undef patch should be simple and safe? The
> > removal of the underf and redef can be done in the next cycle.
> > Thanks!
>
> Only 1 call of each of these in the driver, so churn is small either way.
>
> To avoid a bisection problem if your tree merges first I need to modify
> this stuff in the original patch or leave it for Linus to deal with as
> a merge conflict resolution which is mess I'd rather do without.

If you add the #undef, there won't be any bisection problem?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

