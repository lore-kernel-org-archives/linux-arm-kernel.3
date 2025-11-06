Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2BCCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM6GMXLJyNdCfp1spw3gFkLCPiBNpoRjwTrxljsiMiY=; b=Hz/uJt4mXi/x6FdtCxbXTvx0bj
	iWw+DmQyKhQ1kG87LZiJvagey1VI0akX9ruwRVKphr83Tg2lZw3d+VbaIIEWvq16cQsSa9Ala2+tf
	Hw7DJl5u0qVCZr/fVaRrUyhxhyX6udaUn22u2lK+Lz2nPqWiK1eyI9/D008dyV1MoBBeYysC7jh28
	xyO45/13Grm22PS0pq/5AWdnNY2xgtU8QBKnPg0H/92q3NvfYx+gYLH6jLNDQfl3wpJ3AOCvuSG0T
	JAcZflT9mFyOgLrBUgtcK1Q5dbuI/3IWIqTgv6GdhuNuCUhifIv8z7hzCtwFTkvoQbobeWv2ydWHa
	hPtoe+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzio-0000000FXVU-3x0j;
	Thu, 06 Nov 2025 13:08:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzim-0000000FXTf-1Kjt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:08:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42421b1514fso526622f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434490; x=1763039290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xM6GMXLJyNdCfp1spw3gFkLCPiBNpoRjwTrxljsiMiY=;
        b=e3WkBUd7JMs3Xt63AepJeKzC7kDbLMioSyA49pydBTax0/doOFxAeHkp4WFJHy5g6g
         y28E7RGQkR2DkymlDi7b6v3iiX6DtaVRqkXD0MHuR9R/qWwTqA7w7vbUleZjtjJkE4ev
         6A6QRV1v7oBgPZ7vv6i5bttgjm822T5qFXRKgUcFvZERSivXttYnSgqavdCZ27DxkQIt
         qiJN+RmveOluTW0ixYOgtuL1dek3rAYtOGy0L+hu3sJpRuFtFjmSEy1tN1y2q2dsgxnV
         nXRsTIYJmdiFAEyM3L8DQlNcz4Q2NHNsNGbGFq7xoEU4xCk8bdy1f4i/ewFtoBwtApVx
         WoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434490; x=1763039290;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xM6GMXLJyNdCfp1spw3gFkLCPiBNpoRjwTrxljsiMiY=;
        b=v3Cj9SjKVkepur2WV3HQpisZKbuknM9foiL8RtlaB4FmkbAvSa2+FO+GbXA+EdMQpj
         4VOdKXYVoIhpd9ffEl/K4W+IPbCS+mnI1+0iaM3YBOA5hUZ+u0nMWLtAgrT4x0DMj2rs
         0orf17fbWAXx0bG2BrzjwNUTCiKC5+aTZ5/YLJ6jZcNu1JIiV74/u5GAYmSS3ldKsSFt
         VRTjhFxKqvpP9N2CBJeFCKNyb6Lx9S9V0wTwgbUiix/14ylEldRBxY3+pHswXQympd79
         5CvpxSWqcu+NYoljCMLt+PdYBP2AZR81rsuObc5oNqagOu4kWr2Cj60lBh9gd2Bj3uyf
         YwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWUzVcpgZo8zZh4fw4Jn4leZkSmbA+agxroimnTXLeFbytePK3ygvY7ve+MVG9z23vRx2QcFUKgECesuda3bf4U@lists.infradead.org
X-Gm-Message-State: AOJu0YwudGj4BciOCRLS9gJ7IlWz63g3rpBAP/MClNhFmJMcSc/FfMq0
	NEV+1BTK3y1xhCDPWPozwN4bV2eHS8su/17c9AhWc1Mkcbm/zoivWQ/xJ6ZUBGlPiXw=
X-Gm-Gg: ASbGncsnAIwM+cJYQ1pSHRfnH+dptnkENgB8HSErEq34XsqvIZzcYEs2jRKh/tG6U+m
	FbBCBATKP+NH8MmsxHhQYsfub9spPQjc+gGw/RhfLv+TStNGLnc2g9yDn+fN/2OhKOYgvTV9cOW
	tenKAuBg25dU32pCMO1G3T4Ngm1d7cBoBLTRcW3Hpps2oUYFXcvD4vFJu7kqmnWuwybzG53Px6c
	O1KUGZ5ue1d4lDa9d6/13kAKEHBumxI0ZE6VhxR/i1KlE78ucZH7djaFcUGfPIERtKYb4kGqPg2
	XVvJvAxAeK1BIAr9n5BHkSroiYVpmdwNWM8nFJtXiFXMMsm6uaJSbuBT3Oi1MApqbIH04g+Er/J
	KuWShw9Fa3gYjMj9hGc3BNOPbbGa0oMRGZZ1S5K+Hsj09Fcg/eyLpDHZqA0hMZOhPUAACySfi6p
	Yczn8Rmvfs
X-Google-Smtp-Source: AGHT+IEy7P24juH5NWkGNhcb6f0zLE3X5b1IWrue/unb+8l1A51kZb+NzLO5Aj+QJDEaQfeiJrvygw==
X-Received: by 2002:a05:6000:657:b0:427:a05:2ff with SMTP id ffacd0b85a97d-429e330788amr5626816f8f.33.1762434489827;
        Thu, 06 Nov 2025 05:08:09 -0800 (PST)
Received: from [192.168.27.65] ([82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb3951c6sm5150893f8f.0.2025.11.06.05.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:08:09 -0800 (PST)
Message-ID: <efdfbca7-d1b5-4b7f-a657-af4386cf0037@linaro.org>
Date: Thu, 6 Nov 2025 14:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-4-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-4-b4d1fe4781c1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050812_499418_6918A3F0 
X-CRM114-Status: GOOD (  13.38  )
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

On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add GPIO interrupt controller device.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> index d0b63d3fc953..aef7aad95667 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> @@ -221,6 +221,16 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,s7-gpio-intc",
> +					     "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x4080 0x0 0x20>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<10 11 12 13 14 15 16 17 18 19 20 21>;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

