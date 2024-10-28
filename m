Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653C7D13590
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5mbMT7c/xF5gJ/9esVEkt4fmWDi68Ivvmcpowxh1iI=; b=oS2IFmU318VjKARI7FpmDkida0
	UqhPcJrm+Ujro6qGKmU9saHWy9OXKV4jKdAEGlXlFzISohDQg0YiiZD4M8Fy7mBHa+8I8lzuTqb14
	N1kj32BachCmoX0/9Bbl72JPMLFIexeVvKzIRjBkAyL0gXoh4I9XtzIzDyxHwNWp9kbpXbg1k/Akb
	UaAgozQb8k8Lq204dl8azaWKfVepOIQ2kLSgjvV9bUbcpIm1ZXB6tBNuhb9wax+zhpmWoh5gFen1M
	0b+d/NE3c0JJHplUdjVSh9AycZ5e9IB1bUmsOX4mE9gIvbtAul+rwuPAqzrXmdzglwPx8qK0dUWrf
	xqhG5w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EVO-00000009DIw-0EP5;
	Mon, 28 Oct 2024 01:25:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ETh-00000009Cvz-2D8S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 01:23:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso30628755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 18:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730078609; x=1730683409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5mbMT7c/xF5gJ/9esVEkt4fmWDi68Ivvmcpowxh1iI=;
        b=kahbcuBXPbNFuoAT9u7UlfrVNBipyLva12w0Ah9Bs9lgh1yn9Ls18OwTSYcick/y/E
         B9kmMVN4owRNlmMT/zPk7vyyNLMThAXx+4j02qZ9eFvY/SKOfjs8UgRVFSms5L20r/Fk
         BJCSfdI34seE9sAGVf8cvAdX+CuFSmznWX2mCLxSuP1dnaH9Pr2JI69rs+TUjbezYZvT
         hGlKv9i4ADZ0s1CrqkCfBxkEYM22xrLzqNyZT03CNtDgOKC6p0uc3nP8f3dRquxCacXr
         /8pOO4VD/OkVYsKQ9ysBdLmgG9cLVVYsAs4pS1YWfZARvLFeUrDwLBzZmIJmVLlm2l+X
         y0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730078609; x=1730683409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5mbMT7c/xF5gJ/9esVEkt4fmWDi68Ivvmcpowxh1iI=;
        b=oTv9VQ0pvTXFAdi3V3dNAZ8sCfNFqeLwoAYVB1/g+W2qC7S/QMB9aXj+wHQQv/muoq
         hBrjinSJE9qhAVa6MaBiwenzuH6I5c6h9sCi205P8MEg9chMd6xQpuqnriPYvJlie1Gj
         VyP5HWFp4hxwndyGdZ9E/7Goxt/0I6s3OonbpAYWTICTSzYtISN1gKECLP7uHhBIwD3X
         3UdnJ+cXqkmvBLjR1btnpOc9jseflkwe8itb4Vh6q1xGddc/4DhUWXkbfc1b2vEhfH3C
         GbEZleegiVyf/eUI7Z5JqJwRImG/0xnUEzx7i3PczR1XNOdaiPRd8NMsFxy1DNFZ4EbR
         B6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwbMkbP7MiFy7RMjoYsLgRMUVMFHF2Z7hC8Ww8RiXjiQf7E6t0S+hjqQ4abi/mJtzEtjtZ8G8aRiy/55D7EdGz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjy33oKTIxB3OBZpn5Sz4fyPwaIMC7QU+SquVZyGFJI5ICMdeD
	GoKTFcvSgDV1Im/sbhp2k0rlcOtQqrS56kg4Oyh68+ta+uTEegJE
X-Google-Smtp-Source: AGHT+IGPTqON5yczkQQZ40CfVtwv0LqbTvJQFsIl8Iev1gtt606RwXiUBJItJfMCD5Qy+h9NFZ7Ayg==
X-Received: by 2002:a17:902:d50c:b0:20c:9eb3:c1ff with SMTP id d9443c01a7336-210c6cc5afbmr97513125ad.59.1730078608609;
        Sun, 27 Oct 2024 18:23:28 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b201sm40225325ad.272.2024.10.27.18.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 18:23:28 -0700 (PDT)
