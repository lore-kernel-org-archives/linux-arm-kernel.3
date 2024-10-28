Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A31D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WSoUlcilR10/7Zye998C2La39OrksNIeUhu2dsusHQ=; b=Ik+j0fwAf2Ta2nq7R81gd372Nz
	RIIGeMn8TUXsYMN86zX9TjL9lOiC1/7iCjgjqfoWtrDds7d24/fwcK1PPwnuIkcV0LPsG1cOgy9Zk
	KHuKQmqTv/gvZ3KEDMeJO2WGqQoHLhvEVBTZS58bOPHCbF8b+P2QzWMnJ+UUjelkXfZeFKiaOTSvw
	z+h53ivAsUfuo6LrGAgS7doH5aytF0pyIum03i/PFSG3XVQ9/C37mZlEOcj1iSomV2yVtYqbT4eAM
	68iHwVCbleMl9kqnwedYDCq4vEvWCk9QqU/ieZU7UZJCPaygGuvG1pjxKNa2nlncqayoDRBE6fQQB
	kBXhWc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LqL-0000000ACG1-45ko;
	Mon, 28 Oct 2024 09:15:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ll0-0000000ABVB-31EF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:09:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so3259055f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730106589; x=1730711389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WSoUlcilR10/7Zye998C2La39OrksNIeUhu2dsusHQ=;
        b=oHVR55qMyNznGBvzg+Yx8qWUA4Z0NdHfRbjKgHs6LqeWX1aKZmoQ+iSZVw4nUCW24f
         XgXg8KBU0HozPIO7SfCj+LtZpxh0LKIq19q/0LuiUHj41Z702sJ6OMDR0/hJl1PI5gQp
         xlAT3D577sNxrwe2eniJZNiVo5vwnpJ3cStulhoWzj1Lm5xATUVOHPti2yL1VsNNQJSv
         KL0d7Uh/nOIDU+0Yqufr8uZbRIhDctmDJGW2JaZQw+om3gBK0GtFw/QZFhw+09Y6cYnF
         2VydIuBXM/xcd76Gc10hWpUbYwFvu6+il/0wAdoYbt2wiQzjJ4uaFkkz56+rKEL9bDGg
         hS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106589; x=1730711389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6WSoUlcilR10/7Zye998C2La39OrksNIeUhu2dsusHQ=;
        b=cR4nlsNT+CaTfiYW1KyPyqnYqL0AEeeQVKyk/zlR8yjWCOcWtlLLa9eKJVrQQddHP6
         pZOLLOER0WbL61Y/dVYjAVogfxJ86Cf8gBoVzx8XynMwEdZl0WWidgWsWoSByQpGVnUd
         ylgrLeWhKoT0jsBwed/KvEYnLhjotWo9cgTg3BxK4F11vaRQ5nBQSYj4/xvurnDR26bJ
         knW+eUkchiQ4/fuK/6y+WjWGWyglGOVj7XL2ZCLaR2ed4QcUGO0zBrRtI1hSew/2U00j
         PI/NHmG6jDNJ3HPjZyppz+o0jDjIiSCjwrPWfnKqzIEm33jLRb7om/IEpdBqvHHp+AYH
         SBPw==
X-Forwarded-Encrypted: i=1; AJvYcCU+fYlih/CqUr/DcYzNT2y4jMrScsCkJ85pBkPXJKKDc3bLypWOujnH7lAtC8yL2mXVB6Ht/Fsa6XXw6tOwbMzJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCTGykx3/j9sCdl+7t3kFDVm3av65/i+y3RdcH1Zlb+ReRDwT
	JyURWMN3TYWd2qvaOkZB8vXnyDPkBExPpyQ4lkIKdwgd3PJouXLGUJGC2t9IXhc=
X-Google-Smtp-Source: AGHT+IGbPSgHOd+5IoVfmKyOdhPyi6YNnIbge2Mu4Zhd8I9c7qhNtGSN9F6GBe245KWWr9fvZyKAoA==
X-Received: by 2002:adf:fb92:0:b0:37d:2e78:8875 with SMTP id ffacd0b85a97d-38061224176mr5337702f8f.56.1730106589096;
        Mon, 28 Oct 2024 02:09:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b91d36sm8849790f8f.95.2024.10.28.02.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:09:48 -0700 (PDT)
Message-ID: <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
Date: Mon, 28 Oct 2024 10:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
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
In-Reply-To: <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_020950_792859_6E804778 
X-CRM114-Status: GOOD (  19.87  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28/10/2024 10:07, Xianwei Zhao wrote:
> Hi Neil,
>      Based on the current discussion results, GPIO index macro definition does not belong to bindings. If so, the pinctrl driver keeps the existing architecture, and use numbers instead in dts file.  Or the pinctrl driver use bank mode acess, this may not be compatible with existing frameworks. This is done by adding of_xlate hook functions in pinctrl_chip struct.
> 
> What is your advice that I can implement in the next version. Thanks!

Keep the driver as-is, but move the header file into arch/arm64/boot/dts/amlogic like it was done for the last reset controller support:
arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h

Neil

> 
> On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>>> ====><=================
>>>>> +/* Standard port */
>>>>> +#define GPIOB_START        0
>>>>> +#define GPIOB_NUM  14
>>>>> +
>>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>>> +#define GPIOD_NUM  16
>>>>> +
>>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>>> +#define GPIOE_NUM  2
>>>>> +
>>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>>> +#define GPIOT_NUM  23
>>>>> +
>>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>>> +#define GPIOX_NUM  18
>>>>> +
>>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>>> +
>>>>> +/* Aobus port */
>>>>> +#define GPIOAO_START       0
>>>>> +#define GPIOAO_NUM 7
>>>>> +
>>>>> +/* It's a special definition, put at the end, just 1 num */
>>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>>> +
>>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>>> ====><=================
>>>>>
>>>>> is exactly what rob asked for, and you nacked it.
>>>>
>>>> No, this is not what was asked, at least according to my understanding.
>>>> Number of GPIOs is not an ABI. Neither is their relationship, where one
>>>> starts and other ends.
>>>
>>> I confirm this need some work, but it moved the per-pin define to start
>>> and ranges, so what did rob expect ?
>>>
>>>>
>>>> Maybe I missed something, but I could not find any users of these in the
>>>> DTS. Look:
>>>>
>>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>>
>>> So you want consumers before the bindings ? strange argument
>>>
>>>>
>>>> Where is any of above defines?
>>>>
>>>> Maybe they will be visible in the consumer code, but I did not imagine
>>>> such use. You expect:
>>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>>
>>> No I expect:
>>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>>
>>> but the macro should go along the dts like we did for the reset defines,
>>> so perhaps this is the solution ?
>>
>> OK, so I said it was not a binding:
>> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
>>
>> and you here confirm, if I understood you correctly, that it goes with
>> the DTS like reset defines (I assume non-ID like defines?), so also not
>> a binding?
>>
>> What are we disagreeing with?
>>
>> Just to recall, Jerome asked whether you have to now use arbitrary
>> numbers in DTS and my answer was: not. It's still the same answer.
>>
>> Best regards,
>> Krzysztof
>>


