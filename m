Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AEED0EE10
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=; b=WEhzjwQFEX2szNYbwxLognt6Gi
	arru/81IkKRgRFnoUMAac2NHZQRxw2JlP9BpBhQyM58enbMA3Wz4er2M5SLpFFnNVYdLCQYUUq/v2
	HsCLB7uqIq29FqJ/oRGiiShwlKQsN8aYnPokGAej6U3r1ns0aD1ThJhgcz8Mmmwzlk/qxHiTpWWXL
	UWqdNu6QzhhBAuX7ltfR85m3Gz/SKOEhezjL9hF41QC1zaW/XCujL0igVQZOTLqXg3Sl4YhLjn4Pw
	lAqQXEEpwvt9+JPKPNXFLTjoS1oDkW2ZRsD1BDoLBbs+df+W0DFhazshyPbHUkfEB3hLYTg1UEn5N
	ghXfHyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2zp-0000000E6E3-2nHH;
	Wed, 26 Nov 2025 00:02:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2zm-0000000E6Di-3F7s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 00:02:56 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso5000103a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 16:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764115374; x=1764720174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=PN+1YpIkIpBEixArNaSrTSJ1QvOfgIXDOfpqZtWn+pj0p/i7YRKXiAy9kB6NHC5yur
         fNktuFGXh4ridmCX0sewE7zTZzbQ5Gtllq4LD8vZ6T2bBjJerS+yqmS/d85eXzZm3ydQ
         Rr6UGQ6h0tBjzEohPJiMwWBy828++7Z9kftrUgxk9rh7bE0VznWenC7OOak0ECb437As
         oAPcqZ7we66FZCJdgZ2irTrYUOqNSrij0dVXWvtBZpguqkPlcTSH7Y5tLgLZcgM48D2q
         bARCXoQNiWaK6Td7poAbayzKNkPqFgJxGP8frMsSA5cKtEhXU29iqcQRquNLC33yQG35
         O9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115374; x=1764720174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ozYgqGZxyZiXYU0b8aZzmoqKbBY3lnwpPB9f4ygIxc=;
        b=NoozKkwj5EjxQkuSMgflxk+5+RZH51NWtk5/abNRUPzaVCI8x6LCj8ei8SUPQ7io66
         YVFHf4GmUvWPBzq3uj/6Vxdf3IFa7DPMimIGFF3bu7E+hwwQulfKkszOni5WFHfnnGjk
         jkTU97b8wE2Ex7/aVtriEzu8mueg/zwsioKeO/CfZWTNSXBcEUXrzMuZ4yOaBXdgdlRA
         ZPKQQlrP0LlhCd6kv1aR9715LAokbedGGNZcqLg+ot9RVwYVYh7mZ+Nn7F9tpr6UrPrQ
         xWWHWrvbzjk6IOE7ITjDtb4b5AtmZLwd2+6x23m/DKgy7sQAY0Zacax11Wm4CnJZ0Th8
         xMqA==
X-Forwarded-Encrypted: i=1; AJvYcCW1X1Fp8nMfqzP0vLL1eNyY/AqnY4ffMcHrCz82/mm0RGRhHFi+vQdH2cqIJU0ad6Rc5Ftz37sn6oFz5DYeStd0@lists.infradead.org
X-Gm-Message-State: AOJu0YyJUpr9AzXbKnvNAy3T22TcK7vAObP6wziljCcByffqgReRv/PG
	kMnb77bIDU3e6uxg3vqFf70eq7JJrfKi/b8dfKuwRbWAKNZYelrCxnFe4vfBYJSzBw==
X-Gm-Gg: ASbGnctuzBkL+oFwJub6zqu5rHf5YyMoQq4ZqqA6VPJb0qckZGdfshzY6tVzeg/Be8c
	ZeVW9FM/60z1shwJCfrdeEm+EUeA+34ZqaGBNq5LZHd/Y7dUePdCeiN95ovMyfwqpktLKjOC2gA
	sHFlBc+LTWX2LL0eVgowh0Cl0rfR1SEVBcmtC16Vsstr2WwrU5C/TdDg4XpCZ3JGa6+pu/6t1Sy
	V5JiiiGj18a1S2CGP8jzzhN0v+zHuKUHbYMeDd+B2z2jj8enxufwxCN1kbwI/KmTPFyKTWyiOdl
	hUoDjHU8uPqHbJ0oGHW2rfMAZ2fOndSB3+SBmNkIdJ/M6GB2LxuUqBLAiFApgOjMYB1v+xCoFnf
	XP7lA2NvO9O4taabdisXgOcS2Czp3yBJvTCqevBq0K6zVajdMAvtRDQ7NT9OOgzlKKeNb7M9HpC
	zxTZa72aGbppANLj+NV9AIUoOFc64FjxlOOcz3i4BhyeTj4Z9Bd3Kvpna7nJL5n8TT4qFcBMr9i
	G2ovj7/vPyxsg==
X-Google-Smtp-Source: AGHT+IGHFeP0ZRaD8eMJaVnA9S33kn4uRxwfNfGJ0BWnjB5I6ToaBVqHt4IPtOo9tOmXe7tjjGRiww==
X-Received: by 2002:a17:90b:180f:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-3475ebf9b16mr4130129a91.10.1764115373195;
        Tue, 25 Nov 2025 16:02:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a6105sm514375a91.10.2025.11.25.16.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 16:02:52 -0800 (PST)
Message-ID: <4cb88319-6514-4145-8309-01051547b851@google.com>
Date: Tue, 25 Nov 2025 16:02:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: mfd: maxim,max77759: add charger child
 node
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-2-6b2e4b8f7f54@google.com>
 <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <699d4476-aaaa-4cec-9e2c-240348950e4c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_160254_824044_6E703074 
X-CRM114-Status: GOOD (  16.74  )
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


On 11/23/25 1:30 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function, hence add its
>> binding as a property. Also, update the example to include charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/maxim,max77759.yaml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..29132f73f2c8 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,9 @@ properties:
>>     nvmem-0:
>>       $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>   
>> +  charger:
>> +    $ref: /schemas/power/supply/maxim,max77759-charger.yaml
> You need to explain dependencies/merging in the cover letter. This patch
> now cannot be merged alone through MFD.
>
> Or just decouple the dependency and list here only compatible, assuming
> this child node even stays.

Would it be okay if I drop this patch from this series and re-send it 
while mentioning the dependency?


>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -95,5 +98,14 @@ examples:
>>                       };
>>                   };
>>               };
>> +
>> +            charger {
>> +                compatible = "maxim,max77759-charger";
>> +                power-supplies = <&maxtcpc>;
> Feels like you miss here battery.

I have added the example in [1]. We can discuss there in case there are 
further concerns.

[1] 
https://lore.kernel.org/all/7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com/T/#u


BR,

Amit

>
>
> Best regards,
> Krzysztof

