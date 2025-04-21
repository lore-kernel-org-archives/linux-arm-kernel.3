Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CBEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOHuokpISTPeuhhGkHpUIQHlFP5Q50jsR2s8c05fir0=; b=soJgAOcSInFRjBRpJSn3WLqYhg
	bN9fBdvyjX1iKr3FTWthG8GPgADhcNkm3Si71U3PQzOFW3p6fM5v9+f8to+9f1cCBZKhPkW+MAu1J
	ebRp1aoyr+O/wMs5fGBdJu+gG813dyMMWEoCwSp0zTs/Lo9zqdiKfO7umcn2ktS6pfKl/eYtIiGRy
	c2WJReji2XBevrAbBtsS80McuhnlEGUTvBiGe+qjzsUYEcR/2b5Ud3Ax5x2xnVgqb2UblVszFE5Ud
	yDgbdNJbmgQtnXnGdVFRP49ebyRrcFHJY9ay2VBWlK74/ux1dWcOjP6ZuSmLvG763WmKwg1Av12eG
	KGymOGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yZz-00000005AXJ-0Z8w;
	Mon, 21 Apr 2025 21:21:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yY7-00000005ALk-0pEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:19:32 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 460536D6;
	Mon, 21 Apr 2025 23:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745270242;
	bh=zKVa3Z5aM32fCtoxaiw1OCcvtoZ41LoC9dMmnkEK18Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxXpiLfY1K3IMcZFWy/UyfAvTFnjR5IhvBQ8X0xgNiCiybSUeGP8AOik/4QpkrVpE
	 87A2M/3P9gVlzCoJcFab91etnV+Zm3OR5AfQiQ6UNow0jWaq/LgEbkj6TTOm8/xiR6
	 xrOMBeoz0qqRlzfiptHMp1OjqqKM9QbSxN/FXuZw=
Date: Tue, 22 Apr 2025 00:19:27 +0300
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
Subject: Re: [PATCH v4 05/13] media: nxp: imx8-isi: Remove redundant check
 for dma_set_mask_and_coherent()
Message-ID: <20250421211927.GO17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-5-ef695f1b47c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-5-ef695f1b47c4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_141931_375252_407096DD 
X-CRM114-Status: GOOD (  16.12  )
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

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:03PM -0400, Frank Li wrote:
> dma_set_mask_and_coherent() never return failure when mask bigger than
> 32bit.
> 
> See commit f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")
> 
> So remove return value check for dma_set_mask_and_coherent().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 015350c6f2784..073ea5912de3b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -444,11 +444,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	}
>  
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
> -	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
> -	if (ret) {
> -		dev_err(dev, "failed to set DMA mask\n");
> -		return ret;
> -	}
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
>  
>  	pm_runtime_enable(dev);
>  

-- 
Regards,

Laurent Pinchart

