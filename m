Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51532CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+1/uCUb/9Eo1Px+rgMFN1iRosL2spXsTi3KsPZ1F3xA=; b=CQJAL3h/UbEZll6uavpQ9+whPm
	w9Rj0spmcqMpEBz+W/wly6MsH+AgzXXtxJlRheYZsV8hxXS1uLCN4wU+XkPwB6cZJfjXimpS1rM6n
	gNDNzipIHNJT5D2CyKDRQNGmMxW8j2An+/0b0p+Tw4tQkORQ8twWgmb6LA8Ug9V+TeDnBZ28Y0Mhn
	Yjs020GKVacTN672XbWdbBbv5jWUReVJPa6heFbeNGAzw/cavZNIZRP9pqMH8cOFtnZwCUuc7xNqb
	tbKXOcGtzIMVFE3wz4ZACViL4YaqyH7hcp+ka1JZBcFOJS6qJT6ErHWIN3t7Dq/mVd3CIoH5XTGDm
	8iEfhCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbAk-00000000jK6-0MC3;
	Wed, 06 May 2026 12:16:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbAh-00000000jIq-3cEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:16:12 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778069767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+1/uCUb/9Eo1Px+rgMFN1iRosL2spXsTi3KsPZ1F3xA=;
	b=KEZNfb6au2XwQeEEi0swhycY4FJgNVfQtWY/FhK/yCoI3hSDLSwaRRZI7RlzCEMExUQY7f
	T+QvDlQipN8FjeKi9rITCGTCItHT1Du7tdlSvZgdhQ74eu9zdcBtt8pwU8sOJ181n2cmw8
	J9/k9sA5/zZtm5ooh/ksw3AgrucA71XVof7sdGHN+LWlrg0VV3tte3HlksbB5VLszGhz28
	H4IgGvitX+Dn21W9SBCcjK0JOXsIi/JrEVu6xlth/4EHNuMcc01rZuEvaxqYBbT1EoX7Cs
	d0OeQzL+2UoVRxfvwy9zy3ryLgFelOU8Zr/F5jtXA+rwQit7NsJnRKlvKmc2QA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778069767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+1/uCUb/9Eo1Px+rgMFN1iRosL2spXsTi3KsPZ1F3xA=;
	b=HDAiL6vdcaFMCJJ0GmldyQzwhs3/86r20VaemvAKGIZwBdTF4E/PwfsT+zLFPFOhI9PuXQ
	Bfk90npEht4yNjAQ==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	Joseph Tilahun <jtilahun@astranis.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH tty v4 0/6] 8250: Add console flow control
Date: Wed,  6 May 2026 14:21:55 +0206
Message-ID: <20260506121606.5805-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_051612_044136_9925BC07 
X-CRM114-Status: GOOD (  13.21  )
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

Hi,

This is v4 of a series to implement console flow control for the
8250 serial driver. v3 is here [0].

The 8250 driver already has code in place to support console flow
control. However, there is no way to activate it and it is
incomplete. This series provides the necessary missing pieces while
attempting to be as conservative as possible, so as not to introduce
any side effects into the many 8250 variants or other non-8250 serial
drivers.

For patch 2 I used the following Coccinelle script to perform the
modifications...

===== BEGIN cons_flow.cocci =====
// SPDX-License-Identifier: GPL-2.0-only
// Options: --all-includes

virtual patch

@r1@
type T1;
identifier U;
@@

T1 {
   ...
   struct uart_port U;
   ...
};

@r2@
r1.T1 *E;
@@

- (E->port.flags & UPF_CONS_FLOW)
+ uart_cons_flow_enabled(&E->port)

@r3@
struct uart_port *U;
@@

- (U->flags & UPF_CONS_FLOW)
+ uart_cons_flow_enabled(U)

@r4@
struct uart_port *U;
@@

- U->flags |= UPF_CONS_FLOW
+ uart_set_cons_flow_enabled(U, true)
===== END cons_flow.cocci =====

Changes for v4:

- Rename uart_get_cons_flow() to uart_cons_flow_enabled().

- Rename uart_set_cons_flow() to uart_set_cons_flow_enabled().

Changes for v3:

- Deprecate UPF_CONS_FLOW. Provide separate boolean with wrappers as
  alternative.

- Update all UPF_CONS_FLOW users to new cons_flow wrappers.

- Use irqsave variant of spin lock for status update.

- When 8250 console flow control is not specified, clear the policy.

Changes for v2:

- Prepend a patch to perform an extra LSR wait after CTS assertion if
  the initial LSR wait timed out.

- Close a window in serial8250_register_8250_port() where console
  flow control was briefly disabled.

- Add port lock synchronization to the port->status RMW update in
  uart_set_options().

John Ogness

[0] https://lore.kernel.org/lkml/20260417102423.40984-1-john.ogness@linutronix.de

John Ogness (6):
  serial: core: Add dedicated uart_port field for console flow
  serial: Replace driver usage of UPF_CONS_FLOW
  serial: sh-sci: Avoid deprecated UPF_CONS_FLOW
  serial: 8250: Set cons_flow on port registration
  serial: 8250: Check LSR timeout on console flow control
  serial: 8250: Add support for console flow control

 drivers/tty/serial/8250/8250_core.c |  6 ++++++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++++++----
 drivers/tty/serial/bcm63xx_uart.c   |  2 +-
 drivers/tty/serial/omap-serial.c    |  2 +-
 drivers/tty/serial/pch_uart.c       |  2 +-
 drivers/tty/serial/pxa.c            |  2 +-
 drivers/tty/serial/samsung_tty.c    |  8 ++++----
 drivers/tty/serial/serial_core.c    | 21 ++++++++++++++++++++-
 drivers/tty/serial/serial_txx9.c    |  4 ++--
 drivers/tty/serial/sh-sci.c         |  5 ++++-
 drivers/tty/serial/sunsu.c          |  2 +-
 include/linux/serial_core.h         | 20 ++++++++++++++++++++
 12 files changed, 78 insertions(+), 17 deletions(-)


base-commit: a2083fd1fa7aa0ef5cd8fd92396da0de2d0654b0
-- 
2.47.3


