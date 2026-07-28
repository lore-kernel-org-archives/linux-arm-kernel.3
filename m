Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F76EC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZnqPhGOn3Vzybpvja/5hfqkybxvBtnzPFBr9hYn61Q=; b=AHmTH33eG9QVHW5v5/YRyV4w/e
	Ton2CTQTL/nDQ2H15eFU+i6HwCeGtde1QhpQsXFWKZluuaOyfNJ5IzRU0ZeEcY/ikCO5qYTEBDGF/
	nN2eilTI1mszaColafwczG0rbtLLcCVa+dPSmkJ5p+ymBm8u7A2gQB1o/XlmYtT+UBm+xwRObVozS
	BWOhH+ZvruA5vIrALNVwGeKvRnkOkHU4B4eY/Vg1k1QpNJBgV2p0/K3QolSUbFspaUcdUxnj7P5WM
	hpnjQEu/ECOON2QXGEu5TQnm0yr0C2afNWmkNaRWYrC2MuEjSjzeXgEK4chkC4IsFtSczfSvX4vxn
	BRmsvyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodH3-00000004j3B-3IMt;
	Tue, 28 Jul 2026 08:34:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodH0-00000004j1e-1n6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:34:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so18834915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227688; x=1785832488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZnqPhGOn3Vzybpvja/5hfqkybxvBtnzPFBr9hYn61Q=;
        b=FvGh8ra6WBJnToO7oXnNOsCjih97lUxF6l6Hc9E1tuE5dt5KTUltE2cBN7WMctfH1N
         AvObE4zCtfnG8pNhMiNq0gpZY8xr5qff7eioJpV/3riUOmyTW3nRI9+RdXLd4/UlqmQt
         YbFCRYQNqpnjwgTjHgRxZgT4DoyIihFirsr1emFmY4jOpOPa4psPfDdYbSQhwwFzaMnu
         lD3nYrnKpTDYLCIeBLDyzN+0StWnw4iuWWXrOSea14BBnESXBPj7znhXYO0DXLoys9u6
         McKzXYdD+d32mFKHqV4l4gTzlheS8A3AjP6yjsWKe9P17nKZ7SjHbsQceHfv2ZZpIH8m
         6vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227688; x=1785832488;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZnqPhGOn3Vzybpvja/5hfqkybxvBtnzPFBr9hYn61Q=;
        b=MmuUy1IO6vhR55OuJNEppUqaisSJF1YcyhrC6aThSKMlGefkYSxvt5hb9eR5I2Jw4M
         gBpk4ofW/gXE/5Bauvdt2Kp4GRF5CRExciCVYtFqKqiMK60198xLKW+kZq8N+dPjauK+
         noiCgG9MRao+Z6WSVdci04bhUr2dRt46JvH79yQLpPdkzYC+1AZ6ObJzqsxVEk2QAWHN
         PxFhATrcx6t50B0CgeU4XO7fY8KzzJmHpk1vq4ulv+QG4SYE7lNRWBR33RFJwGR+By2Y
         EEVvmyPZYxpn8FBr57bge0l6fVKsFjgiOf1HCJ+4e8JDfndACkoju3wQkNEAI6VaO3bd
         oMlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjZR1H3YoSDyypSOJO1pNNM+5FmN+keQ+Sds3NcK8kpXSWMELaAJ1FhjYHlBew2oNWDarPK7SbXedMaCTGqac5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzw2FF6n78Xi7cXyJrz4WJYqAUzHrF82UABRvegIzBS5c2Zu6E
	m5MEut/tBAnNqRBbp/JimxgQaJd8spB1P1vXhnLLG/UP8JKEMpLlNq6n3WWIkBCP+IU=
X-Gm-Gg: AR+sD13JElYkX10MnYpe+qM+pwKhc/Jt0X3jOyTaJ8/sbr94CVMIm7byOc4+M1T5uO9
	A+D4gR2ovcmYEdNN1x/gu34exyo/SB/luCI9EQrdI2dg8aVpnYbBi08dgOGiGIEmHiMGj3YuS/t
	4u612MofW7+UkrFJzXk9sB/mnRW8iaZyNd0Ck1ZV9ed0tfve5NSRNhSOYfmiHiqmw+qv1QgYPrw
	+4EcvY56xLdnf/w22D1foP+LK8jU9ogMWlotGz2UyZEr559vENolCfmls8E99ChoRiyrgLK0KCr
	7XJ/L1rqGHPtCidMD8YXuOtdxvc4TuAN5Kix+ti2SsjodSGlJDIC9IX4+09ZGfgml5ltcRnRFwC
	ApJDBgl9Ncg4DoTiIZ/kfCDyeoZpobSZWYtvr4wD2qMu4EhVH+fnFvD5Y/wD3cVvVY6PgpBMMrF
	4OH8tgZ6xz2SxHz2QOevqFkg+bViapMfqdFPEJv2kt5KJwNbtfbWUGA2fQDOKgpXEbfETO
X-Received: by 2002:a05:600c:3512:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-496c6568ffdmr13771205e9.19.1785227688277;
        Tue, 28 Jul 2026 01:34:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfb20ddsm254637715e9.3.2026.07.28.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:47 -0700 (PDT)
