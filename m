Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AD9C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh7ER1Dmanr4y+39og58ocm6fbkiGZO7MPBDpLIvy7U=; b=Vz5xotWl4v5/xZhi0YHoQv8Zcw
	rvfdKejWkXzXm2LMUFQd/PFZ1YxMtjgew3wNK5Z3CaJbz8RLmQwXg25yHjVaIBt9uLR/WFneGevlV
	RgFV9nIbXl9F30UFyrbYOy6GGt+jWfRW0HIQdfmOkYKZuI2mBjyA1E6Cw+/A/6iujidEwetqk0o1M
	hNySP8C98VzNCDoSPcKoC56KT2k+TaOr6SKPerxx8QjVHO8SJubxi5lKqVFHjlUT+JLheicFkxexf
	06FCl5JjohdiwKSaJFUd9Ell3c3mvxMnkIbqYzLtuf1cNgwSUxU6MKT3j9wBgy7N0kMQPhcYzLgHq
	Q4vJX9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmY3-0000000BcCV-1sVP;
	Mon, 05 Jan 2026 15:31:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmY0-0000000BcBh-3Fnh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:31:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso204715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767627067; x=1768231867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kh7ER1Dmanr4y+39og58ocm6fbkiGZO7MPBDpLIvy7U=;
        b=R/lFjTqAXKZf5vsuZFosvPosXtGCC8AEP0L2juYx6N8wGVkb9Qu4t0S3eWO/BxMtbD
         0mTE4F6C5chVJnINf+N3HgGSyopUgcr4Yw1cbNgEAw0Ql6DARm7lu15uSLciWHBloubp
         y2LKX7xwSQnFKETwWkvsUDufc1JRo/qW5CTjTUknkUkmyDvVQZBDSkreVOH5oij8M2Xu
         at6YlceP3dy5XF8isRKJnel5V7RXZnD5hPuZrVS9lTa18xPzvduqFRcIcnFWWCbYBuaz
         dkp99YY/pdDysdL/rKv2UYPEwG/PaZZ/Leabuq9ku2tcHSUaeZqd3krpSGA8R4dn4w5T
         2ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627067; x=1768231867;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh7ER1Dmanr4y+39og58ocm6fbkiGZO7MPBDpLIvy7U=;
        b=ttuY/3tYwcdttL/mprNgbF5ZmC7KouocDi2N9rQiHI7A9GWwup9f7DOw7lO0eTxPXm
         0A1mDJl96Aynd5c2rvVnvYAPTshEwd9y/VfoUDUsVEZsBwBd3Y6aAFToAKdcTqy5dJNN
         sYYFyxJZQ9sf2PLloQd/qeM3oyXpI5mYkOXVoWU4Mnsk6lxKF5TvpNTfZyoC26V9Rp+t
         4eUYFqtJaVeQnrCgD/HQ/9CsS4/bU9aSO5oAV7zkDdetG9tXKLeM5GmE65w6stfWnvrj
         0WAce0NoXiPzj5Jx27VMULG5JW5KUnVay5inC8tEeOi3oX2LDAIf7iw/fZFCNJ99eexd
         FCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyzObUxqlMbIxLWu42ayD5GkdNvdywo12HoenEq8tw6JF6quTrW35QXMqVSNKsG6BK2frOzU6muNirVjt2o9mn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdv8nw1EMnAmH+j6Dggnb2+R1IPbIMBHyThcTnSAF78eh25U0g
	TarNoXHq80OLDAirBCy3eLhCThGTwaggVr+Qx9SQj1YVv1Y/fxqncv42YSdhtTVd2jU=
X-Gm-Gg: AY/fxX7NfZx90GN+DlNa7v16iplbvhG0C3vcD4zMXb8tVd5Q+vNBPf3ri4+I9hRIjSP
	eAoPkos5ZQMjwluz0UAwMr/56VSf1XkZed2PAb4iS6SyzaztLCL7HEuaBCOvtKH2z4YXEjVWxH3
	1karkEVQUl9x/nH6hd6V6HC3LcHvZaPZiaXm/U7OIlDNjBiM+O4KfWjwJbZtWNMP7K4YLVgzLFz
	Cv5LYvSXL1qZ5qBzt+kGRjeNYGjjinXWeywMVtMvD8bXHZBkUPuWpuXfrHLmhx+Bi7XUr3OFSMS
	WJ5RCv+B1ZwZTTiHVhO9ND+ZqTM54vW2rlEMowAjrEe/uGg2xEpiKkr94lSKGPSFt0GmsEjczWJ
	YoOMhcfv/8cr6Ob00YqgRxikw05r2gtzi/2zFxqp4mk+Zi0kEcMeeG0/UWaAxUXHOJMPA5Y8/C4
	nxXSF5PJ+tYyoSG7WBx67z44XfeSOo8y0UnXsFptYsZw7nc5uIFeY+UPBrD+mjbi8=
