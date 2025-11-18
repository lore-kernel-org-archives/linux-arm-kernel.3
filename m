Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E62ACEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX/rwpSeSV2xaHQKCSrS8dfq2AEp8R4hePQzRfPkN5c=; b=uQ8uEd3pD3lhEiDxIeaUU7JDh1
	pwqPn5C3VISfdRnaOTQb44l/a26MdiD/1b3BNELZbiuCmdn9jTOLJCHjcqkQGpSnSXI+uNj/ZZcBL
	D9igRVWHFFczDJyRcZdAsMxVHMt9B4yoH7O1XTmmnpN81TGMYZ01EP/Wpo/OTIKYSzniAmGlwQJaa
	fqipJU47+lF8QSUfk6pZOSTn8VyEL9u+07yUCvOpcw/gRLReJgMjpG8RmCXvaVl5W7HQtn0NBL4JB
	lUCAqhgS5HkaUfs1zdSgr0WNgw/MtmYUIfc6jhEk0SKjCnrBskFgYMj7t8VrlfJnALfIkn6PdeVJ7
	/bc4pHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbs-000000000jE-3yEe;
	Tue, 18 Nov 2025 07:58:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbn-000000000gv-2Cd8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4775ae77516so56976595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 23:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452718; x=1764057518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX/rwpSeSV2xaHQKCSrS8dfq2AEp8R4hePQzRfPkN5c=;
        b=mnWnnwWYX8/MqZhCe8zNn0cYnjt+IXldboMvzpgTdc/GRIeaRggx13/s1s1GBXybuk
         UToa1iSn3IZ+mEFeP3JWLzOt/RinJ06U7PAjZQywmpESQsq5eydJPi8Z1s78r6zHK2gY
         F6s6M0jprAb94fkdhV7X/mioplIEmIBz2DUw+z/pLdpvR1MEwB51ERIyjI0tT7DOGfOy
         noDivBpruAkQHodOsE60G6X1/+GWz9BxC3kV8spCh0Xr9PwHSrBWVv/oF1KoFFWh8hO3
         o8sdQXBQ6rSmv6XUoAogFmkseM5bOs7CHvAXpgT/BC5eA6LuHWwEWSkqJmABcJnMYAIK
         Odxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452718; x=1764057518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX/rwpSeSV2xaHQKCSrS8dfq2AEp8R4hePQzRfPkN5c=;
        b=eWPC6ENNt1jRRQyR+cmlfvMbOi3x7HU2CjKjMbCOyPwX4VtbahcH2NFfdx8is/dGQ2
         K3z2pRPd6oxhDkp7aercB3t48u9TvoO9IzrdM2VHhrR/1otN4JG8/GIdgBaAqnYwxK6g
         i13r8YF4vCXxvoS5e6NG7kGS60ir7kr9E9miUNABOy7jMIZMKhdl5ekpxhXdjHArmBuO
         24kiVTe9c3Boj54Zg+dxGFyvM9H2b5kZrkPfeObC7renKMVtr4jiEqG7Ym0RSjQJtm/8
         HE1ElzMh2TWYDsEv/A4cMjWTbvsAtYPAudYDBzZI8YbZTLoe83rVj+Wrje0HQ8TDICLS
         8T+g==
X-Forwarded-Encrypted: i=1; AJvYcCWQr36Rmmg07plk0RvqY6CXaIQJJOga9iX82Crgpl7UewcfcZUB3fBrQMI4K1XOc54PQS+RrEgzBfLCPLohKau5@lists.infradead.org
X-Gm-Message-State: AOJu0YzvaJd9qVTy47XoPvA1+c1JY2POkO12CFwZal6emH6jgDEz/OEr
	nAE5KBYHlI13XbYT2s9UScfoyGlSRQdjpDrJh3jZBdT6AtUYcOeemmPxjVhV06OdzGI=
X-Gm-Gg: ASbGncsOxyq6yh9xn9lr8wvOGwl7pCxBULMh/+almxcGNWZSTjTsD2ifl/FmICBQpRH
	aXKRWg185W+7UrMnBrM2K1vJe5KalHxaj9KJQRbNklXlAcjqppiHzkX1gVZAFgKu/qwBME0NTnH
	rRd5QQqYxmer3VcxYxJiez8wu+/SK3XWLOKSBVjtXXtCBMcSFCMDm9/xR41bIkKw9OfVz6rb9+B
	H8+PtL+KreFQzkumJDWOE0SEugwEte3neOKeQ/EocvNBu8K74uSg9HyLb+rbHUNFW7TlJv08Im7
	DuEVvRk5fF0KQpNHkGZIR6rOQBjR52y3Um5Qb4nM/N2Wc1l+99rDICZGsqdkXnBh7fIWEyippIL
	GNEuL5Kvo81MqsM6wQ2YUoyYzUlXMJEAXEtJsW2qMfxlomvI3tFOmZvfNmvDM1V/e+rKG6gmGj1
	8XNV6/jlaYeYFjM83hHFA3nMNic291Jxg7TypJGPkbXI7F+VLUDU8YJQZH9ekqURUJxenxflMgY
	g==
X-Google-Smtp-Source: AGHT+IGGMGuWR5iFvUAotvIf2624yfKAl5P4i/kOrg7Ysa5w1iKe5V5T2MxUIaMHspzvFrmXKuRKxQ==
X-Received: by 2002:a05:600c:3550:b0:477:76fb:ef18 with SMTP id 5b1f17b1804b1-4778fe9a5demr136227835e9.25.1763452717637;
        Mon, 17 Nov 2025 23:58:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm377307365e9.0.2025.11.17.23.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:37 -0800 (PST)
Message-ID: <d3f0e883-b580-4c75-8eb7-70a019fb5062@linaro.org>
Date: Tue, 18 Nov 2025 08:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: amlogic: s6: add ao secure node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235839_739711_37EDFA7D 
X-CRM114-Status: GOOD (  13.58  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 0dca64a2ef9e..da3e607aea85 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -199,6 +199,14 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			ao-secure@10220 {
> +				compatible = "amlogic,s6-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

