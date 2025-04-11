Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6458DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=; b=iUWhoFs06ztJGOtxa6cGJd8y3i
	W/wHinNAsF2X0cOPc7w7pCVaFENVj5/wuTapFTXEqUNpc15VVsA6rPmosLTVZJnb3k/otxXSet+lv
	vjf7W8uWBSTzbav7ETfOhF1fyBzlDnyNS7M91pR/qOSIbjSFM1+dGnMdMOFVIexSC6TUryxdB3vWP
	RfI2gwmhPG5Kq5Ans2gdNmCSqWab1zc6xl6mZqi4XINGAurLwXm4EstgeJrCl2IzI5VYYi2ox/Ef6
	nX3jigjU7eJc0j88wm2ifGoY+jVcI6nhkPee6tvZ6mFzwnJqb7Q/4H/Wfdpt5aDOluOJtH8XPpN1U
	vJ0HHgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39rz-0000000D2W8-3Nab;
	Fri, 11 Apr 2025 08:36:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oL-0000000D1jd-414B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso997612f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360348; x=1744965148; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=dvu2N/Z7xddjjCHXdB6XK1rIsAqkmhd+QvhxXRFSSqbR+QOPOnwvZfkYjXUBp0/JO6
         VAhMIoWhRKa8YJgG7NGOAmZ6thS2Vaz4E0dItyTZvZx0Ir48Groxd9fvZsDCvRaeG/cC
         SDK+krSvRc44/ay/Dr8XZYvjSexyTWJ13zCremxxoOsAoPduDLge4mMpSKMjJZLM5gAW
         1kGG5B3ltpYvnRML1wSf4QxSdGHok0Qf5ddcox4feXbROHjbTBFdPNGOJMumyi+mM11c
         9KOzm12Rq55AuyFqGSUQ5Z3rzBnuLJnh9URNGMG2nmbeQGtU4t7pAb0mGJJsy063mfZR
         05QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360348; x=1744965148;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cor9vuOgNiqeiEkWyD/AmeGmMw7KQ8DearW0MSdlOaU=;
        b=g2Lof6vyNYiGKFQ+XlGmmOX0hxXcY8R4z7XJeosRiQmSiQJczJjtySTfq8wwF6hXsN
         /KtiKdBlaEg4WmhLIFrPXOmXXo4PJtQBWpzOQi8DWo7FLvlmVA8X0H71II9rOUY9nn7b
         /rf0tKgf2qEqcP42MbvUgofWOhcdGI+r2SVef9yb621pmHAiKX4n0XdIUcSppO0vA2JZ
         GkzijybeT/vpKi2TgFNukU2UW+oS1w9hG0kpTz3WlXWR1CIJvpTf7h1X1K/rQQCJAlp8
         bT8d41tiiSLCcuFSEXTzZgpLRyzxNhh/Q4PKYWgOGeT6maD/kjBoEp5zhluMM641ExPf
         Ip9g==
X-Forwarded-Encrypted: i=1; AJvYcCUE02NLPfQO4lPVFB5coeGA4OYxT6DhKxXfs1zXAyhcK5uYvY8f6oEkhtJY2UdmnvoFvDrGqfPeUGpcviZI/BKb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx07+QD+FEQ5T1qGHwSNZsp8sPBF4zQw69hSXEOW5lq6glTAgBe
	n4iOCKqj1ZRmob0147AYu+O0s7ee8jet/Fm+LaDFOSf1PWZejZD0JZFu+txNfNk=
X-Gm-Gg: ASbGncuR6j5H8F8YGKWcxLTYNO/BenzHshdv/zlU2kvR1osKakNEl6QzdfrsnLhsqUI
	God9iXEhY9EhOws28aQ4JA7thWKqN/+WsxytMvACZPWzhg3iu16HS0CUJWOjMeHQJMQIuWh+Egt
	gzb1CeV5LnpaPDz0pO7HzeEnVr4ZcdZ2MycTGuirqDR4/zDgeNKra+mPpDyX5Nf2tL1q4ADFmKn
	YEqjxtR+S18JFy6cEt48PSZj22qn4knbee1gwSB6GMsrhjM51+V8V2sfrSRspYD9yeScGN5ByRX
	qCnHLfNDIkzFm+rUGrbsX3rMf2ElJVD1p97WIAfFokHJ5Xvf0/ohlpx6nVAjSAkDUy+ba/kLuAm
	5pjQVfwBE8r97RFYjUQ==
X-Google-Smtp-Source: AGHT+IFy7DI7w+bf+TzbwYeaeMvt+UTEl9M52U5ZWizMhQesvmiV7Mq5Ube+HjPUMbBTeDkCz3uXvw==
X-Received: by 2002:a5d:648e:0:b0:39c:30d8:a67 with SMTP id ffacd0b85a97d-39eaaecd91emr1259666f8f.55.1744360347745;
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm75951255e9.28.2025.04.11.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:27 -0700 (PDT)
Message-ID: <7f6910a0-c56c-4284-b928-eb7ae7fb7e92@linaro.org>
Date: Fri, 11 Apr 2025 10:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error
 handling with dev_err_probe()
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
 <20250410133332.294556-2-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013229_995209_D7FF408B 
X-CRM114-Status: GOOD (  15.03  )
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
>   drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 14ea89927ab14..6b390304f723c 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -237,7 +237,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   	struct phy_meson_gxl_usb2_priv *priv;
>   	struct phy *phy;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -266,13 +265,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->reset);
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
> -	if (IS_ERR(phy)) {
> -		ret = PTR_ERR(phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to create PHY\n");
> -
> -		return ret;
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "failed to create PHY\n");
>   
>   	phy_set_drvdata(phy, priv);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

