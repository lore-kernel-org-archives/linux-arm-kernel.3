Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B6CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV5hlvS/EBlkq3ce8ENwrX2ys5xakCpqN1K0vJsBTFM=; b=TUQIBRRM+6n3xRUguEUj9nx1wx
	et29318Kkpt/7CebNZxDpjaW0y5A2bcypvPM6refZEPofhu9l6K0hv2a2TPRCHvGkKWSsQ+OJlmav
	yWzo2fTYaEBvJ6NJiuUzvRprXqbfq57u+G4pZh0QXjGkElK7Y1jYyzT7QHrcHkcEOlvX6tbYdqjVz
	vsLyPbvdTh2w3fZpJQAot2AMQDD4eN8DL3RmvWvRj53zllTXT3h5g38GqjHWWrVTLMdoYCGwpCJj+
	ttMI5Od3FhbE4+g+EyaD3O41uXnW3v+0vrPrN8benTWmfYnhgHIqwx7rrVRpcXTHdsfLDbweNBXMh
	7nQVQRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Zq-00000001g2b-1WFT;
	Wed, 13 May 2026 08:04:22 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Zm-00000001g1M-48zR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:04:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4751695f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778659457; x=1779264257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV5hlvS/EBlkq3ce8ENwrX2ys5xakCpqN1K0vJsBTFM=;
        b=F+tx6+r2eIRnZzLP/+ZAMxvT7yfUCQVUDIeQIErfIUr7N9PfFaAgUuXWdVcOff4Wlt
         6Je61+IwvNA3xzARTTA9kQ+oDEeeXahAE3aQKXlFk3rdPfbsfsH+SmuSshu05KZDwwwS
         hsmtyTC9uqEgPGsICxv+Kq9EKlwzN019ncrgJBy3QD7rbHoj51VRyo0N6SoYOp/04FVB
         UdlXwxexJumBvESxoIPXZlOEC5xfLwymoKaEbUlByUmAPfVvTmBt+oqnBxuu9HfQ25yX
         v5DopQT2nIXW9IkLS06ezkZE1HGpHyjdECBNRjkMs0xox+napJK7qS6SXxBgasKG+KVE
         gQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659457; x=1779264257;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV5hlvS/EBlkq3ce8ENwrX2ys5xakCpqN1K0vJsBTFM=;
        b=SbBwRsN4BdyELc32sREcekikGYUeiCd4bN2hRQMP08zZWQiifDl92wM0D1+9zNPVUs
         jRlzzHkYveUTKT8KT/5uP25G0AScm7Q3v3K2pbR5qJdb0J8Twp2pbzmfVbaw+Nio2nyt
         tivEtGsn+Iv0652Nm9wtEpqXJxuXMX0V9khAdV40XcvEYfMvlY+4MmLyo1DOH/N8K7g9
         MRE5ZJ7+pCu6gakkRZW4tyHodZHhWvG++WPiuj+5HgWqHuR0ug58sb+uGfUzEWt3w0lv
         7u7Zfnk/c9SQmg0sxv99qBwBCCMoWzrfHsxQ5grvLY2YlJVN6Gw6b1s5baRoHl0ydMWO
         rfCA==
X-Gm-Message-State: AOJu0YxWMxLOOeODLF2eVi8KpIZiagaeDnrEyeDfKUG5nAu3U2KN71/p
	tagcRK8RoIvrwuuY3KN5BV7NM0iIEeQUxZK4+YkpuXo/tvP3cTm1Y9+ENTSXP9Xebyo=
X-Gm-Gg: Acq92OHVjp0Umzopiotw3YmUV3fLhig1juIvKKBkCs7RwTV+yVjDbP1+Pe8dBwJA7RQ
	CoYTm+EDZQgxyWGGOra30tbVAQFpapXLVmpVuHqEJgFlpijXr81mBOZaqwHhiK1VCfXOe5x0CoL
	ybg0WcdHYePrnvEUwVo0ys/TP9F/ZbzoKIiCq6IBtpiXzBhvXhBhuvfzWOptkTVT1GDYmeAW4+t
	AVh9n3pdCvsmw5+/3qLSDIyF4mGfbi5CiuEUQ2LY6RQ/uSVEeZT9Se14GJT5l8A5compEoLcgMh
	baNkC7MymN0rUbmjCWLuqX4GhPjrVXD/oYSItwYU29zZT/xHEiM5O29cSZqP3ZQ1VnqM+//TJnI
	zMDNy8w9jLharv1MAdcVTmUv1prCtd89KIKcvU3uZE5pqhjuyGzecs0nofUf4Rx0DLd6ajqEqip
	3ZqOqibBu9hVG20osuQTAVGq4MrBoHUGTrY0if0bzIJg5KOQen700M2UncH0hdyoyjeAPuss4qk
	WWS
X-Received: by 2002:a5d:5887:0:b0:455:51cf:9f92 with SMTP id ffacd0b85a97d-45c46e02119mr3774439f8f.18.1778659457065;
        Wed, 13 May 2026 01:04:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm37346990f8f.29.2026.05.13.01.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:04:16 -0700 (PDT)
Message-ID: <d6f59417-67a4-4230-b3d5-0ef73ff002c6@linaro.org>
Date: Wed, 13 May 2026 10:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_010419_071404_586D7846 
X-CRM114-Status: GOOD (  16.33  )
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

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The pwm_ao_c pin node was incomplete: it was missing the group name
> suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
> into a single, ambiguous entry.
> 
> Split the node into two separate pinmux entries:
>    - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
>    - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"
> 
> Both alternate pins are not yet referenced by any peripheral node,
> so this has no functional impact on existing boards. No backport needed.
> 
> Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..62f6b9baad28b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -400,9 +400,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_c_pins: pwm-ao-c {
> +				pwm_ao_c_d_pins: pwm-ao-c-d {
>   					mux {
> -						groups = "pwm_ao_c";
> +						groups = "pwm_ao_c_d";
> +						function = "pwm_ao_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_e_pins: pwm-ao-c-e {
> +					mux {
> +						groups = "pwm_ao_c_e";
>   						function = "pwm_ao_c";
>   						bias-disable;
>   					};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll squash it on the old commit.

Thanks,
Neil

