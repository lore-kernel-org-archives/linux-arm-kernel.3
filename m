Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E58E68960
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrD0ZfuHoa6x/lqplhytCjOw0Xel3ZOQUIA62v3IfKk=; b=cAYkhFQetuE5XuGShLI5ttHqrn
	U6/ohmds9hyj2IomBeZt0htcjK4AiL51+av8TSunI57AKzwoPg6f4iQgE3RpDCL8YJxBlOF1o7v7t
	jJJnDTstgBxPqhmIHUwzDH8GiPno9JOR3rRiAhqh5RwE8Y6mNNNPZzN7ZSOR7e62ovbixYxzahxdl
	2ELzAiPZLeNa3OLy0qUHRH7RD7FldyBH+yoqacB5SaJ6cI7YBV2IivVhayiP8y04afxKJ1vw0wH5Y
	XMzOXctRJezLRQgMX1ISZm3LmSZleNJ7ve+BS1jcGiJrz17NsjHWj263CFBcWd8QMTCfznQNdkYxY
	cVJ1xM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RHN-000000032fr-2T0m;
	Thu, 31 Oct 2024 09:15:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RFf-000000032JK-0FCV;
	Thu, 31 Oct 2024 09:14:02 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730366034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrD0ZfuHoa6x/lqplhytCjOw0Xel3ZOQUIA62v3IfKk=;
	b=3cXMAKP9i9urmv40oh5aOvpiqjxr5tJ38d79UA5I636s3QeCC16+tHval5Nk0DSaNZCiJl
	T8Z+RcZg8ciKTwXFm8lx/+KLg6t9af1W52MV7T8sXgZs49TMkcT/ax8VczQ/iEjfUWwigA
	Mz6X/UV489Kg3iKgYFLBGTuTmBph7jXddgS721mzVgFIdzaotaQCSVt/v48VKFRBQ6AZh7
	1K0UU6n6Ps1K67S0aMzPUl7vSW2sZwfc3Zdi9WIw0UGw9s79hVzIL5rgFgKQuwSj4AU5lJ
	1bYpuo+LZRywXWAeNLvXlO/hsCWbf9IvO6PkEWe5Z1p0sQ9rbmxSyQ7Xmsss/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730366034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrD0ZfuHoa6x/lqplhytCjOw0Xel3ZOQUIA62v3IfKk=;
	b=CKko7n5TAyXddi94osYz3Z1LksU9iEockc/SoL53s5olauKZSw6RBCaZD7sFQX1qqSo+eh
	MU9CYrJuxciUi2Ag==
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Esben Haabendal <esben@geanix.com>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Stefan Wahren
 <wahrenst@gmx.net>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Ronald Wahl <ronald.wahl@raritan.com>, Udit Kumar
 <u-kumar1@ti.com>, Griffin Kroah-Hartman <griffin@kroah.com>, Rengarajan S
 <rengarajan.s@microchip.com>, Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH tty-next v3 4/6] serial: 8250: Specify console context
 for rs485_start/stop_tx
In-Reply-To: <91303556-2632-49ca-be5d-9105c75b8a63@kernel.org>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
 <20241025105728.602310-5-john.ogness@linutronix.de>
 <91303556-2632-49ca-be5d-9105c75b8a63@kernel.org>
Date: Thu, 31 Oct 2024 10:19:53 +0106
Message-ID: <84plngljn2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_021359_265797_BF0192A8 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On 2024-10-30, Jiri Slaby <jirislaby@kernel.org> wrote:
>> -void serial8250_em485_start_tx(struct uart_8250_port *up)
>> +void serial8250_em485_start_tx(struct uart_8250_port *up, bool in_con)
>>   {
>>   	unsigned char mcr = serial8250_in_MCR(up);
>>   
>> -	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX))
>> -		serial8250_stop_rx(&up->port);
>> +	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
>> +		/*
>> +		 * In console context, caller handles interrupt disabling. So
>> +		 * only LSR_DR masking is needed.
>> +		 */
>> +		if (in_con)
>> +			__serial8250_stop_rx_mask_dr(&up->port);
>> +		else
>> +			serial8250_stop_rx(&up->port);
>
> Would it make sense to propagate in_con into serial8250_stop_rx() and do 
> the logic there? That would effectively eliminate patch 2/6.

I considered this, however:

1. The whole idea of stopping RX in order to do TX is an RS485
issue. Modifying the general ->stop_rx() callback for this purpose is
kind of out of place.

2. The ->stop_rx() callback is a general uart_ops callback. Changing its
prototype would literally affect all serial drivers. OTOH the
->rs485_start_tx() callback is specific to the 8250 driver. (It seems
each driver has implemented their own method for handling the RS485
hacks.)

So I would prefer to keep the necessary RS485 changes 8250-specific for
now.

John

