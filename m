Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB54D75BA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 03:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SZ7JxDLGFrx7CmlLpYDg7FLBVyWgbYYc7JyzvJYu1M=; b=GtDJaIVtGHCjNeuX5WsHAeS/If
	VTC6diUHvBkwssqe/m365BGAf/GGLF4/Lk2TcUjs8JgWeK+eIM3XT0VE2Td7mjHaeRyZBzPS8hHTc
	Mek6yYiF1vnSPBJkWjr9Vlob2ES70K1err6/dLCPdFz5a/BBqVHBqycPuqlKfwYkFYrRHb7saR588
	PLyqcYKP7FlnuFsZnx1U5CpwvukzfvGpI5V8M05Fixq+F2L/LBCajL10hNhcWYv2BYGqOECRliTFd
	uGzqES54fa7wowMiUvYJYKRgP2BsmdlukOD1289Le0sUge00UA00QJIoVWXHpzG5Gh3GEuXCFWDsd
	6MoMQBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDy8Y-0000000Gj96-3Cnd;
	Thu, 21 Nov 2024 03:45:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDy7c-0000000Gixl-0mhq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 03:44:49 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98EF8219;
	Thu, 21 Nov 2024 04:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732160664;
	bh=DvInKOgQZ+CNZOHVpuOs3IOMBVR95c0IO11QLxwYXxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0cYmXkOmOEQPnidwjMt/0/sXoHamGkPluUUZcnqxTvL1TkkKzox/uWTQ4US8sYjn
	 4ycUfzshjVKVVREZOrSn+oIpfEnDMkTQXLBpRVN0lNHkAnBHdKDWt6ZkHyxD9AVEZC
	 boaH0YD1kG2pYH7ISAV1eOv1oWpiiANn96HlLYpg=
Date: Thu, 21 Nov 2024 05:44:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] media: i2c: imx290: Register 0x3011 varies
 between imx327 and imx290
Message-ID: <20241121034434.GF12409@pendragon.ideasonboard.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-2-7e562cf191d8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-media-imx290-imx462-v2-2-7e562cf191d8@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_194448_369946_10EEDD77 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Dave,

Thank you for the patch.

On Wed, Nov 20, 2024 at 07:17:04PM +0000, Dave Stevenson wrote:
> Reviewing the datasheets, register 0x3011 is meant to be 0x02 on imx327
> and 0x00 on imx290.
> 
> Move it out of the common registers, and set it appropriately in the
> sensor specific sections. (Included for imx290 to be explicit, rather
> than relying on the default value).
> 
> Fixes: 2d41947ec2c0 ("media: i2c: imx290: Add support for imx327 variant")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index da654deb444a..7d794a509670 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -268,7 +268,6 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
>  	{ IMX290_WINWV, 1097 },
>  	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
>  			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> -	{ CCI_REG8(0x3011), 0x02 },
>  	{ CCI_REG8(0x3012), 0x64 },
>  	{ CCI_REG8(0x3013), 0x00 },
>  };
> @@ -276,6 +275,7 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
>  static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
>  	{ CCI_REG8(0x300f), 0x00 },
>  	{ CCI_REG8(0x3010), 0x21 },
> +	{ CCI_REG8(0x3011), 0x00 },
>  	{ CCI_REG8(0x3016), 0x09 },
>  	{ CCI_REG8(0x3070), 0x02 },
>  	{ CCI_REG8(0x3071), 0x11 },
> @@ -329,6 +329,7 @@ static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  };
>  
>  static const struct cci_reg_sequence imx290_global_init_settings_327[] = {
> +	{ CCI_REG8(0x3011), 0x02 },
>  	{ CCI_REG8(0x309e), 0x4A },
>  	{ CCI_REG8(0x309f), 0x4A },
>  	{ CCI_REG8(0x313b), 0x61 },

-- 
Regards,

Laurent Pinchart

