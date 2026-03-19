Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD78F109192A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGyNo1yAFaZCldl2KGbAbYECJRXSXAYzTbgOhTcjKeg=; b=H8iogPRFAoBQa7pNv6bHTBCaWx
	jruy3lxXfVbuL2coi0q9jPhq5JlQ/2i2hG/WhvqaCSSkS8AHGVPSPvE0CEjh72sGd8y42Qil00ars
	47kIfTgcbChjEL8bTufPfDfGvLvQceuR6pYmJwIT+aDl4Rzr6dp0eHtA09S/pLXEWnvNL4Q6hMPrQ
	P6EqQB3QamR4AFaWlH3sSNGwn9ph22ZM2kQynKFBsP7SXESGS66dYsAvzMs0KKwJrm7SZbLFUFIxT
	9yV+YiqkvqIhSTwc9Gv7uWV6yu9pUz79vrB6cFOU9FOnTklUh/dd4KDO0lsR59L28ZCtX0AOa6i8N
	Y7YJN6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LYA-0000000BcPw-3L2D;
	Thu, 19 Mar 2026 22:09:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LY8-0000000BcPb-0cd6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 22:09:05 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94ACF9A6;
	Thu, 19 Mar 2026 23:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773958068;
	bh=jq8yNxg7Yiz2NU+7p28rjZpnAu9NVY9En1FhSO5xowI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+4rAm9/Wks6PNphwB6BAf/x2uMc5Gn6fwowKQ3v6ucXZ8ZbYpIa+AcP2i7QGdT6P
	 KNk8LvgfQDM/BMlTGOidKV+r907R5GXkiE+TXd/iZnNN8PiExVkGeuir62Eq/ETF0A
	 LVitmz37wqxKpQIf9cEq8oGko1SBUA5eLl1lkYVw=
Date: Fri, 20 Mar 2026 00:09:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20260319220901.GD950375@killaraus.ideasonboard.com>
References: <20260306044536.149204-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306044536.149204-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_150904_354460_704D6D61 
X-CRM114-Status: GOOD (  21.60  )
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

On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> Use a flexible arraay member to combine allocations.
> 
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 16392420903a..657ffecc4d7e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>  
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
> +	const struct mxc_isi_plat_data *pdata;
>  	struct device *dev = &pdev->dev;
>  	struct mxc_isi_dev *isi;
>  	unsigned int dma_size;
>  	unsigned int i;
>  	int ret = 0;
>  
> -	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> +	pdata = of_device_get_match_data(dev);
> +	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
>  	if (!isi)
>  		return -ENOMEM;
>  
>  	isi->dev = dev;
>  	platform_set_drvdata(pdev, isi);
>  
> -	isi->pdata = of_device_get_match_data(dev);

I'd keep

	isi->pdata = pdata;

here and not below.

> -
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);

Wouldn't it be simpler to just replace this with devm_kcalloc() ?

	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
				  sizeof(isi->pipes[0]), GFP_KERNEL);

No other change would be needed.

> -	if (!isi->pipes)
> -		return -ENOMEM;
> -
>  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
>  	if (isi->num_clks < 0)
>  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(isi->regs),
>  				     "Failed to get ISI register map\n");
>  
> +	isi->pdata = pdata;
>  	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0..99532efa4e41 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -286,7 +286,6 @@ struct mxc_isi_dev {
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;
> -	struct mxc_isi_pipe		*pipes;
>  	struct mxc_isi_m2m		m2m;
>  
>  	struct media_device		media_dev;
> @@ -294,6 +293,8 @@ struct mxc_isi_dev {
>  	struct v4l2_async_notifier	notifier;
>  
>  	struct dentry			*debugfs_root;
> +
> +	struct mxc_isi_pipe		pipes[];
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

-- 
Regards,

Laurent Pinchart

