Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FB2C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 10:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6EYLYLFpyiYDHg8AKXScLdaa7AF+5W/s+IRWYHsl/k=; b=AVbCOaT0yzdgi7k9iHZ2tQYFKN
	2V5Oytc8ZBLlA1lnO1j9en01Q+1vQeF6zEB5zXqHggJdExNjT8wMjFDkoLogtEFkyiMd2boo1mEP9
	ket3o8KKTsMzoPg7cxVSGFunTOwwArymPxiakmHTw6fZSCM+5nl6EyDvakxC+NUwBUvBk8aA3beuA
	EFlTXESFkxJEqD/JjU/gyCtVugnC7h96Iq9TOpYfq9vuiZ10olLyYp559O+gQ9GoJEwr7jIpPvtg1
	nR9hPxSGYMaWalK1ekYX4Tmzt2qKRXuDHPN3chGWMIGirTCa3hzs+Eh+eaLa1ae0SQki42UESHxUF
	j8ky8hBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHxz-00000000kql-0n1U;
	Sun, 22 Jun 2025 10:30:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHvi-00000000kkI-0nl8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 10:28:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso3793715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Jun 2025 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750588084; x=1751192884; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q6EYLYLFpyiYDHg8AKXScLdaa7AF+5W/s+IRWYHsl/k=;
        b=PmT94lpsqsDd9MjVveJXAK5k3YSnS+VOhRBSrUKGxxwFy1Kvag+Zfw/JMb86brxJYg
         YHlZeN8aZzbWp8L7IKZHbaqaK4oP7dQL8nO6B/q7qkKHPqqtzckeKqqfbea1kTk9+ooR
         kTDuKJvLKDdBjZ8z8MGscyMR8kS1h3ugYqlpPYBU0+0E1X2pBhOsGyQNImos2G+X8mGH
         3bvIcpbeavJnWVKN6VbtknHGPVQ0dBVHxj7CoipvyZVcsqOySXv7VIyDPF9qbzeDKH5a
         FlAZkOyXB3KosNKUb3vxtugXb0hUpEip5+WTkWC2m9SmniFny/DXriZnask8FgykqFdu
         nISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750588084; x=1751192884;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6EYLYLFpyiYDHg8AKXScLdaa7AF+5W/s+IRWYHsl/k=;
        b=Tp8vB3JfS3jJAaHpwJzk2mPKCojf29y435VVD2Jo3Ekg7x5Aijv84xbUHZvgcSFkPe
         wwqR5ZR7SW6BO2TKWAg3nn9MwpJRPK5REwR5geLPCoIOzohHry+M0y3EVB7w/hapnMdQ
         64l2RaOzZuRgkkWTpRlb1/6SbkcQnyL4C0znhLz0xxzefM2TJdouBQNvn25MSHpiDoLH
         jbUUJXWT4oI3mujv5Q7NRhoTCiNy30iFzgi6gJEgHNRRgNn392nLOKuzjLPgRF9NELyN
         E41ZvJN9opyqp7Ww8zWXRxCfLrVLsvaf1eO+nLGdHLuk/m7Xt80vfSpQPsg7lmYiFSq0
         bJLA==
X-Forwarded-Encrypted: i=1; AJvYcCVtCBbJi0LeRVUgB34QSlPh12sbVEEWuzt6P4E8wfm8k3NQOzUytuWpTEYrz8FBPyWf+ugtroOVTwJezvM37KAr@lists.infradead.org
X-Gm-Message-State: AOJu0YwOXrGQ3sE1lTDGtJwF4PTjtNVCGVFyuKjHzlCTCI91TeHpvvKo
	ymFf9uXOmbyyljUl1JLOHEwBByGh4It2gy2/2Sd4kGFHpNZps7EusK/QlLvQwZg6I54=
X-Gm-Gg: ASbGncsVC570E/6j9QhhAqyCQ8AUB2xjihsqdSKLLTiMx++HcNCkdX1gtsFxmYLRWYQ
	q+hUcGi9vhItAe0dwpmxDfCXQxPN19nHXU1iuEAkWAKRpNlI79t9Cu2oZzYJ2+KOQFGnJwk4axB
	hth1kLKKy38fGgVwARLm+pI4sboZZt75+ZKnb/4DhlzYXQ665+Hl06kvjEFoSFQEGMsead7VmN8
	ClVwHahQJzrAzwHcTydoF8daQ3YaXLiB14NDaV4PzLzpC9RPx186DI1r14PgcI2IhO7TDod4JjO
	hlpcLQg4s7GwpTvFXPcarpp3UMxBMV5zoo5MRc7MPwwzG37RVpyWFReS2rv7WvjWf0EOmhbe1gK
	14sKHBZA=
X-Google-Smtp-Source: AGHT+IGExnyr33PA01GZxb+bF5kgM29BezDYfAl+iMhypV/l7Sou3GfjrHoyyQam3QcDSe2CP4RzQw==
X-Received: by 2002:adf:9ccb:0:b0:3a5:2554:71ff with SMTP id ffacd0b85a97d-3a6d1319e1emr2002220f8f.13.1750588084189;
        Sun, 22 Jun 2025 03:28:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm76513045e9.38.2025.06.22.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 03:28:03 -0700 (PDT)
Message-ID: <af90121a-37e3-488f-aa28-fac0d1c69c09@linaro.org>
Date: Sun, 22 Jun 2025 12:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
 <aFORokzx/sImgDtA@dragon>
 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
 <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_032806_253598_31BCA658 
X-CRM114-Status: GOOD (  10.81  )
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

On 20/06/2025 17:06, Nicolas Dufresne wrote:
> Le vendredi 20 juin 2025 à 07:54 +0200, Krzysztof Kozlowski a écrit :
>> On 19/06/2025 19:16, Nicolas Dufresne wrote:
>>> Le jeudi 19 juin 2025 à 12:27 +0800, Shawn Guo a écrit :
>>>> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
>>>>> Hi,
>>>>>
>>>>> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>>>>>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>>>>>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>>>>>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>>>>>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>>>>>> i.MX95 and keep the same restriction for others.
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>>
>>>>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>
>>>>> Krzysztof, will you take this one once the DTS part is ready ?
>>>>
>>>> dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
>>>> and I'm waiting for dt-bindings part to be applied first.
>>>
>>> I was waiting for sign of life on the DTS part, we usually get some ack,
>>> which is good sign we can take the bindings.
>>
>> Such process never happens. DT bindings are the prerequisite here and
>> platform maintainers wait for bindings to be accepted before taking DTS
>> or even sometimes reviewing DTS. Why even bother to review DTS if it
>> follows entirely incorrect binding?
> 
> You are the one requesting DTS with DT bindings for review purpose. You've
> done so regularly this year.

Yes, I asked for DTS for before/while reviewing very questionable
bindings and drivers. Was this reviewed already? Yes, it was. Therefore
after my review, how is this relevant?

Best regards,
Krzysztof

