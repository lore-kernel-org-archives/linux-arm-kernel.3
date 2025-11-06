Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5EFCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yLyeCjgls6cM1HvoV4Agizj+GB/rHC0r8rByuRqqxM=; b=vMWUnXjbM7pQ0VX+rbkmdCll0h
	OHfKQDybdLzKWH0QJhJ4+zeFecIUSURh9YyR7EjUy/zHpFRV63bt+FAqcsBx9qdfkS6KfhGbj2qKw
	1a7uyYzfBlIZSvbx4EAyDyu6mJx6llzwB6LAp0ZiRIQ32YNUk0b13OYejqIRTJlEQZr56816Yrd9j
	An60SXdVhbVb7mzd0G/BnsaIdv7SBeivl38SNFL3ZPYVZyU4XRuTd5nBbm4XutwgZtAEc3CpfnByW
	nVkNpfAGvGKzo7nMHmBv8busdKQlPEmr7Gvm6+fRL2Xt70wYH8wf2PI4ho7HdMObgiV4hnHD7YjKm
	PDKqb8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGziL-0000000FXKl-34Wf;
	Thu, 06 Nov 2025 13:07:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGziI-0000000FXJq-1zn4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:07:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47112a73785so6131555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434460; x=1763039260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yLyeCjgls6cM1HvoV4Agizj+GB/rHC0r8rByuRqqxM=;
        b=ByKUlULLxmx4XeDH9HgukvhQ9O63Zt3I0b4wyJeNTCn5Dvf7CBiJpJCKrgKs1CkPrL
         LRoaSs9XAvJ0WeXmAcSrvfQxtXtCQjiNenptnkuyySjt9Z4Odeo3lhd0SSfzOvG4gtX3
         JAMKGCuweTyxsVn7ktT6p6szgcMA9qzc6u8mXPV+MJLwhPLWQZaIfzb9aiUcKMJBVuVi
         HKBPKeQVHMHkeFEUmvUh6cqYrohPAR/yqPJBOcqzEZ0nTtwkCR+EVPsCtwK6hC5F1u4f
         kN9c44YrQGwzkVq9tseIhtZAWP4FvfG+g/qeCZ8H9rzzXo3UqhOfW7jbR8PdiyKEBwwl
         +5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434460; x=1763039260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yLyeCjgls6cM1HvoV4Agizj+GB/rHC0r8rByuRqqxM=;
        b=siaxN+GUtxSc67vCrSJDbfaSCo/344Yd+QyOQ88ShVlPIZKJHUo1AD7RriBUlCse6z
         tEY4fIFjG+pbcq6/uy96uQWek4xmAxiHMSgEjMtvwQK3tYU6rdKBX0WeKwn9GXA68j6/
         AjXeEepwHcNv4xuM87gAY/HocBjW9/xBglylpLQ4FVCV2QzJRBdz2+bDGmlUPJZssWjj
         ebRCHGuU4kaaBGQfbsdQ7O5KcUoLncveRwDIF791/R6MEVnDf+jrt9fmX7xT66CbBvc+
         Po3u8fxkCRuWGS4Zo4e6f/JCuQBloO07+bet2d2gr7/K3E/6A4K3S7H015GghYgXiz6F
         0sxg==
X-Forwarded-Encrypted: i=1; AJvYcCVDBfnXogAwI/QeAP4Lz4RoSdD2KShMo2x2vb1gjkAGz5h1yllcMtDUm6tY280mXKwVoyoPcsQg4yjAVf3zvmSf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/sFyrc/verKLfdO3/zemuayJSkKdfTqCCU+MDzKVYR1KEhn2X
	vTieUjLMel3hRy0YG+9Cu28gQtppuEYBBt9yjfcHo0TBkQzdkffis6i/DjrxHnu7CTk=
