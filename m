Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE6CFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ApKzuM1Dy1yHlR1OnkyQgRDQp0Q55UQ4hWD1IiDoII=; b=AOQWiitJog32DmkmrhB/ozeHut
	xOFZo/Cu7jn0VLuWpQ3A3xS3atJZo6s58H2lr6FHJd9kAOg1heDUWX0rKSUH2a9gyM8TjWVE02ak7
	TQWfcWmJs66BjNpVDFCYBzvtJM2YfRrAa8NcTdTTkXF6U7U4P7m1MQX4JlITfyrR+vxVmjrMwrhfH
	X+JnWyH8XkQcVNdKIGJ6qYCed8xF+yJ4kihMGEWEFSN6xfywamisetmuwiaUdhvZmRQzTVn2X30oh
	TbqvAlDIbIl2Sg1wXMeW9z1JQ2s+1HKeBBC6C3DU2ZOHPuQg7p5nCvfOVeLB8okA2QaSl7aZt1tMC
	29XFy2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sZB-0000000CzOE-1jST;
	Mon, 04 Nov 2024 08:36:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sXU-0000000Cz6V-0ZMj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:34:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso2489620f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 00:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709258; x=1731314058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ApKzuM1Dy1yHlR1OnkyQgRDQp0Q55UQ4hWD1IiDoII=;
        b=D6w+0pRKLewg2bEVHfUuJrSR4vdG7ofZOZ0xSa0W1DD8OfIl4LrcLrc21o0PLo9wi4
         oRnejjSbln4BtSBZLtcL6B73CKzbJWgzKNfQigV9vD+80rRk2HzkpsWSMSqLLL6zhXpa
         PTooxpkHTIC4dBIoB0bu+/ngWNCLPuJYY7Ao1VvWT50FGLM9mAEOmehNj03pbisQUS/8
         /vlP/lmsOSVZ1eJ53vCeA9PRaCULYZNWCQoBhk+nPNimQqf1DPQBltKTtCrV31BxYL4I
         kMH06LxcLFs0MbOYMOhvf1eq/8WMAB2HyMbSbLMR7jhPig1hgjjT5PHL3kqmeNNP/K2k
         5AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709258; x=1731314058;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ApKzuM1Dy1yHlR1OnkyQgRDQp0Q55UQ4hWD1IiDoII=;
        b=ZSNUYXChXDEO4/HCf7jaqaR/it2RJme/F8bGM7FIcbiZzyEn//DordLq1w7E7+aKjK
         2fhk/X9lhlJw+8jUpW/cr3PNYOG30vN0eEIGSj8IVw2ydOB5AsCjuGEdNZl+9ZsV3fat
         DP3661QTAgW7ApfCghQ1dNCCsl1GpIY5kLoHLKxY5ahp1PbUyiAFSdQ5zLSkOleLapMn
         dbfyHDBJzRiuzEGAV1DMATjbODurM+l/XODqDnddnq/iYz+A2riNPuqfODq55rcdFmfV
         uo42GuWk761gnrtRnowl+ybpvnzk6GRFJn72/LNq9oesyspV+3ljNfBK2xqH0/w72dwJ
         A9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUulqTcaiKLymVlbSd1UAFzOy5RnTCbtrkv5jnJWa7p86xD4JzserGQgeYpRF5HEW9g8+uvCpMWd6nFtoYveFJb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx961BE06SPEECT7Iws7zwHRgzuzKQj7QCsfhC23VtXqM5HzCY7
	/tY80EnvO4NwzgTODfFS9OPYiXYB4qq4zDJCpzhGqNG8+/EmmI7CN0zpa1+odwg=
X-Google-Smtp-Source: AGHT+IFxmI5A9LHrUN21bEWOHNg1hm+NCdXeoy97NqjdjCzBuK2/l+VfezM4eItvxCTFN1s/k5MfCg==
X-Received: by 2002:adf:edc2:0:b0:37d:4ebe:164b with SMTP id ffacd0b85a97d-380611e1252mr20361114f8f.44.1730709257844;
        Mon, 04 Nov 2024 00:34:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b00:c640:4c96:8a97? ([2a01:e0a:982:cbb0:5b00:c640:4c96:8a97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113dd95sm12652484f8f.83.2024.11.04.00.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 00:34:17 -0800 (PST)
Message-ID: <e4bf88e3-e77f-49dd-84b8-e3fa3d8ee95e@linaro.org>
Date: Mon, 4 Nov 2024 09:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
To: Chen-Yu Tsai <wenst@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20241029095411.657616-1-wenst@chromium.org>
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
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003420_196044_538E63A8 
X-CRM114-Status: GOOD (  22.91  )
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

On 29/10/2024 10:54, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> The MT8186 Corsola devices already have the IT6505 in their device tree,
> but the whole display pipeline is actually disabled and won't be enabled
> until some remaining issues are sorted out. The other known user is
> the MT8183 Kukui / Jacuzzi family; their device trees currently do not
> have the IT6505 included.
> 
> Fix the polarity in the driver while there are no actual users.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 7502a5f81557..df7ecdf0f422 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2618,9 +2618,9 @@ static int it6505_poweron(struct it6505 *it6505)
>   	/* time interval between OVDD and SYSRSTN at least be 10ms */
>   	if (pdata->gpiod_reset) {
>   		usleep_range(10000, 20000);
> -		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> -		usleep_range(1000, 2000);
>   		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +		usleep_range(1000, 2000);
> +		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
>   		usleep_range(25000, 35000);
>   	}
>   
> @@ -2651,7 +2651,7 @@ static int it6505_poweroff(struct it6505 *it6505)
>   	disable_irq_nosync(it6505->irq);
>   
>   	if (pdata->gpiod_reset)
> -		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
>   
>   	if (pdata->pwr18) {
>   		err = regulator_disable(pdata->pwr18);
> @@ -3205,7 +3205,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
>   		return PTR_ERR(pdata->ovdd);
>   	}
>   
> -	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(pdata->gpiod_reset)) {
>   		dev_err(dev, "gpiod_reset gpio not found");
>   		return PTR_ERR(pdata->gpiod_reset);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

