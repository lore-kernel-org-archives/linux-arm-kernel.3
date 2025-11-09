Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34DCCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsAMk0j4bUEAq2Xy6R/woGPhVEp5XLvlsFq2aXBkK7Y=; b=DzkX7L2NS57OxsH8wal/PVW/mp
	AVm8++BCmQHhnvreoIUgvx1rV6PhNZ+2yavQcsEDsfGvpa7gvQGJjMd+GY20fEf8rHOu+mNGX3YwI
	PCLaa7te8omEe1Few8JR6JZdR+ZIbvJdHqOFZj9AMFwqG1A8sLYmHkMa6DDRolB6u9J3nFgds6FKR
	eeBQJMtvtaET5Fw7lBTiJ0ZqKor/0z3mrFagbfQDISwJ6BFfUqixKbdKk50MCNkYMDlR0y+hdcQCO
	xGQJP57Kdk1xQfEDBG4Lw1Jo7/Sz5C7/puBaVIVawbmI9J5BMshr8w0NF9sQdB2Hpucvg/kPCf+hw
	6bE/HizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI52y-000000041Aq-3DF0;
	Sun, 09 Nov 2025 13:01:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI52v-000000041A2-2C88
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 13:01:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE9F43B36;
	Sun,  9 Nov 2025 13:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BF3C4CEF8;
	Sun,  9 Nov 2025 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762693285;
	bh=zNi9nu3L6TvcyXChQiHADlE5BR7XOd1UsthZfvb4G1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EiUmTl27nujv51T7if+PVcEwebMCbQCSCq+8xYpaEYI85RENWVNiRhQBbcZizkEcl
	 BoNN96p+WxmZf8XdtZd2JsH89A3j92nUV/nviNZBdoUa+JlTXZfeI1MheP7j0cuQVS
	 h92D51+L7hZ918wSo/TloZRFQb8IuVvMFsY/0olkMlPlIk7n0h9fCRAkSB/zrNZYUy
	 o4R3RMn97X9Qp2F9/enYc19Uabz3of7vben/btpQkQj13pd57/4mn4NtxOfAoZl9rB
	 nGuOIb3srFqktlT4NZZ/24ryLC2SYkCUPIwvyjQnO0esl0QpJC6RsjhO0psREWxDAE
	 TbMdryqtL/QNQ==
Date: Sun, 9 Nov 2025 12:59:56 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Message-ID: <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
References: <cover.1761588465.git.geert+renesas@glider.be>
	<97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
	<20251102104326.0f1db96a@jic23-huawei>
	<CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_050129_611895_A00B4A63 
X-CRM114-Status: GOOD (  26.57  )
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

On Mon, 3 Nov 2025 11:09:36 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Jonathan,
> 
> On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > On Mon, 27 Oct 2025 19:41:44 +0100
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> >  
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocessor
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> >
> > So this is going to make a mess of merging your series given this is
> > queued up for next merge window.
> >
> > I can pick this one up perhaps and we loop back to the replacement of
> > these in a future patch?  Or perhaps go instead with a rename
> > of these two which is probably nicer in the intermediate state than
> > undefs.  
> 
> Renaming would mean a lot of churn.
> Just picking up the #undef patch should be simple and safe? The
> removal of the underf and redef can be done in the next cycle.
> Thanks!

Only 1 call of each of these in the driver, so churn is small either way.

To avoid a bisection problem if your tree merges first I need to modify
this stuff in the original patch or leave it for Linus to deal with as
a merge conflict resolution which is mess I'd rather do without.

So I'll rebase now and rename these functions to have an smi330_ prefix.
Better to potentially cause people problems when I have 23 patches
on top of this (and hopefully no one is based on those yet) than when
I have many more.

So tweaked and pushed out a new version where this patch isn't needed.
We can move to your new code next cycle.

Jonathan



> 
> > > --- a/drivers/iio/imu/smi330/smi330_core.c
> > > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > > @@ -68,7 +68,9 @@
> > >  #define SMI330_SOFT_RESET_DELAY 2000
> > >
> > >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > > +#undef field_get
> > >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > > +#undef field_prep
> > >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> > >
> > >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


