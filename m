Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD7C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGq/NlxAtjsAJ0iHJZCbm34KD3FPa5RENh2bCBiou+E=; b=W9FrYX0duqTBmJOTYxbm5pSQUt
	U0FSINx9iF6kDxupzWqs3NDBOCChKkReks9nhVVPzIU3wYAD3s0ww616+OLvQMY4fuwzKEVHZ6qBV
	d/WHrN6SHXRS0bpkyv4iPx8MIXQz12kXyXMUAQlSKJQRo3wd2RsNd+yDfb5Fu2Nz1fe6ZrYCEGpH2
	D5x/lOmhYepex2klFy+pGtHbfcyvsA2L1NpgiS/Y3Bnab53hXPhwCkEB80Zy01s7r3wcSXsJP7dAB
	Nq/D4wHIdTZuE9FPYOcrTSd+ekbEybp1p8GSLdCr5zz5v1j2tg9gMapJP5cNqen8E2yHB8gSvXlI5
	6+U7Ramg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s06-0000000Ftj4-1aOs;
	Wed, 02 Sep 2026 20:56:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rzy-0000000Ftho-2SMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:56:04 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 643231F8;
	Wed,  2 Sep 2026 22:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788382461;
	bh=yOp/QwLcsFzKak6geScZDKKxKOKgTlwu0GRjCfP776Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNKy6ESqs9jc1DSUAxm2rIVPt6QfPXSje/ia548HWfrwix7W2Rg+9ymN3AXRk6YX0
	 +zkHv6srVg7BOqu3aakf7Dn42VXqKZ36oFDQwcEIsQfR9/sk4xoWhifJKpXyB0LFSM
	 Q0CH3JHEv1EanB5jfY7QzjWSrl+EYIK4tpKcO8Vw=
Date: Wed, 2 Sep 2026 23:55:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH v2 9/11] drm: xlnx: zynqmp_dpsub: Use
 devm_of_reserved_mem_device_init()
Message-ID: <20260902205551.GC287496@killaraus.ideasonboard.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
 <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_135558_770125_CF0CEA64 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu, Sep 03, 2026 at 01:46:38AM +0530, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 53ab1a2a5aaf..e93a7a299b52 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  
>  	/* Try the reserved memory. Proceed if there's none. */
> -	of_reserved_mem_device_init(&pdev->dev);
> +	devm_of_reserved_mem_device_init(&pdev->dev);
>  
>  	ret = zynqmp_dpsub_init_clocks(dpsub);
>  	if (ret < 0)
> @@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	clk_disable_unprepare(dpsub->apb_clk);
>  err_mem:
> -	of_reserved_mem_device_release(&pdev->dev);
>  	if (!dpsub->drm)
>  		zynqmp_dpsub_release(dpsub);
>  	return ret;
> @@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  	clk_disable_unprepare(dpsub->apb_clk);
> -	of_reserved_mem_device_release(&pdev->dev);
>  
>  	if (!dpsub->drm)
>  		zynqmp_dpsub_release(dpsub);

-- 
Regards,

Laurent Pinchart

