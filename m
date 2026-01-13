Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E1AD2F345
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjkl5ok80PcH/hISbmzT8999rrwgcE/xE7Z2HuVu6js=; b=WJnjnGDLf7X3QNA0DMvlcjlHmM
	Vw94oAwg1vD78oudksMD2QK1BuuTI/WHx60K81le8E9+sWAAJ8gH8mRfaZ3Mm0MnBxxbBauTK0zIp
	/08lpaR8yQ2U3bvYHNopYD+9YEbxwiPH2Otcdvh4VizmfYKqcy1TVvFvE9rCUlG+8xS8ULEW+DqeJ
	lnacFndFN7Z4BNqmEx4+5GOc19UnlJrgDm73uLArH1Q9WiIgHERQxKAxIlZAJa2A1n4CYcR162kwz
	3iXYIYNAdSLFin5jpSAcYm0Fdt/D8LZMAHPbU9yC6y8gMtkKxwIUT8M3cCEmm8dnh4HopuPJohKyv
	xdvOUrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhQw-00000007UCB-0yEM;
	Tue, 13 Jan 2026 16:39:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhQt-00000007UBq-2S4S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 16:39:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfhQc-0007MI-35; Tue, 13 Jan 2026 17:39:34 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfhQb-000SBd-12;
	Tue, 13 Jan 2026 17:39:32 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfhQa-009v7W-1h;
	Tue, 13 Jan 2026 17:39:32 +0100
Date: Tue, 13 Jan 2026 17:39:32 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3] drm/bridge: fsl-ldb: Parse register offsets from DT
Message-ID: <20260113163932.vx4245vyiafwvehg@pengutronix.de>
References: <20260104213712.128982-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104213712.128982-1-marek.vasut@mailbox.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_083951_780930_44AD7DDF 
X-CRM114-Status: GOOD (  35.49  )
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

On 26-01-04, Marek Vasut wrote:
> The DT bindings for this bridge describe register offsets for the LDB,
> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.

during the discussion of the i.MX9 PDFC bridge dt-bindings [1] we came
to the conclusion that the 'reg' property shouldn't have been added to
the dt-bindings in the first place.

[1] https://lore.kernel.org/all/20251219153537.zgxcokyhcqerw4jp@pengutronix.de/

As descibed in [1], the PDFC and LDB aren't standalone IPs with
dedicated register spaces. For some cases like the LDB, there may be two
dedicated registers, but for other cases like the PDFC, there is only a
single register-field and the register containing this field is shared
between the PDFC and the MIPI-DSI block.

Therefore the 'reg' DT abstraction is wrong, instead the BLK-CTRL child
devices should appear without a 'reg' property as simple child devices.
The child devices need to get the register space from the syscon parent
and need to code the registers and register-fields within the driver
like the LDB does currently.

Sorry for the late feedback.

Regards,
  Marco

> The LDB was always meant to parse the 'reg' offsets out of the DT, it
> only went somewhat wrong in the process and we ended up with hard-coded
> reg<->compatible mapping. It was never intended to be that way, so fix
> it.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Switch to of_property_read_reg()
>     - Parse single-register LDB variants from DT too
> V3: - Update commit message
>     - Drop "likely" from the comment
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 58 ++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..aa352c70b9ab2 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -8,6 +8,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>  };
>  
>  struct fsl_ldb_devdata {
> -	u32 ldb_ctrl;
> -	u32 lvds_ctrl;
>  	bool lvds_en_bit;
> -	bool single_ctrl_reg;
>  };
>  
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
> -	[IMX6SX_LDB] = {
> -		.ldb_ctrl = 0x18,
> -		.single_ctrl_reg = true,
> -	},
> -	[IMX8MP_LDB] = {
> -		.ldb_ctrl = 0x5c,
> -		.lvds_ctrl = 0x128,
> -	},
> +	[IMX6SX_LDB] = { },
> +	[IMX8MP_LDB] = { },
>  	[IMX93_LDB] = {
> -		.ldb_ctrl = 0x20,
> -		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
>  	},
>  };
> @@ -90,8 +80,11 @@ struct fsl_ldb {
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> +	u64 ldb_ctrl;
> +	u64 lvds_ctrl;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
> +	bool single_ctrl_reg;
>  };
>  
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -204,15 +197,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
>  			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
>  
> -	if (fsl_ldb->devdata->single_ctrl_reg)
> +	if (fsl_ldb->single_ctrl_reg)
>  		return;
>  
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
>  	usleep_range(15, 20);
> @@ -220,7 +213,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
>  		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  }
>  
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> @@ -231,12 +224,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
>  		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
> -		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
> +		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
>  			     LVDS_CTRL_LVDS_EN);
>  	else
> -		if (!fsl_ldb->devdata->single_ctrl_reg)
> -			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
> +		if (!fsl_ldb->single_ctrl_reg)
> +			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
>  
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
> @@ -296,7 +289,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
> -	int dual_link;
> +	int dual_link, idx, ret;
>  
>  	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>  	if (IS_ERR(fsl_ldb))
> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.of_node = dev->of_node;
>  
> +	/* No "reg-names" property means single-register LDB */
> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0) {
> +		fsl_ldb->single_ctrl_reg = true;
> +		idx = 0;
> +	}
> +
> +	ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (!fsl_ldb->single_ctrl_reg) {
> +		idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
> +		if (idx < 0)
> +			return idx;
> +
> +		ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, NULL);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
>  		return PTR_ERR(fsl_ldb->clk);
> -- 
> 2.51.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

