Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E97C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyOzPnDD5nV6TA3iG57NOHGaY6BlLamnSYD7hNHtszo=; b=1/H3AmNNYrcMlWwTHoLWpxOiZz
	PUZ/Kfaf0MmxtLzMV3I3K2Q8eME9luXKgrPyu5GqlNORPKQJPwVS6AKeO2ZMTmWSiPtzMxBeAC2zE
	VS19+Ax9xHYWVXSFywB3m4Tuk2YGnhtfbJjS2G8rGsE5FK+iHT42ehFG1JOoC0c54Dw+1IV+j6t3X
	XWl1Qop5bLlB0E2VcC5h3uWyxUPMFWgOdqhNQ4lmZAvcZS1hS5BEQ0WqRQFtcAE7TXAOvx9y5mcsS
	VUJ7HNkPvoyyafCZVeZrLtVr9F/5ROsSKwV5MbtMuR5eaHcPgT82rJr5Ah83T5qXJSGnYwWoAvG4c
	cJY6fmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQVJ-0000000GtRm-34CV;
	Mon, 10 Feb 2025 09:55:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQSB-0000000Gsj1-1Nbg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:51:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43944c51e41so6895745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739181106; x=1739785906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyOzPnDD5nV6TA3iG57NOHGaY6BlLamnSYD7hNHtszo=;
        b=mWlwnsftDHNNu7f4OIxkyRxTMp3VK4CbiuHUsNjFtv7aYvq05dQTJkebw358AArfM7
         b4kb6rGA1de5iVI7C30B57hKuaxOu1fk3MEFFTdM05dQB7JJp578uwTYCXoIQ+S52gDl
         ODtHkN75pB9lLH1ttyaf4LRYzaUM2bLQXJtak1LlRR+02lMV4oiOal8HviJ2KNZ2O95U
         FotqGysPwocKO9bHuajq//UMk0PdOd5FRZCx0V+sUnmVU9KTytQWKmaWlnGZYfae1fC8
         SxS3/bsGtaAk6vHT1yNJIy0V0OhxS1qJ7dTzS49yDLQbPJ1YbWPlIjtbcd+vfyzTzw+g
         IdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181106; x=1739785906;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OyOzPnDD5nV6TA3iG57NOHGaY6BlLamnSYD7hNHtszo=;
        b=fxh8d/ILV8HdNU5x4rmoVdabSpyNjsv5318OKyrJJXH3jmsExoIvunWoWGND/PEwBi
         AswhjaKvGH839ur+J1renw2ZzwD9mm5jvKlmAbiK8s4489AqDNs7AQB4r3KFK6yQ8NIP
         h+tsNJkSypsau/1/QevHn5LosEb63lgAcYhqruqfSBp3kQK+CkocEFNg7Ua9ltxLVOcA
         LMHv/mJJWw1mOGUNwEVqUmJT3gOIdyJD9xM3Fj5hjrJE8lwF8S9QzZwBW2eeAtNKfFsl
         2baYKKoClIcPcctZDNykTD+2rjl2OGHkLsbcaPIPSmXq3D3TyqoFXQv+NOBRJbyyvBD1
         joXA==
X-Forwarded-Encrypted: i=1; AJvYcCWbIJhFtn4l00SkF7W2RXHbP9PUt1p+f4MGf165aomVzMJbHbSpxTSlqq7dvU/vxYE/UO8OumcBD2oDTEt+Kq/A@lists.infradead.org
X-Gm-Message-State: AOJu0YxB/5tQ4Eew47DufUSgd8RvrfMjmu/J9VZRyNTOEZGTMPKSkRH5
	7ZwReRcXFNphXcEd1BRIHNnzzBAA63Erae0eXP7GNMfPXBvCxso99cvljwlc9LZo/dYjEzxLlgb
	T
