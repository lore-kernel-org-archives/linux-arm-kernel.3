Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvOAxba2/00VE8ZUtElUxztZVVpqTN92ajrYDHddxwI=; b=Adh4u25o4LtjQCpLldEOfrvy3T
	lzViExO9U2dZUse3N4yC4xMEFpTPpz1UKhpiMsYmQsrk3bPMYuPp9YqKg2VPUCze0qgn+5Cb/dmv2
	QhccroOfFRAix12CFGJZcz4ZYXnnoRbHUGNLiOCmd9NDnP/cTmhYdFGJpYRziI58Vdr+A7qVltpa/
	wizETXGH7TbG+GGNsjnoj7smFT0O+Xwh0PEP4gYBBThnzvRgi1wEPf7C+AFhigiXdg0RDpHBTYRTo
	gYYzQzK6zTpvYgzsvlCABNr6S55hCv+hz9RzIRiLzciIcRPKHWU9T6O1EJPw2m344lGzchFk40nQk
	ojbi2HdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0vL-0000000FwB7-0AvR;
	Fri, 13 Jun 2025 09:42:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Ye-0000000Fth4-0wup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:18:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d54214adso15696635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806323; x=1750411123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvOAxba2/00VE8ZUtElUxztZVVpqTN92ajrYDHddxwI=;
        b=xlNTI12MUlGu7mEqTVL/oLnXVeo4efqqI5f07wLWqOtwWXtt2/zZezL6eXbWeFtUKH
         FJUfnVX/I6zxGAfDCEryo4PjV5bgDnOOfcWrQSZn3kHPqvWUTcHtrFLFx/BFb4tPv+Z0
         9yIrvwyHUnkqWZAJCpna54kvXApSZ+QkmhYGUpRJmiyoVUC4ZBH8Evs2ZeIkQw8+8R+L
         ulXm1QXY5VD3qy+1fKbMpSslD//b2xYUOlyZyI2Gfv/elIYCO2bcdQjup3AYnQkZNtYm
         nGH6v6BhAqbOc5+7ckIXPI5rL2JzvQb0GY2ztNuDJqixaQShCMCKevnGZBMhEQLCOsOi
         lDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806323; x=1750411123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rvOAxba2/00VE8ZUtElUxztZVVpqTN92ajrYDHddxwI=;
        b=qIxaDOFdbKoxfxp/nKPu+McKVogYFz+vKS9o62bDEGZrm1jlSnoR6cz9Gzwv///knk
         6tF51Sd2+KGwGAW/iUHBhL4dUQjHK1Q5bS8oBvE4/pXpfH9nmRaU3hsY9T6qOgn4dxQn
         gB/EYccfScj33P0GWlf5+prID5hibPrQBn7t55uuahgwsVvhs+IeYo1hDmu4ZdUgORMU
         snCV0harE7K6zLMCpk+1RTQbSPtwMFry5JI5v+eEM3ZjUZ3dHe3AlfswayE5qXlMCJ+b
         OU/YNABanCOl+evfvXTibkRp5kESgJzsy7SOdKXNwbo1m2vSIAj9oVUOIcxxr3YnQCip
         WbsA==
X-Forwarded-Encrypted: i=1; AJvYcCXtTBGvoCHz2yRTsyzUvNl5VVAfrpH7v/NFfmrmHK7Z1kSxaZNly/a7BPY8HielIpxxEmqOzcFHIB83DkIGa0Hx@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIwSM/+4dKrFkG5UBqWuC1zVClzFe6Q3FOO+UcUfyxX7jHLcL
	cuR0aV5w7HYtq4N0q1YSYo8N9appluwwVWRqbbdNi2qrOuiGxJnb58rfAzKdt3f7gFI=
X-Gm-Gg: ASbGncvymOcVKqW5K8HbegPlBhx37pzFIWjSl+lYiSPN+Gq8sDNx9QgbTeFgZYIAHno
	Fz8k+7DadBxXswQQzK2ChRZ7zHod5PSfjgjPFSLLXmZP01TmtOOIsNXC3jguhoa+cLoY0N8h87o
	rVzeBpEuRxqPLLiW4CJfQaeF7NtilzmEG5C5TJjTQlgyOE629lQZPWW/UPZLmXaFwy2kwG3HH7v
	5cKaeHZtLSntVy4oJy2/yFnHwLWhZ3jK+c72Td6VyxVzhQNDqPFI5mqN7KN32IJvD/P4DJaeJv4
	yHLtlyL9OGZsQZL5dz97SNuej4/IUhXBNMHoGmYeURy26YasglSQ/RE7v3pxU0beBonITnakFhV
	my/iyhok7khEnBfQcAoE5c8UdjZ2rPmFbo5mLT60=
X-Google-Smtp-Source: AGHT+IF88GdW/9+83jn7KWBiIwltmYkzKMHV54Iv3aLyXMYm3AtrpaFf6Fm3vYfY7PC7NerjrZzM+A==
X-Received: by 2002:a05:600c:348a:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-45334b7a9fdmr21567635e9.29.1749806322733;
        Fri, 13 Jun 2025 02:18:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b6debasm1768202f8f.93.2025.06.13.02.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:18:42 -0700 (PDT)
Message-ID: <4f30104b-aea6-4820-9b08-047297da149a@linaro.org>
Date: Fri, 13 Jun 2025 11:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: exynos-mipi-video: introduce support for
 exynos7870
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
 <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
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
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_021844_271917_1493C341 
X-CRM114-Status: GOOD (  16.91  )
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

On 12/06/2025 17:09, Kaustabh Chakraborty wrote:
> Add support for Exynos7870 in the existing MIPI CSIS/DSIM driver. The
> SoC has one DSIM phy and three CSIS phys.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   drivers/phy/samsung/phy-exynos-mipi-video.c | 52 +++++++++++++++++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h |  5 +++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
> index f6756a609a9a0774ecb6e27cf96726891683636c..b184923b9b400f0d536a913bdf32f3156c0a1854 100644
> --- a/drivers/phy/samsung/phy-exynos-mipi-video.c
> +++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
> @@ -213,6 +213,55 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
>   	},
>   };
>   
> +static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
> +	.num_regmaps = 3,
> +	.regmap_names = {
> +		"samsung,pmu-syscon",
> +		"samsung,disp-sysreg",
> +		"samsung,cam-sysreg"
> +	},
> +	.num_phys = 4,
> +	.phys = {
> +		{
> +			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(0),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(0),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL1,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(1),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL2,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(2),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		},
> +	},
> +};
> +
>   struct exynos_mipi_video_phy {
>   	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
>   	int num_phys;
> @@ -351,6 +400,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos5433-mipi-video-phy",
>   		.data = &exynos5433_mipi_phy,
> +	}, {
> +		.compatible = "samsung,exynos7870-mipi-video-phy",
> +		.data = &exynos7870_mipi_phy,
>   	},
>   	{ /* sentinel */ },
>   };
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 1a2c0e0838f99821151661878f022f2129a0c19b..8fd59994bca76a6bf21306337f0b47ccb5a22adc 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -662,6 +662,11 @@
>   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
>   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
>   
> +/* For Exynos7870 */
> +#define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
> +#define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
> +#define EXYNOS7870_MIPI_PHY_CONTROL2				(0x0734)
> +
>   /* For Tensor GS101 */
>   /* PMU ALIVE */
>   #define GS101_SYSIP_DAT0					(0x810)
> 

Looks good:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

