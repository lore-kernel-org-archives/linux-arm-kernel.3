Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28CCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6pOrzXSnREVsUpXI8UJFOiH+uik773tcHNfNYJrtr4=; b=XOxt07vJJFhKw3Qiy/SgKhMim8
	uZe/pJrIl5+L4BzNhH90OzR7ovsH1LRqCs+L682oFfQfpQngyGxYciXkAX9WRxtQIwkrHZ4ZXFd3W
	J7Wd94J+CwZFXZNyC3dbv68EtwyL7Q7ZVhTBSMeMVwgV3JzQCumAo03sJZDf7Cwx+DvbXg3Sf/1TZ
	89Em70yu6PnLhJZTQy6cmr2Wqy6hk2fCdMPh+Pu6LhsLgdztmTZzo9IqxiurQKnu4ZAgFEouN6WnZ
	UwYJH1SOnwvH74pxW66csofA+tIGiHyhfROJqaqfYm+5gF9+Zx7TTz17BBKurRUJrfd32qucXmOJ1
	G0RlT7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCL-00000002ZWz-40W7;
	Thu, 11 Sep 2025 11:10:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCK-00000002ZTC-04rR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P6pOrzXSnREVsUpXI8UJFOiH+uik773tcHNfNYJrtr4=; b=PO4bmsa03IihYSNqN4WAaVRlkW
	IOXv/lMflRTTBRkYB8QVVkRQ1AUqAH8noX2Zj69aTTStxnixmh07lLefzblyPMLUPZIOAYoEFL+Hw
	rkflXoXrTunM/j+mhDx597K/9d9Y2opjWDGJABnKlUCK4vIiMHGhHqylyFVVuO4a3Sz/epRTotGkX
	AWq1khpYleBKFFWljFfWqFAAdIcBiN6hCQ9zge4vpNTQBZIOhlZpD//V0uIu4YsvgQoX7R7zJOwWI
	cJJe2JjEvGUex4aCfO3s25upzJ2jgAUs7SIxHcncrBbB1Xkz4h6tjL0u1Cu+JCIhkKg5dYo20Ypwj
	O8I7lnaA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53522 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfC1-000000002uZ-2Pm5;
	Thu, 11 Sep 2025 12:10:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfBy-00000004j9E-0uDh;
	Thu, 11 Sep 2025 12:10:18 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 09/11] net: stmmac: add stmmac_setup_ptp()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfBy-00000004j9E-0uDh@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:18 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041040_062467_EA26D9A0 
X-CRM114-Status: GOOD (  12.43  )
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

Add a function to setup PTP, which will enable the clock, initialise
the timestamping, and register with the PTP clock subsystem. Call this
when we want to register the PTP clock in stmmac_hw_setup(), otherwise
just call the

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7cbac3ac2a9d..ea2d3e555fe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -820,6 +820,20 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
+static void stmmac_setup_ptp(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+	if (ret < 0)
+		netdev_warn(priv->dev,
+			    "failed to enable PTP reference clock: %pe\n",
+			    ERR_PTR(ret));
+
+	if (stmmac_init_timestamping(priv) == 0)
+		stmmac_ptp_register(priv);
+}
+
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
 	stmmac_ptp_unregister(priv);
@@ -3494,16 +3508,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_mmc_setup(priv);
 
-	if (ptp_register) {
-		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-		if (ret < 0)
-			netdev_warn(priv->dev,
-				    "failed to enable PTP reference clock: %pe\n",
-				    ERR_PTR(ret));
-	}
-
-	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
-		stmmac_ptp_register(priv);
+	if (ptp_register)
+		stmmac_setup_ptp(priv);
+	else
+		stmmac_init_timestamping(priv);
 
 	if (priv->use_riwt) {
 		u32 queue;
-- 
2.47.3


