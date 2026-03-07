Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF582FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=702wOfxhINsK5kpNSdhf3nuVOhqS4fpKbmE3wnxb/5E=; b=NVVfJQ4VsH9R+efAxDlpk4UJEv
	6w/dwRQ4h8lUEErEMIs3OE6d96C0JtOFkYfmAsLFgTnv7KHOfraThutkV7AKMI3aOLYgo4Y+qRMvY
	vtTMICM2Tp5hLC9tmmAUeJgVpvct4uFzl6isNwr0KFx03qfsSIn/JZWrMQV5eQIElyyaIix0K1qgd
	vIjV9CLQM7+G2nUZBvVfN1czO2+yImL2iHzhOdd+QHwOXwtef8Fizai8hy2Z0af89d/t4jPYNpgxH
	1TowsnCZNhmy1ih6V0g/YqABvKN31tBrGe+l/RV3cudVgI3IQrVi6mjK0StUl1RlfC0X8yXsxfFqt
	uhBa2IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypHh-000000057Fz-03CW;
	Sat, 07 Mar 2026 10:53:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypHf-000000057FM-2beI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=702wOfxhINsK5kpNSdhf3nuVOhqS4fpKbmE3wnxb/5E=; b=zp8DijVfcZtlxs1VZOj203boBT
	EwdhwEwD2iFXynI2iHVd8aFWjUBuyL5wg7XqUmXymxPsBLEoB4Bvror9Z7GQSTKpIwk93qeSLZoVX
	6CflVvA8vqFg5eMu76YzFXevfVnYRjBIDVAYHtPo6VDF99f3SQHtvphp4F7VbefZD6CZThx6uDe1t
	OFFv7ehbJ5oVkmbJiQysJMIqXR5rbHcHYXWdW0g56PcYj8MbApxy4haBIL3YOM1oO1LTehmyy7x3i
	S6WY2zBI1EwQvDtbOZNSSdp1bLHeRRVVlnSNTMtLX1QEl6JpJPvww3pWqWoPdLcckYv2jeJbZDvPi
	YGcLDkEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43718 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypHY-0000000024v-01SQ;
	Sat, 07 Mar 2026 10:53:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypHX-0000000CSbc-123K;
	Sat, 07 Mar 2026 10:53:15 +0000
In-Reply-To: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
References: <aawDiK7DjcSXSs1X@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/2] net: stmmac: ptp: rearrange n_ext_ts
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypHX-0000000CSbc-123K@rmk-PC.armlinux.org.uk>
Date: Sat, 07 Mar 2026 10:53:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025323_663687_1938977E 
X-CRM114-Status: UNSURE (   9.87  )
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

Use local variables for n_ext_ts rather than referencing the DMA
capability several times.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 98da499ba3b1..654d04f8c373 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -335,6 +335,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 void stmmac_ptp_register(struct stmmac_priv *priv)
 {
 	unsigned int pps_out_num = priv->dma_cap.pps_out_num;
+	unsigned int n_ext_ts;
 	int i;
 
 	if (pps_out_num > STMMAC_PPS_MAX) {
@@ -358,8 +359,9 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (pps_out_num)
 		priv->ptp_clock_ops.n_per_out = pps_out_num;
 
-	if (priv->dma_cap.aux_snapshot_n)
-		priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
+	n_ext_ts = priv->dma_cap.aux_snapshot_n;
+	if (n_ext_ts)
+		priv->ptp_clock_ops.n_ext_ts = n_ext_ts;
 
 	if (priv->plat->ptp_max_adj)
 		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
-- 
2.47.3


