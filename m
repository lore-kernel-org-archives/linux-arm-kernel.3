Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C7BCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV3QHCG8KZERdJZbwsbjhrZ5EP4jD8XOomsA4+AafJE=; b=YZBosB5s6sh2jVHhrdCbYxV6OK
	l6qqxGA1ZlC0qKshG9yXEJXI7I8/PSYI8IS4k2dWG9h93+YzLM++rJdQAorfQ6Jg5OefkXHEdsXiT
	n/lvWDY9YZGlJLCDXuU2kURnFXnrf535KPqH8rU/h07oGa2dgSAKIiWztbUBd+NYeYKSmtg2knvex
	5TznOuQNt5/8nPk4u/6c1rRZX41uSd6W4DL9nJpBs6hzgE29rpcEhUNL3lbk9lLOrFoqKqqqcntYK
	+F2V9G8JefYTeaauZyAOZlKjfWPxraetRkP5qWlsiBV5GSFs0tv3RGuo7QgmVFW6yDGUS+ildvELc
	iombLxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVbD-00000007ojp-1krQ;
	Mon, 25 Aug 2025 11:42:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUaO-00000007elv-1kcb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 10:38:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZi-0001ab-FF; Mon, 25 Aug 2025 12:37:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZe-0023HK-2d;
	Mon, 25 Aug 2025 12:37:14 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZe-000M78-2I;
	Mon, 25 Aug 2025 12:37:14 +0200
Message-ID: <c5d8d527ca6194b606b5627e51abbb82ab6dd76c.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/13] media: rockchip: add driver for mipi csi-2
 receiver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
  Maxime Chevallier <maxime.chevallier@bootlin.com>, =?ISO-8859-1?Q?Th=E9o?=
 Lebrun <theo.lebrun@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gerald Loacker
 <gerald.loacker@wolfvision.net>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>, Collabora Kernel Team
 <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, Alexander
 Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob
 Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Date: Mon, 25 Aug 2025 12:37:14 +0200
In-Reply-To: <20240220-rk3568-vicap-v10-7-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
	 <20240220-rk3568-vicap-v10-7-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_033800_461006_4643FE4A 
X-CRM114-Status: GOOD (  17.99  )
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

On Di, 2025-08-19 at 01:25 +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
>=20
> Add a V4L2 subdevice driver for this unit.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  MAINTAINERS                                    |   1 +
>  drivers/media/platform/rockchip/Kconfig        |   1 +
>  drivers/media/platform/rockchip/Makefile       |   1 +
>  drivers/media/platform/rockchip/rkcsi/Kconfig  |  16 +
>  drivers/media/platform/rockchip/rkcsi/Makefile |   3 +
>  drivers/media/platform/rockchip/rkcsi/rkcsi.c  | 741 +++++++++++++++++++=
++++++
>  6 files changed, 763 insertions(+)
>=20
[...]
> diff --git a/drivers/media/platform/rockchip/rkcsi/rkcsi.c b/drivers/medi=
a/platform/rockchip/rkcsi/rkcsi.c
> new file mode 100644
> index 000000000000..5658ffb60769
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> @@ -0,0 +1,741 @@
[...]
> +static int rkcsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rkcsi_device *csi_dev;
> +	int ret;
> +
> +	csi_dev =3D devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
> +	if (!csi_dev)
> +		return -ENOMEM;
> +	csi_dev->dev =3D dev;
> +	dev_set_drvdata(dev, csi_dev);
> +
> +	csi_dev->base_addr =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi_dev->base_addr))
> +		return PTR_ERR(csi_dev->base_addr);
> +
> +	ret =3D devm_clk_bulk_get_all(dev, &csi_dev->clks);
> +	if (ret !=3D RKCSI_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi_dev->clks_num =3D ret;
> +
> +	csi_dev->phy =3D devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi_dev->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
> +				     "failed to get MIPI CSI PHY\n");
> +
> +	csi_dev->reset =3D devm_reset_control_array_get_exclusive(dev);

Why array? rockchip,rk3568-mipi-csi bindings specify a single reset.

regards
Philipp

