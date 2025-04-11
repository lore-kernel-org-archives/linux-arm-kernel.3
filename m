Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZSanJ7iQqFkDAT7N/R6RJIht4vmzcKXzsOruL2cJuA=; b=e/0dXUGTqR0Mc6LHptw0I96ngg
	WsrrREo36O+aPSwGSJ63FjOdVWbly7rXvFm0nrQOPBtIa4O9A+di7a2Tl0V9pAWOZcD6wSjZmu5sd
	YVudWhHSfrcjJUs2EOBi0Gwq2hD/Fb88yLpIxOsLtDJ9yVOOZgSezkfJAMZoQyKlE9jXVM/EuWu2C
	dEfD8CrSM1c5ZIFemxp5Zk6zgODaCOTxPsOqDuz9jD5P8HFrs95yRGc1LQ3kzCri5UuBLxIAP6BOm
	/uisSGWb5W/O0qE+R92oZVjmucPsGIVgGq5NKilBLK0RcBL2A8O7ydzvD9uyp9ZHVkQqqXSY5yece
	tHMPpZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39z7-0000000D4Bi-3JOO;
	Fri, 11 Apr 2025 08:43:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oo-0000000D1uh-18h4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c2688619bso1031074f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360376; x=1744965176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSanJ7iQqFkDAT7N/R6RJIht4vmzcKXzsOruL2cJuA=;
        b=a84/lzHNQZ/NNebPxSzk4X/O1KmijwsKXb8VM49/BfwNtdKTthq+rWIWjCOkRTtWS/
         DbVcRTE70Gyv1ISMv9ZCNRNIoIv4Mj1LBcfVT3pf18eH1yp8oyYI8iPgesrkW7r4boEI
         3Qj/bqgJUE+U1RcyAfaDnO68L4OxIhaBC/pBCj059soFk9r9e8kfotDCGprsheAYbonB
         cGRFrV0JtxUaxab+ooGFhmdlWZj2WLCQ9mwLSPFsMoXd8HxgC2DlBRZMsXmmzdmD5X2E
         UB2dYfRimy7mTU01tnmjzrMLqqwfxkXER/GGToBVz+nmDlvLA53yMAY3x8GT3GFC8oqL
         Prxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360376; x=1744965176;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kZSanJ7iQqFkDAT7N/R6RJIht4vmzcKXzsOruL2cJuA=;
        b=szFxNwNVvRvKiVFIbEpJMbgo8ytdeih2Mu1Xo0EoNhGhfC0ZhwkSrBO7L4Gp70KEUj
         jR3u3IU2Lm3Ytq/iebgC1iV2WfRXXYqN5a6Qxcl9BvUAu89I1mCW+OgoB7NKRCBAeSCv
         jOvuXAbszn4cyixkRjr/1NxPL5Wa8Aeha316ybqHw6YjArmwXw7uO/MkVggoOGSiOlxn
         PY9bdyxDvcQLaW3gYe2g1oFjcZvgQgcmcOHFyQ6aVyTJBfbTVx5bgI3usJLhx+ySnP/D
         8+K/kWgftKI5TA1D5UkAgexsMqwMWurlrGBv+jQX0YhYyp/9mB6iWApy+N2ipsM95ZDX
         Z/WA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMDNduLydduLuwAnOpplcOtUicB36R/r3w+O1jZx8yj7BbCiYNhFtJ+YAnDbizDnRbrix8tJrWK13T+qEXLDi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxis2XWuF0Bs7TAAgcqy4Wh81qe4eXOoZ9VwjllrJCPuZYA3ixT
	jBQvnBbZ7g+jS1T2uFbu7Ny/VaoZ0oHv8h31A9vJFMHMwwgc9dUkL4EaW5bDFW4=
X-Gm-Gg: ASbGncu5NlNOO3KJjq7tRx4odspM+q/k5kraPfZsoqXO1iv72LNEoUm3Z1kHqjdQvcC
	HY3KNSuMJ5tWj9Z5O8JlI70Fckdm/C8uIqRAenW0tubJTrTZ7bejgccSjfrf/E+E+Kefvtmffe2
	+XEs631+waeSVpwUWjQ/jMdq/2Or3NiBz1Ojhy2TiTyb4bw3XfxNefBQKAjl7g6R1UpsVVQsjZ8
	jEOBXUuwD418Q715GhoafYw+4Qo7wFkdsh1GFoGzH+4jE4a15yWW0F/QtjfLHxdUB/3LOe/0d2B
	9m/diPbUBkYQmKAcYSl0u/tEhodoERDH33xPvt592En3jHbGSeMN/PNhu5ld1Q43WRk3d3RhcVo
	l73PNTIInnLRfe/wIlA==
X-Google-Smtp-Source: AGHT+IESUznTZ2n4XVtcjPJCVmr0eQyeDF65o+HShMPgDvAAkIvnxepbxU/WEqcRhEcANAnPMJQR5Q==
X-Received: by 2002:a05:6000:2ca:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-39ea51eede3mr1406485f8f.12.1744360376608;
        Fri, 11 Apr 2025 01:32:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979835sm1328253f8f.57.2025.04.11.01.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:56 -0700 (PDT)
Message-ID: <808d2fb4-4511-448e-81e9-52319fdc8673@linaro.org>
Date: Fri, 11 Apr 2025 10:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error
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
 <20250410133332.294556-6-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-6-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013258_320456_E23BE2EE 
X-CRM114-Status: GOOD (  14.91  )
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
>   drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 60be5cdc600b3..54baf7b8930e1 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -131,19 +131,15 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	struct phy_axg_pcie_priv *priv;
>   	struct device_node *np = dev->of_node;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   
>   	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
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
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

