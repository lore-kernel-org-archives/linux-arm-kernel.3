Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D96D29FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3BIAKEVNAk9w++/Pw/AkpPOpkkgEFQigQGBuRd+nh0=; b=Vc3k3QIlYVut0rbgiM3Sprj0to
	yViWPcNsbMCCS0K57fxM2qx7Vjm27jZ8ekuN/Ay/4F1jhsA/4THhbhim0OG2fyTm3FTeBjVq6Ll3W
	7YTHWc9Fysb5rb1u0BMqG45RAcl2S17uTaNkn0NxXh006qLYwKi7giSZO0MjPd/GiFtdNwBZxIopk
	JgPATSe7HUwv1HWlQ8M5ZVB23YewANZ5QZaNiRVI/smvD/oE2Rx/tk85XsEbUWs/Rbw4HfOOry8ov
	OeTBlHWG+NQ8C1vRqUJa0NKDxEabHIW6wbcbCBN314dpNrt8hGKLwMztCGSK1L5r9cqGcPUrlYjmc
	PlEjqLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzf7-0000000967D-1UA5;
	Wed, 14 Jan 2026 12:07:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzf5-0000000964m-165F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:07:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso68643175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392461; x=1768997261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3BIAKEVNAk9w++/Pw/AkpPOpkkgEFQigQGBuRd+nh0=;
        b=J5HenwgRGYIc7KAdA3LglSlWBrijEEWhl3UTMh8RptsefbSUxY0uZ+L0cHEwdc0RhQ
         r+JYNwTiGRGkbjJh3iBuCmhnzyfcVoV4bLXL/vE9VRWFFzXhGfTkzqfjIFeLNtdcNnmA
         23OenM67myc2U4kYRio1FSb/fMiWo+RXM8DxLC/L165EvXvsceY98n6yJYVSEm3QCcg9
         q2GZeSYfdJr/KlJ1rLaJzDhnsarFERxeYsDKXiKtrGTnuy9tPMHYNzqdXphn3X4iDg8Z
         n6hKlqDtng15Dq5zC3OFdgoQSKctkI4HQaURrz14cOxQy30OWdmViThzAD7xL+g2vMrF
         uj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392461; x=1768997261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3BIAKEVNAk9w++/Pw/AkpPOpkkgEFQigQGBuRd+nh0=;
        b=v+DnUf1y0DEka6B6k9GvJ4u++PWPbuFfPys4W59ig7lgAFBHvdC1rCImFpg75xAGYA
         gRbjSA5BpKodApN0b3v1qTm1sm4rRpea/p/CgTqqMXaFBIk4qUHvwC+w6rsRR8ZJGxlk
         ACRiw0QFWbdTcqw0NZGLiXkh5mPdOxf8hBd1d4EtP1E22R+xzrsUxOKjADP4tBgyX+PE
         3eqysonJLFPmzwiWjI4Rmy8hOMHm+7hNYRSqm0P5t8Zcwo0DEabWpdqTjhmNDv79cJRR
         v5mHGDLo7HsrhyfqJN0bUT3m2Z69+PhVE6QmnzFfh1R1yNBTgWc+r6YtW0Sm+fEaZqET
         C6yA==
X-Forwarded-Encrypted: i=1; AJvYcCVGkUBrAPoFpiIaPWsJOROal4/sARWDtoZOhcenwVatJyGbm7NILbZ/QuvVgLCsbilnAyYt4h9dZpFZeIlSVOEh@lists.infradead.org
X-Gm-Message-State: AOJu0YxktgI2fR1SN2qWBRsYoZnfBH7O44rB9RpY65u6kYtV0GHjoem8
	YuSLP6bYWMjeYGm4WKuNEL5P3ibho7sz9os4aseB9Tq2NQ/vvT1sIA+NaTpk2p9APDc=
X-Gm-Gg: AY/fxX6GBhSnlqHHa3hzFfqU2IRGAijG5CKFjLTnZSNa8rBe+pY2Bd1csSwtH5FW/QM
	dm4Pi0dkklCOHzeuqXm68B0pQL0BTYyMPPxjZrbNgaYldB4qH6ewg+f00QW2Z+a94rzDj5HrpIv
	g3gRUk51M5WTd0wyhFs3clMGrOq/FU4TFCkWjlteAIO7/hbW+1pMBl7VsyBHCGvOVgDmuZhu0aA
	p67JD6mSjA7Nalv1CzxGbIyaioz+g3M2O8e2AKbYF7d8O/VGpvVveoidg1KVrKvDP7rLqcvu3OA
	1xB7hgfg3WoDXMkvXx5zl0N9W7gyWLa5qfKouEypQv7YpRyvsQWKgxWS/xtXTEehfYzcSdVpdX6
	xBDF+llglZws8Z+rRN7F6ZpPuHl3hKHdrdEHUj0FekJ9EJnM6B19RZCQK9yXVaGpbFxTkcAW4sx
	a+MzRJSwz3TAwY2LG5VQHryDZnI+0FGub5Gr5OB2AMqlx55hXI7IGbG/CNxnnrDoc=
X-Received: by 2002:a05:600c:c4a6:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-47ee47c8db0mr22733155e9.9.1768392461180;
        Wed, 14 Jan 2026 04:07:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b8c9bsm24625715e9.3.2026.01.14.04.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:07:40 -0800 (PST)
Message-ID: <695594a6-9c7b-4c9c-8134-f42e8729b0cd@linaro.org>
Date: Wed, 14 Jan 2026 13:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: amlogic: s4: mmc clock fixups
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
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
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040743_330905_A4F220FD 
X-CRM114-Status: GOOD (  15.51  )
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

On 1/14/26 11:43, Jerome Brunet wrote:
> The patchset aims to address the issue raised here [1] for MMC B.
> 
> While checking this issue, I've found that MMC A and C also appear to be
> improperly described in this platform's DT. The 2nd change fixes that.
> 
> To be on the safe side, the MMC clock should also be assigned on the other
> SoCs. More changes will follow once things are sorted out for s4.
> 
> [1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
> 
> Changes in v3:
> - Dropped useless assigned-clock-parents
> - Link to v2: https://lore.kernel.org/r/20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com
> 
> Changes in v2:
> - Collect Tested-by from Nick
> - Fix some typos in the commit description
> - Link to v1: https://lore.kernel.org/r/20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (2):
>        arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
>        arm64: dts: amlogic: s4: fix mmc clock assignment
> 
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

