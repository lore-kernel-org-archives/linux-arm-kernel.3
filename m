Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B64C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3ADjCGa+i+8czR/Qp73HKr3Vy7fiUTmdt7gh9SdL7g=; b=1CAq8BQitZN/SLfx+0aJmGsJ0o
	AokSSgGHennYNGOA1C+1KtOzViI+3NtuPfN1DVsacvucR54TVtzVOB+xJONizy6GWQPjpuCybIK/1
	WjZuLn8q+t6p9pm01TxtHGa0G1VSyphSM8lyYQH6oCHMwT54zOwlxxfDDXqE1ImdN9cC1cNiiPpdy
	mkwaaXon3sNUsL94lnqOP7zfPmJvgv0runM21Z2sLjExZx/T+mdiyTFytX4ucXMY4G2OLcCvUdJxk
	9UG2iDnTym3iunzlb+9ZJMDuR7eXHsNTMVmLH/sYk+O+Lrispruh8rImTEUc3kWhXMMYcNqbBGhH6
	yaPpzTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWCh-0000000DFzR-2SsS;
	Mon, 24 Feb 2025 11:00:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWBC-0000000DFTG-1BvL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:59:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso3239667f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740394757; x=1740999557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3ADjCGa+i+8czR/Qp73HKr3Vy7fiUTmdt7gh9SdL7g=;
        b=efUfhu4y3YCey2pL6lo+nvcLne2+gcEHlvZm2/P/6hkRZ9ebvtbNN3Cu3rO3dYZ99o
         4IMx27vEpS82bFPEUvQv8KH2mqRPutzRHI1jaJA3+iV4V1Bw8E4ulyMEckjKtqukU198
         VI6vL/mV1yozebUzJxdm1wm+5jJg1iVkzy6bkpvv36ASliYzrZ/4X7gzu/eK2VoRk1rx
         5uq72U76naZa+3M1hyPhcx1Vbi0jIQVB5tIIiPg48C/hzPi8TDV+p9f2T4xPdly2I5IW
         9SArm7R5OZwTQ9RebJGnEJ5FSlrT+dB05ZGfc49DKgfJWy7JD6u0yeVVJ2249msg47G1
         zKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394757; x=1740999557;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l3ADjCGa+i+8czR/Qp73HKr3Vy7fiUTmdt7gh9SdL7g=;
        b=rhZWEj+6jYx1SC7aqjfsKE446wbgylEgWxL9MEcnrsrFd2is1osW7tA4ZGhEXKJ5yr
         vx8TOKYTiYeobGGI4fGuK9yIvyH1CEH+FIp4g+9KitdhiTNai4EpT3nki31TqrPk5I4G
         ntwJIeMrHb9vEpwtyt7ypwpjcK80HpaG+eDQri4C954A2Zc/5jbBn2TNz4Yb2yk4sWuh
         pNYX9jJiT9LGnJUjzgjauFQfTha9NyqslPMMIB7p7GwPXb5w64qB+rqICcIAsiYiUXbE
         P/bfgdePolm4q9CzchoSMDkT3OQe0T2oFtUc/NoiOk2xmNLrX2zBw5obuZYgev0jN0UL
         OgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiYk1Vi5bEnD4HzQrJdJvnkPS5/Ao3ZarY3KKIQ/rCuMgIfPlbhxzUTkSnKFH+qF1qZZMU4r52CtkilqEvsMwT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2VDlj6K8On9JQEYf/FGfucZ6LLG1iAhd4OHVZ8zxhVJ1WgZVR
	9MNJIkzB/nW/4fU4Tnj2bo90DUTxoPvIca994DcE+F0ALR1i+R2GYqR8I6/zHts=
