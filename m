Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4ACC7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr3U/7KIrYRZEMPcxW4wcvOz6XyjW9xFQnlNqIsvj/E=; b=q02lfqkwsY0DNctP2pJjt594yj
	+ylYXsgmbwipYvOhsV38SqLtfBWv29+rZeDPPP/t7Aa+0sdEOgsexsjrPZNewA7KfG7DGc6pnJhbH
	nTKvcsLa1G5Wbz1DAQ4bbdnx5HKnjNjq8FwXIOEg4eiT+n3jRiYnu0hJ/xmJBgF3T9zm0t9TF+Nz8
	kmEIhs9PGLheHB8Nd5qsFrKthcatYUrkQ3tiQ30aftTEk+MrSAvp7WfptPXNPgN7uDfyrM5MPVSzM
	heOhBkAVvonRBPBHRs1QjBrnyWd67LJ2EzqLTMO0NUuoxcC/5ZAmYPTsiEJgxsnOyZIjV7fxXipiG
	ThsGaN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW7-0000000B0mP-22ny;
	Wed, 11 Jun 2025 19:53:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMEI-0000000A4Q2-34NB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:15:03 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53EAC526;
	Wed, 11 Jun 2025 16:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749651293;
	bh=gPozdbI3xpmxAv+kXn407bfUh6hLjnr47SUlGsJ5RY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOt6HpUk9flKVzBrV8edTT7seyKAKmte8Yfx+4gNSJ9azP9NzWTKbG/MmcfOLgDMX
	 1rdkMDvcCLkiMrNuyccUiei49CSOPbo3TzWOuCHYOfESslReCu16XrFQBBpa6DcliV
	 Wz/VZY3TuNfK79OPX5bo1LospmsQOFtdHjLUcmR8=
Date: Wed, 11 Jun 2025 17:14:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20250611141449.GA24607@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
 <20250421211438.GN17813@pendragon.ideasonboard.com>
 <aBQZjFsExJh2uRfK@lizhi-Precision-Tower-5810>
 <20250502155747.GB20093@pendragon.ideasonboard.com>
 <aBylKcZyFInlKQAR@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBylKcZyFInlKQAR@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071502_919230_FB15D7E0 
X-CRM114-Status: GOOD (  35.17  )
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

Hi Rob,

On Thu, May 08, 2025 at 08:35:53AM -0400, Frank Li wrote:
> On Fri, May 02, 2025 at 06:57:47PM +0300, Laurent Pinchart wrote:
> > On Thu, May 01, 2025 at 09:02:04PM -0400, Frank Li wrote:
> > > On Tue, Apr 22, 2025 at 12:14:38AM +0300, Laurent Pinchart wrote:
> > > > On Tue, Apr 08, 2025 at 05:53:02PM -0400, Frank Li wrote:
> > > > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > > > >
> > > > > No functional changes intended.
> > > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
> > > > >  2 files changed, 6 insertions(+), 43 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > index ecfc95882f903..015350c6f2784 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> > > > >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> > > > >  };
> > > > >
> > > > > -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> > > > > -	{ .id = "axi" },
> > > > > -	{ .id = "apb" },
> > > > > -};
> > > > > -
> > > > >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > >  	.model			= MXC_ISI_IMX8MN,
> > > > >  	.num_ports		= 1,
> > > > > @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > >  	.reg_offset		= 0,
> > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v1,
> > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > >  	.buf_active_reverse	= false,
> > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > >  	.has_36bit_dma		= false,
> > > > > @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> > > > >  	.reg_offset		= 0x2000,
> > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > >  	.buf_active_reverse	= true,
> > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > >  	.has_36bit_dma		= true,
> > > > > @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> > > > >  	.reg_offset		= 0x0,
> > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > >  	.buf_active_reverse	= true,
> > > > >  	.has_36bit_dma		= false,
> > > > >  };
> > > > > @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> > > > >  	.reg_offset		= 0,
> > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > >  	.buf_active_reverse	= true,
> > > > >  	.gasket_ops		= &mxc_imx93_gasket_ops,
> > > > >  	.has_36bit_dma		= false,
> > > > > @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
> > > > >  {
> > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > >
> > > > > -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> > > > > +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
> > > > >
> > > > >  	return 0;
> > > > >  }
> > > > > @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
> > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > >  	int ret;
> > > > >
> > > > > -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> > > > > +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
> > > > >  	if (ret) {
> > > > >  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
> > > > >  		return ret;
> > > > > @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> > > > >   * Probe, remove & driver
> > > > >   */
> > > > >
> > > > > -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> > > > > -{
> > > > > -	unsigned int size = isi->pdata->num_clks
> > > > > -			  * sizeof(*isi->clks);
> > > > > -	int ret;
> > > > > -
> > > > > -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> > > > > -	if (!isi->clks)
> > > > > -		return -ENOMEM;
> > > > > -
> > > > > -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> > > > > -				isi->clks);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> > > > > -			ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > -
> > > > > -	return 0;
> > > > > -}
> > > > > -
> > > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > > >  {
> > > > >  	struct device *dev = &pdev->dev;
> > > > > @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
> > > > >  	if (!isi->pipes)
> > > > >  		return -ENOMEM;
> > > > >
> > > > > -	ret = mxc_isi_clk_get(isi);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(dev, "Failed to get clocks\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > > >
> > > > This prevents validating that the DT contains the expected clocks, which
> > > > could cause hard to debug issues. Isn't it a problem ?
> > >
> > > It is checked by dt-binding. Now no warning by DTB_CHECK under arm64 freecale.
> > > CHECK_DTB should be enough to find expected clocks.
> >
> > Yes, the DTB check will catch issues at build time, but the driver will
> > not enforce that. I'm not sure if there's a clear policy here, and if
> > ensuring at runtime in drivers that the expected clocks are present is
> > considered as a good practice by the DT maintainers. Rob, Krzysztof,
> > Conor, do you have an opinion ?
> 
> Rob:
> 	can you comment this?

Rob, any comment on this ?

> Laurent:
> 	Many driver already switch to devm_clk_bulk_get_all() such as qcom/imx6
> pci drivers recently.
> 
> > > > > +	if (isi->num_clks < 0)
> > > > > +		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> > > > >
> > > > >  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
> > > > >  	if (IS_ERR(isi->regs)) {
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > index e7534a80af7b4..bd3cfe5fbe063 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > > @@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
> > > > >  	const struct mxc_isi_ier_reg  *ier_reg;
> > > > >  	const struct mxc_isi_set_thd *set_thd;
> > > > >  	const struct mxc_gasket_ops *gasket_ops;
> > > > > -	const struct clk_bulk_data *clks;
> > > > > -	unsigned int num_clks;
> > > > >  	bool buf_active_reverse;
> > > > >  	bool has_36bit_dma;
> > > > >  };
> > > > > @@ -282,6 +280,7 @@ struct mxc_isi_dev {
> > > > >
> > > > >  	void __iomem			*regs;
> > > > >  	struct clk_bulk_data		*clks;
> > > > > +	int				num_clks;
> > > > >  	struct regmap			*gasket;
> > > > >
> > > > >  	struct mxc_isi_crossbar		crossbar;

-- 
Regards,

Laurent Pinchart

