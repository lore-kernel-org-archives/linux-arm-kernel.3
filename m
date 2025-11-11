Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB873CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7KcnHekX/KeLAnWGFGvFLRR0gLlhAmivmNmJcyk8c0=; b=zq8IEidkx0Xqbod8VAmczTIKMM
	AEhg2KIiKuk+KtdxWvNkh1QNKXw/XR//mj2F6XPnoN36BFs9WECrz9IZA6B4/lBMQfrE5B6YO/qqB
	eEuK4ET2MiIdV45RZLaij/c64q6VRCVyTbXBOdzbGiw20XCshZlPNjgM7oGnoLAb6eUtnMLoNGS2/
	Jg/0U8o5NuGajsLlrnaXJ2ppTZkU7YavGQg9wNi6N3aDGGyW6rZ5PbIdv4fld3UWnaCHtcV0+1g5k
	B4KYAPNzz8Y9clNd0zscapaPdyTVbyr0uA9nLD4AW0NjcM2+HPVBnUUJcG4JcTv73KKwE7mV55/WH
	bf0y7Big==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAM-00000007X6G-380T;
	Tue, 11 Nov 2025 17:28:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAK-00000007X4a-0Snj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:28:25 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD3211D29;
	Tue, 11 Nov 2025 18:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762881983;
	bh=bsmd7kg6qnIb8MlMDLkiQd6rQpcUfqqxFWYPX1fT4WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfqk8SwcT5h2+q1NJF3KwQzpmFNVGC595cqR5z3NIVjAegXLrB56owuRgJqc6E9EP
	 ACkTo6j2Ub5YCF3saLI3kxZD2yo9WNAWD6EYbbntbHiNqX5gLpxhiTIFz07LTO/Dc1
	 ygB8oCU1JnuLQ8JWd20ngFgqS/AlJhIqU6wQvChc=
Date: Tue, 11 Nov 2025 19:28:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20251111172815.GA12331@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-2-5ecb081ce79b@nxp.com>
 <20251027001151.GN13023@pendragon.ideasonboard.com>
 <AS8PR04MB908014E336F99BEEB504EDB7FAC4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB908014E336F99BEEB504EDB7FAC4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_092824_617984_F5908D2F 
X-CRM114-Status: GOOD (  32.43  )
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

On Tue, Nov 04, 2025 at 07:47:43AM +0000, G.N. Zhou (OSS) wrote:
> On Monday, October 27, 2025 8:12 AM, Laurent Pinchart wrote:
> > On Thu, Oct 23, 2025 at 05:19:43PM +0800, Guoniu Zhou wrote:
> > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > >
> > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > >
> > > No functional changes intended.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52
> > > ++++++++-------------------
> > >  1 file changed, 15 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > index d333ff43539f061b8b9cf88af2cda8c44b3ec2a9..fd202601d401145da8be23df4451
> > > f6af660642c5 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -71,21 +71,6 @@ enum {
> > >  	ST_SUSPENDED	= 4,
> > >  };
> > >
> > > -enum imx8mq_mipi_csi_clk {
> > > -	CSI2_CLK_CORE,
> > > -	CSI2_CLK_ESC,
> > > -	CSI2_CLK_UI,
> > > -	CSI2_NUM_CLKS,
> > > -};
> > > -
> > > -static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> > > -	[CSI2_CLK_CORE] = "core",
> > > -	[CSI2_CLK_ESC] = "esc",
> > > -	[CSI2_CLK_UI] = "ui",
> > > -};
> > > -
> > > -#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> > > -
> > >  struct imx8mq_plat_data {
> > >  	int (*enable)(struct csi_state *state, u32 hs_settle);
> > >  	void (*disable)(struct csi_state *state); @@ -111,7 +96,8 @@ struct csi_state {
> > >  	struct device *dev;
> > >  	const struct imx8mq_plat_data *pdata;
> > >  	void __iomem *regs;
> > > -	struct clk_bulk_data clks[CSI2_NUM_CLKS];
> > > +	struct clk_bulk_data *clks;
> > > +	int num_clks;
> > >  	struct reset_control *rst;
> > >  	struct regulator *mipi_phy_regulator;
> > >
> > > @@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
> > >  			      CSI2RX_SEND_LEVEL);
> > >  }
> > >
> > > -static int imx8mq_mipi_csi_clk_enable(struct csi_state *state) -{
> > > -	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
> > > -}
> > > -
> > > -static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
> > > +static struct clk *find_esc_clk(struct csi_state *state)
> > 
> > This is one of the reasons why I don't like devm_clk_bulk_get_all(). I won't
> > object to this patch, but I don't like it. At the very lest, you should look up the
> > clock at probe time and cache it in the imx8mq_plat_data structure, to avoid
> > looking it up multiple times at runtime.
> 
> Ok, but could we cache the clock in the csi_state structure? Because the imx8mq_plat_data
> structure instance is const.

Yes sorry that's what I meant.

> > >  {
> > > -	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
> > > -}
> > > -
> > > -static int imx8mq_mipi_csi_clk_get(struct csi_state *state) -{
> > > -	unsigned int i;
> > > +	int i;
> > >
> > > -	for (i = 0; i < CSI2_NUM_CLKS; i++)
> > > -		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
> > > +	for (i = 0; i < state->num_clks; i++) {
> > 
> > Make state->num_clks unsigned instead of making i signed.
> > 
> > > +		if (!strcmp(state->clks[i].id, "esc"))
> > > +			return state->clks[i].clk;
> > > +	}
> > >
> > > -	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
> > > +	return NULL;
> > 
> > This needs to become a probe error.
> 
> Got it, will update in next version.
> 
> > >  }
> > >
> > >  static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> > > @@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> > >  	 * documentation recommends picking a value away from the boundaries.
> > >  	 * Let's pick the average.
> > >  	 */
> > > -	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
> > > +	esc_clk_rate = clk_get_rate(find_esc_clk(state));
> > >  	if (!esc_clk_rate) {
> > >  		dev_err(state->dev, "Could not get esc clock rate.\n");
> > >  		return -EINVAL;
> > > @@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
> > >
> > >  	if (state->state & ST_POWERED) {
> > >  		imx8mq_mipi_csi_stop_stream(state);
> > > -		imx8mq_mipi_csi_clk_disable(state);
> > > +		clk_bulk_disable_unprepare(state->num_clks, state->clks);
> > >  		state->state &= ~ST_POWERED;
> > >  	}
> > >
> > > @@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
> > >
> > >  	if (!(state->state & ST_POWERED)) {
> > >  		state->state |= ST_POWERED;
> > > -		ret = imx8mq_mipi_csi_clk_enable(state);
> > > +		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
> > >  	}
> > >  	if (state->state & ST_STREAMING) {
> > >  		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> > > @@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(state->regs))
> > >  		return PTR_ERR(state->regs);
> > >
> > > -	ret = imx8mq_mipi_csi_clk_get(state);
> > > -	if (ret < 0)
> > > -		return ret;
> > > +	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
> > > +	if (state->num_clks < 0)
> > > +		return dev_err_probe(dev, state->num_clks, "Failed to get
> > > +clocks\n");
> > >
> > >  	platform_set_drvdata(pdev, &state->sd);
> > >

-- 
Regards,

Laurent Pinchart

