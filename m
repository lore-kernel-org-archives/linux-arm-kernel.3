Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0FACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/Ihi6UXJXAPgBr+Noa9vwGja4g8/S6TSJ7wPx33P24=; b=zNTmzHWtvoiig1xcMEnKw9G/t3
	DcT9nMprSC8KxrcePGG8FgrRV4wpkIQdQHm2qAPeGOXRxRJubr31holMg8UWVgQowtNotAG5a2mht
	Nt5H/cOMrVvMegdqq1eCsUWCWQqVNOGFk6F+hI1p3eY16bi97aqGGZOfotHYTVIUwBfVdOkMYwzWW
	ETZAjm2q+wn3dagdNWSPDmKUOl3+dUBmpEwRjv5kJjY7/gODmgahL4C+byVXnjwj/6HkgyHs/u0Bi
	+MZjFhXBfYJNN8U56QEVztcreow9A2UzhOiZs7kEbvrgVCWoVY4aIGTK7bVutIpBhdZImUBuvRZn1
	GA6s3KBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokhi-0000000EFgr-0k8s;
	Wed, 20 Aug 2025 15:26:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojOM-0000000DvUY-1md8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:02:19 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A7AEF1AE2;
	Wed, 20 Aug 2025 16:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698478;
	bh=w8ezJzqhy8n68dXoxVBN52WAlnF5mf3hrGaTfYPHzog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vK37rISs1SJDLKpEXy9hm3UXw3azhPo/yxiXwH65pfq7HGWSUbI6go821MobIMKZI
	 DFgkd6IjfJyS+sVYqBRF4hhPiU0qMPnztPVoICUeQVCMw39nUMaRGBzo0F+ECYVnSp
	 SU/t4m8bX4+CXHTmIPXsVttddfJIajeImUPV9UYI=
Date: Wed, 20 Aug 2025 17:01:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: maudspierings@gocontroll.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
Message-ID: <20250820140154.GB6190@pendragon.ideasonboard.com>
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070218_598770_36F44DC4 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Maud,

On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> media_pad_remote_pad_first() can return NULL if no valid link is found.
> Check for this possibility before dereferencing it in the next line.
> 
> Reported/investigated in [1]:
> 
> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> I'm not sure if this should be a dev_dbg(), just following the pattern
> around it for now, also not sure if EPIPE is the correct error.

I've submitted
https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
which should fix this issue in a more generic way.

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>  	}
>  
>  	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> +
> +	if (pad == NULL) {
> +		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
> +			sink_pad);
> +		return ERR_PTR(-EPIPE);
> +	}
> +
>  	sd = media_entity_to_v4l2_subdev(pad->entity);
>  	if (!sd) {
>  		dev_dbg(xbar->isi->dev,
> 
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250818-imx8_isi-954898628bb6

-- 
Regards,

Laurent Pinchart

