Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2069DD29FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dooFeIUOZ2AYn0yuxNU1dgV5MLYuRIoZtKgKCQ/5bI=; b=umBOEu+/EpEbS+TKeVFfRUSvSF
	E6xQhhl4o85VV7bLzfZuSsWQuGwaEIwTv+ejsYkSnkR3Pj2nt13yeoRjjWB8fCnllczkfS2/Iqidw
	GrjW5cKdtMGA0TFZmlH4JYVzVYKX34O5pCKOc2MI5JJzTCVlg8zVV/FXaN4Y+BuN0A5qnZJXYc0/c
	r5p3S9eFkF0tyrHwIE3ruFT8ornb8q1jfD0DmQrGsMYvHGwHyQBnPTzhqE6psrLDBBZmyaOqWIReZ
	12daiBa1fhRz3P0wMoyjiWoU4Hx6P49I9dUT1N6/xETsGMOaqqpBIkFFKdjku3dGgYFSaBowr4pS8
	6UBPYHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzev-00000009604-2Viw;
	Wed, 14 Jan 2026 12:07:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzer-000000095xS-0lf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:07:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so94295515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392447; x=1768997247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dooFeIUOZ2AYn0yuxNU1dgV5MLYuRIoZtKgKCQ/5bI=;
        b=oCGZieGihsXlJ/WXytHaSrI97kWZ93/BmqjIDYprJEVuzSTbB0/x+1EI/oyeUc0ME8
         FqtqXf8fo5XHP9Rn7F23h7Tg9tkf98FLAvLvYBfhFhaZsb26XqteeYOXHk+8vMJa7LFF
         mSjRSyrx6SCoknPRVAEHz4AhWgFkI+DKNUEsHtZepOvMGKvrmh7eu/B7rXWBoV9BfdoP
         BRdyzf62m+LIF7FlwkYf+Maen35fYSviKwuoQB5FwGEYxE7muRIOKeJhsz8jx/9UyfCl
         pPeHZUHC4gT4uGr4BtIRBXXV+Q3ogqlSIH6BuizYurub92Ujzk4zIQqwQ8KElVhjmVX4
         Umbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392447; x=1768997247;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dooFeIUOZ2AYn0yuxNU1dgV5MLYuRIoZtKgKCQ/5bI=;
        b=YLADUhjsfFjEXmm4IP6k6/fqCNrmoak077t0kjFgBXBrIbprsYyrFaje/3mywrAGaB
         qUAsz7QhZDJjLNEFsQlJD/WUvQJ5dm569sDfHtvHfGqpisoHc7Oz6Lv3BUw+Ybtv+phR
         pPFNIniPXduYT67kQVhtfNXK6wmwcx9nDDvpM/FqPdunhC2QCENW95Bm6rd9lwId/hfa
         MoPICc4dXAA/i3DyPC67RxuIjOPwr4r1aIWMRsp4kNb1EsLLGfABYx/nreVGQDnZv1vq
         5sPvkrNSd4wumFK2OQTzi1EpYGkK0Vm8WQaSHtr7qWwWHwH0/BzKy2rvECNyepwaFkov
         U+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXwm8aGVxtlF9tIxE8rpZuYOGAvlm67ILo+YIUVRfHZka9JNGCKZRKwQdCXy0ocK+v7+G8kdYP/1bo0nFfotbq/@lists.infradead.org
X-Gm-Message-State: AOJu0YxmfEc5P4iK0jQaXRtK+50wq+ojxdQZHKkJpQGCvhYDZd0gWzyr
	qoqaMa/GyRPKoG6yZQeVjXsOStvsWaF5IUAtqiUFLQ3EjoC7H5z2j/JZFz+LpkulpF8=
