Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3BE105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1je3WPymH0THXPKtudz8hsGg9eMg3RuF4V2JvpxjpKU=; b=QFKn55TUa15p6dyMMVctei5N/q
	kUde9uWtt7LqHU0ZppFIiVv0JaqAqvyQ4fXjEpFykipAh6JPhA/8idGHD0SvVpg5lxe5+82Ev068w
	EwsVaCGaCycymOOhEAtP+8Ea9PBQDkn9gHtM3vu5nPeoDISF82XHMQnsdzpqE/e5TQUJvnsZWNX9V
	DdiITN/duLQLcRb7xG+o87hSSFJ7lpk4jU+fUqiYeMyFQGa5cOlXgI3p3ETObxeBpIHkrf9e/kbl7
	C6LVr90EQzWlFxNY/zNjfSqJycNLniUOgLbN/IqmikS8xrBHPkQcYZpP1apQ4AxlMhuKSOCmo+Cex
	eG6ZfcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0evR-0000000E0n2-3sqy;
	Thu, 12 Mar 2026 12:14:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0evN-0000000E0lB-36kQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1je3WPymH0THXPKtudz8hsGg9eMg3RuF4V2JvpxjpKU=; b=fD00DkIsZRZnMotPVW6c92fsr8
	qYlqS2A4/6uEUr9kh2vU2a0OzRx6R7jgxPO9aZkhswtaTlpQ1Zndn0QkyOoPjjhPWdop70aQnKyac
	ubClQMMut0InmZP6QVpzhrU0W1d433gI+O2ofGGh4LuVum7W4CBCD8bhgpMhSIrHfk1Rtd5hRbZA4
	8tKakuzAva+ngMLHTHMJ16s5o53Ecvb4CWn0idCnIs2kQNksCraTv5jBDYAnCQdAEQUBmB/iWhu+H
	dif3SQvc27decXL224n42EupBc9dHJv31yY9YL6/Dr4b9wquiJOBNoR1qxzOanlpOx4FrWDGEBKS1
	zw9Wnbpw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53376 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0evJ-000000007kl-0l9a;
	Thu, 12 Mar 2026 12:13:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0evI-0000000CzY7-1fyo;
	Thu, 12 Mar 2026 12:13:52 +0000
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
Subject: [PATCH net-next] net: stmmac: avoid passing pci_dev
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 12:13:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051357_780378_EDFD3A16 
X-CRM114-Status: GOOD (  12.54  )
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

The pci_dev is only used to provide the ethtool bus_info using
pci_name(priv->plat->pdev). This is the same as dev_name(priv->device).
Thus, rather than passing the pci_dev, make use of what we already
have.

To avoid unexpectedly exposing the device name through ethtool where
it wasn't provided before, add a flag priv->plat->provide_bus_info
to enable this, which only dwmac-intel needs to set.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 5 ++---
 include/linux/stmmac.h                               | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 421c6c81ca5e..f621077c30a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -589,7 +589,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	int ret;
 	int i;
 
-	plat->pdev = pdev;
+	plat->provide_bus_info = true;
 	plat->phy_addr = -1;
 	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->core_type = DWMAC_CORE_GMAC4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index c1e26965d9b5..92585d27ab88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -312,10 +312,9 @@ static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 		strscpy(info->driver, MAC100_ETHTOOL_NAME,
 			sizeof(info->driver));
 
-	if (priv->plat->pdev) {
-		strscpy(info->bus_info, pci_name(priv->plat->pdev),
+	if (priv->plat->provide_bus_info)
+		strscpy(info->bus_info, dev_name(priv->device),
 			sizeof(info->bus_info));
-	}
 }
 
 static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 937985276e6b..72febd246bdb 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -348,7 +348,7 @@ struct plat_stmmacenet_data {
 	int rss_en;
 	int mac_port_sel_speed;
 	u8 vlan_fail_q;
-	struct pci_dev *pdev;
+	bool provide_bus_info;
 	int int_snapshot_num;
 	int msi_mac_vec;
 	int msi_wol_vec;
-- 
2.47.3


