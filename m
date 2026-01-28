Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1138D35693
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WefJzj7rPdEoa3EYJhEBhhBcLW/TXT4G2TpOC+K7+7s=; b=XrWa73b39qY55UC0QCvw7yFF88
	IYLzgp9+eE15/VHmLhPqe6kTF4QB5B/pnkmgCoH3U/5df5hOOCgsCSkGU5qK9fJzgCmF0o6HNNrpt
	jghgPt/y5h7GWPtf98ooXTsL/ETnTc3ViSKKuaOawDLmlLgJ9pqPYO6UPCV4p2zW3I4enU7csenI3
	PDSKqTdpJkgCbuRVL8g3ODFjfERI/hPSTx1li7/f/tBeAZpnC5PtSK798VhAeolTYOF1cQBtX+1RF
	IsMTrwHDj2nG7RszDpDyJUG002QSb1jPtA5I/2hnX1VLtyZcMtbsFJrvXUZ8nHlic0N/PCA3xMevi
	GGdiItEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl35q-0000000Fr1D-36Wx;
	Wed, 28 Jan 2026 10:48:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl35o-0000000FqzP-3lHr;
	Wed, 28 Jan 2026 10:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WefJzj7rPdEoa3EYJhEBhhBcLW/TXT4G2TpOC+K7+7s=; b=SZmBD5e17eMVBo94UovYkYk0UA
	2hy01dibmfmyk7UbyNGIZ6yFgUK8uV0ApQeuKQtSOjk0cGmzNrX1M7HLdhZQxVXsWBmgoC8kZFLzV
	WhyfptICJi8vglSO1pXnNTaT8fUmOK453/IDk1153SZx9UxCARowSsx6rsbJ5EUDPTfBI2Pn5gszk
	LjOSKVe8oW4GjHFgqBUVKnTnVNoReiCD4leSDw+XkQvzlx3s9BSqJ41JWnDNbVuooctUEAFFzLYHp
	cJh5AJCuuJ2Gc2ULJ51E7IjkZkwZkouYUm/pV980+UkRZpXpkcmskoI7U38s2jwn1kKQvH8a1dgf4
	TzqW0RGA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53680 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vl35c-000000007Cl-24lX;
	Wed, 28 Jan 2026 10:48:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vl35b-00000006upH-2zt9;
	Wed, 28 Jan 2026 10:47:59 +0000
In-Reply-To: <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>
References: <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/2] net: stmmac: thead: avoid conflicts with
 PHY_INTF_* definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vl35b-00000006upH-2zt9@rmk-PC.armlinux.org.uk>
Date: Wed, 28 Jan 2026 10:47:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_024812_935167_8EAA2189 
X-CRM114-Status: UNSURE (   9.31  )
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

Avoid conflicts between stmmac PHY_INTF_* and GMAC_INTF_CTRL register
definitions by replacing the PHY_ prefix with GMAC_.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index e291028ba56e..0d46a6c3f077 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -37,9 +37,9 @@
 #define GMAC_GTXCLK_SEL			0x18
 #define  GMAC_GTXCLK_SEL_PLL		BIT(0)
 #define GMAC_INTF_CTRL			0x1c
-#define  PHY_INTF_MASK			BIT(0)
-#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
-#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
+#define  GMAC_INTF_MASK			BIT(0)
+#define  GMAC_INTF_RGMII		FIELD_PREP(GMAC_INTF_MASK, 1)
+#define  GMAC_INTF_MII_GMII		FIELD_PREP(GMAC_INTF_MASK, 0)
 #define GMAC_TXCLK_OEN			0x20
 #define  TXCLK_DIR_MASK			BIT(0)
 #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
@@ -58,13 +58,13 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 
 	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		phyif = PHY_INTF_MII_GMII;
+		phyif = GMAC_INTF_MII_GMII;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		phyif = PHY_INTF_RGMII;
+		phyif = GMAC_INTF_RGMII;
 		break;
 	default:
 		dev_err(dwmac->dev, "unsupported phy interface %s\n",
-- 
2.47.3


