Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF98CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkvhJ/9wP8zr+IJruUAJhSjjyH2HxiZyy6n7D1GMZRw=; b=vHE0wyXi2e56IKxD05JYvHA9wb
	mnFEir8vX4YovJx+/jhe3pQqwcE0S3Zs7rrvmbEeBcPY9iD/MJYo1yrSuDAD3bXH24Hi6hp9E/hZP
	Yx2PzgHuphsCNNviLG09L0itvrwSUMcdPbCsyMjaNnW0eYy8CXpCz4NZTNS7yBxSxQPO93V8lUvuu
	a21IkleeaAaOymWZGHsCyKeBZouJJkTZfhCzcMtcu9DqWyawAKq7GfEKIxkTZzh9172b1HcBAm4Bl
	hpj0BDmRGx8e/hLnVbm+mLp4e9Q5PMKOhjQb4OOOxS2GQrrXuume90vfTOAOSm5olLWbXig8yH326
	Wys+txZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpfZ-000000081Iz-3KWC;
	Fri, 15 May 2026 10:21:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpfV-000000081GT-1jp6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:21:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b150559bso70860735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 03:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778840479; x=1779445279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkvhJ/9wP8zr+IJruUAJhSjjyH2HxiZyy6n7D1GMZRw=;
        b=DblRqcbk8lvkl55Sgyl8pARNqmOcV4kM5itV9WZlchVnCH6FSjHBCRLDuYJRe3Ap+Y
         T40kkgwifPVILYCMpAxDfnDmsiB1Ln0gzGEIPzKyAB2zZYb1MLOlaXxetPd2VqAU7pJp
         wvxdnwEw+1zr9D/rt2QNhP4ouKSTqkG0INriKbmSZEhyysJmmsX77p+Sy5ZH49m8yLZj
         mVySr5S+fY6XN8uGHnLi0XdOFQfabaV2blf9I4LE7ntx57qEOfOQg2pFOpt4ZWevp4ox
         typmhYxn0Oql0N/OdMunSA8yIY4h2hbhsMUhiSVGqsOk/JWqJzZenGmVN4JoaldYApV6
         3SjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840479; x=1779445279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkvhJ/9wP8zr+IJruUAJhSjjyH2HxiZyy6n7D1GMZRw=;
        b=Vi98wXcrKdiA7KyOHSubSjDhTxpC/r9dOERljVfVpy/DUfXJ7qyP7QbtNlGohYB8AR
         12a1Hz4zeILIZD1GxLieWOpqfsczhu/Yp2cbSdNZPWqRNvnH7HP/mS18BO1r4vsRy8Le
         VixM+YZGW2G/IZN/q2qoqkr0aGyQbIjZp9XmUGQkyV1fnqVGvTQeR+qedw25Q9+QeKZX
         pDqMmsSeyzQqr5aVDStIvTj0zqrn7dw3+H0n+dzG37vi8ffyh0PRZJrV2Py9T+mpJdw5
         TLI2mNOxFROHGTi45P6iaJ0trRIMVl6AGuPe833LciksHdW7JDvE1FCVyOlz+671CAVm
         QZTw==
X-Forwarded-Encrypted: i=1; AFNElJ/qH2bjtXJosaHNHUcKZnsQGVm2528D6nVSRZs63Dt/cdMgLrTACBtQGqpnoeH86vyZvsJbBDegpAVv8TKI0KMH@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKddh+BoavXr+R7rLgdSSyEgTD1O6oqxEd44S0+XqYcBE/8LD
	tclDjvkgpgkjOpEHoGZzonPoMEYYF+nTI5bjg56x9VxuoSgBbXcaWbZo+rIAMizH4ZI=
