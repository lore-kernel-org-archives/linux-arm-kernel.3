Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F73BC83F35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSn1ikrBu2w6g+uJ3D3dKbejXUUZcJbs+RYM3hSQgKE=; b=AwJWun8CihdqImyWJ7vtVPO9OA
	/YgEhDIFyKFEDZ6vFBL/Hxx2O0yqm/dy2fq5JB4pPa8/NtpPwwk/X+8GBrw146SMX065rhYEezmvb
	yjUo2jd8zndKLy/CMu3N9vciTatsBd0FTXYkR0vqpNFBnyHbRZOIl3cSDCjlqJukiJU2BCbUod5Sf
	ou4jC6SqES/MJopWUlPzh3MWbQpGZigQgyh8ynAGweuyJyGg+/Xa5aeTwowCbBWxy/Kd/etX3kNs6
	ZMh9+fUOPLT7jwH6hiJ6mE9AV/qKDG4f/wziVi+VnP54iRQCid274IVqUzppv3ut0bWdNsP6Jbr4y
	OitZkSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKbG-00000009gWr-3bDd;
	Thu, 17 Jul 2025 09:08:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJr6-00000009Z1E-2iOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 08:20:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so340000f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752740439; x=1753345239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSn1ikrBu2w6g+uJ3D3dKbejXUUZcJbs+RYM3hSQgKE=;
        b=a5iRm9dyXnxWTm8dYSmqzPaHCjQITN8/CPDJ52SrWbQmI13I0r5OUUbmnspU7AaESu
         j8POACC+TC/nWjkbtPXNKR1xq6Tz2dkSLo8qduGhwVn9eD2u7fmyJMrVycsw0MOiw8mG
         m9/Yu5KHJhuOurt8hnNqzejGWQBnNGE0vaP4vIpjYL59AhErY6oOY1D5p97FvbXgFStR
         5dvUckirozFE1gyJ76Mz5z7Q+VPjIaZ+7Dw0HJBkOyoLUNihtdx0biopnsh37x8+S186
         qjKGoX3eLzqx9OVpfT0b8WXFYU5Beu0kMnVS/PPRW2rukdTO4aqooGlmDdm/tyu1ZlyK
         OLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752740439; x=1753345239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSn1ikrBu2w6g+uJ3D3dKbejXUUZcJbs+RYM3hSQgKE=;
        b=g56irfVeZomu9RxMmji/TK2WBVo9iC2CQA/qRAIUkg6CYyiEYYvk7XeHT6LOj4yizQ
         53+jI/XItKZGiw5sjU9+Mcjjez/26ulZvcBOEy/uJhrNplIG3jfKCRWpY3TYH+Yq6+cx
         dAbdPI0ZTwapkWp+BnepxMqGLeaHaaLFyKMP32O5dkxqdxJx8y5jH4FfRTsqh/yfoeM3
         Xz9TGxR84v9/wxPznYR+1+xMZQuzH3NL4kj+9aBh9QqNntYJK7ZV25rMmmqkBSJBd0ZE
         RA23BlDdv7MrEOvXLA0z9+EOLGk7NYv5S39Cco/ghDwe4sij2MtwYz4069zP+Jefw58a
         EFgA==
X-Forwarded-Encrypted: i=1; AJvYcCVuveC6qd9ABeT/AHD9Qo0WqdHEkgxUhbOi6ENCf4LXFZVIfpaafuscFXhSCceQ3V2rmsMHKdA8chxfoAf1bUgo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/AiqUcPapGOadnfWO1UNrkjPJ7gwQgtPdaiiROU1kIUgkY/x
	zz9iDwc5+ygErsiyrapk8pdiAR8D0MiQfhtqJWrYPn3+/4+gDeS3tyOUOCwOiULAYG0=
X-Gm-Gg: ASbGncvo8vZEHsfjW8qZBGNdOBFRH/UPvk5kkztibU3se5y+eYiPiIjKuJHzV/nSVuG
	0ArrVAfL+uez/N4cNm1y3H6CFmiN0eKhI2zI5+vk1VZcAmO07ymQt0SbjktHhEddcIIuIhRzLbb
	E86BHe+MIyvCcUygPE66/XUne1nbQI1jMvsX5eC5j9IZHcjHqXbOoeNk+JyaoXoCCZD6oEFdJFZ
	IrezNP4QNaJq3GY5N0Md9CqJqgOudj9pF+iG3Wy0d2K9rxeyyU4LzD/zeTRCA1CZRhQBOxbCGTn
	Wf21Rz/l3olpoEfnkcyNCKtVOBwIWzIfGlQ3tIOHjD77uMXiZ20gXxY8qz13Ka2QiqZ//KU56jT
	mV1t9llZW1N9F7265gW6MYMAexGwcPk4U5WD77EeCgYkWO0EoO5dZ0rcUXppemyAYrYzvSowy9Y
	jq
