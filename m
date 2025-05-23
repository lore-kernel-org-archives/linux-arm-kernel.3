Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0DCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+/tdVwk1mREOVeeyd/F2RG+IHbxroIl5cTtzYrciqQ=; b=FrTFxOJoSGUaFfUsvqJ6XNMb8p
	uIfj0TzhKgbFDcSZ26UPbxDrkLD4NQt/PABVVJpogRLQco87G+2wNAnZOgpTIpbBIADtvwg24UnRA
	FyXfllDBqZqaYTtW48wVZ5Bs/sT7LiL1v/h6xZ2m0rB1aB39oVs48DSJqH5UvwbfBhcXZ5wIcIEp2
	DNCZGHCMZiPbKvYM9bnv+Nah+TS/N+SYJoLb93Wr5f4d+8T9kJUtfJ+T7fQ0sGXy7P/QXs/eJDfzz
	oQSaNnLsk2hxIp0PaVKs4S06HyiTjQxtJPWPIVrLylDrpWAIWwjMNFiKd53mvqHfSStnJN//Z+WKJ
	6mZ6/c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1X-00000003Kf2-2t8y;
	Fri, 23 May 2025 08:45:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINaw-00000003Hv7-0Nrg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:17:35 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 144384A4;
	Fri, 23 May 2025 10:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747988230;
	bh=BFCItceWfyuAXXe806yu+VbLQ/lI0BL9H850ON0oNA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXt5eSu8sVYfZL82LXbn4zyArt8iv+pp4jy+FOET4Yq/rZz0f6QDRCf70KFG7/fiw
	 so0KRl3BEWQ97BQaMpkQ/advHhkbceM8SoU6pzKgNgbfxFc4IlOsvq9wA1tXAVECzH
	 rOuhxR4vR5AWAlSc6Lxm4E7D82VWkJUc+fJ15UDg=
Date: Fri, 23 May 2025 10:17:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <20250523081725.GB12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-5-bfb4a2b53d14@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_011734_273140_118FD75E 
X-CRM114-Status: GOOD (  16.10  )
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

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:28PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Instead rely on the rate set on the clock (using assigned-clock-rates
> etc.)
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 19b494c08ece9894de67a4ee34c6f8e6e2708e41..264e897ec6e8e3d2fcd9d58db82090c7dd85d526 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -32,7 +32,6 @@
>  
>  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
>  
> -#define IMX214_DEFAULT_CLK_FREQ	24000000
>  #define IMX214_DEFAULT_LINK_FREQ	600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> @@ -1402,11 +1401,6 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
>  				     "failed to get xclk\n");
>  
> -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to set xclk frequency\n");
> -
>  	ret = imx214_get_regulators(dev, imx214);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
Regards,

Laurent Pinchart

