Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E9C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahRnGypdincJrQV1sCyNvMoD/ahUyfJQ2W/I3pAFSh4=; b=aTtdKq0Va+a4CPRk42e18r2c5E
	O2csEf5ZDDMElkryB1k9ySa2YAzYOLrYVPh88g+bx5ssZ1YOJ4T+ciTSWvw8F077EjnB1qI9R0F0w
	yfaFPmFnwh8FhSnn2cBX4IWLFHby7q73DTSPZVDD+8qk/Pgkq5ll7/S7403g/kUYU7nm4oZ62Rx4x
	RFITDkdjTW+zD2X98oaZpKmEnxgnW5o3tXZy46dSetCrLkjffaUX14rhsaxOGrhkmf0LsK7D/xFie
	Xb7Vr8FOuyMdc4PMjD+awOOCcCFGpdU5aAnM7f3fER76RVJwHwdU6ZowgGG43Zm1loGQmKesX1OkJ
	S1bXbWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwK4x-0000000842a-2z2R;
	Tue, 18 Aug 2026 13:42:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwK4u-00000008428-3cjo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:42:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so4084224f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787060526; x=1787665326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahRnGypdincJrQV1sCyNvMoD/ahUyfJQ2W/I3pAFSh4=;
        b=IQYRnQF7xSI3WPg9sKEbTpwwF8ejHVb4Rrtc6hPreCvHnupoTPXITLxOWVmrGajrZ7
         OQ4FhWJZTvITTKmQBS+WtepBIGYYMuiXqfXFlKclK4L+duPfYV3hZpgfxhvoep+I4zOp
         wtYhny9AvXU8yp/qDLaL9O0kIVsW6LUIQwxaLN0HoIFt+FfZBIdvP988mn42l32IXwU6
         IUMEPOYd+9O2jtp+cW57R79dFFLuV2/epFtKBn9iKPpTFG52yffOTNzZXAxuMZQouV/F
         FRHkBbxl75Pmq//THzUiNxmPGKSaNfal8oo3OGbe1J5z8W02f0ahL4vsAjStEH9EuABu
         n3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060526; x=1787665326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahRnGypdincJrQV1sCyNvMoD/ahUyfJQ2W/I3pAFSh4=;
        b=WnSR0cxa1u89cQgNTLJYo2e0M69+fAp2l41HCfdQX8mv9tp7vmUVsmeBsvm4844pC5
         ym3i8uiZgNRXz35p4SKasrY/WrNeDGIGbd3JBoEWM8+hEb8EJSPXANSA+UJ5FSluu092
         58TeDqbFbbcJ1OzOFO5flWfcmjB9vDkzEi8TRg4388T/xP+iLmj5Fwo7ghxUQgfM0eX7
         4ULH4Ot/sY6QsvifErCil1G40lfibmkh0ZGeNs96ev7YGFK9Y2GBlDKFgsL3fOcB5hAL
         6K/yZU6iK0V8eOBI3F1yJf9qJq37pbZ0mSG75ju7orQHhCIrQ7VYEnPw+BvGxlecdz7A
         ZzaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq5/Ug4v9j5X4wkhyaJ9Z+VouaK/m/H9j2eoQ0FR9/rO4mCbLKq7zuW/U4v4xpyw5VUQRj2mXHTRAvei0RACKn@lists.infradead.org
X-Gm-Message-State: AOJu0YzVb9XAi2F6tJyVKUW9+4mSPp7wbUTYiFrGhHbAsBYcJ13wzxcj
	qLyGK4krmvSdpqCYuluSgzfbqy8gYy9x+lPRsO+P72ssB7DTFtAvAhLOEfMIUKM8OkA=