X-Gm-Gg: Acq92OGBg9wSiCdk+2rzO5zSq7fQXAkFM6l7vMQZYfVNBfC1tedeVXjyplWk2kET+j1
	tfFedyn4PjC24iEr9Gk4QP6D4c9Vsceea29WNp0VwIB+krGte54GmQ585YTzTIALWisKywt1OUd
	a+MQBo2xhybvASBUiGEIrJO74PVgcbU4Nl59nAlrKqLYCEjEcjx2bb3GAq/NCEsSk1Dw2ud5Pfc
	+/W07PS4Up0z/52ZqZ8QGG/h8oIwPaCPjygoRb0D02ngm8X39wVEfQHk2U759tbD/WYTLvXI6OB
	BZ3RsoDuEs/vqTqVq7UOf6Fo2VCjOAsGa046faCJRKN/ycLellHGO5HXLTtIPj3hmeCvii3Q9oI
	OM7yJMwF80yxe8wnHScLqnHicWDkw4pXRE06Oe8tBoeSi0DniKbomffCYm0MN0e5fVA9r82pmdU
	AbBiO2Boy1+uvi96dfx98CnZ+x2xaqdIYl
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id 5b1f17b1804b1-48fe6626ba1mr44036975e9.29.1778840479456;
        Fri, 15 May 2026 03:21:19 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c834besm52284855e9.3.2026.05.15.03.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:21:19 -0700 (PDT)
Message-ID: <ae8fdfa0-d910-432c-b5fc-f11b997a4bce@linaro.org>
Date: Fri, 15 May 2026 13:21:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tty v4 2/6] serial: Replace driver usage of UPF_CONS_FLOW
To: John Ogness <john.ogness@linutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Fourier <fourier.thomas@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, sparclinux@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>, Juan Yescas <jyescas@google.com>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
 <20260506121606.5805-3-john.ogness@linutronix.de>
 <87lddvy2dl.fsf@jogness.linutronix.de>
 <1a5abd2e-e9ab-4a48-94c2-5e082f57adde@kernel.org>
 <87wlx56rcc.fsf@jogness.linutronix.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87wlx56rcc.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032121_504287_F5E77413 
X-CRM114-Status: GOOD (  21.44  )
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



