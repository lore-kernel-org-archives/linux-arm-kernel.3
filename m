Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B7C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ozLG9TWXlp500cW1lxmO9NrJcYLPAvisq6GBk6D5d4=; b=5Dy3o0xrdgEufngpxSJYrOIBc3
	/3uGy60LssRda5XO4Z4FDqD3hbJ+inFfsWCwZo7XlVGlMk4r3Ca8hK21Wch54ypwOZg4t2tvmRAqI
	ziq7gsnDPc0GpHNIA+zlSKw2TiqM4BgpQPZyluD+ybQqFo/FexyPuN99BCtp8ejJ96mMhi+WZdo/T
	B/pAoytYk03sQh/5xKGHmXDsgpsQfhPVeUD7641WmAkxveVMu8A2MtdXJ6JPhhF3AU5rkdm6a+vLx
	nsakmqPPa43jERn5sMVtElm+nACmwNYki08u7zCY7wlbbJsV5SdPdWAHxpA/sSxNlT+wmJNuTiMfA
	EYY6RJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cJ-0000000GAXw-22id;
	Fri, 13 Jun 2025 11:30:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0S0-0000000FspY-07Yp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:11:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-451d3f72391so24891785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805910; x=1750410710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ozLG9TWXlp500cW1lxmO9NrJcYLPAvisq6GBk6D5d4=;
        b=i1/bEzqtORWuvl4kQPVijMx3zu7OF2F3YJOOP7XNbwUqhugdrGY2slCqBhIwXe+SGU
         aESMp96ShyHC0hy7R/dMioUdE23EzEU+uWL8XUw5dUFwxhpIxRFAvsE/yGnEwt+apidO
         H/wxfjryCQFbscpQvop+GIgaoiPoV4qKYOMlzQNp3J4fUyOxD39LSeDXPJe9Zg+2vzkV
         75Dvog4spG2s34txD8zkHdP3AlVgyEolFbqmy33fYiBhow4TE2gpsMsfrINnIWoILk+l
         2E2JwtP/uDaEPFFqyZz/gIwYnskOSdp8iqaqhC1PoxaheQzGkaIMTOgxp5GngrZZV1WJ
         w9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805910; x=1750410710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ozLG9TWXlp500cW1lxmO9NrJcYLPAvisq6GBk6D5d4=;
        b=ekyNj611oAtZmiSnH7IUsVfIDgyB8BUJXAnG0mWjiSsVqRjzkyepEquByS/hc7xitd
         kwut18jJ8X87OqZuJyUOUdqg20OwvaKqEoUHhgjcE/Hx4b9rXkofabg+vJaiWW0jghgN
         Lg2oJ3V0K0bW3JkOCQXCJlE0s4pPheEjqyxQ7jyouAc4O61r7cettBIA+h4hr4evVo1C
         Tk/pSqSO2VCKZBAjuiFinTz1JP+Jh1STFoyVQ6rYkTiePDjVoLFQUbKjR8ovUrVoCZC8
         F0JrQu7pJ/Tf7KK/hynaTaRC2WPtAg9g4/5VCQvyrazqbtGwsA79sk+S05RLbiDv0fO9
         VuUw==
X-Forwarded-Encrypted: i=1; AJvYcCVfXKSDUMJieugGMIB3QVSAtwFx4GGQ1cS4WVafq0dNW/uOIRP3+P62fqi6XU+qfn5bY5mvzfnaD7fwtcG5Q9cP@lists.infradead.org
X-Gm-Message-State: AOJu0YwA7L/JEnD+JLgNz14njwleOeYSMYNro6KKwYA9fNRIm5zsMR1p
	akzPzkqekkfoCyj1jRSP0cKS6TmT/YvhP94GSLdg6yk3bAqYOH96ax78IE4qqRihNWw=
X-Gm-Gg: ASbGncu7cKHsR7e02Bdiv37rk89osqACeb6NJRJU4g3cSj3WVLuepPNz0W9udE+uE9D
	JOQa9mwshAKtfu7ZmZ0WC9hcNQd50J1wjW0jpNv8zLkRJ6cLXdFYpNgzgEvMmZ/wJuDlyHI8mh4
	O0MI1kAoYdZfHM0OaoXtVoMBrvEEa3xsU7ZwcD65aat+4jsqZ1sVFsSZbI9gIPqklgeF6G95ZkG
	mMXLFfBWvbokgWqmtC5lKTbnZVSZ7wrWY2bcme4lSx5MlkoDYPgFrCXrjDkQaokpg8n28SWAEDg
	GNYD929aWjUX5C0QyGaWnAj5NYKbtqdKAXvu0O+eNgY4+Zo4Rm/WCveI9EnTAvFzQpmxWSbO699
	GPLu7tADqFL9WtCUj05YpwYr4I3Zv5uGLckRcZXE=
