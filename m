Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81FACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dEYir/2XuerYR/zFtfA1ekaCfjn07xS7trKmwd+Ix4=; b=N2cIFJpeV4c7afuY2WFHAv6duF
	66ZuSecsjVM5mnjmYaY7WBu1LHKsZNxyMNZ298BhccsrFKfEOxxsn1y9qCSKOMdlTdc43cyUnRoqi
	1pOlJ70bCLB+6NiuGTN4hDLJkNzSqw/fu0dQfunk09VooRvp1Yrcvi+qwt+WS21PGHu2zwJyUJbUL
	NClDlgCMS7tCUh4I07Vq/1yEGqQwwVRyIWdeDdAMUGMK/cGnMNOzokHDIJ/DZ7EfzPLNdyvZKp95d
	1M+MeBMe1/8RzTJmLh2FIhlHZ3IqC0I5QOuFHMRKaqx57Q2F8G9Y55itWtWrapXA1PQoGMhGKIAbz
	EtPszizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uneta-00000005m8I-0nhm;
	Sun, 17 Aug 2025 15:02:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uneqz-00000005lzf-3NMM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 14:59:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso23332265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442764; x=1756047564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dEYir/2XuerYR/zFtfA1ekaCfjn07xS7trKmwd+Ix4=;
        b=eWiERkbGK3SwvK//ccF8DXKqhzybgsrV9wWTCBRfRghc/cW0j+rMd2gZrtiwkM5kA9
         COZVe2a6QxyZpb98R5uFesgrqgJq7gmag5fFJnHpKmayWj1NufgnyVMzlYyOHfCDUE15
         G2ek2gXQYyyRaokoypCVgQEPNcOqtNcEUOItfH3OY/rL4ZQeliRKkEV/pmf6nJPTmHJt
         DZJF/bR8soQGaw9aw1W9cfZEh7I/LuN53SPXdYuPpllRubDIBLWRGys3wgS8ypCjIsLJ
         e/p9qi4plrOGyi1kxheprw7Os1aL6aotbaGsATS9iVsiNzERaeWKy8O1d8u/9b3XmB4h
         KLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442764; x=1756047564;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dEYir/2XuerYR/zFtfA1ekaCfjn07xS7trKmwd+Ix4=;
        b=vIbkkagXpgbPCSmk9XnZuGXcIQ6GERicDUTlV8meSxNRIxELgMdIGnCe31lqizAzfR
         mvsD+KZdRSrZ8XRWiNJ2jkeXVJlXVoTcOu0/ANEfCTnrNoYahbk2mmwcAFW8BDNvVpS4
         KzUTyarW9JfZrFhAvHf+wGXKrj7BO/rt0c0bqFx3tcjphRcfHfwGLxcM4lilYJeYCAAi
         KbEbXrkOXvI2oql/7yH3GhiwtBM5Lg367dGG6zaLbKdw4+2UVf3udWnwyrCu5LtIWvaZ
         +fvav5gnQfuRECxxjZbtMLSKYohQ7Z15o3cG0IK8jOlounC5KNftGA6nftfbtOe2uApH
         yvTg==
X-Forwarded-Encrypted: i=1; AJvYcCXrmkEZFhOQwlLSHoT+y4xZPZSIlLSCyPq1oJkFcqkTBwndPik7lWMhoDqxfCp061wpl7jx1G5ZE0mH/CnxglI+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ2jqaFu/LpNdMrdIfanRRxwsE8taE4DYzpWEcyFBbOHtbYd+b
	PUA/mFYNzYNxpFQu58DOg6Y0O2v8iGuSpNaotJnBwDyqDSk9m2CArGypeDVfuQ==
