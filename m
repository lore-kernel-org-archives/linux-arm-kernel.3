Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BWm2fVryTSX7TLsnuCucMdyctrF8pcZJHdFO1Qboag=; b=D96NnOs9aDoJyxbg0tiriww8hn
	g1LaIsYVzMsnDtLSjlpeetrNUptaDgstZ4/IEgypmHdiakT/+3OphwiYqzQ1PiauCJ60sjIkwtrSe
	RIqteeUqWyMVFnG2GYUQFN2k2XRmXzf9GBhu/gi7HsZVyJmGQi/zejMpqVZsRtkJkCnKVwBLp6K3R
	2qEqY2G5JWuu0+PSxaHbv53ngz3cX4xeSUZB7XC/t6KrCsDUtyz2z5dsQjOdIWWzrIcRRtZEKjngY
	glQ1waWsID8RHNTBC1yesMvc11w8L/NcdbPtbS/Ga9kA/a7inQT1lsb7ih/xqGLZY+BFNhuGnsQdh
	p+kddI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA24a-00000009fg8-3jVD;
	Sat, 18 Oct 2025 08:13:56 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA24X-00000009ffK-37tD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 08:13:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so331061866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760775232; x=1761380032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BWm2fVryTSX7TLsnuCucMdyctrF8pcZJHdFO1Qboag=;
        b=hLuEzg1aGV3FWKdO6mPN++xjgWT47j+j8wTAEsPejMhubQcj26eASapJKPmgVauHy8
         xnJUJAuJF3YWFvxL0iFQKp3VLJmR3bADIEW4AO5smEbQWH4we2kC2YRQgTNaa/y7XXsW
         DowowoFIrRE3xwccSmRAttnudUHRgW0d1EFLq6hkQCliZqL4gbkDhZBUQVu7OgEz3rXb
         VM9+uSRX202OlYsDGeYxhofvqUBjsT6ho+XAd+e2OXtg2zG25XsZk3gcYDH582C9jA7X
         LW8X1hh/NrQy03gaDRqFkYHidEUs3bvrnmMVhc0nhM04d9X40sP1i0+s2Sn1ZGkD2p+a
         uBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760775232; x=1761380032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BWm2fVryTSX7TLsnuCucMdyctrF8pcZJHdFO1Qboag=;
        b=ryAbToAgTOoPz4UpzsBGt4YGdOB1xdMd/dOL5jgN19sJmlsen+DB2NlZQjuhWHTwMk
         ENTLxJEApqF/gy6p1ZaB/Lcg09ZE49Zzm0WVxzU1A0nJNBLtW9i+iT7QvtmHScHH4k1v
         7Zd0fh8vl/DvtWuraWJFgEMq8P9yRl+tArfMmckYrdSjuCwTo59ZPn2h23uwzVFw4sJ/
         KVEhMDZX8b6uy3rdbwtSIANDQwFZ3RyN6LRw6ZxKuYDud8jzqHJrt9xJ78nfNFFDQ3JK
         6UIB2otDS/IMZoldHyXnN6efn6k2pLMWUpat9WEkYIbrwVHkrsuJG2oyolTlW4ktT9RW
         dRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuawup+t/xmJHNzij45JAe2yTIxeLZtwhFICRcq+ZHBiD6jyaAcTZAK2V0+sXgxmH0Q4lpRvaQ4fXxUMCVfkL6@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmyD5ZzJY9kTcX42f0Dz4440ZL+p1a/+SyCJ2utjdpqxQTfet
	WEcfOW+rd5prbd0rZAc/ggRdwHbu4WcZvpz+2+LapPGduTW2cQtIGeNJ
X-Gm-Gg: ASbGncv9jiacQY1KNvY7Pp87NpDCxbncoobUcvbbGrzvVS4N8IS86ntHGDG87ZoGZbC
	MFEi2da9iwGrau52IpdTIOIcPOvaEyzcafBK0H3Bmc5hKpxdZbeN3xpy8cjkOgskNstFGBzUsqq
	tPEWa9dFMVTo05XAtrtmDSS8DIBfTLmawQaCMjkp1cHm5jdp3dF2gdZFUYDEHCS+dwyZxMJ5H3h
	xcfiswKlZH6atJACEPFhqJcOCbHnbXpY3sYEEG/rnwTPRaRuvKIexiDEURMcTRSz2htSHerzvh2
	NRZnLjbxlQeTLBk6T6qEktXeEWHGTzvDgTzznVs5vfc5ACK/FBo1V2/APDf945ufTS+urWAl0p0
	CFUUL5KF77ngy96/RSW5IadxkcgNevIPqVCPSsD26By9XaMncw31LBge/o/5wWf01/H2t4TcOau
	5PAM9YgL8XChb1MHQbSybSI/5Tj6bMQzIu5mZ+sbSJOcEmxhE1SsMKgQ==
