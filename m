Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84600FE51FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=; b=myn+cPnZb+CxFVptSJNnW9mYyp
	C9zFSMUWnNZC4eCOKDE4bT2ZsTR5K1IllkV4pyt1kCl25jmf4ozZu+5hmAnpBg5g6lF00GvDAU4xU
	hA1S+W3R7vdJTD95v56+9+ZHlnCrjvb0smqkT3qNXkrGddmDMv+r3r2u0Pka+zY4zelIVEwawZkdl
	AVAmGr5h3hg78gfsWOBiTNw4Rlz9jPwokRoDFcffvhqLvLZDSzl8t1/e4urXb7WvZWU4DxDqCTGl2
	wu6lh4lb/3e8MLBbkM8IgiQe5aig+usIH5HXHywU/3xWC+Mm40nvyzC3mW0uts3c1HVpQD7iR3J4R
	y1B8usNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDEF-0000000Cy4i-3sAZ;
	Fri, 24 Apr 2026 09:53:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDEC-0000000Cy2t-3NY7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:53:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891f625344so62782955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024419; x=1777629219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=cvwazGgXX7iawnyYHLgwAcJXud7mByx6H7dOU566rL9zhKek18gKrMk2B1/1pNuQIV
         IoCIKNK00en1sQ3z+qWUoe+4RIpsWe+ywWHbzJW0QkqwNCTPt1PKRkGBUXSMeX6JBt1l
         vqY6rvyVXrekZFWuteYhOYLyoGCOq454ogHKYn6JY4qJtFcqA3SDs6cL258nu18WXx2J
         HbXXydiv0j6WZfUDaukyUxlsr5AHuJsk6eQpvDG2A5ElggI527sjQdf8UNuEdMpihyH3
         Z5UVuF7VVRVvYchcGuNHHJGVdkS4uk71hGs90U70RjWiWhW5KPcvFvj27xdeIgaf9US4
         2+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024419; x=1777629219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=OzKe08TDMknNx2iiThz7J9JTCcwhuzUsGKBKfO4weTXPGmeR9f7ibCUuyyT52av7T0
         AEfjuhNzeyk9pgkF7XqShA7GGUZdE9j6gC2kckMffL+Y/8AoSH8xNENlvQbBeBJD2WJg
         wMvk9GvQ0Au2SaKiBPWfvMMJJdNHmsVw6bNBj691rqXNSBC+GG5Xsnpx9/nrih6KSuAr
         5pDvbN4ueQyfSnFEvJ1SUVk38dmCTVYChAQaDNAtG5qWFq+0H6ouy+VbxF/qyJ/Z3lpK
         A3Y3h7BZMJpaXGUv29oroGyvk/M0uvKXc/3ZEFUVzifuHQywB74d8EC/eoFWDKgiqpbA
         jMLA==
X-Forwarded-Encrypted: i=1; AFNElJ9OVwdHQ8LqOzDLvaaneJDK3qhSVu9GhcXniFyNzZiVleppKKLhzbo13huWrnGGK94Gk8G0m6i/XE47tQR3dNH4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKQtqaI0fR/GimjAbmv0AVM3XfnnVo/MOPfOXlhqyFdejm/gXt
	aJizcaeStidQ5d3fQnwTGlcQ6KKZFg290wZRPOKl4dwhQ0Xwm9d6WJw5n4FKPCyZ+iI=
X-Gm-Gg: AeBDieu+nBfqeoapidn/xFf+PEFI0/pYJu8u+UFXp/NGUUGsc4mGdw9V/k9WuwtoPni
	6LjwR8HB+mOWCKSt13lhPBdhdH3V1Gh2pYxMw7i5VLv0rhtI84oXVLDqh5fY+C/oEgvd9szpFSW
	UIvUdUmIRpiS3R8XgrgYrDaMOw1EZnbWSNWJ4/fiu/jOQTHpTHJTzGVw1djuLJ6h/tWg2gJNfAt
	QU8UpoeuqJqJIY+BSj2ksJ7CZnXo2UsZifegUICUR7tNci2wnfhjw9bfMglxjIIS22orFoLr3UX
	mZAedOHKWBK788ube6J7H4n5TNbX3kRQ+XrrkYNKaBiQR8ckunqPnKSXrJvXM2AAbV8E/Sgvsb8
	OSSKzQWBSVqp/8mkd+axjXF7kTV1w0I3b6fhXJiJCUiZWqg6Hm/w9k/APhkwpQWQxvjD5yupJgd
	T0tjpNTtux4QPXd6hco0My7gYOtValowLUBkCrsYOoYDaTGnzf6G2UhMRDFYVSXVVQB2bmogcMV
	NBOPPECz+hkrRWFoQ==
X-Received: by 2002:a05:600c:3055:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-489032bae49mr216070105e9.6.1777024419012;
        Fri, 24 Apr 2026 02:53:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm364827355e9.9.2026.04.24.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:53:38 -0700 (PDT)
Message-ID: <c26122b2-b5c7-4a5f-8d42-c691ff992937@linaro.org>
Date: Fri, 24 Apr 2026 11:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
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
 <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025340_885922_5DD129B4 
X-CRM114-Status: GOOD (  13.56  )
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
> Add an active trip at 50°C to all six thermal zones and map it to the
> khadas_mcu fan controller, using cooling states 30 to 100.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++++++++++++++
>   1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 5d7f5390f3a66..ba9219073dd0a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -157,6 +157,74 @@ wifi32k: wifi32k {
>   	};
>   };
>   
> +&a53_thermal {
> +	trips {
> +		a53_active: a53-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&a53_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&a73_thermal {
> +	trips {
> +		a73_active: a73-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&a73_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&gpu_thermal {
> +	trips {
> +		gpu_active: gpu-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&gpu_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&hevc_thermal {
> +	trips {
> +		hevc_active: hevc-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&hevc_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
>   &i2c_m_ao_a {
>   	status = "okay";
>   	pinctrl-0 = <&i2c0_ao_d_pins>;
> @@ -170,6 +238,23 @@ khadas_mcu: system-controller@18 {
>   	};
>   };
>   
> +&nna_thermal {
> +	trips {
> +		nna_active: nna-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&nna_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_pins>;
> @@ -266,3 +351,20 @@ &uart_a {
>   	clocks = <&xtal>, <&xtal>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   };
> +
> +&vpu_thermal {
> +	trips {
> +		vpu_active: vpu-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&vpu_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

