Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F737E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaGToDXR4V19BkyZaj/bzbtvRG0ijebygnWTlbtXVvM=; b=EmWGLUIoJ7PIa2o/iBXIurUjHa
	4RsU7PmpxirNrIUFon6SMP/Oyag62hGOeNBqnJqxNOqkndCZzNWXPcBvW81cBEo22VvLVl6lTyp6i
	SRQ5rMU6BDmx8cnc34kIv91Wmx5PR/96LoVgDjlc06Ea0HE9jjFf8aow/ta+DraDTmib/GSbAt5bg
	/PCOoXRxrMyJPU0tS3D8foMuWNTjXQBbqsdgjl3mW61zkfpAxQd6mG7wReWEHyAadfjjlrAT8VDQj
	lxGK6tkC7fGKdO91keGVWZtH+njoueWXmPozdJDx0+bykDnisGiUl2uJaY9lcfqzOkuCzSe24wWbS
	SbGEDfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCza-00000005kmT-3QUW;
	Tue, 07 Jan 2025 17:03:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSv-00000005dmU-3q0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iaGToDXR4V19BkyZaj/bzbtvRG0ijebygnWTlbtXVvM=; b=IFqXqYQ4AA3NJIyUzxEEmKRbHZ
	i7OUfKI12WQCOA6IFaXrTcVdbxnAkomuA7jUfxfkErIJIfZw2rIcSJYQM9WTONRyGulKpjoy1Hw6j
	UUe++bp8YFHOiTeaOql3PqFbssTrZgeD3FeZodzo7ypUiXyhLyUVU/IRSyDUlD7YQAiPRDHuh5tU7
	i1NVZftjkB+ign82rJTYk3e92GPy2yOu0kaciFAVjK15F9EQKzAdy4leeXlx9SosaSTPnPiF9Bphu
	pk5gS62JJnkru3ZxmW8oilvZFn5emoIb1kuoUEFYipSmZWPkrmcHume6zdAXEJDvMaQIvVrYgWxxj
	UZQVT2Ew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSr-0007pN-0Q;
	Tue, 07 Jan 2025 16:29:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSo-007Y4X-2A; Tue, 07 Jan 2025 16:29:54 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 17/18] net: stmmac: split hardware LPI timer
 control
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSo-007Y4X-2A@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_083001_957162_1396E7D9 
X-CRM114-Status: UNSURE (   8.81  )
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

Provide stmmac_disable_hw_lpi_timer() and stmmac_enable_hw_lpi_timer()
to control the hardware transmit LPI timer.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0a1e2587f8c7..5b2ce5305b4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,14 +390,24 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
+static void stmmac_disable_hw_lpi_timer(struct stmmac_priv *priv)
+{
+	stmmac_set_eee_lpi_timer(priv, priv->hw, 0);
+}
+
+static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 {
-	u32 tx_lpi_timer;
+	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
+}
 
+static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
+{
 	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
 	priv->eee_sw_timer_en = en ? 0 : 1;
-	tx_lpi_timer = en ? priv->tx_lpi_timer : 0;
-	stmmac_set_eee_lpi_timer(priv, priv->hw, tx_lpi_timer);
+	if (en)
+		stmmac_enable_hw_lpi_timer(priv);
+	else
+		stmmac_disable_hw_lpi_timer(priv);
 }
 
 /**
-- 
2.30.2


