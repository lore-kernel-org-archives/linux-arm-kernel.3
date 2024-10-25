Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FCAD0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BaMI7xK5CDE1AVh2xl1M1mpGiuvwD67j8JdYjHyyaAI=; b=myGst49GPWzj6qfzp/BBxSLSvx
	Vi4fHnJIbiKYQUavnDUhseWV/5h9xwGtfPtTsZ1EaOIGqEDgV/gllgoBjTiNnf8zZ3A5gHJINmA/4
	MgMpN602yDJQ7u9IZnu49vDXC6+KY3q59wZXmL+YvfmNYMiwy0Jc8VocCjSeFkIfYxe7BRXrohdLN
	PVvIL94DVQ0tShtamuNRUPOYfF/CYRulK5YUoRktzxp3oValH55YN6szgf47Gc/dUK0yU+1ZQFjU9
	6UHeT4kuU9gEg6bjF7jzArrH4nWRQF2kHPXUrtYU6cGKkvYtFkVQFYHJ3s/cT7mcFGqLzrsLNujBG
	Ms3uDeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IGW-00000003TAU-429x;
	Fri, 25 Oct 2024 11:14:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I0b-00000003QzS-0e6e;
	Fri, 25 Oct 2024 10:57:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729853850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BaMI7xK5CDE1AVh2xl1M1mpGiuvwD67j8JdYjHyyaAI=;
	b=aF2QojYylpUohFEfjvAcmUdRmJKWKkgI+kN/nhCI7unR40PsOgWcZVuDu2/CJI31HKbRHz
	PAYRCrErIBkL3l86ea0axirUuqi+gDmF16wT+N+eW38C+PQdvVvhJ/3+EN6RfRyr2WEVpw
	Y5AaEWESwwNFSL0xZ9dkWmQMoadqNOk0BqT7NM7OluyFYIIP8L0y99aH27k5eXSjoqjH03
	BmQZCcvk1R5hmHG+iwkSB9pujk64UKPg1pOrDVA7OEWQY+fEE/u2Mv7uQ/eJ9uKcjhS9jv
	OBnRl0LiPo5y8avOjVv1WevAdR+7NzLBy7RxmGKwsEPcKNXIx0wJprs4ZYZn5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729853850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BaMI7xK5CDE1AVh2xl1M1mpGiuvwD67j8JdYjHyyaAI=;
	b=1GU7AjS1WBDVwLILzkCisdsPZK8lvdMTVn9BygIsq4FIXbn8CQlS5db+9I2LcjOAIBolgE
	IvjK+h9Heh0ajXAQ==
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
	Rengarajan S <rengarajan.s@microchip.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Peter Collingbourne <pcc@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH tty-next v3 0/6] convert 8250 to nbcon
Date: Fri, 25 Oct 2024 13:03:22 +0206
Message-Id: <20241025105728.602310-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035733_495516_B9A96704 
X-CRM114-Status: GOOD (  11.66  )
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

This is v3 of a series to convert the 8250 driver to an NBCON
console, providing both threaded and atomic printing
implementations. v2 of this series is here [0], which also
contains additional background information about NBCON consoles
in general in the cover letter.

To test this version I acquired real hardware (TI AM3358
BeagleBone Black) and tested the following modes:

RS232
- no flow control
- software flow control
  (UPF_SOFT_FLOW, UPSTAT_AUTOXOFF)
- hardware flow control
  (UPF_HARD_FLOW, UPSTAT_AUTOCTS, UPSTAT_AUTORTS)
- software emulated hardware flow control
  (UPF_CONS_FLOW, UPSTAT_CTS_ENABLE)

RS485
- with SER_RS485_RX_DURING_TX
- without SER_RS485_RX_DURING_TX

The tests focussed on kernel logging in various combinations of
normal, warning, and panic situations. Although not related to
the console printing code changes, the tests also included
using a getty/login session on the console.

Note that this UART (TI16750) supports a 64-byte TX-FIFO, which
is used in all console printing modes except for the software
emulated hardware flow control.

Here are the changes since v2:

- For RS485 start/stop TX, specify if called in console
  context.

- For RS485 start/stop TX, when in console context, do not
  disable/enable interrupts.

- Relocate modem_status_handler() to avoid unused static
  function for some configs.

- Move LSR_THRE waiting into a new
  serial8250_console_wait_putchar() function.

- For serial8250_console_fifo_write(), use
  serial8250_console_putchar() for writing. This allows newline
  tracking for FIFO mode as well.

- For serial8250_console_fifo_write(), allow 10ms timeout for
  each byte written.

- Use FIFO mode for thread and atomic modes when available.

- Introduce serial8250_console_byte_write() to handle writing
  when not using the FIFO mode.

- Consolidate thread and atomic callbacks. Now the only
  difference is modem control: For atomic, called as irq_work.
  For thread, called direct.

John Ogness

[0] https://lore.kernel.org/lkml/20240913140538.221708-1-john.ogness@linutronix.de

John Ogness (6):
  serial: 8250: Adjust the timeout for FIFO mode
  serial: 8250: Use high-level write function for FIFO
  serial: 8250: Split out rx stop/start code into helpers
  serial: 8250: Specify console context for rs485_start/stop_tx
  serial: 8250: Switch to nbcon console
  serial: 8250: Revert "drop lockdep annotation from
    serial8250_clear_IER()"

 drivers/tty/serial/8250/8250.h            |   4 +-
 drivers/tty/serial/8250/8250_bcm2835aux.c |   4 +-
 drivers/tty/serial/8250/8250_core.c       |  35 ++-
 drivers/tty/serial/8250/8250_omap.c       |   2 +-
 drivers/tty/serial/8250/8250_port.c       | 267 +++++++++++++++++-----
 include/linux/serial_8250.h               |  11 +-
 6 files changed, 251 insertions(+), 72 deletions(-)


base-commit: 44059790a5cb9258ae6137387e4c39b717fd2ced
-- 
2.39.5


