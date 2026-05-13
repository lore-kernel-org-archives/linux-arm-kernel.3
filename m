Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013BBCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAlKYHkO3xfLK4ijlvnpDwU+hwyw+vWg0NuomY0f+2s=; b=D8kb08h5xqcR7DfUifKghlKgSe
	0fMNBMQQCgWnRVg8VnBb/0+VWQF2n209e612LWTCHZpQ/4EMQWts/Vi4bN1V+o+nLAAVFgILBikcJ
	ydIYTWb0uAZZuRL1klSNj8gZDBlOqrZrq+b8bC8hZEghm8em4RIIg/XHedBPe9P/mX3v68vCQIIBp
	AW1NI2TsyhSFaD3h8mWjYtpQf7r/YBsfrW+HNwwMhVv22PjGMR2NA+mnaSgNk73tyryWLeDyEz0N0
	Wdj0XDS4/7ASIITOSl//JOfziepeBApduo1jVLnWTsC5fjzRHk8KlNWNvB+X79J/mws+ZDS+JAyc1
	+2fewI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8oP-00000002VAV-0zER;
	Wed, 13 May 2026 12:35:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8oI-00000002V7z-45O2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:35:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43eb05b1875so4021291f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675733; x=1779280533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAlKYHkO3xfLK4ijlvnpDwU+hwyw+vWg0NuomY0f+2s=;
        b=BwWMszT6GHSFjUf2Kg3zDbxS/YjSQ7LhVuIwO6Y0yjEFa9ejzvA2egEgy5lmR4+FCP
         OPn/E2Gw7PjoO1MZvKe3JHGr00YLCAcdO6JV5wVli+Q1VdEnXcRh4lBNGbWjv2s4HDwH
         HRlhQqd575kEgAVIGslnSFTNIOTne3qxb5FDsCOlEbs9QiJAMGBtb4hVG9N9eORKxcAu
         8vk+8vmjKyDdFUf/huc77ARjGqdBFU8N4eNxOSRTMSWeRGPPfzgIQu6BOs6vhmePx7OL
         VG6Ic/hVuWrwbAsQ8f75KBlEGFTtrGFcYKspg+M8avBnWq6xiU6573+pGYQ/CU4p4bq8
         OEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675733; x=1779280533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAlKYHkO3xfLK4ijlvnpDwU+hwyw+vWg0NuomY0f+2s=;
        b=Gg893e7KjKbcNO3IFJcPXXh1qU7ms3oKoOK5ZC65OIu4qKcofhQhrj4m3is3sdfKWH
         1FW4RSf/mPUCQP7gaZ2rzR42I3lua/W8KKcE/iBLYg9lAlyFmSLn1KpSjV46FboQOvtZ
         ofPFwSW8OWc/Z+Vfg0fvFuRdoLa2Rt2dYq6bjaxQ+DbFmXYST1ryDHWDcyTvZhqex+rL
         lZSEdlT9FQatFZrGO73hwp6acqmiyi0gTUte12G3Sevn4hv264qQXXXal8kR9sojp6Ie
         F0rOXqWDlzTt+/yO6QQTGwXQhmhZAB+kMkNXLn2ctXoeG2KpYFssoO4f2solELrrYfBE
         bJJQ==
X-Gm-Message-State: AOJu0YxNIKS3089nJcxkg0kRsfB2wA7+eZrAmrkJ62ouXm1brd7+np4E
	fZzlWXwq8+YMOVhjCAh7yw8y+M15eHFYNKLwskcrORoZVgNeTTI5X5thlLfKM+XBhJk=
X-Gm-Gg: Acq92OGAvswRth4Xf/0MpH+MvRfZdD4ewVYrR2FSrk/HV5/Njod1B//CQnLPb4YrrsT
	E+TTmyoWdoyQlYLVJl8lXo+XPg5qOO+kpvhngnXkiCrt8OxNQhseqm34v2bWfpt4LHiNb1T2w7O
	ujWBnafC9r6EiFqbNBBVbllYD6pNFkn7fxG4I8lGQO4DaAMxKH/S6ZkDmSUtreBF2+B3McgooCC
	m4Xyx84ELx5vJazZ8d6uACLJ//h4Lp+pUcmJR/Y9JPn6O4xQVZls2QgBhSQ1mLODxvjhtr+xKAz
	oaWpHQMUpj/TvwaaI0aBmXzHOvLrccrssqeYgFnFczwbMj+7RZ/6Rw9S4gGn1un/tcVSia8CKk1
	XkTd4kt+MF1LdQZYRkb2/xojS3STLKOBGG93Hh6QQVtISqpW0e0N5+UePjmPkQpGP5Yqlw6BQTr
	WYdICxq0Wh5gZNbtnPBqu0iMFU8Ls8zUUI9jd+9adU7s1LC2tFPah/MaV9l9+qKM6QMnjv+vuZh
	vCm
X-Received: by 2002:a05:6000:25c4:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-45c59228fe8mr5283745f8f.23.1778675732839;
        Wed, 13 May 2026 05:35:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm41009555f8f.33.2026.05.13.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:35:32 -0700 (PDT)
Message-ID: <3ab93bcd-81d7-4917-ae6d-3b8e7ba81dc6@linaro.org>
Date: Wed, 13 May 2026 14:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
 <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
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
In-Reply-To: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053537_141937_EA05C10B 
X-CRM114-Status: GOOD (  14.15  )
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

On 5/13/26 12:43, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
> Enable the pwm_ao_cd controller with its pinmux, and declare a
> pwm-leds node with a heartbeat trigger.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fd1b983354a01..c41525a34b721 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -53,6 +53,16 @@ dc_in: regulator-dc-in {
>   		regulator-always-on;
>   	};
>   
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		status {
> +			linux,default-trigger="heartbeat";
> +			max-brightness = <255>;
> +			pwms = <&pwm_ao_cd 0 30040 0>;
> +		};
> +	};
> +
>   	sd_3v3: regulator-sdcard-3v3 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "SD_3V3";
> @@ -163,6 +173,12 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ao_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_c_d_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   /* SDIO */
>   &sd_emmc_a {
>   	status = "okay";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

