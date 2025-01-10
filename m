Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F188E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOUzYhTzRbU2PZyaCr9aEEOmHEzU4GQv9eiFuMaGvrQ=; b=R6nLFhiPuv5zpHAM4W8qcDspAr
	Tf/fMSvFzrBufgORAgfJpb3OX9j2yWMbPEacdefAAENwxQDa8YB7VMWSKwQo+NH+3h8c5bCYLgDpK
	LNzrOJM3mxqsqv/GUp6OuEE7kj2qYtYdiGwV83YiA+3CrVDVxcmH3tBrFNRZS19WsWjyNQSzda5Ne
	cf2cKUGxChQ0ILT8IgHGRVBBYFbX1hlhG0GBnXGHNcX8f+UswRbFmpArevna7hdycy/nSmqe2AX7p
	Igk/fFJiP4NrfMyG1UqLnN8UDzhv03Sx/kEgIOViYwldzmswxn5HTYX/q0lb7KDoTTNucSpviuFtV
	SD0ryLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCG1-0000000Ex9v-05tC;
	Fri, 10 Jan 2025 10:28:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWC0n-0000000Eu2E-1MXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:13:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43624b2d453so19707515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736503984; x=1737108784; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOUzYhTzRbU2PZyaCr9aEEOmHEzU4GQv9eiFuMaGvrQ=;
        b=okIVrXFhcKomZ6Z5ynA6K/a1tdWHl100M6AT83VTZ2ISYzTVRG+1HHMOjEjwCYsZIA
         anhv96WYGnfG9JRByotEvWMMor1o3jM0Zgt7w9cOd3PNI3RyzFli8/bC0pe/jtrUbN1b
         z7UK6/7UvCbWepLmB3zht3pmFKDwDZ9JFpFk2Z8YdJo/7ZRtJeCZmqJtYHQ+rfQR7VxG
         teyqhJdOK7yS70U7NMafAQwRe3uRNYgl81cyySDcKu8KltfyH9HPUo1Eo7oILOK0JLkm
         w0Gaxtbh7cp5o6WIv6UuI+k7WSVPP3V2u1zg+KMeBChx/jV9Y4CgJiECW4jERcdNuqJM
         zumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503984; x=1737108784;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QOUzYhTzRbU2PZyaCr9aEEOmHEzU4GQv9eiFuMaGvrQ=;
        b=dq4MqCXSqH80GdrrcQbBK6i5ZZgTcyK2UpvSZVoYMuHjnd2pU4O0fYZOaKOKjC0m2L
         DxaCazgAGMgSwAq82tP+AyCf/zF8FbjOGOWIrHgZ+UTlCADuEE5uk101tE8jJGanbR31
         ThTkm9R2GXANRhN7R1yiE8vZCnJJzuPC2ZUdLBRLihL0DIBvDNvdoDd0SAE2mQpsnzc6
         3thmK6nFR/hNElOao5MQ+g6c7YH9DKKqJlFUihltkON2XgbMUcE2+xFBHj7ZKa7xoo8B
         qi1QyO1VBCehVsh4WXemgU3Mr9FnWTEuY1bLKMyT5xpPn2JXw/gzFVjoPLpRtxkUaUBx
         YUvw==
X-Forwarded-Encrypted: i=1; AJvYcCWER3G2fGI0GGuuPKkpruKW6yjoxRRo1lwKWdRm86sXuX9qjLiXt5ptC6DP2XRdbMvAwgswM1L/xHAOAbhQ1pGg@lists.infradead.org
X-Gm-Message-State: AOJu0YzCbYk84Nh5F6gojkwkoPRr9xClsUVD57z+rrGoq9ZpMS1iqPF4
	043paQX2eYcuwNWcASGTpDdFmv0hjVhepShZ5K4izUncwSp7v1dAXxB1RZDkTQU=
X-Gm-Gg: ASbGnctqx1T5/rwbJ3YrbRdbAI7prDovcLdGPbdjvuYwJMpZ62tiYVPxO74buSJmlXh
	uXagrpyiAmvJVZJj3wWklHYW6sY823hAKBC5b3elaJJJPsd6ilL1rnCqhTdQtUzVS7wh7UhmcCz
	s75F3Hisni4sYEg+lXCY28VnYaBUEa2PuO4sISEKEFF/bOvs9kK65pliR7IbNveTtILt/Ez/mZl
	Po+9eetzTdvLfd0frVBeMx/UcxtRBgk49Z7U0iFsrbOItzudhkIEZ1JTbmOj0Qc7/ei4iEGKvbP
	nC14zNa7wnmyUzm0e+F4PkG4cOZ4JKxsrg==
X-Google-Smtp-Source: AGHT+IH14VgpNAHxLDfw+eb1nzA4fydxlf+fdVrPXOSjYG/N+CGyBX4YnPcgAjL/ozrdB+dQhWcohA==
X-Received: by 2002:a05:600c:46d2:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-436e2679db4mr91257665e9.3.1736503983816;
        Fri, 10 Jan 2025 02:13:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc895esm47221015e9.13.2025.01.10.02.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:13:03 -0800 (PST)
Message-ID: <bca7f65c-cdb8-48be-a800-2c36aeeeb8e3@linaro.org>
Date: Fri, 10 Jan 2025 11:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] Revert "drm/meson: vclk: fix calculation of 59.94
 fractional rates"
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-2-christianshewitt@gmail.com>
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
In-Reply-To: <20250110074458.3624094-2-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_021305_370649_602292D2 
X-CRM114-Status: GOOD (  17.46  )
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

On 10/01/2025 08:44, Christian Hewitt wrote:
> This reverts commit bfbc68e4d8695497f858a45a142665e22a512ea3.
> 
> The patch does permit the offending YUV420 @ 59.94 phy_freq and
> vclk_freq mode to match in calculations. It also results in all
> fractional rates being unavailable for use. This was unintended
> and requires the patch to be reverted.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a942dc6a6dc..2a82119eb58e 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
>   				 FREQ_1000_1001(params[i].pixel_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
>   				 i, params[i].phy_freq,
> -				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
> +				 FREQ_1000_1001(params[i].phy_freq/10)*10);
>   		/* Match strict frequency */
>   		if (phy_freq == params[i].phy_freq &&
>   		    vclk_freq == params[i].vclk_freq)
>   			return MODE_OK;
>   		/* Match 1000/1001 variant */
> -		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
> +		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
>   		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
>   			return MODE_OK;
>   	}
> @@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
>   		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
> +		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
>   		    (vclk_freq == params[freq].vclk_freq ||
>   		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
>   			if (vclk_freq != params[freq].vclk_freq)

I wonder if a Fixes is also required here

