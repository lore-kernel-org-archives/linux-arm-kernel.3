Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E6CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th8LkjBfkv7nYvFuNNGaT8FWdqcCdRHWy+pWo6pVRT4=; b=fxSqsdVRfB4pSxI9KLfFtmPPEJ
	kutoG+PMH8eHDN794apPQgToPe2ci2c5A2f5DEJn/Wuh96bbIspgZ+L+978avTzhQCA0RFgGi0JnI
	TV0+/W6cX7Kg72wES5eY0kGatwoNVNE+E9IoIsZ6MD+JB8j7wYEj6jRo/yMbWtxPZgWlESxnve//5
	uaWmHWGXTbhm2HUj17QfPqSFKZ2ZBpkBlxMMMwvPvzDKT+/1UYByzfHtgqP8zNb3BX4L+oN+G0cVh
	lruw+2PIZfrZvDXC1HHb5MZwvQgZYaVHboe013K6QdcD4Ome4pkEaTu7bcSVMjtxJ3ZiTZpH/9RQi
	m0EM2A0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA3g-000000028Xx-3uJ0;
	Tue, 22 Jul 2025 10:17:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9rP-0000000267y-18br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:04:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso54318015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178674; x=1753783474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th8LkjBfkv7nYvFuNNGaT8FWdqcCdRHWy+pWo6pVRT4=;
        b=Q2anXAKrnoEru4X3dvRfdOubp9NzXxaS6vNXtHGCzxn6udwZbm7mi5BOTQlu1a7Gv2
         Fq8/ktRIqh9Vfwx8uZRrhTZUnNv9fHNf4G3A5Dv0fGKtaBaYAE7AjU1+yzg40uBMrl/X
         Yx5cUbPeex9rI11mEI45VCi6buZ5AVvkt/K51GVnNLa4j7Dct00jEDawKLvztwjRaIup
         qqnBeEfq5Y4O5PUttCrRE+altxbvEbbgW/tDUvRlBXTNDDF2QyyRUUgV63ISR0thjUOK
         UYZzVnZ9cYCgKr7LXKvR76BGThvLx5F6MlU5xmXQmpDKVDvnCA7R4sL2qc9UWqw5T0No
         Ckbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178674; x=1753783474;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=th8LkjBfkv7nYvFuNNGaT8FWdqcCdRHWy+pWo6pVRT4=;
        b=pjztxwtXHUPAyj+z4l6cPuurjr+Sbkv/xsGDwd++oUfahK/rphwuW1ZA1WawcMUTyb
         beaFMZf/M0x6h9czLrykIDemEljJmEx3E4IFyGTxuA6EkpMluL/a8imCmuhYhQn6A2VG
         pkxkFAS4qkvsqBUd0MdSneu9mOvD+nRw7rJcOmSQWF9vdM7uxhaNkRAjaocS+zRRqoAl
         ujqHrYJxRCXS9/5VDjSFFbo2OLPcpYy55zLiulTUuGJuy3w1+DLrKpjmiFxwUKFnodJM
         6YyVdTvI640Fhj3/cB+qGWpyZZd4UWFrpuh9CemWUI8x8toKvEHVgGoR+NMw4Uad1T7K
         jnOA==
X-Forwarded-Encrypted: i=1; AJvYcCURRcx0vKls3vpzrsMsPr0AbDVZf8C5JvyWXFSnUFwvCYhCpVDOydl8WosDw7WJY4a+b54THVtF1NzGmuRVj6wW@lists.infradead.org
X-Gm-Message-State: AOJu0YwLApy9+WnvR6/ny/ZMbHA/NGWKlYF1xkklr679+gn2Q0ZttLEI
	gbH+dFz7s7wiJrZpWm2CKDrb/A0usgej1zh28YNlroOlNgzS/Fgd8SjXmP3zaG8yL78=
X-Gm-Gg: ASbGnct8PC4wRp+Vs2mqrqn6vMUR4EU9EVfOPPOeIgMm3v6rHB8Lk58L/tZ9EBR2J0j
	0/ohPsL4C3mSXqDpw0MVh9fqFTgZmMRKb2NhwABoLzg2hAS9NkWeVq7iL3XJIyBI2WZDzw70ZB1
	WER8Xwok2i7CrafeKksw3lIzhBD8PvowCSWeg6r0xv7ks2KbBYI48ddpAiNc22XICYXMmkTOrSF
	CFmth8lgo4lg/rd8OGDO4sEKXlcTr8+Fcuu2Eby+Yn6+pxEnmXoGIc4V/gjiSX+iwOuJFoCPuXi
	VIdCkk/2J52url4f94gKyYvM5Ms5HirS3CpXNI53i39qvqk018PePIfVEKmNofWbIdzfmsK/iKv
	+iaWERqAZ8ShRmSpPtbwUbqEuqy9XhD0BVZx+Fk/zYDiaUqSsE0Ln/ll9P2I02X68dlyURerqsr
	Q=
X-Google-Smtp-Source: AGHT+IFejVtWV8JytlClgGlAbQ/sASXBqbtoY0roVwh48A/QZMJB/xCFqE4nYCMj0t7+saAYfB6ttw==
X-Received: by 2002:a05:600c:4688:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-4562e3cbb03mr196476655e9.33.1753178673594;
        Tue, 22 Jul 2025 03:04:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f33f0sm184133915e9.2.2025.07.22.03.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:04:33 -0700 (PDT)
Message-ID: <942aa300-fc49-47e8-93b7-85fd1e1fd123@linaro.org>
Date: Tue, 22 Jul 2025 12:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] thermal: amlogic: Support C3 thermal controller
 driver
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liming Xue <liming.xue@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
 <20250718-c3-thermal-v1-2-674f9a991690@amlogic.com>
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
In-Reply-To: <20250718-c3-thermal-v1-2-674f9a991690@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030435_329361_19E19B77 
X-CRM114-Status: GOOD (  16.93  )
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

On 18/07/2025 08:37, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the thermal controller driver for the C3 SoC family.
> 
> The main difference compared to other Amlogic chips lies in the
> offset of the sec_ao base (referred to as u_efuse_off), which is
> handled differently. Everything else remains consistent.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/thermal/amlogic_thermal.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5448d772db12..d1b08119c818 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -226,6 +226,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_c3_cpu_param = {
> +	.u_efuse_off = 0x108,
> +	.calibration_parameters = &amlogic_thermal_g12a,
> +	.regmap_config = &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -239,6 +245,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,c3-cpu-thermal",
> +		.data = &amlogic_thermal_c3_cpu_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

