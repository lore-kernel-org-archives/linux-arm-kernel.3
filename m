Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3075EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDAeoWtbnKB6P/zjHBNTMfXxf0ibh6HhQEV5pECfZLA=; b=FZdhIK514nF55b1ofExUpVqpfW
	oNTNAJjuyobVEzkPPF5Z8dsxVF081JY5PDNp2vJ+axBlNJvIjmnxGeKsfRSDxEkhvcIuJbvH3bSXC
	UcCvhOjPQqL/WM7+hOtROcQDXT7j9L0wA3gJ3N54iGS9CgWpUyF5RLCWwPhuUNxSbDWIxceopDY0O
	KPc3/Q7EnM3E8O5FbGvs+lCSM/GPQ5SDNl5Qk32pHkMjc+h8OhfRKiJ4d+sXrGCmTVgx2dh/vhjGK
	AN2EsRrx0Vdv7XPlOQFkOmUC49Fu2vsZUevZrtlZ2obOyjyz4QllBQ721pRooSorFboCH8Hf8jG0c
	JEkVxvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH19f-00000009P1K-1KJY;
	Mon, 19 May 2025 14:07:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH04w-00000009EBu-2Hkd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:58:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1685790f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747659528; x=1748264328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDAeoWtbnKB6P/zjHBNTMfXxf0ibh6HhQEV5pECfZLA=;
        b=IWDs8DjrC04eEFoHE5/Dl1hiPV6S1Kas2LQydQIJGnSgf6EsMlV1IuQ3I2e26FS3iw
         hAPOPvIiSqXgP2Uana27JPjB8T45l7ApfIp/UXbLzr4f5qBjFWqiyvxR2qDoxeXD+Vra
         LhTAbtHx+aOUwSgj7Sdpel0yX64uGwLX8mKC69cQY0VVn+ZszrtXi1krIyf336wVO6cK
         P8qzgEgnEaJbeApdJZskqt7hXRdPwkzukTUp1naeCoBUyLHmyYT+k1nPmiANluBuQP1o
         kwneR7cgWB538GgzjIDwQ7bdylqwB/lk/XMDkbxGb7yrq1Kwf/PAZZtvLs8Ai/NOCvui
         y/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659528; x=1748264328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDAeoWtbnKB6P/zjHBNTMfXxf0ibh6HhQEV5pECfZLA=;
        b=objYB60ug9jZq96HxH1h8NcysAAQbWJBKt2UKMNI2bH4Ztno5Kz76aaG2cWMI5WTlO
         wbYp5wheUNS7G4FqkAHwhVqdFeh1APGkL0XyQSKSLkf+VFESqvMdmtNXbRxdXADz6cQr
         kq96LjZbaZNYW7H30ZYHONbANCm+BGxpQxdubBXl9gOmvddqmD6nu0i35r4K7ZkDJK2D
         mVZivFmL+aSu2FC1XSWWf3Z9v4qyXlqyBRfQVcHzr5eZgGRXodxBmkM1oHXDC7bsCfOp
         KImG/6C1w7wZ//JnPdfciYX14dcZlxnYd2E87WyOmoHzBvLZAc4dPkp6drHRsPUcmMsn
         YMjA==
X-Forwarded-Encrypted: i=1; AJvYcCWNGgfW72BlvLQeSJRSwRBKup/f97AKA7fPuBNjDGmmrhJb4bANN2b2AmqT7Pa+t9yiSOliVYZm1zZ91zqb+yoK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbfq3/t8g1UUQ+z3ayGbFuj6NiWk0V7Ibhy47rONT+c6mXezr6
	nQSOFYkHKWoq18h0RqtHr/FfMhP5dczsDKNeXNAabNQQ/zw5oLLhXyevz/8Ih9zj9qM=
X-Gm-Gg: ASbGncseQ3VHRpTzEg1vhuvE5WXXUI0GQ8Zd7qF/92xkmuOs6gRfxUJmWLdo236B+0r
	nDkAQ0zGH3XYl2gssKG7W6jeVm+ddRxA3i8nOtPeBr4bux+q1s2FgGparW/fIHmniH/IkcVoaOc
	aEaAbNdvo4PRf10kpj3QE1W7f5IyRFMDSMNUUxDzzZsVzO6Q9FuOFodjYHH8q7ylmB+G37bLTJ9
	l2m6SvQyZtfMZJwfEnbYQwIXdMdJRG2nxBEeCsGRpZ6ChWqNTN/qP5Jyk9xl4vJdCd2CMLrEdHw
	yp529saZnKZqn35w827aoEAifm4ARXiXY9oKrv+B9BH3/IbiAq7T8kQNT96zQMaJaHhVtfX5apK
	9wwsX4KgZVh0vNjff84oNt+frT/3T
X-Google-Smtp-Source: AGHT+IE2jbS/WrOWl6VOpZZrzWvyYrqiY2DC7a8nSQu7OpS2BKTDXTieUo3VSWC+NsQLBWWeGzDgow==
X-Received: by 2002:a5d:64ee:0:b0:3a0:b23c:15b9 with SMTP id ffacd0b85a97d-3a35c808c9fmr10886861f8f.4.1747659528291;
        Mon, 19 May 2025 05:58:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6265fsm12524381f8f.43.2025.05.19.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:58:47 -0700 (PDT)
Message-ID: <491d2d64-b06f-43ec-ba74-a623613beec6@linaro.org>
Date: Mon, 19 May 2025 14:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/2] phy: exynos5-usbdrd: Add support for the Exynos990
 usbdrd phy
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
 <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
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
In-Reply-To: <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_055850_617519_BF01DA12 
X-CRM114-Status: GOOD (  17.27  )
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

On 15/05/2025 16:43, Igor Belwon wrote:
> The Exynos990 usbdrd PHY is a combo PHY which supports USB SS, HS and
> DisplayPort outputs. This commit adds support only for UTMI+ (USB HS).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c    | 32 +++++++++++++++++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0856f1e445630e2cf97b3c3e46b13..dd660ebe80458a13413ca9735339b4e1095af8ea 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,35 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
> +	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
> +			     (HSPPARACON_TXVREF |
> +			      HSPPARACON_TXPREEMPAMP | HSPPARACON_SQRX |
> +			      HSPPARACON_COMPDIS),
> +			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 7) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_SQRX, 5) |
> +			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
> +	PHY_TUNING_ENTRY_LAST
> +};
> +
> +static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
> +	[PTS_UTMI_POSTINIT] = exynos990_tunes_utmi_postinit,
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynos850,
> +	.phy_ops		= &exynos850_usbdrd_phy_ops,
> +	.phy_tunes		= exynos990_tunes,
> +	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +	.regulator_names	= exynos5_regulator_names,
> +	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> +};
> +
>   static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
>   	{
>   		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -2228,6 +2257,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynos990-usbdrd-phy",
> +		.data = &exynos990_usbdrd_phy
>   	},
>   	{ },
>   };
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 1a2c0e0838f99821151661878f022f2129a0c19b..7754697e581077ec0fd60b63649728896ca145c9 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -662,6 +662,9 @@
>   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
>   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
>   
> +/* For Exynos990 */
> +#define EXYNOS990_PHY_CTRL_USB20				(0x72C)
> +
>   /* For Tensor GS101 */
>   /* PMU ALIVE */
>   #define GS101_SYSIP_DAT0					(0x810)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

