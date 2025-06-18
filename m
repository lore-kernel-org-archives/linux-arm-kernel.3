Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD164C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=; b=anuJvjjAgmd+uJ94Ru3oR++c3/
	zUrT1RzdrOdetK5WZ2GD+UGE64uDkqP2LeAJu9YdSVTDBLz+TRI4Fbui+M3loJVHR7HoZFyU3POH/
	YLryNTMy+BspUfxt1pWaF7ix4ujuxrfLknld0omVF6Dz6Vn77YNUvhdst46Yo9Yt4c+KpddOvcFEd
	Rcb3YQn+n5NNUxOhBsakv9+EUZriGi5mCeCzpzL7CqcA6rNBQ7e1wrEky92c642is0grnNSIVUMvZ
	7pnTuQvKzKlgg45c8lxWVCgr34RNh4U6xq6sBejybARqQnCzpBKwGXHM1+N+jqCvHn2R6uNwlYjqq
	IOc8OXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRujA-0000000AbKR-40yE;
	Wed, 18 Jun 2025 15:29:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt46-0000000AL00-0hpr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:42:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso56586055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254176; x=1750858976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
        b=GkFIp5YutdvApaDAHuxBDTBVL5bsInBizEufulHja8fopqxyqpd7WqkMHJM7ZIbmKp
         3bixAAWyQLVHW0xkf8WeowTtCh9a4n456Tngz9Rx3MlGDuYEa5E8FM0NKK0HdFrxBn7S
         t2kNqoR3q8KdAge3PKJMS2+2d14YSfoyHehDpHhXdTU75wY03MrDvEz8uupjWdjuKtEl
         R2V18ikK3ds/QSXkCgdYU9WhZmECPKEiQGkTyQcB4F4WSIjO+fGMbWu5v1YyJASE/8lH
         DuacWDJSUSwCslkonOflZIjQP04tw7bsaN7unZ3GOF/L6t5i3XvoFcyR+VQNES6AOWEn
         CDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254176; x=1750858976;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
        b=foWUF8CM7zbDyGlBVCUY/FfDQ1WFLUdmwC41sNuLKn14Q+X9gOvKC/TIiuhs/RVM3f
         6Pw3GWR4Z1zxzubqLcoGnxZfthm7C2o2ATEWgFg/3KOkGflX0gCJzqEiXDOOxy+RzSri
         O5ManIv2gcw8PK/DahWW0Ji33VvV7xjLSu4d1Zir2tON/lkmcGNLz5AM+awPGgFKVcrw
         jG+XYKBmmBvW8MrpeWKHrDjsCVUhB2JgCNl1jYWQrn4EgYux78f3P3pt4wJkypmIr9j/
         e0FvnvMnP08KqDQhgVeCB4GlfwBZtRwrh4aar6kgEoejOFtj3JbHjRpIGOl9Ery6qC8P
         b4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnz6vPvOJtHz5KIGxN4N7OqPwohzz/I06rVEpMIubOo3cm3cD/Kc/h55Oodb9O97EnxgWiI9bLS7xo9nam/3s3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz1V/wnkzFlOaDMxgk13PM2HzGykKDDTM9aW1tCAIezHZCca08
	axQAaxLPGH5SLOjw7/Ksg4DXVHcWewXqs6Yqu1aTDPk993ZmBLtcsHoPiD2omtVH/wg=
X-Gm-Gg: ASbGncuK3Ymy4aVBGwxya78BV2dY1lZESTLJEaeA/C4R36xeJ8DCwYkWTzVZQi1cr0D
	2NXSlsm34TZlPwnUXz60+lzRh7zM5n0Tis9tsVzlIppt9tiPsF5vqA1lvABjgweFU5/7AXZsN2U
	CbN3qcegn7UxxS1QOdIueFwKDqXI7Cz36vY6SeDI7bgslX6Rqg0cUUisMFV1cGffZH76PioH3ri
	Ry7+lMzfJko/rz3jJbV9XV/2kQUSJ0X1oJICflE4tlYr827pqQEqPWUUT+bbDO8SGdFYsDpwbiA
	qalnOloSbTSNeUSlol4j5de69PnoC8p6PiGl9oWoHhZDmbdSSGJQNHsXEtzcjEAPPYhy720tqdE
	zR0xtmz22chW/WbIHLzwKq3gPT3c9mO/vGgIm
X-Google-Smtp-Source: AGHT+IFYjXSzI2dMaGAAgqsOrkzwB1KxP63uuJ7AOWNd44e2f4HlRrKeC45xFQOdkM6Iz1JDQ6qBiA==
X-Received: by 2002:a05:600c:4e02:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-4533caaeb57mr147595075e9.21.1750254175671;
        Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf? ([2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm17087804f8f.68.2025.06.18.06.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Message-ID: <87908c15-5527-46ca-8fef-481a6f3d67c8@linaro.org>
Date: Wed, 18 Jun 2025 15:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/12] drm/panel: panel-samsung-s6e88a0-ams427ap24:
 Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-4-tzimmermann@suse.de>
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
In-Reply-To: <20250618122436.379013-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_064258_232950_CC5DC591 
X-CRM114-Status: GOOD (  10.89  )
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

On 18/06/2025 14:16, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_bool(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index e91f50662997..b6d04f8ad561 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -8,6 +8,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

