Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B33E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1kqCd+U8O7FZobcyVAsZc911odO1oOazzFt9bw8n9M=; b=QMGT7zJAtsSr/bmrthQtuIr0On
	e7n7IgtujDUic9kMzAJqRlOk+pKPkACfHzIW5YLQl69N1CUjbn6zP2J6RRUK+pLL8K/U7X53nCA+7
	uMPshQ9nlk9pB8gCzgHdQ1bjUge1xBYkor1+WcDWjSbwPXQYzIgBIHcdxymrd4RCHEuPnkzf+1P6T
	AvPMS6gzdpWgx8Ivp2qsA5BKckACaBvdHvoKEiy3IpecMWc5c1f+dFN/C5TU2Tjy2r5CeES3a80/G
	fgRCbZfzUqtFxQ/h66CYS35T4GtMRlNHTIrmzj/iHsFsWOJ2whaHKRSiUxJQ94h4GMODZJ+5zkCjl
	4hnpbVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZGN-000000070sA-3rGM;
	Tue, 31 Dec 2024 10:14:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZFB-000000070hf-0UzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 10:12:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso99082815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735639975; x=1736244775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1kqCd+U8O7FZobcyVAsZc911odO1oOazzFt9bw8n9M=;
        b=gwGqvpmO2+cqRUgpZaiA5wdzFF/Y266bO15zMlDl6mf9A7qjaaUsJZZoyDRaExaSdJ
         yNp9QOnCOtn+/KKKRj6xE4yT1o472BfNcesaI+o0W/hc3vkUTMSTqiBlPkOZoZ6K1O4I
         91XtoVrFTPRHrXofyM5VJwba4Z7FJ6AyBCtDgeWIQ0e5mm8hc/+Xj5hzdJVYaURX2MNW
         fmMcaEBmh6ZVfzUFCUwrQ8kqOdiBG62fgKPtdP6Q1zg5omW7kS4WKv9RP3x137WSvZ1t
         tQO1ZP1nMUvGx2GSmtPlnhU13aq25S1iTtWHlJg9HYzfySglmIsl62F2ow+iWULYnn2h
         g4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735639975; x=1736244775;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F1kqCd+U8O7FZobcyVAsZc911odO1oOazzFt9bw8n9M=;
        b=SBwTnXROIyLur3bpPOR0PvmqByR4TjKIFfBFw7+zJtG0/Um2qkS9sthxLoZnUPEsWp
         9VDKmR4RBwleoKHGpqegf9ZbNlcXjAwB7SPSzIjAMm7PJXPN18b3nxcE88lLdeMjZ/4+
         MfExMWxuqU00eirpvPYrutmT5SmVCEpbGsFfpTEQGNJSQZ5PwUmbCCG7YYTXHRi0pD6e
         mH4eIG6Sym3RQS9qnPIiSw4fcinr4cCDnHiYx6KnutWDY/Oy82aLsy8VHcaBB/B9cMv/
         wbtNolEDwjzb21oWqwr72QF5OM863df6/ba7U/frbcTUSHeM9QRKix1rZHBbt/G8JR7M
         9GbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+c/JYQIc5vVjBxaHUqvKRD+ASUwaUFKY+RA+cHhfoGwAH4yaxpJ18K0Eg4XGURHvwKB6ESOtG4FqqXCulagDF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7WrmYoq2wMZ2AxYCaNeDuKG6WClwzVp31lEEoBqC3aN0hCton
	E6tgWn920SxgV2eOruL45vOJplttRahCnmPybPpeStgh+MXSZYSna1xuQRJrqwo=
X-Gm-Gg: ASbGncvXAnCqLxBwkOFkLAQa8mGzyOWrr3Y4wUP5Ybid6DbG58W+pf2u0NyfIAu1RXX
	T3fP1uRgNK0bBU588m46nASy34vDZeHns02OaLpr33qLiTPN5/rSo/cF870wVZu0OfacDw5uXLx
	oXxQgRcBIA+oBNqB3rFlnQxmA1nF3shKfZbw1GRwxlCeMeAdSgyck27VhZgZjjSp1GEm+4Fi4P/
	5HnpAg7OA4ifGKm0NG6sVFn9OnGkp6kidVAzda52tQ4lX3wfw5Xpks5PKHTb+u1WXqnGaX9uAJg
	cT5Yz4WSYhry3XcYRHoOKmd8dVh2F+pHiw==
X-Google-Smtp-Source: AGHT+IGd53Zxzjp2bgS+D1r+/sNWR+RFe9S0YpTXfDkIIyIAO1+91kp3N020/L79EMyd524dX+kKlw==
X-Received: by 2002:a05:600c:1c1a:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-4366854725cmr322428325e9.5.1735639974867;
        Tue, 31 Dec 2024 02:12:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:add3:e25d:7204:9ee5? ([2a01:e0a:982:cbb0:add3:e25d:7204:9ee5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a376846sm398175215e9.0.2024.12.31.02.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 02:12:54 -0800 (PST)
Message-ID: <20799581-dab2-4cab-acb5-f0b9022e3089@linaro.org>
Date: Tue, 31 Dec 2024 11:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
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
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_021257_179518_5E60EDE3 
X-CRM114-Status: GOOD (  13.43  )
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

On 31/12/2024 07:25, Jian Hu wrote:
> Fix a typo in MODULE_DESCRIPTION for a1 PLL driver, S4 should be A1.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/clk/meson/a1-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 8e5a42d1afbb..d71109b9bbca 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -356,7 +356,7 @@ static struct platform_driver a1_pll_clkc_driver = {
>   };
>   module_platform_driver(a1_pll_clkc_driver);
>   
> -MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
> +MODULE_DESCRIPTION("Amlogic A1 PLL Clock Controller driver");
>   MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>   MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>   MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

