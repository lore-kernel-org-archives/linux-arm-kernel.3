Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr3a6S1UZO01+kaL4CYnN2kap3jBya1c4TJGxgfo2V8=; b=KD0Nv9tndP57yeFgBPwkRVUGNO
	LWZ6q7jmn+g+Sgx6hDY+ZSpj7+OiL+YHRKUPmCkhv0vTrCGBFov3tQO4ciPjQqMu28PhGMj+VEhcE
	rzBWDh1KdU3DjDQXqRyoQeRfcfDIOUD05TtTF9YkBV6+YopDLjAdiwCisfn9+kVjlVEeSD7x2UmyR
	Q9QFjDpzlFewGPrF8Ryo65fGLn4yEmvezsi3uHayZ4+QxG1vGeHcjIIPuKv8pn8pklOrCxJRHlaz2
	zjD3R4zCkscLUnB2BRHQA7YLB43EQmLF6mKojWrcf7ofeE34fAuOT8mcXL9M3LCaZcmZCnyJzlk3b
	PYNFv0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1try1g-00000005Vxg-3ZCo;
	Tue, 11 Mar 2025 11:44:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxyX-00000005VF7-2JK5;
	Tue, 11 Mar 2025 11:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A73C8A46A4C;
	Tue, 11 Mar 2025 11:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A75AC4CEED;
	Tue, 11 Mar 2025 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741693244;
	bh=+uJX8/966KEhOX1GBFyKHP+XMrltWM13u4aR/id8BsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jy0iq12AnsMIgVe3uUuG2Vb0J1re8F3/OPHbboZBhVadT+d8LLPyVgPu3+OPvq8Cs
	 JLxIDkLqdb9IaWCLu+m70qK2fUSL2bq4/txnb06XLgcDdPGPV+O7BOLA0x79LM0fYl
	 AzHVzTCeyZIqvaaVIAkJunkvu6dDI/mfdTDdNKex/rmoCViOgLp6srdnigbmG7THZt
	 lw4NJHxo8tUIJcaUWDryzc6uxC5pVF4idsCDkLi1cDn3metAYhcDT7hh4ZBSpV0c7n
	 fHLlfkNymGAQ9RbRujaTRa3EVVxmdL3aZE3s3hQx2W5zNELFvGGujbXEOLm4NeoWM4
	 tON/JZFSkpOfA==
Date: Tue, 11 Mar 2025 12:40:39 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 10/13] phy: airoha: Add support for Airoha AN7581 USB PHY
Message-ID: <Z9AhN9T8s1oogCUn@vaman>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-11-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_044045_718841_D5D6AEE3 
X-CRM114-Status: GOOD (  30.37  )
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

On 09-03-25, 14:29, Christian Marangi wrote:
> Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
> USB port with USB 2.0 mode always supported and USB 3.0 mode available
> only if the Serdes port is correctly configured for USB 3.0.
> 
> On xLate probe, the Serdes mode is validated and the driver return error
> if the Serdes mode doesn't reflect the expected mode. This is required
> as Serdes mode are controlled by the SCU SSR bits and can be either USB
> 3.0 mode or HSGMII or PCIe 2. In such case USB 3.0 won't work.
> 
> If the USB 3.0 mode is not supported, the modes needs to be also
> disabled in the xHCI node or the driver will report unsable clock and
> fail probe.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/phy/Kconfig                 |   1 +
>  drivers/phy/Makefile                |   3 +-
>  drivers/phy/airoha/Kconfig          |  13 +
>  drivers/phy/airoha/Makefile         |   3 +
>  drivers/phy/airoha/phy-airoha-usb.c | 554 ++++++++++++++++++++++++++++
>  6 files changed, 574 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  create mode 100644 drivers/phy/airoha/phy-airoha-usb.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2dd385e9165..1835e488ccaa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -758,6 +758,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yam
> +F:	drivers/phy/airoha/phy-airoha-usb.c
>  
>  AIRSPY MEDIA DRIVER
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe998ec..19c9c518fc3d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -93,6 +93,7 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> +source "drivers/phy/airoha/Kconfig"
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442acc75..71708c6865b8 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -12,7 +12,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> -obj-y					+= allwinner/	\
> +obj-y					+= airoha/	\

Directory for a single driver? Also move the PCIe driver in, if you
really want to do this

