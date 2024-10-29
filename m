Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E6D5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 02:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8hQc1q0c7ydkzj5XJQv8spb+cOnEwBuYMtKquh67M4=; b=CbDA/3zfU3bMSGMLRvUpH0NWjQ
	qUEmodtR8yhlKNZfXQCL/+oqmW9QfMAPPHgi5Vimpd6knw1yzEufs606X/7GQbSu8G3Upr8JV6wSe
	U4YTUY4hvg2u2hvm8KhRTksrbxV7aZ2JcFh6le3Xf5cuvU9j148VBLvf2SBrQwQxFqCa1wspYshc1
	6so5tTZQw13vkWyWftePMr4eB781EQIV+BqUYwyYwqxIzU1M40/EB2/pBEhcfqEXwCm+wqNFKyEa+
	84a8OOGFZLuDuXgGPeZrcU0SMFTCQcPgSJHbX8NtKRMmwbnYSWNxsBFHaKozktyEMWT/0ZFoOzj+J
	wjj7CKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bYv-0000000Cv8S-3SED;
	Tue, 29 Oct 2024 02:02:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bXI-0000000Cuv6-2P4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 02:00:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cdb889222so46457465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 19:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730167243; x=1730772043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8hQc1q0c7ydkzj5XJQv8spb+cOnEwBuYMtKquh67M4=;
        b=NhXQUeFuU4GvoNGQXGv1Lo0utrE3NOhJ9r44RGMIXAygVS2r74a/g8LB8/YLsFtm6u
         Z8SzXSLUwOqddNaXz8cWOt5szvvO+IFvLU4aeJbYruqiEEXXcC5zlBqB6rx7la4FIIKa
         PgluQ9sU+wSaHOuABazTwZmqbAB97hFVzRovAN6BPc5qcMdWbxbRH53xA5qARVAByuTA
         j+kaNafnjjweFYfsnjlym7dGVrcgKcdSI/ZF47dRdgIFD+DY39xLnhkYcSwQ66uQgQ4r
         NgMRPVuLxeawynD1MQ82MTFB2pDvQEsm2FtWrPtLquJG25dji94UG2d0zE+bW238lsxU
         jKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730167243; x=1730772043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8hQc1q0c7ydkzj5XJQv8spb+cOnEwBuYMtKquh67M4=;
        b=VofnU1Qc9DgATj/KH89E0KtK8cK1qSOXXPhwUppmp9U5OalK5SXDnjxR/u1WK1JKf4
         WgP78Z7nni1Cis4pLMx9/PhCuhiWKnlyjbWBEY8sT5FVAj4IjGkZM7sltOqR9HNMwJR9
         bOo4jpCpu8Z6j9ozfavMEwiUhDMMf4jMvJ7F7EJfVU7ZYYNThvA9f4xI2zq/3Il482FX
         gfgic08mygv68yfP/V9aHBAQM0jDQvOEC67fhZXgi8easM+cSXerzgUe7sgsNt9hucoJ
         d7+6b/AR0VTmhgquaGym7zqdCkOoLVBMKgfjBcfzcCwhFZ/SeqzKzmhKSvPklCgPiegL
         SCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdqv2rHNfpSYm+duSw6M5iedNgxQ279QVTMoe1BA2ieTxjLU0bp/vF57Erb5mhQh1M7v9/T3/K51432Ug7ROFW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr1Qfldk7hTMota4AyYVCnh46b4iwJ90OF6zVzfnzJWzfF/pn5
	xf9iUpqid/ePTmP9qqbgznm68MyrJkfr5am/lRRMLTdRNhWn9EDj
X-Google-Smtp-Source: AGHT+IHMp3p4tpfyLl4RBnJLnYbIe3AX6KVzvQAl8IiivMOzrOseT29gVE2QoPoZ7v8iAA8jRIZnvA==
X-Received: by 2002:a17:903:2343:b0:20c:675d:923d with SMTP id d9443c01a7336-210c6c6f732mr150637715ad.39.1730167243375;
        Mon, 28 Oct 2024 19:00:43 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc044a4csm56476155ad.248.2024.10.28.19.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 19:00:42 -0700 (PDT)
