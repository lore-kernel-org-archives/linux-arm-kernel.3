Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96381C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sPw/K/UVzxmb+WUW6u3nFAas8NAc+1HzIJtfjkxMNI=; b=V/LP7ufeMzA//AR14lDdo/jaGO
	l36YTItQJdwDOHRG483cZcan96333rArk3cTabnuiUtZDQuhUjziUZlLateQ23KPvQeXCdk82jla7
	OHL0YI6PCh8sCKPYNOgavS4g+R4QFZK08I0tOoH3/eGPx3rgFHj683jW6Br8Z4IPJIecuneY9YKsi
	wff8Ucyww/An+uS/d3yy7nj/bZHhWx0PK4MZf24ZhHZiFPTdHPPG49VSOd2fPURZv1qt8Hq5x7nwD
	7gLpEcxm4PZ0sbYhoXIjWye5rhD+dsBM+U4lmefaX3fZjUgFwByqoJZs49RC+fLXm/8gEYqTpEeF7
	M+eZ0VZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHcd-0000000Bt6F-0aTw;
	Tue, 20 May 2025 07:42:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHZp-0000000BsVd-16I2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 07:39:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so43026135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747726791; x=1748331591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sPw/K/UVzxmb+WUW6u3nFAas8NAc+1HzIJtfjkxMNI=;
        b=WUsH1XetsuJ2KP3RWA0wJwMHczWoa7atZIAutIVv9wK285AP1+AyV+KRhV2Q58Sr4d
         whzDNpBW7N+FDHi6DcEnMO2TSFP6q7st0b+iyI7lpk0+T8K9pIw21YNXD40Ci5FBZvPo
         76Q62Zt3mNrYCvLLfrrof2JFk/XfA6H1ZCA3Xgk73K5An337e2nobASC/y+aMP/UWeJP
         Mtt1UlHd8nUUtNIvaQkWPQfhKCKTLeA9PLTs+FFhuxFQ1AQJJ/S8uWQ8z+0KEyGTfg5k
         JayUPtPofFVh8TnsgjqM3mfuXp6GiD98nBhMYDaif/qShCYqZ/7qGTMwjXQblCCmrb5t
         PE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747726791; x=1748331591;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+sPw/K/UVzxmb+WUW6u3nFAas8NAc+1HzIJtfjkxMNI=;
        b=Ry2cZewPzgT30MHTMDMTTr6AG1VEfhYXwTvy7owcjlYKmdyNL9ALsVxunR26pbQugJ
         kffh0f9EmQuGjtcfGauM7VXv5gjTUGJhzzRlUreZb5M1G+z4/VrwUoVL0KbXNSSE9ZqU
         lnzaYvknqDnPl7ZIc4tI9ufVkbiqrGlsGCl8p8TaPnfFeaP17MngraE5LFgsCPwVUCjA
         BjLzlU/4RCYk5foHhQlgVu+KqaCictpwau5Kz/32/EKDRwd4omQep1yH7k5JctQD2QW9
         PT55CF9DsKql+yUnwk3qeGu9BLecuQUMzeEwVulrBqjXP7oraR/+XWci5omss1acVL3x
         KDTg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ46NRDNQ5KVQs9stHbOToH8/npPjwqWQJVmQgNInDNDGdiA7eaeCF+8QttGjeOCTE6m6XZHzhbnfDnW2bzoET@lists.infradead.org
X-Gm-Message-State: AOJu0YyoB1jQDCylRwzxl3NXbEUxJ8LmZOZg3H9pUZrNOywgcj5LJK+J
	ES7CCLodnyEeSl9KE2qX7nT61aFhHuKIFN/LzR6Z52udL5fSzl9yCeuf9HcAj4Xkw3E=
X-Gm-Gg: ASbGncuR3gezE9MU5KQ02R3ZugE0OsnpemGsaVzv8JjIFa+wn6hK6Ay2TINCHLxPLIw
	aBgWAVFLiGFRnwvrVmvpVbXGgEnK9t1MALcgUYKfrjWhntcazkrIONnwhdbV9UaN5AXVpRylpzi
	nucfG7L9rHe35CaqnokLrZmZMFK9W2BemsXtYKnD8gdPN3xSjdAeP15P6GXHuMfSLtp3ZejY6uh
	IhFX+Ek7poNlgQHKVSm20FzC6SmIETw854H5UfQ7UMee4+DY6ioquMp9bLZHBcIGUrLArxwuXeA
	Ukxv8CxKLQeDvFVl9ndjzwj/+qCGNvLlMgpOPd1eDWwWJ8V4mC0rIYr2TcBPasgVV2Bttpl3OfS
	3fnM0niJGRw6n5OKTuRMwAkDvYZ0i
X-Google-Smtp-Source: AGHT+IFkPwza7fxOYhZSXIEIXrv3b6msZJPr0Rbpc3Ex/cbzI/o2TKpgKIGjxddeiTTBZZXWLHflFw==
X-Received: by 2002:a05:600c:1d8d:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-442fd60b489mr163703315e9.2.1747726791487;
        Tue, 20 May 2025 00:39:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3d6csm19620685e9.19.2025.05.20.00.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:39:51 -0700 (PDT)
Message-ID: <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
Date: Tue, 20 May 2025 09:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
 <CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
 <20250516102650.2144487-3-pritam.sutar@samsung.com>
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
In-Reply-To: <20250516102650.2144487-3-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_003953_347061_7995B3A3 
X-CRM114-Status: GOOD (  24.57  )
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

On 16/05/2025 12:26, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0
> DRD HS phy controllers those only support the UTMI+ interface.
> 
> Support only UTMI+ for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is
> out of scope of this commit.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 85 ++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 634c4310c660..b440b56c6595 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -177,6 +177,9 @@
>   #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
>   
>   /* Exynos850: USB DRD PHY registers */
> +#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
> +#define CTRL_VER_MAJOR_VERSION			GENMASK(31, 24)
> +
>   #define EXYNOS850_DRD_LINKCTRL			0x04
>   #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
>   #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
> @@ -1772,6 +1775,10 @@ static const char * const exynos5_regulator_names[] = {
>   	"vbus", "vbus-boost",
>   };
>   
> +static const char * const exynosautov920_clk_names[] = {
> +	"ext_xtal",
> +};
> +
>   static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>   	.phy_cfg		= phy_cfg_exynos5,
>   	.phy_ops		= &exynos5_usbdrd_phy_ops,
> @@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	u32 version;
> +
> +	version = readl(phy_drd->reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);

Please do not add mode info to boot log, use dev_dbg instead.

> +
> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
> +		/* utmi init for exynosautov920 HS phy */
> +		exynos850_usbdrd_utmi_init(phy_drd);
> +}
> +
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret = 0;
> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static void exynosautov920_v3p1_phy_dis(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 version;
> +
> +	version = readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +
> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
> +		exynos850_usbdrd_phy_exit(phy);
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +
> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		exynosautov920_v3p1_phy_dis(phy);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> +	.init		= exynosautov920_usbdrd_phy_init,
> +	.exit		= exynosautov920_usbdrd_phy_exit,

<snip>

> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynosautov920_usbdrd_utmi_init,

<snip>

> +	}, {
> +		.compatible = "samsung,exynosautov920-usb31drd-phy",
> +		.data = &exynosautov920_usb31drd_phy

All those new ops are only called when matching this compatible, it it really
necessary to check the version ? is there "samsung,exynosautov920-usb31drd-phy" PHYs
with version different from 3 in the wild ?

Neil

>   	},
>   	{ },
>   };


