Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F8D68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg68OIUwvNHiLxkLQIPJGYXs1ivUdnydtUmZWb6wdh8=; b=pt59olAA6uJA7u0/2S5dnGTPxT
	IGricgdd20wMJkd8dECaNl9AXUMB7GH2leB9hxIwkSPMChClp8tp4+/wjyQaQjysfCxPETfWDRqbY
	EE6Vo2dWALbSp2WXL+/5eTT4koE051+72E6XiHbdlu3tsX6t6+E8vg5+csKDiy56DSg/kCIwvzJmx
	0q9JKdzQ7O6GYelL4oHkWA2knbenBF/foFykuMMW+E7RcENEqhpeLuagG+Yu6kcd/QwEY1h0+sTd5
	dsOIdfdBQAsdHyO2J/rF7GH92QDfnwEukWpQ2E5eagj817UOZJQRFmgbaCITDDUFeZuofq99M4AFw
	RZAaUtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzqp-00000003V5K-0E2P;
	Fri, 15 Nov 2024 17:11:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzpI-00000003Uih-2qcr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:09:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0222C0006;
	Fri, 15 Nov 2024 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731690579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xg68OIUwvNHiLxkLQIPJGYXs1ivUdnydtUmZWb6wdh8=;
	b=omlKjeNtEA26iMZm6ybnk557wfNobMAHIp1Olo4/+eqG+Hq4u+pXOaizJS0+Q+4Zs+SpKs
	uvNJouKmuOMPwSaVfBgyGVBAvJBhMOlNx0al+nZmhwpvVwMXvsa4wCmlI/KVh/zN70DMI7
	ofOp6BZEQqjRhw9knpfP+PLNmKHT0hwN80mgHK4iM2SPrV900sGi3RaIzvb8l+rubXuFuo
	+yJRuAbeNI81Fp0O5tDmZqfXQ1ziRt6eAZFuFN0Gx1TY+64yexXuBKnl28WohSdLu18Fo9
	8rYTRKMP349BfQnxzvgxkG+ZGqLCObLUEipcVRMCSLFT0Im/8WIipXJ4p4pgOg==
Date: Fri, 15 Nov 2024 18:09:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org, Fabio
 Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-ID: <20241115180936.4ab56be3@booty>
In-Reply-To: <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
	<20241112234206.558d5d5e@booty>
	<79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
	<20241113120622.3501db73@booty>
	<130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_090944_978089_F3E576E7 
X-CRM114-Status: GOOD (  29.57  )
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

Hi Marek,

just a quick feedback about my latest discoveries.

On Wed, 13 Nov 2024 22:19:02 +0100
Marek Vasut <marex@denx.de> wrote:

> On 11/13/24 12:06 PM, Luca Ceresoli wrote:
> > Hi Marek, =20
>=20
> Hi,
>=20
> >>>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> >>>> clocks are usually the only downstream clock from Video PLL on i.MX8=
MP.
> >>>> Allow these clocks to reconfigure the Video PLL, as that results in
> >>>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> >>>> clock accuracy is low.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de> =20
> >>>
> >>> I'm afraid I just found this patch broke my previously working setup
> >>> with a panel connected on the LDB. =20
> >> Do you need a fix similar to this one?
> >>
> >> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
> >> frequency to 506.8 MHz") =20
> >=20
> > So, 4fbb73416b10 is adding an assigned-clock-rates to hardcode rates,
> > especially the video_pll1 rate. =20
>=20
> Nope.
>=20
> See arch/arm64/boot/dts/freescale/imx8mp.dtsi
>=20
> 1891                         media_blk_ctrl: blk-ctrl@32ec0000 {
> ...
> 1951                                 assigned-clock-rates =3D <500000000>=
,=20
> <200000000>,
> 1952                                                        <0>, <0>,=20
> <500000000>,
> 1953                                                        <1039500000>;
>=20
> That imx8mp.dtsi preconfigures the Video PLL1 to some random clock=20
> frequency.
>=20
> Commit 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1=
=20
> frequency to 506.8 MHz") configures the Video PLL1 to a frequency from=20
> which both your panel pixel clock and LDB serializer clock can be=20
> successfully divided down.
>=20
> Which panel do you use ?
>=20
> Try this -- Revert this patch, check /sys/kernel/debug/clk/clk_summary=20
> and compare it with (I assume) panel-simple.c entry for the panel you=20
> use, and notice the disp_pix clock are likely a bit off. That's because=20
> the lcdif driver did its best to divide those pixel clock down from=20
> 1039500000 set in imx8mp.dtsi .
>=20
> If you really want accurate pixel clock for your panel, you need similar=
=20
> change to 4fbb73416b10 and configure the Video PLL such that the=20
> accurate pixel clock can be derived from it. The Video PLL cannot be set=
=20
> to pixel clock, because the LDB serializer clock are either 7x the pixel=
=20
> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL=20
> has to be set to 7x or 3.5x pixel clock of the panel, then you should=20
> get accurate pixel clock and a working panel again.

I found that I'm having the same issue that has been discussed in some
related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
later LDB tries to set it to 7x that value, failing.

I would have guessed your "[PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB
serializer clock reconfigure parent rate" would have fixed it, and it
actually allwos the LDB to set a proper (7x) rate for video_pll1, but
then also the media_disp2 goes to the same rate. Apparently the
video_pll1 is not propagated to media_disp2. I haven't dug into this.

So this is not the bug I had suspected about video_pll1 rate
computation.

For now my workaround is to set the exact rate to video_pll1 via
assigned-clock-rates.

However this breaks the case of using both lcdif1 and lcdif2. For that
I have added a reparenting of media_disp1 to sys_pll3 and it looks like
working.

Would you mind keeping Miqu=C3=A8l and me in Cc in following discussions
about the imx8mp video clocks? We are also facing this topic and we are
happy to contribute.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

