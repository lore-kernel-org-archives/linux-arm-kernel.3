Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A9C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=; b=CI4ihcwKwJaJjEymryckePJiaP
	/VJqejrHhM+b95mJNdGrWWGhnousFGkTmOuefKy/pvPJDK2oLQErnn0Ys3h3sjP86d/rDFCz0tuDU
	HNJMbav3rwDkh9GSkuFLWYyn69EWOeGbijMlH5yCEK8QWwR2eyuy86di9CicylO3ypLjtdVy+OTLX
	CVyXR+rlzSHA2e23vbpRFed3M67ZFX9yXR+5gH+9ZYE1e1wwAIKEjX9C0qi4R4FV7fr0L4r/hkSeK
	1jd28Mfk9FvxXANCnojwvr+spcH0QgWei96oqIcMHVRYDvBP9CIHCdmCBJjJx/ftddOxYmEp/bHtW
	DZR+1vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVrg-00000003gj0-0G64;
	Thu, 27 Aug 2026 08:53:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVrc-00000003ghf-3qGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:53:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47fd66a094eso535975f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820815; x=1788425615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=DTi++6woFlzyNYJq7CafD86xy+1uOBgLc7n+CqJadxxqNHeMYp5OXTOjIU9Ug/JhhO
         5cuZv9qKqGr8efUH4KuovM04wcsH3PeblNJ6nNzNWSKeX3kUcIF0mWbGcgRA2Z/TfIJ2
         CjxLDkSr0Izq58e4J46/qo48UxBJPdCxbZNSbxdoZbMwk8C6IEkJ/x0OwAKwDAJqCK1o
         3ggwU+MNsD4gAv1WQcq+1QdXUqWPpXaK6KnrZvjZI6TmXiXDiKbi5/jFWcYO5UYjkaQQ
         kLKzohA52NkWIR7PMNunRIm1GDFB8Lk7HjarRatY3n/xMOop0Hn/Gi5kBx8EdTyjhEfZ
         CMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820815; x=1788425615;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=ljkHncbFjDNCMFXWqUmx9bi1m4JKL7HdN2TwxBUXhFi238TVrkiPl4fjE6KrDt50uR
         HTjUd5AbpNVqPJT957FWMoB/Kj/MsrKciVlm1MoIaV42r3hI7G1thGT1b+F0mJQGFZOh
         aEcYzqVX2vKhRoSGgLEz4zbGnzKPwmNXd5aMPQ2HR8g8l3M5OnSaVvwzB8vcTCbMzj3e
         2h5qp7bCCjkQUF/kdeYSyPWQfCEkA6faackqrkGCw62DKdYWi6Odtz3NB/U0oyA3Wt7h
         8SbvVvw4EPls3TWANKcH1r3ZjH/4U63hhTGSZ83zpmt+8a6GUQOIlfjjqnUpyYc2ji9o
         461Q==
X-Gm-Message-State: AFuF++niO08EVRXRpqimoEXe4F6DRw+VxjZw6gMl5eL+gNznvVZTy7rY
	XulOMK9ZKAK3zEaElKV3GcKB4im2KoX+Px9dvwcrjbKkimq+SgRifdTEu3BlxTeWuO8=
X-Gm-Gg: AR+sD10ESOg/hm/w2+dOAlkXxAvq7d9uw87eWBI6SY0KEiiRZ87ccM/4CWZBrGkOfqj
	o1+eEPnxSu7soeAmUZJsCJmkFqV8zPSR+A2XBJN4vrdCXwvhAWisoftpVi3K+CeE40xNL273Q4R
	5nsLWeXgQZhCSKsEbsBFCLk3bM2VCKz7tlMWRWENK/hhnyuuGHx41frejkqG5Zc7gb4Sm9urrJc
	LgeUfpkIFc/PHiP3neSIC8QAyrCicsFIbd5PxIQ6eVHBgBi+IccWIlyBXh5ZMude/WXkf2AoR4i
	NrW5bDwHhRXt+GQva3BlscQOmfZtDoimzdfhPuI+oc1wcCgqblprUYRhmxyzA7jSH/UieUNUra/
	X8EGZS7t3rJ1xQl12AiLaReiei+Mp1C7oeI8p2x0KJRQagE61fO0aXeinp4ONhoBVe0RTp17THQ
	htbagk0mE4iAInJ4P/25PmVO+yiQ3A/SqmvQkzZRVMcSMEzeKmVNJZkFHTd7tG/go+qyfb
X-Received: by 2002:a05:6000:29ce:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482e26c3ff0mr12975216f8f.17.1787820814796;
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Message-ID: <80dd837c-9dd5-4b7e-9abb-02bb59d45da5@linaro.org>
Date: Thu, 27 Aug 2026 10:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD
 card to be power cycled
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-3-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015336_988211_F0A00996 
X-CRM114-Status: GOOD (  16.67  )
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

On 8/23/26 13:53, Lucas Tanure wrote:
> SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
> cards refuse that switch, and the SD specification says the only way
> to recover is to power the card off and start again.
> 
> SD_3V3 is marked regulator-always-on, so the supply never goes off,
> the card stays stuck half way through the switch, and the MMC core
> retries forever:
> 
>    mmc1: error -95 whilst initialising SD card
> 
> Drop regulator-always-on. regulator-boot-on still turns the supply on
> at boot, and a card that refuses the switch now falls back to high
> speed instead of failing to initialise.
> 
> Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 75d81ad6830d..c94afaaf8826 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
>   		vin-supply = <&vddao_3v3>;
>   		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
>   		regulator-boot-on;
> -		regulator-always-on;
>   	};
>   
>   	sdio_pwrseq: sdio-pwrseq {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

