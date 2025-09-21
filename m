Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9C3CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt59GR5TcLCGzgWqOIzVnW+nSWdBZtZjDUtwtdUhIzI=; b=KY8GqzrjmgugZGO4D5ohUFco+n
	MFh1ND9D2wQE4uH0XBeVFuc+bn0fsPqk/rrX0Fs03qRiww+yGy87gbB8NmdoH4dGIB+Q5hgnANaYD
	Chj0UJrB5/XoKsJAoZCWIyv/6/TwkOgJ3ZcSmuXMIMQmghhMDP373Gotrd5NuxxJLphIyl1g9hfw2
	LXK7vx/JkcrbaSLiLO7DBwvnCMwmT7JVX6tSZV74ZJbDEoz/Pzwp1WlKalXOWRJJBL0x+NHTASmEY
	JQn/V9AmsohNtekqMbQzE0Isdqm3c07n5aIgkSXj/JJz30fvB0NOwmZAOIQqC/bZZow9kftf90NCY
	X0EMuf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SJl-00000008Jq6-1mFQ;
	Sun, 21 Sep 2025 22:14:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SJi-00000008Jov-0Cjx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:14:00 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 48C4F10C4;
	Mon, 22 Sep 2025 00:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758492754;
	bh=cfJqWM3gbOoRfqSqWNMf7IHBruDGEX51ga3z4ZjwmqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5rG/NnT90EfM7ku/M+IctoCHC/iHip/8CBCnVNVmUJ1L53wVMrte0qwa5mueAryt
	 9OZ+jMWcA15HUbc0zezqBCKRH1OkMLpAeob8KrmZPJttWB8mlLpwOQ65TR1FDjRBl0
	 boM5P9DWU9nXeYjZD2FbcUq+8usIZ0gKRehV8z44=
Date: Mon, 22 Sep 2025 01:13:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by using
 helper macro
Message-ID: <20250921221325.GB10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_151358_225453_19DEB0C7 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Guoniu,

Thank you for the patch.

On Fri, Sep 05, 2025 at 02:55:59PM +0800, Guoniu Zhou wrote:
> Simplify code by using helper macro FIELD_PREP() and GENMASK().

I'm not necessarily against this change, but how does it "simplify code"
? There's no change in the code beside the macros, and they don't look
particularly simpler.

> No functions changed.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe6688c1b75bfd2d6049b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -3,6 +3,8 @@
>   * Copyright 2019-2023 NXP
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/regmap.h>
>  
>  #include <media/mipi-csi2.h>
> @@ -16,8 +18,7 @@
>  #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
>  
>  #define GASKET_CTRL				0x0000
> -#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> -#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> +#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))

I think you can omit the parentheses around dt here, and around x below.

>  #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
>  #define GASKET_CTRL_ENABLE			BIT(0)
>  
> @@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>   */
>  
>  #define DISP_MIX_CAMERA_MUX                     0x30
> -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
>  
>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
Regards,

Laurent Pinchart

