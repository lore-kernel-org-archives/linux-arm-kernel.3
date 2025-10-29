Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F29CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnpQqG3KsjO8HR5ITuKL9a0uCELInljqSPlsEDY9f3Y=; b=aC8UN9EHuAElXJnNpgy3OAOG0o
	Im0ryRNl+pamsnMZAKxya9G5wXZDoqUsQUFWNN4evo8QhujBrDIEdiPzxs0hep2Cr0whb7z8briJt
	fIbcrq7389TovxbofWcNW6Eymh4xtK2fZCgOcGptXDVlKnV6dLMCZqvMZV26h/s2YbeT0bmcaGBDJ
	DqdbfY4ecnO2iVlm30GVACxeZhzq3cjLEbMRHoBh3kR2xE86BD5Zs39g5Bh235JXSKX/sJ7KPX3pm
	y4RQE585X0gHGb8ArpG6jXb0zEltLE0scrY7SaDvilUzt+eVLhcZcGPJ5b8/7EOm20ONzK9YKJCf7
	ahTyc7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7C9-00000001aS6-3RYH;
	Wed, 29 Oct 2025 14:30:37 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7C7-00000001aR7-1QKI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:30:36 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ecf0336b61so38085781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761748233; x=1762353033; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnpQqG3KsjO8HR5ITuKL9a0uCELInljqSPlsEDY9f3Y=;
        b=VJHc+vvUF2wt1lttbzAcdUlAo/sBtyVR3Dgt9xBHP4OdwCvcHsexVNlhnvWiItukLz
         Hxy085ZCdPT871DNTMpecsus+UHvmrVGnzfzhWGD0JTuOKQeICbniKdGa1vRYN7nLzMD
         k5X/N73OG8q1KY2WCTurJR2tXQlbZhupRXuVa5gAbWqAuUquYW7ZzeIB3bLISbYBSxKC
         3UzLj7UbTckqdZqYP1kt41nOwUw7Qjoh0ITvP2LGUoYZPeToEqxTDGdE3heslQb570P4
         ggRnJQGKjL9/ZXkvlbS2tFBOWhgdpRKbSNCCateOykwVAS2VNjMBJK8KaQ/eE4y68yjX
         t5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748233; x=1762353033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnpQqG3KsjO8HR5ITuKL9a0uCELInljqSPlsEDY9f3Y=;
        b=lRz+WsGfgrQUfG98JFXXVnBBLXujrDql+xXO9W37s/bPtZZcC4UoCWEKVeGjqHaOJ0
         1HMDSSSXAjxoyYZVy5B7RLmQgpJb0mjIo6meKm/9lPB1l1jApAKGj6rPpksktnn0QgXh
         qjT2RQkTSHope+9Suo2r8H0LaIVXpUw9DOZHoTY349GjRnSS012AFHt/iO7OnJgofGux
         VYn8vL/LRuJWxnJO4de3yAU208Xy03l3Xj3KaP+gJRdJFZc3Ekxj3ki/JPMyBsPu+LBe
         LHtR4oyddC0tDhWtBj3siJjD0RGOUDHR3YVJvkRWgo0JpLtB6SUiTEXvbXdKhSvqQBhg
         8okg==
X-Forwarded-Encrypted: i=1; AJvYcCWHALRaa98Kw7Om0KzFOS8gD6+cleyGEQpORdEMhlSaLGXbiE0vxNc+mmD6ZX10i1x4/kEQV/vmblas0xuyIk6k@lists.infradead.org
X-Gm-Message-State: AOJu0Yya0OtEi+GYMTOyP4n0k+jXjgUiT20BfnckI0kgRx/og14JleTF
	GDPMhHPEPdQARVWXMdd30VJC5XQmrm1M43sK/RuumLcy7isXkiTN8vqz
X-Gm-Gg: ASbGncvRepCxY6goS4ZMh/mxBkVpcocyYS2l571S2ZupRNQ1+4zNPSm4BilIo7iCx4a
	jyDmXYP2iMuXOzoeeMvS6Df1odlk3yo3r/GFd0bf07wfxLmRIfl/MLALCg7H4XLDrJQHuyjF8rO
	exTwqhz4T7c2KSG0wyE7/zg+0pxVHzv/dTZXBR33KG8hpbAlJRvomqoYR54iDR8l9vO7MqL3lKJ
	rVTPaRmVdNKoLpQsZSERsxAsgbrpbKg13tKK6O2aEK3uxOZkwsiOFxCqs16DFfu4b6R3aTW5SVo
	hB5csCxSce6S7nUvLXVO0nXRsAzKPZa0s00CCAnz3J3FgaAX3cmFuyHDK6IDaxXowGdZLJLgMwD
	dfymoyc92qFb0pj2UWpmZXVJdkre4ac8PlVMN94KDHT+U+qE33PjdEkZa+PI4h44MkVD163BR
X-Google-Smtp-Source: AGHT+IHd6ZEI/4efuxlvOLVTSJQH1JkXxxhkGirHmvwiRC9eDvjzIFKRpIZ05PrXMHCHH/Mrsnw0AA==
X-Received: by 2002:a05:622a:24a:b0:4e8:93fc:f8c9 with SMTP id d75a77b69052e-4ed15b53cd6mr36770551cf.15.1761748233098;
        Wed, 29 Oct 2025 07:30:33 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc51e3809sm96571096d6.26.2025.10.29.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:30:32 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:30:31 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
Message-ID: <aQIlB8KLhVuSqQvt@yury>
References: <cover.1761588465.git.geert+renesas@glider.be>
 <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_073035_386332_1B5491A0 
X-CRM114-Status: GOOD (  17.21  )
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

On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> Hi Geert,
> 
> thanks for your patch!
> 
> On Mon, Oct 27, 2025 at 7:43 PM Geert Uytterhoeven
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

There's a couple nits from Andy, and also a clang W=1 warning to
address. So I think, v6 is needed.

But overlall, the series is OK, and I'd like to take it in bitmaps
branch as it's more related to bits rather than a particular
subsystem.

Thanks,
Yury

