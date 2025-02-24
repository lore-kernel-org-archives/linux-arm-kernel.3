Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE7EC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=; b=hwXjfQGaS9ZosPPsZ3qnknGhWz
	smFXaRtAeN68TulihUynKiZeVuZ5ynX28XDMdImWC1BGu7rmOZFtlhPJWVtzSbC423OmCZqkBvmBv
	RsopKkcab76QhXTw1ZskyzCergZd1iBdBOYpSreEPBwDC5+UMB8p3eTuZc0NHEo+UVgkg1YgaQCvj
	y7PiLw6b2BcosnYjFvF6BaMHSi37eGgYjyDgVJit5Cc59H06/NzAO4fUbWgTJu1lFUXzGXT1JuWTm
	KIvdVMsgTjOeQcN3eKmIpcRVzAuSSE8BMnCuOY99Ry2uqezpIjIqCRAi9S4K2VFe/wgTMTgcP7MgV
	dMvWrDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJN-0000000CnKi-1lBo;
	Mon, 24 Feb 2025 08:59:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTzW-0000000CjDv-15FQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso23737725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740386344; x=1740991144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
        b=lPp0hkFikX2Ve+Y2RK68AkhTc+38kwNWek0WRO9cW4mI6RzWTTo0nzE7boocRtqjdb
         YUUyeMleB8fngY804Dnso0uGSHVvvgg2J7IZOjKaQQk0/YuVUGnaGWoCYbWrrM8FYkrX
         g0ZoXhZmbEOc4uQg9yK6tCHLKXTZpOqSZ8HZXqaVxQWtBY5PmT2k6tvozI6AxZil+nlf
         +29Iby4xqJzKcgziCuXplJC5j1jhIARBbzOFuebzuPE2bWDRA9JvjI6ISux1wiaXfJmE
         39zbo4YJOhYwBAPoBms9owJCuY8NWXIX04OhVs3+Ghzkq+TxhCGWwl9M5rcboV0UXQBN
         C4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386344; x=1740991144;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
        b=w5vtYCWqJqs93akBOACwh0IX0iwXg5zUUZcEBmfkvTYIHnFj3aSd9UWc8gtBBcr4Eg
         jKxes8DnK7rycMReiYpfSy0HfNrBVcZrvVQZj6lLLr1DWt2otMahozplP82nvpNCybZF
         96PVxrFpBApNoL0pdExz0PRH6wxzF8ObAfcPs1DFSZUBAu8Nh2pDkuo5HlqxwADTLZvk
         1AoVuASn2bEkMxBZw1894n1honvAp7C/4uXtHXfl7ak3xosfo6NUnHV3aRjmV42Ta1Qr
         TEu74eOJm3XH41xLVH06dXs7KwqLD/nw4oIuAcl6ecol95S/ZsuLc2G/WKhoQxgptN5F
         o0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX35EPi3Ru4PKna5z6lHy64Ec74W5jUK0LeVEPtQRTsnPxSuz9JHlpRH1ZE13KEa1WHRR9eYGOPQO2XqvOUpFm3@lists.infradead.org
X-Gm-Message-State: AOJu0YysctTTc2xnT4RUXJU29DYx/NwEZRRYLj/EIQEnXkwtHrC62mFq
	iCQKKLZ0AjDzzZvV5e08E6pXOnaierw2dN6++Ai4cvCHOdN//91q0N4JPji3vO8=
X-Gm-Gg: ASbGncu4JW7uQBIc11F5KAv8VDn+jUimdza8+0etrbxolI8AfBRzLbEA2dNE51GJfsO
	jKqXgEOfPTOrNDh105IBsb9ZAfKBiFt3dztXuewwkMHoM36MFDM9ON8f0Js94jOrw/ZVJH0Mmdb
	So3okFuucNzCsUIR6CSiHTOqRBb+15GY8xZAgjf42CgBeyzcS5qg4H0KKOu01FWbZuFeNjzhGhZ
	VTHwr+Xapm2iJx3YFnDps3xraVQm/i4KmR/PmvEToQAu2pFLHqGKZOZekh+J+iV/wO/SIV1DPlD
	P8L5T8myw29vUN0usCadAbnJURj1QP4St+e8nEZTdsIjDEujDC184dn8weksQMjjjmAZHx7vZ0d
	HkmY=
X-Google-Smtp-Source: AGHT+IEEJX6T6GgItatrLUOO4eq1TE6WCfNa/DqbWsLOIOCWLzZKyFG0bwOQ4opt5Ug5hrQOAM7F1w==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439a2eb09f6mr130885245e9.3.1740386344324;
        Mon, 24 Feb 2025 00:39:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce4e9sm100644875e9.4.2025.02.24.00.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:39:03 -0800 (PST)
Message-ID: <92321fed-28b3-454e-b187-7ecfe4ce27ae@linaro.org>
Date: Mon, 24 Feb 2025 09:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] drm/meson: vclk: revert and re-fix vclk calculations
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
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
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003906_380206_93AB3AE7 
X-CRM114-Status: GOOD (  13.82  )
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
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 provides a proper fix after I figured out the actual root cause
> of the original problem. This time the maths checks out.
> 
> Apologies to the stable team as the original patch has been applied to
> a wide range of older and LTS kernels (as far as 5.10). Please let me
> know if combining the two patches into a single 'fix the previous fix'
> patch would be preferred?
> 
> Christian
> 
> Christian Hewitt (2):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
>    drm/meson: vclk: fix precision in vclk calculations
> 
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>   drivers/gpu/drm/meson/meson_vclk.c         |  7 ++--
>   2 files changed, 25 insertions(+), 24 deletions(-)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

