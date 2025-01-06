Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C54E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4YVUyvlmLs4ShZ5WoAXv9zQ/4rn/hNmmIlIQjqYU1c=; b=PseJQ2Uq8DQITQ/+jtqlQNss5C
	IApYH892YaJ3jXQmlbGK7T/+J0rS8XLV2nugER60AFV0r1MHF+p8Eqqu7LBB19YYRePsL32U7QF7I
	JaRAohPNwoVdvfBEK18CCafWITD0PFGMLD/38x+PgKPP5oxQcxR4IEFQsbVyKBQ3595OREB7n8GKx
	3gE7eo71cwwyOOetsJ0v0oufm0p53z6nInchtkh3fqMFUG2G1yDtkbknzvviwe51Qzk4gXWJmLm6p
	UbvGUaFTuYRL+lStEAk78gTAPpnrS0YDlZphqxOz7zIF+8O+/joEDzVp/Z7zcKIuculfdzOSmLVuo
	3LivN5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnhy-00000001UtC-3tZI;
	Mon, 06 Jan 2025 14:03:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnek-00000001U8r-1T7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:00:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-386329da1d9so6642023f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736172032; x=1736776832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4YVUyvlmLs4ShZ5WoAXv9zQ/4rn/hNmmIlIQjqYU1c=;
        b=IWkVtLbIahjaMHS6G2jRzmz+kBo6wlZexIeSLQSwcP2IgQ6GVR32RNCPUnCySJU1jz
         AfqwhtrlDgvQdiLtVZ/L+mr5NPKZo1YhvjTwCZf10+YfrmsHVQUEr6SB91hPt/2Ac4ne
         xcFxgEI2fX66mDA2MRpCCT0tQUY1/ahPahmvmFI6YmN9FUCysHhKGVmW4TD30oJfKr69
         KNXum3Czvd2vXa2lwF1FS1XiAmTQzrUPNQZJGZOmw8kFkVITqmaER1+zaSdUf1NEW6UU
         oV4IHhmc7xS6tBA5KqiEshd1xx8FtmXeTvUIFDYXxOB96N2cPKJN9cZhzUBU0B+qIMmf
         EjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172032; x=1736776832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4YVUyvlmLs4ShZ5WoAXv9zQ/4rn/hNmmIlIQjqYU1c=;
        b=Mp5LxymOyhdhy8etG9NbDhgkHh3hk+ycIoHN5sanU6xANJp1sKT3IXDv6LoPTkVc/j
         fNsGkhe4AOHGYqSOgzTg75Vq+YzXSIh9LYA1U1oPdDMC5HQljILEOrkcOqXFZycIes5N
         4ktEJg75F7l7PCpc/DpTdON1B3RgV3GF/WHxHnGhjXiec3d4q7GF5O8EYO+7meYruQ3B
         4Nznm8CQk7/HiGQczl38SpJ24sh/Cn6JjMiBKOxY10hAoGQ9/EExge4cFQ5f5rJMmFcY
         cfMGJTMUV2gyNZekyprXAUmEC/pSv7mqAGzFnRXApgXQDeQYXoGW/r+gXwQIYhWd2YS6
         U9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhBbvYXz5SEzUV/w68TykjgCGTJZEsASDWjAfpkNcBOu3rflqVJzrrNJ1dYBupFNfN9TovlYzMHTvKZGr2SQxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwqKXIyKbz/Sf+ZYIDGJaFnSvF++SFpStEv2xGIZjJ2b9KN8qr2
	OsPsKp3ZLVuHyQvhfWbLY26lrxEhcp19RKzgcLzRpqxnJ2IH133avaZBvDVfHRQ=
X-Gm-Gg: ASbGncvdWe3hPEmyg8s3a7/oJk8mtA8F+4lzvdqaJtip5TjN0h18TSMhrKjmibqfPY0
	V5Vqg0DuttW2FAr8S5Xr83hLpB7KWxgyst686Wx9bTCmEq1YbpBjTihA1t+mopK79yOqb3GoKTZ
	Z4TXl0YijfwrGeSPyaqhMKTV2iVC7xfBcptUh0zQZQrYxnIHo+LCRwTkPLiREEzTbg6v1TT25it
	nXJSpvVbx8Z5xMACjEzIGGfwIkNTUkMJMTNNa8pQQjWuuig1xH1+vWf6g==
