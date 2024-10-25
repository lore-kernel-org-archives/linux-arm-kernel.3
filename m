Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45810D0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itdUdyilJOpXHuFtqnevEly013GrPHaehmC4+D0Il8Y=; b=iNgbyn2tOlByxDdMSmHjQWQ/im
	vnXJSZ4kh27lJPZFwqbiZlDR7j0ICeRb8oBnO514ovrOdMFq+1Ho+2Qi1/5krfeyuXsfJn7lgY2X1
	0RXRqY51kJxVlxR27uuvzywDsZBASKC2aWNeN6J1DOVAHW6GVjvgOxO7KKC5BPhO9YgoHWfqgzj9v
	8Cucoc7xfYmuyMME1LLiVG046h38A7l4LNDDO2e2x+TwffXLq0P5x5XXaG0hw1zr/j7pCBpDN/CTW
	PlFzBwJwmJSPBjOb+MOmQVHvy/sbmvmW9l1OrHz5NxzXcYWlazVkuEKYtNKRwQa1oLHiMEP73YGeh
	EKFffi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LYl-000000043yz-23Uq;
	Fri, 25 Oct 2024 14:45:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LFV-000000040PS-2djK;
	Fri, 25 Oct 2024 14:25:12 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729866306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itdUdyilJOpXHuFtqnevEly013GrPHaehmC4+D0Il8Y=;
	b=qzz+CQfKtotbVau0Y6+NhdZ4HmIqfEaYFXsRFsANieSq5A38Su3Cm8Ubh+rVbLujDPJqQd
	e1n8qT13oxrEXf/EPUvnU3LS0/RH8C/L3PGNFrgDjlugYl6moOLlCthh6WwxN+Kt0NBtGp
	Q7ShTaUSdSDEGDQBxkWsxgfp3CtEHjuar6LKajK8sjK79cTElZEwBE/KWTywTYXa6qCjBS
	92R/i3vb4DcB6ZOWFC28aONYkhqHA7JctnvWGvkgbpZDmvU8Bhp7Iintt62Uq1GnBWS0mJ
	cH2I0Svhn99JoLJy2UekKxlmfCjWXRf6s06gciEpBrGdFVnl7KHWahgv2hEd/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729866306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itdUdyilJOpXHuFtqnevEly013GrPHaehmC4+D0Il8Y=;
	b=6Ztb4PK+2rZAZQ8Ud576zxXjCPq6h5nE37Q1xOVKczBp4u6HGX49CaKypX8Q8DVJCfq0Z+
	+jrRMGRjDn78/HCw==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Esben Haabendal <esben@geanix.com>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, "Paul E. McKenney"
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
In-Reply-To: <ZxulYcgH1kTyx9Kr@smile.fi.intel.com>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
 <20241025105728.602310-5-john.ogness@linutronix.de>
 <ZxulYcgH1kTyx9Kr@smile.fi.intel.com>
Date: Fri, 25 Oct 2024 16:31:05 +0206
Message-ID: <84v7xg2rb2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_072509_832747_8D12ABAF 
X-CRM114-Status: UNSURE (   9.97  )
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

On 2024-10-25, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> Add an argument @in_con to the rs485_start/stop_tx() callbacks
>> to specify if they are being called from console write. If so,
>> the callbacks will not handle interrupt disabling/enabling.
>
> toggling ?
>
>> For all call sites other than console write, there is no
>> functional change.
>
> So, why not call the parameter better to emphasize that it's about IRQ
> toggling? bool toggle_irq ?

Currently there are only 2 users:

serial8250_em485_stop_tx()
bcm2835aux_rs485_stop_tx()

The first one toggles the IER bits, the second one does not. I figured
it would make more sense to specify the context rather than what needs
to be done and let the 8250-variant decide what it should do.

But I have no problems renaming it to toggle_irq. It is an 8250-specific
callback with few users. And really the IER bits is the only reason that
the argument even needs to exist.

John