X-Gm-Gg: ASbGncvlScyJxqijqKx3kDYF3fBmQkBwEdJUKa/npJxiuIksCDxaI+WCVTJ4ZsJo3u+
	XDf0vE/ZTWL8APIyIV4rLDBzU9sRoEDzhWbdJ3lPZ+5e2xn5vVz9AS06qepR83gVCGN6vwgZbEq
	qUR/o986DW3tdC00jPv329MPJbxs4qVU3nM7naocIJCiA6HT/uOHLE0Y0/AFB+HICHmDTZv/fYj
	xvDHQ3RoVrzaDohU69B4YHAd8oMYL2MC88Vx6A+gDrqSmF7Qr6Z0QsUE1eIeC279qwZWnWE1ZtC
	RLgA1AhsxNdtTMQnMtSlsvK+7dC5MXGtlvxRj3xAqilzBGa7Of2j2DuMLDaGlpBDLrdmXSnoFAH
	LL5w=
X-Google-Smtp-Source: AGHT+IGvLw7fpd3qowaVXBA/GFjhm2Dr9hnMLsm9FNrwxF/A6DoIQrEl3GJzqja66CDa5qP5vaIN5g==
X-Received: by 2002:a5d:6d09:0:b0:38f:4f37:7504 with SMTP id ffacd0b85a97d-38f615be1c7mr13916977f8f.16.1740394756643;
        Mon, 24 Feb 2025 02:59:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4491sm30727530f8f.7.2025.02.24.02.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:59:16 -0800 (PST)
