Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD976D58090
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=; b=VCgciRllFcKct5gC3ySo144Cts
	e3jY9z1LlUPc3v6a2OO/lOuDPTiCEQ5etAxLzK1TeiRZzCc3JgrcRMsJPA/+vDRyH60Y2xxIgGWks
	mMnRlD5o0udnW3BvpipcaAxj48kUcWvNNggUi0qYHvmebV9h6t1N6/gtTYqrPccYS8CxR1FlM5FPu
	08HUmpMnikfFh4UAieqYWNG+o1ZsFbI90RLrsZrOX7mj2JSsmMCuJVNlxuAgxumSGaJ46EG1xsa68
	aJo8rSXvgUmFinw7CaDVAZkS5tb8fk7+hDE50hcoOwuU6WiLJS9sI+cHy6xqqTPB1fEjpviecV/Yf
	rc8Z5tzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYg4-000000083T4-0Fvz;
	Mon, 25 Nov 2024 12:58:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYf5-000000083I9-314e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 12:57:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431616c23b5so24678075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732539474; x=1733144274; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
        b=WDJpKV5oY3ysDQHA8sAQsr1Xrw0k2+ZVODbUNNuNcuG+W1iQgvKXTsbMmrJDtNijUw
         Twf3xq5Jj+xFR9CrFMf6EJ5mA6IHPcZLwGOuxCsW0FPdHw9WDoe0zRoH8AtUoTSs+mId
         bp8NxNbNaPRT1q/taPdk3Lu41hQYcITVO6TlmhNrBqClX3F/tKvbcPTvxGK10xnDEzvF
         feQ/yU/zyMBSmV79vxzV5JD6NFNPOH2ENLV9ycONUdJP75CSBiGOWx+emqXET62wtxT5
         kyRXx7uckS1+bEGNGMGbawmKgzV3PvQrPf0f5P5YtubT9k4pOvpxie/DMJtuWJ5P+0yv
         QHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732539474; x=1733144274;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
        b=NySPkb0Vh9jsiiatc65d/ynKSZkZ7r++ME7rKFE0HR1d0UZ5CYl4qfdU8TOwSIoI39
         5sslnlOFj/6qZwe2yCh1BO/Mu0agGzZ189S38YebKeyWUa87EMF20MkjquPxq98HIo31
         o8hTr1RssGT1OaF4YCNHpJtrT+A7mJhNM0l4KUyFRguo/Dwaar/gXdIc4xEeN+ZwUnyY
         HtES/amURloRdChGVpqyaH9VHRVxQL4PsrDAnAPWuOVwPccOJ/CuOXt5nYZ3wLpB6t9B
         dUEN/LZkHlB/5BVm0LxiJ5XwPTc7sNxz/hynsdkB4saeH0dL84aHVnM/WDYqx6mtAcAa
         CEuA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4Ptz4coFsLq3z+kH2OirEoIsUAvoROW/CGLGsKjJJoklm002hnERdGfkMnwcBuxGawCzqkYmw8SYeTMDnPfK@lists.infradead.org
X-Gm-Message-State: AOJu0YzJjQt+pzy0k+6srOdM1L/TRLuWbYTGHQsbLLEicfAaazxS2FnM
	iCjz6UhQ2MJFvrqhI6++BTuJFQ5T6cI6iOwmXt84eIEQQ0Tw+YEFDmbpEw1m53hH5uoU69DHfW8
	c
X-Gm-Gg: ASbGncvc02wySSX9Sar5KaEPVBXo7KMiBHyycZ15zTODZH8/jmUUkPBQ2SiLCpWQzex
	5lPSjhbjWTybvvWZO2aNubyDZyls6AvjpM6G3Y4Y5R/lQiRFrfZnD+ihGHkxgxYA/bCZzBHx7M0
	PCrL4tlgN8IO7g51RPKHED6QNGajHHh+IDorroZAqnGYDveLYCV2Y7CUN5Z2DuyTCQXVqIG08fc
	ElVuNZ+JYqPt9WOb+5wlqX1R0cWrCgiwk5Xq5GYm8UI8u8HKsA0cCRU218ux181qkmPUBsHuVi9
	CIPr5RXPSmnmxsTC+vNT3FoNk58=
X-Google-Smtp-Source: AGHT+IHp9ZbYEEuOqvzmzN9bYFgBoyUQCliRxucIR2i6oG6nzBgRHtwS7cuLaCKRHjn/8s+t8OKggQ==
X-Received: by 2002:a05:600c:1e1e:b0:42c:b603:422 with SMTP id 5b1f17b1804b1-433cdb0b504mr101998665e9.8.1732539473751;
        Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349dc19fd3sm52076065e9.39.2024.11.25.04.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Message-ID: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
Date: Mon, 25 Nov 2024 13:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_045755_772211_B8DF7CE8 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On 25/11/2024 12:24, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> So this controller only supports a single mode ???????
>>
> Most likely. On all devices it is connected to a single built-in display.
> 
> Ack on all other changes, will be fixed for v2.

OK, so instead make the panel driver return this single mode
and from the display driver just filter out anything that's
not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Neil

