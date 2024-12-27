Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 22:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AU+OvOmPVS0Qfj6w2emgT2IVnoV9nyph0SjDWXQfu+k=; b=Z5UpEejHx+zFUdlfij9uTEjmfP
	gxgbvpuFagve4M9MugeMmtbMSKmrBgxPjNF2vIUt16gCCkXS55quE1rCH+liAgHoMa3vgOeMZm06C
	8Rn45eLbMM8qLXWJ73XhTVMpTRQx4smc7CT2+zMDDHPEOO7k2ijLmCfA1E3d48OJKRzS+7y4c/pu/
	Ohg7aT3M+TsYbZQpzGwSqMdEKoViIo5rQiW96aGWIxF2Bhdj7sIRuuxY+NxnqkDolfN2BvMFl0CUB
	JHF/mP7FcpEabY98OZCe2bZ9VWBPTHDEdAbFD7l2uLupKMwOLjkc6KyaJOg4gr6BXkl0NwuSqlY5M
	U4h+I2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJ6T-000000013SC-2ZnC;
	Fri, 27 Dec 2024 22:46:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJ5F-000000013ER-1sjs;
	Fri, 27 Dec 2024 22:45:31 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1735339524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AU+OvOmPVS0Qfj6w2emgT2IVnoV9nyph0SjDWXQfu+k=;
	b=yxy+X+LQNTzces/KTsZ8rjBKxhO8UIC08KJByrPEqIIEVFjXbulBBvloejidTWtd7OYtzr
	lLsxGQNwADm2B5TlR0GOsiqLqcSC2/ymIt2wyNpY00mLgDt1u6RmHjcXSKJfAz7RuDA24L
	Z20ysMbPGpDGMgD28u43MJlLAWWdOW3AKBHd2+whubtlx4eGt9CoMOSR46So6qU9qZOm+l
	M6C16a2dxvi39tQT8agmzkygEmJXzRxyCFxwusd8xiELbwodG3LQjy76BpDN61FKDZ4e7i
	codwrS/t4oR8qiRvav97ioX+nV8l3XSzfMn901qOVcw+jJ4qVNphsUkEfTLB4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1735339524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AU+OvOmPVS0Qfj6w2emgT2IVnoV9nyph0SjDWXQfu+k=;
	b=coYk0RSiNWl0CeOAXg0GxU63IELeK5oCDPQCfYG0iVFCYoluNCDxHPydMexRLPZv7b441l
	exTiXqRZK7P1y5AA==
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
	Rengarajan S <rengarajan.s@microchip.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Matt Turner <mattst88@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH tty-next v4 0/6] convert 8250 to nbcon
Date: Fri, 27 Dec 2024 23:51:16 +0106
Message-Id: <20241227224523.28131-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_144529_663296_77D41B82 
X-CRM114-Status: UNSURE (   7.83  )
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

This is v4 of a series to convert the 8250 driver to an NBCON
console, providing both threaded and atomic printing
implementations. v3 of this series is here [0]. Additional
background information about NBCON consoles in general is
available in the cover letter of v2 [1].

The changes since v3:

- For callbacks ->rs485_stop_tx() and ->rs485_start_tx(),
  rename argument @in_con to @toggle_ier (inverts meaning).

- For univ8250_console_device_lock() and
  univ8250_console_device_unlock(), rename argument @con to @co.

- Do not introduce helpers __serial8250_stop_rx_mask_dr(),
  __serial8250_stop_rx_int(), __serial8250_start_rx_int().

- Use @frame_time to determine per-character timeout, fallback
  to 10ms if @frame_time not available.

- Use shorter code syntax when setting @console_line_ended.

- Introduce helper function fifo_wait_for_lsr() to wait for
  multiple characters.

- For serial8250_console_fifo_write() and
  serial8250_console_byte_write(), remove unnecessary
  READ_ONCE() usage.

- For serial8250_console_fifo_write() and
  serial8250_console_byte_write(), use nbcon_can_proceed()
  rather than repeatedly enter/exit unsafe regions.

- Initialize @modem_status_work using init_irq_work() rather
  than IRQ_WORK_INIT().

- Commit message and comment style cleanups as requested.

John Ogness

[0] https://lore.kernel.org/lkml/20241025105728.602310-1-john.ogness@linutronix.de
[1] https://lore.kernel.org/lkml/20240913140538.221708-1-john.ogness@linutronix.de

John Ogness (6):
  serial: 8250: Adjust the timeout for FIFO mode
  serial: 8250: Use frame rate to determine timeout
  serial: 8250: Use high-level writing function for FIFO
  serial: 8250: Provide flag for IER toggling for RS485
  serial: 8250: Switch to nbcon console
  serial: 8250: Revert "drop lockdep annotation from
    serial8250_clear_IER()"

 drivers/tty/serial/8250/8250.h            |   4 +-
 drivers/tty/serial/8250/8250_bcm2835aux.c |   4 +-
 drivers/tty/serial/8250/8250_core.c       |  35 +++-
 drivers/tty/serial/8250/8250_omap.c       |   2 +-
 drivers/tty/serial/8250/8250_port.c       | 223 +++++++++++++++++-----
 include/linux/serial_8250.h               |  12 +-
 6 files changed, 214 insertions(+), 66 deletions(-)


base-commit: 2c1fd53af21b8cb13878b054894d33d3383eb1f3
-- 
2.39.5


