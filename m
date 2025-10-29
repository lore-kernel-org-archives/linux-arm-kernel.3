Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9545ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=; b=vyCKdPAU6Ci9g5OtIuqbMo6Fh7
	pTqQtSCID8/lqJB5dl3il6G6xdIQa6X1rcEbvAQTBhYj5l6tcDyKS9eFSYmbCtv02JMLQ5r6RYD8y
	tawqHOPKrkvIZKdlArAQxctY9cl+mrjIvnXFBVBMLW8vQRYzxLVvEUV5y8wirdNRFUOYCfDjkujZW
	eTjQ9NfGfN6XseOQIXEoKbCHPjwdL5Px5BIpkU/XijHm5/PD1gQq3N0Y2n2/A9As8QcUWy7NXRCfN
	R8E+Wuit5dmTObjF3kQuvaJtdpk1gfJGSVVufOjwGU528tP7bdVYUw0wCKnCiG1StQr+SyRhtqiQu
	TbcrQ+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Lx-00000001cdk-17r5;
	Wed, 29 Oct 2025 14:40:45 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Lu-00000001ccM-28B0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:40:43 +0000
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-78f30dac856so84975966d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748841; x=1762353641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=;
        b=uANw+RyoEZWSOVKFrf7Rd29bHPYSmGhiN/h+hsAjsZiBQMoflqEiEf3THwlHcQoaz6
         alCc1TtwGW8qADQersHJPAA1JksAdNmsNQx+X/DGV/fgBGJLTKVHTSNAAewgIgYUfTpo
         FAfrFvYE+BBa4VxmfJhaZhYIrX2JYrX8sIgmT0guYg4fCDnsE+I9ADf3pbuq48NXkJDK
         FYaEinK8Fe/k1vV9cxkSgISI0ejx7Jx2lYAHFddyMqRDtt9Uq9SXGDiatRHD/pBpv1Tx
         +QNgj4GCpYIzNvFTtVCYx5J/vFZteOkLIuvWSD0N27fj2Qea8DkyO05l1Mvg7smNQzal
         o5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNMu/biLX1ADmALR4kgxfKNUvjlLhgtcoOz97PqaEJlga82Zi4dQUJWJYWvYeghbSxWbKzVUBLXtvgGWw0LfbV@lists.infradead.org
X-Gm-Message-State: AOJu0YzX6Be2aBU+9lAgStlw4w4nJomjfyLvs6IdmBe6oUWxRvJoAMHS
	cmMQ4FlzOsDn1msoDo06+RJE5jW6InuUvFtc4Skh4YtmEeqgEGa9fO+0JeJ0Uq6m
X-Gm-Gg: ASbGnct5RguBpWeekJ1ZeUHVB93uLyv6aJZ0PjJqM7zd3sUfoDgxvDPknOQ50Ny13yW
	fWppjBKKObra5Juw2tyLsxYapDqvBR8F2STR4GbCakNY2Xf2SgAAh+GZVYhB65gQUST2laP3zLH
	db2ANO8HMjNaoxu4BPY0yTqr6yMBQqbMzQCSYCjQrQd2QBdlJ4jQLdWzke5aKz/+l/2mx0r7nDt
	kIM/BIxRax9U5yuXI6pv7JCfMdNs/8zcuke+hPo8c4cpNKkt6FJFb/tkmtUemvx/VV3GB5qhMeK
	FTqGdvHjsd2X/edUYVL1PKnRARhzDXwJluKm1B2Gkt3MqxCnILp6dSYjQoEJIzO9jFK1GbpZVz2
	lNU1Xq4aRctOXX5Nr9ubbrj6uSGE1ibhkgOeMGOnzSLEkF/sxRNHejm4WbV2zYMkfwzRU/77chM
	/upZbDkRPUIixBQ2ErsYVBU5Htu68IAXaq1kUhKoB67A==
X-Google-Smtp-Source: AGHT+IHoUGbbGuaHqcmDJPz/Ph5iu+ppEkoD4l90+Ma5GOPQuhUxYpHzmxdfLo/2Z20+lQpgOsv1CQ==
X-Received: by 2002:a05:6214:f02:b0:87a:97f:de88 with SMTP id 6a1803df08f44-88009c106dcmr34190136d6.59.1761748840725;
        Wed, 29 Oct 2025 07:40:40 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc4944a84sm102724526d6.36.2025.10.29.07.40.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:40:40 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-78f30dac856so84975676d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:40:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh7nRLnKJGIUNpUD+vnkuEDwY2FmgDeHEWBSNP++vV0K3ey7zERIrBU+aNnuRqnQdnR/sD7UU5/jVQd7NWqfDB@lists.infradead.org
X-Received: by 2002:a05:6102:26d3:b0:5d6:156f:fedb with SMTP id
 ada2fe7eead31-5db90694687mr933346137.36.1761748440676; Wed, 29 Oct 2025
 07:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <aQIlB8KLhVuSqQvt@yury>
In-Reply-To: <aQIlB8KLhVuSqQvt@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:33:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-Gm-Features: AWmQ_blqiXGJheNiHtKi_cJSwq0gfFP8sAonrx_tsjN_f5pUMr0aiWqvAOsiPck
Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_074042_577878_6F278FAB 
X-CRM114-Status: GOOD (  25.52  )
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

On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
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
> There's a couple nits from Andy, and also a clang W=3D1 warning to
> address. So I think, v6 is needed.

Indeed....

> But overlall, the series is OK, and I'd like to take it in bitmaps
> branch as it's more related to bits rather than a particular
> subsystem.

OK, fine for me (if I can still get an immutable branch ;-)

Note that as of today there are two more to fix in next:
commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
in sunxi_nfc_caps") in next-20251029
commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
registers") in next-20251029

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

