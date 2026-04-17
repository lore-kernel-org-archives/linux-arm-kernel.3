Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9770AF8E4BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpo7P+uEagDswLieoNvqnFSXN/IsF5q+qpaAheY25VU=; b=qdsr3cI+2SsCH4EeX9K2mPQdfI
	QwmK9YIpvSOpTDL/QYbfFrwExQ3XX8SPnPufhfJmOsj6H8EIL9Drt/ExUn6uWiW1533eqyF/nFozW
	8FQgIQ0WClLKSpsmnni+yY9jIjU+AtK/gaMifdQziYJfcfzPrrR94BTKtAcmshqglig8l89vjh4ZQ
	r9JjIQlmXr1gVv/+Xa0pgYVFgOux65Ll2wGqE4nEBUJKpWDw4pmQCzln3P78G/vG4VVoboBiquQpO
	oZ6Ab2tfW7vO0LI7HOVpSu+0dbdciDkXX7M0bskS9HQG86rJaCoLMd9I0jKL58TGTCGMlAE6DA7rP
	OqN0faKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe0u-00000003d0x-2DJX;
	Fri, 17 Apr 2026 07:53:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe0p-00000003czA-2bKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:53:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so244092f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776412393; x=1777017193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpo7P+uEagDswLieoNvqnFSXN/IsF5q+qpaAheY25VU=;
        b=u5Zb1Zb7/6XQJRRWsZsa/Hhxyc1zc9JPOgorRjk2ayBDK02u+E4VTCmnEi8mE8jQxQ
         OGJY1aMtwDaYyKoXmI7hOINP9zZ3cn6mKvUGS1xRIEMPGY/kZMkAcLNz/IAuDorqOyPv
         +Bso2NKr94JFPbeFMbe5b+31SDwrDz0k5cShHpfnwborql58REEh5ZcfiFwMsHdScZQu
         g4yWtQxHWH4axnSwvBSEhmhRssw7NtlFA+JU7FgRx7mlAiGoq+f7yzUlBJS/QpPp2Jga
         MWpIpD76RWj+qTmndkL70bbA4TfJb6OZoFRBlmdrf1OrmGZkwiYmmLq6EeZsqwzxpxyC
         dKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412393; x=1777017193;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpo7P+uEagDswLieoNvqnFSXN/IsF5q+qpaAheY25VU=;
        b=hT+jia8aDJA4BziFDHaOhkHRJBd5bHRIKPIJxz6JU5RW4BaWViM2mVs5Xq/+ExcN6p
         CQ/BoiKSSUVusEOQ/YoeUuqYcUPr/dBgaGc6HwA9e/sV1v9tubhNELEo/pHQiXW25r0c
         AyW/trNUD/3wdhu/fjDzJc2sRDpcTexoVXEbFI4SS5Asa3VzHiB95UT+geEk57BY4XBe
         J1Z4w9j49B569vFD5LDJtwxhfjIJMUSnl3cMFzCo+iF1vbGVkvUFsa2njY71A54nAyvI
         X/jSqAVZydw7NXA7H8xNZ/U+gHACOuGu3kvgPBbG5ah2YCcvhXTBGuge1KHS2B9SQTJU
         k8qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Gi7gf/sYfo1NAF3sMxyNF6pKhDpcwTMivW/RYXcTXlPyVZiCzX8ZLGckl+73xHv38BAEyENglSj2UnGXqYO3e@lists.infradead.org
X-Gm-Message-State: AOJu0YyqlpjolEvzEaGaRIbkTM2zt8ENLeF7fZ3TUz78OEugUIrX3Hkz
	j+2dg5y8J07PPvOJ6yDQv7Jw6hVUY0vaU43j4xdeNOO0vEFdPAecZhug6aCSbGfc+3E=
X-Gm-Gg: AeBDieubjSzVz2YTR/XGePDDP4VkQqlA6tenkKvRI0f60n3oqKpkkNPpAXKfBOk8i/J
	nd24w6DFPAqT25zzY5RVvQ2WjQtp/07Q55GemqIYD/bnWSDDOHhag+DkBOjf9VhThreWZzJ1xiL
	F8xC2FWcny7T5R66mJmwrK9MxtLbx+V2J1TV9r+ar5mISAzFLEvvpjyLPeySuyaN3Hinni+uXdA
	jeqNsUJsKqad+Pxwg3HZLgwozM3lENxTmQYZ0FvFfsWwZ5ZciTXFPIadeIv0sjBABBLNHpfbx48
	5vvIbISFyMynwt6u6NzvT4hnemqx39ZdOg/A2sSTdp8KcudsgYXTm64D4DTDgHof0gkKEqW/CfW
	3NXqf9AP/Nb5RSg0bix8mudSOBJVsYwxJgDPi0M3vce/TAzxWRvDng2h9Scf0EgoVBMbaeAQILs
	qkf4c96/a8tAcdxnur2dJGPmHRVvETKyWrn2GsAupLQi6UUkz+8H8pol5pEvkrD95wvPIqTmhOV
	wAeLwl19PPyixw=
X-Received: by 2002:a5d:5d88:0:b0:43b:5231:e94a with SMTP id ffacd0b85a97d-43fe3e0d12dmr2364823f8f.30.1776412393117;
        Fri, 17 Apr 2026 00:53:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b416:50ee:20e:8775? ([2a01:e0a:106d:1080:b416:50ee:20e:8775])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm2584776f8f.9.2026.04.17.00.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:53:12 -0700 (PDT)
Message-ID: <6758aaa2-ac1a-4751-aece-2b445b84f2bc@linaro.org>
Date: Fri, 17 Apr 2026 09:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
To: Ronald Claveau <linux-kernel-dev@aliel.fr>, Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
 <20260403-add-mcu-fan-khadas-vim4-v2-1-70536b22439a@aliel.fr>
 <20260415214815.GA602572-robh@kernel.org>
 <6fc8ddeb-d54d-473d-94d2-49dc78a07154@aliel.fr>
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
In-Reply-To: <6fc8ddeb-d54d-473d-94d2-49dc78a07154@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_005315_695211_8D35858C 
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

On 4/16/26 10:25, Ronald Claveau wrote:
> On 4/15/26 11:48 PM, Rob Herring wrote:
>> On Fri, Apr 03, 2026 at 06:08:34PM +0200, Ronald Claveau wrote:
>>> The Khadas VIM4 MCU register is slightly different
>>> from previous boards' MCU.
>>> This board also features a switchable power source for its fan.
>>>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>> index 084960fd5a1fd..67769ef5d58b1 100644
>>> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>> @@ -18,6 +18,7 @@ properties:
>>>     compatible:
>>>       enum:
>>>         - khadas,mcu # MCU revision is discoverable
>>
>> The revision is no longer discoverable as was claimed?
>>
> 
> The firmware revision is still discoverable, and via the same register,
> but the VIM4 MCU has a different register layout (eg: no DEVICE_NO
> register). The new compatible is needed to describe a different MCU
> variant, not a different revision of the same MCU.
> I will remove the comment as it is confusing with new boards.

Yes basically it was discoverable for earlier MCU version, but is not
for this particular board version.

Keep the comment, but add a comment on the vim4 entry saying this variant
is not discoverable.

Neil

> 
>>> +      - khadas,vim4-mcu
>>>   
>>>     "#cooling-cells": # Only needed for boards having FAN control feature
>>>       const: 2
>>> @@ -25,6 +26,10 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>>   
>>> +  fan-supply:
>>> +    description: Phandle to the regulator that powers the fan.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>>
>>> -- 
>>> 2.49.0
>>>
> 
> 