X-Google-Smtp-Source: AGHT+IEqaDb8lNaJ2brtbrHX0OiZbuauW9GLm6TzQr7FyD4aBcCJ9xDlwVNH3hoY7B3x4d3Qs9SuiQ==
X-Received: by 2002:a05:6000:1848:b0:385:f220:f798 with SMTP id ffacd0b85a97d-38a221f3001mr38289712f8f.6.1736172031927;
        Mon, 06 Jan 2025 06:00:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm565553555e9.24.2025.01.06.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:00:31 -0800 (PST)
Date: Mon, 6 Jan 2025 15:00:28 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Sunil V L <sunilvl@ventanamicro.com>,
	Matt Turner <mattst88@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH tty-next v4 4/6] serial: 8250: Provide flag for IER
 toggling for RS485
Message-ID: <Z3vh_Bi8tgu_dKvH@pathway.suse.cz>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
 <20241227224523.28131-5-john.ogness@linutronix.de>
 <Z3gCeP_P7VPpcOLA@pathway.suse.cz>
 <84jzbaxg13.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84jzbaxg13.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060034_387415_D99D9C44 
X-CRM114-Status: GOOD (  25.87  )
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

On Sun 2025-01-05 01:32:00, John Ogness wrote:
> On 2025-01-03, Petr Mladek <pmladek@suse.com> wrote:
> > My understanding is that the nested IER manipulation does not
> > harm.
> 
> This statement implies that it is OK for UART_IER_RLSI|UART_IER_RDI bits
> to be set in UART_IER even though the console will write to UART_TX,
> because the _nesting_ contexts would set those bits rather than
> restoring the original value of 0x0.

This is a misunderstanding. I am sorry I was not clear enough.

To be more clear. By the nested context I meant

	if (em485) {
		if (em485->tx_stopped)
			up->rs485_start_tx(up);

call by serial8250_console_write(). The original code did:

	+ up->rs485_start_tx()
	  + serial8250_em485_start_tx()
	    + serial8250_stop_rx()

, where serial8250_stop_rx() cleared the flags:

static void serial8250_stop_rx(struct uart_port *port)
{
[...]
	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
	serial_port_out(port, UART_IER, up->ier);
[...]
}

But the flags were already cleared by:

	__serial8250_clear_IER(up);

called by serial8250_console_write() _earlier_. Which did:

static void __serial8250_clear_IER(struct uart_8250_port *up)
{
	if (up->capabilities & UART_CAP_UUE)
		serial_out(up, UART_IER, UART_IER_UUE);
	else
		serial_out(up, UART_IER, 0);

}


It means that the nested serial8250_stop_rx() did not change anything.
It was a NOP. The bits were already cleared.

Similar, the counter part. The bits were later set by

	up->rs485_stop_tx(up)

which did:

	+ serial8250_em485_stop_tx

void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
{
[...]
	p->ier |= UART_IER_RLSI | UART_IER_RDI;
	serial_port_out(&p->port, UART_IER, p->ier);
[...]
}

But it was after the writing the message so that it did not affect
the operation.

> I ran some tests and leaving these bits set during Tx does not appear to
> cause an issue, but it is difficult to say because the context
> interrupted by a nesting context will only print at most 1
> character. Also, it is writing under spin_lock_irqsave() so that might
> be masking any effects. Perhaps UART_IER is temporarly cleared because
> of other bits that would cause problems during Tx?
> 
> I would need to create a specific test to investigate this
> further. Regardless, it still is a cosmetic ugliness that bits are not
> being properly restored, even if it turns out these particular bits are
> not problematic during Tx.

I think that you do not need to investigate it further. We should keep
IER cleared when writing the message.


> > All in all, the patch looks good to me.
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> Thanks for the review. I interpret it to mean that I do not need to make
> any changes to this patch for v5.

Yup, I am fine with the patch as it is.

Best Regards,
Petr