Message-ID: <5d9e89aa-db10-4367-8417-9fcc1a3bb37a@gmail.com>
Date: Tue, 29 Oct 2024 10:00:39 +0800
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
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <9b0a508e-d9ae-45ab-882f-5bc1f03e13db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_190044_620318_3A8DCACD 
X-CRM114-Status: GOOD (  14.77  )
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

On 2024/10/28 下午 03:04, Krzysztof Kozlowski wrote:

> On 28/10/2024 02:15, Ming-Jen Chen wrote:
>> On 2024/10/25 下午 07:42, Krzysztof Kozlowski wrote:
>>> On 25/10/2024 07:36, Ming-Jen Chen wrote:
>>>>>> +      0  = 0 clock
>>>>>> +      1  = 0 clock
>>>>>> +      2  = 0 clock
>>>>> Heh? So this is just 0
>>>>>
>>>>>> +      3  = 8 clocks
>>>>> This is 8
>>>>>
>>>>>> +      4  = 16 clocks
>>>>> 16, not 4
>>>>>
>>>>>> +      5  = 32 clocks
>>>>>> +      6  = 64 clocks
>>>>>> +      7  = 128 clocks
>>>>>> +      8  = 256 clocks
>>>>>> +      9  = 512 clocks
>>>>>> +      10 = 1024 clocks
>>>>>> +      11 = 2048 clocks
>>>>>> +      12 = 4096 clocks
>>>>>> +      13 = 8192 clocks
>>>>> Use proper enum
>>>> I will update the definition to specify the debounce period in terms of
>>>> keypad IP clock cycles, as follow:
>>>>
>>>> nuvoton,debounce-period:
>>>>        type: integer
>>>>        enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>>>        description: |
>>>>            Key debounce period select, specified in terms of keypad IP
>>>> clock cycles.
>>>>            This value corresponds to the register setting for the keypad
>>>> interface.
>>>>            The following values indicate the debounce time:
>>>>            - 0 = 0 clock cycles (no debounce)
>>>>            - 3 = 8 clock cycles
>>>>            - 4 = 16 clock cycles
>>>>            - 5 = 32 clock cycles
>>>>            - 6 = 64 clock cycles
>>>>            - 7 = 128 clock cycles
>>>>            - 8 = 256 clock cycles
>>>>            - 9 = 512 clock cycles
>>>>            - 10 = 1024 clock cycles
>>>>            - 11 = 2048 clock cycles
>>>>            - 12 = 4096 clock cycles
>>>>            - 13 = 8192 clock cycles
>>> No. 0, 8, 16, 32 , 64 etc.
>> I will change it to the following content:
>>
>> nuvoton,debounce-period:
>>     type:  integer
>>     enum:  [0,8,16,32,64,128,256,512,1024,2048,4096,8192]
>>     description:  | Key debounce period select, specified in terms of keypad IP clock
>> cycles. Valid values include 0 (no debounce) and specific clock cycle
>> values: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
>>
>>>>>> +
>>>>>> +  per-scale:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>>>> Missing constraints
>>>>>
>>>>>> +
>>>>>> +  per-scalediv:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description: Per-scale divider (1 to 256).
>>>>> Missing constraints
>>>>>
>>>>> Both properties are unexpected... aren't you duplicating existing
>>>>> properties?
>>>> pre-scale:
>>>> This value configures the IC register for the row scan cycle
>>>> pre-scaling, with valid values ranging from 1 to 256
>>>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
>>> Please look for matching existing properties first.
>> I will change it to the following content:
>>
>> nuvoton,scan-time:
> Why? What about my request?

I utilized|grep|  to search for relevant properties in the|input/|  folder using keywords such as|scan|,|time|,|period|,|freq|, and|interval|.
While I found some similar properties, I did not locate any that completely meet my requirements.

For example, I found|"scanning_period"|, which is described as "Time between scans. Each step is 1024 us. Valid 1-256."
I would like to confirm if you are suggesting that I use|scanning_period|  and explain my specific use case in the description,
for example:

nuvoton,scanning-period:
     type:  uint32
     description:  | Set the scan time for each key, specified in terms of keypad IP clock 
cycles. The valid range is from 1 to 256.      minimum:  1
     maximum:  256 Could you please confirm if this approach aligns with your suggestion,
  or if you have any other recommended existing properties?

Thank you for your assistance!

>
>
> Best regards,
> Krzysztof

Best regards,
Ming-Jen Chen


