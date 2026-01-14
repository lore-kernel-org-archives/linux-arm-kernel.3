Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E4AD31A2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwG15GopvSaIUizczqNnDWH98rC0KVKMXbS2DOpVO8A=; b=JVutyQ1m1ZuoyYndgxoMx7emgx
	IAfvXzaXJY7dTD7QK01+peI85rpZGJABKvh2XVBVVIPbfVfK1N5G0dc+VsQjoeVYbQ1rW8OfCsicB
	p5DL4w1PpJBu6wO/YqK2cUreji3RHLDpTGWYyIUopYhNFBD4UTPZAGwZ+Cpf2shHUentqZW/qKfmK
	c5GXHxW9T+4PiY157DYmQwm5clFvNiPJf7F4BFPzZsJq4loKP0LFi0UGeLhzAW0CkwTx2DD5uu3ri
	/JbgpK1bXIfyTV73V7E3pIxIVFLei19hoaDIapmF2KFQBZ6oR1uDGbR9a1+L2moZ8xB/EbMF4K1NP
	eOXnGYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwow-00000008SfC-1WeL;
	Wed, 14 Jan 2026 09:05:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwos-00000008Sby-3szj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:05:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso66773135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768381537; x=1768986337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwG15GopvSaIUizczqNnDWH98rC0KVKMXbS2DOpVO8A=;
        b=diFgAAy1A/rVYqu7hYFr7LajJeAieHwf4GGJEoW5B6GxCMA/HPDYExzstCfUgAMXP7
         cetygEW72ddMmz997nC0KMVq9+CAx0p07HrYBRaDB6yc0+5FtQEhIHHW/yIPakN7M1XC
         PTBKeaJgt8VPblWp/JNaesRPf/kuaVNGN20vGqXaQVe8cqI0MLfymUoj9RxvnBywe7M7
         BxoAhJm5zy5FbJJoBpupJFt3nSO6jqi5NgSgVA/npJPNkozv6sczOQ9MqHIuQOnEU0RG
         pF5JFSHBqxDlXOxqWQQNe3fWDvoApDbB5UaJTW6qQr/uS/JueyHiV62E3eXac1rUlz8W
         Xb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381537; x=1768986337;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwG15GopvSaIUizczqNnDWH98rC0KVKMXbS2DOpVO8A=;
        b=wuvMYqID6vWVhqaG9oXNZjjII2s2dkKmYNFkVs3Yl7hcrd+zB89/ffusibjG+BzDkq
         7kWEJs1OleZ3N+ecyY2NHvtcveBHU6oUgDy9pip6c8EVbe62lygDMwjpTZhnF3E4TpRR
         ilW6EUk6EQi8sUQ2Jou5wSsk0N71CxcakQK7B+oN2b8L+kuWdoCxNwY/nhQC4YRextdS
         XQozWgKgXy6tRGZOSP7msbpQ8A6NbOkhhW0VYiJm5B4RaujJ8WsjXoj4GXw5y4vCCe91
         h5CzoHL9UzK9iYbC33Pvp8NLVdXKaP303qFKbDM1lubXsWJr9HaLSTtF4Yooar2Y9IsL
         N0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXLLMfk5nEyd6ZSKTi1BS+fkDYssiMcHz0JH7fjf2cWYXRqNRI8jZkQjCLaYAj2cyq2CAYQmYSFxjnSTqTo9+vE@lists.infradead.org
X-Gm-Message-State: AOJu0YxBoO3He5qdAmso+Tsu+uBoxjN1Ysn3fSMoSlnFyerUDqSGobR/
	2i87lpeyxbVa1GzPT1TzV09VzE1wl/defUvOkFU8fh4I1pjGXhjbf4VC0XmmRQVSt/Y=
X-Gm-Gg: AY/fxX6lGk6yRV7R99XAc6XNZPNNjSMg8Vrq9GeuJyCDUzCCoNE2R7uL63vkw4UbFgO
	5XZAK7S5UeH3gtvU5HghiQm279XuIzSznNiflRWn1nPsTNMNuWamT7mn7TNl9/EM0zrCco5P4vk
	iBzEIOXTH35WYTkGxFRl2FZSbmKk0FXNquZXDduE2jes5tGLV4QwD8l1HYY8vXm7pe/OQwhQafg
	wzESrRcPrMjCprxNluA5YYLBrZZ6B5klxP42TbfIvqyD9/vnd6sYNoYAj5mFAgKz432TxAeZjk6
	kF8FGLubJPHRcYckBWp9a9ye8rZLEFXHOylXlm10UL9Wv0fWk8r560GzvuHL3Al8ILp2N2OMsXr
	VdsSPFt+MqRluh+IdMqcV1HGTG89/ojrKYTu0kpYVWwjM61g/bZ0x7c0DyFdXVzTjLI4VoBiIOj
	vw5t9XvQMUIyr1JuIDPXakTTV7o6kjcVKVcDuqAFTYHGMZCfwxiwAc15vJK0MY8UJ89NqT6eLgm
	A==
X-Received: by 2002:a05:600c:4446:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-47ee47222f1mr14772495e9.0.1768381536276;
        Wed, 14 Jan 2026 01:05:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee562d7aasm17655715e9.11.2026.01.14.01.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:05:35 -0800 (PST)
Message-ID: <d55bd5c6-d5f8-45d8-9c6b-22e401f6a7ff@linaro.org>
Date: Wed, 14 Jan 2026 10:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
 <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
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
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_010538_999117_7532699B 
X-CRM114-Status: GOOD (  19.42  )
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

On 1/14/26 09:56, Jerome Brunet wrote:
> The amlogic MMC driver operate with the assumption that MMC clock
> is configured to provide 24MHz. It uses this path for low
> rates such as 400kHz.
> 
> This assumption did hold true until but it now, but it is apparently
> not the case with s4. The clock has been reported to provide 1GHz
> instead. This is most likely due to how the bootloader is using the MMC
> clock on this platform.
> 
> Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
> 24MHz, the clock should be properly assigned, so assign it.
> 
> Reported-by: Nick Xie <nick@khadas.com>
> Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
> Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
> Tested-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 9d99ed2994df..62538fd9db6b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
>   			clock-names = "core", "clkin0", "clkin1";
>   			resets = <&reset RESET_SD_EMMC_B>;
>   			status = "disabled";
> +
> +			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
> +			assigned-clock-parents = <0>;

In this case, assigned-clock-parents should be dropped.

Neil

> +			assigned-clock-rates = <24000000>;
>   		};
>   
>   		emmc: mmc@fe08c000 {
> 