Message-ID: <8976893c-ef6c-4579-bdaf-a7bd542def96@linaro.org>
Date: Mon, 24 Feb 2025 11:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_025918_613018_90AEFEE2 
X-CRM114-Status: GOOD (  26.99  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 23/02/2025 13:22, Ivaylo Ivanov wrote:
> As Samsung is using the same Synopsys eUSB2 IP in Exynos2200, albeit
> with a different register layout, it only makes sense to implement
> support for that in the existing eUSB2 driver.
> 
> To make room for new non-qcom SoCs, do the following:
> 1. Move phy-qcom-snps-eusb2.c to phy-snps-eusb2.c
> 2. Rename all qcom_snps_eusb2 functions and structs to snps_eusb2_phy
> 3. Add a prefix to the qcom-specific register offset definitions
> 4. Make a generic phy_ops init that sets up power before the SoC-specific
> eUSB2 IP init
> 5. Introduce a driver data structure with init function and clocks

Please split this in multiples patches, because we can't check the actual
changes on the driver... so it's non reviewable in the current state.

Neil

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/phy/Kconfig                        |   8 +
>   drivers/phy/Makefile                       |   1 +
>   drivers/phy/phy-snps-eusb2.c               | 505 +++++++++++++++++++++
>   drivers/phy/qualcomm/Kconfig               |   9 -
>   drivers/phy/qualcomm/Makefile              |   1 -
>   drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 442 ------------------
>   6 files changed, 514 insertions(+), 452 deletions(-)
>   create mode 100644 drivers/phy/phy-snps-eusb2.c
>   delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe99..11c166204 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -43,6 +43,14 @@ config PHY_PISTACHIO_USB
>   	help
>   	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
>   
> +config PHY_SNPS_EUSB2
> +	tristate "SNPS eUSB2 PHY Driver"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable support for the USB high-speed SNPS eUSB2 phy on select
> +	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
> +
>   config PHY_XGENE
>   	tristate "APM X-Gene 15Gbps PHY support"
>   	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442ac..c670a8dac 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
>   obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
>   obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>   obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
> +obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>   obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>   obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>   obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> new file mode 100644
> index 000000000..4e5914a76
> --- /dev/null
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -0,0 +1,505 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
> +#define SLEEPM				BIT(0)
> +#define OPMODE_MASK			GENMASK(4, 3)
> +#define OPMODE_NONDRIVING		BIT(3)
> +
> +#define QCOM_USB_PHY_UTMI_CTRL5		(0x50)
> +#define POR				BIT(1)
> +
> +#define QCOM_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define PHY_ENABLE			BIT(0)
> +#define SIDDQ_SEL			BIT(1)
> +#define SIDDQ				BIT(2)
> +#define RETENABLEN			BIT(3)
> +#define FSEL_MASK			GENMASK(6, 4)
> +#define FSEL_19_2_MHZ_VAL		(0x0)
> +#define FSEL_38_4_MHZ_VAL		(0x4)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_1		(0x58)
> +#define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_2		(0x5c)
> +#define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
> +#define DIV_7_0_19_2_MHZ_VAL		(0x90)
> +#define DIV_7_0_38_4_MHZ_VAL		(0xc8)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_3		(0x60)
> +#define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
> +#define DIV_11_8_19_2_MHZ_VAL		(0x1)
> +#define DIV_11_8_38_4_MHZ_VAL		(0x0)
> +
> +#define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
> +#define PLL_REF_DIV_VAL			(0x0)
> +
> +#define QCOM_USB_PHY_HS_PHY_CTRL2	(0x64)
> +#define VBUSVLDEXT0			BIT(0)
> +#define USB2_SUSPEND_N			BIT(2)
> +#define USB2_SUSPEND_N_SEL		BIT(3)
> +#define VBUS_DET_EXT_SEL		BIT(4)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_4		(0x68)
> +#define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
> +#define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_5		(0x6c)
> +#define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
> +#define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_6		(0x70)
> +#define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_7		(0x74)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_8		(0x78)
> +#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
> +#define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
> +#define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
> +#define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_9		(0x7c)
> +#define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
> +#define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
> +#define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
> +#define PHY_CFG_RCAL_BYPASS		BIT(7)
> +
> +#define QCOM_USB_PHY_CFG_CTRL_10	(0x80)
> +
> +#define QCOM_USB_PHY_CFG0		(0x94)
> +#define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
> +#define CMN_CTRL_OVERRIDE_EN		BIT(1)
> +
> +#define QCOM_UTMI_PHY_CMN_CTRL0		(0x98)
> +#define TESTBURNIN			BIT(6)
> +
> +#define QCOM_USB_PHY_FSEL_SEL		(0xb8)
> +#define FSEL_SEL			BIT(0)
> +
> +#define QCOM_USB_PHY_APB_ACCESS_CMD	(0x130)
> +#define RW_ACCESS			BIT(0)
> +#define APB_START_CMD			BIT(1)
> +#define APB_LOGIC_RESET			BIT(2)
> +
> +#define QCOM_USB_PHY_APB_ACCESS_STATUS	(0x134)
> +#define ACCESS_DONE			BIT(0)
> +#define TIMED_OUT			BIT(1)
> +#define ACCESS_ERROR			BIT(2)
> +#define ACCESS_IN_PROGRESS		BIT(3)
> +
> +#define QCOM_USB_PHY_APB_ADDRESS	(0x138)
> +#define APB_REG_ADDR_MASK		GENMASK(7, 0)
> +
> +#define QCOM_USB_PHY_APB_WRDATA_LSB	(0x13c)
> +#define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
> +
> +#define QCOM_USB_PHY_APB_WRDATA_MSB	(0x140)
> +#define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
> +
> +#define QCOM_USB_PHY_APB_RDDATA_LSB	(0x144)
> +#define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
> +
> +#define QCOM_USB_PHY_APB_RDDATA_MSB	(0x148)
> +#define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
> +
> +static const char * const eusb2_hsphy_vreg_names[] = {
> +	"vdd", "vdda12",
> +};
> +
> +#define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
> +
> +struct snps_eusb2_phy_drvdata {
> +	int (*phy_init)(struct phy *p);
> +	const char * const *clk_names;
> +	int num_clks;
> +};
> +
> +struct snps_eusb2_hsphy {
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk *ref_clk;
> +	struct clk_bulk_data *clks;
> +
> +	struct reset_control *phy_reset;
> +
> +	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
> +
> +	enum phy_mode mode;
> +
> +	struct phy *repeater;
> +
> +	const struct snps_eusb2_phy_drvdata *data;
> +};
> +
> +static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
> +{
> +	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> +
> +	phy->mode = mode;
> +
> +	return phy_set_mode_ext(phy->repeater, mode, submode);
> +}
> +
> +static void snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
> +					u32 mask, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl_relaxed(base + offset);
> +	reg &= ~mask;
> +	reg |= val & mask;
> +	writel_relaxed(reg, base + offset);
> +
> +	/* Ensure above write is completed */
> +	readl_relaxed(base + offset);
> +}
> +
> +static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
> +{
> +	/* default parameters: tx pre-emphasis */
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
> +				    PHY_CFG_TX_PREEMP_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
> +
> +	/* tx rise/fall time */
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
> +				    PHY_CFG_TX_RISE_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
> +
> +	/* source impedance adjustment */
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
> +				    PHY_CFG_TX_RES_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
> +
> +	/* dc voltage level adjustement */
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
> +				    PHY_CFG_TX_HS_VREF_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
> +
> +	/* transmitter HS crossover adjustement */
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
> +				    PHY_CFG_TX_HS_XV_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
> +}
> +
> +static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
> +{
> +	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
> +
> +	switch (ref_clk_freq) {
> +	case 19200000:
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
> +					    FSEL_MASK,
> +					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
> +					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
> +					    DIV_7_0_19_2_MHZ_VAL);
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
> +					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
> +					    DIV_11_8_19_2_MHZ_VAL);
> +		break;
> +
> +	case 38400000:
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
> +					    FSEL_MASK,
> +					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
> +					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
> +					    DIV_7_0_38_4_MHZ_VAL);
> +
> +		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
> +					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
> +					    DIV_11_8_38_4_MHZ_VAL);
> +		break;
> +
> +	default:
> +		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
> +		return -EINVAL;
> +	}
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
> +				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
> +
> +	return 0;
> +}
> +
> +static int qcom_snps_eusb2_hsphy_init(struct phy *p)
> +{
> +	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> +	int ret;
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
> +				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, POR);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
> +				    PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_APB_ACCESS_CMD,
> +				    APB_LOGIC_RESET, APB_LOGIC_RESET);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_FSEL_SEL,
> +				    FSEL_SEL, FSEL_SEL);
> +
> +	/* update ref_clk related registers */
> +	ret = qcom_eusb2_ref_clk_init(phy);
> +	if (ret)
> +		return ret;
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
> +				    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
> +				    PHY_CFG_PLL_INT_CNTRL_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
> +				    PHY_CFG_PLL_GMP_CNTRL_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
> +				    PHY_CFG_PLL_PROP_CNTRL_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_6,
> +				    PHY_CFG_PLL_VCO_CNTRL_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
> +				    PHY_CFG_PLL_VREF_TUNE_MASK,
> +				    FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
> +				    VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
> +
> +	/* set default parameters */
> +	qcom_eusb2_default_parameters(phy);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
> +				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
> +				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
> +				    SIDDQ_SEL, SIDDQ_SEL);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
> +				    SIDDQ, 0);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, 0);
> +
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
> +				    USB2_SUSPEND_N_SEL, 0);
> +
> +	return 0;
> +}
> +
> +static const char * const qcom_eusb2_hsphy_clock_names[] = {
> +	"ref",
> +};
> +
> +static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
> +	.phy_init	= qcom_snps_eusb2_hsphy_init,
> +	.clk_names	= qcom_eusb2_hsphy_clock_names,
> +	.num_clks	= ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
> +};
> +
> +static int snps_eusb2_hsphy_init(struct phy *p)
> +{
> +	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&p->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	ret = clk_prepare_enable(phy->ref_clk);
> +	if (ret) {
> +		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	ret = reset_control_assert(phy->phy_reset);
> +	if (ret) {
> +		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
> +		goto disable_ref_clk;
> +	}
> +
> +	usleep_range(100, 150);
> +
> +	ret = reset_control_deassert(phy->phy_reset);
> +	if (ret) {
> +		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
> +		goto disable_ref_clk;
> +	}
> +
> +	ret = phy->data->phy_init(p);
> +	if (ret)
> +		goto disable_ref_clk;
> +
> +	return 0;
> +
> +disable_ref_clk:
> +	clk_disable_unprepare(phy->ref_clk);
> +
> +disable_vreg:
> +	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
> +
> +	return ret;
> +}
> +
> +static int snps_eusb2_hsphy_exit(struct phy *p)
> +{
> +	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> +
> +	clk_disable_unprepare(phy->ref_clk);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
> +
> +	phy_exit(phy->repeater);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops snps_eusb2_hsphy_ops = {
> +	.init		= snps_eusb2_hsphy_init,
> +	.exit		= snps_eusb2_hsphy_exit,
> +	.set_mode	= snps_eusb2_hsphy_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct snps_eusb2_hsphy *phy;
> +	struct phy_provider *phy_provider;
> +	struct phy *generic_phy;
> +	const struct snps_eusb2_phy_drvdata *drv_data;
> +	int ret, i;
> +	int num;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	drv_data = of_device_get_match_data(dev);
> +	if (!drv_data)
> +		return -EINVAL;
> +	phy->data = drv_data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(phy->phy_reset))
> +		return PTR_ERR(phy->phy_reset);
> +
> +	phy->clks = devm_kcalloc(dev,
> +				 phy->data->num_clks,
> +				 sizeof(*phy->clks),
> +				 GFP_KERNEL);
> +	if (!phy->clks)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < phy->data->num_clks; ++i)
> +		phy->clks[i].id = phy->data->clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, phy->data->num_clks,
> +				phy->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get phy clock(s)\n");
> +
> +	phy->ref_clk = NULL;
> +	for (int i = 0; i < phy->data->num_clks; ++i) {
> +		if (!strcmp(phy->clks[i].id, "ref")) {
> +			phy->ref_clk = phy->clks[i].clk;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR_OR_NULL(phy->ref_clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
> +				     "failed to get ref clk\n");
> +
> +	num = ARRAY_SIZE(phy->vregs);
> +	for (i = 0; i < num; i++)
> +		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulator supplies\n");
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");
> +
> +	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
> +	if (IS_ERR(generic_phy)) {
> +		dev_err(dev, "failed to create phy %d\n", ret);
> +		return PTR_ERR(generic_phy);
> +	}
> +
> +	dev_set_drvdata(dev, phy);
> +	phy_set_drvdata(generic_phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	dev_info(dev, "Registered Snps-eUSB2 phy\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
> +	{
> +		.compatible = "qcom,sm8550-snps-eusb2-phy",
> +		.data = &sm8550_snps_eusb2_phy,
> +	}, { },
> +};
> +MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
> +
> +static struct platform_driver snps_eusb2_hsphy_driver = {
> +	.probe		= snps_eusb2_hsphy_probe,
> +	.driver = {
> +		.name	= "snps-eusb2-hsphy",
> +		.of_match_table = snps_eusb2_hsphy_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(snps_eusb2_hsphy_driver);
> +MODULE_DESCRIPTION("SNPS eUSB2 HS PHY driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 846f8c995..914547068 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -125,15 +125,6 @@ config PHY_QCOM_QUSB2
>   	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
>   	  USB IPs on MSM SOCs.
>   
> -config PHY_QCOM_SNPS_EUSB2
> -	tristate "Qualcomm SNPS eUSB2 PHY Driver"
> -	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> -	select GENERIC_PHY
> -	help
> -	  Enable support for the USB high-speed SNPS eUSB2 phy on Qualcomm
> -	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
> -	  on Qualcomm SOCs.
> -
>   config PHY_QCOM_EUSB2_REPEATER
>   	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
>   	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index eb60e950a..2121e92df 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -15,7 +15,6 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
>   obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
>   
>   obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
> -obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
>   obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
>   obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
>   obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> deleted file mode 100644
> index 1484691a4..000000000
> --- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> +++ /dev/null
> @@ -1,442 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (c) 2023, Linaro Limited
> - */
> -
> -#include <linux/bitfield.h>
> -#include <linux/clk.h>
> -#include <linux/delay.h>
> -#include <linux/iopoll.h>
> -#include <linux/mod_devicetable.h>
> -#include <linux/phy/phy.h>
> -#include <linux/platform_device.h>
> -#include <linux/regulator/consumer.h>
> -#include <linux/reset.h>
> -
> -#define USB_PHY_UTMI_CTRL0		(0x3c)
> -#define SLEEPM				BIT(0)
> -#define OPMODE_MASK			GENMASK(4, 3)
> -#define OPMODE_NONDRIVING		BIT(3)
> -
> -#define USB_PHY_UTMI_CTRL5		(0x50)
> -#define POR				BIT(1)
> -
> -#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> -#define PHY_ENABLE			BIT(0)
> -#define SIDDQ_SEL			BIT(1)
> -#define SIDDQ				BIT(2)
> -#define RETENABLEN			BIT(3)
> -#define FSEL_MASK			GENMASK(6, 4)
> -#define FSEL_19_2_MHZ_VAL		(0x0)
> -#define FSEL_38_4_MHZ_VAL		(0x4)
> -
> -#define USB_PHY_CFG_CTRL_1		(0x58)
> -#define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
> -
> -#define USB_PHY_CFG_CTRL_2		(0x5c)
> -#define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
> -#define DIV_7_0_19_2_MHZ_VAL		(0x90)
> -#define DIV_7_0_38_4_MHZ_VAL		(0xc8)
> -
> -#define USB_PHY_CFG_CTRL_3		(0x60)
> -#define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
> -#define DIV_11_8_19_2_MHZ_VAL		(0x1)
> -#define DIV_11_8_38_4_MHZ_VAL		(0x0)
> -
> -#define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
> -#define PLL_REF_DIV_VAL			(0x0)
> -
> -#define USB_PHY_HS_PHY_CTRL2		(0x64)
> -#define VBUSVLDEXT0			BIT(0)
> -#define USB2_SUSPEND_N			BIT(2)
> -#define USB2_SUSPEND_N_SEL		BIT(3)
> -#define VBUS_DET_EXT_SEL		BIT(4)
> -
> -#define USB_PHY_CFG_CTRL_4		(0x68)
> -#define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
> -#define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
> -
> -#define USB_PHY_CFG_CTRL_5		(0x6c)
> -#define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
> -#define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
> -
> -#define USB_PHY_CFG_CTRL_6		(0x70)
> -#define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
> -
> -#define USB_PHY_CFG_CTRL_7		(0x74)
> -
> -#define USB_PHY_CFG_CTRL_8		(0x78)
> -#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
> -#define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
> -#define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
> -#define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
> -
> -#define USB_PHY_CFG_CTRL_9		(0x7c)
> -#define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
> -#define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
> -#define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
> -#define PHY_CFG_RCAL_BYPASS		BIT(7)
> -
> -#define USB_PHY_CFG_CTRL_10		(0x80)
> -
> -#define USB_PHY_CFG0			(0x94)
> -#define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
> -#define CMN_CTRL_OVERRIDE_EN		BIT(1)
> -
> -#define UTMI_PHY_CMN_CTRL0		(0x98)
> -#define TESTBURNIN			BIT(6)
> -
> -#define USB_PHY_FSEL_SEL		(0xb8)
> -#define FSEL_SEL			BIT(0)
> -
> -#define USB_PHY_APB_ACCESS_CMD		(0x130)
> -#define RW_ACCESS			BIT(0)
> -#define APB_START_CMD			BIT(1)
> -#define APB_LOGIC_RESET			BIT(2)
> -
> -#define USB_PHY_APB_ACCESS_STATUS	(0x134)
> -#define ACCESS_DONE			BIT(0)
> -#define TIMED_OUT			BIT(1)
> -#define ACCESS_ERROR			BIT(2)
> -#define ACCESS_IN_PROGRESS		BIT(3)
> -
> -#define USB_PHY_APB_ADDRESS		(0x138)
> -#define APB_REG_ADDR_MASK		GENMASK(7, 0)
> -
> -#define USB_PHY_APB_WRDATA_LSB		(0x13c)
> -#define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
> -
> -#define USB_PHY_APB_WRDATA_MSB		(0x140)
> -#define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
> -
> -#define USB_PHY_APB_RDDATA_LSB		(0x144)
> -#define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
> -
> -#define USB_PHY_APB_RDDATA_MSB		(0x148)
> -#define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
> -
> -static const char * const eusb2_hsphy_vreg_names[] = {
> -	"vdd", "vdda12",
> -};
> -
> -#define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
> -
> -struct qcom_snps_eusb2_hsphy {
> -	struct phy *phy;
> -	void __iomem *base;
> -
> -	struct clk *ref_clk;
> -	struct reset_control *phy_reset;
> -
> -	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
> -
> -	enum phy_mode mode;
> -
> -	struct phy *repeater;
> -};
> -
> -static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
> -{
> -	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> -
> -	phy->mode = mode;
> -
> -	return phy_set_mode_ext(phy->repeater, mode, submode);
> -}
> -
> -static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
> -					     u32 mask, u32 val)
> -{
> -	u32 reg;
> -
> -	reg = readl_relaxed(base + offset);
> -	reg &= ~mask;
> -	reg |= val & mask;
> -	writel_relaxed(reg, base + offset);
> -
> -	/* Ensure above write is completed */
> -	readl_relaxed(base + offset);
> -}
> -
> -static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
> -{
> -	/* default parameters: tx pre-emphasis */
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
> -					 PHY_CFG_TX_PREEMP_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
> -
> -	/* tx rise/fall time */
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
> -					 PHY_CFG_TX_RISE_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
> -
> -	/* source impedance adjustment */
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
> -					 PHY_CFG_TX_RES_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
> -
> -	/* dc voltage level adjustement */
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
> -					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
> -
> -	/* transmitter HS crossover adjustement */
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
> -					 PHY_CFG_TX_HS_XV_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
> -}
> -
> -static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
> -{
> -	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
> -
> -	switch (ref_clk_freq) {
> -	case 19200000:
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
> -						 FSEL_MASK,
> -						 FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
> -
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
> -						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
> -						 DIV_7_0_19_2_MHZ_VAL);
> -
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
> -						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
> -						 DIV_11_8_19_2_MHZ_VAL);
> -		break;
> -
> -	case 38400000:
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
> -						 FSEL_MASK,
> -						 FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
> -
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
> -						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
> -						 DIV_7_0_38_4_MHZ_VAL);
> -
> -		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
> -						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
> -						 DIV_11_8_38_4_MHZ_VAL);
> -		break;
> -
> -	default:
> -		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
> -		return -EINVAL;
> -	}
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
> -					 PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
> -
> -	return 0;
> -}
> -
> -static int qcom_snps_eusb2_hsphy_init(struct phy *p)
> -{
> -	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> -	int ret;
> -
> -	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
> -	if (ret)
> -		return ret;
> -
> -	ret = phy_init(phy->repeater);
> -	if (ret) {
> -		dev_err(&p->dev, "repeater init failed. %d\n", ret);
> -		goto disable_vreg;
> -	}
> -
> -	ret = clk_prepare_enable(phy->ref_clk);
> -	if (ret) {
> -		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
> -		goto disable_vreg;
> -	}
> -
> -	ret = reset_control_assert(phy->phy_reset);
> -	if (ret) {
> -		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ref_clk;
> -	}
> -
> -	usleep_range(100, 150);
> -
> -	ret = reset_control_deassert(phy->phy_reset);
> -	if (ret) {
> -		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ref_clk;
> -	}
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG0,
> -					 CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, POR);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
> -					 PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_APB_ACCESS_CMD,
> -					 APB_LOGIC_RESET, APB_LOGIC_RESET);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_FSEL_SEL,
> -					 FSEL_SEL, FSEL_SEL);
> -
> -	/* update ref_clk related registers */
> -	ret = qcom_eusb2_ref_clk_init(phy);
> -	if (ret)
> -		goto disable_ref_clk;
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_1,
> -					 PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
> -					 PHY_CFG_PLL_INT_CNTRL_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
> -					 PHY_CFG_PLL_GMP_CNTRL_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
> -					 PHY_CFG_PLL_PROP_CNTRL_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_6,
> -					 PHY_CFG_PLL_VCO_CNTRL_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
> -					 PHY_CFG_PLL_VREF_TUNE_MASK,
> -					 FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
> -					 VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
> -
> -	/* set default parameters */
> -	qcom_eusb2_default_parameters(phy);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
> -					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
> -					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
> -					 SIDDQ_SEL, SIDDQ_SEL);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
> -					 SIDDQ, 0);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, 0);
> -
> -	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
> -					 USB2_SUSPEND_N_SEL, 0);
> -
> -	return 0;
> -
> -disable_ref_clk:
> -	clk_disable_unprepare(phy->ref_clk);
> -
> -disable_vreg:
> -	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
> -
> -	return ret;
> -}
> -
> -static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
> -{
> -	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
> -
> -	clk_disable_unprepare(phy->ref_clk);
> -
> -	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
> -
> -	phy_exit(phy->repeater);
> -
> -	return 0;
> -}
> -
> -static const struct phy_ops qcom_snps_eusb2_hsphy_ops = {
> -	.init		= qcom_snps_eusb2_hsphy_init,
> -	.exit		= qcom_snps_eusb2_hsphy_exit,
> -	.set_mode	= qcom_snps_eusb2_hsphy_set_mode,
> -	.owner		= THIS_MODULE,
> -};
> -
> -static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> -	struct qcom_snps_eusb2_hsphy *phy;
> -	struct phy_provider *phy_provider;
> -	struct phy *generic_phy;
> -	int ret, i;
> -	int num;
> -
> -	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> -	if (!phy)
> -		return -ENOMEM;
> -
> -	phy->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(phy->base))
> -		return PTR_ERR(phy->base);
> -
> -	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (IS_ERR(phy->phy_reset))
> -		return PTR_ERR(phy->phy_reset);
> -
> -	phy->ref_clk = devm_clk_get(dev, "ref");
> -	if (IS_ERR(phy->ref_clk))
> -		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
> -				     "failed to get ref clk\n");
> -
> -	num = ARRAY_SIZE(phy->vregs);
> -	for (i = 0; i < num; i++)
> -		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
> -
> -	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to get regulator supplies\n");
> -
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> -	if (IS_ERR(phy->repeater))
> -		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> -				     "failed to get repeater\n");
> -
> -	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
> -	if (IS_ERR(generic_phy)) {
> -		dev_err(dev, "failed to create phy %d\n", ret);
> -		return PTR_ERR(generic_phy);
> -	}
> -
> -	dev_set_drvdata(dev, phy);
> -	phy_set_drvdata(generic_phy, phy);
> -
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider))
> -		return PTR_ERR(phy_provider);
> -
> -	dev_info(dev, "Registered Qcom-eUSB2 phy\n");
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id qcom_snps_eusb2_hsphy_of_match_table[] = {
> -	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, qcom_snps_eusb2_hsphy_of_match_table);
> -
> -static struct platform_driver qcom_snps_eusb2_hsphy_driver = {
> -	.probe		= qcom_snps_eusb2_hsphy_probe,
> -	.driver = {
> -		.name	= "qcom-snps-eusb2-hsphy",
> -		.of_match_table = qcom_snps_eusb2_hsphy_of_match_table,
> -	},
> -};
> -
> -module_platform_driver(qcom_snps_eusb2_hsphy_driver);
> -MODULE_DESCRIPTION("Qualcomm SNPS eUSB2 HS PHY driver");
> -MODULE_LICENSE("GPL");