On 5/15/26 10:53 AM, John Ogness wrote:
> On 2026-05-13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> (This email is particularly directed at the Samsung folks.)
>>>
>>> Responding to Sashiko:
>>>
>>> https://sashiko.dev/#/patchset/20260506121606.5805-1-john.ogness%40linutronix.de
>>>
>>> On 2026-05-06, Sashiko wrote:
>>>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>>>> index e27806bf2cf3e..2f94fc798cffb 100644
>>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>>> @@ -319,7 +319,7 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
>>>>>  	ourport->tx_enabled = 0;
>>>>>  	ourport->tx_in_progress = 0;
>>>>>  
>>>>> -	if (port->flags & UPF_CONS_FLOW)
>>>>> +	if (uart_cons_flow_enabled(port))
>>>>>  		s3c24xx_serial_rx_enable(port);
>>>>
>>>> This isn't a new bug introduced by this patch, but does this code
>>>> result in a recursive spinlock acquisition and deadlock when console
>>>> flow control is enabled?
>>>>
>>>> The serial core framework calls port->ops->stop_tx() with the
>>>> port->lock spinlock already held. When uart_cons_flow_enabled(port)
>>>> evaluates to true, s3c24xx_serial_stop_tx() invokes
>>>> s3c24xx_serial_rx_enable().
>>>>
>>>> Looking at s3c24xx_serial_rx_enable(), it unconditionally attempts to
>>>> acquire the exact same lock again:
>>>>
>>>> static void s3c24xx_serial_rx_enable(struct uart_port *port)
>>>> {
>>>> 	struct s3c24xx_uart_port *ourport = to_ourport(port);
>>>> 	unsigned long flags;
>>>> 	...
>>>> 	uart_port_lock_irqsave(port, &flags);
>>>> 	...
>>>> }
>>>>
>>>> Because spinlocks are not recursive in the kernel, it appears this
>>>> sequence would cause an immediate deadlock on the same CPU.
>>>
>>> Although out of scope for my series, the reported issue is real. Perhaps
>>> something for Krzysztof or Alim to look into.
>>>
>>>>> @@ -493,7 +493,7 @@ static void s3c24xx_serial_start_tx(struct uart_port *port)
>>>>>  	struct tty_port *tport = &port->state->port;
>>>>>  
>>>>>  	if (!ourport->tx_enabled) {
>>>>> -		if (port->flags & UPF_CONS_FLOW)
>>>>> +		if (uart_cons_flow_enabled(port))
>>>>>  			s3c24xx_serial_rx_disable(port);
>>>>
>>>> Similarly here, s3c24xx_serial_start_tx() is also called with
>>>> port->lock held, and s3c24xx_serial_rx_disable() will attempt to
>>>> acquire port->lock again:
>>>>
>>>> static void s3c24xx_serial_rx_disable(struct uart_port *port)
>>>> {
>>>> 	struct s3c24xx_uart_port *ourport = to_ourport(port);
>>>> 	unsigned long flags;
>>>> 	...
>>>> 	uart_port_lock_irqsave(port, &flags);
>>>> 	...
>>>> }
>>>>
>>>> Could this pre-existing locking issue in the samsung_tty driver be
>>>> addressed so that the rx enable/disable helpers do not try to take the
>>>> port lock when it is already held by the caller?
>>>
>>> Also legitimate. But out of scope for my series.
>>
>>
>> Thanks for letting us know. Deadlock did not happen so far, so something
>> is missing in Sashiko's report. :)
> 
> Nothing is missing. I am guessing you never use console flow
> control. The deadlock is clearly visible:
> 
> ->stop_tx() (always called with the port locked)
>   s3c24xx_serial_stop_tx()
>     s3c24xx_serial_rx_enable()
>       uart_port_lock_irqsave() (DEADLOCK!)
> 

Right.

The lock acquisitions in the rx helper functions are redundant and shall be
removed.

The serial core framework invokes the .stop_tx() and .start_tx() callbacks
with the port->lock spinlock already held. Furthermore, all internal driver
paths that invoke stop_tx/start_tx also acquire port->lock prior to calling
them.
    
However, s3c24xx_serial_rx_enable() and s3c24xx_serial_rx_disable()
unconditionally attempt to acquire port->lock again using
uart_port_lock_irqsave(). Since kernel spinlocks are not recursive, this
causes a deadlock on the same CPU when console flow control is engaged.

Just removing the redundant lock acquisitions shall fix it. I'll prepare
a patch.

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index e27806bf2cf3..17cd5bb100b1 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -245,12 +245,9 @@ static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 static void s3c24xx_serial_rx_enable(struct uart_port *port)
 {
        struct s3c24xx_uart_port *ourport = to_ourport(port);
-       unsigned long flags;
        int count = 10000;
        u32 ucon, ufcon;
 
-       uart_port_lock_irqsave(port, &flags);
-
        while (--count && !s3c24xx_serial_txempty_nofifo(port))
                udelay(100);
 
@@ -263,23 +260,18 @@ static void s3c24xx_serial_rx_enable(struct uart_port *port)
        wr_regl(port, S3C2410_UCON, ucon);
 
        ourport->rx_enabled = 1;
-       uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_rx_disable(struct uart_port *port)
 {
        struct s3c24xx_uart_port *ourport = to_ourport(port);
-       unsigned long flags;
        u32 ucon;
 
-       uart_port_lock_irqsave(port, &flags);
-
        ucon = rd_regl(port, S3C2410_UCON);
        ucon &= ~S3C2410_UCON_RXIRQMODE;
        wr_regl(port, S3C2410_UCON, ucon);
 
        ourport->rx_enabled = 0;
-       uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_stop_tx(struct uart_port *port)

