Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C569FD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/bQ/rnZccmE+rKEzBQi9hVeRpGw3fDnoAfQlnEj840=; b=son9MxezdDgyZ8kRehKXqUWe7d
	6u+gaXJdzK0dMns8eb8ZDTg9xHmL1tVElTeVHspaVkXLjcnfUklIXadD9UklalHjnMmBKLstC7GYE
	hWgDsaNZjCt1IoKzIbiHkZ9jWsRl5SjE1Ys1DTa8IXTJcP6YQWP7LK8dpqzL6dVk//qR1Hf5PymER
	JlXJngRwE9NmSvJ1UJsGNi4ON3i9mLiy6Ybcbd1DHE35dln8vLf4ZoV7YP2kvFscUgPdl3vVNreFm
	rRlDX+fiW730UaPq5sh0kEqcX/XhmofNRXDUr0z3yI0E9MbHwje3IWhDmvv5JWZCaFFCiXupV4JCO
	Zt5r/Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXz-00000008BZp-0UfI;
	Fri, 27 Feb 2026 09:54:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXx-00000008BVX-1nWS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F/bQ/rnZccmE+rKEzBQi9hVeRpGw3fDnoAfQlnEj840=; b=LlANKypZGhCuf/3rBmJkaWbYwO
	hjAwDH6LEMXPfmVCjXNsVBgYTpEbhun7bKTNbpbY9MusACHZao6vkc2PQCsWg6T9fF3mNf6VWepCt
	Hpz7svS31tOW+iDZiCCn7yOrH06pl48RD6loS5K9npUyxISLEB0TD6Z1xwlnUzNYmEm3CyhhGSj0F
	bVJQwIRQRiWdLVP7nXX0vjcfLq0YPYZbn97qjPivg+M9/UoEMf6wKUe7Q0iAuBCtu0H7veNioK2i8
	TQD3nTuYoO26urWnYGi9mnHcDWQGUFl0y5+tD2ly/v/MX/sCFDGAxC8Di4+Kl7K7EdpNvjaHfPPLs
	5TE32ArA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39328 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXh-000000000e2-0PzH;
	Fri, 27 Feb 2026 09:53:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXd-0000000AvnL-36K3;
	Fri, 27 Feb 2026 09:53:49 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 09/14] net: stmmac: make extend_desc boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXd-0000000AvnL-36K3@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015409_477429_5ACD2620 
X-CRM114-Status: GOOD (  11.96  )
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

extend_desc is a boolean, so make it so, and use "true" to assign it.
Add a comment to describe what this member does.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 1fcc91be7589..71dac8c1a3ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -76,7 +76,7 @@ static int stmmac_dwmac1_quirks(struct stmmac_priv *priv)
 		/* GMAC older than 3.50 has no extended descriptors */
 		if (priv->synopsys_id >= DWMAC_CORE_3_50) {
 			dev_info(priv->device, "Enabled extended descriptors\n");
-			priv->extend_desc = 1;
+			priv->extend_desc = true;
 		} else {
 			dev_warn(priv->device, "Extended descriptors not supported\n");
 		}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 51c96a738151..57ded8e5177f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -302,9 +302,13 @@ struct stmmac_priv {
 	bool eee_active;
 	bool eee_sw_timer_en;
 	bool legacy_serdes_is_powered;
+	/* descriptor format:
+	 *  when clear: struct dma_desc or for tx TBS struct dma_edesc
+	 *  when set, struct dma_extended_desc
+	 */
+	bool extend_desc;
 	unsigned int mode;
 	unsigned int chain_mode;
-	int extend_desc;
 	struct kernel_hwtstamp_config tstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_ops;
-- 
2.47.3


