Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1373BE67819
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmgyDgy52nUQCQUsLf0InQcB4P85ZJma4GrMuXDowN4=; b=4hQ93Yf8UeKVsZP87VUBrikHXN
	QbFGOL7fp2kQrJvbACXx1t/PErm8ZN7hDtePZCYVAf7g/Ps9N4i87pFLZkyHFyVTsP1O6oQzBuF//
	5rodlt9s6noYhI5eUwheUkNmr/2xRMsfLyszLd2P5u965NnhhfyxkAHZtSArvMnEnoYaca/+gcbPz
	QkbpoF+EkMaUN1jRp0qTEzKRBLW+s3ePweG+YBmVSGxoq3qxeCOjXkdd88BUMr80JniuSeeWoPSDe
	B/DuqR91Z5HtAqFYQgiXT8M76HdsbSQN7IGulvV8Ag4NdquCRkHAEjfB+t58dJSxoCAZQuIHNw3vX
	Qn6aRlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7OSO-0000000AgAP-46vO;
	Sun, 03 Nov 2024 00:27:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7OQj-0000000Afyi-450W;
	Sun, 03 Nov 2024 00:25:23 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423A555;
	Sun,  3 Nov 2024 01:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730593511;
	bh=T5lY0VFW9AW0Z5PycEDmia0b3jlRK4Bvlp4nWq1UAsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVmPniK86gSIGr7/pQ9PNqkrVYsdj5VhFnaGqiIKlrwgzDxW+wevmrchNXFdX0g+s
	 1fRMSs959ipS1nVGxPHF+OpnL7cRYjqStR7CcSSOEGMSuums63e38XMv/d7eMJ1dA9
	 LGGPW4xppKJnA5vMrvFBnsOg/DheMln2Ahc/UFzQ=
Date: Sun, 3 Nov 2024 02:25:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
Message-ID: <20241103002510.GO2473@pendragon.ideasonboard.com>
References: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_172522_173312_8AE1E262 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Tomi,

Thank you for the patch.

On Fri, Nov 01, 2024 at 01:55:15PM +0200, Tomi Valkeinen wrote:
> When using buffers from DRM, DMA-API gives a warning about: "mapping sg
> segment longer than device claims to support [len=307200] [max=65536]"
> 
> Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
> about the supported segment size (which is UINT_MAX).
> 
> Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 045910de6c57..e52d8b20df40 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -2341,6 +2341,12 @@ static int cfe_probe(struct platform_device *pdev)
>  		goto err_cfe_put;
>  	}
>  
> +	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to set max_seg_size\n");

Maybe dev_err_probe() ? Or drop the error message, as
vb2_dma_contig_set_max_seg_size() already prints an error.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		goto err_cfe_put;
> +	}
> +
>  	/* TODO: Enable clock only when running. */
>  	cfe->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(cfe->clk))
> 
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

-- 
Regards,

Laurent Pinchart

