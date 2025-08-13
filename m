Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC8CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NgH/qwxoTNWkh0Im/sLiD/T4hQEX/261YmLQy0amXU=; b=0Lt4PNzCKDsmJnGpbfYc0SGnVV
	BrKFeAx+PJCwJGq6BJ/ZokvUqkWynK3+TUoQP8Z1uVamuJy63zBFZ+zAbtK3lxXEuWbjpXYinqU2R
	B2Ik6/7XM47MSN4ToM2pI0RGTot8w0IQjjcABlMRz5uJiLTXVN49vRgRomGlw+0bNrhkmSjefFeoE
	p+ODXDfMD8N51+6uDGXrAxh0or9yYKsdFxfClcMtwm2pL1eUVICtR3kz0z0XIyc5FNJFgikpIr/hw
	mPbHfpJj7x6JCpOH8/rtX1FTBf958HCNJeuZy4CagPKoSBXaDYpqdEc4QYiHUeH/Xo/6n7hbtcH28
	lCg60zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDqh-0000000EH3d-1h7N;
	Wed, 13 Aug 2025 15:57:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDEI-0000000E9kx-1Pkv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:17:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so62423215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098249; x=1755703049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NgH/qwxoTNWkh0Im/sLiD/T4hQEX/261YmLQy0amXU=;
        b=EBCCzVzZRzYkWJ6jbuX9KP0YEGNz71Z6p/sTGeUCPMhx37VFhzrRjzh261+a2l+eJE
         jbfS3iUt6I1NiyFSfsy768lsW0Wqd5Mo5TtSJlhsVk6EvgDlVe2A4cdCddCUNtnRHfnS
         52ZIR5yi+ZQ+ghX0/L/EY0N3FcnUREpL967SVSPkfERemstjEaG8FpYy1wfgZe9IxjWX
         whGxY2Q46xvS/OibphM3CWytDxaoe6NHQfHh8xpEYHzG1jXkH0ii1Am9BVJOf96Yj0X0
         j6g3Z9oADJSuEMWFfhrSXQVsnYmTjZITsENYUM71MbW4Jn6iY79sKt08DuauxLs70aVx
         Tf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098249; x=1755703049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NgH/qwxoTNWkh0Im/sLiD/T4hQEX/261YmLQy0amXU=;
        b=LkGa4V+sRXHHlzA2XEFfjcNvTVgDZYD7VZLxnzZqHLzWmA0IZbAojPxIBj2A6qkw2Z
         xuY/QgTWB7ocy15hwySZ1DZDfjqXVQap6HWTKdAFuwT8sB5iZM/EywEKMU7Ewe6eZ4ey
         hCRRmpopqeZ/6gQ2018B2va8D3T2cvqKvDPekNYU7/ZVYUyUI/DW4Sblf9sH7Xx+A+jJ
         jxtHDf+p4JZsz4SGQQ1RNV+0myRBDespJxITwgrXv+UGIfyl6OLEqyCu9OmtXzMPMjQv
         ckhWzCCfsIEozlKgbp/h5lYQPdlzTg5+1gXMZF0Hv5zMco8vKZVWB2QP7fOcBOevJVNL
         V7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcEBUGup2zmdkjqivd0O3jlOW8ifkFYXg6P9oMyh2m0gVGaR8m7hl74fBmziI/Qh+JOyAjYhIJ/Ot/Kojahm3J@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkhhk509py5wuJ/mO8HYwzo45+vZtvLpgpR8aBj7NFvZ3sy7fe
	xfqcZlW4FJ9RKTdgKpfLdWtttOJURxMXSsyeyfv50MpE4fIh9KWF91ck
