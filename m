Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B17AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZcvQXRgGTFglMN1Eb+bWjhXlMJHCVFgCTjX9HZlDeY=; b=siJR+cwM92haEpGb9bL/CnGUYh
	kUezHFDWF8RNGzTgyTdXOoVK1dPOeeau/lfkumq0jak60zAI2v+Z8zf1CDo/c7cQpVXfIk8oGCuZv
	i3hmrVH6uf9gN3RE7N7RlSDmJzBAhYi580DQ89a8jINdm/G/pjePhENxmG9xMf5IcKRCsPxi2kRfA
	pYMzpOZ0rUd940zCVA3A4vKH5sfYk7+V97xh7Kz4NpTeTa6Ot10Tq+j+bSQAoQUzRG2MI0aojJ7HZ
	B4Qo+CKZJoe38kcxTBxF6Nf3gIK3dYlvnIAEsITTIckj8NFk6eat1YnoHrKY/F29+/TutcbV9X0xg
	pGwUiw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmX2-00000001HWO-3xHu;
	Mon, 06 Jan 2025 12:48:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmBQ-00000001DNy-31gC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nZcvQXRgGTFglMN1Eb+bWjhXlMJHCVFgCTjX9HZlDeY=; b=G2hs9YwcjlbdIdY0N0LLQQ8PEG
	o6u54wS+qOQRANf3bh3vPaXmHm6r71TlgbQgZ4Uot8Q/34LWGkqmd7aqvy8xLzfpcht6EadoLtRv5
	j8+i00/Yzv7vwd41hQCMYiHLVbud+2xGMyApaiEOC5Vmx2lvRzctUteBC5bjpHkBiNtKTLFNH5D7Q
	TRSlwUG30QxRP5iOdmTe0tKtcdYrQDwUALPutggLNRqM6YC4Fv4qv/Wce+a0dDD5O3TMdFMnwIWbm
	evG0um7JV0GnNJYcgyf+P/lHM4tg9mcON1v/PvHvcK/9H82UoOHycK4qlLPLQcW4ZC9+fIv+fe0FU
	dT317XfQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36930 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmBM-0005uT-1X;
	Mon, 06 Jan 2025 12:26:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmBJ-007VYB-H2; Mon, 06 Jan 2025 12:26:05 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 16/17] net: stmmac: split hardware LPI timer
 control
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmBJ-007VYB-H2@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:26:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042612_756629_689824D1 
X-CRM114-Status: UNSURE (   9.10  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ba3c7a8f535..8d4b9c42aac0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -392,14 +392,24 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
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


