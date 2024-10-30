Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C296DD74954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxFMjfk3ggTn0moJ8sPpGVsqjY/2TWidvbtEhX4CnB4=; b=WFRTeoQSx6oDlMQqhiwp5GKRFN
	bmlU/AJ+BsqqicRKfL7V42zz7Qc1nXEe4QidOlPGtv6lfhoz6AHZw78xovO/ni4w0SCeMv9vf+Qjg
	QFbZ+66vHqKMMCj+h8TSJFJZooh0aV9uB7OzjC0MEzeJMEQjG5HU1qn20nLc+ABZppu3yiM5VnnCO
	wGqH5DneHJjZOtUU2ESKS5gAYzR2FR3UvSfQBaQX2+RaapTLdb2cmSDgnb3BFKRgEnqxGJaiq0SKx
	aHrD34gXUBl5MonpS3xo8lRsRwY7U4huC3DtPQv4TrZ59nINwf3oIBOrLnfbHNnroJMhbhtkCOX+Q
	zg+skMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xou-0000000GT7I-3agE;
	Wed, 30 Oct 2024 01:48:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xnG-0000000GShd-0LRs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 01:46:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20cb89a4e4cso41320145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 18:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730252801; x=1730857601; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxFMjfk3ggTn0moJ8sPpGVsqjY/2TWidvbtEhX4CnB4=;
        b=Z2iXwqjy0sg6qQd7g0pv/Ja7I8T5fdxcT0Sx2noo3ankRXiAf27+Msjg3Xg6FlvUnh
         NRg7lQgHFZtZXpAOhSxIyulgOnQVrMpOgXTv3YNIcChDfgIfoCmiiW2dHc4LqobXcVIU
         ppU+WQ3i8LtPuurjvhlF7yDJmLqVXDfwTcnvDtqXqCQliumWfdDUZnmHgHL7pypXvaSV
         aRXv2d2kMaGc/pjrnbbAAYRA7yVA9QoWHqZSrXTxwC+/1CQLH3/F3AaiO2OycFwYIJlt
         KTpcnTtjUCbkPxBefO4zugGCbOlDUWo8Qjz0QqaBQQMN1w11INiQaMJDZzOmQlKpVshL
         vmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730252801; x=1730857601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxFMjfk3ggTn0moJ8sPpGVsqjY/2TWidvbtEhX4CnB4=;
        b=wU4YTMFdEIEwn31DjjmltfG8NtzhyxfWaiuK2JQdPv0zWrzsxfNf2K0CfdKCYDKz6u
         +XOLit+071aTT7fMhoRRsYpOVKJq+92mggMTjo1eMC9GpC7lv5r74cUlpZHZDmwdTivj
         fdOcyiUgg7KLdoBP9NWkZJK01pkoaTYxwiOybowu41nakEYeEy6906+8YzyQVGNGkfSm
         /5l/WLcZ/g4j+B6Q2sJ6/pcE5Tn2sJAwXLKab35BlPMgJFa1lW/G5I6ranBw9ubsxeay
         T0BqimCGb76/Rmq9FTKZQCH9ZC4K3kVBTUXit/E8AkitQylbfF/YTr/LGVIO2bDBXuWk
         xa+w==
X-Forwarded-Encrypted: i=1; AJvYcCXGqei/yIfvbr30v8fpBhhgDg/YrN00NvW3hlGXfEN0dqsCmmdl7VN3y8heCdKHKO1xm3n4acHJwvNZ17F/cQmS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2fYysVwkD+rmfQnKaCJxjLkN6+pUuCVqIHJMlcqENukW5bv9a
	rH5gco0vaWFwUsUo7IggXugi6snBvaqgYzWysHhytXnmgCMrdfqE