Message-ID: <822ff7be-7d89-4523-99c6-051fcda9efaf@linaro.org>
Date: Tue, 28 Jul 2026 10:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A9 power domains
 controller
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
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
In-Reply-To: <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013450_529125_0339BE24 
X-CRM114-Status: GOOD (  17.86  )
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

On 7/22/26 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for the A9 power controller, whose registers are
> in the secure domain and should be accessed via SMC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 69 ++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 1d2f371d2d7f..133549956efa 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -16,6 +16,7 @@
>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
> +#include <dt-bindings/power/amlogic,a9-pwrc.h>
>   #include <dt-bindings/power/amlogic,s6-pwrc.h>
>   #include <dt-bindings/power/amlogic,s7-pwrc.h>
>   #include <dt-bindings/power/amlogic,s7d-pwrc.h>
> @@ -175,6 +176,65 @@ static const struct meson_secure_pwrc_domain_desc a5_pwrc_domains[] = {
>   	SEC_PD(A5_DSPA,		0),
>   };
>   
> +static const struct meson_secure_pwrc_domain_desc a9_pwrc_domains[] = {
> +	SEC_PD(A9_DSPA,		0),
> +	SEC_PD(A9_U3HSG_U3,	0),
> +	SEC_PD(A9_DP,		0),
> +	SEC_PD(A9_DOS_HCODEC,	0),
> +	SEC_PD(A9_TAHOE,	0),
> +	SEC_PD(A9_DOS_HEVC,	0),
> +	SEC_PD(A9_U2H,		0),
> +	SEC_PD(A9_U3DRD_B,	0),
> +	SEC_PD(A9_VPU_HDMI,	0),
> +	SEC_PD(A9_U2DRD,	0),
> +	SEC_PD(A9_U3DRD_A,	0),
> +	SEC_PD(A9_SD_EMMC_C,	0),
> +	SEC_PD(A9_GE2D,		0),
> +	SEC_PD(A9_AMFC,		0),
> +	SEC_PD(A9_EDPTX,	0),
> +	SEC_PD(A9_OPP,		0),
> +	SEC_PD(A9_VICP,		0),
> +	SEC_PD(A9_SD_EMMC_A,	0),
> +	SEC_PD(A9_SD_EMMC_B,	0),
> +	SEC_PD(A9_ETH,		0),
> +	SEC_PD(A9_PCIE_A,	0),
> +	SEC_PD(A9_PCIE_B,	0),
> +	SEC_PD(A9_NNA_4T,	0),
> +	SEC_PD(A9_HDMIRX,	0),
> +	SEC_PD(A9_CVE,		0),
> +	SEC_PD(A9_ISP,		0),
> +	SEC_PD(A9_ETH_1G,	0),
> +	SEC_PD(A9_U3HSG_HSG,	0),
> +	SEC_PD(A9_U3DPPHY_U3,	0),
> +	SEC_PD(A9_U3DPPHY_DP,	0),
> +	SEC_PD(A9_PCIE3PHY,	0),
> +	SEC_PD(A9_U3HSG_PCIE2,	0),
> +	SEC_PD(A9_MALI_TOP,	0),
> +	SEC_PD(A9_AO_SED,	0),
> +	SEC_PD(A9_AO_IR,	0),
> +	/* UART_B is for console log, and should be always on */
> +	SEC_PD(A9_AO_UART_B,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AO_UART_C,	0),
> +	SEC_PD(A9_AO_UART_D,	0),
> +	SEC_PD(A9_AO_SPISG,	0),
> +	SEC_PD(A9_AO_UART_E,	0),
> +	SEC_PD(A9_AO_CEC,	0),
> +	/* SRAMA is used as ATF runtime memory, and should be always on */
> +	SEC_PD(A9_EE_SRAMA,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AUDIO,	0),
> +	/* DMC0 is for DDR PHY ana/dig and DMC, and should be always on */
> +	SEC_PD(A9_DMC0,		GENPD_FLAG_ALWAYS_ON),
> +	/*GIC needs to be used consistently, and should be always on */
> +	SEC_PD(A9_GIC,		GENPD_FLAG_ALWAYS_ON),
> +	/* DDRPHY is for DDR Work, and should be always on */
> +	SEC_PD(A9_DDRPHY,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AUCPU,	0),
> +	SEC_PD(A9_DSI0,		0),
> +	SEC_PD(A9_DSI1,		0),
> +	SEC_PD(A9_CAN0,		0),
> +	SEC_PD(A9_CAN1,		0),
> +};
> +
>   static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_NNA,		0),
>   	SEC_PD(C3_AUDIO,	0),
> @@ -425,6 +485,11 @@ static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data =
>   	.count = ARRAY_SIZE(a5_pwrc_domains),
>   };
>   
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a9_pwrc_data = {
> +	.domains = a9_pwrc_domains,
> +	.count = ARRAY_SIZE(a9_pwrc_domains),
> +};
> +
>   static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>   	.domains = c3_pwrc_domains,
>   	.count = ARRAY_SIZE(c3_pwrc_domains),
> @@ -468,6 +533,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,a5-pwrc",
>   		.data = &amlogic_secure_a5_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,a9-pwrc",
> +		.data = &amlogic_secure_a9_pwrc_data,
> +	},
>   	{
>   		.compatible = "amlogic,c3-pwrc",
>   		.data = &amlogic_secure_c3_pwrc_data,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