X-Google-Smtp-Source: AGHT+IGNDixJtPAW8Oef1zChTYomkbozhZ1mWKG9sYnl651V3ZzOLY2THmU+caOxpLoTq8ZVNQRwBQ==
X-Received: by 2002:a17:906:f58b:b0:b49:2021:793f with SMTP id a640c23a62f3a-b64764e4b0amr723616466b.53.1760775231364;
        Sat, 18 Oct 2025 01:13:51 -0700 (PDT)
Received: from [192.168.1.103] (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035b81sm182545366b.51.2025.10.18.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 01:13:50 -0700 (PDT)
Message-ID: <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
Date: Sat, 18 Oct 2025 11:13:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251017235159.2417576-1-royluo@google.com>
 <20251017235159.2417576-3-royluo@google.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251017235159.2417576-3-royluo@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_011353_849210_ADE5F251 
X-CRM114-Status: GOOD (  31.43  )
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

On 10/18/25 02:51, Roy Luo wrote:
> Support the USB PHY found on Google Tensor G5. This particular USB PHY
> supports both high-speed and super-speed operations, and is integrated
> with the SNPS DWC3 controller that's also on the SoC.
> This initial patch specifically adds functionality for high-speed.
>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/phy/Kconfig          |  13 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+)
>  create mode 100644 drivers/phy/phy-google-usb.c
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 58c911e1b2d2..fe32d1356002 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> +config PHY_GOOGLE_USB
> +	tristate "Google Tensor SoC USB PHY driver"
> +	depends on HAS_IOMEM
> +	depends on OF
> +	depends on TYPEC
> +	select GENERIC_PHY
> +	help
> +	  Enable support for the USB PHY on Google Tensor SoCs, starting with
> +	  the G5 generation. This driver provides the PHY interfaces to
> +	  interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
> +	  of which are integrated with the DWC3 USB controller.

So it's more like a DRD controller, since it encapsulates multiple phys?

> +	  This driver currently supports USB high-speed.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c670a8dac468..1d7a1331bd19 100644
...
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)

I'd suggest implementing the eUSB support in the existing snps-eusb2
driver for the sake of clarity. That way, you can pass it as a phandle
to this driver and probe it when drd is probing.

> +
> +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> +
> +#define USBCS_PHY_CFG1_OFFSET 0x28
> +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> +
> +enum google_usb_phy_id {
> +	GOOGLE_USB2_PHY,
> +	GOOGLE_USB_PHY_NUM,
> +};
> +
> +struct google_usb_phy_instance {
> +	int index;
> +	struct phy *phy;
> +	int num_clks;
> +	struct clk_bulk_data *clks;
> +	struct reset_control *rsts;
> +};
> +
> +struct google_usb_phy {
> +	struct device *dev;
> +	void __iomem *u2phy_cfg_base;
> +	void __iomem *dp_top_base;
> +	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> +	/* serialize phy access */
> +	struct mutex phy_mutex;
> +	struct typec_switch_dev *sw;
> +	enum typec_orientation orientation;
> +};
> +
> +static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
> +{
> +	return container_of(inst, struct google_usb_phy, insts[inst->index]);
> +}
> +
> +static void set_vbus_valid(struct google_usb_phy *gphy)
> +{
> +	u32 reg;
> +
> +	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
> +		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	} else {
> +		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	}
> +}
> +
> +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> +				      enum typec_orientation orientation)
> +{
> +	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +
> +	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> +
> +	gphy->orientation = orientation;
> +
> +	if (pm_runtime_suspended(gphy->dev))
> +		return 0;
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	set_vbus_valid(gphy);
> +
> +	return 0;
> +}
> +
> +static int google_usb2_phy_init(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +	u32 reg;
> +	int ret = 0;
> +
> +	dev_dbg(gphy->dev, "initializing usb2 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> +	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> +	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);

Yeah, it's definitely the eUSB IP, but wired differently.

phy-snps-eusb2.c:
#define EXYNOS_USB_PHY_CFG_PLLCFG0 (0x8)
#define PHY_CFG_PLL_FB_DIV_19_8_MASK GENMASK(19, 8)
#define DIV_19_8_19_2_MHZ_VAL (0x170)

> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> +
> +	set_vbus_valid(gphy);
> +
> +	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(inst->rsts);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +		return ret;
> +	}
> +
> +	reg = readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +	writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> +
> +	return ret;
> +}
> +
...
> +
> +	gphy->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(gphy->sw))
> +		return dev_err_probe(dev, PTR_ERR(gphy->sw),
> +				     "failed to register typec switch\n");
> +
> +	return 0;
> +}
> +
> +static void google_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
> +
> +	typec_switch_unregister(gphy->sw);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id google_usb_phy_of_match[] = {
> +	{
> +		.compatible = "google,gs5-usb-phy",

Did the naming scheme also change from gs{N}01 to gsN?

> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
> +
> +static struct platform_driver google_usb_phy = {
> +	.probe	= google_usb_phy_probe,
> +	.remove = google_usb_phy_remove,
> +	.driver = {
> +		.name		= "google-usb-phy",
> +		.of_match_table	= google_usb_phy_of_match,
> +	}
> +};
> +
> +module_platform_driver(google_usb_phy);
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Google USB phy driver");

Great work!

Best regards,
Ivaylo