X-Gm-Gg: ASbGncs8dTinqoylgmk3Y/wYWRP8ranc7JAMDBl4ebLl8k7CPNn9V15Q2wRVckDgCmU
	Sd7M+ZYGUfPrU14DVON6mQc8VyaV4YweoMmK686ObOOpbUlikGqyxyjxuivOGK5vg8IYUC4BYfd
	aFNVIPTMHmn6l7zzULuvKKJoP2mr0RQ8DDyGgdTaLk6e64/5762vfCBXUZFcdZo1J9Mc7YkXlcW
	kIf0VHIwBtt5Y0exreoYmg/wxUkKJcElunVKkMKVse0EnP68xAw5+ZZs+4/2l64pwVmaPi/avhj
	USUqXPHuRLSz3uSRlVvnt3v54HSfLH81y03SJLanJgo0lBlfFQ2cssOyPBHHJe+jGM2a
X-Google-Smtp-Source: AGHT+IG2G+0jkkCrFzcyOswfbkjejbMcC59iHCIyTbbyZg24kwvnpZM5H9uQkhpiqY1F6e5Q+1GToQ==
X-Received: by 2002:a05:600c:511f:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-439249a82dcmr96610705e9.20.1739181105553;
        Mon, 10 Feb 2025 01:51:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm37731515e9.23.2025.02.10.01.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:51:45 -0800 (PST)
Message-ID: <c0f9424a-664b-4d77-b8e9-1938e49746fc@linaro.org>
Date: Mon, 10 Feb 2025 10:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
To: Dharma.B@microchip.com, ulf.hansson@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
 <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
 <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
 <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
 <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
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
In-Reply-To: <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_015147_371324_D70C06C8 
X-CRM114-Status: GOOD (  17.60  )
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

On 10/02/2025 06:28, Dharma.B@microchip.com wrote:
> On 07/02/25 2:47 pm, neil.armstrong@linaro.org wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 07/02/2025 10:02, Dharma.B@microchip.com wrote:
>>> On 07/02/25 2:25 pm, Neil Armstrong wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>>> the content is safe
>>>>
>>>> On 05/02/2025 04:48, Dharma Balasubiramani wrote:
>>>>> Remove the compatible property from the list of required properties and
>>>>> mark it as optional.
>>>>>
>>>>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Instead of moving the compatible string to the other binding, just
>>>>> make it
>>>>>      optional (remove from required list).
>>>>> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-
>>>>> dfc747a3d3fb@microchip.com
>>>>> ---
>>>>>     Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
>>>>>     1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/
>>>>> Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>>>> index 1f0667828063..ca3d0114bfc6 100644
>>>>> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>>>> @@ -29,7 +29,6 @@ properties:
>>>>>         maxItems: 1
>>>>>
>>>>>     required:
>>>>> -  - compatible
>>>>>       - reg
>>>>
>>>> If you remove it from here then it's still required in Documentation/
>>>> devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>>>> so please add it.
>>>
>>> If moving the compatible to its specific binding isn't appropriate (as
>>> per Conor),
>>> and if removing it from the required list here doesn’t seem reasonable
>>> to you,
>>> then adding an unnecessary compatible string in our DTS files doesn’t
>>> make sense to me.
>>>
>>> What could be the solution then?
>>
>> The solution is right but you modify the meson-mx-sdio bindings, so
>> simply add compatible in a required list for the slot node.
> 
> Okay, we declare compatible as optional in the generic mmc-slot binding
> but make it required in the meson-mx-sdio binding, which inherits from it.
> 
> So why not define the property directly in the meson-mx-sdio binding
> instead?
> 
> It feels like the mmc-slot binding itself serves no real purpose.

It's designed to be reused, the goal was to facilitate migration of
other mmc controllers bindings.

Neil

> 
>>
>> Something like:
>> ========================================================================
>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-
>> sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-
>> sdio.yaml
>> index 022682a977c6..0d4d9ca6a8d9 100644
>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>> @@ -60,6 +60,9 @@ patternProperties:
>>          bus-width:
>>            enum: [1, 4]
>>
>> +    required:
>> +      - compatible
>> +
>>        unevaluatedProperties: false
>>
>> ========================================================================
>>
>> Conor, Is it right ?
>>
>> Neil
>>
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>>>
>>>>>     unevaluatedProperties: false
>>>>>
>>>>> ---
>>>>> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
>>>>> change-id: 20241219-mmc-slot-0574889daea3
>>>>>
>>>>> Best regards,
>>>>
>>>
>>>
>>
> 
> 


