Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CABFCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=; b=T+BUkZ3bsLRoEF3yt0BI74OyGd
	tZFwWUJvv1c6NkWCNAGN6t7J3NclSldsVSbI+m7R5/GjL1M50aqGO8jZGJ36I3YRfPQc9V2ZILUwi
	Ydo72NKeJzEHwpab3ea6wkx7ZQt9nH9tFRs9LYTNjDu8vcibhnmDHLQT91ReQ/orrK5JTFPtyOxrA
	dCBMfJDAfqcXz2kqIuEP5qPikTAkf/P7jkZ2Oox4bv9gzs3nGQPzCnnZ3XHlGvRojNqvqFQXygEZm
	fl9klbWSx64hEL/lygRviHYnzLVDFa4WSqP4d+BSkdZJdhtcfu69/Dgkz+UHvSYT7i1H++UBdYIxc
	dA5tQBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wItj0-00000007d3e-0klM;
	Fri, 01 May 2026 19:40:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wItix-00000007d35-3F5p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 19:40:32 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2d832f2f44cso2200101eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777664430; x=1778269230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=Fk3tlsRwr75aI7CooFbpoIdpt7AQ2/wFpnfA9J4IGE9dm6GYoDv6NrrTYwgkoXNBVW
         yluTQG4EDNaTG/S/jPlZ+iE5MHEge+NdGutuDsf5yGbRln7B8my5ippBb/ka0zLMOiP8
         FKA6z3tC7P9vt/QYFKT0aFQNNJH9nKOKXN0yj86y3HqodePWB3UsCb0zz87Du3s+9QQ1
         6Ph/3Ew484nw6crb/cClWcmuEYVw5SZkdoWSR0/KVha3o1lZl8PAiuTVpT0iqUw3YaUm
         mPR52o49pjhJ++kP7+CeXL1MAZwHc6/ADmZ+d7+uRiZ64/BGcfUDFKhBCcp1IUAJC7bU
         0Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777664430; x=1778269230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=VCQBsqnOJZeQPX99iFfoVO1C5UdTAAcIknjsGobsuQ9Sl5ajcXN9xX/OgsflV0Cipb
         Y8pSZiufH6ygav/9SNOp4wG3R5qzE7KO6ZJU5dJzP0j2K3XCr5IxEUBJz1oRXspDdRNg
         afOiX773aTg8alvGKqpCHEvu74WgJ82XevrRkiliA0V0vNC8Ub+Ra6/ZkPQq6pl2WygI
         VmcUlIddg1/dLwW/afWjQL75mdrijyzVFXa0pbZO9EyDWxSNWgfJ+Wui/aQ9Ov/lg+96
         1KGxoZyM0H5todg7+KzF9x8irnrNjf1Z3xzSQs9g2t874Eo2Y1BMTUuaQEHQiWxhfTIn
         7Nnw==
X-Forwarded-Encrypted: i=1; AFNElJ8yIgsZ5vk2DvvM7Z3kejUziL+531/DsA6q2Fr71YsbAuAnPlxNi/IfMF5Z6xc3BAq5euloaQU0O3x1FmCcz2gU@lists.infradead.org
X-Gm-Message-State: AOJu0YzSXtHdMMSaViTdXyEEtLRdhRuqufocujACf7dO6kPvsSctPtkt
	Dh2EF3918rCUbL+zI2X3QkRGV46NXy1LUT/RNBlwO0EnvYFfEishKAv/MCm1DtCPUQ==
X-Gm-Gg: AeBDiesaD1/mAbHqvb7aOp83RCxiRze+CFUn4WiEaU1bzxiN/vDKcLgMEzv6mh9Qgvi
	gScAIseazTlbZTalhAOSVUze6IDeP+eXOVyiJ1B5aj82FNDiViYyVGXSIqICQxg7hIYgmdTAgk1
	KdaFbl3uONLH3shqbUyWT56lOoX94DGHy4JwTZ204zs1vAgHsrMru7GT5GaCN3jtVa8kXD9z5lT
	Gu1niM6Mb7iiyJyFFTHkRK3hqLulwRu5PhVgX+shybm+E/O2vO6lTaheghTLXA3B6uatO2pIA3e
	sU/jsU12pCDmCOnqJ8Sy6jAVnwv7F8IDlz6O9veZa6r42Ec4PCfDoCkw1IhODLaAr+ihmjf/Ajy
	Zw5qbLuiaWz7urZsOTZfmwOkFBBGbMInKGQ5lb4jhoISM00Byuu6mQkzOhZuD5xUujWgXfaY1Pz
	ZoMN6BR1Ui8+rPz8UzFFpMDgKmeD7ImAXHmHuvrfouG7n3QLg799oGeTsl5pB256IrlbHm/nolE
	LYZbBldH/ylPi/8ncF3aGoNcGcU8Hc/vCKK2zHPCQbkw5c=
X-Received: by 2002:a05:7300:6c12:b0:2ed:e12:376d with SMTP id 5a478bee46e88-2efba5a7316mr301846eec.35.1777664429125;
        Fri, 01 May 2026 12:40:29 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2? ([2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b390df0sm5587081eec.17.2026.05.01.12.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:40:28 -0700 (PDT)
Message-ID: <d5d36882-5356-4b7f-a73f-70b8edba28d7@google.com>
Date: Fri, 1 May 2026 12:40:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Reichel
 <sre@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-3-76f59233c369@google.com>
 <20260424082639.GI170138@google.com>
 <fc767096-f39d-4088-b3ad-cc85bdedf36c@google.com>
 <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_124031_815133_B7747BBC 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Krzysztof,

On 4/29/26 9:59 AM, Krzysztof Kozlowski wrote:
> On 29/04/2026 02:29, Amit Sunil Dhamne wrote:
>> Hi Lee,
>>
>>
>> Thanks for your review.
>>
>>
>> On 4/24/26 1:26 AM, Lee Jones wrote:
>>> On Tue, 31 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>>>
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>
>>>> Add register bitmasks for charger function.
>>>> In addition split the charger IRQs further such that each bit represents
>>>> an IRQ downstream of charger regmap irq chip. In addition populate the
>>>> ack_base to offload irq ack to the regmap irq chip framework.
>>> Please reword this commit messages.
>>>
>>> Using 'In addition' twice in such close proximity reads a little awkwardly.
>> Thanks for pointing it out. Unfortunately, this commit is already part
>> of the linux and linux-next so I am not sure if I could fix the commit
>> message retrospectively.
> I don't understand why you decided to put this with USB patchset. We do
> ask not to mix subsystems all the time. You made it unnecessarily
> combination of at least three subsystems.
>
> Do not do that.
Thank you for the feedback. I understand the concern regarding mixing 
subsystems, and I apologize for the extra overhead this caused during 
review.

The decision to group these was driven by tight functional 
inter-dependencies that I felt would have caused build failures or 
regressions if split:

MFD & Charger: The charger driver relies on new macros and symbols 
defined in mfd/max77759.h. Additionally, the MFD driver handles the IRQ 
chip initialization and defines the named IRQ resources that the charger 
driver requires to register its handlers.

Charger & USB Type-C: To avoid a regression, the charger driver needed 
to take over charger mode programming from the TCPC driver (where it was 
previously handled as a workaround). Merging these separately would have 
created a race condition or left the hardware in an inconsistent state 
during the transition.

I see now that this made the patchset difficult to manage across 
subsystems. For future cases involving such dependencies, would you 
recommend providing an immutable branch for maintainers to pull from, or 
is there a different preferred workflow you'd suggest?

Best regards,

Amit


>
> Best regards,
> Krzysztof

