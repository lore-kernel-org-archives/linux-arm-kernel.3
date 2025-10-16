Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95973CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CFRIIs060aUTE/XtgbE3U9aNP00cbQnhfyqtNtGSsHY=; b=PcCp8d8gwWsSzNPEvvDfhEoFXb
	aQTAt8g1wcPQfQFwVGRLVYJdpComSx3baaMG3IYkTeZg/zh0rcgfEa2yNZfdRmTGFQKQGsVlLL06r
	Fbz53c5Jr5nvWOXRHITvIrCSVX6ttQEEQ84NOUcIfjEZB3evCH7wbqWkKEgD9yZizo8kQtHcCWw1S
	huhdQONRwxemH/bBJODwWbIRodl9i01oVdbphnI0EohOAWjnriwi1KJ6VPca3QuItb9ht7CNGFngQ
	K1EG5pbbQceo6a9fQy/UGE0BNLyW72Y5GdPWWImu4RAxHFWiBkop7Edl6bMmupGhNK/7O7AS+/ivf
	kInfl3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MJL-00000004bhJ-29iV;
	Thu, 16 Oct 2025 11:38:23 +0000
Received: from mx-relay28-hz2.antispameurope.com ([94.100.136.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MJG-00000004bfu-1iEo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 11:38:22 +0000
ARC-Authentication-Results: i=1; mx-gate28-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=CFRIIs060aUTE/XtgbE3U9aNP00cbQnhfyqtNtGSsHY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760614684;
 b=Z5j9tQgqrXt5W8OXBplUyADYEvo3M4efUZTfezrm1bLQwWrtMtK0tIx9tApDxJPDgIk+vMMv
 PqOVxVOO/pDH1kLzBSQURw5gZKFMBldbAsD4tIyUV+vBH9JTq+5a5/j796g1zM0PPkqM9QdV2xR
 OkGeKB7QQ2yEMDp3F41XaHHoYFH99FH9SYvHWb4cgLaNq4YNG6sIMneXGsw7pineh1i77MPuSi6
 yM7bM/r253n3D/msuU2Cx5+wGtYga0kTrwWNeJz7XSpI6AALlZCnZBWg3Od9PN6jgxyVAJK+eGk
 J6MNmt9WIQMZqVEnMrv0j/g28odg9wThpnZYH4DNk8jyw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760614684;
 b=C/zeiBFStckVJuMTjZqKT+HwiPRsRUBK3k4fs7svu7ZI0fY3yhMP3wpM8yhntGbdTXBKx4e7
 +YVWyKrm0CkHlA5o+1CsjmKZD9wJuhVRE9/R16gBuIVyvJ9dLTt7+lgaTWP1PFMP2OSfN5axCDV
 ujy9LtPPkqDrmYUvoWC9d5Sl0nDgLexAWi/qUiggFIxZN551beM5tGPxEyDAcHHaYndCN/plmeJ
 9aijWj6dD6nl2T7sWkLXkT1ae5/r7SiWQ2yABj97+6E/5VBQxGMSsKGa03MVevIasMLaSXclOHx
 4hhU9TpeRhe9IARoBSN2tVKGl8edQXFVkUl7h76gBODUg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay28-hz2.antispameurope.com;
 Thu, 16 Oct 2025 13:38:03 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3F3EC220BA0;
	Thu, 16 Oct 2025 13:37:50 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Date: Thu, 16 Oct 2025 13:37:30 +0200
Message-ID: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay28-hz2.antispameurope.com with 4cnQtQ6zX8z1QNSK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a7531a3aefe8095ad0ffc3e1e5a543aa
X-cloud-security: scantime:2.247
DKIM-Signature: a=rsa-sha256;
 bh=CFRIIs060aUTE/XtgbE3U9aNP00cbQnhfyqtNtGSsHY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760614683; v=1;
 b=kRM+aR663C5Osf8RwLaQYs8fEAZyOO8b7FeUWstSubDy1f4vkKscBZh5+yKBCMeIGeevkipM
 0sIkktM7tdjkBd5Gpa72ygy0A1evSCGqfY3+kBHNcx7bWbiaOx/4DBaJLk2lZ4gqiywTpTLLSBo
 jUfReg+wp5fhBZ8xRbUBoh3jge5QFGw3Qu8yi50TT6mpRDGz4k7XI15bgbYxJOX+5zO6ilSctGy
 aEtoM2JLUYdT8U/51nw2sOh5h2YG18aD9I/QNT91Lxnf1zu+egP3KFyIwkThBExft+mK4Gu53uv
 5h276h65uyC2QipDVTfCkdaTJjMoWX+LGfT1BYtc4FnJA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_043819_046506_A01C205E 
X-CRM114-Status: GOOD (  17.62  )
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

The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabled;
it should be possible to enable the flag when only GPIO and no hardware-
controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this case,
so the hardware CTS is ignored.

Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios with the mctrl_gpio helper")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/tty/serial/imx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 500dfc009d03e..4a54a689a0603 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 			ucr2 |= UCR2_CTS;
 			/*
 			 * UCR2_IRTS is unset if and only if the port is
-			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
-			 * to get the state to restore to.
+			 * configured for hardware-controlled CRTSCTS, so we use
+			 * inverted UCR2_IRTS to get the state to restore to.
 			 */
 			if (!(ucr2 & UCR2_IRTS))
 				ucr2 |= UCR2_CTSC;
@@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
 	if ((termios->c_cflag & CSIZE) == CS8)
 		ucr2 |= UCR2_WS;
 
-	if (!sport->have_rtscts)
+	if (!sport->have_rtscts && !sport->have_rtsgpio)
 		termios->c_cflag &= ~CRTSCTS;
 
 	if (port->rs485.flags & SER_RS485_ENABLED) {
@@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
 		else
 			imx_uart_rts_inactive(sport, &ucr2);
 
-	} else if (termios->c_cflag & CRTSCTS) {
+	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
 		/*
 		 * Only let receiver control RTS output if we were not requested
 		 * to have RTS inactive (which then should take precedence).
@@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
 			ucr2 |= UCR2_CTSC;
 	}
 
-	if (termios->c_cflag & CRTSCTS)
+	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
 		ucr2 &= ~UCR2_IRTS;
 	if (termios->c_cflag & CSTOPB)
 		ucr2 |= UCR2_STPB;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