X-Gm-Gg: AY/fxX5JQ5/iiJmGkwIfTPyu9BhcgDVLtoEhegwKbcAt9wokOBtpvi0sNHeMgosamb5
	dbpk9/dQPoyy3DYe1X1st2B+WxEfMkfH+VvnC5oJxQTg8r0oLcETsfgZqrHG5zGnS8IT5dXojYx
	gBDukmHpyaZWRHi9sU5oUkT+SHNGKl7ClVTLeR7fuabTAkOR5zjvT5CWpBdXhHF19GS++GmE7pe
	VdPYL1cCUAcT0MrUrzEYIEL/oRnnmoAPsa+ZjBjbgA+aabPdb425zrmbmqIORri0k4XGwZSFLiS
	jQWPV5nJ+2AjIVGrMq27GgiSE2cPLsegAfOZgDTg9VYQ72JrW9GEISDUUlGteuS7WNxGlxbq0xf
	I4gkeKhmbDyvoIEdm1q9X0DoP+fH467owuswj6ld/MB+L/qkh9JZjyskD0zR8bU+LHYu7PjlN21
	/gL8ZiwgULAKjS8EEjBIj+9xvVqo6IRShv0Hs2GrYoJbQOGmS5807JqzPJbvVAiv4=
X-Received: by 2002:a05:600c:5285:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47ee30709e8mr30476765e9.0.1768392446880;
        Wed, 14 Jan 2026 04:07:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee281dde4sm19667005e9.4.2026.01.14.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:07:26 -0800 (PST)
Message-ID: <b017db65-54c2-473c-8263-4fecfbf9a330@linaro.org>
Date: Wed, 14 Jan 2026 13:07:25 +0100
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
 <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
 <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
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
In-Reply-To: <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040729_309394_91B5CE43 
X-CRM114-Status: GOOD (  15.31  )
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

On 1/14/26 12:25, Nick Xie wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 于2026年1月14日周三 18:33写道：
>>
>> On 14/01/2026 11:07, Nick Xie wrote:
>>> Krzysztof Kozlowski <krzk@kernel.org> 于2026年1月14日周三 16:51写道：
>>>>
>>>> On Wed, Jan 14, 2026 at 02:25:48PM +0800, Nick Xie wrote:
>>>>> Add devicetree binding for Khadas VIM1S board based on
>>>>> Amlogic S4 S905Y4 SoC.
>>>>>
>>>>> Signed-off-by: Nick Xie <nick@khadas.com>
>>>>
>>>> You still have the same From/SoB mismatch.
>>>
>>> OK,  I will fix it in next version.
>>>
>>>>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>>>>>   1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>>>> index 08d9963fe9259..55663e0f7f915 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>>>> @@ -247,6 +247,12 @@ properties:
>>>>>                 - amlogic,aq222
>>>>>             - const: amlogic,s4
>>
>> Look here
>>
>>>>>
>>>>> +      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
>>>>> +        items:
>>>>> +          - enum:
>>>>
>>>> Yopu already have exactly such enum with such description, so your
>>>> compatible goes there. Look - it is called "Boards" - plural.
>>>
>>> The exist board aq222 is based on SoC S905X2, but the new board vim1s
>>> is baed on S905Y4,
>>> they are different SoC, so we need to put S905Y4 under S805X2 ?
>>
>> What is the point of having two separate lists with enums ending the
>> same SoC compatible?
> 
> Actually S805X2 and S905Y4 are different SoC. So maybe like this ?
> 
> S805X2:
> - description: Boards with the Amlogic Meson S4 S805X2 SoC
>    items:
>      - enum:
>          - amlogic,aq222
>      - const: amlogic,s805x2
>      - const: amlogic,s4
> 
> S905Y4:
> - description: Boards with the Amlogic Meson S4 S905Y4 SoC
>    items:
>      - enum:
>          - khadas,vim1s
>      - const: amlogic,s905y4
>      - const: amlogic,s4

It's ok for me, but you'll need to update the aq222 DT aswell.

> 
> Same as Amlogic A311D & S922X
> 
> S922X:
> - const: amlogic,s922x
> - const: amlogic,g12b
> 
> A311D:
> - const: amlogic,a311d
> - const: amlogic,g12b
> 
>>
>>>
>>>>
>>>>> +              - khadas,vim1s
>>>>> +          - const: amlogic,s4
>>
>> And here.
>>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>
>>
>> Best regards,
>> Krzysztof