X-Google-Smtp-Source: AGHT+IFrAHuwDARLY/8Ay2Ov5spI2j+L1Q0PXdz00Ci8rMXPWEOFk1gUDBGwxIvEnn/1FaCq6ZYz8w==
X-Received: by 2002:a5d:6f0e:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3b60e4c5212mr5057459f8f.9.1752740438729;
        Thu, 17 Jul 2025 01:20:38 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:37e:ce58:94c8:a752:de4:96bb? ([2a0d:e487:37e:ce58:94c8:a752:de4:96bb])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm20214519f8f.71.2025.07.17.01.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 01:20:37 -0700 (PDT)
Message-ID: <14c91ee4-3a09-4ec9-966f-0d563d7c8966@linaro.org>
Date: Thu, 17 Jul 2025 10:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] RK3576 thermal sensor support, including OTP trim
 adjustments
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ye Zhang <ye.zhang@rock-chips.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <aHgHxR1_Gzu8Dwbm@mai.linaro.org> <4178173.5fSG56mABF@diego>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <4178173.5fSG56mABF@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_012040_721647_B2719ADC 
X-CRM114-Status: GOOD (  21.25  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/17/25 09:21, Heiko Stübner wrote:
> Hi Daniel,
> 
> Am Mittwoch, 16. Juli 2025, 22:12:53 Mitteleuropäische Sommerzeit schrieb Daniel Lezcano:
>> On Tue, Jun 10, 2025 at 02:32:36PM +0200, Nicolas Frattaroli wrote:
>>> This series adds support for the RK3576's thermal sensor.
>>>
>>> The sensor has six channels, providing measurements for the package
>>> temperature, the temperature of the big cores, the temperature of the
>>> little cores, and the GPU, NPU and DDR controller.
>>>
>>> In addition to adding support for the sensor itself, the series also
>>> adds support for reading thermal trim values out of the device tree.
>>> Most of this functionality is not specific to this SoC, but needed to be
>>> implemented to make the sensors a little more accurate in order to
>>> investigate whether the TRM swapped GPU and DDR or downstream swapped
>>> GPU and DDR in terms of channel IDs, as downstream disagrees with what's
>>> in the TRM, and the difference is so small and hard to pin down with
>>> testing that the constant offset between the two sensors was a little
>>> annoying for me to deal with.
>>>
>>> I ended up going with the channel assignment the TRM lists, as I see the
>>> DDR sensor get a larger deviation from baseline temperatures during memory
>>> stress tests (stress-ng --memrate 8 --memrate-flush) than what the TRM
>>> claims is the GPU sensor but downstream claims is the DDR sensor. Input
>>> from Rockchip engineers on whether the TRM is right or wrong welcome.
>>>
>>> The trim functionality is only used by RK3576 at the moment. Code to
>>> handle other SoCs can rely on the shared otp reading and perhaps even
>>> the IP revision specific function, but may need its own IP revision
>>> specific functions added as well. Absent trim functionality in other
>>> SoCs should not interfere with the modified common code paths.
>>>
>>> Patch 1 is a cleanup patch for the rockchip thermal driver, where a
>>> function was confusingly named.
>>>
>>> Patch 2 adds the RK3576 compatible to the bindings.
>>>
>>> Patch 3 adds support for this SoC's thermal chip to the driver. It is a
>>> port of the downstream commit adding support for this.
>>>
>>> Patch 4 adds some documentation for imminent additional functionality to
>>> the binding, namely the trim value stuff.
>>>
>>> Patch 5 adds support for reading these OTP values in the
>>> rockchip_thermal driver, and makes use of them. The code is mostly new
>>> upstream code written by me, using downstream code as reference.
>>
>> Replaced previously applied version V5 with this V6 patches 1-5
> 
> are these commits available somewhere?
> 
> Because git.kernel.org reports that
>    https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> has not seen activity in a while?
> 

I just pushed the bleeding-edge branch


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

