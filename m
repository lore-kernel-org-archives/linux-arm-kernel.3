Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOS5gpQv+OL5pV1IHrIk3h6kTIRktxGtM47GmGUrQMc=; b=1ZS/GuCq+J6YCzF7mSENCD93/q
	Hs5Se4eCLhiU4UCVWC2ACbA0OtTOIu29coWDLHE613ClNpJMdYil+h+XeqbDyzHzd1nINHBCUWKCb
	e5GrncpYQp+1tPMe7u2PaeHnnN57C5UpGpLSet+H3/DJuB+t0nrT1/GyrcchUrGB1VNTtQOY3EbRF
	FkLkr1soA4uvr3r0rZnYk5w8v1Rvc9oBMBMSPa8syweWsCwUGAZKC/qaqbzv7BAxd4/MsBdsCMQFb
	TWlG4sDEbQS4lEd7/OSE84lU+MCe7Q/iur3vADIbi/eYWoY1YFRjrcO4PYjnC2XmsCfLENR9yvnMG
	42EoAMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYWA-00000007m3J-1Vs3;
	Tue, 17 Jun 2025 15:46:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXOS-00000007Zqk-423t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:34:34 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EEB57E1;
	Tue, 17 Jun 2025 16:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750170859;
	bh=7eVSwYhRrsGw308e1gWXBm5X3J3BsCedcVcfc7DyDMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRFjA2m2TzJPaNadVlp/g6nZhQtjBw8DzZMp2uaxV4XCS8ILolO/l48V2PRSJkYG7
	 615Ja/S+EC/SeBscdF5aji3VzhpJUeZz9rvH316vYgyFJ7rrCXG3BHCzHm8kDFKSkv
	 bpv0l1rrXPZER84ZeLYfbQ/1c6YQqdHsDId+UYeg=
Date: Tue, 17 Jun 2025 17:34:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v5 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20250617143416.GA21052@pendragon.ideasonboard.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-4-d4be869fdb7e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-4-d4be869fdb7e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_073433_145566_DB45B901 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Frank,

On Thu, May 22, 2025 at 01:56:42PM -0400, Frank Li wrote:
> Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> 
> No functional changes intended.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> change in v5
> - none
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
>  2 files changed, 6 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index ecfc95882f903..015350c6f2784 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
>  };
>  
> -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> -	{ .id = "axi" },
> -	{ .id = "apb" },
> -};
> -
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
> @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v1,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= false,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.reg_offset		= 0x2000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
> @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.reg_offset		= 0x0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
>  {
>  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
>  
> -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
>  
>  	return 0;
>  }
> @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
>  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
>  		return ret;
> @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>   * Probe, remove & driver
>   */
>  
> -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> -{
> -	unsigned int size = isi->pdata->num_clks
> -			  * sizeof(*isi->clks);
> -	int ret;
> -
> -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> -	if (!isi->clks)
> -		return -ENOMEM;
> -
> -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> -				isi->clks);
> -	if (ret < 0) {
> -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> -			ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	if (!isi->pipes)
>  		return -ENOMEM;
>  
> -	ret = mxc_isi_clk_get(isi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to get clocks\n");
> -		return ret;
> -	}
> +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> +	if (isi->num_clks < 0)
> +		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
>  
>  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(isi->regs)) {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e7534a80af7b4..bd3cfe5fbe063 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct mxc_gasket_ops *gasket_ops;
> -	const struct clk_bulk_data *clks;
> -	unsigned int num_clks;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
>  };
> @@ -282,6 +280,7 @@ struct mxc_isi_dev {
>  
>  	void __iomem			*regs;
>  	struct clk_bulk_data		*clks;
> +	int				num_clks;
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;

-- 
Regards,

Laurent Pinchart

