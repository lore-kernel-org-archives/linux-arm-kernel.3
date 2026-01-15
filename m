Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8722D3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unoGdde8r2uBbMwP8uo2We6Q4bM16+cyYfsGEc7qFM8=; b=H+KYlM+rLUSq9P+sTuYrWJpfLl
	P2z9yuV7L+oDvkqvVob090bnL+/8jz5rDmy4AZxq869R+Ux/l9tMDnZQzc1/BBy5XXUGYVgo/tNoA
	9NSYfZICaeFnalZQPHHYws6p4gMi2uxjbdukDrO6UIBseqYeypq7UNBAosD3lmvKIiVbpJ1Dm60Kh
	Szc7YrYZs5M2+Rpo90h8DCrX23fcEGJ13xQYAzrBYzaT+JbuZPyKWmlr2jEYNHOwvBlMLwRHeI1ap
	wdPZmS+wQ8gS2Y7YV/pTXPQDDU262cHj4IjYJMDTky0WuVCui8EWnibARr4UnENesKa4Dz8P0FUjB
	SrBSsBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIJl-0000000Bxmj-0bpV;
	Thu, 15 Jan 2026 08:02:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIJi-0000000Bxlj-3k3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:02:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso5421895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464173; x=1769068973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unoGdde8r2uBbMwP8uo2We6Q4bM16+cyYfsGEc7qFM8=;
        b=GLpR944QQd9lJwiuF9a/D0H8v/aDIKbC1A5bJ6e5OF6gkK2S4wz4275q8HLMFtjwHj
         YXjIVPw402DbmU1kbJWptArctH4+CQ+NGMudwwDpQOdFJoimYvRRv1DCM1dzl/ybnYXD
         dB4E6uIcEQJmaLGR5VjILymN+af70kMiN+F3DCj7pBssZiVI1zp5qGdfHj6O96v7uaOE
         f9wwHNHhQDKFHhO1oJzuWJHRg9izBO5vS5Ki0qcLJ9Ejfgw1+Ip2cdO2HqfGHl2mTIWJ
         LJY1mUOhAfaHKCgrgt39/TIgnGz0pDscGFb1GLb+hq7gQKFIo1lLVyQ09Cxnar+oG16U
         LiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464173; x=1769068973;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unoGdde8r2uBbMwP8uo2We6Q4bM16+cyYfsGEc7qFM8=;
        b=CM/l+vT/aZExq553/28dkDK+TmF7DfcKuQnBOGcbwce2XV/ux1qT0ywoUFNmIzYkRM
         g65KQOa11Z64PlJ0opvCyg65gP7BuIYpdtDRVGXyC0VU0oXQeaF6ctZF/NZoSZ/I3vMu
         2Noh6Wk/NUGp7Bso1rI1B3/j4aQ/l6O+2Npp0i3iGaj5Mk51xeCAc+YY5RegyPJoHeBH
         bEwvxTAd9x1Z12Ww9PBVZsIKbnfvHyz3XkpY9aOXIIP9p8+G6TNE3ylmyKPKAkoOKACs
         RnBfjzohIpvCq1PMTt2Ikow1GTI0RJNagrQPzTchkx+n/eDvFMe8R/WjAvf9e/CSzs6u
         1gwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6kQ5aWCiEBamd0nI9yT7TQAz4B3i7cS91P8evBAVaRLA+3F/04MNJBfvcd65ykHByM2X6qQl0injtoySfQ2Sf@lists.infradead.org
X-Gm-Message-State: AOJu0YyaTH4fPvXeg33FlEq56f1bzPWgrzFfV2sWBabx71MSiAYagz54
	VlPLozzqssczZKTGuC0bxwgeU/aSsmrHxxwUc9BN/9x6LH9oDAiGSrjYQDURm3e7dDw=
X-Gm-Gg: AY/fxX5tBlN9tKgC0XkKeZX6h0gFI3/Yoc/5JLDbQEqBdpDG35V7Rsl1oxRHV1xovK9
	IcigayfYg5HzooftbCz3auMIdOgFcscMgY+8Va4ZzMNoaLBIcsvUU5O2ZQTRHkJK8c5bQxP3xS+
	0HKqZ5t0Jh6rQNvY5rLKvOeUfFgRAUae1fC57kEbzXrVTrk50eyK/4n/0B7dJcCc6ukSwxphSHE
	SboLPcbn9ahekmFVoTwLUxZZ66Qi7h1F4p9hB+zrs1cPPk32L5sWfp1tH0GQHF8jC8JqvG4myae
	3w4rdEh1Y+p/QOofRuAGS7YO0Uiy1xQPTx68dpB6PZm08pseRjG6FdXcgqC4QlXWo4sTy7LosJs
	0pVeLmA+LF9aZU9Q2GLYnQpJjQMYncVLh4RVHKV0yX5twUQsrkpXjAQitfblvy0xO57bOZzfE+O
	CSfyYsZj8auYwPWUr9pIzKhiioiKC5dQgA3tjs44SkXUjfwDKF6A7O2ETbdJLtDUU=
X-Received: by 2002:a05:600c:3555:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47ee338f01bmr68210915e9.32.1768464172816;
        Thu, 15 Jan 2026 00:02:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801bc3e57fsm10397465e9.5.2026.01.15.00.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:02:52 -0800 (PST)
Message-ID: <dea5d665-2d5c-40ce-83d2-a2622b79e4b1@linaro.org>
Date: Thu, 15 Jan 2026 09:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
To: ricardo@pardini.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
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
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000254_937521_453353C1 
X-CRM114-Status: GOOD (  11.46  )
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

On 1/14/26 23:48, Ricardo Pardini via B4 Relay wrote:
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
> 
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
> Ricardo Pardini (2):
>        arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
>        arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
> 
>   .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

