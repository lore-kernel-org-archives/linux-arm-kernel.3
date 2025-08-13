Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CD9CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQ3oRqQ+8vYvglVmqAsoCg5Z9YqosZmgqcxx5cVr1YU=; b=LieN4iKikjueEV7mx1wCN4qjfu
	JYH7rfpDCR+3JW2zKbrdpexbID/73+3+o3pl6JT1gMySAMTRHg3gcAEh/W4dRAi71rPSbIR5Q786P
	SB5Q4dekLilKkYODbQHEH2xFwG2Z6+hFwGZQXk4G944QcsBZ3nt8Q0RIYh8V+a2T0p4Zn2JU3g+mD
	+diyZaeIT457GGakwEG0PwbP05EM5GMFWvfhT1FwZ8nnRBJPiprM5JJXnAiFdj/izkzdPSN6STa1z
	vTcXiCwIvall16cVQGAdKsyKF+4USIbyJ6wZ+byqkksL01Q7VZpY4U1AczyzQXzCMwKBf5Xo/uMAZ
	itnqZkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Zx-0000000DVg2-38Az;
	Wed, 13 Aug 2025 11:23:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8qe-0000000DOzp-1IH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:36:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so57729615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755081407; x=1755686207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQ3oRqQ+8vYvglVmqAsoCg5Z9YqosZmgqcxx5cVr1YU=;
        b=Lrge7S246swgeQhDjj5Plv8Ckmne3/Px4bMp8/cuGs1qE5vHxSSrKrWIsi9dRytUcq
         og0cRe30ye7bINh+9JWPGhtocjk80e/mgNE1zxkXihKy69m29U0c95DAGacrdV0HrKvg
         S19DdLd2jhWa6f0f1X6Rfq0q3OfxWJsx6P+EKlqJejCxToEu5JpPbrgyuYpzl6layVpG
         RU6zM9V2KDXBckSabuko6OzAQzia4B4slIOKWChbGVp+kAGZC6L3gYRVUTheriwJhUyD
         djypAliw6P+Xvv4M4nEpTt7O83ZClyry5bOj6uYjZEDdus2/w8IhBlYVPkRGzL4B7ZX5
         /fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081407; x=1755686207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ3oRqQ+8vYvglVmqAsoCg5Z9YqosZmgqcxx5cVr1YU=;
        b=IWgzgFpKeIwOKCpWylw+mRnDBBKFrjDkKNnouAbxlJphJ5HfLaC5JGLbjpQx+uqQNr
         cPJ50P60ZZzp616q13KHsaEsRcfcNwSMBxB2EXsR/OmLtWeAhDQF+VvAEYBu4I6QeqDX
         WjjYcnyE5ljZ6IWslT3AXyGYjH1kaUu4W/Fw0NKYZC81W601AwB7YHpxCj6uI1ozM2Ck
         TU14abDOnaZ0mijMu0UpDdZj7Dx0oqsgP7U+oXmwYIC1tbUOnxAhluHy/Q4QXMu8sRfw
         pyNyc4ShK1WjOzRGvTrM5U1eMTsOcYSoJyH0f7PsHSTiVWeyGTqitOnLfiTfJSkBKfWw
         2zaw==
X-Forwarded-Encrypted: i=1; AJvYcCVYHvwPPZappwhOT7Hr8fNf+PHsUcorBVBCCIpprqBVycY/gbzhiuQu5Zw5Bv6vQldsWrvpOLH+4TqjXvV/Unod@lists.infradead.org
X-Gm-Message-State: AOJu0YwT1yEM6XIuAFjQHRRy2+8BJJD5nuNWrvpxsJSA69lbdfi74lfa
	kqYPdEGQlMULZCRich0bxwneR9svlz/15gLSS3FkDwGRnRhbb/LE0oZU
X-Gm-Gg: ASbGncvMxkOGMxTTu4FaIYYw4jKxapKEujX9wZV6jUWAILFd1HL56knXsCzfB5JYRZJ
	NOclHzbtxSerd/icB3kAgsvTPsKAC4mEGxwL85w9iOsk5W+QdRlR+9/4rM9yFsoOm/B4QcxOkoe
	Q9k9uR4dR2Qqn9cCLGpBZaam0OGjb0Kldsj5qGkFg7c9DNINuF1rCaUaCpXFO0sZ4ZKwe3Y/olE
	rcpqMHLrJaJ81gD3I/R44dAbJko5OP/PrQ+z8BfsqTHkZJOZK29CvVGFDG/U22qjrKMzrDumW0U
	fi/K7Lbre0D7IxJ5LcvSqpXy+7EaKGbJ1SrnJxBydYu6VIIJRqq4Ejn/ms1feaoKFfeYtc6Euh9
	xxJ+lNtB6+BBWiMNZOr77SCBeVRjB0zix0lzehH5OcLPj7oILHC6yKpUvIumSxj4=
