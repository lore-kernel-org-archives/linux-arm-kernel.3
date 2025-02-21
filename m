Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD39C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=; b=erf1vsiBWljt0fpAWpp6pkXqAk
	M8z/FU/XJLRVgMM/4qWOBK63ELHIVGvXmiPL+AvFXJ/7T87QCzcd/WrauYDbYFKFhdqavUkB7ri0P
	kgl9m9jeIKZ+axmD8XAOBvMbFxPVrF7bwro+/cc5R2LSFk/RJ9EBipYnZ5/ex8gJJZ6LAqALz9xjh
	arZBBrQDSKo0TJdVS1UEgpBWcffbhKDrL+UHsV/t07sAYDji7+nvIsAYKjidkM2mGtPc1sGr6wkds
	D8NOi1X7qajux16HD7xexCuoW7NSd7+qW5Z5ZSiqW5uDIsEbtaInck3FOiFp9zqY4ch4O937EV9mw
	WXEq7cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOqm-00000004oA9-2Iw6;
	Fri, 21 Feb 2025 08:57:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOou-00000004nkD-0fHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:55:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso982412a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740128138; x=1740732938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=mgstJLjXzZHdspFAl8ypJq3GuAnlTwgJro339XN2RkBIB9zTfI6GKwDhKVzIVT8Lbg
         oHQS6up1PGw4FuR7ekZ76oi/VG/h7b3RaFJLQNDiqvtzPfNzfi2uVNiIITZBaxl7djop
         PDyMhhOBvbIZFhTeNUQ60Yn5Q8agPOLEFezlItNxf7mSjFm5cxgCmmRnpRkBWzyahA4n
         5Yv8+AUTztw1M961BGiWwMkDipFKr4kPeULsijpWgvQoDCHhHunjGc5jEH4145ag7mgu
         dxO63wgUKR+nN7yrYZ5PWjhoXNbbRY45EopaAEPaudnGwfZgVYqGPW81qsoYpaNC1QTC
         p8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740128138; x=1740732938;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=sdFISHojzg7JIOA6bmxZqT/H2OYgC4ke8/xY7WgMnIK9EFRgiYlanNs+UFx0JWjgvD
         QTSlfnkgg73U5GetALFxTZzpMgfqJH7koMeMZKcSOwX6oWvX8IHHwNjQFAAvNRHSgxyE
         qWmepGeiQY2O/IzgoxCqTnc9xiuwdw8HvGILcZw6bV5gJ3kHT9kgvq2X2QEDVkscTlG3
         qGOsV/W8GZ3bpBbrop+Lzy0EJ9J6PCwrWARXc0C7YIyrfz0UvoBbcEEkZ0NbDYmVuxqx
         /P04XNyOQEkHg2N47JeSZzpG20lwIzIYa82aoKeTLoBqVbDNnX2qayOGNL3yAEzhVa6g
         KU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtrKU+JrWK+i6c5ZsO+lbSiWcJSpjWXy1yOgSCOVZZOOYfiQ/ngznHEC7TzUr+KMKHV4fTB4jt/Wx2yzp6ES7H@lists.infradead.org
X-Gm-Message-State: AOJu0YzGeIa+0A+CCq1TuB8HgA/EQ5knVD1J+6WjH+f0dTRyXYvwpk9b
	AODenXGoQMKE3lPakrv53WVrJGEIiuf44194fOC7KW1RIjjvsnfY
X-Gm-Gg: ASbGncvf9zmE+ObvzhQSOexzLMpcxaLp/ZQhnCK78+V089Zht7tRv/BxDvMQiydrZRv
	lmqeFEAwTP8kcn+VP8zp7JRgFBmN/q1P+KTHWgJ7vKkOx12AlCH3SvdvrESSnD+4K6CvbamKe50
	bn/XI55g7vMB0CFcgMS/OZ+vBNrNX8dpE9wXlBdH2MgwJjHibDwXNTSXn9JzFZf0Cz0l6QRq41M
	YG3j0QOcb5jqgb9jz3mNMH7TAnr63YbDPFouSGZ3s6OGMOK0d2lcDXY05BSG3wLiPnDKfHDB9nb
	WVJwB2DPh3MGiLZ66i9iJmkMH/UBaTor
X-Google-Smtp-Source: AGHT+IFmTTdAgUDzbiHX+T9rWqsmdcKpPchN5TpDb6Tvrcof3AwRJCep4kmOdcOa6E6Gwr6wzr7kuw==
X-Received: by 2002:a05:6402:1d4e:b0:5e0:b542:fb32 with SMTP id 4fb4d7f45d1cf-5e0b70f002bmr1915674a12.19.1740128138254;
        Fri, 21 Feb 2025 00:55:38 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c58e2sm13515163a12.20.2025.02.21.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 00:55:37 -0800 (PST)
Message-ID: <51294a91-afd1-4e62-b320-88ee233fbfc9@gmail.com>
Date: Fri, 21 Feb 2025 10:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_005540_233680_22DC770D 
X-CRM114-Status: GOOD (  26.64  )
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



On 2/21/25 10:38 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> Thanks for the patches.
> 
> On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
>> Multi-camera systems often have issues with receiving video streams
>> from multiple cameras at the same time because the cameras use the same
>> Virtual Channel IDs.
>>
>> CSI bridges might not support remapping the Virtual Channel IDs, making
>> it impossible to receive the separate video streams at the same
>> time, while the CSI receiver is able to de-mux streams based on VC IDs.
>>
>> Cameras sometimes have support for changing the VC IDs they output
>> themselves.
>>
>> For a practical example, GMSL2 deserializer chips do not support VC ID
>> remapping in tunnel mode, and neither do the serializers. Allowing the
>> cameras to have their VC IDs configured would allow multi-camera setups
>> to use tunnel mode.
> 
> We've tried to avoid having virtual channels in firmware and in UAPI,
> I'm not yet entirely convinced we need to depart from the established
> practices. Let's see. Apart from that, please see my comments below.
> 

Sadly there's no other way to handle multi-camera support for GMSL
devices that don't support VC ID remapping. And upcomming GMSL3 devices
only support tunnel mode which doesn't support any type of remapping.

>>
>> Add support for specifying these Virtual Channel IDs in Video Interface
>> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
>> Although the CSI-2 specification allows for up to 32 virtual channels,
>> most hardware doesn't support more than 4. This can be extended later
>> if need be.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> index 038e85b45befa..414b5fa8f3472 100644
>> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> @@ -231,6 +231,17 @@ properties:
>>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>>         busses only.
>>   
>> +  vc-ids:
> 
> Other properties aren't using abbreviations, at least most of them. How
> about "virtual-channels"?
> 

That works for me.

>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 

For the moment I picked 4 VC IDs (2 bits per VC ID) because any more
than that doesn't seem to be supported by CSI receivers, since most
do not support extended VC IDs.

Also, from the MIPI specification:

The Data Identifier byte contains the Virtual Channel Identifier (VC) 
value and the Data Type (DT) value as illustrated in Figure 32.

The Virtual Channel Identifier is contained in the two MS bits of the
Data Identifier Byte. The Data Type value is contained in the six LS
bits of the Data Identifier Byte.

>> +    items:
>> +      maximum: 3
> 
> 31 here, too.
> 
>> +    description:
>> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> 
> I'd leave out the explanation on the data type. It's redundant.
> 
>> +      the VC IDs used by the device for its data streams. This property is valid
>> +      for MIPI CSI-2 only.
>> +
>>     strobe:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       enum: [ 0, 1 ]
> 


