Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C98ED31A3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rWsPZP9GypSrCbApSvZEqf+XkVVNq8YSJJcRm2PJVg=; b=4Gz8fTxYvq24kfV3PrZS7bf/mK
	1OYG8HsRUX5ZFTWmJG63qz6iF2jR/ysINzKVQwMTCYOOmPhaqy3+6yTVy1PNYACxCaWuKeRBShB6r
	12dbSOwY24muQME+Bg73Y/qf+C6SdpLmGa1z4Zrn+1Iessxtmw6agKKsLrKyh9OaeitT3cjD1hHrT
	7vbYo1pJkDXqGw0IphTy9bazVPPyCPSQP8Ni9KkjV48winmt88+elSCbQVJ2XlDYbhmQOxUz8hXnu
	EEkJu5H5cj3FWHY5oRqY3uLEtwdWJQ1qIeHuwlNRtklitSjnj68vMxXJTPbGVongvZEf6ozaECXYo
	qMBliJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxsr-00000008jPv-2Jiz;
	Wed, 14 Jan 2026 10:13:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxso-00000008jNU-235N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:13:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so4047739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385624; x=1768990424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rWsPZP9GypSrCbApSvZEqf+XkVVNq8YSJJcRm2PJVg=;
        b=A7K7mKYz1/bYcIuaA/217EGQwkOjVtZ3RuE+3ND8ognOAslo8kzhbdBU20wbyBhmlq
         I03OgNFVeV1QzgmFeaM36a8INjYeJmiljom+feniKIy70hfUhXBjaKPd+DVVDPKblgP6
         4OR/sMyBMXNJlvCyNB8xbWnP6m2e7GCZdFyfE8GdQLWOjeZ1umnWl6rzrpiK02A56LCO
         60mFbuzYG+Jg9S0GDZns06xokQniPssNTm8szwHkr3f6qUxYODlLpgffNVlYvIy8pcVp
         QA3MP0I+/OXvbkQscIjA7BYMmDbwFkxHP4qa1zBtdwPmErBFUsuVmYVU4vak6qi+px8w
         ldSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385624; x=1768990424;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rWsPZP9GypSrCbApSvZEqf+XkVVNq8YSJJcRm2PJVg=;
        b=eHxWtW2knBnMudSjFj4F43lne9Jtoz+149d2aQFxPJ4AonQ0whH2EPNCstEWb0YJmP
         EQqxVDy7ZWiW4osgwuMriQghxRo2Hv6Eikuwxbu/H8pU4FQ4h5wBeSuFrzYFBwJ1IPeh
         gw6oD+MsXCcNT5qeG6MsNQCK/lTF0R5u3/TWMOaZiQ8nyBh4609xYTlHcbWJE8nxsCOl
         +dtOz/fMbQP3uNIa1HRVGCJGLnPNQYU0QLGOARpiFfaWa++xsmmS9L4YwCHHCtL4A6+b
         LNd42JGSDQASbXDrwSwVd6YA3+4OO8g8q5pPEaaX/V/kFY6/VEjzbQg2fgkY0SCS9hf2
         H/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWVonBhIxtzHnf2p6I0lPRkRcbljdHtwx78pUtQ3Y3lz2RWDBOvdM5FFL22YXRNlgYDnZanhDZsUsuwefE3A8kp@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsqFVdmZn4wzx5aZg3EallFJchv46y5l+E2cUlWvqA1H/KVoT
	6Ro/teKbqxqeo3fr66bGul+OVUaLiIFFjO0xCl7kIkqZ4J7VMDQ5jJxJH2obu1sNJ+U=
X-Gm-Gg: AY/fxX6RVPdzbUelTN6wnXp63VCinMBPf3HRtyew4UW3C03lJwEtVvcES7eQYnxUyHP
	FTAFAnVBj1+XK2WDyChn0mGSFEDQQz3Y53PMOUut8A6RhxThH3osV1sIv+7HIzKmWnfUPe6hhQs
	6ot8737N0bJfZouvI2TnNyWmJ9+MLUmBj4On1xiEmwzNRhx5n0c3RU+mGNSvlXXn9nf8Hq6vx6t
	xBIa3r98eZtnj6zkKyXxdgGhTl/MffIvV/yQXSVTHhyQ6FMiyN3AZNcJYwZgDepBp+aO0+Pl+NC
	B+4uYJVrrz88Aj9U8y4/TukhvChvsgHWW4DBSPp/bukPUDPrbvzgO/5B3HigiLsARx8MgLr+Uz0
	nM2vYz1haprBsf74hhagJ/QObszVFBNM+vj6chBAxiJsEXflaMY9e798LB80RlO7fOaeggMDfqs
	bJZhSud9itQsuyCfwAWO7MgucegvKq/Akkl4UxBVux/MnebZI9L/Zm9c4uYjNI5D8=
X-Received: by 2002:a5d:64e5:0:b0:432:c37c:d840 with SMTP id ffacd0b85a97d-4342c4fc9afmr2140894f8f.20.1768385623587;
        Wed, 14 Jan 2026 02:13:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm48795733f8f.16.2026.01.14.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:13:42 -0800 (PST)
Message-ID: <f1d9d4c4-8fe0-4593-8c8f-1fa30cc6ee49@linaro.org>
Date: Wed, 14 Jan 2026 11:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S
 binding
To: Nick Xie <xieqinick@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, xianwei.zhao@amlogic.com,
 christianshewitt@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, nick@khadas.com
References: <20260114062549.68954-1-nick@khadas.com>
 <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
 <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
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
In-Reply-To: <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_021346_553035_90DDE9D9 
X-CRM114-Status: GOOD (  14.81  )
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

On 1/14/26 11:07, Nick Xie wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 于2026年1月14日周三 16:51写道：
>>
>> On Wed, Jan 14, 2026 at 02:25:48PM +0800, Nick Xie wrote:
>>> Add devicetree binding for Khadas VIM1S board based on
>>> Amlogic S4 S905Y4 SoC.
>>>
>>> Signed-off-by: Nick Xie <nick@khadas.com>
>>
>> You still have the same From/SoB mismatch.
> 
> OK,  I will fix it in next version.
> 
>>
>>> ---
>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> index 08d9963fe9259..55663e0f7f915 100644
>>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> @@ -247,6 +247,12 @@ properties:
>>>                 - amlogic,aq222
>>>             - const: amlogic,s4
>>>
>>> +      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
>>> +        items:
>>> +          - enum:
>>
>> Yopu already have exactly such enum with such description, so your
>> compatible goes there. Look - it is called "Boards" - plural.
> 
> The exist board aq222 is based on SoC S905X2, but the new board vim1s
> is baed on S905Y4,
> they are different SoC, so we need to put S905Y4 under S805X2 ?

It depends, if the S805X2 and the S905Y4 are not compatible (different dies)
and not the same die in 2 different but compatible packages, then a secondary
compatible should be added like we did for amlogic,g12b or amlogic,meson-gxl.

Neil

> 
>>
>>> +              - khadas,vim1s
>>> +          - const: amlogic,s4
>>
>> Best regards,
>> Krzysztof
>>


