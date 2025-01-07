Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59824E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xYO4fJHeCRIYwAVmiA4ogusCG7hNpvzwiLpbh9Q0cfQ=; b=4573UcZQgGFmvS0oL72EMntkKU
	OoD1/4WGUMxTJhvqvgzE6Aw1Wm8cUC8GiGdWqY1XvnSoEpUkhlZiXMF5JVVeHK5n8kLlPyWZMigjj
	9jhb0WoMHEPY4vidJNuAP0WKlqDBne7AwvLQBd8S/pQ3pXdOPPGBgpITyaI+Sliu+LXfr9fXdBRS+
	5Ny89OMOe8vO0UQTlaNqGNbsW0GqGa0KD+gjYWZu06jt+Q6gId4BKyGcGRvu/A5fe5z00sGDpbkeE
	FR+Lsiz5Jb07BL7k84DwBiOAIivhziPOUReRJMuG+kvditxpFqB3Jo/4WV/ZGMwnINO75V9vtWkPt
	BtcFYRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVH7h-00000006KOo-3Rxe;
	Tue, 07 Jan 2025 21:28:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVH6S-00000006K47-2yJy;
	Tue, 07 Jan 2025 21:27:10 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736285223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xYO4fJHeCRIYwAVmiA4ogusCG7hNpvzwiLpbh9Q0cfQ=;
	b=RZTZcFLIZMIsRVafL/9A3SO5tMpikwWlDirpSNg17DoyQb51g8RM/q6JuHlgBOQVzn0HNs
	Yauh8ndV5qAxt5orEnTcfOf54rQckW1ZZ8fpMQZgJhz+Mn/9ZKu72Ghvy1dk02lTQBcoFI
	wc8G0Mdc/M6l72YgrbPBtkSKxC5caJNWCPa/6mEAphycAAHmnG6ZmfRIrfUxF/0XHvIZv7
	ZQ5R1PCF/Qh79wvGCH/VSxMhWUKoi6nHbqfEQyM8re0p6i4J1NaRe4iUJa8TCKmZZhx6lv
	7ReKEoFvOw+R0kgDo4GoRPH1lXiEamD/CEuH0pQIj+XuIH1RvimU70Wygzuhmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736285223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xYO4fJHeCRIYwAVmiA4ogusCG7hNpvzwiLpbh9Q0cfQ=;
	b=6Wmn6fG8H8NB48ewXrd1Aar9a6kgvDhlhGLRHR+tKIzJO9X3MT0G/sHAl3e+T9qgHLsifK
	fb/U7zGJo2uLJCAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH tty-next v5 0/6] convert 8250 to nbcon
Date: Tue,  7 Jan 2025 22:32:56 +0106
Message-Id: <20250107212702.169493-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_132708_901321_435F3AC5 
X-CRM114-Status: UNSURE (   9.01  )
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

This is v5 of a series to convert the 8250 driver to an NBCON
console, providing both threaded and atomic printing
implementations. v4 of this series is here [0]. Additional
background information about NBCON consoles in general is
available in the cover letter of v2 [1].

The changes since v4:

- In wait_for_lsr() use else-condition for fallback timeout.

- In fifo_wait_for_lsr() remove unnecessary return value.

- In serial8250_console_fifo_write() enter/exit unsafe section
  for each character to avoid writing to UART_TX on
  handover/takeover.

- In serial8250_console_byte_write() enter/exit unsafe section
  for each character rather than calling nbcon_can_proceed()
  for each character because nbcon_can_proceed() only checks
  ownership but does not actually handover if within an unsafe
  section. If there is a higher priority waiter, we want to
  handover ASAP so that printing can continue in the higher
  priority context.

- In serial8250_console_write() cleanup the implementation so
  that the procedure is more obvious.

- Add detailed multi-line comment documenting
  uart_8250_port->console_line_ended.

- Add and extend comments as requested.

John Ogness

[0] https://lore.kernel.org/lkml/20241227224523.28131-1-john.ogness@linutronix.de
[1] https://lore.kernel.org/lkml/20240913140538.221708-1-john.ogness@linutronix.de

John Ogness (6):
  serial: 8250: Adjust the timeout for FIFO mode
  serial: 8250: Use frame time to determine timeout
  serial: 8250: Use high-level writing function for FIFO
  serial: 8250: Provide flag for IER toggling for RS485
  serial: 8250: Switch to nbcon console
  serial: 8250: Revert "drop lockdep annotation from
    serial8250_clear_IER()"

 drivers/tty/serial/8250/8250.h            |   4 +-
 drivers/tty/serial/8250/8250_bcm2835aux.c |   4 +-
 drivers/tty/serial/8250/8250_core.c       |  35 ++-
 drivers/tty/serial/8250/8250_omap.c       |   2 +-
 drivers/tty/serial/8250/8250_port.c       | 259 +++++++++++++++++-----
 include/linux/serial_8250.h               |  17 +-
 6 files changed, 254 insertions(+), 67 deletions(-)


base-commit: 2c1fd53af21b8cb13878b054894d33d3383eb1f3
-- 
2.39.5


