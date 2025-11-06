Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQZIJ2xmoJurErGMsCLrLKrgFZo/Q7nS6WUoDhpVWxM=; b=Wm1pt7RUWDRi4WQLX7TaRzd0i4
	YCBs09PL9nCS93lPn2tJV3iiHNGkcHJVz/ML5bqS8t3IJzbbOBjicpYd0zib/2uqBfTK/ryU+89D4
	EN2NGyAlaCrDzeXsmocm3nJvmbftoD2nPSEiGPRbY0W+tjJLHChX5sq+U/ecuII19p+en+ekDEMXC
	nQi0GiS7gdwqIl2i9L3kWnS+jp+QvWDp4525HxhCe1ULtc39h/XGhAh1eb+FqCrlULC8UpaDPxmka
	qwwBFG07OUC3LgJeBVQjRi9d0JJuXe5VjVUhc2yviMopy4ms3lTlgJqHOnHp4m3EH1wNERKNuM//D
	DcB9E71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzj6-0000000FXeq-3H8e;
	Thu, 06 Nov 2025 13:08:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzj0-0000000FXbJ-2Apm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:08:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so655690f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434504; x=1763039304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQZIJ2xmoJurErGMsCLrLKrgFZo/Q7nS6WUoDhpVWxM=;
        b=OzSwMAxxroubVQJGOvUko07qoFvOPXgUR8RaAy+xAu8v41imQ0CpPX8aQ0w7QC9C39
         ikvSkW3IXVXrTHxYCucGEyu35IYR7dHLw8a6TWzzTBpyVTcYtsZY1Qp/Yc2VY3zJUa2Y
         EvEYBpkBERFAEqSjZY0CwhuqGMaBo5JZRRXcq0SHmQD1j7fk/M97MaHNFKrHInL3X+U6
         0YMzK4qxV6ZLkxKfManr37NtPmVfBYgT5pAFNALwq1TNdFmjBzYmqxc59X2Xfkuq5Exb
         Kca365VZNflCHvYEDsUTTod8Ax5WMrXwje9Y0INl/N0T7s/+LYbfWZ18B2o4vYv0iKOa
         hn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434504; x=1763039304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQZIJ2xmoJurErGMsCLrLKrgFZo/Q7nS6WUoDhpVWxM=;
        b=wuZRD0vhhtRJXecxhj32io+wAwYTBmrK86hoT9wPF/s5RK/Qp3VVFhg8uXjAyWdKRe
         gf5Q2oorxxvLOAXbM89qxE+mJrD+rBrK8Oy6DUB9H3T62uMoDHDgHhCwWdUlOF9fYJNZ
         rBTVg4/aotCSo0zvq2qloSwirqCYGVPHC23G7D3xd5DjG/+AWB45eChLC6B0dE+zClBU
         i2c/KEjsALP2ryQts6Ay7Y2Ac4+IamZ0V2Q+B0/28PdiKl30ZypaUGK3yW/QsocOVzR6
         yNCaBC5kGhrBOCTJ0br8lWooiVDnD0eoKyfHQtffzE0kSWzsTj2bJQ62JGGyoEVj/flA
         6U/A==
X-Forwarded-Encrypted: i=1; AJvYcCX6ODiFXRp+24RbR8OoZCmAgVax9MQH16Plsb3ZYkldng3pS/JgOfmMhGFRhMjLBAmn5VwUlwtIA9evtT4s3QF4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrt7jDSjUnFUAsl4LkZGEWDrUE/3WOYbJHadXo7XNvCrHxDifk
	9L4Wd++2eSdSNOYe06ZY6Qus66PcaFBQcPoa+VVcFBO4N8I4WRwAclmaud6YSl4X/Rk=
X-Gm-Gg: ASbGnctEMYPpCDd88htz7Dkw3I7vlSEeUtFcIhstNa6p2o/fLoTPdAslZAA4z0GhasB
	wCzZOAET5Ww2J3sPLSTpat//ot49/96gMXMFWh9iR/JrV5ePNBedDXhS+qn1RmzrLWolHT7ofSy
	g+vhHbFxjlMrm60MWuJv8QSxkSe9BPd1dYaBvudu3b8wSrsO+SGgQ1e4S/4GD03YRiiI5YvGagY
	WuZQUtXT78Gnxb26QIMBnN2THNTeOsddkZ6irx22Qpe7IFJDTUwExbYWcqk4oZ5ow4yc4t2bqI6
	J1+c4NILmGYGRgE3EgA6xeznlhkvYASVw4Lzx/Y4TVHRm50uT0ws/mAaZ7YOhhRUpetsM9KuDwO
	CrJdbfrB61UwigMDM9VCI7sTg06OYMyXKQwuuzPh4pULT/79QiiM5M9rr7w2iCoF1voupo/T368
	5Ex8RbEgnEg2HCzMSYrYV21kdtZOdyHSpvPg==
X-Google-Smtp-Source: AGHT+IF6rma8OU9HRh/m1faNu+JTKdeQ+7jkSzOE0//gI7xuL2wV4a8q3sJmgGwU6sR3gY3jWLa43A==
X-Received: by 2002:a05:6000:40c9:b0:429:dc9a:ed34 with SMTP id ffacd0b85a97d-429e32f482cmr6817722f8f.27.1762434504030;
        Thu, 06 Nov 2025 05:08:24 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4771e6sm4956316f8f.28.2025.11.06.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:08:23 -0800 (PST)
Message-ID: <b40e91e1-589f-4c6f-ae22-feca5f292c75@linaro.org>
Date: Thu, 6 Nov 2025 14:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050828_697354_F672B095 
X-CRM114-Status: GOOD (  13.24  )
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
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> index f1c2e91ec6c5..74f98fae7dac 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> @@ -194,6 +194,16 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,s7d-gpio-intc",
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

