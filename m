Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA0C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=; b=uvsqn6ar0eqXfv7tBqWsh2dL+2
	94tXyyvI5XqCgleDgtAk7O0+vkulY12R3ENmg+Z/KHnxywtwQkRE8wytK4AxG/bBn2m1w0TC/mgEf
	c0UjzYUGLgi6yTH1kpCXqYHWT7nOXwBinmPTQZEv2+vUewBL6coIVdkY7Fe49cFwl9xD2JTQyahkd
	zmLCOLPqPbTgMwKHfbiZZ4oUq6L7XRR8SwC0zEnnQPLj9Dr+EZ8lplXxwRIZHnLK3nLM0N6C7r7pv
	qmygzCiHG2joxMmRTpBZMSNttFSdh3XlGlo0hbWY2Jpb4YYvTB/QcogihdOWprnVmlpW+9QG/GXLb
	L7pk2CBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39tm-0000000D309-1GOC;
	Fri, 11 Apr 2025 08:38:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oU-0000000D1mV-3jAF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso872132f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360357; x=1744965157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=AriW8d9O4tskH4Kql0+w9eiQB4OnCnQvr1Bn7kPatpH3ZPpBen4EkoyrKp3GwgiHlN
         gjeVGLQhkEMEqA5ZxZvavVYD4F8Fv6NEUiCBh9PRFkwrNOFPdnT6JhA2jGqH4QGe4ggZ
         HtVPhhsvorxsmBfJAaH+IhXUKNdZLNrgbTK7AWxS8XU+DwnLjUAwYIl4iyQgFsWVMAYO
         QI8d0X2Zm5oPH8N8iI0nhEqiu8WE6ks4+DMPTrgrlXikndX01aeVc8leKfeklvr55N00
         AULqpu2/7eZZ5LVX71po3SWUAcqFxFvO+ph0IFUHWKA/9b6u0K8u52JC91bKPjkBiZob
         wFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360357; x=1744965157;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brrIALYiBuF5hUqqwAX59qJ0It68q/K98v39wCoeQ1U=;
        b=AtgJ1TOaM6DUi4VOaoqnmZ4Y8RTpc9Z/tyttjj+0atHAwLOSpCcTiDeiXtJq1GGP2e
         SgDj+QCAQzT55XX5gFjmz91eNB8e2POW6Bizcl/AcezU4WsvJyf8KbCDSlKL3z4CyIL/
         Msa9dt4FMSYhyPtc2zFOx1cBcwaJQKaajmufvRiT9EhEuMNJH0MNPH3OLkliz3ljyk0B
         LZx1TlDB3uY+8ZTzy8tZb35li4csorNJnJR9deqBn2qVN0c9h5DwQLBbEVZntMiEVWjt
         AjJP/MDX5C/iNYDSXxgsNFSJuggR4C1ZCc1LAMsDXGQ6PgQBu3RJw/mSNBhJhpNjLFJm
         UVnA==
X-Forwarded-Encrypted: i=1; AJvYcCWtfHtQlg1jFWBgSW3lCPFHOgEx/N7SYZ/kIJ7SMoqhyMQ/BVaa2ESEkr1+YQGHgE6fgZtKkNUT5/1ayJKCMlXc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcfwe6SwzAzLcZgIFqEuX6OHWH8NnQ1sLNvol67E5IShguKOrH
	Nzjli4DALsRCobwt/hjFVz3iMb6EvFohYExhGS2req/dduxaJvh7iigdhoPrFHM=
X-Gm-Gg: ASbGncvACc/J2/98mLDnbyadocqR+KVfVN0f7HROGNMRvWxLanEUV0j/CpXTi7ivct0
	Strz8u816vc6P7DemnaNzVbx5ZcLMIaOB6rlmZah0l0+jDVNc6/nv97k1wRhSkUthcylYH389Iu
	DGAif598F7sl7ybNEDZEtG19efKWL3bUPIgg6qSzQDEwlEQFaT1onnUBmjEEb3ub+er2lEv7lJd
	ZqzGlPl5eNUMhUsrt9SxYKBLWLZeuPTeUJ2Bj696Czx+a8s8v9h+cc3fbmghma3RufjXtU1QTMJ
	2b6zCsFbShxiVGChORdEhi9ImjMTzJhk6aAUS7BYIfjdM7QhC8lmg7WgUquEC9zh7mRrUP5jy8g
	pcezXulWj7Tm3Wz59rA==
X-Google-Smtp-Source: AGHT+IFUbDwr+dUTvC67ZJxa+UMe9UcTiY3kMIzVR47Og8ohlxwGVWTRBoL9btY+9GZISqqXHtjb3w==
X-Received: by 2002:a05:6000:1a8a:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39eaaec7b91mr1244633f8f.42.1744360357266;
        Fri, 11 Apr 2025 01:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm78489115e9.39.2025.04.11.01.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:36 -0700 (PDT)
Message-ID: <3d64a7ba-3bf1-4fa7-a1f1-b6fb2bfecfa7@linaro.org>
Date: Fri, 11 Apr 2025 10:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error
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
 <20250410133332.294556-3-linux.amoon@gmail.com>
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
In-Reply-To: <20250410133332.294556-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013238_948217_16050591 
X-CRM114-Status: GOOD (  14.27  )
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
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 0e0b5c00b676f..66bf0b7ef8ed3 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -339,13 +339,9 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
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
>   	phy_set_bus_width(phy, 8);
>   	phy_set_drvdata(phy, priv);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

