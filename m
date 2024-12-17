Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QjMbBnqLU89/PImNcF7KgMNjpyfzwSWuA4nnZnxVqhk=; b=iJGc/Cn422hIQcBxHy522f+cNE
	UKIK8TR2dzscNVBC3fShu8+nxR7JQGDrml2FRvK69qO9EzjkBWms8qlRvzs5L/N/rHfGDKMFQyfky
	SBxWkINtBViG1Zc8WSO97/LCUrds2Cr4PLEWEw85+qxQH2W73TyZA/MYaNnGEev277mXHJEAjP83e
	zw5QdqhNOdK+2NaNqNwIs/sM4PoWbNfnB6buSKd9ci7ZPQhwXLpMzsANUoCf+gC2oNE7HS4XUuEhw
	32HpJttI+EXEWX0tOmFwHeoI9CY5SYOAeHfHEQHdiE1iEhpGJivPMkrn6RI8/3zT3te08PCs+9Haq
	V8qx4ymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTan-0000000CqYm-3NqA;
	Tue, 17 Dec 2024 09:10:13 +0000
Received: from eggs.gnu.org ([2001:470:142:3::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTI7-0000000Cm4y-0xHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:50:56 +0000
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tNTHw-0007Zi-9o; Tue, 17 Dec 2024 03:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=QjMbBnqLU89/PImNcF7KgMNjpyfzwSWuA4nnZnxVqhk=; b=phi9YE3T+V6j9j
	9hQPxaVQMHJKwucDjzYY8Nn21/0XWqarbZLPezkVrTsbOpXejP5eg7JsbBuYC+D8rjYTqVYMqEedM
	7KDX3yuNGltkaA7Zh/zguvFPyQILytIaKQpXNSY23cozFQciYZF8Rh1VOYoos2lDeX7H6pVSHb0+N
	nGhK4DzqrEe+qys2t19dLN7Cb+IDquTF4TcRwy7WUc6X7fdyyuW5hJDjQcZ5hTbkBRbyOlwWHJLvO
	YDIKmlppgPlnulJm5CiSo69JaPdPwLA/2hCsay90Ov+TlZVLoHkjrwSSOku2hkMP9TLVO8sdTz/nf
	7EvzkqY+WtO8LiflvPDQ==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH] net: dwmac-imx: add imx93 clock input support in RMII mode
Date: Tue, 17 Dec 2024 09:49:42 +0100
Message-ID: <20241217084942.4071-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005055_393594_6BF71CBC 
X-CRM114-Status: GOOD (  11.08  )
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

If the rmii_refclk_ext boolean is set, configure the ENET QOS TX_CLK pin
direction to input. Otherwise, it defaults to output.

That mirrors what is already happening for the imx8mp in the
imx8mp_set_intf_mode function.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 43e0fbba4f77b..68b3fbdd46647 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -36,6 +36,8 @@
 #define MX93_GPR_ENET_QOS_INTF_SEL_RMII		(0x4 << 1)
 #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
+#define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
+#define MX93_GPR_CLK_SEL_OFFSET			(4)
 
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
@@ -108,13 +110,22 @@ imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val;
+	int val, ret;
 
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
+		if (dwmac->rmii_refclk_ext) {
+			ret = regmap_update_bits(dwmac->intf_regmap,
+						 dwmac->intf_reg_off +
+						 MX93_GPR_CLK_SEL_OFFSET,
+						 MX93_GPR_ENET_QOS_CLK_SEL_MASK,
+						 0);
+			if (ret)
+				return ret;
+		}
 		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
-- 
2.46.0


