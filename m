Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA0DCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0A+ysSRX0BDGHubAfWN6+x/GTCkfulb6z+OLk3j05E=; b=ZoFYvFkl+BiPU6gHtHh4YCvZAV
	u0MQZ4AyCjXJVUjRfFN66s0j7EyD4a7DeI3UPMdkQP6Qs3ugMJ9RNLKi2eNEATUVImSYew5RjmQqu
	oOCWRBf3Vonk7HqJB5KjYWUFE9DyP32zEN6GbfN7DjjGvyyKl74RxgK78x8dPSyl8BmbEIt/GAdwA
	wq9DigUuPv/e4oCd5DSStp9qhMKHE3oknvkuBrq55f0OkirYMCOUwXTUznLkABKWXh194ZDhE1bfD
	PwGzRyObQEl7/c5+XPbLjJw8N5fHL48KiUhaP6R9dozmK4w5sy0RIk8qWWCwKtM/nOTJpaa/GtPJo
	lLrfszsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHty-00000009phf-0jFn;
	Tue, 19 Aug 2025 08:41:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHNi-00000009lPP-3t16
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:07:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so25234705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755590865; x=1756195665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0A+ysSRX0BDGHubAfWN6+x/GTCkfulb6z+OLk3j05E=;
        b=YQ/MRTMfJX0puPRjoRTVp/S1dY7MZ0uCozdZMeCCkFK+9PiVSNRvTpilTF+PutXc6r
         ATe45UzohsqyanmKSyI56yJMyRJ5bbcbl4t8KqoUPgZEkj4tQNdN2a/4MFEZlRoyogJg
         eV53LXRlEgPbS7o/6SjUoOESA1XUsaVu1vCp2O8VarPFDNsz6fzz+Qnxem9T+40IU4XB
         sWUBFXlFGp3dpCni8ANWv58TEZ3Ox+lq9a+uPtuAWkaAqhkx5WJcLQWOX+ZGCYhshVL5
         AXoPXmRd136OjdZKr2juIIkYPgl1wKujU+cyyXwDR8OQRi2RgcR2TUTyVaD+JGF/jrad
         GUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590865; x=1756195665;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0A+ysSRX0BDGHubAfWN6+x/GTCkfulb6z+OLk3j05E=;
        b=vtgq43jTnn22RnKNzrx1kZzSR4fpw/U82/TENwkV8RYHSvAGafbmE8lNvoPDqQFEQY
         SVK7moZgE8qyRYtmniy5BMmTEoKHiZVC6LN0O9IbUdQ0qmjyki/1dbiG86IwEn5bhxZH
         Q0CIXV6PAluwDa9iPlFNpWzEGrlwRY8FtqJj2gahm0xgsJDrbw+24fJRsfE6G0FjT3g9
         IuW7VhniXlb5LUnBc931Dbqg1ydK0B52/FPx+pG3tXS5YWlQTMLil9jCX+9USnWfi5bx
         Id8/gTbdBvapVz4+sFhXM58hPf9IuKbedJ2SNOE99RPqkZLmVYwV5NrurKN9tDbUPMUA
         142Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEFGpToHVFRW2Xvuq+UPCa+EfuMHMkk0yf+OJjXY0+v6nlopfojJPdg6fTc0csd30u882eGrb0+Y4pddwCpv9Q@lists.infradead.org
X-Gm-Message-State: AOJu0YywKh2NoCdqf6SY5UBnJzTvG6RGqN8WNef4OD59HfboMFJYXUyF
	vVXWtD43JUuFlJHd6JSrEmr5qjo0m+TnDpXrHMzF6nik+L0eW8Qg2cyF
X-Gm-Gg: ASbGnctx/Qj+vV3i+nHHWxXRKD4fgRk4AY3FMw1mvy+pYrQlf6+P5k9tSrhNV67a67c
	eDcQOZL/H9zdkrEVRXcPMGfq3mZPliFfinvWYaIgHoLJjykj7N4NB69he1WMBQ264qmkkSRaltF
	FXYQIvVzewknz1Kj8EenHjtQjFTdcyCgE5KrPOusqpikdQqh/H96ixTHEhoCz0nEGNK/D5YgdmZ
	c+BYqZWEtb5LyYsVn+yjE0ukvj3in9Nna54Q301Uevjf/8c/JrlrXv9K2FySI2buciYxbNE50EZ
	9TLmtm2L8KT4vywFW++MRFzcITcd7YAJ7ooGM5c/xugg5OooXEMMrU9YbURMQMTc+h9Trg6jgJq
	FONf78LtHuhGH+Ckljy5w+6ggJPDeo8EbB5KOoMSPXOo6UsFKQBDFUycTS98myE5VEixcCHzG93
	nmJ+qSFITC
