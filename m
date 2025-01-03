Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EB8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ice7cYRdFs+QLoHiO93smnTaXPt65ioMoXGDDatRNI4=; b=u/ygLnZjEUQXG524ib9znGumoK
	iwa6NxkkPl6NFvBGq9YcgHIGZypl+NLI4VgVNs1x0wfuLLmGN6r4iLrUWqpOLrlAH0VJrgRKd/D4V
	n3uerRDJBkAQLXZgHdt1ev27ZLmhMFxC4T4ywoRsHPhKvIgCp0IK/XrRWL1tendDfl43lng/Edml9
	MJw1Xnkm6rjLXoXfEy+QGsTrC+++EeIjbKJf/qYNGpMl43yZglpojRYGFpHY3McRh3PwJdN0kPP2a
	dMDLhwJx79D6/1ktXsPpgcQpXmgGZzqtj6xqy4wym/gucunmclKx2pIHEN1epSmfqeyl4dDmW5yrx
	+KKz8MGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjdz-0000000DHpl-1pI4;
	Fri, 03 Jan 2025 15:31:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjcl-0000000DHZD-173U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:30:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385de9f789cso9260834f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 07:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735918204; x=1736523004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ice7cYRdFs+QLoHiO93smnTaXPt65ioMoXGDDatRNI4=;
        b=D0Yg1xFkWZFhH6zNk1U/5WRcBmn4hMqcqoL6hAWWOt1TMmWuibXNkEUhSRfMEAEtzf
         FtlLZwdZ+9ZLpLY8nbJ6H3UzwMFXRbwPzKmT8LDD9Ku1mSyxpTqL/QgtGnjLfoVdy8pD
         PITKKtfvrX4MMetGIUNZWvuamXLI56fEPOMG01vFYgLz3Dbi+z7RMIIXU4gykk8WPTK9
         uo8NQluEM4IvBNfTqXoeR0leszITZz4S3AYAF34NlsElGydHsWocj2rP5fyco7fOImad
         a+l96OkMdyrS2X/rH30IpkeIaJ13e1W42lC0tcHZgBftDngl2DY0i7aBzTEhh1hzZmnR
         Qh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735918204; x=1736523004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ice7cYRdFs+QLoHiO93smnTaXPt65ioMoXGDDatRNI4=;
        b=BnYpZxNnDGV3iCzEIVk6OJPkh0UxK6vPlJP/Uoe7fy30k5FwaYYftzZ0v+AObh3DAu
         ufIRMJIeLWc95R9fgaPN01RIkJ/n6zQu7mn+dD6rA+balmpJUrsACuWyv5AFqPWTkKu7
         2fN2BGoUYpBkXk6ZGCApFD64F3E1EXsHD2+W1lmdXKnW96Y+vduzkKvIkqrk3THhMoh6
         bOGONA4u20Iay21WClEoE7bzONSJm4dCvppW3mU3f1HFJgg/3VgGCyTvOPGQ+PA1AqAS
         9HyyqpTY30LqT/LS0yPY0Jzi42GXwh7ll6NkQ4Pm5CR9nQY5K3nMaKoDkJvNuEQ9g9Zl
         5ziA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ168bJZWxhjrdrNKEePSGr1cOQSI6a7vSnXSlityXiowiMz/vall0SujaortooNyBSpd9X956rmiP4kSCM2TD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3qD0mJgiZ1u6zYEKSPjwNRU/zcJha0x0ex0+F7Z9bVcmw9Kg/
	5Ca8B4m6SXUgKabzcSiyX/XOLNYcJDmXfOlBarid1jwAZ9XIxkm7owlwbPXAkXY=
X-Gm-Gg: ASbGncuX4La5XOpZjufEA71I8QLkjkLfgyrkHn51SMDllE1UKqr0zIca0ct+capZDH2
	+B4z+RxmBUopi8JVKPmHWl4X/sYa0Zi3HEYjPnYPbIq9E9BYt4wTxwYsWFXwKygJFo6RpCtIvgg
	3njujDWpCEk+K7IFWPOZ/8G5aBd1CtuJC93WuKYjiD2o4+2gIYto+ZJn33c5DZjzsw9w6D9a0mm
	HFDF8iQMG0HcYgy2GTb623sqXvs37DyuzgaViddULMlfIDudZETC91KXA==
X-Google-Smtp-Source: AGHT+IH6JmsUHg85TdAQhpQucHKqxoNFRbNhm5zR5E1P6rwqwaNo/Q6VArzNm4hYKNojN140/QcgDQ==
X-Received: by 2002:a5d:6da1:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38a221fa065mr40145822f8f.20.1735918204519;
        Fri, 03 Jan 2025 07:30:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm40462019f8f.69.2025.01.03.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:30:03 -0800 (PST)
Date: Fri, 3 Jan 2025 16:30:00 +0100
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
Message-ID: <Z3gCeP_P7VPpcOLA@pathway.suse.cz>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
 <20241227224523.28131-5-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227224523.28131-5-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073007_348980_B7C54D7B 
X-CRM114-Status: GOOD (  24.71  )
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

On Fri 2024-12-27 23:51:20, John Ogness wrote:
> For RS485 mode, if SER_RS485_RX_DURING_TX is not available, the
> console ->write() callback needs to enable/disable Tx. It does
> this by calling the ->rs485_start_tx() and ->rs485_stop_tx()
> callbacks. However, some of these callbacks also disable/enable
> interrupts and makes power management calls. This causes 2
> problems for console writing:
> 
> 1. A console write can occur in contexts that are illegal for
>    pm_runtime_*(). It is not even necessary for console writing
>    to use pm_runtime_*() because a console already does this in
>    serial8250_console_setup() and serial8250_console_exit().
>
> 2. The console ->write() callback already handles
>    disabling/enabling the interrupts by properly restoring the
>    previous IER value.

I was a bit confused by the description of the 2nd problem.
It is not clear whether it actually is a problem.

My understanding is that the nested IER manipulation does not
harm. And it is not needed at the same time. As a result,
the related pr_runtime_*() calls are not needed either.
So this is 2nd reason why the problematic pr_runtime_*() calls
can be removed in the serial8250_console_write() code path.

> Add an argument @toggle_ier to the ->rs485_start_tx() and
> ->rs485_stop_tx() callbacks to specify if they may disable/enable
> receive interrupts while using pm_runtime_*(). Console writing
> will not allow the toggling.
> 
> For all call sites other than console writing there is no
> functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

It seems that the patch does what is says. I'll try to describe
it using my words to explain how I understand it.

IMHO, the main motivation is to prevent calling pm_runtime_*() in
serial8250_console_write(). It is not safe in some contexts,
especially in NMI. And it is not needed from two reasons:

  1. The console->write() callback is used only by registered consoles.
     And the pm_runtime usage counter is already bumped during
     the console registration by serial8250_console_setup().

  2. The pm_runtime_*() calls are used in the following code path

	+ serial8250_console_write()
	  + up->rs485_start_tx()
	    + serial8250_em485_start_tx()
	      + serial8250_stop_rx()

     This code is not needed because serial8250_console_write()
     always clears IER by __serial8250_clear_IER(up) anyway.

     In fact, the extra IER manipulation in serial8250_em485_start_tx()
     might be seen as a bug. Well, it is a NOP.

All in all, the patch looks good to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

