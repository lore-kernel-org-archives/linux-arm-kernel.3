Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA759E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MtoFE7mIggxU2pLuJ181OqtBDlmJXFPdnSDCH11MFk=; b=1nrBVO2YSR31m6HuQNfBnW46qF
	rtl9ibJ9Me7cw44o/RQyYUchxvl8s5cuM7Syhya4IAnHvbEiwrch7Tb3AcXrHj0lev4UK/5n0ac0c
	a5ZKn4cMZpt4evnt9EMMKu/TSl8rTS7aVtV0cCQogZCt8gyYMgAd7tcwEKLOl54TaeJuUZvt6nBn1
	sS0CZCgOA0TJVTmclb9sI1TGnT2O8PRa+JcNWOvu8Qfk0iGIS/FGeW6ac+xjUlhkx6QCmaC+qNxNp
	EWI6WCHoapOybfQqMrqLJ7YxSeIfa+HesdJ/980cp2lE+18cDMb49kMh25RE+qM6MvdvhaOshZHJc
	ZtKN9b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZoE-00000009NOD-4Bl2;
	Wed, 08 Jan 2025 17:25:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZFy-00000009FfI-1yQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+MtoFE7mIggxU2pLuJ181OqtBDlmJXFPdnSDCH11MFk=; b=wBULUhLmCbpzkLBoBjyrrwPz6J
	GO4V71vlYD4TGnMdOAq09hc8WRCnfCJ3cWl75s6EwGxDuWfJUCbfNQE23N/fHiIGsgqUvaerjdmCk
	cYpGHZyQzP/3/D+4RLwzBdgDsys74yq7l3DjG1EzfthMiqDNwZvjlml817NXOOhOsy/MFj7z/qljr
	fywArusI8CpCoJtym4NMgxsDLNbRZW5eppaYpq2xIY6UHI9j2NCRYcVrbV0LFovp/NM3JC7zJq6A2
	E0Y8rOQ2L8RFJaGN9umrJ48Ivfr18ABfeuc8z0AEf2MaArAPg7AH6QtYo1AwqHB9d+C3j34cVOkfB
	I1DlTPnw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47626 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVZDv-0000ur-0T;
	Wed, 08 Jan 2025 16:48:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVZDc-0002Jx-3b; Wed, 08 Jan 2025 16:47:44 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v4 03/18] net: stmmac: use correct type for
 tx_lpi_timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVZDc-0002Jx-3b@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:47:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_085010_501747_15372884 
X-CRM114-Status: GOOD (  13.68  )
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

The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
Use u32 to store this internally within stmmac rather than "int"
which could misinterpret large values.

Correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
rather than int, which is derived from tx_lpi_timer. Even though this
path won't be used with values larger than STMMAC_ET_MAX, this brings
consistency of type usage to the stmmac code for this variable.

We leave eee_timer unchanged for now, with the assumption that values
up to INT_MAX will safely fit in a u32.

Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c36f90a782c5..9ed8620580a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -420,10 +420,10 @@ static void dwmac4_set_eee_pls(struct mac_device_info *hw, int link)
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
-static void dwmac4_set_eee_lpi_entry_timer(struct mac_device_info *hw, int et)
+static void dwmac4_set_eee_lpi_entry_timer(struct mac_device_info *hw, u32 et)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	int value = et & STMMAC_ET_MAX;
+	u32 value = et & STMMAC_ET_MAX;
 	int regval;
 
 	/* Program LPI entry timer value into register */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 2f7295b6c1c5..0f200b72c225 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -363,7 +363,7 @@ struct stmmac_ops {
 	void (*set_eee_mode)(struct mac_device_info *hw,
 			     bool en_tx_lpi_clockgating);
 	void (*reset_eee_mode)(struct mac_device_info *hw);
-	void (*set_eee_lpi_entry_timer)(struct mac_device_info *hw, int et);
+	void (*set_eee_lpi_entry_timer)(struct mac_device_info *hw, u32 et);
 	void (*set_eee_timer)(struct mac_device_info *hw, int ls, int tw);
 	void (*set_eee_pls)(struct mac_device_info *hw, int link);
 	void (*debug)(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index df386fc948ec..984e708d019f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -307,7 +307,7 @@ struct stmmac_priv {
 	int lpi_irq;
 	int eee_enabled;
 	int eee_active;
-	int tx_lpi_timer;
+	u32 tx_lpi_timer;
 	int tx_lpi_enabled;
 	int eee_tw_timer;
 	bool eee_sw_timer_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e80ac74538d2..afdf992cd91a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -394,11 +394,11 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 
 static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
 {
-	int tx_lpi_timer;
+	u32 tx_lpi_timer;
 
 	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
 	priv->eee_sw_timer_en = en ? 0 : 1;
-	tx_lpi_timer  = en ? priv->tx_lpi_timer : 0;
+	tx_lpi_timer = en ? priv->tx_lpi_timer : 0;
 	stmmac_set_eee_lpi_timer(priv, priv->hw, tx_lpi_timer);
 }
 
-- 
2.30.2


