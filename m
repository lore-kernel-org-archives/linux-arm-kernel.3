Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D5EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 00:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Y1rCVs4eO4ZyFtQWPQFkqL5hGE0PG7Yt+dpeENG2M=; b=OX2AEBIyKQejU892CwL2qOmz+x
	IT1KQpY22yIFB/oFMGkkzT4XPmIGX2LjmuUg5Yr1HmixAmvBHlpf9QVohWyCIcVCcjy/lq/bJGzj5
	aoA1VSBLUcZogEHTrbYB9dNfgVsTqFyNGFp9fPhCaOrLN9DOyEMdVU1Yt00XCGWjV0O9sILIbsRZr
	WlWhYrjUODEF4xC4ypOYZ6roGFEvG2zN4TvLUknV7MFpCmcChZH9aO9MXMSGcnLVhHgnviGX3FT24
	ZinQcMyMKWp5hFtMeKWy7taP48KzxP3w+F8/gWzTWdyn0P6neYcjUqWL/7YXkNv5Onx5jrS3+NLwO
	P7wmxmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUEUB-0000000FtZi-1VcQ;
	Sun, 05 Jan 2025 00:27:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUET0-0000000FtQE-0YCZ;
	Sun, 05 Jan 2025 00:26:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736036761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+Y1rCVs4eO4ZyFtQWPQFkqL5hGE0PG7Yt+dpeENG2M=;
	b=wQgBhZnqs+K+fV/HH3wGASh8EvPvFpRWkwkx7vKlvA1SZ1pr30rkvm2pLchxzOCe7PsBBR
	G4SHcFPW2XMtLd/4retDIu79i5xQfRBn6VNoJlTlF22521OBWQY3HIykPSQH+L0wcINurE
	VWDtyiiAeh29qpVksLZ4k8yjkkNkKYmdVmTDichrG7LMsWf6nd2F5tc7FS/rTyaWcbVMfW
	Z8aSx6BLFWagdk9rg1SZmfrMJZHFfQ/fiVWQ4wzt7qw0tkDn4NYLUbFKnNg4HzFIz3aTsN
	YziQb5HZZLkA6KWtFKI6UbnugQawdqWPk1b+gpQbYnS9Q2TJwL+CJ+KRs26Azw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736036761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+Y1rCVs4eO4ZyFtQWPQFkqL5hGE0PG7Yt+dpeENG2M=;
	b=M1cv+Y0F11QMDB9kPRcs0+LRZSWSDFjf/e6s5ZSRUALOmkjk+/NQGh3kuHD78SbuO+IhDe
	RvATdDj64tfFDYDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner
 <tglx@linutronix.de>, Esben Haabendal <esben@geanix.com>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Florian
 Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Sunil
 V L <sunilvl@ventanamicro.com>, Matt Turner <mattst88@gmail.com>, Stefan
 Wahren <wahrenst@gmx.net>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Udit Kumar
 <u-kumar1@ti.com>, Griffin Kroah-Hartman <griffin@kroah.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH tty-next v4 4/6] serial: 8250: Provide flag for IER
 toggling for RS485
In-Reply-To: <Z3gCeP_P7VPpcOLA@pathway.suse.cz>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
 <20241227224523.28131-5-john.ogness@linutronix.de>
 <Z3gCeP_P7VPpcOLA@pathway.suse.cz>
Date: Sun, 05 Jan 2025 01:32:00 +0106
Message-ID: <84jzbaxg13.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_162606_322323_E16F0C1D 
X-CRM114-Status: GOOD (  14.18  )
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

On 2025-01-03, Petr Mladek <pmladek@suse.com> wrote:
> My understanding is that the nested IER manipulation does not
> harm.

This statement implies that it is OK for UART_IER_RLSI|UART_IER_RDI bits
to be set in UART_IER even though the console will write to UART_TX,
because the _nesting_ contexts would set those bits rather than
restoring the original value of 0x0.

I ran some tests and leaving these bits set during Tx does not appear to
cause an issue, but it is difficult to say because the context
interrupted by a nesting context will only print at most 1
character. Also, it is writing under spin_lock_irqsave() so that might
be masking any effects. Perhaps UART_IER is temporarly cleared because
of other bits that would cause problems during Tx?

I would need to create a specific test to investigate this
further. Regardless, it still is a cosmetic ugliness that bits are not
being properly restored, even if it turns out these particular bits are
not problematic during Tx.

As was with your LSR_DR comment, you are good at triggering fundamental
investigations into the history of the 8250 driver. ;-)

> All in all, the patch looks good to me.
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks for the review. I interpret it to mean that I do not need to make
any changes to this patch for v5.

John

