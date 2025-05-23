Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A4C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zBKODDPWzssXukiO8fmzEbXVTE4uBK7jHE7OYnuMoM=; b=dIOHkqHuZQ1GqeI3R8ASoeYiby
	+4SQQ43RNMOqZjjtZ3SfS741sfWMq43i2K+Apzpmo0CMM6N6TWN3M+5JfdheSKVF6ORdfgudDniyk
	n5houx9s1XPNqx1QzJL9XDa37MykHTdocTD/it5bE7vjypA582QAw57KZT0DdVaaQdLN6uboLhiEs
	lzvy9PPd32IdTGuE13ktzoFf7jvfAMAtWMlwsyYgUbNc23uhWkoZ0G1Fx441txCcYVjlcS09lSy3d
	icwEnssVfkaXLt9jIeVziOGSzmN6V8h4nGml7zk4IvVL0n2kq0F2LYiQdvG7mtshM9mHcamt1J7BX
	h2hByXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1V-00000003KcJ-2jDC;
	Fri, 23 May 2025 08:45:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINU6-00000003H1l-1yXo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:10:31 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 272D8833;
	Fri, 23 May 2025 10:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747987805;
	bh=35VcFiRUCOVd+LfCiJqN/5D7lUMMFSNB8+Td4FcHvrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsYIrV6ZSXiTYMDqPVZEq3+E2kuKU5YHGqTIMi/IllQKN0J9HgfAcViIiaIP4F4ZZ
	 upi7lHiu+KfJWveHtIMPiTXNZGsx6KKsdNoM10KNMLoRzO/awqx3uieePT4Ks1nJml
	 tM+iEWusLgLiwCEFfwXYg7ZlYp3HrzdLVeMc/ito=
Date: Fri, 23 May 2025 10:10:20 +0200
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
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 2/5] media: i2c: imx214: Prepare for variable clock
 frequency
Message-ID: <20250523081020.GA12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-2-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-2-bfb4a2b53d14@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_011030_650402_F384BCD3 
X-CRM114-Status: GOOD (  19.29  )
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

On Wed, May 21, 2025 at 09:34:25PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Move clock frequency related parameters out of the constant register
> sequences, such that the hard coded external clock frequency can be
> replaced by a variable in the upcoming patches.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 54 ++++++++++++++++++++++++++--------------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9..3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -299,16 +299,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
>  	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
>  	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
>  
> -	{ IMX214_REG_VTPXCK_DIV, 5 },
> -	{ IMX214_REG_VTSYCK_DIV, 2 },
> -	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> -	{ IMX214_REG_OPSYCK_DIV, 1 },
> -	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
> -
>  	{ CCI_REG8(0x3A03), 0x09 },
>  	{ CCI_REG8(0x3A04), 0x50 },
>  	{ CCI_REG8(0x3A05), 0x01 },
> @@ -362,16 +352,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
>  	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
>  	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
>  
> -	{ IMX214_REG_VTPXCK_DIV, 5 },
> -	{ IMX214_REG_VTSYCK_DIV, 2 },
> -	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> -	{ IMX214_REG_OPSYCK_DIV, 1 },
> -	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
> -
>  	{ CCI_REG8(0x3A03), 0x04 },
>  	{ CCI_REG8(0x3A04), 0xF8 },
>  	{ CCI_REG8(0x3A05), 0x02 },
> @@ -405,9 +385,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
>  	/* ATR setting */
>  	{ IMX214_REG_ATR_FAST_MOVE, 2 },
>  
> -	/* external clock setting */
> -	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
> -
>  	/* global setting */
>  	/* basic config */
>  	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> @@ -777,6 +754,24 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> +static int imx214_configure_pll(struct imx214 *imx214)
> +{
> +	int ret = 0;
> +
> +	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
> +		  IMX214_PLL_SINGLE, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> +		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
> +
> +	return ret;
> +}
> +
>  static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
>  {
>  	int ret = 0;
> @@ -1020,6 +1015,19 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> +	ret = imx214_configure_pll(imx214);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to configure PLL %d\n", ret);

		dev_err(imx214->dev, "failed to configure PLL: %d\n", ret);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return ret;
> +	}
> +
> +	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
> +			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to configure link bit rate\n");
> +		return ret;
> +	}
> +
>  	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
>  			IMX214_CSI_4_LANE_MODE, NULL);
>  	if (ret) {

-- 
Regards,

Laurent Pinchart

