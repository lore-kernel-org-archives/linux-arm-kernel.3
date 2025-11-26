Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF405D0EE10
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 01:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=; b=iIvYDyjDdqGvnlUFmzqRtIBUuo
	2+okYRMot7pVe/t1bQAO0igvHkoFZxgFwmqsk+oumEBK0S7g0MO080VTswgh+17170nu1t6KTahCk
	KfvbAdE76PddEgLLPV5hLchmT7HgXhvM7jaSk56HxmnXjUpVmizADBjejFt88BWl+UHiAGpWehTKf
	eIEPFczIiu9PMaoDRtjVZf0EXqPZ3moZ445bRPyHIKmUIhKKRAwAl7fAWzvTK1BYwtXfhfa7J8d2t
	GbJyo4emqydryqIESx56JKRH5CyYg7GLaQf52aEF5YvWSDqV/jV4i87F169kntvlnp4xsnfK9b6Px
	dsy42bbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4Bu-0000000EAhL-3a7P;
	Wed, 26 Nov 2025 01:19:30 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4Bs-0000000EAgv-1nPE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 01:19:29 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso3670866a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764119967; x=1764724767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=OmE0sJb+fxmMSjT7/kAmttBbEL5E9yMRG058TWms0XqvjCVO7roq2mY+2ZGlIzyOdD
         VeFmh/4YghkNiwRkDXJYxjj0g2CBF7IxYVYNHY8GyBtp+dDe7D2bqhSfdFwWjQKVy5De
         YS7g+uoX2XifxOa2zhTjbI3JP3W3p4aFTOKQpvj079mqLH22LlwbJQdJztqHxyzpeH/V
         JF8tEIb9ZWHl0yyZuDdRWU4YIo7d9vFc+W9ZP9E50nclyp66gB/abV2oqFUO6dqYSesK
         B8hpotkd1LxSBQYBXgsP6RIn0lpq8WyXzLFfEdF6SAeMOP97QH41hZ2DSETryBHuLZ6D
         v/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119967; x=1764724767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONQMnRlPCQWGLqZuet9LBiEJ0IZkYpFPjI5nCq6R0G0=;
        b=ITcUXecNuV4pdIZXoPHu3mRiIT12WJ9lq1U32r9kMmdP+JCt1wPG7xkkaiQpdObU9a
         ZmeEiF9CVb3dL+nNYcP3XImo3YG5QDv8c1UIAWZm6RpSojtV3pWHD17u54aI2nU9najj
         cxRhG4ByzdGttNzacCHi9Ocg91HnaifgHkEzWc5Eu1AiL1dwk5RQamt2c40TJxoIC5Ij
         0IRBpDPEp9+wq2OghH7UmMaEhqDkjtQzFbxvntl1QfOUwOqtV2ujprjUj68WLhxpTq67
         fZ9Xx+PKLEttLC3vrqjDdIPxKJjhpvDyBPREJS7kS/jJwXFZkXd0i4tXMAj+TEh3IRQI
         y9LA==
X-Forwarded-Encrypted: i=1; AJvYcCUg/tBUcaqT7bfpkJ2VVcdipta+QDdAxbskIIa21H6cd2WTOKy3LnSBKPjA0+njZwS9yW0D5euvbeAn05xKcoZR@lists.infradead.org
X-Gm-Message-State: AOJu0YzzCXbVO6iboQ+MZO+AdxXfnlmfUd1nGjedMZOLEQPsBZN/j0jX
	50m5R2qEPnkOG8R8QAUia2dBX73p4OwsrZ1nh2SXav8lj344oNFKuhPLQ7M8iXxY5XJZfAsN6Ms
	3v3OSvRKmR8mqDA==
X-Gm-Gg: ASbGncsJwEZSBWKb0DvqPxfSI/KCJUKgkYVkPyIEq6A1Uzn3QIt24GXppkLe3oEhQsX
	X2q5XTOGa93YdXfKCNwRmeu2ZYsCSMsX9j6GfaP9isdJkRoE9XNsKUT8qjF7ss5Ocm2XVIUE8+q
	O/TtQTc+iPCfyAgOdX2JoVFxo8OovwpEAbmXpLRGzr/m/rTsf0Me6NvEDCiCJYCYik03n3zxezP
	8Eb0BAA9c2GxOZDLZEA2zpgGlm1ctmyWUUIQ5wSWWPcbaj9HR0908AiGAT4E2ssKtJdlaZq9QH6
	xKx5yXVIat3CJDsvoeHDYtElCYiE68cx1BR62KJFZC/m+KktrKS6upOfrkOdO5yqUxfXZ1Ve0Mu
	OS9nen54LBTcvxGuMkK/jdcJoaPJUcNpZFyUFo4qyEaN8tV2io8JE2GNKggFvXd3vx19dgrUt4M
	o3u8BlToLvH0obYp3tAOQo6LgY3hgnO+5I4unxhHjyEnFkDBAxN2ssjY8hQrZC2EbwKKXE0s5bO
	cTOB2JaOGsEnA==
X-Google-Smtp-Source: AGHT+IG7vAAdnJdBV1xPAxMSocFYLV08aRb8J8ZFA9YU4wW1fgRuVRFaXJs0v7uY7YYTEmsaJSmrhw==
X-Received: by 2002:a05:7301:da82:b0:2a4:4e8f:5861 with SMTP id 5a478bee46e88-2a94188c7d0mr2414680eec.28.1764119967060;
        Tue, 25 Nov 2025 17:19:27 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm95954083eec.2.2025.11.25.17.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 17:19:26 -0800 (PST)
Message-ID: <bb2ecf99-6153-4623-81ae-0fd41e4d306a@google.com>
Date: Tue, 25 Nov 2025 17:19:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
 <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <d2184e6b-ba22-423a-8d3c-3b8c2f8ec329@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_171928_486288_AF9D1D3A 
X-CRM114-Status: GOOD (  12.79  )
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


On 11/23/25 11:39 PM, Krzysztof Kozlowski wrote:
> On 24/11/2025 07:21, André Draszik wrote:
>>>   	if (ret)
>>>   		return dev_err_probe(&client->dev, ret,
>>>   				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
>>> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
>>>   		return dev_err_probe(&client->dev, -EINVAL,
>>>   				     "invalid IRQ: %d\n", client->irq);
>>>   
>>> -	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
>>> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;
>> I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-specific.
>> The polarity is meant to be set via DT (and the only current user of this driver
>> does so).
>>
> If this is the main chip interrupt, then you are right and the code is
> obviously wrong. What's more, it is completely unexplained in the commit
> msg, because that vague statement cannot be taken as any reasonable
> explanation.

You are right. As discussed in the thread with André, I will drop this 
particular change in the next rev.

BR,

Amit

>
> Best regards,
> Krzysztof

