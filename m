Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C96E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqIV8fJvUTPe1XkFfFuu3lKfRKNmYvmwJe3hWNSUszg=; b=du6u9IlszYKrznFdFcLK/6Dmd3
	vvRhLWH1cRqbsnCPmnuYEIfPfkZniiSATGT85wjykVXzS/ePjPQGMxSzv4fygABPQLkhb3XnjBQth
	LiH5wFjTC5RIPTof8Zhrj0Ga+ZXZUaZOgP6N1xlTyvWvzM5KCYjkSluC1L65lUdQyMg7hibkOQHSY
	4LbZelkr4RBBhrX/ywS3cyVgkh5YcmzUJnlTFLT1IfClfEtJURXjnVPVB/Wj1nIW0OuuGsIrNnrB2
	EdRggv7jSR0EKKvBMFtLJeikiWE3TX6yzW1aO9BGaoLpDAOctHaHhBwLPWjiGVZzaKfTRcth2kzjX
	NyW4eDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dzr-00000009lMa-0owS;
	Sat, 02 Nov 2024 13:16:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7DyA-00000009l8Q-2grW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:15:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20e6981ca77so30823255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730553310; x=1731158110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqIV8fJvUTPe1XkFfFuu3lKfRKNmYvmwJe3hWNSUszg=;
        b=WWJev5TD8b6fGvfl9/hMSEddJyl7iRz5TMA69snqN19FDXIkXGpB8f9yOMOT9ohs2H
         4NhaQFL7hB43djxeSdcuEmoTTmjzs0Od8Crig4QpI9O53rlggaCAOjQ0F0GcuiyW7kPT
         BnzPN8BCs2zpMtLzHFr/NFOrk24m0s5yXn3tLxS3Mm4qY424V6BKM9pMfKJb85dtn/Nv
         vMqe1mH7353Zd9m+WOU5eDU2rVKMo6rjm3dXU2NTb5oWas+OU4qqMGleh11sY9LYkSs3
         BTY1LSLJdYqVm8IidTMFIx99c9vrkvoB9vQStZI9OUEM1xNqPbnlpaOsYFNNtCSTLw3O
         Zo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730553310; x=1731158110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqIV8fJvUTPe1XkFfFuu3lKfRKNmYvmwJe3hWNSUszg=;
        b=l0r5ojTPUBgRW1cyVQbTALlZYl0E7/JES6TLPNizYwmwzDX5FJKWYbo817tt4TWGch
         qSDmAK65DHHG538axvNyNYne/AgZRSz9yMBt+qOBdzD1GzuaYLxXHCB+cpHvXiIHn+9J
         RJu13D8PvfeB/UUxvyiB+XrFKab+6wmGmGX56YZHK/wqkgmViODF0efSYmfoi4rIsGJG
         1ST1yQQJQeIUQEi/TctXUpmaLNyRUXuNJhSjxY0fRbGY1wfzIIG/3ABa/GSzLnIY9v2V
         dHRH15Tb9Sl9EZBxlW6jT6We+HogCFX7tbmr6/A0qKKZwdxCnYEjl0py9ua+ERzvSfMA
         K8gA==
X-Forwarded-Encrypted: i=1; AJvYcCVlQqwsTV39zKMupOvm61PEhLPBUW+5CAGtLANe73BRxOv08vCoOTv1lSmeHBICX4js5Nwq6BbmwYPHdePZfETn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdz+7LxzWU+BFje/SSZTPybzRvQv19d1gWsUoe1H6+ixywUOxi
	XaPI6u/2frfbKxi1Up1dYy48871QUKRBcB8LjNg9GdgGpQv5Ot6Q
X-Google-Smtp-Source: AGHT+IEjZyMhv52i+FdmXziel3S6uh0T/4JCB2ptezWEGIl82CVPxNSuviQk+FJATDrk0E2JnpSDUw==
X-Received: by 2002:a17:902:d4cd:b0:20c:dc32:b5d0 with SMTP id d9443c01a7336-21103ca87e7mr141827475ad.58.1730553309583;
        Sat, 02 Nov 2024 06:15:09 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105706886sm33500465ad.68.2024.11.02.06.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:15:09 -0700 (PDT)
Message-ID: <6fb61676-2744-4735-ab00-2a523e03ea96@gmail.com>
Date: Sat, 2 Nov 2024 21:15:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
Content-Language: en-MW
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
 <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
 <87wmhm3u7v.fsf@bloch.sibelius.xs4all.nl>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <87wmhm3u7v.fsf@bloch.sibelius.xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_061510_715436_EECADA2A 
X-CRM114-Status: GOOD (  14.80  )
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



On 2/11/2024 16:39, Mark Kettenis wrote:
>> Date: Sat, 2 Nov 2024 10:36:56 +0800
>> Content-Language: en-MW
>>
>> On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:
>>
>> [...]
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - apple,t8103-spi
>>> +          - apple,t8112-spi
>>> +          - apple,t6000-spi
>>> +      - const: apple,spi
>> Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
>> generic. Fallback to something like apple,t8103-spi instead.
> 
> Well, if that is a Samsung SPI block it probably should have a
> "generic" compatible that starts with "samsung,".  The M1/M2
> controllers have a different SPI block (presumably) designed by Apple
> themselves.  So I think it is (still) appropriate that that one is
> "apple,spi".
I just looked into the SPI on A7-A11 SoC in more detail instead of just
going off the ADT compatible. It seems a very big chunk of the registers
offsets and bits seems to be the same as the ones in M1. So, feel free to
ignore my comment above.

Acked-by: Nick Chan <towinchenmi@gmail.com>

> 
> Also, (upstream) U-Boot already uses the "apple,spi" compatible.  So
> changing it for purity sake just causes pain.
Well, if upstream U-Boot is using it, then I agree that "apple,spi"
should continue to be used.

> 

Nick Chan