X-Gm-Gg: ASbGnctacSuZv9vejV/H4MUiChsDXuZq5s5PVTUzSp9PXyjC4RnnAenK8bfZqqKdSAT
	5DvdAWPIsM1rcNSSZAroXCPQNYteleLp6SaEodoDujT8GO1NTlzvNPNOPNnzcDS7lwo6Ci3tpCL
	awAUJLsJT2CCgpjtqPbod11Ovr3Q0ELNfykeXQKwsTbc/u5mYpWCC4G7TlFdDR/m6EVWO64uwvx
	7btotQk4rMFL4jySPxMbTC1TTQbi4vx3Whh9/5sAk2N+uOpJkXlkQhXhLLLXT2o4Lx4o7dkqiID
	IYTaPDWrvcQMHC4Buwvs2Sa/qJP4aTxgr+PuGaiYQzOF6tlp8ja6R/nMzOXCSmqyRNccfG/0jUj
	relCYajbhe/ek4AADkRH8bPXC9sr7ZTguVymtnNaaZnXgAlPIUxTHsk2IJ8KCCs0+A+33TTMIQA
	==
X-Google-Smtp-Source: AGHT+IE8VMEyAyKM1RYCnl/iUCoCK2kvUjYv8GNQ/YgCG5kPP/YXGV/SAOA23GQyvuL0j8cyPJRDOw==
X-Received: by 2002:a05:600c:c16e:b0:458:bf9c:274f with SMTP id 5b1f17b1804b1-45a29740947mr24555155e9.29.1755442763572;
        Sun, 17 Aug 2025 07:59:23 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6d89b9sm140585425e9.12.2025.08.17.07.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 07:59:23 -0700 (PDT)
Message-ID: <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
Date: Sun, 17 Aug 2025 16:59:22 +0200
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
Content-Language: hu
In-Reply-To: <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_075925_846258_B7D1D702 
X-CRM114-Status: GOOD (  23.08  )
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

2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
> On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
>> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
>>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>>>
>>> ...
>>>
>>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>>>
>>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>>>> in that.
>>>>
>>>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>>>
>>>> Without the fix, it is not possible to initiate a transaction on the bus, which
>>>> in turn prevents enumeration.
>>>
>>> But why? As you said below the first pin control state is changed during the
>>> probe, which is fine, and the culprit one happens on the recovery.
>>
>> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
>> devices on the bus.
>>
>>> Why is recovery involved in probe? This is quite confusing...
>> Let me try to explain it differently. Here is the simplified call chain:
>>
>>   i2c_pxa_probe()
>>      ...
>>      i2c_pxa_init_recovery()
>>         pinctrl_select_state()                  <- selects GPIO state
>>         pinctrl_select_state()                  <- selects default (I2C) state
>>      ...
>>      i2c_add_numbered_adapter()
>>          i2c_register_adapter()
>>              ...
>>              i2c_init_recovery()
>>                  i2c_gpio_init_recovery()
>>                      i2c_gpio_init_generic_recovery()
>>                          pinctrl_select_state() <- selects GPIO state***
>>                          ...
>>                          pinctrl_select_state() <- selects default (I2C) state
>>              ...
>>              bus_for_each_drv()
>>                  __process_new_adapter()
>>                      i2c_do_add_adapter()
>>                          i2c_detect()           <- enumerates the devices
>>
>> The culprit is the first pinctrl_select_state() call in
>> i2c_gpio_init_generic_recovery() marked with '***'.
>>
>> That call causes the controller to go stuck, which makes it impossible to
>> transfer anything on the bus.
> 
> Probably because when GPIO state is selected, the I2C bus pins end up
> being set low, which the I2C controller sees, so it thinks there's
> another device communicating on the bus.

Yes, it seems so.

When GPIO state is selected, the bits in the Bus Monitor register which are
continuously reflecting the value of the SCL and SDA pins contains zeros.

Additionally, the Status register indicates an 'Early Bus Busy' condition, which
means that 'The SCL or SDA line is low, without a Start condition'.


> I could be wrong, as I don't have the hardware to hand to research
> the issue again.
> 
> I have a vague memory that the GPIO state must _always_ reflect the
> actual pin state before switching to it to avoid glitches and avoid
> inadvertently changing the I2C controller state.

Unfortunately, it only helps to avoid glitches on the external lines. At least,
in the current case the controller hungs no matter which value combination is
being set on the GPIO pins before switching to GPIO state.


Regards,
Gabor




