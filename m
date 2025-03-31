Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E369C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=; b=4aLkNXNJeB7NEAmrvR4IXOS5qd
	brgToB4tzv+cXGP0SknzqqGWCzDOifvBsqszicHxtZpVOnmsEOE+ZuDvmcluKDQ4f+zGDimKWZsDF
	FyVJnCd8N0LzIybE/0XRb+sd+36RB0Hx4K0/eyg4qVEw1y+FctgY8X8/St4RJ8xhoM96vcN+bPop1
	jZ6vNytZioLohwf4xOc8ay3lS94RLUgb4ReykDMmCNLoaRy/dKk/OUDsAdsLtWxWAMtH4Y5E5LqHK
	NC7VBu4DX9H8rEIo16spAqqV2HnjL0J5N2jol4NGYetnA0lKGMMvFCS+kcWj/zD287DqTV0wPUg1p
	IH4AaYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8rB-0000000H7gV-3HyV;
	Mon, 31 Mar 2025 06:42:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8pT-0000000H7J8-3dR3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 06:41:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so35605385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403262; x=1744008062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=IyvzEsk9WoiZuVlP7wJWZpKPjqJ7REIDV6+nxkip4jtzAA7+XIebf7EXLSUtnIBtpj
         nVl6j7qLd5upTBEzeLSIv7QLJZuixeFudIxZPXIWulzaRv/XsaI31KVAc0iODPAJW6gH
         EUiMpwqdzsJhIe4Uit9b0/Gta1L07fwy8+WPjKkI0Yti77Wg7XGYCCTAXjbLUxZpeheG
         JUuTHZZ2JY17TBmwIrwGAI8et2KUwT4QXrm8HR5fyYaQhvATCDG2iQdyyY5IILommcV2
         6tFJRjs7JKw0Mo9uqFhEZJkJKKaX3/Py7fZy685IsPNIiIbKKdaEpXiOrhqinA1ddTcn
         pGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403262; x=1744008062;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=n/5igyJvIJan1RB12EWKJln1pNVGfQOCrH55KebS0zGI+Qi9opcsTFC2iaq11oCHvK
         /rmdcX0xud4HFzcPnGAmraZQ1Y2H8vM3Hu3saSlSuoe5u1l98Kz4TbW6RUbX+ld+tb3S
         5o2icp+sL2nDfJ/5H6ibYFLqmlt8Pn0YykHivr90D7oBw5Q931g5nb+nwUIzT8ouaf8U
         84StgU5iJ0moUka9ZPmYSu+jwhkUcinCG6AZ1/913opLrPP0bq+0BVvd+ZLYyeKpTm6l
         QmnOqy3ulhjXBpXvdGOlCbNzT3XSHyC4uTxzIhI3xzxUYJThKuLiaitr0I/Gr+mPBEml
         l3vg==
X-Forwarded-Encrypted: i=1; AJvYcCXlPIO8FgthyvPCA2US83OKC2vnvM/KdB0npQrQTQ63Mj1oTpJz1PnfmA9g65e/Q5K5vAltuNp/ze6Z226Wh9sI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr4K97EPPLy2FiLGVPIUcSHeWsnGp0SqZ99JQYYTJW5cT6EVdw
	zyXgjKlfTX4Hyap0MfME99LhAE7B9x3mgx3pPme0xoWGsjKxjp0fDf0fB3Wwyvk=
X-Gm-Gg: ASbGncvasVGfKh2fa3w+f4EUj0J6OX63+Rfk+hp67uqOyEr3ux9ItgjHtfO1FkqLIlM
	FHvGQd23pen6MlB24/iYeA7C5a/HPLkr5kAQJsRxW0N0wDnXH7t22FUQ4Oe5dW+BgHr1UYvs/1I
	70HjBdDW7eyMyI54mfNyjuiE4AmUHH0Ow69Ylt4Hvtm6IDl2jtwmrrIyNkW5aZM2+Hu/uBKE+0u
	bSDEXXu0yLHcltp2wDT5lbFMDrhIG4qSLXaDYf+E3hiQRAEhWF0j96jvD9fFQJO2Rl8jOi960ub
	EEc406f1W+UwxOQHa2QmDTfh2ksxFNAtJqduB1Fu4mCxmV5atj/35Crnc5klJezQh2St6C4xTHs
	2r9KQeevwg3fjs7M4
X-Google-Smtp-Source: AGHT+IH5cRzNfuzcbg+vhCUwchxeuNmDNhE01WF7XDQIelmYWUn5sRs+QoiQmqXdq3AIDEZNp4hpcg==
X-Received: by 2002:a05:600c:5494:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43db6252fa8mr75261725e9.18.1743403261690;
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede5csm159075245e9.8.2025.03.30.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Message-ID: <769e7524-c1fc-4364-a6e8-e0d0315f9514@linaro.org>
Date: Mon, 31 Mar 2025 08:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linus.walleij@linaro.org
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_234103_922676_F305EE6B 
X-CRM114-Status: GOOD (  16.84  )
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

On 29/03/2025 20:01, Martin Blumenstingl wrote:
> The public datasheets of the following Amlogic SoCs describe a typical
> resistor value for the built-in pull up/down resistor:
> - Meson8/8b/8m2: not documented
> - GXBB (S905): 60 kOhm
> - GXL (S905X): 60 kOhm
> - GXM (S912): 60 kOhm
> - G12B (S922X): 60 kOhm
> - SM1 (S905D3): 60 kOhm
> 
> The public G12B and SM1 datasheets additionally state min and max
> values:
> - min value: 50 kOhm for both, pull-up and pull-down
> - max value for the pull-up: 70 kOhm
> - max value for the pull-down: 130 kOhm
> 
> Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
> debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
> 60 kOhm is closer to the actual value than 1 Ohm.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..e5a32a0532ee 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
>   	case PIN_CONFIG_BIAS_PULL_DOWN:
>   	case PIN_CONFIG_BIAS_PULL_UP:
>   		if (meson_pinconf_get_pull(pc, pin) == param)
> -			arg = 1;
> +			arg = 60000;
>   		else
>   			return -EINVAL;
>   		break;

Nice finding !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

