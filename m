Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D55AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqY4hSJTXleEE1pz/7Bi05zwmg/nHE6Bf0rPkLEdWGw=; b=ALWo00zLcW1v2Ruo/Aw1O5q27f
	FLPXnsINiedY9elYz1zIYNH0nE9BCNorRC3NsfWNqxSmr46LPklWWwrELkmrFm2bdJLbjXsNH2U1x
	+7xN+Ob7jZHWs5Gz57erM/M3AzRXf/lxNct+fOT8MwskgU/IvALmFSlRL/zxi9+noQ3OA6iSOLkbL
	0EkZGdFLXwwnLoMb6EvoVa3jRnuVYg3PjcxsynvskicJZtAkh93EV0fUIuEhSJ5SQYFJ8UgQvNLt9
	DPTI+w4fGW/xHx3bB4U+xJYQHXgbdg519e9qkPLu3lfA5T9rhRqGlRyFnPMhDWAlME+KtmD1SgJbW
	B0NOMG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39vY-0000000D3Ok-3004;
	Fri, 11 Apr 2025 08:39:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oa-0000000D1pO-2dX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so18177035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360363; x=1744965163; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqY4hSJTXleEE1pz/7Bi05zwmg/nHE6Bf0rPkLEdWGw=;
        b=gN22GXKMN7MzD26wRuT3QOx+5PbETv5417cxurmk0WS1P4LAhyr+AWNYAzwNBd6kPN
         1CdIFdcthArD6ClUKwFlo7ZPMQyM/9f5DJ8+nys6eBgBPOl/KgpozCwBqYBCxcDgOX56
         BHZ7vu0z+7l3ckswvqHIxs1ChrwSK2E2x6slUr3GJIuN/HfCitGyNKA7r8qnUNv8seqH
         KJzXcCl4APZNBzQkUzjpMYDRCq4m5L4aBDtWAsukpDCVqrC18e3sPqx3envXWaqBXPhm
         xfecym8pgOI6S1sTiRptTTXZC/Qlz+5hz6bvp1vKcMcO6kN18Y1wq7r2hQx4bRNFpjos
         2U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360363; x=1744965163;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqY4hSJTXleEE1pz/7Bi05zwmg/nHE6Bf0rPkLEdWGw=;
        b=LmCsqFSrsvbhXMGSLihiTwDc7IfqyXxwxNGbX20FWRAlUPwx8cWnMhJ9zja34ufcYR
         PxxiNuSxSV5vVAuCvJdp5NlRIM7ov/r7LshLULjzMkULQG21nk1ogCJTb7ggsIVvbYBf
         wtQjEQ0KvqV1m0SMknLv11HNV0kCw8PinykznElbp4yDvBkRELopuauprL34nwomO2Wq
         umMTgibY0hdFYgh8YNhpRtFDScuSul5OKMImli0xagkfWFBvpulX3JsM9lgx7asJ6t5C
         Zb9Gj5T8i3zfiZX5gCWyU+nuTQx/t5V2brr1wtrUhW3sJjWnN8YqDURpLnUmgiKciUM7
         HVZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlYtIXcNI7wCI+vKc1CDdVoxVD9gWIHD4bwLxNRdEykHA3K0hphWlvxOEHOK5akImv7Dd+1k0yn0I8eCjjoLIA@lists.infradead.org
X-Gm-Message-State: AOJu0YxOS70GkHEVvrWfSPx9xVC2rwKSQCcDEoI3+ydts9ea0mXHduTc
	b5Zbz5lCpn9sLkyd47Db8WNyWaWvXXS5awdNA36T03lNE9kJpjb0BJ2Yravqows=
X-Gm-Gg: ASbGncs2myx/MQuNNZ3bP8tYUGRFKVb6N6RQTMPFv+1YkGOS8mRC1CxEUmhcQkHY2yF
	icMv3QZpATC/Gh1CmlFIMYglo9wzrMxJDn/6M/vvZrwkosiAFa/IUy++lKvoRrTQQhcWJuiGX/P
	f+63rxDbJHvdu8rqO+02Gv6V3UgoDX+BLjCxW0LB+eRM/SCjj6yX+djzko1xLKCXoZpRb6uH29F
	kQiCuKd0Jnma/AsehWm1G2GDxQGtilA+6Qp3aupnVS4WZK1vs+TePmfcj4nny/GNj/TwPkAvCmp
	U0JjGEgmikp6KTvXpmc4Z3BZnVxDz1TXDj3Q6UPgoYnuPaSXAna9sXPXOvcFHCqGLkj08oi54Aj
	KlAH6csGCCwQoEkYCig==
X-Google-Smtp-Source: AGHT+IFbIZHLwiFcr56HmOrCgzLC1RMK5T2F6MjZ5bzHBQpsQ3xTezUFx3R0z93GsoU8XdzOaPimXQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43f3a9beb77mr15610705e9.27.1744360362941;
        Fri, 11 Apr 2025 01:32:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:42 -0700 (PDT)
Message-ID: <3b62ab93-a1f8-4bc7-99a9-45ef3d18c562@linaro.org>
Date: Fri, 11 Apr 2025 10:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog:
 Simplify error handling with dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
 <20250410133332.294556-4-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-4-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013244_676564_813834A2 
X-CRM114-Status: GOOD (  14.88  )
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

On 10/04/2025 15:33, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> index ae898f93f97b2..c0ba2852dbb8e 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> @@ -200,7 +200,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   	struct phy_axg_mipi_pcie_analog_priv *priv;
>   	struct device_node *np = dev->of_node, *parent_np;
>   	struct regmap *map;
> -	int ret;
>   
>   	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -219,12 +218,9 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   	priv->regmap = map;
>   
>   	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
> -	if (IS_ERR(priv->phy)) {
> -		ret = PTR_ERR(priv->phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to create PHY\n");
> -		return ret;
> -	}
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create PHY\n");
>   
>   	phy_set_drvdata(priv->phy, priv);
>   	dev_set_drvdata(dev, priv);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

