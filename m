Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C039CC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq+ZfaXrZvTkZsYgTJsjcj34MHFpmYRP4Z0eWcu7sE0=; b=PsZOk06XW1o13LVMfFmzmutByo
	ATUR7A99Yc/Lhzsg3avWWQWkcZP2kUUMW9ytBGtFG0fyZk/ghRpVOc6GUuOrK3gZAb1DPyWGOrXoa
	1q8hGhE0peHctzbQfLJK3VOW631nPN85XP/bg9Qo2D815HXhLdqD41Q3qeBeSMU90Fv+kKEQcZLEm
	RW1dT0/s0DM+osPjqjK0RXzRHQCi479rB2h6WnhLDcDj7fK26+uUqXLU8gQwnI1/uvqi3uMNDYsEZ
	nVBOoJ2cOH/H2Gnfh6oLD/1UyGN9nuj7E4yj010VX2CdFu6qUPhmwWw8zZp4EIZ7OkZvZ4WwMH38B
	C112pVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fFG-00000007jN0-1Wit;
	Sun, 30 Aug 2026 13:06:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fFD-00000007jLU-1x5k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 13:06:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49b9320423cso25047055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095201; x=1788700001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq+ZfaXrZvTkZsYgTJsjcj34MHFpmYRP4Z0eWcu7sE0=;
        b=dXkMinKYydtWTxLfrHQWGBLS25XremmXQbL/cC1mJrwV1P8ICUixO1ScoOcDZkXBmx
         kAwy7nLfksDh3uF+SFCWDdA8th0mg/kDCvV2rfmzr8SvCdJ+Apb6JgLS4qQ6AsuWO+Ps
         SYitkHdK0eMkc8vdN6jy15qT1igxoIkMr+EtAuAKvlTDm5w8RjpwtuZ+YcJ84uDIdlLH
         DWkgkgdw6mTqZtd9GJzt7ZjlCqrrNuk/ALAUfLdLqiYe/bWwT+Bl3V3r0Yl/UWiOsKU3
         Qk/6lI0KtEm7RkJ0HfyWWh5DtCrRt27p87pPEOKtWX6Vnmc+Ygsk+fNesnM+HZ0SwMjJ
         7brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095201; x=1788700001;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jq+ZfaXrZvTkZsYgTJsjcj34MHFpmYRP4Z0eWcu7sE0=;
        b=HUSUn59oaPZFtXdotGyo0XH+2qd+By8L+QVTeThHIt+SPlnygxygwATgJZB+ki9H6i
         8zxKy4rosoGb0aMyHOD8AZtbzK64nDoGnffpGEfDSU5Y1IrZeua9YGglYa7DIhs4MdeL
         Ey8+8HGx3Y5QmuNVF+FUrfTrFt7iPpa7GgcB8x12rRIU/Vnn4wnkfusWBT5I2gmIqX/o
         ES0W9M5K2E5FO+ubv1B4UAXmbuVCw95OwOg17jkVm3D0qThXlM93E/20U7rJEqeRzgKe
         jqJfVhIQFhlpaceKSkzCtR65WDF21q4vvVCKdSmeb5QtHaHAVO+s2rcYl3vBzwfBjP/o
         S0tg==
X-Forwarded-Encrypted: i=1; AHgh+RqbPqlTSQMTzjGppXteaH6Hy2RmPD4rluK2ujdtJDK0Boj/tKLE/zHV2zyKyowSDeQPz8wvzxLCuUrW5pUHwHhr@lists.infradead.org
X-Gm-Message-State: AFuF++kfetFrPOf/DD8itSqB1q+aZiacFq8ZJrLWjdFdfAjT8hdMoHV2
	RXBAR+Dw1kdbwRW6zEaVdiyq3KgcwYP1i7hrDZjygPyeA7q7jQlFRPXi8mUAMxQe4IE=
X-Gm-Gg: AR+sD11ZypNwb8ZiLRDN2swzCljj49mAZbtV7T0pJCoXX7N7/pBaYw0n/gC7DlLIRtJ
	fcqgo9Zyi6grywFhsvEtwRMs/hjZ7HsZnGW9+EZHbwuGsdfNzPFejRQCZ1gkuWxBMfy5FrV4mHx
	K92l5GXZdB6RbgdJz80M0mBRcENKfvisaD44V8WzEQQyhSKwrF/gVTQBb64RvTaxM7fU7rfRy+H
	y4fuPF04i4ZbQkWp+2/7LgjvLCR7H3aks0ikjPh/YS/5LtWF0DgFcMsSOhTXE2HZpb6Bw3q+Xc2
	oF1KXunwG5Kq4YIbNDfeNBCUmi5/8iY397sYyK1NmJ5Af29ph3OWcDZyheGEbAsaREAsP8PfTSB
	7/ZXtOjVB5WT/axmdOO0tFAP9G6PkhCjhdqEeAH0g9USlo3exBrU7PgUyO1RH3bNd08p/ZRMJwG
	V9RM/ZRLZP3bApXg6oZA9zrZaAcEV2AQZEvsyoFHVZBdBTm6UDZlGPGM8iQF8NYVBepVKp18BA
X-Received: by 2002:a05:600c:19ca:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49b91c47b3dmr274079255e9.11.1788095201493;
        Sun, 30 Aug 2026 06:06:41 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm15406915f8f.21.2026.08.30.06.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:06:41 -0700 (PDT)
Message-ID: <b9270c4d-bb7c-4c69-ad18-8481b43a48ea@linaro.org>
Date: Sun, 30 Aug 2026 15:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two
 PWM outputs
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-3-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_060643_542280_0980BCD3 
X-CRM114-Status: GOOD (  15.14  )
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

On 8/29/26 11:47, Lucas Tanure wrote:
> Two of the PWM outputs can each appear on more than one pin, but the
> description named a single group that does not exist, so anything using
> it refused to start.
> 
> Name the real groups instead, one entry per pin, the same way the other
> multi-pin PWM output is already described.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index c3dc479b137d..8c4bd683cce0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -458,9 +458,25 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_g_pins: pwm-ao-g {
> +				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
>   					mux {
> -						groups = "pwm_ao_g";
> +						groups = "pwm_ao_g_d11";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
> +					mux {
> +						groups = "pwm_ao_g_d7";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_e_pins: pwm-ao-g-e {
> +					mux {
> +						groups = "pwm_ao_g_e";
>   						function = "pwm_ao_g";
>   						bias-disable;
>   					};
> @@ -474,9 +490,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_h_pins: pwm-ao-h {
> +				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
> +					mux {
> +						groups = "pwm_ao_h_d5";
> +						function = "pwm_ao_h";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
>   					mux {
> -						groups = "pwm_ao_h";
> +						groups = "pwm_ao_h_d10";
>   						function = "pwm_ao_h";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

