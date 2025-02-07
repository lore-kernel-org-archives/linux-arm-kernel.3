Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44836C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq0arpYSvoFDp5urlt72DtEA/DJDLUpDJMGDTdBFzlc=; b=HB7ApFiOhuzeLzkTV1yGZh7PFN
	h164sCwpyRGEsydGwwbOm0qJBZJAQBaQ0lVXE4iV67uigawTcuX+P8uhGmX8aO049FtY8KYDZzgXV
	1+G5Gsl+XABhvncEhd0kdFkeDb0HwiKKPXZXYd1xhfBBA71TBu3kf/iCZtj/asb0PveDxAqPQbiPX
	rbGZ4uiwdZrwlIMbqLIkTvQE866KPflN5AxyHzVBP7mRaFuu4q8DFvgvA/Ji8bOtuWElC/KnXu6rC
	S4AQdRy+fpeI7WmF9oxrg/B/26uT0YvFpA3b1YzrUu7LgykjZy3Ns3GJzN4mT7wdx3gVj0MXxemrR
	rQOuOR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKWL-00000008zcS-2tc2;
	Fri, 07 Feb 2025 09:19:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKUO-00000008zHH-2fRk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:17:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436a03197b2so12065275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919851; x=1739524651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq0arpYSvoFDp5urlt72DtEA/DJDLUpDJMGDTdBFzlc=;
        b=TpoRWvwR8hN8VazbZKTLEoR8+z28DLwcn+6uV8MMwmotyEwXsBqN+hhIMAXSyAQ8IW
         Q5UrXewT24RsZZSSMMrCwMf2hRiIIZUFYKhZDlsOLiqbAkqAkKA8KCBh60pBb2NiqDD8
         /vrkWuo9TRRt/aeKgOmTh17O01ZmKbOqExP74RBpbT9aL1fNcVd4TZ3ZC+mBegxZvYPC
         l0W/b9mop/VkRBpO1Bx1lTSZJeibB1X84b/RQ8FBP0ueQ++/Ara+u71WHAAabGNbe1s9
         vLww5CBo8vA5eNXDwHud98B1PQzNp/2Pz1dvjnWgS/6N01msy9RAqN/UJubX9kopKybi
         Gvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919851; x=1739524651;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tq0arpYSvoFDp5urlt72DtEA/DJDLUpDJMGDTdBFzlc=;
        b=TZlaeCBWBSWQq2C3wk4H7rtCNdQhsUZynDsV8yRGB3+i/LM347RpaXpZCBIZiPvIxR
         CqXSHEtV6zLet4u/0z4r0WzFoCN3txMZdzDjF7pj42EsLh7g+8QJnya3fUDevGnZWW0y
         9X69UpYRvotTnOnjGQlkjimhc9278w17ZljKsJI3fSqeLgFOCfWx0Ay8hqDJwCbotoSm
         spyR5Ft3eOjKo66EjAACrjfpm5JmWK7olW9zz/ZtE9YfrM1lz3I9w0di7D//OlgrMzEh
         Gl+sAOq85veDm13Is3Yo9Wf29AK3aoQJDH5nZf5IRY9EfhyMek+PiENbsil4GjvmM/8n
         LEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELbxfBKMc+R6H4bXZ4KMDjQGpLqChxBegTXnZowhO/POkrqSnYau28ucJhGdXE/KLxH4zl3RQzCKT6keYMjIj@lists.infradead.org
X-Gm-Message-State: AOJu0YzjdG8uIoGByKGaislYmX7TOKQFz+vkld6h/jubx95X3N+QfGHq
	FZbNSE8q0Pqqwa6xOiC37sKqtZvUBR97x2yk/pNIWBDT6xVxuGRL5ZOCF7rE7Ro=
X-Gm-Gg: ASbGnctNz9jH4iDmG3YpsAAdH9XZJjhyC2sQV+GLewQLHLK2frgMw7LsVyrQsxAW6Dp
	NmM6tQwCFkrHiZiZ13rABjURz3ZGo6eclfai9F/99o5xx9Jp0zgKCfYvSxf4gLE++1gbzlI1gFs
	FyeITZjLNNfb85KSwtkB43XMR11gWfY6pJcjEvaRvzJm4D/IUCoQdu6hDQzfGUqLmvgqYtcY1SV
	PaGLPPLuy0Ip7p/WgCMcxApuLpVs0jI9zJGPvs4988RO5B1H8tNKuh2vQPJR8B7am+TLqThAZlB
	tOCZ9mWnMjGzewQCpgF1HlLfmQuZVyHMkiVKL4qDyTTrp0o5KYIGfX+tWcLwWzklG+b1
X-Google-Smtp-Source: AGHT+IGQfxMRIuGwsG2LhdgudYjnLLYSobR1Dg5dLuvm+yyL57tGU6pvxJPHQWM8uWlNOLtqEwvAaw==
X-Received: by 2002:a05:600c:1d90:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-43924991f5dmr20328145e9.13.1738919850827;
        Fri, 07 Feb 2025 01:17:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0179sm47187875e9.11.2025.02.07.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:17:30 -0800 (PST)
Message-ID: <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
Date: Fri, 7 Feb 2025 10:17:29 +0100
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
In-Reply-To: <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_011732_667651_C8B4CB5C 
X-CRM114-Status: GOOD (  16.38  )
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

On 07/02/2025 10:02, Dharma.B@microchip.com wrote:
> On 07/02/25 2:25 pm, Neil Armstrong wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 05/02/2025 04:48, Dharma Balasubiramani wrote:
>>> Remove the compatible property from the list of required properties and
>>> mark it as optional.
>>>
>>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>>> ---
>>> Changes in v2:
>>> - Instead of moving the compatible string to the other binding, just
>>> make it
>>>     optional (remove from required list).
>>> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-
>>> dfc747a3d3fb@microchip.com
>>> ---
>>>    Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/
>>> Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>> index 1f0667828063..ca3d0114bfc6 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
>>> @@ -29,7 +29,6 @@ properties:
>>>        maxItems: 1
>>>
>>>    required:
>>> -  - compatible
>>>      - reg
>>
>> If you remove it from here then it's still required in Documentation/
>> devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
>> so please add it.
> 
> If moving the compatible to its specific binding isn't appropriate (as
> per Conor),
> and if removing it from the required list here doesn’t seem reasonable
> to you,
> then adding an unnecessary compatible string in our DTS files doesn’t
> make sense to me.
> 
> What could be the solution then?

The solution is right but you modify the meson-mx-sdio bindings, so
simply add compatible in a required list for the slot node.

Something like:
========================================================================
diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
index 022682a977c6..0d4d9ca6a8d9 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -60,6 +60,9 @@ patternProperties:
        bus-width:
          enum: [1, 4]

+    required:
+      - compatible
+
      unevaluatedProperties: false

========================================================================

Conor, Is it right ?

Neil

>>
>> Thanks,
>> Neil
>>
>>>
>>>    unevaluatedProperties: false
>>>
>>> ---
>>> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
>>> change-id: 20241219-mmc-slot-0574889daea3
>>>
>>> Best regards,
>>
> 
> 