X-Google-Smtp-Source: AGHT+IF9p+zKmR/tG/QS3dmxJEiAQ+4fOpsU5CcbeUbUUYyNOe96pzX1d6+ryPIbDaQZfZIY4GH6kw==
X-Received: by 2002:a05:600c:35cb:b0:479:3a88:de60 with SMTP id 5b1f17b1804b1-47d1959e061mr604884885e9.37.1767627066781;
        Mon, 05 Jan 2026 07:31:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca52c0bsm111732f8f.26.2026.01.05.07.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:31:06 -0800 (PST)
Message-ID: <593bc508-5322-40cb-bce1-2965b31abdbd@linaro.org>
Date: Mon, 5 Jan 2026 16:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: socionext: usb2: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260102124848.64474-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260102124848.64474-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_073108_873988_03EAF89D 
X-CRM114-Status: GOOD (  17.92  )
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

On 1/2/26 13:48, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/phy/socionext/phy-uniphier-usb2.c | 28 ++++++++---------------
>   1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/socionext/phy-uniphier-usb2.c b/drivers/phy/socionext/phy-uniphier-usb2.c
> index 21c201717d95..c49d432e526b 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb2.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb2.c
> @@ -106,7 +106,7 @@ static const struct phy_ops uniphier_u2phy_ops = {
>   static int uniphier_u2phy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct device_node *parent, *child;
> +	struct device_node *parent;
>   	struct uniphier_u2phy_priv *priv = NULL, *next = NULL;
>   	struct phy_provider *phy_provider;
>   	struct regmap *regmap;
> @@ -129,34 +129,31 @@ static int uniphier_u2phy_probe(struct platform_device *pdev)
>   		return PTR_ERR(regmap);
>   	}
>   
> -	for_each_child_of_node(dev->of_node, child) {
> +	for_each_child_of_node_scoped(dev->of_node, child) {
>   		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -		if (!priv) {
> -			ret = -ENOMEM;
> -			goto out_put_child;
> -		}
> +		if (!priv)
> +			return -ENOMEM;
> +
>   		priv->regmap = regmap;
>   
>   		priv->vbus = devm_regulator_get_optional(dev, "vbus");
>   		if (IS_ERR(priv->vbus)) {
> -			if (PTR_ERR(priv->vbus) == -EPROBE_DEFER) {
> -				ret = PTR_ERR(priv->vbus);
> -				goto out_put_child;
> -			}
> +			if (PTR_ERR(priv->vbus) == -EPROBE_DEFER)
> +				return PTR_ERR(priv->vbus);
> +
>   			priv->vbus = NULL;
>   		}
>   
>   		priv->phy = devm_phy_create(dev, child, &uniphier_u2phy_ops);
>   		if (IS_ERR(priv->phy)) {
>   			dev_err(dev, "Failed to create phy\n");
> -			ret = PTR_ERR(priv->phy);
> -			goto out_put_child;
> +			return PTR_ERR(priv->phy);
>   		}
>   
>   		ret = of_property_read_u32(child, "reg", &data_idx);
>   		if (ret) {
>   			dev_err(dev, "Failed to get reg property\n");
> -			goto out_put_child;
> +			return ret;
>   		}
>   
>   		if (data_idx < ndatas)
> @@ -174,11 +171,6 @@ static int uniphier_u2phy_probe(struct platform_device *pdev)
>   	phy_provider = devm_of_phy_provider_register(dev,
>   						     uniphier_u2phy_xlate);
>   	return PTR_ERR_OR_ZERO(phy_provider);
> -
> -out_put_child:
> -	of_node_put(child);
> -
> -	return ret;
>   }
>   
>   static const struct uniphier_u2phy_soc_data uniphier_pro4_data[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

