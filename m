Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4CEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oe7KcYD5u3/lD3HXh5rpdVfHi9bmE8Tx1TsHifblhns=; b=WlOeOF0djEXryYnCb6Ja+ZgMop
	8OfnP0/X7cON369DVc/ccMYfLn93C0+cvNUYvnojQnySiAW+oNlguxWXMRhe51qzMlXDWiBoioziy
	MRwHaVTsPxwI/auhbPEl3d7TEz9jnkd9iVfhPIlE8Cz0fnqmoAh5RUjhdaAVAuqMhCJwpKku1qZSx
	X6Xgr5YdCJDWhd3sPY0qnuardtX1toBGEvwrTazcYcVLMMoGmsZBcP2BEdKsNF0kgU3RZ9tEWt54j
	sUof0OB3PdSzV6Tr4/Ai230iWr4VMcbkW+m5/2tiQN8hXidBZpTdkOevjI+7GXJghXPCMds2I+Rok
	L36ULUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaUR-0000000AL0W-3l9q;
	Thu, 26 Jun 2025 00:29:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaMh-0000000AKSF-0aq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:21:20 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AAF606AE;
	Thu, 26 Jun 2025 02:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750897257;
	bh=U1ICztOIDUCyPeAYVX53i1F5GRZlw7dH50fsuIjkLmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW7rl2daZtr9GyL34OOAorSXxnABGt1BELfCR3m6Rli6Ho56iZ1uyXW3JAfoo1Byu
	 nP+ubCMj8+rQqwV7pJ4EG9J3KKLA/n2geVzeyvGa1Dlw48L7+L1hLIdvqPt13+w0Bu
	 mosqxUW8pvYDXznMZFbMY2YNzwWC90l9AcaNysTA=
Date: Thu, 26 Jun 2025 03:20:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250626002053.GA12213@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_172119_323957_0B82C70D 
X-CRM114-Status: GOOD (  14.05  )
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

Hi Dan,

Thank you for the patch.

On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> This was returning IS_ERR() where PTR_ERR() was intended.
> 
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")

I'll add a

Cc: stable@vger.kernel.org

to obey the media subsystem CI rules.

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  
>  		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
>  
>  		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))

-- 
Regards,

Laurent Pinchart

