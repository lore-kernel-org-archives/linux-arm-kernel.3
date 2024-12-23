Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD8E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdiuPB9bq/4aCMg4E3kNucse6Zv0E07gnxdpcuBtioU=; b=ghV18PoXgZpl9xme3wsNH5MczC
	QOc4K+suxiQLV5JwOaCo01VknWYCoiKO2mfQpW4xkTz6VkODA5Mu0XC2bX3UsO20fXtbrZp0XWuhd
	tQqmpPrynE7CE2A/XndWCS7D1wxnDt2F5T/5qYMreEXuo8CPN3+rf4hEgiT552g9uRJ6A8KKo+ziY
	gFgjYw5Y11xDvQtbgVM7HoT+z8bakpemPt18SUjPR+Bkh72wb1tBUn5oAgkufaQY6MQCd/SZUHTx2
	U60D85zjzyCvgcCAbsXwJcVhmqa3H5+g0GVcqZk0C0QBKyEJkyE6dUfYYoh48Kq5GmmE9Ak2fsX9U
	tCg6aonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnfE-0000000Aaou-3YsO;
	Mon, 23 Dec 2024 19:00:24 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPne1-0000000Aahh-2b5X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:59:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC58E1C0004;
	Mon, 23 Dec 2024 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734980344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdiuPB9bq/4aCMg4E3kNucse6Zv0E07gnxdpcuBtioU=;
	b=XD/YazfUbfpgmMWjNw6rFagb9g92PQuspY4BKzYOQ1avsLOpHM33iXbbsDnLtFQmXWgrZ1
	J8+blL7J4mzXdyiPeH+Dyo3W3bZaYzS1v6lyNrlg3t7mngDfdPgqpBHI1xKZ5tSAUyTafb
	J6MWzArSxY1XzYtkSHVgtTnLnY6psF9xcXEBQaSF/USLQOKV9hG7oz6/rae3XGvejIWZ9m
	+N5z3+Y7ck24CfYSzYEWQhfvMgA/Tjs7wnP7Qbn3M/yz5RCZeX4rEB/f7l8hl+uq93xEg5
	/l7i2STzkE+pbgnI1omFtYsrqBDP1vizVR7kheE/ba/RZr+r5vHVcbXYuNZNtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Liu Ying <victor.liu@nxp.com>,  Abel Vesa <abelvesa@kernel.org>,  Peng
 Fan <peng.fan@nxp.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Marek Vasut
 <marex@denx.de>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  linux-clk@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  Abel Vesa <abel.vesa@linaro.org>,
  Herve Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
