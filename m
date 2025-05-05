Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8391C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=; b=J4FOBz6QgCJW7CPbmS/JSTMNLe
	WJAG6hS0i2Sd6oODJWscjONq5rocXRKEz91wDKFMHsy422G/uLxf0j5winG7/6eQv8OBIumCfRmuu
	ezIWYExhvYHsqOePZASCaQb07J3aIWaSSV9iJtlFUmM+ytf7seknpx6CHwXdbH2pCzLiHa864o3e7
	DffzDFn8EgqF1PieSLO6WHWQsWY391+wOl/EvajfwKGptwZW35h/NnUwejAJv87gRPjbhdhOpUxVf
	96sUPNSynQ+HMC5lb8PkLdBT9gSULtruUtH0R5SbY67iCqem0de+bOs12K275E1sW/Exb0gO7hPQr
	Q6mXvKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuz4-00000007K9c-0Xaa;
	Mon, 05 May 2025 12:31:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuue-00000007JFp-0udh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:27:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso26421385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448030; x=1747052830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=NsEa1LMAzu71gR/fd4PKHngqbvIdZB+fhs7grR2bv79Ba2fAwvGXfA8RFpH17Xpfbx
         IkosAzAq6ADS9saQIGDFrbR228iOICLz1gPHUNQ0tKkk57QGb3MvQHvVI9tmK3/qbMWh
         oEjJtrBzsPlcjvRurtWeIRMG/OQSack52IzWbb6We2GD4iwMYhuxVUK7y4kkL03w32Eq
         1htOYEMy16IQpIjTww8dm/FJ//UXSYcNvTU5+iQOLYkl+CXKQBe0Bg2IsJK4qS9A4DsJ
         zBLYyJvrAX7B+vkI/sbkW9xUBn30RN1d05JRmuwm8vW74M2T5dMOoyaHVoztVoTEbHy5
         xKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448030; x=1747052830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=RFmJhj4STW7szcpNaiDhNgeGuZ79oyQLVzbcjjpSlhewuFXaFuHzWCkqtDjHTE9cce
         XEm4Fv5vUNc0Yc++rlSrVy6uvQOa0RMCuHn8kTno7mM7e1LUR+JX1Ze1ZrATU+wVdEnN
         GaYm+OgaCOmLBR4oM1Qa25sqR576kqYxRbHtgzKadrHaNoUF7iRzq59H9AfpsiKhGbw4
         iPL1czVhE4ur1DTsriMbDajDpi6dhdBV92CVjBU99GPmSAHguAb3MvBGRdpkxUI3zyg2
         CgbdSVo3B4CYdSiU2XzEjs5XnppW8IEwTCVLZmDUdVxeIdjrchlzloxS39TcgVfASjDQ
         /LcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGen812oTQOMw81bqCHDSxTFfzU8iy9eARY6cyN6SGLTIyLtE6U9xw9yRbRS7V0l5j639s0ApHKcdf3b9Ux07@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc1eVaXLhkCBg1ZBCyyiHLXLb20JYv9fpGj2t3EUeDV8jCTs9/
	I2H3IthmhgsuYGPYLg/YxmFT1PPa0UZ7SV5otKNOujs6B0btQ1CzY7Z+mAfXtnk=
X-Gm-Gg: ASbGnct6z2iKlv4eWYH899gHy37kc89cWofT8sRL9GSRGhySuaefWaKrr8BJpFmxmGy
	hbZxsqz5o/c0Ki1uLqzr4SF8s2R6JW4WMWQy4EVVy/prIgZBrXqcPubTG2zuGDmKsBXJ2F0p22/
	/vMBSj1/LhRjIx6t6YH9NnPYZJ0Fym98FgA4v4L/qR+FuO2509zXYNL0WcQRu733qwk8CaTO2H/
	sOqcLR0cp8wKxUniMGQ3IVVYHsi1qVzn7hO9RWjpzV27OzWHQpBUv7K4FJBEpW7pkBX308da7X1
	aiHD8cL7ygeSg235ras2k3L3QOgd3BrwOTgCagXzjSHeE8TCG4Q7SQJxxLNmQV6IRDN0O3jTJmS
	pEk6VQUwDzYMkRyV2dA==
X-Google-Smtp-Source: AGHT+IFm2SyHRklCMik4gXiE1LX4P+NZ/5+Q1oS9l11EEYCjGjJr25WUs1UtRqMbm9RVF5FQ86htag==
X-Received: by 2002:a05:600c:a0e:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-441c48dbf8emr63030125e9.15.1746448030489;
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm133485665e9.40.2025.05.05.05.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Message-ID: <75104e42-282d-4a63-be0e-07a5c6fdf276@linaro.org>
Date: Mon, 5 May 2025 14:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
 <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
 <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
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
In-Reply-To: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_052712_268077_59E597A5 
X-CRM114-Status: GOOD (  22.29  )
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

On 04/05/2025 23:03, Martin Blumenstingl wrote:
> On Mon, Apr 28, 2025 at 9:32 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 25/04/2025 22:31, Da Xue wrote:
>>> GXL I2C pins need internal pull-up enabled to operate if there
>>> is no external resistor. The pull-up is 60kohms per the datasheet.
>>>
>>> We should set the bias when i2c pinmux is enabled.
>>
>> So, yes in some cases when the on-board pull-up is missing, the on-pad
>> pull-up is required, but the whole idea was to only add the pull-up property
>> when needed.
>>
>> So I know the real motivation is again about the 40pin headers, where
>> some applications don't add a pull-up and still want to have i2c working.
> For SD/eMMC, SPI and UART we have pull up/down enabled in meson-gxl.dtsi.
> I can't recall if I have asked this before: what's the rule (of thumb)
> for having bias-pull-up/down vs. bias-disable in .dtsi files?
> 
> In the past I had to track down incorrect bias.
> It gets especially tricky when we don't have schematics and there's no
> u-boot sources available from the vendor (I know, the latter shouldn't
> be possible - but that's the world we live in unfortunately).
> It means that we can end up with one of four cases for the bias settings:
> - there's an actual resistor on the PCB (pulling the pin up/down)
> - hardware (SoC) default for the pin
> - vendor u-boot configures bias for the pin (but we don't know because
> we don't have the sources)
> - vendor Linux configures bias for the pin (at least we can dump the
> .dtb and hope that the bias setting is in there)
> 
> That's why I lean towards having sane defaults in the SoC.dtsi (it
> seems that rockchip does the same?).

Right, but in this case the biases needed for i2c is rather easy to figure out,
and the very weak 60kohms on the pad won't affect i2c if a proper PU is on
the PCB. So I'll pick this one, and yeah a similar one should be needed
for G12/SM1 and newer SoCs.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil

> 
> 
> Best regards,
> Martin


