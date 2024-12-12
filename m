Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB91E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk4a8zDUNM2R0E4snQBxkDhcU3anJgMWX77nhsVAD+0=; b=zvm2w3xex/EEYsYNQ1wxhYsLr/
	SKwSgSwRczI9Qbw7lUTsPBCzTYUWNNusPMzp13/gOex+br67GmmKljaJ4liUIBev1f6qkuQSrAXRi
	54v9+jcKSZfT5/bFzaA9AgzLm5HNBlksAPb5RzPtGeUXpT4RmbykgsUczDOu6uN4vyWJy5HoQRKsW
	A4gIX0wJTDxcVOc//PYxEz+lZ6GxMfG0HLz5fefpfKquVqOAuy09/sFgz99umeLmyVjd00MjlJmEb
	B+Ym5ZAlAAsrzSFEMn5aP4fjHkGWr+dMs7y91ehot/JnQJoBV6j48r1J25PEVesFAkvzoHBJV2Bmp
	fvNWpChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg0f-0000000Ha9c-1Rs3;
	Thu, 12 Dec 2024 10:01:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfyf-0000000HZmm-0nKZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:59:26 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa6a618981eso59772566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733997563; x=1734602363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zk4a8zDUNM2R0E4snQBxkDhcU3anJgMWX77nhsVAD+0=;
        b=H3dxO3kFGuHyltV/u4Ke2xMA5n4X5Hzb+s0QyGfbmiqOjYkTxFqnSB8OwTGoL3KjhD
         otZAO1fMtNQCsu2k6ilGQl3vHy9bnvc7ZntYGLEP2uNgjl481QibXbIAZAKyt/vXV4ox
         Os2j1GyiCFir/riHs/MtI43h2drawWmQVrYE6RL+shCCpUHibM9Ogn0y3kQMkHPEIKJm
         IWEWWG4630D+rmsGZWATOacg+ZRISlV/r3TOaRLS1t/vq0thcaavXY5aIKRatSnL05p/
         85zGets9+GWGNqPg4stXTUQzPI/luiYDxcmGi8KTXKk/h+idkwpIr6n6WfR69vbat3TM
         AheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997563; x=1734602363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk4a8zDUNM2R0E4snQBxkDhcU3anJgMWX77nhsVAD+0=;
        b=baM7FI7Z8YCfc2v1ClQOtg6krQ16pGbAzCRTwu/SGXuCKj6V5jYYWl1s4q0mj1pQnh
         SnA+Jw/mh/eYvRBPizTTwUZpGuzguQ+NRZy8BSweJu8LIQhepsaWZnywZ16VTPGxpjma
         P9y+SaUTjNlGUfHQi6TZ79xNh1kGuWBZY+ysHE7YWWg2VvKI3X6vQ3/NcKDxp0BHHR8a
         MRtxb/gBqcLsbhGS2aOZquZVbbsUfatA15rRAeLGGYtPFNZQYhdeBIELAYATJPzSyj80
         vRABUEUl866REgqeORF5FTPNH/joCPWS9j+UmX/O+ZRJsBMaFqukzdl2ePDXqZZul+Fi
         15uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYqmmoheG3sdwHy/7h2xkGzLjNfSCFM0UcCRu3ebEhky1LMxG+gJOHl+GKjMpvXl76BZHhz607Tw5XqyZdmsNM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/LV9O/meF3sohFmgmYKvUW2eAAm7TAJPuya7SdQwq3Hr19PMe
	5J3//mT0Ikg7zKx152fiBUGwa276j1gyMERVyEHhWKvJybTw/hV2
X-Gm-Gg: ASbGncuXxsGDPDgruXbHkcLs0otzTvZXZ3TnGwbwhZ8mcWiXJszntRy8oTwzYUv0AW6
	zIOIaL/bicptVNRQOt90wpZyon2sjXS255qhMM/j/iZhoEilRfJdpsn1Ms6KuKrIhp7PHFJxxCt
	B3Feo51IGxFN+BU+B3pkXNeUoTpF5ojtnn7VxDDvGhvlmJ2f1SnApRGctNUdqTtc3ozYnn/eXOR
	AY1CwkGht1z5ypauOlGrs5ipzWuybSt/czz/NTIEsETDej9op3c8VlHFpdQmkhVzWIt76Elf0wR
	P6PxiA==
X-Google-Smtp-Source: AGHT+IHsoB7ECXZa+537Kblyf0Pjp2NQCDzrPJy9QJIErcCrbfwLPbPLg6bypSTjvP8hBq30GN5Gpw==
X-Received: by 2002:a17:907:920d:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aa6b11e5531mr571613466b.32.1733997562783;
        Thu, 12 Dec 2024 01:59:22 -0800 (PST)
Received: from [192.168.7.105] ([92.120.5.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa674a112c7sm683296666b.147.2024.12.12.01.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 01:59:22 -0800 (PST)
Message-ID: <1fc1f1ae-766d-4266-84ec-11dbd67a608a@gmail.com>
Date: Thu, 12 Dec 2024 11:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
 <ZzUH3n50Vw6RhmNJ@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZzUH3n50Vw6RhmNJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_015925_236434_7FC2EB31 
X-CRM114-Status: GOOD (  14.83  )
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



On 11/13/2024 10:11 PM, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:38PM -0500, Laurentiu Mihalcea wrote:
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
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> index f943f90d8b15..94588353f852 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>> @@ -37,6 +37,10 @@ properties:
>>    codec2codec:
>>      type: object
>>      description: Codec to Codec node
>> +  hp-det-gpios:
>> +    $ref: audio-graph.yaml#/properties/hp-det-gpios
>> +  widgets:
>> +    $ref: audio-graph.yaml#/properties/widgets
> why not direct ref Documentation/devicetree/bindings/sound/audio-graph.yaml
> and define these again here.
We don't actually want all the properties from 'audio-graph.yaml' (for the moment at least). Also ref-ing 'audio-graph.yaml' will make the 'dais' property required, which is not targeted in this patch. Maybe Kuninori Morimoto can comment more on this.
>
> Frank
>
>>  required:
>>    - compatible
>> --
>> 2.34.1
>>


