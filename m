Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17828E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm1NgCVjgslKq+GaJUj/gh/Sm2mhWSvo2Psz3mBxd7o=; b=tM4BJv5Dj0VMPi6I1cgkOKemaA
	Y1SLH/NxHySDnNg7xX5JLKkbthmezBfZ9M75OEL64frwRVBMomMslS4FsYq0dtu8mKZW6tbY3txqE
	KCv18A6UAO4eO+smzsy6E4YffP693GhDgtErMXhvEOP+l9B9W1u5KAUPwbEvpABCfxEESlwZQbQXg
	+HnMOPKSpfbmhZNy3xAFE7Nx6BVuqRihq8Jq4WQD6d+nX12PcYqMr5VGD4A/Hu+CLgd/tk/biEkHl
	QW2LLQqmjFvGFeXqZsz2uouGKTglaxiKjkXU60+2CIxVj7Vu9F430N1kL+MdctMsuJzMAdrjoNmLX
	YF0LJTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDWw-000000055JI-0Am0;
	Mon, 30 Dec 2024 11:01:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDVj-000000055E2-47jJ;
	Mon, 30 Dec 2024 11:00:37 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1735556430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vm1NgCVjgslKq+GaJUj/gh/Sm2mhWSvo2Psz3mBxd7o=;
	b=KgCJarP+wCqCM94xpTM71A4ayqZ0KzEBdNLtVVoJ7jym+nWVH6lQYMVj3Ni2frYtpQay+m
	fjrLasdQvlOn88KoC1LCLQOqfB6/yTlGWRcbQ4XOwVuK5l3DuIz3Dv5aUungpyrFpC7h8z
	5D/FP3DukdSMLJocZ8uGlPPB53Fb2RO5ytJR8oImNNoIkwlcU4Z6l9aATFKcz7C70tfMhX
	hCfOCCe4PXtXYqjvqGUTrb0//I5dwubNmCiQMpXGA+D1QpGQ2lMl8uApA4iPZfbXXFTxvs
	Rg7SYqsfOGuuoUVOOmfkht0Nu5OUj7p40fpudBRZu1m0ryJm1ii5MOhQgkaWTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1735556430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vm1NgCVjgslKq+GaJUj/gh/Sm2mhWSvo2Psz3mBxd7o=;
	b=TAY3L6ai3+8KkjlmA6nrxrBsBNF5OurnSwfmxdqHg5/M4bKoZA05v3sfSUzugF00ELa8Hw
	3xgj456KyrtcIMDA==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Esben Haabendal <esben@geanix.com>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Rengarajan S <rengarajan.s@microchip.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Serge Semin <fancer.lancer@gmail.com>,
 Wander Lairson Costa <wander@redhat.com>, Florian Fainelli
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
In-Reply-To: <Z3B5TQkz1S-C1wro@smile.fi.intel.com>
References: <20241227224523.28131-1-john.ogness@linutronix.de>
 <Z3B5TQkz1S-C1wro@smile.fi.intel.com>
Date: Mon, 30 Dec 2024 12:06:29 +0106
Message-ID: <841pxpqvua.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_030036_161629_3BB101A9 
X-CRM114-Status: GOOD (  10.86  )
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

On 2024-12-29, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Dec 27, 2024 at 11:51:16PM +0106, John Ogness wrote:
>> This is v4 of a series to convert the 8250 driver to an NBCON
>> console, providing both threaded and atomic printing
>> implementations. v3 of this series is here [0]. Additional
>> background information about NBCON consoles in general is
>> available in the cover letter of v2 [1].
>
> Just to be sure I understand the side effect of this series, i.e.
> the
>
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/tty/serial/8250/8250_port.c#L44
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/tty/serial/8250/8250_pci.c#L9
>
> are not needed anymore (the first one can be replaced to something like
> dev_dbg() or analogue)?

Correct. With NBCON console drivers it is safe to call printk() while
holding the port lock for non-console-printing purposes because:

1. printing via ->write_atomic() does not use the port lock

   and

2. printing via ->write_thread() is performed in a separate dedicated
   printing kthread that can safely spin on the port lock

John

