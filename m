Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57DCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 02:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFwFGuMoBlO4UnFHFhFZsqW80xbz11TQVfcLYBTWIYY=; b=RVkdxSiTUKv56rm99wys1jfzTD
	xNscbcDWvOBLZTc2Z34ho7jDP8B7nqpcvSbZ42LTB6LkgNqHOikXqDRrMsJixr4a2DwAe5oSxegyq
	Ed4tzUUs/vnw9rOBfxxa5CS0bqank5lubthDD9GVX05IogBYrIrVQ/vUqB5y7Vqd1NxkgHjTDbnzv
	SpB5/D9dtG6+6NTZ8hhpz85/xSCTyWAlCCZsfUyQdR+kO+cw7FKNLWiYgRVRmG02aa7FeG7grdVbh
	a5wSi8YCY6jaY2trWQjby5EIapmKbbkiqqIqsZ+T9q6uL1kX3IXPhja3zR9Y4VRJfbdKlVt6kVLOn
	kjbIPgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gqq-0000000DH6u-0mHb;
	Sun, 28 Sep 2025 02:09:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gqn-0000000DH6U-3e18
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 02:09:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-27edcbbe7bfso35621345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759025361; x=1759630161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eFwFGuMoBlO4UnFHFhFZsqW80xbz11TQVfcLYBTWIYY=;
        b=CqClk8PNJZcboy3hkVerGSJOdYPjpbq7WHEJ0Cq8LUHQhDCfmS4WQUSBzGc59rEifF
         RyAnLuhWahtM5NmGw2rcr5i5l1WtjdrxuWbk4SMaRm/RLZ5sj5zntqMkOucPr0xMidf/
         nltWJFuGgavY/yJK9Hn9tNaoCFYsLR47Vwj8bvGIkTZH0P479mgt+ZZp5DWVtoowPdAK
         Wl/vQ++KlVrEe8N+1/EUe9p8gEJzxfsJhDNmSudnD8pKvWGu6otGMUnx0eXzPe013tVo
         4dfs1I7G/L9at/dPGrUuPS0HkUkcXyvkcW6rOpgqt2AH6kfRwjBRGdnuf6haEdZuCAcY
         oZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759025361; x=1759630161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFwFGuMoBlO4UnFHFhFZsqW80xbz11TQVfcLYBTWIYY=;
        b=efyfQGoqtvv0QmE3dqKiN2ks6jXxgI4vut6fIfys3SmHBr3X04SkJNJ1JmzzD/+b65
         KSwS5dTXornovY0srkI6z+B6YpAmg8+aydrOJMLQYEbnKNhuUgtGVN5N5mxEwXbMUSrt
         DE66FOITLk6lb+0yPgTYJI+IZAMuiOWOTTyEpQhneLGwM0CzIl9Clzs6maQ/XkxIvtn8
         3N49ZWyoCFkf9X6OmcLjjEx+E9qgtWiODQfSvQRhjEaHC4HHacVSc+U4+wxVi9lqncQr
         fZx4bZ5frsZZxoBkoozmt+cElpwe3zIXGgtlBddVwVC9r8r0WcW/MtfxTxqdqLHCXv6f
         E36Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqXs79OMWHZEgQfO3LBWRM9j/c5lHgoPqyUBL8M3GMIVE0QRHYRBT8WRsBP2HQuEQAqIN8rK8ClYxvD7xerXqX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl9q7emO/UXWFGHOzn9USun+wAq3+gs29iSi8BpLj2hsKPh5bP
	MlkBJ2VjEN0Iv4zJy7393HAUkjr8XOtCecBFGXgjv+KL7lhK4ukHUaVqrlbGs4sE
X-Gm-Gg: ASbGncvqZmxIqDLJgQbotA5EtXT82RCEiFI7hyjMsI7o4uuZa8CmW2OTCqNgBqQZ+kT
	J/Zgq+Bk8OrGNaoywOLiIErq56+a801vx0R010wtR1OUPYbfL1/8LNml4p+pH3fREDiguNFS6pO
	c0GEMIu88O+FfE+Q1osyXpvIarJZVuCgs1sbEZOMUsqyxpvJ3EA0XTdBYrytr/iS9mJMoHaLPOw
	Fo12I53+BCmF+7QSduf8zDvQTFHzJvwTHkzu9tdxYEDF45nlEtqVigQH701Mlhcv7XbNVhAmY6o
	3+BWAK+qfR6Efohlik+fKkYvnGxLbFaaLoVDmnRjTzAeGq4P1aZgsTxpBYojlzf6u1tQ7LyIfDP
	hAJbB1632PKRpfGQ7Fgu8B7i5NAQyp975m4PySXpzmWh4sK9UJSMhuTo4oqBn24QLLpL2+oI=
X-Google-Smtp-Source: AGHT+IENLcEnP9fle5P0/XBhhJQoZV1aQkW9RdCjU8CtjMNudeKurmLux3aZ05laluYZdZcozVy1ig==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr131587345ad.61.1759025360628;
        Sat, 27 Sep 2025 19:09:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ae693fsm90315405ad.152.2025.09.27.19.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 19:09:20 -0700 (PDT)
Message-ID: <827f50ac-9994-4e04-bf48-51774f5d504b@roeck-us.net>
Date: Sat, 27 Sep 2025 19:09:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
To: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250925204925.GA637503@robin.jannau.net>
 <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
 <2537878.PYKUYFuaPT@setsuna>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2537878.PYKUYFuaPT@setsuna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_190921_916105_11490D6A 
X-CRM114-Status: GOOD (  15.36  )
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

On 9/27/25 17:36, James Calligeros wrote:
> Hi Rob,
> 
> On Friday, 26 September 2025 7:43:23 am Australian Eastern Standard Time Rob
> Herring wrote:
>> On Thu, Sep 25, 2025 at 3:49 PM Janne Grunau <j@jannau.net> wrote:
>>> On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
>>>>
>>>> This should be something like this:
>>>>
>>>> "^current-[A-Za-z0-9]{4}$":
>>>>    $ref: "#/$defs/sensor"
>>>>    unevaluatedProperties: false
>>>>
>>>> With the $defs/sensor being:
>>>>
>>>> $defs:
>>>>    sensor:
>>>>      type: object
>>>>      
>>>>      properties:
>>>>        apple,key-id:
>>>>          $ref: /schemas/types.yaml#/definitions/string
>>>>          pattern: "^[A-Za-z0-9]{4}$"
>>>>          
>>>>          description:
>>>>            The SMC FourCC key of the desired sensor. Must match the
>>>>            node's suffix.
>>>>        
>>>>        label:
>>>>          description: Human-readable name for the sensor
>>>>      
>>>>      required:
>>>>        - apple,key-id
>>>>        - label
>>>>
>>>> Though in general, 'label' should never be required being just for human
>>>> convenience.
>>>
>>> That does not sound as it would be compatible with skipping nodes in the
>>> driver if the node misses label. The driver could of course fall back
>>> to create a hwmon sensors without labels.
>>
>> The driver absolutely should.
> 
> The original submission (and our downstream version) do this, but I changed
> it for v2 per Sven's feedback [1]. Outside of development/experimentation,
> we will (should) never have a sensor in the Devicetree of uknown utility.
> If we know what a sensor is for, then we should have a label for it.
> 

Label attributes are optional in hwmon drivers. Period.

Guenter


