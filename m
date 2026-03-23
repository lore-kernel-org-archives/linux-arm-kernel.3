Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E652EC01B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/roKFS7AAKeMzKEWapVK/yb4xwmzuNjzD7UY063VpFs=; b=eA9Uw1TNu2uL2PaHUNH6Dl/iZe
	6sR/dDaCNiwtV5ryouD0sZVYClWLaeNNPuHY7YifA0O7Wg9XZD9NVR4swmmkNknFWwkjmXB6GF+cZ
	R1KRPqd9CNb6LDjc0yrZVYNX4g0Znx2vVdF+DNf3jwrZVWvxdUN8FWqd5m7E9N4DFvottgn4sUv+I
	90ZT7hzbKEdZ/iZxdD2hS4lzz7F7OsKCANbzQt0KbJ6a2md/koGI1rzbx39tkN4bQ6F+y4oc+A71l
	IB0fSwRWHuBx+de3MjQYaBRgtgZHzQH28dtqP44Zh6b9qfaGLVaYDGypPVp0CTkL2zDjHFZtc/JTM
	463yN7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4blJ-0000000GORg-3ZUv;
	Mon, 23 Mar 2026 09:39:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bl7-0000000GOO0-3ZTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:39:44 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4390119C0;
	Mon, 23 Mar 2026 10:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774258702;
	bh=RNR1EUTKKAcgh1q7y4WEUB3H7fiwM2yffGl/eVpVGFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jz597tg+/+oDtwoeNTVEJxDpoCB2j/j8tMfYwO/579aOfKZ6UzeMHA/YFWmKTSbkL
	 3N+p5K+tF1QF1bVZUi5KL2WLWcbHar2bIE/3iHbaN2c76PIsRtVFVMfeHBUsK4wfcr
	 64cbtV6qKxgByjKhtX24wJ2MPOtsAX9hJapGO57k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: netdev@vger.kernel.org,
	imx@lists.linux.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] net: stmmac: imx: Disable EEE
Date: Mon, 23 Mar 2026 11:39:33 +0200
Message-ID: <20260323093933.1785583-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
References: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_023942_033215_A2C7E0BD 
X-CRM114-Status: GOOD (  15.47  )
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

The i.MX8MP suffers from an interrupt storm related to the stmmac and
EEE. A long and tedious analysis ([1]) concluded that the SoC wires the
stmmac lpi_intr_o signal to an OR gate along with the main dwmac
interrupts, which causes an interrupt storm for two reasons.

First, there's a race condition due to the interrupt deassertion being
synchronous to the RX clock domain:

- When the PHY exits LPI mode, it restarts generating the RX clock
  (clk_rx_i input signal to the GMAC).
- The MAC detects exit from LPI, and asserts lpi_intr_o. This triggers
  the ENET_EQOS interrupt.
- Before the CPU has time to process the interrupt, the PHY enters LPI
  mode again, and stops generating the RX clock.
- The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
  registers. This does not clear lpi_intr_o as there's no clk_rx_i.

An attempt was made to fixing the issue by not stopping RX_CLK in Rx LPI
state ([2]). This alleviates the symptoms but doesn't fix the issue.
Since lpi_intr_o takes four RX_CLK cycles to clear, an interrupt storm
can still occur during that window. In 1000T mode this is harder to
notice, but slower receive clocks cause hundreds to thousands of
spurious interrupts.

Fix the issue by disabling EEE completely on i.MX8MP.

[1] https://lore.kernel.org/all/20251026122905.29028-1-laurent.pinchart@ideasonboard.com/
[2] https://lore.kernel.org/all/20251123053518.8478-1-laurent.pinchart@ideasonboard.com/

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix | operator placement
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 9d1bd72ffb73..01260dbbb698 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -325,11 +325,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
-		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
-
-	if (data->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
-		plat_dat->flags |= STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD;
+	plat_dat->flags |= data->flags;
 
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
@@ -366,7 +362,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
 	.addr_width = 34,
 	.mac_rgmii_txclk_auto_adj = false,
 	.set_intf_mode = imx8mp_set_intf_mode,
-	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+	.flags = STMMAC_FLAG_EEE_DISABLE |
+		 STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
 		 STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD,
 };
 
-- 
Regards,

Laurent Pinchart


