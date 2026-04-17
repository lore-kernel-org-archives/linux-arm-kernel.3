Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA2F4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sT89vdNi1tSkKoKmWLBjgb2FXe2g6tBONEq1VPMnDwU=; b=sRWL4DjYyw/in7MPlbB5EktQAs
	5CpdxHaX4jn1gAZju1a0u5C2LpWN5C966tYFnZamBKzfwKZViejnHupAJ4WhhhCFwU7nm4moqFyak
	G99OsT6ZLGbdKPjsnnTjb+Vlvbg4JBao1jY0AfpV+P9LLIABiIQscKLaUscpTVSshlViFGv8RpDDk
	eDKKZxgzI4JyjlbBfgL6/ExvttuT+94VukptJIvYxsoH9XcrPYXdYQADB1YXR/V1lVYkayF5MYxeq
	udQBgrzb3iZQtoAGAD7UzlPI7+i6/Mij5Ud9Gol2M0xe9HQ1kSplyIzuSQ+i8s3SdLc7j8VMjqZHQ
	8qDficLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgNR-00000003tzt-2Alx;
	Fri, 17 Apr 2026 10:24:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgNO-00000003typ-3Ulq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 10:24:44 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776421464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sT89vdNi1tSkKoKmWLBjgb2FXe2g6tBONEq1VPMnDwU=;
	b=sVYorXF1yw9POGgD1GvSzasC9FsBfzUA53utmab5zqdwZK09rO+r3uPwzEpQyEYAeLf3yR
	eXDLqT33zCItMiS7JxvQMSHMUET4Wkx6Pewb1RLEVX2rKls19HyK/3ogBxzsN74VdYmftR
	NU6p4B9WLYGVCqqWZTb0epZ+mq839WiX9ptIUN4hO6NxdBMyxxo5lOmaE8Jy3JdbFg+l33
	/IVaLuMEG8/+iBh517EXEgMO0FOIwt4yJsjeHhtbRAycsMG2pBGbNGd5zRIurDQleytEX8
	Xt+HuK1GwBj+5Ob1HSUJyNzbk6cjt7ukNgndGos3sRiPv6fBGzCq0L8Az9hiBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776421464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sT89vdNi1tSkKoKmWLBjgb2FXe2g6tBONEq1VPMnDwU=;
	b=Oeidtc+T3Qo4Nmp1Qb9eB2oio0COfltJZ2ZdzoWqP+QM7mOtmHpofaaeXCHCAWtMukIEmu
	XA3ALkr512woVkBQ==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Xin Zhao <jackzxcui1989@163.com>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Gerhard Engleder <eg@keba.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Joseph Tilahun <jtilahun@astranis.com>
Subject: [PATCH tty v3 0/6] 8250: Add console flow control
Date: Fri, 17 Apr 2026 12:30:13 +0206
Message-ID: <20260417102423.40984-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_032443_014842_56195AB5 
X-CRM114-Status: GOOD (  13.29  )
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

This is v3 of a series to implement console flow control for the
8250 serial driver. v2 is here [0].

The 8250 driver already has code in place to support console flow
control. However, there is no way to activate it and it is
incomplete. This series provides the necessary missing pieces while
attempting to be as conservative as possible, so as not to introduce
any side effects into the many 8250 variants or other non-8250 serial
drivers.

Note that as of v3 I am now deprecating UPF_CONS_FLOW in favor of a
separate boolean field. In the commit message (patch 1) I explain my
reasoning for this decision.

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
+ uart_get_cons_flow(&E->port)

@r3@
struct uart_port *U;
@@

- (U->flags & UPF_CONS_FLOW)
+ uart_get_cons_flow(U)

@r4@
struct uart_port *U;
@@

- U->flags |= UPF_CONS_FLOW
+ uart_set_cons_flow(U, true)
===== END cons_flow.cocci =====

Changes since v2:

- Deprecate UPF_CONS_FLOW. Provide separate boolean with wrappers as
  alternative.

- Update all UPF_CONS_FLOW users to new cons_flow wrappers.

- Use irqsave variant of spin lock for status update.

- When 8250 console flow control is not specified, clear the policy.

Changes since v1:

- Prepend a patch to perform an extra LSR wait after CTS assertion if
  the initial LSR wait timed out.

- Close a window in serial8250_register_8250_port() where console
  flow control was briefly disabled.

- Add port lock synchronization to the port->status RMW update in
  uart_set_options().

John Ogness

[0] https://lore.kernel.org/lkml/20260410144949.16581-1-john.ogness@linutronix.de

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


base-commit: a1a81aef99e853dec84241d701fbf587d713eb5b
-- 
2.47.3