In-Reply-To: <20241217-didactic-hedgehog-from-heaven-004c37@houat> (Maxime
	Ripard's message of "Tue, 17 Dec 2024 13:54:07 +0100")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com>
	<87zflrpp8w.fsf@bootlin.com>
	<20241217-didactic-hedgehog-from-heaven-004c37@houat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:59:02 +0100
Message-ID: <87ttaurzt5.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_105909_941857_8B65FB20 
X-CRM114-Status: GOOD (  33.98  )
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

Hello,

>> >> [After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer clo=
ck reconfigure parent rate"]
>> >>=20
>> >> This is a commit from Marek, which is, I believe going in the right
>> >> direction, so I am including it. Just with this change, the situation=
 is
>> >> slightly different, but the result is the same:
>> >> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>> >>   setting video_pll1 to freq A.
>> >> - media_ldb is set to 7*A by using a divisor of 1 and setting video_p=
ll1
>> >>   to freq 7*A.
>> >>   /!\ This as the side effect of changing media_disp[12]_pix from fre=
q A
>> >>   to freq 7*A.
>> >
>> > Although I'm not of a fan of setting CLK_SET_RATE_PARENT flag to the
>> > LDB clock and pixel clocks,
>>=20
>> I haven't commented much on this. For me, inaccurate pixel clocks mostly
>> work fine (if not too inaccurate), but it is true that having very
>> powerful PLL like the PLL1443, it is a pity not to use them at their
>> highest capabilities. However, I consider "not breaking users" more
>> important than having "perfect clock rates".
>
> Whether an inaccurate clock "works" depends on the context. A .5%
> deviation will be out of spec for HDMI for example. An inaccurate VBLANK
> frequency might also break some use cases.
>
> So that your display still works is not enough to prove it works.

Well, my display used to work. And now it no longer does. The perfect
has become the enemy of the good.

>> This series has one unique goal: accepting more accurate frequencies
>> *and* not breaking users in the most simplest cases.
>>=20
>> > would it work if the pixel clock rate is
>> > set after the LDB clock rate is set in fsl_ldb_atomic_enable()?
>>=20
>> The situation would be:
>> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>>   to freq 7*A.
>> - media_disp[12]_pix is set to freq A by using a divisor of 7.
>>=20
>> So yes, and the explanation of why is there:
>> https://elixir.bootlin.com/linux/v6.11.8/source/drivers/clk/clk-divider.=
c#L322
>>=20
>> > The
>> > pixel clock can be got from LDB's remote input LCDIF DT node by
>> > calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
>> > does. Similar to setting pixel clock rate, I think a chance is that
>> > pixel clock enablement can be moved from LCDIF driver to
>> > fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.
>>=20
>> TBH, this sounds like a hack and is no longer required with this series.
>>=20
>> You are just trying to circumvent the fact that until now, applying a
>> rate in an upper clock would unconfigure the downstream rates, and I
>> think this is our first real problem.
>>=20
>> > https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.33=
41908-6-victor.liu@nxp.com/
>> >
>> > Actually, one sibling patch of the above patch reverts ff06ea04e4cf
>> > because I thought "fixed PLL rate" is the only solution, though I'm
>> > discussing any alternative solution of "dynamically changeable PLL
>> > rate" with Marek in the thread of the sibling patch.
>>=20
>> I don't think we want fixed PLL rates. Especially if you start using
>> external (hot-pluggable) displays with different needs: it just does not
>> fly. There is one situation that cannot yet be handled and needs
>> manual reparenting: using 3 displays with a non-divisible pixel
>> frequency.
>
> Funnily, external interfaces (ie, HDMI, DP) tend to be easier to work
> with than panels. HDMI for example works with roughly three frequencies:
> 148.5MHz, 297MHz and 594MHz. If you set the PLL to 594MHz and the
> downstream clock has a basic divider, it works just fine.
>
>> FYI we managed this specific "advanced" case with assigned-clock-parents
>> using an audio PLL as hinted by Marek. It mostly works, event though the
>> PLL1416 are less precise and offer less accurate pixel clocks.
>
> Note that assigned-clock-parents doesn't provide any guarantee on
> whether the parent will change in the future or not. It's strictly
> equivalent to calling clk_set_parent in the driver's probe.

Oh yeah, but here I'm mentioning en even more complex case where we
connect three panels with pixel clocks that cannot be all three derived
from the same parent. There has never been any upstream support for
that and I doubt we will have any anytime soon because we need a central
(drm) place to be aware of the clock limitations and make these
decisions.

[...]

>> +       /*
>> +        * Dual cases require a 3.5 rate division on the pixel clocks, w=
hich
>> +        * cannot be achieved with regular single divisors. Instead, dou=
ble the
>> +        * parent PLL rate in the first place. In order to do that, we f=
irst
>> +        * require twice the target clock rate, which will program the u=
pper
>> +        * PLL. Then, we ask for the actual targeted rate, which can be =
achieved
>> +        * by dividing by 2 the already configured upper PLL rate, witho=
ut
>> +        * making further changes to it.
>> +        */
>> +       if (fsl_ldb_is_dual(fsl_ldb))
>> +               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);
>>         clk_set_rate(fsl_ldb->clk, requested_link_freq);
>
> This has nothing to do in a DRM driver. The clock driver logic needs
> to handle it.

The approach I am proposing in this series can sadly not work, because
it is not possible to slightly modify a clock after the crtc has been
set up without getting back into drm for further tuning. I observed
that my series was dependent on the probe order, because the exact same
clock tree would work and not work depending on the order.

To get back to your comment, unfortunately, there will be no other
choice than having drm drivers being aware of clock limitations, just
because the clock subsystem alone, even if it would do the right thing
behind the hood, would still sometimes break displays. This means drm
drivers will have to care about clock constraints.

As an example here, I am fine arguing about the way (calling
clk_set_rate twice on the same clock), but the fact that the parent
clock must be multiplied: this is drm business, because it is a drm
requirement.

Thanks,
Miqu=C3=A8l

