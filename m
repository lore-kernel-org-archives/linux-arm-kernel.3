Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFBCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=; b=EHm60lYum5UYLJ303TBEfMFF/6
	ocp7tUOxERXFEUkD7Ft5o2RY0lz1KlUy7dzrzmzTZWcY65mYEF8auDI2G3j0IHXyd2NJSNn8j0HHM
	JHjtfZ+aG0HlffvQvq8oe+meKHtBfdyBLoEQtB9xg2R78RNNOxZ2dE4DeVo2gDCYbnAs9xKOrj9rJ
	tewnjpj+oAvcKoNt79+Q/1s7KZCCfw3ZmDtWZQ4rMgZN8vdOuwUo9r9xrSTM2sFQHeYIAYUy1aOWh
	QPctf5yq7fYCFzhlUBEUCHdYvDnxyQ2ywxDgqc7BGAvfa57Hcu1r2dc94pGQLtXQtsWcr39HIg+pH
	TyT5nlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ2l-0000000FXVY-3HOi;
	Wed, 11 Dec 2024 16:58:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ1h-0000000FXNP-29or
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:57:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43618283d48so12585775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 08:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936247; x=1734541047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
        b=MYSZ+iS+fa7ROMp/mXNsRILSKEX3WTAVIpNUvdo5JH9CZLgONTluIjuLv/D4IqSCzG
         ooyMieVonkTTFaawWOdcAX+cYnIyOj3GshvkNiBinCQqyXCPHdJYi0apBvzewxSCboE6
         GTmDEFCSCDo1J/etiLG0iqUGTitcm1q8pozXEVfnTC9KZRNwoBxHlZCxWFNfyQPhuVhZ
         31/DIQ5xC45ozghZQjR1CYoB5ZYrh4opEjXT4MOkwNq1AN6cbZslu2IymjbMhGkPzmSU
         UVK+98lc/UMovTIbgHMAEDN7HDvalpfZXrPEvfuLEuhQS/nd4wL6RnsiGnFDcjttmx3p
         hAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936247; x=1734541047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
        b=nk0NT4qNSMlA1Efv+ubJi5ejcW6CKs1X7x+l/T8YPCY9w9htLIcImA9kH6H4rtA/fh
         z7qEvS3aNpwVIAJx6ayNfbc38wJPe8rI4OiyaqInDA8coAPOx4FOJ96LCEtjZzYSMuBv
         9JNM45OHvyoYA0K1o6WdX6i4dGFuB0dPeXvZWb5/Hja3Ej8rm7IYD0qFr9KOD95W2+Df
         nEqmo8ZnJmT3l9DG/SW2tsS9SMYU4m/4zP7+6hVVavJV9KKBTfuFR7sp66egCNhlEHkh
         qsop1q7JYFNw9UwuemMrua4N9nhalMNjMRPrpr3TreHsMZptQuk6R5D/QNtl/vkIWVLU
         pnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Dq/wQmPSTouozUI3ywK0od/wZDiRQmg9acNQdYQd5p62ydn3Iq4fz1sbq7c8SaRea0k+xJZ/cFMaOXB2HQZE@lists.infradead.org
X-Gm-Message-State: AOJu0YzmvtDUWLwRzZdTG4wptGy1r4QtgS4pjioBUUQZ6ZF7Wx5aXV5z
	WCdKpGg09HwwPBh16KtOZf0HMRsL2NCPIN1MVOrKv3RX1hxZ6QK5pHnCf18793w=
X-Gm-Gg: ASbGncvoYJ4a2xFjE5O9gBq/rjPTqxU0tDJheyXodCes5aK1GHvpIRROsQuoQVX8mh0
	GvLL/78uSF0tPXs1OmFi5hECdFmkw0APEr2IYvP72bRASjJ0adFBn1820ot9F9gAd2yiQrh2ZLW
	chI+zPk8t5RHyxwGOH/e02wg1suGbhA1vwFUVObWnvje0bajnnVJr7gx4RHAKyIRMXVH5PTQyuA
	wWYrvF69lekJcVZpu7GEHpIpWENqlloKRMQegD9zBzxpkfcklWiZgjZuR3XI0oU/nGpKfaKEf8n
	2fjeITOB0p54vixMLB44mMitegTGcyA=
X-Google-Smtp-Source: AGHT+IENx0NcRopIXx3SdVXYZNoSpCbTptpp3hxvIhVQS3f47TcSS/8i3UaxgjzRtqPiK5pkEZ+nig==
X-Received: by 2002:a05:600c:1d20:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-4361c431298mr32914025e9.30.1733936247337;
        Wed, 11 Dec 2024 08:57:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d426:8f10:1673:5657? ([2a01:e0a:982:cbb0:d426:8f10:1673:5657])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec87bc3sm14005935e9.1.2024.12.11.08.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:57:26 -0800 (PST)
Message-ID: <1b3d37ce-a362-4846-bb7f-7cbe4c28608b@linaro.org>
Date: Wed, 11 Dec 2024 17:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20241210105705.116116-1-festevam@gmail.com>
 <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
 <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
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
In-Reply-To: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_085729_563492_6277CC0B 
X-CRM114-Status: GOOD (  11.51  )
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

On 11/12/2024 17:29, Fabio Estevam wrote:
> Hi Neil,
> 
> On Wed, Dec 11, 2024 at 6:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
>>> From: Fabio Estevam <festevam@denx.de>
>>>
>>> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
>>>
>>> Add a compatible entry for this LVDS display model.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>> ---
>>> Changes since v1:
>>> - Added devicetree@vger.kernel.org on Cc.
>>>
>>>   Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?

I don't think it's a good idea, there's no build dependency so I'd
rather apply patch 1 via drm-misc

Neil

