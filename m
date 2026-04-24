Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC3FE51FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=; b=vek7aQ9DNMidSmJ9LFMQUFJ03Z
	XujiqAfJA7ZTIRmODdgx9EJtR7q9c/PTYAZLMgCdncMKQ0aVel/sRO9id5gsgsaiCPdLDbYzd5zBV
	ctS0bFY9yhsfAdrxuPtYuelM1V4Hrg2VazZVjCnhVO3Yntl0sZ2bo5JKlGYWUKPilEsTrAMAeskXZ
	EzBI/nP5wlr/bXIAHKkU4OkMLAlRdps8kG/n48aBLYzyt1JjNjBfYDAj+67s43P3m+6fzBlRihvDB
	+YcWy8lHf6tT9CRIXjXPQQOlAf0HccnmIaMR+h/1swj396UzJ9O30Q4V32oHpelDoBoT704ru7m4q
	uaACO8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDM-0000000Cxou-3rCQ;
	Fri, 24 Apr 2026 09:52:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDK-0000000Cxnb-1eXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:52:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso79013135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024365; x=1777629165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=iYXtPIGesYdqlTs6bqLCDdPTFr6MV7fNTelXwqd/8X3kONhcUtNiY8a9uaTZklCQD/
         7rrRZf3GXFZp6W7xJUZGS5H9x9cHze+0QgV5ZwvuXw2d4VOl7Y1J5qEqnW51nnTDaKcE
         2iGLSwtK2mgC9CPr/X6knIH4D/IkDQdlRqihspWSQfpY0JplLjpd6KyHYuA8csw+OWWb
         AiYPuFlFzvqynrPu8LU5qL0vXVsKd5DWauS7GIdXQYpiYXnvreyAaL/Tv1Gilh5ZPyF6
         /t8rjdDoI+iYsm+EYNSGnyrz32iYVhIkofwfPxXa31h9ES/YbrnHaQzazvxlBcnB8ahA
         NZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024365; x=1777629165;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=Pc57Imhhk/7pHR1jN5X0nUyFRD2UOQvErqsZGg85e0G6ALTBoTIaLmnasb7RJNQu0R
         n19yRi3hcQvOXG7bkniwv5S+LmLWje2CifPI4jx9B7nC6ZJjDakPuvMe1JoSpjSITD0g
         ejwYbzaQWpAFk8gk6iouV7XaqalNyPpkNVfj5cduZaCiJUC3iBK0viO9Nz7VcPFvh53S
         Gg2y7FBsl3E/vdwV/wzoozTLOF0dqsfbCjO4qdO/+KaIdXsWgGC85ceJCk4yfXy4lCJv
         epiM1WBSK8qMgJ7FV4KsKPi3i10VhUg2fR4/2HAZuRh6qL6Vx/IjArvlFoJV0vorn7qT
         y3HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7rJoV5lhzWRYCr32X9e3pvUHSr4IDJkqfMD9HP4BfZtMFK6szN/ZTJi2+kDfI8r138i5Waur5GA7MtqYQmdOK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/t5RJToNNA3yXSKCv1zCFwJaPNv72gDTEi+otTAenZkUUy1jb
	Nyp4gNWsBt0KravsucMf4RBdJkglFFQgkNVMt7aBkeibzMnT1wYL5XAYaLz+WU08ajI=
X-Gm-Gg: AeBDies3eItRRP/XExWpm7av1YY3G1rJCuO5E4x4zOy4pkdN6mcNZO4yvvnnjDVaTAX
	SUJw4Jb+pqIx8kOOxwQz+4TudDG3IWfwbwkVlTjOHey+uMRYl+bWrlCEsNQGgtzWE/ND0sQQG3d
	vpRJHK2eJ4Ri3f84jyEs4DNx27B7mkqoGqod828lnkGoldX4f0N2vM6A1a8yPr9Sn3x0pkGhxqy
	du6eq3K4Zn2VSh8VHOQZCPI+MfDVpZYuj9/2QFxl/iUS+6HuZ6uU8ZTf9faDNtUbi8XueLDBXla
	qIV9j3E/9gI7t/kQooapvmGwl7Q+d/M75vFAvUcXBeyB/G5WN+W5OPDaq0Jc7c2kqW/V292xDAE
	TfK/PUjf7+A+gCxoX2VhjrwtlE/Dn/kIOucd/KJBrq+pQsAYEaWlRwQew76frjLuG3ZNmDtJQlN
	hPZEwhCU81ZCQkTGavmI+W2LEmQdaDAiyJcAYrSp1RuoAUKCLo98+vvHYb7hCsEfEFsmG8kc4HI
	Jx2at5dbDbtQTGP7A==
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr374022025e9.24.1777024364611;
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm141108575e9.0.2026.04.24.02.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Message-ID: <80f93779-17fd-4fab-a887-b5f88e82b2d7@linaro.org>
Date: Fri, 24 Apr 2026 11:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add thermal sensor nodes
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025246_463380_83ECD223 
X-CRM114-Status: GOOD (  12.04  )
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

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add six temperature sensor nodes using the amlogic,t7-thermal compatible:
> a73, a53, gpu, nna, vpu, and hevc. Each sensor retrieves its calibration
> data from the secure monitor via the amlogic,secure-monitor phandle with
> the corresponding tsensor_id argument.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7aec65f036a9c..62f259b2b17d2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,24 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			a73_tsensor: temperature-sensor@20000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x20000 0x0 0x50>;
> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 1>;
> +			};
> +
> +			a53_tsensor: temperature-sensor@22000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x22000 0x0 0x50>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 2>;
> +			};
> +
>   			pwm_ao_ef: pwm@30000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x30000 0x0 0x24>;
> @@ -770,6 +788,46 @@ sd_emmc_c: mmc@8c000 {
>   				assigned-clock-parents = <&xtal>;
>   				status = "disabled";
>   			};
> +
> +			gpu_tsensor: temperature-sensor@94000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x94000 0x0 0x50>;
> +				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 3>;
> +			};
> +
> +			nna_tsensor: temperature-sensor@96000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x96000 0x0 0x50>;
> +				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 4>;
> +			};
> +
> +			vpu_tsensor: temperature-sensor@98000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x98000 0x0 0x50>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 6>;
> +			};
> +
> +			hevc_tsensor: temperature-sensor@9a000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x9a000 0x0 0x50>;
> +				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 5>;
> +			};
>   		};
>   
>   	};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

