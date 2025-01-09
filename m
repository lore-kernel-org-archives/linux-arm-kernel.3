Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908B6E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l2b27UBxB8RQuYtAsXGC55/jL5+a7N70dvQt2jgn6z4=; b=xCNUQZr5SYxYF+JKZvNeahh9DN
	BVu6cDK+vwpCVcjvPK47VOyx3MQdf4MWKYUMNO5/zUWifbox+97Og+E9u7ng+TIDglfnSnHd9PA3f
	8n5J68rRNJ0otW/FO6DAxeawdkgLp1QFs44WXuPWlbD9AXFMxHB9txB2Sb0iWOIh/XaUNTwyCx7GX
	go8hW1M/08jAoBrVdLZJ/2mhIAraym5Ci2XwkjJayP1tOc13GzkrlpL1tBRToT+Yr3ORZkb/Bmne7
	ohQ5hSyB3mQt4XGoqTt7yAMCdkFMmhZV9WP8oXCDNFlKIIRyJ5i0Bub9ovMOu5Z/4zcpVRcMkrJ1O
	ZsVXnqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxAk-0000000CxkM-1wXX;
	Thu, 09 Jan 2025 18:22:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVx9W-0000000CxX4-1tQs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B09B5C5AB5;
	Thu,  9 Jan 2025 18:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F100C4CED2;
	Thu,  9 Jan 2025 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736446864;
	bh=9xwfGrDRwaeoWzpz2c3lczm4EQbVN++eHX5GPG7HIKs=;
	h=From:To:Cc:Subject:Date:From;
	b=bJOl/HMUb5+w4YS7aU3Le6e2oW7qCBnI1L1Vrb1T5pd6CRVvrpFrWKJqxnatQRAmF
	 NIGiIKqOIV9E0UyqKn20cj4SNJDGkRD5shflAyatw9GbYUk0Mvr+1xlAzvRb3fDb9x
	 rsDB1+tEOiJWCkTph2m5XYaAEvOtwpd35+XtSSq6cfvc9ZUFLn3/WNwH1j2hHYjm0D
	 Mq/hUSY60kuIBdDbu4ZYbRN6q6wlc8hXeb3T24MI2SzvMiqQtwWPf+VuTe6KXKEV6i
	 WaFm0+wmBiT5bJkcBSQQQivtTXnzsXCOsSK5qO8Diqhei6FFod92FEKimnWS/MWNW3
	 jujhwvAL/ve2A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] tty: atmel_serial: Use of_property_present() for non-boolean properties
Date: Thu,  9 Jan 2025 12:20:52 -0600
Message-ID: <20250109182053.3970547-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_102106_530104_CD917847 
X-CRM114-Status: UNSURE (   9.60  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

As of_property_present() returns a boolean, use that directly
and simplify the code a bit while we're here.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/tty/serial/atmel_serial.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 0cf05ac18993..f44f9d20a974 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1727,26 +1727,16 @@ static void atmel_init_property(struct atmel_uart_port *atmel_port,
 
 	/* DMA/PDC usage specification */
 	if (of_property_read_bool(np, "atmel,use-dma-rx")) {
-		if (of_property_read_bool(np, "dmas")) {
-			atmel_port->use_dma_rx  = true;
-			atmel_port->use_pdc_rx  = false;
-		} else {
-			atmel_port->use_dma_rx  = false;
-			atmel_port->use_pdc_rx  = true;
-		}
+		atmel_port->use_dma_rx = of_property_present(np, "dmas");
+		atmel_port->use_pdc_rx = !atmel_port->use_dma_rx;
 	} else {
 		atmel_port->use_dma_rx  = false;
 		atmel_port->use_pdc_rx  = false;
 	}
 
 	if (of_property_read_bool(np, "atmel,use-dma-tx")) {
-		if (of_property_read_bool(np, "dmas")) {
-			atmel_port->use_dma_tx  = true;
-			atmel_port->use_pdc_tx  = false;
-		} else {
-			atmel_port->use_dma_tx  = false;
-			atmel_port->use_pdc_tx  = true;
-		}
+		atmel_port->use_dma_tx = of_property_present(np, "dmas");
+		atmel_port->use_pdc_tx = !atmel_port->use_dma_tx;
 	} else {
 		atmel_port->use_dma_tx  = false;
 		atmel_port->use_pdc_tx  = false;
-- 
2.45.2