X-Gm-Gg: AR+sD11t1cugDE8spOp4IumkO8tAlQtGSkHliU/aMz2LkidN6E++2UuQP36gckz0nXr
	mUZlD16WCz/onhM48OcHBtrB3N4gwKhGvAMxYB4xG4GwowgKAp21UE2WkXdDaif0kVufQ+lLn2X
	DOwNVl/xYT+tbH6aKmnS0PoegTTL0QSST3VB/O2Ytw2gEYn6O1b8a4X2MN1z1wla0rJb8a36CXj
	1XaoLdEGIB8F6I+oQ38pRL33SXjSNR8Jj4mgfnbOtcO8TAFq3zUnXbKAzIt06k7fWFNSuAuuIjO
	rIaJQ1U3iYTtSx8xECxAIDM8gARtH+AClELAJRb0tQ/yJSEA6VDh+LrdH3LB4xqEve20Ss39Oih
	a/q9GTJazm971mfyxtmTJT54GHCyz+HcxWZkvMXPr9LeYv6lFPQXaqZpNhcRs87EXFEG5feXMK+
	6VCpCtHdz0kqDiS+KuLDzpRCFEhWis93fIjnWkYpmYN3zaynlS2MfvIsD1NzCE7A==
X-Received: by 2002:a5d:5f4a:0:b0:47f:e770:13e0 with SMTP id ffacd0b85a97d-48160715b9bmr55580729f8f.7.1787060526000;
        Tue, 18 Aug 2026 06:42:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783basm12544056f8f.30.2026.08.18.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:42:05 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:42:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v2 08/10] serial: ambarella: add Ambarella UART driver
Message-ID: <aoRhKb0nYCLCwXGN@pathway.suse.cz>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-8-6b09707c5fe9@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_064208_922126_C386F3B9 
X-CRM114-Status: GOOD (  19.97  )
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

Added John Ogness into Cc.

Jiri asked me to look at the printk/nbcon related parts.
I am going to make just a quick look after I came back from vacation.
Maybe, the custom code won't be needed at all when the 8250
API is used in v3.

Anyway, please add me and John into Cc for v3, ...

On Thu 2026-08-06 17:34:16, Long Zhao wrote:
> Add an Ambarella UART driver with console support for early boot
> bring-up on CV75. Keep udelay() in wait_for_tx(); it runs under
> console/poll paths that may hold the port lock with IRQs disabled.
> 
> --- /dev/null
> +++ b/drivers/tty/serial/ambarella_uart.c
[...]
> +static void serial_ambarella_console_putchar(struct uart_port *port,
> +					     unsigned char ch)
> +{
> +	struct ambarella_uart_port *amb_port = to_ambarella_uart_port(port);
> +
> +	serial_ambarella_putchar(port, ch);
> +	amb_port->console_line_ended = (ch == '\n');
> +}
> +
> +static void serial_ambarella_console_device_lock(struct console *co,
> +						 unsigned long *flags)
> +{
> +	__uart_port_lock_irqsave(&ambarella_port[co->index].port, flags);
> +}
> +
> +static void serial_ambarella_console_device_unlock(struct console *co,
> +						   unsigned long flags)
> +{
> +	__uart_port_unlock_irqrestore(&ambarella_port[co->index].port, flags);
> +}
> +
> +static void serial_ambarella_console_write_atomic(struct console *co,
> +						  struct nbcon_write_context *wctxt)
> +{
> +	struct ambarella_uart_port *amb_port = &ambarella_port[co->index];
> +	struct uart_port *port = &amb_port->port;
> +
> +	if (port->suspended)
> +		return;

This should not be needed. The con->write*() callbacks should never get
called when the port is suspended. Otherwise, the message would get
skipped and never printed again.

I am not familiar with the low-level driver and suspend code.
I guess that you might need to implement suspend callbacks,
for example, see pl010_suspend()/resume() or
of_serial_suspend()/resume().

Note that the printk subsystem will stop writing to the console when
console_suspend() is called, see uart_suspend_port().

> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;

We might need to store the control register and enable transmit here,
for example see pl011_console_write_atomic().

> +
> +	if (!amb_port->console_line_ended)
> +		uart_console_write(port, "\n", 1, serial_ambarella_console_putchar);
> +	uart_console_write(port, wctxt->outbuf, wctxt->len,
> +			   serial_ambarella_console_putchar);
> +	wait_for_tx(port);

We might need to restore the control register here so that
the serial port is usable for the original purpose again.

> +	nbcon_exit_unsafe(wctxt);
> +}
> +
Best Regards,
Petr

