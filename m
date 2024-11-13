Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C1D41C33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1bcdub+Pq4Zg8rsA1cvX3AG9T2O7ZzZgbE8y/HRVoU=; b=oGzVvTyNeQFCZyn44D+WoDzMsY
	sCo03w0a+DsH3PH2tSl1XwVCr165sazT8S6HBWElSX7cCbNpxfvrvrN7GKcj3+YF41HDGLkONUyWf
	edo5U4cJqmropzzUxMmdVaL+JlZ7KDFvyuw8IfiBwXMdaZXNUa9LkzQdqw0wArDS7nA4bWCtiQjs+
	Cx1LOf0AQQqoVdzvSQ+p5j1B5xbKcdjiwm2nECqfQEzc7B0OPXVdmn78X7grlXcnluGL2KQSJYbON
	KvV5mvbBnuQAQdA0gz434KZezeMGOh/62MPIXWpN+J4KW5biHTOGivJceTFyBjm1og0a9W8/FjSkB
	nFHusU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBET-00000006XlU-0jHm;
	Wed, 13 Nov 2024 11:08:21 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBCe-00000006XTK-0Bgs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:06:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7FD820007;
	Wed, 13 Nov 2024 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731495985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1bcdub+Pq4Zg8rsA1cvX3AG9T2O7ZzZgbE8y/HRVoU=;
	b=ecyX72thJcgQWXoHy7K1aTLh0+U9vcOAUFVzdLCR6p8uOOxaaYTXdxZRnJ6aGvIiO3IS85
	BoUvssBSau3MDPvvrETfdqg1cAYh/QLKyYuVtUiiGzTDeQ+v6qPnBNMPd8abmA2uhsFIqr
	bxQGGs8qkY+WxJFc2a2QaDdCl/+01d0W8buuyCG4uprI/+vp+UiPWUCO4pNvDCDnbQRRWr
	ROBIgxgwrqdOXbg4FFVRWCl6+3AiLktIK7U0z/F3ebKnQ3NhTZSSMRcxRo8exyeKMLKLJ8
	7iBWKbASqFWFkBV6P8lY4G3QE8JEdNmAdfMqlEKoWlCvHnn1fTSa3M1RS8N1Hw==
Date: Wed, 13 Nov 2024 12:06:22 +0100
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
Message-ID: <20241113120622.3501db73@booty>
In-Reply-To: <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
	<20241112234206.558d5d5e@booty>
	<79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_030628_405034_392E889D 
X-CRM114-Status: GOOD (  24.53  )
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

+Cc: Anson (initial author of clk-imx8mp.c)

On Wed, 13 Nov 2024 00:14:15 +0100
Marek Vasut <marex@denx.de> wrote:

> On 11/12/24 11:42 PM, Luca Ceresoli wrote:
> > Hello Marek, Abel, =20
>=20
> Hi,
>=20
> > +Cc: Miqu=C3=A8l
> >=20
> > On Fri, 31 May 2024 22:26:26 +0200
> > Marek Vasut <marex@denx.de> wrote:
> >  =20
> >> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> >> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> >> Allow these clocks to reconfigure the Video PLL, as that results in
> >> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> >> clock accuracy is low.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de> =20
> >=20
> > I'm afraid I just found this patch broke my previously working setup
> > with a panel connected on the LDB. =20
> Do you need a fix similar to this one?
>=20
> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1=20
> frequency to 506.8 MHz")

So, 4fbb73416b10 is adding an assigned-clock-rates to hardcode rates,
especially the video_pll1 rate.

However this is not fixing the problem I'm seeing. The existing
assigned-clock-rates value for video_pll1 used to work because it is
the media_ldb parent, and the parent wasn't recalculated. After this
patch got applied the video_pll1 rate is computed at runtime and so the
hardcoded value in assigned-clock-rates does not matter in the end.

I also tried a configuration that appears to me as the most optimal for
managing both an LVDS panel on LDB and a DSI panel (which is also
present in the more complete design I'm working on):

 * media_ldb and media_disp2 (the two clocks involved in LDB/LVDS
   output) left as children of video_pll1 as per imx8mp.dtsi
 * media_disp1 (used for DSI output) reparented to sys_pll3

The above config assigns to each output (LVDS and DSI) an ad-hoc PLL.
However the problem does not disappear, simply because the problem is
that requesting a ~500 MHz rate to video_pll1 results in it to be
configured at ~72 MHz.
 =20
This confirms the problem I reported appears to be an incorrect
computation of the video_pll1 rate, which in turn looks like a bug
(which as I said is exposed, not introduced, by this patch). If
setting a hardcoded value could make it work, that would look like
hiding a bug, wouldn't it?

And at least with a single-panel setup the runtime computation should
work just fine.

More generally speaking, I don't follow your approach: your patch
enables runtime computation of the video_pll1 rate, but you now suggest
to hardcode it. Am I missing something?

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