X-Gm-Gg: ASbGncu8QNPEd/d+ngB5wBb7nYhrGbTdAL6j8cBiUyKZLtgOB57plDOKDOuld5jvJuY
	4wWWebRfN+XQV3Aq6DX0r468XsGHPZFQwT2Im0GwIxq0UAq7Gi3Flr3WZfo5kcJDsejrY76sDLG
	O+LtsVXGy40okts2PYYBkiBQr/7//EbsDiOYlAT+2J5HZXLeTZtnRtAIPvdUQzi2mAfruQB3GE/
	0u0wcVw+bWNvToGrf9MTB8cNNcsXD7kJexScTZ4ZcTVFoLWDIQh7n8zso8IviGFBZpTedjsZyBe
	xqF6+7oAWU8p13rYJNzjqtsWjdis/acFrQ32nb6z5Up8nWq1SiXVq8ax9m+5OXNoEi4+hItTLWH
	99ysdLgdBURQ4F2i8OLS9DFrnUT2440mqdjuQAjZuT2WwiyAlNeGCsp5oz2XKQZBNM1cl7YXJrt
	ncyXbnN71Ls5T4ysYGR/0ysHtLqmBPEST4jA==
X-Google-Smtp-Source: AGHT+IFAsKArlrU067DkxQxwFDKfyGP6fHe4iUyS/Bdq+iRDMjLgKkS8gLp/s5Zpe2BQhezfS1P8SA==
X-Received: by 2002:a05:600c:1d88:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4775cdad6aamr62589075e9.2.1762434459994;
        Thu, 06 Nov 2025 05:07:39 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e4d7f2sm15640615e9.4.2025.11.06.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:07:39 -0800 (PST)
Message-ID: <f324cafd-c466-4cb8-81ab-fbabac7bbca7@linaro.org>
Date: Thu, 6 Nov 2025 14:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] irqchip: Add support for Amlogic S6 S7 and S7D SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-2-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-2-b4d1fe4781c1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050742_550402_34EA1485 
X-CRM114-Status: GOOD (  16.68  )
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
> The Amlogic S6/S7/S7D SoCs support 12 GPIO IRQ lines,
> details are as below.
> 
>      S6 IRQ Number:
>      - 99:98    2 pins on bank CC
>      - 97       1 pin  on bank TESTN
>      - 96:81   16 pins on bank A
>      - 80:65   16 pins on bank Z
>      - 64:45   20 pins on bank X
>      - 44:37    8 pins on bank H offs H1
>      - 36:32    5 pins on bank F
>      - 31:25    7 pins on bank D
>      - 24:22    3 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
>      S7 IRQ Number:
>      - 83:82    2 pins on bank CC
>      - 81       1 pin  on bank TESTN
>      - 80:68   13 pins on bank Z
>      - 67:48   20 pins on bank X
>      - 47:36   12 pins on bank H
>      - 35:24   12 pins on bank D
>      - 23:22    2 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
>      S7D IRQ Number:
>      - 83:82    2 pins on bank CC
>      - 81:75    7 pins on bank DV
>      - 74       1 pin  on bank TESTN
>      - 73:61   13 pins on bank Z
>      - 60:41   20 pins on bank X
>      - 40:29   12 pins on bank H
>      - 28:24    5 pins on bank D
>      - 23:22    2 pins on bank E
>      - 21:14    8 pins on bank C
>      - 13:0    14 pins on bank B
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/irqchip/irq-meson-gpio.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index 7d177626d64b..7e718b07e960 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -174,6 +174,14 @@ static const struct meson_gpio_irq_params s4_params = {
>   	INIT_MESON_S4_COMMON_DATA(82)
>   };
>   
> +static const struct meson_gpio_irq_params s6_params = {
> +	INIT_MESON_S4_COMMON_DATA(100)
> +};
> +
> +static const struct meson_gpio_irq_params s7_params = {
> +	INIT_MESON_S4_COMMON_DATA(84)
> +};
> +
>   static const struct meson_gpio_irq_params c3_params = {
>   	INIT_MESON_S4_COMMON_DATA(55)
>   };
> @@ -195,6 +203,9 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
>   	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
>   	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
>   	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
> +	{ .compatible = "amlogic,s6-gpio-intc", .data = &s6_params },
> +	{ .compatible = "amlogic,s7-gpio-intc", .data = &s7_params },
> +	{ .compatible = "amlogic,s7d-gpio-intc", .data = &s7_params },
>   	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
>   	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
>   	{ }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

