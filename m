Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6923E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=; b=ZXxrvAdNefxXKiPLYwVmKqfWNJ
	KTXi2lpBausQ111rmTxyFohbgY+afPFIzy2T49OwKAIA7S3TMb3zV0Sb+Xz9o8IqRNBqnO9vgiOeb
	j5trc2cjzCKZ5kd2o7YwQDJv0vJzegh431Ch9VEHgchr7N/mEmNibUqQfkOxoB0NepzIqnMmIQjVc
	gb+D6rgvnjUn92UiCbH9VEqQK76cjgGmOgZQgBYu2qMePQyKzeXo0RGDzXPpbJztWTK67PE6qGZ4d
	LPagZfZmmv7y+zWTVR9J2cVE/1jhpM1g/dUp2QxuzCW0qnQs5/U27hINVmtbUyXHfNts8y9bZr4GY
	8IFeOAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVia-00000008XGc-29Iz;
	Wed, 08 Jan 2025 13:03:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV1r-00000008OoK-3hAi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:19:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43626213fffso4756395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736338758; x=1736943558; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=UaFE2PoLFrYK3Kne+dWfsY+mcoMsdOpXkJgoOtMs1d09QMN0zLPQ17W0dhmHfidDzi
         ZB8JXAfTLNqtU2LlycgtiFFcKCrv0VO1HMxYR6eFTV71njB6/j5/nIqCOnCfSX8SdYnv
         rtvMFoStxfeK4bortTMh+9QqlmdcqmoISAZoQpNLuc8IxeQL0CYPAV5aWrUoKzNX77UO
         THn6eDszGxRWlWuJMpV7HazPef1DJ7XKXdEj/LpYFxhLgdeTNNRvM4BSB1uj3NFxAc/c
         F6NFPBynuCmKxok59h31GqWGcyp5P5FTgJKfdyp9dndNJT+JRhhJTNrskCDM/b9NF8Tu
         PyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338758; x=1736943558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0wrsrPGAdDXBV5iPTRGFFFX12teH6issL2b7lrnEgE=;
        b=LRKyTlaS03K9JHB3bZiwxArb0a3wlWK/PQddb8B/52rFWgKMv9TJHJ7wUcKU8hCVUZ
         kHTOYCjyV3iVKzyCNNHmk2kgf2SPias6xNhywriNa77vFjgKA3yBs1zn8M6qol9drIGe
         eJdQRTf16HzCp4yoWl/fdmlkE6BWs+3R+wSSYdTVbYL459yI2mdMJ1OkWpSM5MzbblIj
         g7d0wSoKB6s9c5qGypgJxsYqlbsTzDouJbVkHxbRTfzFpB5bb1uV9MVc4O12PfIz2ANs
         /e7bfiTWBaK7piDr6ZynwEU9xDxKYDhpyIP/KaVIHj3IEci2aw9arKoPbkVAAs2l89kT
         5iXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEM+4ZRdLEHoTxKmR/9hVo9/eJYHVdnrER30JbRHN19nBq5668LjmGIz+Q3QCoHwlK8U0qiMDyEFTdFJ4Di7x2@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnEDTGwVcSeGlhrS3fW6+Kdhc5rTSiAv186FSB1xVT5g8s3TS
	CBrLPVp9PQt0mYYoL3/BNzqWfh5E/6wz7LYXhyX0A8fkyX7tZbIs
X-Gm-Gg: ASbGnct3mcddNjGJ+NE/dzlWFYa+quLueFLvTBT23+O5Q330qWnmezeBv144DLDkALz
	tUXqv2LMac43Tq7Oc8qxYa8goumpUsDcsUAaf9lyvcILxBMrROhsxljhiXgJIq7pFu1ICKO9OoC
	MwCZlxAdCBn8kgKFjB7uwvK7IzW0WsxFC+9ZkY/mPCv+qzyrp6RaWfnWKp/Z4eDWchUBN0SflfX
	9JZKxxOPlw5uTPPifD63fMtKRWGrxXkK8Ty4+SkP/nDJnNaXsKo4ZLWEx1V1JdFnsL8Rfkevw27
	6Sh4KA==
X-Google-Smtp-Source: AGHT+IEZ2TsyG7bFlOCK2TmeGPogWLKZEqI34rc1uiTT2N6nITdoJEt+KA1su4EcHw8h6jyV9z9qzA==
X-Received: by 2002:a05:600c:510b:b0:434:fb8b:deee with SMTP id 5b1f17b1804b1-436e1e4ae91mr23270555e9.16.1736338757809;
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27008sm19375005e9.0.2025.01.08.04.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:19:17 -0800 (PST)
Message-ID: <e5665b6a-c2ad-470f-8a36-b7adc05c1cf0@gmail.com>
Date: Wed, 8 Jan 2025 14:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
 <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_041919_933385_DA8906DA 
X-CRM114-Status: GOOD (  13.50  )
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




On 12/17/2024 9:07 AM, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 09:50:37AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Introduce the 'widgets' property, allowing the creation of widgets from
>> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
>> introduce the 'hp-det-gpios' property, which allows using headphone
>> detection using the specified GPIO.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
> I have impression you are duplicating audio graph properties instead of
> referencing proper schema, but considering that the bindings
> audio-graph-card and audio-graph-card2 differ only by number "2" without
> any description, not sure what is correct here.

Please correct me if I'm wrong here.

As things stand now and based on Kuninori Morimoto's comment on this
(https://lore.kernel.org/lkml/87cyhw8lg5.wl-kuninori.morimoto.gx@renesas.com/) I'd say we can't
(or, rather, shouldn't) directly reference audio-graph.yaml here.

Now, I wonder if the "proper" solution here would be to take the common properties
of audio-graph.yaml and audio-graph-card2.yaml and create a new binding that can be
referenced by both aforementioned bindings? Would that make things even more confusing
(we'd probably end up with audio-graph.yaml, audio-graph-card.yaml, audio-graph-card2.yaml,
and audio-graph-common.yaml)? Should this be addressed as part of this series?


