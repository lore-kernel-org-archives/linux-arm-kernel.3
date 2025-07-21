Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42B4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=; b=TwyUrIcbNBClV9xamla8WV7ppL
	wychRCXbhOdEcODtr6Jla6mktFzGV7lKQUiTz4TlmulO/bx9GvtKSh6AEu4n9ooJ7xGn2XmvhZqly
	2u4VyfYyGAhGOczBfmFxb8Wvm5T6kKiFZW9xSYpaoO373htnoEmBJ+xxZpcgbKW8cSothNS6k+UQt
	nXSXaNVLAV1R9FpT1ZObtBhGQqXDEdaTJxtku0wZqlYAkN+FZHHjmR4QcoilUzFvmxMS8K0zhc0mV
	MhOQnQ8Qcmqgj/LLxqVggACqifxQwLhzgR/aCHfkivMprI4qtseaxqGW1+qFH7WuGCxWaztb2cNl7
	DdukeeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx7I-00000000d3r-23Sr;
	Mon, 21 Jul 2025 20:28:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwv2-00000000awl-1acc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:15:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2822396f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753128927; x=1753733727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=;
        b=zWNt0TDyPAWbAOEKib2+x/34T1hlFuhmxOkmMTEyfTT1Yf595SP/hsMC4QSRPclh3g
         htAK4oOOJIPod+lcSLkdA7OYPiu8et/pALZvxMT0HXFsSbWfXJQ1pssqkBclpTjzxXtl
         +zI8Mlzfd/TOM96A+RE7syprQ4kk+lxJZE1GlIZC5PGeN7H2dis+V27lwEs4ShdyLFJM
         CaNX5kzxrSCM3ZLt853zMlJSj2EtsWjCg5+h/jY15OccBJbyHqwbc7LDcVnNdXI2P5G3
         hCEAZnqLirpyhbX6f7T5tjzteiiJw/uraeE4Atjb9xA3c9MRG3rebdALRCFMo9YCzFne
         uBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753128927; x=1753733727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=;
        b=RUUnM2kXGH6fxz86bX1c1QLHcj2gqXjJcd1ZxWCZqZTXh2BHMs8sfH3RmSgWl5au8I
         H9M09Arr5ZGtYqKvUV4hTJcHlgk6JmC2qO8geaGGivpU6qOwAvxYP7lCg4HB7Q8s1NFE
         KWvNixDTIpbolDEQnYNlQEmo7gxgDFILpYrGytQMedep7cN6ZlSkY0JrAK/n7hs1xxNO
         HR3jOKtyW0qVE5jl36oxJfMTmE7oytnKR9MJRm4nxjhttVXAY4fbpww+Qqm0DRu5lPkh
         J+g9/gU/uj45nA016ZtRuyXlKd6rD5kR/aCU1No03Tos+VUk7Z2ogsFXEgDn8TgPsz1i
         p51g==
X-Forwarded-Encrypted: i=1; AJvYcCXapAz/DRtkpAimr/+xNnHvUx8ZMQouEVExRJ33ey87lYRJfp2CW0mFFrg/ORK+mC603E3Nk20uFXu+MAb/9xkG@lists.infradead.org
X-Gm-Message-State: AOJu0YyPuMcWknJk2lHMYkC9/qQ937qDx6UFt86ra3xLT5fP7cFcKnnt
	0Jue2hTLtzKvzYjbuW6e34i+BQR1Pr478vHcESGfICTOpJPBTIP2/HAGOAKY1r+KrQI=
X-Gm-Gg: ASbGncuUsAUGj7a8fHt7LpkkWiTrPvplX4PWohc5gDApwALFFNTT5C59Gtyp/Dvvamg
	Qwizbwxh6EyL5SqyRCnkQKSwwQljvjbtKK50mFwq8tLpDm1Hbr+B4E9bLACcz1yi0STLWFPuunQ
	6NRn6P4gR0BzGSzrVwQyV0Yjm2FD7W52LYdxx8Jzpz1WKQhnJqcyxVVQ00z/R/4Rsy8swmBZTAI
	YY+PJ0deRCEVo+gErUxP86EQ1KPFW1xcZkmvfjS8b5+20AJQ6vgV57e7VzbeOdeDGTvQdXbJcSe
	3t2ViaNoUZ2YRseZMabGd2voG96fn4P8E9EosdqCNCbOIviFCeboPQoaA9LAJL8wDX9FZik4xGC
	Ld0lu1fqAGPFg9nzuhPNYbP6gXcYcbdSut9h5bKOgj1wr+lA0GNt4WucoCMsP43PgH4GWT0dEmf
	iuc2E=
X-Google-Smtp-Source: AGHT+IEs1SpeNsDlcNXymDwIPuOqH8vWQgXR2g+gfxRhvnHjkxrNi9d6JZdyI8+CcSx2oE6sMotV4Q==
X-Received: by 2002:a05:6000:4701:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3b60ddc8c3emr13360626f8f.58.1753128926796;
        Mon, 21 Jul 2025 13:15:26 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d92csm11380731f8f.74.2025.07.21.13.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:15:25 -0700 (PDT)
Message-ID: <151ac9e9-19e4-40d3-b6fa-cebc9978b9ae@linaro.org>
Date: Mon, 21 Jul 2025 22:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add thermal sensors support for MT7981
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de,
 rafal@milecki.pl, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250712195904.6988-1-olek2@wp.pl>
 <23b3cd9e-50e2-4888-81a3-c6d340bb9583@linaro.org>
Content-Language: en-US
In-Reply-To: <23b3cd9e-50e2-4888-81a3-c6d340bb9583@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131528_418642_ED217A89 
X-CRM114-Status: GOOD (  12.88  )
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

On 7/21/25 22:14, Daniel Lezcano wrote:
> On 7/12/25 21:59, Aleksander Jan Bajkowski wrote:
>> This patch adds support for the temperature sensor in the MT7981 SoC.
>> This sensor is exactly the same as the one in the MT7986.
>>
>> Changes in v4:
>>   - sorted bindings by fallback names
>>   - dropped accepted patch
>>
>> Changes in v3:
>>   - added fallback in bindings
>>
>> Changes in v2:
>>   - added fallback to an existing compatible string
>>   - removed second patch as obsolete
>>
>> Aleksander Jan Bajkowski (2):
>>    dt-bindings: thermal: mediatek: add falback compatible string for
>>      MT7981 and MT8516
>>    arm64: dts: mediatek: add thermal sensor support on mt7981
>>
>>   .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
>>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
>>   2 files changed, 47 insertions(+), 11 deletions(-)
> 
> Applied, thanks

Sorry, I meant applied patch 1/2

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

