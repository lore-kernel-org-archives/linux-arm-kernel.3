Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA8CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Dqc1o+TXCFPHgAJeb3WkN4OQLaaOvn2AuUElfR+DHY=; b=ReXMs1+8eKNtusj7sYU8KP0pJc
	5Xz7z5fuz5ScY/h52I+9TPOALaM50LdWmkiJQU/X7YdD2d8SlxXMTcPSdGpRrwGc3pPeTgHxwpb2t
	LBC5XmYC072oeP6Fdst0rwtctcE/nsYK8URQZwd2Z9zsIvp/CcfyFCPWWmz6d9p7tb+eYBanWR7n4
	0CGbiPTQKboqZC8V3mVK3v6jiPHDNSs1dkC/dZNDellux7+VwNrqS8Kk/RzPjNHSvk8T6IqG6xkIG
	mj5vMFIw5ehUJAZWEz4riehDPTf+0KqVLN990dgG90J/Bd2MSGTqDcOYAIofT5gcf1RODgYVcotvn
	s3sVIdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt56-00000009mEw-1B9T;
	Mon, 03 Nov 2025 11:50:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt54-00000009mCI-1Wim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Dqc1o+TXCFPHgAJeb3WkN4OQLaaOvn2AuUElfR+DHY=; b=GcRQzZj5+EHYWRD6Hu1HFfSpFG
	XbWk655wAKMtM0hondOWIxRoPt6FpX0MnCMRtUO3zC/RIeoM80byWGbGsiCT998S2wIeF8NMSQdTv
	Lj+/uQFvfu2dCyinNiEfG4MJ/Op9HJzpLvA48/3g4ciqoKmAyvBuonI9lniSrIw4rgyr2NC+yNiu5
	Upv4tFKczAYUD8tC7yhyqZlBKuy3aGYebeeBg3D1+qvteBUvzASlviBrt/RUPorxU+GL5U/pXdCXD
	qc9dG8nkk7NzDuFkgAu71u0HfOmTmpPi2Hj4m6ar4eZdDHtB7EjInhfW7gTbOnUe9x+pNNI8y6h4F
	zsP2JVMQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41444 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt4o-000000000gn-2KqT;
	Mon, 03 Nov 2025 11:50:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4n-0000000Choy-0IeG;
	Mon, 03 Nov 2025 11:50:21 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 06/11] net: stmmac: imx: convert to PHY_INTF_SEL_xxx
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4n-0000000Choy-0IeG@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035038_408851_28E17B6F 
X-CRM114-Status: UNSURE (   9.91  )
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

Convert dwmac-imx to use the PHY_INTF_SEL_xxx definitions rather than
constants via:
- ensuring that the prefix for the MASK and value definitions is the
  same.
- using FIELD_PREP() to shift the PHY_INTF_SEL_xxx definition to the
  appropriate bitfield.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 147fa08d5b6e..4fbee59e7337 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -23,18 +23,25 @@
 #include "stmmac_platform.h"
 
 #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
-#define GPR_ENET_QOS_INTF_SEL_MII	(0x0 << 16)
-#define GPR_ENET_QOS_INTF_SEL_RMII	(0x4 << 16)
-#define GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 16)
+#define GPR_ENET_QOS_INTF_SEL_MASK	GENMASK(20, 16)
+#define GPR_ENET_QOS_INTF_SEL_MII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_GMII_MII)
+#define GPR_ENET_QOS_INTF_SEL_RMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_RMII)
+#define GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_RGMII)
 #define GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 19)
 #define GPR_ENET_QOS_CLK_TX_CLK_SEL	(0x1 << 20)
 #define GPR_ENET_QOS_RGMII_EN		(0x1 << 21)
 
 #define MX93_GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(3, 0)
-#define MX93_GPR_ENET_QOS_INTF_MASK		GENMASK(3, 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_MII		(0x0 << 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RMII		(0x4 << 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
+#define MX93_GPR_ENET_QOS_INTF_SEL_MASK		GENMASK(3, 1)
+#define MX93_GPR_ENET_QOS_INTF_SEL_MII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_GMII_MII)
+#define MX93_GPR_ENET_QOS_INTF_SEL_RMII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_RMII)
+#define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_RGMII)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
 #define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
 #define MX93_GPR_CLK_SEL_OFFSET			(4)
@@ -241,7 +248,7 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	if (regmap_read(dwmac->intf_regmap, dwmac->intf_reg_off, &iface))
 		return;
 
-	iface &= MX93_GPR_ENET_QOS_INTF_MASK;
+	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
 	if (iface != MX93_GPR_ENET_QOS_INTF_SEL_RGMII)
 		return;
 
-- 
2.47.3