X-Gm-Gg: ASbGncvQimuq8nijip2aj6vCj/18Mn5GYCCG0rlDFqTVDuVI3wCOjHnleMWbM0A4mdI
	a0sllrDy0r8Gi4u9g4Q5j2tImPnspMPIZjZ3xHzl9PVgvzWNoimeaOZxiBlZRXEWhHAN3jI63ib
	ym0qKuqY/thEmisaLBY76SOYbAgWHn7WpQy0AcEuOIi9yJz3XfjFQFCVDH+U09k1EvZUVKtkeHJ
	7bHovYKiaSMELarvEMnX9Mbv987YmzROhspmJLQSt9lehrp7OmV9FsTV3wn9mEZegjXYqxj9S8b
	aaS4o9BURnUp5/NKsjWHbvJK9OZNAyAK3PE7ug8Jeea9GuD4Jisuc4F1kOoCyrJx06Yk4/yuQTY
	AA9slJxvyzCjd+y5s0wqGjog3Mm1FbiWJn5rIMbFooWwv1mWUGwsgwiypqDJObi8=
X-Google-Smtp-Source: AGHT+IEU9KRhWGBF5usbRwgZ04Gy+x5ZxR0mwGBb2OxGZWNW1+E4gzMZFQnZut4o6iu6J3gcMERIlw==
X-Received: by 2002:a05:600c:1c0c:b0:456:dc0:7d4e with SMTP id 5b1f17b1804b1-45a1a822aeamr5298495e9.18.1755098248485;
        Wed, 13 Aug 2025 08:17:28 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50a42asm6062785e9.1.2025.08.13.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 08:17:27 -0700 (PDT)
Message-ID: <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
Date: Wed, 13 Aug 2025 17:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Content-Language: hu
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
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081730_376382_B28DFBA5 
X-CRM114-Status: GOOD (  24.08  )
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

2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>
>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>> in that.
>>
>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>
>> Without the fix, it is not possible to initiate a transaction on the bus, which
>> in turn prevents enumeration.
> 
> But why? As you said below the first pin control state is changed during the
> probe, which is fine, and the culprit one happens on the recovery.

Erm, no. Both happens during probe, before the I2C core tries to enumerate the
devices on the bus.

> Why is recovery involved in probe? This is quite confusing...
Let me try to explain it differently. Here is the simplified call chain:

  i2c_pxa_probe()
     ...
     i2c_pxa_init_recovery()
        pinctrl_select_state()                  <- selects GPIO state
        pinctrl_select_state()                  <- selects default (I2C) state
     ...
     i2c_add_numbered_adapter()
         i2c_register_adapter()
             ...
             i2c_init_recovery()
                 i2c_gpio_init_recovery()
                     i2c_gpio_init_generic_recovery()
                         pinctrl_select_state() <- selects GPIO state***
                         ...
                         pinctrl_select_state() <- selects default (I2C) state
             ...
             bus_for_each_drv()
                 __process_new_adapter()
                     i2c_do_add_adapter()
                         i2c_detect()           <- enumerates the devices

The culprit is the first pinctrl_select_state() call in
i2c_gpio_init_generic_recovery() marked with '***'.

That call causes the controller to go stuck, which makes it impossible to
transfer anything on the bus.

> 
>>> Do we set pin control state back and forth during probe? May be this is a root cause?
>>
>> Yes, basically. The state gets changed back and forth twice. Once in driver
>> probe before the controller gets initialized, then once again in
>> i2c_gpio_init_generic_recovery(). The problem is caused by the second state
>> change as it runs after the controller gets enabled which confuses the hardware.
> 
> ...
> 
>>>>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
>>>>  {
>>>>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
>>>
>>>>  		return 0;
>>>>  	}
>>>>  
>>>> +	bri->init_recovery = i2c_pxa_init_recovery_cb;
>>>
>>> This is unfortunate. I would keep the naming schema consistent, i.e. rename
>>> existing function and use its original name for the new callback.
>>
>> I agree, but since the change is targeted also to stable kernels, I wanted to
>> keep the change as minimal as possible.
> 
> Renaming is not a big deal AFAICS, but leaving this _cb will be confusing in a
> long term. I prefer name to be changed.

Ok, will change the name.

Regards,
Gabor