X-Google-Smtp-Source: AGHT+IE7zzs25YomGG0GJ6Odvys+iqo9vej97SNc1R9zS14YSI75oBU9F4KxDKgapuN6gQnKxG76Sw==
X-Received: by 2002:a05:6000:2504:b0:3a4:eed7:15f2 with SMTP id ffacd0b85a97d-3a56877b818mr2212745f8f.43.1749805910360;
        Fri, 13 Jun 2025 02:11:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm45098505e9.34.2025.06.13.02.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:49 -0700 (PDT)
Message-ID: <40033b4b-15da-41e4-98c3-2b5f19a8a5a7@linaro.org>
Date: Fri, 13 Jun 2025 11:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 8/9] phy: exyons5-usbdrd: support SS combo phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055102epcas5p44f66699e2e1f3896948b71819ffea181@epcas5p4.samsung.com>
 <20250613055613.866909-9-pritam.sutar@samsung.com>
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
In-Reply-To: <20250613055613.866909-9-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_021152_083504_F6A91E37 
X-CRM114-Status: GOOD (  29.11  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a DWC3 compatible link controller and single USB 3.1 DRD
> combo phy that supports both UTMI+ (HS) and PIPE3 (SS) and three USB2.0
> DRD HS phy controllers those only support the UTMI+ (HS) interface.
> 
> Combo phy is combination of two phys. Among these phys, one supports
> USB3.1 SSP+(10Gbps) protocol and is backwards compatible to the
> USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required to support
> USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
> 
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 310 ++++++++++++++++++++++-
>   1 file changed, 306 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index ac7bc1d1afd2..97a4f67b0958 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -273,6 +273,36 @@
>   #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
>   #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
>   
> +/* ExynosAutov920 phy usb31drd port reg */
> +#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
> +#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
> +#define PHY_RST_CTRL_PHY_RESET			BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
> +#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
> +#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
> +#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
> +#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
> +#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
> +
>   /* Exynos9 - GS101 */
>   #define EXYNOS850_DRD_SECPMACTL			0x48
>   #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2048,6 +2078,237 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static void
> +exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg = 0;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	if (high)
> +		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	else
> +		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	usleep_range(1, 2);
> +}
> +
> +static void
> +exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	static const unsigned int timeout_us = 20000;
> +	static const unsigned int sleep_us = 40;
> +	u32 reg = 0;
> +	int err;
> +
> +	/* Clear cr_para_con */
> +	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +	exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +	/*
> +	 * The maximum time from phy reset de-assertion to de-assertion of
> +	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
> +	 * Time to phy ready is < 20ms
> +	 */
> +	err = readl_poll_timeout(reg_phy +
> +				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
> +			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
> +			sleep_us, timeout_us);
> +	if (err)
> +		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +}
> +
> +static void
> +exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
> +				 u16 addr, u16 data)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 cnt = 0;
> +	u32 reg = 0;
> +
> +	/* Pre Clocking */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx clks must be available prior to assertion of tx req.
> +	 * tx pstate p2 to p0 transition directly is not permitted.
> +	 * tx clk ready must be asserted synchronously on tx clk prior
> +	 * to internal transmit clk alignment sequence in the phy
> +	 * when entering from p2 to p1 to p0.
> +	 */
> +	do {
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +		cnt++;
> +	} while (cnt < 15);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx data path is active when tx lane is in p0 state
> +	 * and tx data en asserted. enable cr_para_wr_en.
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
> +		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	/* write addr */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/* check cr_para_ack*/
> +	cnt = 0;
> +	do {
> +		/*
> +		 * data symbols are captured by phy on rising edge of the
> +		 * tx_clk when tx data enabled.
> +		 * completion of the write cycle is acknowledged by assertion
> +		 * of the cr_para_ack.
> +		 */
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> +			break;
> +
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +		/*
> +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> +		 * is negated, before accessing control regs to allow for
> +		 * internal resets.
> +		 */
> +		cnt++;
> +	} while (cnt < 10);
> +
> +	if (cnt == 10)
> +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> +	else
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +}
> +
> +static void
> +exynosautov920_usb31drd_phy_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	reg &= ~PHY_RST_CTRL_PHY_RESET_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	if (val)
> +		reg |= PHY_RST_CTRL_PHY_RESET;
> +	else
> +		reg &= ~PHY_RST_CTRL_PHY_RESET;
> +
> +	reg |= PHY_RST_CTRL_PHY_RESET_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +}
> +
> +static void
> +exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	if (val)
> +		reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N;
> +	else
> +		reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N;
> +
> +	reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +}
> +
> +static void
> +exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Phy and Pipe Lane reset assert.
> +	 * assert reset (phy_reset = 1).
> +	 * The lane-ack outputs are asserted during reset (tx_ack = rx_ack = 1)
> +	 */
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
> +
> +	/*
> +	 * ANA Power En, PCS & PMA PWR Stable Set
> +	 * ramp-up power suppiles
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
> +	reg |= PHY_CONFIG0_PHY0_ANA_PWR_EN | PHY_CONFIG0_PHY0_PCS_PWR_STABLE |
> +		PHY_CONFIG0_PHY0_PMA_PWR_STABLE;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
> +
> +	usleep_range(10, 15);
> +
> +	/*
> +	 * phy is not functional in test_powerdown mode, test_powerdown to be
> +	 * de-asserted for normal operation
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +	reg &= ~PHY_CONFIG7_PHY_TEST_POWERDOWN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +
> +	/*
> +	 * phy reset signal be asserted for minimum 10us after power
> +	 * supplies are ramped-up
> +	 */
> +	usleep_range(10, 15);
> +
> +	/*
> +	 * Phy and Pipe Lane reset assert de-assert
> +	 */
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 0);
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 0);
> +
> +	/* Pipe_rx0_sris_mode_en  = 1 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
> +	reg |= PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
> +
> +	/*
> +	 * wait for lane ack outputs to de-assert (tx_ack = rx_ack = 0)
> +	 * Exit from the reset state is indicated by de-assertion of *_ack
> +	 */
> +	exynosautov920_usb31drd_port_phy_ready(phy_drd);
> +
> +	/* override values for level settings */
> +	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
> +}
> +
>   static void
>   exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
>   {
> @@ -2142,12 +2403,15 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
>   	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
>   	usleep_range(75, 80);
>   
> -	/* force pipe3 signal for link */
> +	/* Disable forcing pipe interface */
>   	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> -	reg |= LINKCTRL_FORCE_PIPE_EN;
> -	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
> -	reg |= LINKCTRL_FORCE_RXELECIDLE;
> +	reg &= ~LINKCTRL_FORCE_PIPE_EN;
>   	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* Pclk to pipe_clk */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
>   }
>   
>   static void
> @@ -2183,6 +2447,22 @@ static int exynosautov920_usbdrd_phy_init(struct phy *phy)
>   	return exynos850_usbdrd_phy_init(phy);
>   }
>   
> +static void
> +exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/* 1. Assert reset (phy_reset = 1) */
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
> +
> +	/* phy test power down */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +	reg |= PHY_CONFIG7_PHY_TEST_POWERDOWN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +}
> +
>   static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
>   {
>   	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> @@ -2195,18 +2475,37 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
>   
>   	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
>   		exynosautov920_usbdrd_hsphy_disable(phy_drd);
> +	else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3)
> +		exynosautov920_usb31drd_ssphy_disable(phy_drd);
>   
>   	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
>   
>   	return 0;
>   }
>   
> +static const struct
> +exynos5_usbdrd_phy_config usb31drd_phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_PIPE3,
> +		.phy_init	= exynosautov920_usb31drd_pipe3_init,
> +	},
> +};
> +
>   static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
>   	.init		= exynosautov920_usbdrd_phy_init,
>   	.exit		= exynosautov920_usbdrd_phy_exit,
>   	.owner		= THIS_MODULE,
>   };
>   
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_ssphy = {
> +	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct
>   exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
>   	{
> @@ -2455,6 +2754,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynosautov920-usbdrd-phy",
>   		.data = &exynosautov920_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usb31drd-ssphy",
> +		.data = &exynosautov920_usb31drd_ssphy
>   	},
>   	{ },
>   };

With the subject fix:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

