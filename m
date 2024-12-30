Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0Ta0DJsbzn2ZLhVqlv8dv42niwU17XW21qLA074XCI=; b=QxsOfZ9EZ5SLN9O+81hSCxdqVu
	/4R+y3snUPHDPnPjnXqcUfcTPoIvJCvJHdS3iwo3yh4sXqNXTgCq1kN4wu24I75CjxpXJBZLFNMos
	GNc2JYN75S7UufRUL7pjL0dZJEDx4UzNxwhATzg85R2wkt+a/PMwz6ZtG8UB+OM5v9itvWZVp86Yy
	ahEqOl5ZeNFZvYdSesNpRpj2dQoJoKxOtOtJq8a/kRZVdLEcyocbg2nm/s1i4CYf/fJKaeDZ4FTyM
	PwPjxjX+yugJBADr6nGZree7C8IHeNzpzEs5kl3DywdofOrT0+Ht/cptr4EYi6xboKvN6EWmBipVp
	pA38GkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHje-00000005RYN-10Mh;
	Mon, 30 Dec 2024 15:31:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHiS-00000005ROO-0fkk;
	Mon, 30 Dec 2024 15:30:01 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1735572596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0Ta0DJsbzn2ZLhVqlv8dv42niwU17XW21qLA074XCI=;
	b=zV3N9C2wqQ1woRKwb0m1EnKxApoAQkr4JyzEwDQ/wJngmn5IVx5IDLb5pswfRUflrz8Ld1
	Yrm82tMfbsi/Pez1o32LrPTaVjnS51mLcifOLysFYPU/x+xBq/fdWJPbnuaDtnBKgMdEGT
	L7AC0ANI7LTpNtZkO1q+dYjMHnwhPTEgP108wrQWxjAA3JvC3vZoeirwkPtoBOufAfbiOr
	5AjD6YxA+SfAIqN1bGFSlucpYZc6SQ8U46TJIEurxHa83xuPW1Of/WvamlcbSt1UhOztw0
	pCv3aeJhod6tz0/mPqwAtqAHEAzChVY0AeTeumrNZk4nXzeZIdsmEHuELMSA0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1735572596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0Ta0DJsbzn2ZLhVqlv8dv42niwU17XW21qLA074XCI=;
	b=rZH7+Zd0GKA7jczUq6tkXw5b34YBrxr3lAIPf9uYRC6eZ5S91ZjzC3JRJ+bIZGxr8nswI0
	0W/EQcccnUbL+SAQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Esben
 Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Rengarajan S <rengarajan.s@microchip.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Serge Semin <fancer.lancer@gmail.com>, Wander
 Lairson Costa <wander@redhat.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Matt Turner <mattst88@gmail.com>, Stefan
 Wahren <wahrenst@gmx.net>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Udit Kumar
 <u-kumar1@ti.com>, Griffin Kroah-Hartman <griffin@kroah.com>,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH tty-next v4 0/6] convert 8250 to nbcon
In-Reply-To: <20241227224523.28131-1-john.ogness@linutronix.de>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
Date: Mon, 30 Dec 2024 16:35:55 +0106
Message-ID: <84y0zxp4ss.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_073000_342735_4B073AB0 
X-CRM114-Status: UNSURE (   5.40  )
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

On 2024-12-27, John Ogness <john.ogness@linutronix.de> wrote:
> The changes since v3:
>
> - For serial8250_console_fifo_write() and
>   serial8250_console_byte_write(), use nbcon_can_proceed()
>   rather than repeatedly enter/exit unsafe regions.

I will revert this particular change for v5. It is necessary to
exit/enter unsafe regions per character so that handovers can occur
mid-line. Using nbcon_can_proceed() only allows the hostile takeover
case to perform mid-line interruptions.

John