X-Google-Smtp-Source: AGHT+IE8WeKKOgBp5vzp5Q2PpKaxjTyK+WTuLbyXBXngT5e/LuA9NlvZe1k5fxp4u22Kge47Qc9xEQ==
X-Received: by 2002:a05:600c:3b09:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-45a16614befmr18524185e9.33.1755081406323;
        Wed, 13 Aug 2025 03:36:46 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16de5f27sm25743625e9.13.2025.08.13.03.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:36:45 -0700 (PDT)
Message-ID: <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
Date: Wed, 13 Aug 2025 12:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpR96Kkj12BwW-M@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_033648_348748_CBD28FBC 
X-CRM114-Status: GOOD (  30.04  )
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

2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>> The I2C communication is completely broken on the Armada 3700 platform
>> since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").
>>
>> For example, on the Methode uDPU board, probing of the two onboard
>> temperature sensors fails ...
>>
>>   [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
>>   [    7.277503] i2c i2c-0:  PXA I2C adapter
>>   [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
>>   [    7.288241] i2c i2c-1:  PXA I2C adapter
>>   [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
>>   [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
>>   [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
>>   [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
>>   [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
>>   [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121
>>
>> ... and accessing the plugged-in SFP modules also does not work:
>>
>>   [  511.298537] sfp sfp-eth1: please wait, module slow to respond
>>   [  536.488530] sfp sfp-eth0: please wait, module slow to respond
>>   ...
>>   [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>   [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO
>>
>> After a discussion [1], there was an attempt to fix the problem by
>> reverting the offending change by commit 7b211c767121 ("Revert "i2c:
>> pxa: move to generic GPIO recovery""), but that only helped to fix
>> the issue in the 6.1.y stable tree. The reason behind the partial succes
>> is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
>> pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
>> which broke things further.
>>
>> The cause of the problem is the same in case of both offending commits
>> mentioned above. Namely, the I2C core code changes the pinctrl state to
>> GPIO while running the recovery initialization code. Although the PXA
>> specific initialization also does this, but the key difference is that
>> it happens before the conrtoller is getting enabled in i2c_pxa_reset(),
>> whereas in the case of the generic initialization it happens after that.
>>
>> To resolve the problem, provide an empty init_recovery() callback
>> function thus preventing the I2C core to call the generic recovery
>> initialization code.
>>
>> As the result this change restores the original behaviour, which in
>> turn makes the I2C communication to work again as it can be seen from
>> the following log:
>>
>>   [    7.305277] i2c i2c-0:  PXA I2C adapter
>>   [    7.310198] i2c i2c-1:  PXA I2C adapter
>>   [    7.315012] sfp sfp-eth1: Host maximum power 3.0W
>>   [    7.324061] lm75 1-0048: supply vs not found, using dummy regulator
>>   [    7.331738] sfp sfp-eth0: Host maximum power 3.0W
>>   [    7.337000] hwmon hwmon0: temp1_input not attached to any thermal zone
>>   [    7.343593] lm75 1-0048: hwmon0: sensor 'tmp75c'
>>   [    7.348526] lm75 1-0049: supply vs not found, using dummy regulator
>>   [    7.356858] hwmon hwmon1: temp1_input not attached to any thermal zone
>>   [    7.363463] lm75 1-0049: hwmon1: sensor 'tmp75c'
>>   ...
>>   [    7.730315] sfp sfp-eth1: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
>>   [    7.840318] sfp sfp-eth0: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>>   [    7.850083] mvneta d0030000.ethernet eth0: unsupported SFP module: no common interface modes
>>   [    7.990335] hwmon hwmon2: temp1_input not attached to any thermal zone
> 
> TBH this sounds to me like trying to hack the solution and as you pointed out
> the problem is in pinctrl state changes. I think it may affect not only I2C case.

It is not an error in the pinctrl code. I have checked and even fixed a few bugs
in that.

> And I didn't get how recovery code affects the initialisation (enumeration).

Without the fix, it is not possible to initiate a transaction on the bus, which
in turn prevents enumeration.


> Do we set pin control state back and forth during probe? May be this is a root cause?

Yes, basically. The state gets changed back and forth twice. Once in driver
probe before the controller gets initialized, then once again in
i2c_gpio_init_generic_recovery(). The problem is caused by the second state
change as it runs after the controller gets enabled which confuses the hardware.

> ...
> 
>> [1] https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr
>>
> 
> Can you make this a Link tag?
> Link: $URL #1

Sure, I can change that.

>> Cc: stable@vger.kernel.org # 6.3+
>> Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> 
> ...
> 
>>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
>>  {
>>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
> 
>>  		return 0;
>>  	}
>>  
>> +	bri->init_recovery = i2c_pxa_init_recovery_cb;
> 
> This is unfortunate. I would keep the naming schema consistent, i.e. rename
> existing function and use its original name for the new callback.

I agree, but since the change is targeted also to stable kernels, I wanted to
keep the change as minimal as possible.

> 
>>  	bri->prepare_recovery = i2c_pxa_prepare_recovery;
>>  	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
>>  	bri->recover_bus = i2c_generic_scl_recovery;
> 

Reards,
Gabor

