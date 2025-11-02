Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22DCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=savaLyPDvBOnmVDyuiCvDMf6GyKw9sbQTTxf9OC2yKA=; b=ljM5BWefGXBzeGC+krNvj5byrZ
	jI4HMFG2aRPZ8pQbKqU9UrnXO4EX7UItnhORH5hU4zESubBIs8SPVtfbIzZt/3n/as5MrPrnN89YN
	7dRXBkBPRyx52w0DEYNc9uu0nAjG3pHGxawkkBA6t4BGPZ558d1Hat8zljo69rUw/Wns8pxM0r4Lb
	nOj8/Qpc/ftVQlXfQGzIhaHIH4dLcTFS33VMVTd4TeqLN6JzAKJsiWhvwR5wzZhCheGnpBn022a+Z
	jUqSertwXDdGHZ8J9ICfqXhaOssJya9nimHlPMuOA/Hb9DyApxq8xMgXF6QZxF94yXY+/vqghYq0X
	GDAwjSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVYm-00000008Tn3-34Y2;
	Sun, 02 Nov 2025 10:43:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVYk-00000008Tmd-1Ttp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 10:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2ADD43274;
	Sun,  2 Nov 2025 10:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E047CC4CEF7;
	Sun,  2 Nov 2025 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762080221;
	bh=4u8d6QQgjLsALEyZL0hM355ahA8pgo9Ke2RDvhyV/FU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YojVFjn8WsOc90BQ7IjaCvSpawTY/iFM2EPhYDD5dnGWRgy1V9yvL/MEqZ0TtAlR7
	 bOb/fXVYiil59qXvBq/U3REBPlb5nBkGwDqRIYMBz5I0KEBRnvT5ZEiaYzNyd6y9Zf
	 5IIUOWr69e6TstOOUFAcseA/Uh3WnpVn2+gfAVjCfVQRnOUA5ypJyOfrOHReuHp7Sg
	 WGYh/9kMA2mX62kCZYu70IxtgYDcwIcClH+HreNxArWG+BioiWd94cJCtOu6NOrbBI
	 1yerwBgfvmBsmLmV1VasI237/BiNNQOhrrQMTL8p3/eC2uQh+6fEkO+1LfX3YVL0KT
	 1QsxP0qktpdJg==
Date: Sun, 2 Nov 2025 10:43:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun
 Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Johannes Berg <johannes@sipsolutions.net>,
 Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, David Laight
 <david.laight.linux@gmail.com>, Vincent Mailhol
 <mailhol.vincent@wanadoo.fr>, Jason Baron <jbaron@akamai.com>, Borislav
 Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Kim Seer Paller
 <kimseer.paller@analog.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Jianping
 Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
Message-ID: <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
References: <cover.1761588465.git.geert+renesas@glider.be>
	<97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_024342_435492_26915F05 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, 27 Oct 2025 19:41:44 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

So this is going to make a mess of merging your series given this is
queued up for next merge window.

I can pick this one up perhaps and we loop back to the replacement of
these in a future patch?  Or perhaps go instead with a rename
of these two which is probably nicer in the intermediate state than
undefs.

> --
> v5:
>   - New.
> ---
>  drivers/iio/imu/smi330/smi330_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/imu/smi330/smi330_core.c b/drivers/iio/imu/smi330/smi330_core.c
> index d9178725ade3da83..a79964fe68fadf47 100644
> --- a/drivers/iio/imu/smi330/smi330_core.c
> +++ b/drivers/iio/imu/smi330/smi330_core.c
> @@ -68,7 +68,9 @@
>  #define SMI330_SOFT_RESET_DELAY 2000
>  
>  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#undef field_get
>  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#undef field_prep
>  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
>  
>  #define SMI330_ACCEL_CHANNEL(_axis) {					\


