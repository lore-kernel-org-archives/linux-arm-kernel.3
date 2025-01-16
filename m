Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF2C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=; b=tPEGaa1PThY+8B
	E7zVt2euU4Q0QI4fvn7SdJrek/aFMMngj0BotkIFQak4IpYN2B+XBE3MT9nf7K0G4kSdsdiZjwec/
	HJGNereVt16pG7lmPtqXGica/VQI5GDJ7GFfIJD4vXOPXJqztTdnswnsZlAoclHWEk/EcNNWHmJrP
	rZz0xbT7jewsvjm4lptkyeiVrrmqbvHfIPb7hBjHXc8lwUO0pbU3Af2Qr7W/LX3kxqlgY40Q+Y+np
	IKc2ntIWS5DMGISnZMsVs9DOxfh4YvpxdNwLnXQR5nsahdfreh/B73sdMacLLTGqwG+mvGvjxzgUU
	ZIoric9Lp4thNjZCSLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRjl-0000000FJzL-28Th;
	Thu, 16 Jan 2025 15:24:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRiV-0000000FJtX-1OYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:23:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43621d27adeso6944765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737041009; x=1737645809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=K7YcNxEqd1cK5EEbf7YzbRPxPrGMC0HhPCyRYmD2SdaN9mUpEsROZh707kp1eoIcU1
         Tpqqz+QHDE6Q0CDGRE0+FixJYsZ9U9l7j8n/qLweX5jpjpCZcDYlWLgqL3yM6ahjoKgm
         LJ98YxUjGc/QtnDPynj+0pGZgS9xqzfH8S1cP8q00LxafZuUiUEPA6da/swN4SpCf9HT
         W76wkeGMmBBeW0DoMEPPUYAjSINv/GJYLzMQpKwcJ2Mw9ndluBXqQCo+q5sv7Hgd37ev
         zpPJpnAQmyxw9ZKbbsfku4hWksBKv+wOQbiTTkKaLlH6ehnJ3RrQ2yWaAEharvtVIlWP
         MXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737041009; x=1737645809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=Lf0vLlasAwQ3HxkVf1IyhrSaYdF++s8hbCn49lZV6i5uoJE+8jnOPBj4UalD7txOYP
         I3P0xNSfJ91wwR9qnGPMG+VguUg5WBExH+eaGW5egI1WqSjY7xWGW/2534l+WH58Tpkg
         8SPyvxY9Vmn75i6XvxwUICbHtYNdgiGkCcCy+2g26op5+selfkTa06dZGT6otCKa8xHe
         8Mqm6lqr8lJxDZMkuDdmvKPqOZ/4Bv/gpqkMWbuVUDL5FfDSEmXp0DnfIv/jQDdwehUY
         IsJJvTQTYKu7ibgZiY4sQeoa0AwvCsWOojMcL1UWrk7Y2RsAja8nVwXHJFPRqydeazKN
         vP+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwDqzLg5+Hq2dO8GmA7k0J2v2JZG/hE9QPK7cTn6grZ3Pn2wsxva2s1ecSVOaNW3wRbwa7Juru9U59h+A4eo+V@lists.infradead.org
X-Gm-Message-State: AOJu0YyBhMhRKuhagxAHXLofJqouPyqzJobpFGzadokbRVybH4yvhWAW
	EqllxViX434LWiqfiv9WR06cLpv49joyYKz2uZa80zHPrFqG+yDzzSQEUvNSM2Rbgj19fV6arSX
	p
X-Gm-Gg: ASbGncuCL6z4szyu6Xuh12zoTMphRcWSwzUhKoMpurfpxl50kAEt+99NF3vS360LK0G
	+TtEpftglbswzTmx9ZIhrkT9CBYCCsO8uAJhuO0wrKt1QY2L92ukuBopJQtNZOnAadQvPKNIFxr
	FfOcoKYjdgRFRseVk0/d9J/27rsASTnBz2oQWz1fHKUoFREW8Xyvx2g0Ls5ve+yoROyxjjCk8Hm
	XNK6UIl/UV31zvROjvQWNagKpxJmwGv7W7nJgDJlht8EwLzTaxk+3Af47XHoQI7h+47/OfsHYUr
	8IVNgXnK/Bq732bkQlrt7pBF81+936/nmA==
X-Google-Smtp-Source: AGHT+IH3ev2Y3m0geQ3OUPWjCKlIaWRioGBD546DlWZImq11tIxFW9OCinJY3Zz6eI2GrZ4WeAHyFw==
X-Received: by 2002:a05:6000:1564:b0:38a:8d32:274e with SMTP id ffacd0b85a97d-38a8d322b18mr26448297f8f.5.1737041009433;
        Thu, 16 Jan 2025 07:23:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm63384035e9.30.2025.01.16.07.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 07:23:28 -0800 (PST)
Message-ID: <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
Date: Thu, 16 Jan 2025 16:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
From: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
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
In-Reply-To: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_072331_369713_B80E54BD 
X-CRM114-Status: GOOD (  11.45  )
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

Hi,

On 06/01/2025 15:25, Neil Armstrong wrote:
> Hi,
> 
> Here's the final DT bindings change that will give 100% success in Amlogic
> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
> via the MMC tree.

Gentle ping, it doesn't seem you pulled this PR.

Thanks,
Neil

> 
> Thanks,
> Neil
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>    Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.14
> 
> for you to fetch changes up to 960a4140ade8f6ba44e78dc40b80bbf272027805:
> 
>    dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC (2024-12-11 09:49:49 +0100)
> 
> ----------------------------------------------------------------
> Amlogic drivers changes for v6.14:
> - Document the System Control registers found on early Meson SoC
> 
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC
> 
>   .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 


