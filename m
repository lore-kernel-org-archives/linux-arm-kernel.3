Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76B2CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0wSjIk28XObTGgC7FSJ1JrN5pbyUU2mnHqa4nUVu6k=; b=bWbvC2TP/E54QwY4rdmrMvmMQ7
	Lu+Umfe24LcizBmmRdsPpwN3Ods+unSa5xQHM98L0D4vgOroAoyvSvGmSysWvozyWd37bpsI4xNx4
	oS3vSxNQvz3DOs3Tlw9kFzgM0jS5NlPyLi6WJYAa1weY/+NiG3GHbXrX2ZwkyZHZ7SyubIjVbKzPZ
	qXdm1VDraT61CryI6B9EQS+2RRWlk3F6eod2NH6OaalTPVE4LrsuGCi3gAgC79q7wx6qZNRs9n48H
	QNiqQNnspokD/yKsv+PNq7p94TzscVr8Ksu0Vjo7OWLhZOo4USu5vTs9uAznITy7KunUeV3GsedBw
	TwtBoXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAVF-0000000CrvS-0ThI;
	Sun, 26 Oct 2025 23:50:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAVD-0000000Crud-12TX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 23:50:24 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 46579E77;
	Mon, 27 Oct 2025 00:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761522513;
	bh=8Ka4KDuKSKR42vpWKdt7GFbxhPMHhPwGK1RFzHHs4nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPigjbWltVZE8/Mr7XP81ImDEVEkv8Z+Pgr0VaS2RBysqHPXxaPl/ZpRVMKHbajTv
	 CkHbISjneiKi9JInf+q9Vd8m70MJDYog2uvC1AfNO9QciMrPppNz6STNKoWUkTxy3M
	 B5irh0C5gKbUrWHWgKHJvdynxS6sJVahxgFUVEB4=
Date: Mon, 27 Oct 2025 01:50:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Message-ID: <20251026235006.GK13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_165023_423320_DEABE533 
X-CRM114-Status: GOOD (  15.51  )
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

On Wed, Aug 20, 2025 at 07:04:58PM +0800, Guoniu Zhou wrote:
> Add format RGB565 and RGB24 support.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index ad7adc677e389e0f35b0cf63195279e197907f8c..529928b94a193e02177f8773a0e68375b59b0a08 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -306,6 +306,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,

There's ongoing discussions regarding what format is appropriate for
CSI-2 RGB565, see
https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.
Let's see what the outcome will be.

> +	}, {
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.output = MEDIA_BUS_FMT_RGB888_1X24,

This looks right.

> +	},
>  };
>  
>  static const struct csi2_pix_format *find_csi2_format(u32 code)

-- 
Regards,

Laurent Pinchart