X-Google-Smtp-Source: AGHT+IF0qT3S6QaRDTOtnywHkyQYjn24FhQXcdmgCV+CyKQOdIZxlhlDgAdk84rMMEvWXj0xBF+10Q==
X-Received: by 2002:a05:600c:4587:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b43dc654cmr13172695e9.12.1755590864562;
        Tue, 19 Aug 2025 01:07:44 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a771ecsm30719785e9.9.2025.08.19.01.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:07:43 -0700 (PDT)
Message-ID: <0e0a0da5-8953-4238-af89-687fb5a34c9f@gmail.com>
Date: Tue, 19 Aug 2025 10:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
 <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
 <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
 <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
Content-Language: hu
In-Reply-To: <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_010746_986055_AC5D6BFB 
X-CRM114-Status: GOOD (  24.92  )
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

2025. 08. 17. 17:53 keltezéssel, Russell King (Oracle) írta:
> On Sun, Aug 17, 2025 at 04:59:22PM +0200, Gabor Juhos wrote:
>> 2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
>>> On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
>>>> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
>>>>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>>>>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>>>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>>>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>>>>>
>>>>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>>>>>> in that.
>>>>>>
>>>>>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>>>>>
>>>>>> Without the fix, it is not possible to initiate a transaction on the bus, which
>>>>>> in turn prevents enumeration.
>>>>>
>>>>> But why? As you said below the first pin control state is changed during the
>>>>> probe, which is fine, and the culprit one happens on the recovery.
>>>>
>>>> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
>>>> devices on the bus.
>>>>
>>>>> Why is recovery involved in probe? This is quite confusing...
>>>> Let me try to explain it differently. Here is the simplified call chain:
>>>>
>>>>   i2c_pxa_probe()
>>>>      ...
>>>>      i2c_pxa_init_recovery()
>>>>         pinctrl_select_state()                  <- selects GPIO state
>>>>         pinctrl_select_state()                  <- selects default (I2C) state
>>>>      ...
>>>>      i2c_add_numbered_adapter()
>>>>          i2c_register_adapter()
>>>>              ...
>>>>              i2c_init_recovery()
>>>>                  i2c_gpio_init_recovery()
>>>>                      i2c_gpio_init_generic_recovery()
>>>>                          pinctrl_select_state() <- selects GPIO state***
>>>>                          ...
>>>>                          pinctrl_select_state() <- selects default (I2C) state
>>>>              ...
>>>>              bus_for_each_drv()
>>>>                  __process_new_adapter()
>>>>                      i2c_do_add_adapter()
>>>>                          i2c_detect()           <- enumerates the devices
>>>>
>>>> The culprit is the first pinctrl_select_state() call in
>>>> i2c_gpio_init_generic_recovery() marked with '***'.
>>>>
>>>> That call causes the controller to go stuck, which makes it impossible to
>>>> transfer anything on the bus.
>>>
>>> Probably because when GPIO state is selected, the I2C bus pins end up
>>> being set low, which the I2C controller sees, so it thinks there's
>>> another device communicating on the bus.
>>
>> Yes, it seems so.
>>
>> When GPIO state is selected, the bits in the Bus Monitor register which are
>> continuously reflecting the value of the SCL and SDA pins contains zeros.
>>
>> Additionally, the Status register indicates an 'Early Bus Busy' condition, which
>> means that 'The SCL or SDA line is low, without a Start condition'.
>>
>>
>>> I could be wrong, as I don't have the hardware to hand to research
>>> the issue again.
>>>
>>> I have a vague memory that the GPIO state must _always_ reflect the
>>> actual pin state before switching to it to avoid glitches and avoid
>>> inadvertently changing the I2C controller state.
>>
>> Unfortunately, it only helps to avoid glitches on the external lines. At least,
>> in the current case the controller hungs no matter which value combination is
>> being set on the GPIO pins before switching to GPIO state.
> 
> Note that my original i2c-pxa recovery implementation was proven
> functional on the uDPU, both by myself and Telus.
> 

No doubt, and that is why we want to restore the original behaviour.

I just wanted to indicate, that the approach used during recovery, does not help
to avoid the current hung.

In other words, the i2c_gpio_init_generic_recovery() simply does this:

        pinctrl_select_state(bri->pinctrl, bri->pins_gpio);

But even if we replace that with the following code (copied from
i2c_pxa_prepare_recovery()) ...

        u32 ibmr = readl(_IBMR(i2c));

        /*
         * Program the GPIOs to reflect the current I2C bus state while
         * we transition to recovery; this avoids glitching the bus.
         */
        gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
        gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);

        WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));

... the controller still hangs once the pinctrl state is changed.