X-Google-Smtp-Source: AGHT+IFZaj6aH2mDsjSI9GjYLL9VJVuI4bzhbZhrUs/Yck/v3RydR1pivAyoeT2NdQVzHEfQvCmzpQ==
X-Received: by 2002:a17:90b:4b06:b0:2e2:cd62:549c with SMTP id 98e67ed59e1d1-2e8f10867cemr16377916a91.22.1730252800759;
        Tue, 29 Oct 2024 18:46:40 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa57cc3sm380550a91.32.2024.10.29.18.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 18:46:40 -0700 (PDT)
Message-ID: <d6bf5b0d-7036-4636-a15e-41db6f665323@gmail.com>
Date: Wed, 30 Oct 2024 09:46:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
 <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
 <871e9a4c-7a3c-4a24-8829-a079983033da@gmail.com>
 <ef407e89-950f-4874-9dca-474d107f6a52@kernel.org>
 <984781ba-9f4c-4179-84d5-4ab8bbe4c3c6@gmail.com>
 <9b0a508e-d9ae-45ab-882f-5bc1f03e13db@kernel.org>
 <5d9e89aa-db10-4367-8417-9fcc1a3bb37a@gmail.com>
 <844798ab-2910-458e-a9c5-dc69f5c8e368@kernel.org>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <844798ab-2910-458e-a9c5-dc69f5c8e368@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_184642_149305_7AFCE0DF 
X-CRM114-Status: GOOD (  22.95  )
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


On 2024/10/29 下午 09:19, Krzysztof Kozlowski wrote:
> On 29/10/2024 03:00, Ming-Jen Chen wrote:
>>>>>>>> +
>>>>>>>> +  per-scale:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>>>>>> Missing constraints
>>>>>>>
>>>>>>>> +
>>>>>>>> +  per-scalediv:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description: Per-scale divider (1 to 256).
>>>>>>> Missing constraints
>>>>>>>
>>>>>>> Both properties are unexpected... aren't you duplicating existing
>>>>>>> properties?
>>>>>> pre-scale:
>>>>>> This value configures the IC register for the row scan cycle
>>>>>> pre-scaling, with valid values ranging from 1 to 256
>>>>>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
>>>>> Please look for matching existing properties first.
>>>> I will change it to the following content:
>>>>
>>>> nuvoton,scan-time:
>>> Why? What about my request?
>> I utilized|grep|  to search for relevant properties in the|input/|  folder using keywords such as|scan|,|time|,|period|,|freq|, and|interval|.
>> While I found some similar properties, I did not locate any that completely meet my requirements.
>>
>> For example, I found|"scanning_period"|, which is described as "Time between scans. Each step is 1024 us. Valid 1-256."
>> I would like to confirm if you are suggesting that I use|scanning_period|  and explain my specific use case in the description,
>> for example:
> Description of these properties did not tell me much about their purpose
> and underlying hardware, so I don't know which fits here. It looks like
> you want to configure clock... but then wording confuses me -
> "per-scale". What is "per"? Isn't it usually "pre"?
>
> So in general I don't know what to recommend you because your patch is
> really unclear.
>
> Please also wrap emails according to mailing lists standards. And use
> proper line separation of sentences. It's really hard to understand your
> email.

I apologize for any confusion caused by my previous responses regarding 
this issue.
It seems that our discussion has reached a bit of a bottleneck.

I have a suggestion that I hope you might agree with: I would like to 
upload version 2 of the code.
In this version, I will rewrite the properties, although it may not 
resolve their underlying issues.
I will also continue to keep our current discussion ongoing in version 2.

Thank you for your understanding, and I look forward to your thoughts on 
this approach


>
>> nuvoton,scanning-period:
>>       type:  uint32
>>       description:  | Set the scan time for each key, specified in terms of keypad IP clock
>> cycles. The valid range is from 1 to 256.      minimum:  1
>>       maximum:  256 Could you please confirm if this approach aligns with your suggestion,
>>    or if you have any other recommended existing properties?
> Why this would be board dependent?
>
> Best regards,
> Krzysztof
>