Message-ID: <e018fd4a-2af0-4062-8128-e2465dba8728@gmail.com>
Date: Mon, 28 Oct 2024 09:23:24 +0800
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
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ef407e89-950f-4874-9dca-474d107f6a52@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_182329_591183_0C9328E7 
X-CRM114-Status: GOOD (  12.65  )
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


On 2024/10/25 下午 07:42, Krzysztof Kozlowski wrote:
> On 25/10/2024 07:36, Ming-Jen Chen wrote:
>>>> +      0  = 0 clock
>>>> +      1  = 0 clock
>>>> +      2  = 0 clock
>>> Heh? So this is just 0
>>>
>>>> +      3  = 8 clocks
>>> This is 8
>>>
>>>> +      4  = 16 clocks
>>> 16, not 4
>>>
>>>> +      5  = 32 clocks
>>>> +      6  = 64 clocks
>>>> +      7  = 128 clocks
>>>> +      8  = 256 clocks
>>>> +      9  = 512 clocks
>>>> +      10 = 1024 clocks
>>>> +      11 = 2048 clocks
>>>> +      12 = 4096 clocks
>>>> +      13 = 8192 clocks
>>> Use proper enum
>> I will update the definition to specify the debounce period in terms of
>> keypad IP clock cycles, as follow:
>>
>> nuvoton,debounce-period:
>>       type: integer
>>       enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>       description: |
>>           Key debounce period select, specified in terms of keypad IP
>> clock cycles.
>>           This value corresponds to the register setting for the keypad
>> interface.
>>           The following values indicate the debounce time:
>>           - 0 = 0 clock cycles (no debounce)
>>           - 3 = 8 clock cycles
>>           - 4 = 16 clock cycles
>>           - 5 = 32 clock cycles
>>           - 6 = 64 clock cycles
>>           - 7 = 128 clock cycles
>>           - 8 = 256 clock cycles
>>           - 9 = 512 clock cycles
>>           - 10 = 1024 clock cycles
>>           - 11 = 2048 clock cycles
>>           - 12 = 4096 clock cycles
>>           - 13 = 8192 clock cycles
> No. 0, 8, 16, 32 , 64 etc.

I will change it to the following content:

nuvoton,debounce-period:
   type:  integer
   enum:  [0,8,16,32,64,128,256,512,1024,2048,4096,8192]
   description:  | Key debounce period select, specified in terms of keypad IP clock 
cycles. Valid values include 0 (no debounce) and specific clock cycle 
values: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.

>>>
>>>> +
>>>> +  per-scale:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>> Missing constraints
>>>
>>>> +
>>>> +  per-scalediv:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: Per-scale divider (1 to 256).
>>> Missing constraints
>>>
>>> Both properties are unexpected... aren't you duplicating existing
>>> properties?
>> pre-scale:
>> This value configures the IC register for the row scan cycle
>> pre-scaling, with valid values ranging from 1 to 256
>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
> Please look for matching existing properties first.

I will change it to the following content:

nuvoton,scan-time:
   type:  uint32
   description:  | Set the scan time for each key, in IP clock cycles. The valid range is 
from 1 to 256.    minimum:  1
   maximum:  256

nuvoton,scan-time-div:
   type:  uint32
   description:  | Divider for the scan-time, further adjusting the scan frequency for 
the keypad. The valid range is from 1 to 256.    minimum:  1
   maximum:  256

>> This will describe its role in setting the divisor for the row scan
>> cycle pre-scaling, allowing for finer control over the keypad scanning
>> frequency
>>
>> I will change it to the following content:
>> nuvoton,pre-scale:
>>       type: uint32
>>       description: |
>>           Row Scan Cycle Pre-scale Value, used to pre-scale the row scan
>> cycle. The valid range is from 1 to 256.
>>       minimum: 1
>>       maximum: 256
>>
>> nuvoton,pre-scale-div:
>>       type: uint32
>>       description: |
>>           Divider for the pre-scale value, further adjusting the scan
>> frequency for the keypad.
>>       minimum: 1
>>       maximum: 256
>
> Best regards,
> Krzysztof

Best regards,

Ming-Jen Chen


