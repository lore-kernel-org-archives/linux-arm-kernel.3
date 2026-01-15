Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50778D3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYwWw8VV+pZ5kRe2p0etswhnBCYm9kWmCY4NPdnKmVQ=; b=nuKyBU+MT3wQV/JVtzgun2osf0
	isXC5dvD5CNRt8geuxcmhc19DpNUqw4dpfTHD+5cdPxSAr1OqNcLevqAYTkccFcjOu8v/r7ipzAb8
	ZkSUBhNN3/6QUmPYN0Xnr9tZW//NK2Iu7bf2M58gMQ2PDLfCONhOBRzJ7zz4wiLT6Rdi1KBtrpuZC
	MnI9mlCxhh/wzrzo+XrQffAtmoVmYvsFY1q9KhQkSP0pcJkGUEDDruJU9Vdyk6PXVcOZq9z+pkUta
	1k46Fu26Az3wfgFbdEjK8GqG9jzCgReRF0eHnEyUguRRLqnhU+Q1FDgfEQjoYU724FOz0EPzj0V2D
	aGGqChag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIJ0-0000000BxeB-0HjQ;
	Thu, 15 Jan 2026 08:02:10 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIIw-0000000BxdS-0vjg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:02:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-432d2c96215so477708f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464124; x=1769068924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYwWw8VV+pZ5kRe2p0etswhnBCYm9kWmCY4NPdnKmVQ=;
        b=P9xPvjBNaz4KBNOb+RO+/DyeSkLSHIgQX39Dp/Wx99kVysLobGmA9xHwBu/FNg+o+U
         +WKZ3iNt8f88GAS0jUP8+aaf0/LqnVFcQplyJpkcQ+dnAf95J2umARwVL1Jr4Bx86ddP
         AEbmyTVPvJxbLwoaIE4NnAU648iyQQrxLzxU485Y6Cw+JHDeTCyswB0hCBNvDHQwrUBY
         9VKuhSDsyCVjbnhnyx1IoA+A7d+VBg9h22B21+/obsrN0LD/sDpqMPzHKEQkcYobwCuA
         NYv1DgZ+YqeXcu+SMD9rmhy+AXZEIYjhsG6X3lVfydLEgfB2W/9tENHcf8qeEZ3rK3be
         BeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464124; x=1769068924;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYwWw8VV+pZ5kRe2p0etswhnBCYm9kWmCY4NPdnKmVQ=;
        b=OEU0aWMaahAcCxQL9nQ2tO1ViQ8c0CoI53nDUO47eZ0aBlUTQXVKRrF6W/3Zf/Cygb
         bGRtMSWNzAasG2dSBlnNi8N/pFcnySw2kHpH/8QEGGYsqMKf4TSYeYU1Sl9ylHgZQ1X+
         fxrQPXZ4zVW/yIInNSlnS3ccR6IAJdMVrDu1irBgmXaEI3yeR1pqxmJwPgovDiDy/kRa
         a6vDFdJGyXpsGUT+lAj+ilHTH95gbIfaFSshbrqm1A1P0MXSipE7oCcEhKrP8pkgshpd
         U5nP/Hq+gsvUAMAnaAActj6zJv2GKL1Bl4ASaVg9eSYuID/OB/aZeXrTyHco8qmExcRS
         e5+A==
X-Gm-Message-State: AOJu0YyMu1vtnjUcPwaYtH6Pgh2Q91LWlJSVPnwkXapDccPHG2ai+7jc
	J5q8g6sykm3Jmo7lQZu18cLZP01JU8ZqXzt9Og8vNJdkTIsEq24Mw9ccanveOHGGB5+hKpF2QuY
	vrGNYdWNEog==
X-Gm-Gg: AY/fxX4Fb7jgm3vhVivbJjbZAZFjLGO3RjHWxctaLBGpNM8npVMcj8guW8jCuPH4q48
	SVM/Nrui2J7EWscq51qopfMULHBNoDzdNlNEoV9p+YK6YClPabh/n4bDhOF1y+zoZOPvuH00Le+
	OUcK0uESnZPJBmvp4F4z8dFoBo+g/A00gC3daF0CMimIedVFB/67Oy6VFwCtQ69kwBS0/z0SQfd
	kYGa+pX3YkgjqaWeRfal7wIgBcLjBaR7Fzjs3Ep81aFK0o+wxhjfYdVpX76FW2zt0t4WbhW6Flk
	z9L+KQKKyLQxb0BKCPFO2ZL5EuhUxKNAtUSvrB3YcLwuSOmHaqIhy1zP90325hYJGbhUmY0MV9e
	/uwBPIckCmd3J7AQ57UXaE9PgyYioLKfwM98w/1SPZLDMpG+TwyiteHxOU+59aMCab3N1h2l9De
	enjKOFX1CYZuJJP4hpNKp90xHYJFbLWUsZBdAjYh1vHWqMJp0y+jRVI/q+UcDuh+A=
X-Received: by 2002:a05:6000:1a87:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-4342d5c3abemr6883834f8f.40.1768464123399;
        Thu, 15 Jan 2026 00:02:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a650sm4300283f8f.4.2026.01.15.00.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:02:02 -0800 (PST)
Message-ID: <00960678-8907-4e84-8b24-e5cbe18d39f5@linaro.org>
Date: Thu, 15 Jan 2026 09:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] arm64: dts: amlogic: assign the MMC signal clocks
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
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
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000206_308708_DD651C1F 
X-CRM114-Status: GOOD (  12.74  )
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

On 1/14/26 18:08, Jerome Brunet wrote:
> The amlogic MMC driver operate with the assumption that MMC clock
> is configured to provide 24MHz. It uses this path for low
> rates such as 400kHz.
> 
> Assign the clocks to make sure they are properly configured
> 
> This fix has been split into multiple changes to get the Fixes tag
> right and help stable pick up the change.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (6):
>        arm64: dts: amlogic: c3: assign the MMC signal clocks
>        arm64: dts: amlogic: a1: align the mmc clock setup
>        arm64: dts: amlogic: axg: assign the MMC signal clocks
>        arm64: dts: amlogic: gx: assign the MMC signal clocks
>        arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
>        arm64: dts: amlogic: g12: assign the MMC A signal clock
> 
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 7 +++++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 9 +++++++++
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 9 +++++++++
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 9 +++++++++
>   6 files changed, 43 insertions(+), 2 deletions(-)
> ---
> base-commit: cd3b654a413c14648d0074ca160da62e4e29ac88
> change-id: 20260114-amlogic-mmc-clocks-followup-a0733cc59283
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

