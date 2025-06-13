Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB14C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXQlUz8NH4RKs5YhzNOm8OertaH0oxCLEbwOpHRFPsA=; b=fwybuSW6yCSproiEBPywQd3Dm1
	g3jEy8DD8RUg4aU8xTogIgvVFyvGiz2Nh9SZx72dCHLuCWP6DVGyf8WL0BFVbXxw+JRfUOn8k/zE0
	E1PW12thozkACQXd2CIx0oaWGfaBXI8CmAE11g8FNE5xyOOWVV3rNlbcl1BKAW7jdoa2s2GZXHYA+
	XIlNE/kbWxXqb/paJwN59cM69xNyfxa50FnQCjdo4l8oJ03PEW0DHTrKk5kyZscpgHiyEmHS91HUi
	oYWGXsgowcC6vpd7AtHVcQL+ecAjB4W+eeJZ4UURH+93hJy/GFOJXcR4I1VIwTj9/+yBWgR4tL5TK
	U6Et5rtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cH-0000000GAX1-2DXT;
	Fri, 13 Jun 2025 11:30:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0PR-0000000Fs2m-3hBm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:09:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so15616755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805752; x=1750410552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXQlUz8NH4RKs5YhzNOm8OertaH0oxCLEbwOpHRFPsA=;
        b=Oc0D2NvmjNU3UglsqCckqa1Xq/bz51NabEqrWomzt6P1K/I05VRmXO47dH+j52WqPW
         Vd+P6jMdp7lyCRmB1aU53C0b7Y5cdwz2mx9JWQU+gM+/GmWFu0AHmHaj5TpzCYrcZ/LS
         f4Y1DkDdphURtp4A+gaF3uIHEvmmZShYjDCtOHQbapNUS2LSEaqH80w53aLmq8THOE0i
         mBtT//oj1VOiHEPLVCgf2d89jHUSPLuAyxTePvhjW5C1PrZJhV3cFz4YfhHcs6fedbno
         yp9j96PQUAJbvnDyBquDSq5pLjQLv0Kc/OTJEatRaSW08XRDTrizoisMJKCCtk/01+le
         YSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805752; x=1750410552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CXQlUz8NH4RKs5YhzNOm8OertaH0oxCLEbwOpHRFPsA=;
        b=h41ptnH438OUdIBqmbOjcBtZzUZTZloQ+Wd95cRTdSFLk7Snc51BzQZ8JHhQiPtnju
         wPcTvnhZOMdlwRe05tjdA/CTWTZVO50tBjCTFAORbqf/FpJiYUUZHhTY0eelW9KB2Xtc
         HME+60JXJBYoFkN4/934ra/U+MgHxo7rwjFGhH05efJY8Vr1DDs1Ufg0AGO3sukmxXXV
         G7otnDm0q+ALW5lYPzAi3eXZ9up3iaDtyJajJmX5xLkOFX8ahPz+hgFhATeMTaIB2cru
         KlIVgXUhtClRrCW89qB3ny4/pcKWt2Izu2TAaCg3ZYMza9vYfHtFNFTkM/JQ+I4uF0kx
         WUFA==
X-Forwarded-Encrypted: i=1; AJvYcCXkv2VBxWc3HmnRufBX88meJoBO6zRAuMurCoAJfMJx4qBZXkHCWS1gLXhvhhbDYpzhllQEpBG9Ccbio7XeP7t2@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiVJKMAhATu9vCGeN5bKZfO6z8oRfnMnUbJ0jIXK6b6y/YGj2
	DCVjqV5nl8GT3ulEOJnB5pm+h6rXtKOxa3gTc/FqaUxGOLU4/8VIazwAyjgYjzenh0M=
X-Gm-Gg: ASbGncuo+GQOUdpcC5LJM1G+fk38JRsclg/ZUiSFWxYADMoyuk6VmFminLR+31ML27y
	cAcybYVNNBc274s3s9uUtD3deRG0u3nqUHKWEsup9hlbdljSFL5aGgxz3SKPNN7mv/sbUbFeYYg
	lMwgQobIXWDhLF2Pa0VfINeSzw0L68p9Oiy24AujC3DJ+4NUHYwJzBoa8669bGEuLd0rh1ELSM0
	/98evq9JYx+XdA/lJ0baijFA4Wvm6HDE3u+ZevZ1IygNI0NFie0JvRr99lXaDXS7rZXV/AsP8FX
	1IlKpZmkttyKdDv/Mlrvy0HRV9HRUt/8kKyNUmwIT9TAK99CL3SGMOJwluoxTVPUf96KYBSfPQb
	AOKz9B6gjWbFq22IOJnEVpHWSmuTv9g+LcaIseHc=
X-Google-Smtp-Source: AGHT+IHW3acdKxXcnJh3SLcMaiIZuM+wugqUJyJT7+OattxaekXRGEooYT12PSs+GLWZGdwtC7vsrA==
X-Received: by 2002:a05:600c:1c19:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4533499db1emr23920095e9.0.1749805752222;
        Fri, 13 Jun 2025 02:09:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm45570775e9.10.2025.06.13.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:09:11 -0700 (PDT)
Message-ID: <8e52fe1c-0c06-4e19-8552-ad3985ef8818@linaro.org>
Date: Fri, 13 Jun 2025 11:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
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
 <CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
 <20250613055613.866909-3-pritam.sutar@samsung.com>
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
In-Reply-To: <20250613055613.866909-3-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_020913_954660_BAE3EF28 
X-CRM114-Status: GOOD (  17.23  )
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

Hi,

s/exyons5/exynos5/ in subject

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support only UTMI+ port for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> The combo phy support is out of scope of this commit.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0..15965b4c6f78 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,28 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> +	.init		= exynos850_usbdrd_phy_init,
> +	.exit		= exynos850_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynos850_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
>   	{
>   		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -2228,6 +2250,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usbdrd-phy",
> +		.data = &exynosautov920_usbdrd_phy
>   	},
>   	{ },
>   };

Looks fine, with the subject fix:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

