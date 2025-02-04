Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3ADC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sCR9UpdvPq54knP20h3bb4wqIzkXCrYqODJJrs8Hjo=; b=Xbqh0J5bDzXgsaRoTlXkwjulI1
	uaumbEuk435spyd3xE2EYG3SnbbRPtG2hW6IquPN8xfh4G1fO+sAp5wBkNufj2lkMq85E1BkhQyyX
	sF9ZrW0RoliQPZ4Laty2pZY/GZKdDLb79UrSTxvLXiHxjzREOlm4WwdWGW7CvnC3A7DWpHi6TOwoL
	vJBcyJgeoq9vK8MPVdRW2Pl8XwqpBanijKfq3SidfPffNdd8tNSt9BEq+YsGklku2RP+mEZxdvo25
	NJwh1j7Hil5Rvc2mEzhzFSi+jw+/h/awWwfDSM/JqdVHV+Ewb1Zs746t2nCVdHZMnZEBt2sY6TcDY
	ysNF5URg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE79-0000000HVle-2JTa;
	Tue, 04 Feb 2025 08:16:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE4V-0000000HVRf-1uvg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:14:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43690d4605dso35907125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738656853; x=1739261653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sCR9UpdvPq54knP20h3bb4wqIzkXCrYqODJJrs8Hjo=;
        b=q7roPgp1MNBlV5W8dsUJcRY2op8qPQD+RUOpQQW2TpIukrcRBOtrxn6BnqaGWPyEFb
         5oy7gEHn87w/HWucLi/Sh3mEwHn+QkOlENZKcVAvtqybtcjbQ6Fp/yl/5rl1WRAEP8z3
         QWyUL4ZZgoGbC0FTgQATKedupKHK/z6HUiz2NdduwvfwkXjAqCAinbpg+pQnh8Fwqwtx
         +RI/kcnGzD6ubgXCpHaVk92tf5AuICUnzWpIh4+01GskP8xM+TxZ01GhkZBRp+zyJW43
         woomFwSJLecE1/ct+Kwcetk0sVEFM/Z5+rFMvoMegzcT3onbQotGdyjPBq+1dZKfGVVL
         VoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738656853; x=1739261653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8sCR9UpdvPq54knP20h3bb4wqIzkXCrYqODJJrs8Hjo=;
        b=ftof+IhpWIu0orix74RMgzxWzUcEfutw7iaJ25mSrpp1Hyc6ruZRe4GH1fu+/tVRtO
         5H8X4vghYVVESkxWlLqi1jwFE1OBvVn/XDdHZugZ+btjoCp+y9+1FCqYpMgmZfJ5MMmy
         lgS9ToULlzjQOidQKwuVUEF2ZDOwb1dOr4f8WexwEP0iF7BGqvE0hHyPi2i8Xn8tC/od
         9kXq9/rMZwQubORDOAWhg4mC2vweCIfJIg8bysGj9O3bZsUcleSLeyidbjDKrWfnodUN
         ZBWBKo1asxH4oCHxjHO/8p9wuNTRQGMjKY1KmlM8J85zW51PRf3rkzRiBuCwWDtO+xyg
         5u1g==
X-Forwarded-Encrypted: i=1; AJvYcCVz8DUVds7YwKBtd1Rl8642vJFfml4PmaX8INu6XRY2SJDE0kohl6VFtgbY4ZrwYL3VDe/gYxU87w8FRitm29Zc@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJeVnf7AV1gADRViKyJD3F0YD5Hrs00/bRY2xVhLD4cAXKcob
	sHKdBBD8ZteEHpGy3nPPmRoNjcxBQGThl802nMtdVYXURyOeCsTiCuYG6LNjv0Y=
X-Gm-Gg: ASbGncv7VPSeDMtwdeFClJNPNe+Lv3jxD9y1KHPWiWJmYQn5yMILSDmbjDmZ7ecfyxh
	iMUdxgUoOC6uj96mv8XwfPPbfnRIaJTnhYoLDIwgo03WFqRlGTsz6x9utGH0HJKBuJaluesUPKH
	zazRpQul1ZmUvr6iTT8Ku7wE4hiPJllRHfx0ERQO6ErERfU1sTFdLb26bYfmSncXoCeZJaC4hlR
	oXnEGOdIdReZfLibQbqg7XqvG3aWJCgin4fCK29yTvGwLe9Rm7rIlU72sxAHy4HZOz/+djP7Ufo
	kb8olIbBdI57kks3zFKYotyJb34VHULEcLURXAta5Q80Bru0zBZCemxfwFU56jjLJYvC