> +struct airoha_usb_phy_priv {
> +	struct device *dev;
> +
> +	struct regmap *regmap;
> +
> +	unsigned int id;
> +
> +	struct airoha_usb_phy_instance *phys[AIROHA_USB_PHY_MAX_INSTANCE];

No need for empty lines here?

> +static int airoha_usb_phy_u2_slew_rate_calibration(struct airoha_usb_phy_priv *priv)
> +{
> +	u32 fm_out;
> +	u32 srctrl;
> +
> +	/* Enable HS TX SR calibration */
> +	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
> +			AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
> +
> +	usleep_range(1000, 1500);
> +
> +	/* Enable Free run clock */
> +	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
> +			AIROHA_USB_PHY_FRCK_EN);
> +
> +	/* Select Monitor Clock */
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
> +			   AIROHA_USB_PHY_MONCLK_SEL,
> +			   priv->id == 0 ? AIROHA_USB_PHY_MONCLK_SEL0 :
> +					   AIROHA_USB_PHY_MONCLK_SEL1);
> +
> +	/* Set cyclecnt */
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
> +			   AIROHA_USB_PHY_CYCLECNT,
> +			   FIELD_PREP(AIROHA_USB_PHY_CYCLECNT,
> +				      AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT));
> +
> +	/* Enable Frequency meter */
> +	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
> +			AIROHA_USB_PHY_FREQDET_EN);
> +
> +	/* Timeout can happen and we will apply workaround at the end */
> +	regmap_read_poll_timeout(priv->regmap, AIROHA_USB_PHY_FMMONR0, fm_out,
> +				 fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
> +				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
> +
> +	/* Disable Frequency meter */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
> +			  AIROHA_USB_PHY_FREQDET_EN);
> +
> +	/* Disable Free run clock */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
> +			  AIROHA_USB_PHY_FRCK_EN);
> +
> +	/* Disable HS TX SR calibration */
> +	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
> +			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
> +
> +	usleep_range(1000, 1500);
> +
> +	/* Frequency was not detected, use default SR calibration value */
> +	if (!fm_out) {
> +		srctrl = 0x5;

magic?

> +		dev_err(priv->dev, "Frequency not detected, using default SR calibration.\n");
> +	/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to the nearest digits) */
> +	} else {
> +		srctrl = AIROHA_USB_PHY_REF_CK * AIROHA_USB_PHY_U2_SR_COEF;
> +		srctrl = (srctrl * AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
> +		srctrl = DIV_ROUND_CLOSEST(srctrl, AIROHA_USB_PHY_U2_SR_COEF_DIVISOR);
> +		dev_dbg(priv->dev, "SR calibration applied: %x\n", srctrl);
> +	}
> +
> +	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
> +			   AIROHA_USB_PHY_USB20_HSTX_SRCTRL,
> +			   FIELD_PREP(AIROHA_USB_PHY_USB20_HSTX_SRCTRL, srctrl));
> +
> +	return 0;

This is the only return... consider making it void return then?
Here and other places

> +static int airoha_usb_phy_exit(struct phy *phy)
> +{
> +	return 0;
> +}

you can drop this

> +static int airoha_usb_phy_power_on(struct phy *phy)
> +{
> +	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
> +	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
> +
> +	if (instance->type == PHY_TYPE_USB2)
> +		return airoha_usb_phy_u2_power_on(priv);
> +
> +	return airoha_usb_phy_u3_power_on(priv);

for non USB2, you power both why?

> +static int airoha_usb_phy_u2_set_mode(struct airoha_usb_phy_priv *priv,
> +				      enum phy_mode mode)
> +{
> +	u32 val = 0;
> +
> +	/*
> +	 * For Device and Host mode, enable force IDDIG.
> +	 * For Device set IDDIG, for Host clear IDDIG.
> +	 * For OTG disable force and clear IDDIG bit while at it.
> +	 */
> +	switch (mode) {
> +	case PHY_MODE_USB_DEVICE:
> +		val |= AIROHA_USB_PHY_IDDIG;
> +		fallthrough;
> +	case PHY_MODE_USB_HOST:
> +		val |= AIROHA_USB_PHY_FORCE_IDDIG;
> +		break;
> +	case PHY_MODE_USB_OTG:
> +		break;

Not expecting to set this?
-- 
~Vinod