X-Google-Smtp-Source: AGHT+IG3tRoGmZu1OmIgYWpqEIVgV5wfqw0l/woeaKBkcCKJ2qcs0i4efob+omaMPGS57HdE6nfnIA==
X-Received: by 2002:a05:600c:3510:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438dc3af8c1mr200771315e9.6.1738656853012;
        Tue, 04 Feb 2025 00:14:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb? ([2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dac5a3e79sm900306f8f.63.2025.02.04.00.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 00:14:12 -0800 (PST)
Message-ID: <3ecf58f4-38c0-4435-899a-400df62f5d51@linaro.org>
Date: Tue, 4 Feb 2025 09:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
To: Dharma.B@microchip.com, robh@kernel.org, conor@kernel.org
Cc: ulf.hansson@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 martin.blumenstingl@googlemail.com
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
 <20241219-scenic-revision-17da9231d61a@spud>
 <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
 <CAFBinCCxZjuXL0duy3ePPDtL1oJS_GZiX3=djXpHR+-6gLkN_w@mail.gmail.com>
 <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
 <CAFBinCAO0bpd7PXaVJWMby4Mqj1On5DaqNZua4V3gPUDms8=LA@mail.gmail.com>
 <779651f3-e5d4-4de8-878a-84653735e5cb@microchip.com>
 <f312c7ff-8d9b-4317-a75b-ce3d0f94a7ae@microchip.com>
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
In-Reply-To: <f312c7ff-8d9b-4317-a75b-ce3d0f94a7ae@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_001415_503648_CA141585 
X-CRM114-Status: GOOD (  17.43  )
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

Hi,

On 04/02/2025 05:24, Dharma.B@microchip.com wrote:
> Rob / Conor,
> 
> On 20/01/25 10:00 am, Dharma B wrote:
>> Hi Rob/Conor,
>>
>> On 09/01/25 2:26 am, Martin Blumenstingl wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Hi Dharma,
>>>
>>> On Wed, Jan 8, 2025 at 4:11 AM <Dharma.B@microchip.com> wrote:
>>> [...]
>>>> "One issue is 'compatible' is required. Either that would have to be
>>>> dropped as required."
>>>>
>>>> Instead of just dropping it from "required:", I removed the property
>>>> itself and moved it to another binding.
>>>>
>>>> I will send a v2 by removing it from the required, will it be fine?
>>> For me this is fine.
>>>
>>> My understanding is that if we drop the compatible property completely
>>> then any compatible string will be allowed (for example: compatible =
>>> "random,name"). This is because mmc-slot.yaml inherits the properties
>>> from mmc-controller-common.yaml which itself has
>>> "additionalProperties: true".
>>> However, if we allow it but make it optional it means that there's
>>> only two valid states:
>>> - no compatible property (on the Atmel / Microchip SoCs)
>>> - a compatible property with the value "mmc-slot" (as used on Amlogic
>>> Meson and Cavium Thunder SoCs)
>>> - (anything else is considered invalid)
>>>
>>> Rob, Conor: can confirm this or correct me wherever I got something
>>> wrong.
>>> I hope that your feedback will help Dharma write a good patch
>>> description for v2.
>>
>> Shall I proceed with v2 by dropping the compatible from the required
>> property list?
> 
> I hope this email finds you well. Just following up on my previous
> message from 20/01/25, as it seems to have achieved an impressive
> feat—perfect stealth mode. Either my patch is so flawless that it left
> everyone speechless, or it has been silently sacrificed to the inbox
> gods. 😅
> 
> If there are any concerns, feedback, or a secret ritual I need to
> perform to get a response, please do let me know. Would love to hear
> your thoughts when time permits.
> 
> Looking forward to breaking the radio silence!

Just send a v2 as RFC, so we can comment on it.

Thanks,
Neil

>>
>>>
>>>
>>> Best regards,
>>> Martin
>>>
>>
>>
> 
> 


