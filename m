Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D30E69E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLOQaL4VwkGwmmyBjTxl0a8isrwBxSjC7W+8IS5dpbU=; b=lH2QaBbGnZRmgP5caIjbhxSjR4
	gnweB8Ty1X4hXcw5Q+jFJKV+94qzlptzWrebVgsmhcdjCZYtvM4jzVw8Kzc02S0UBEaEozOJ1LS32
	8opnPJsaoys/K0fmUQyhxRFImW3c4kL2cVfRXerOQE/ZfyqUd3prY8AaxulsqEZBcZqrDzhq+7FV0
	NiqgsaBQyYX3LiaKAZOgxazQfkJeWJ0THMZ+4w83ERAOlPu5WTTNQDEjlh26+/7157HnmiC0deQQs
	laQKgk0YHWnWVKAOseHk0fxgjPgwgb2kxst6nO1t7F68ez/Tm2iUDsNngaulF8Ka4c8RvDTM2JRzj
	VBZ34DdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIEij-00000007c7K-1nrb;
	Mon, 02 Dec 2024 22:16:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIEWD-00000007Zed-2lnB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 22:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FE67A4136E;
	Mon,  2 Dec 2024 22:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8534C4AF49;
	Mon,  2 Dec 2024 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733177025;
	bh=F4cbjF/9M6ITcKCkPhkzEDR5HNiIhwkdl+T79A6mE8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dh7iRQsP1aktNPhrpo01hU5yRN1vLgusFkuhdNuBSHoA8rlteqrxBaHPpjow93iJo
	 fQuLACvA769PrPubsDkJ5phrh+FavEljQaO4Isr7WnxjG0xG1ile1Aav7WH4MCzMGN
	 /lK70kgx6IsGLa8bJlZKhNkO7bFil3p2EbIMRXIWW/vAusbJ6cdp56u5REuyOY79Pa
	 8MHEenU3IFX7epAj8gqw7Kn1woxNVP9zcr3wflvX0jTO9qKwON0Dj1wKAWNgWM0d+O
	 7dREoWK8i6eiv2g9hMETySSWCCjDqNuWOj8jwAGP/XCaEahxCrjar3/7xcZ3KehJlG
	 lUGCW2Q+UoQig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BBEE69E99;
	Mon,  2 Dec 2024 22:03:45 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 02 Dec 2024 23:03:51 +0100
Subject: [PATCH net-next v7 12/15] net: dwmac-sti: Use helper rgmii_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-upstream_s32cc_gmac-v7-12-bc3e1f9f656e@oss.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733177022; l=2017;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=E3dKlyRUyP013sEwa3YoW1YOIguttVezMK0ReGNP/J8=;
 b=5EU9Td/kVd7f4K9kEjDJi+349oi1iNwhZveDd+NbdQO1HK6hNFZF1sN6KFKDbDtGKZoUd0cQE
 bWHECNs0viOC6v11NRJYA4/ZXYvX9/tmNblOkNBiTsbNjmEjreDosHe
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_140349_842317_23F5110E 
X-CRM114-Status: GOOD (  13.79  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index a6ff02d905a9..eabc4da9e1a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -21,10 +21,7 @@
 
 #include "stmmac_platform.h"
 
-#define DWMAC_125MHZ	125000000
 #define DWMAC_50MHZ	50000000
-#define DWMAC_25MHZ	25000000
-#define DWMAC_2_5MHZ	2500000
 
 #define IS_PHY_IF_MODE_RGMII(iface)	(iface == PHY_INTERFACE_MODE_RGMII || \
 			iface == PHY_INTERFACE_MODE_RGMII_ID || \
@@ -140,7 +137,7 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
 	u32 reg = dwmac->ctrl_reg;
-	u32 freq = 0;
+	long freq = 0;
 
 	if (dwmac->interface == PHY_INTERFACE_MODE_MII) {
 		src = TX_RETIME_SRC_TXCLK;
@@ -153,19 +150,14 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 		}
 	} else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
 		/* On GiGa clk source can be either ext or from clkgen */
-		if (spd == SPEED_1000) {
-			freq = DWMAC_125MHZ;
-		} else {
+		freq = rgmii_clock(spd);
+
+		if (spd != SPEED_1000 && freq > 0)
 			/* Switch to clkgen for these speeds */
 			src = TX_RETIME_SRC_CLKGEN;
-			if (spd == SPEED_100)
-				freq = DWMAC_25MHZ;
-			else if (spd == SPEED_10)
-				freq = DWMAC_2_5MHZ;
-		}
 	}
 
-	if (src == TX_RETIME_SRC_CLKGEN && freq)
+	if (src == TX_RETIME_SRC_CLKGEN && freq > 0)
 		clk_set_rate(dwmac->clk, freq);
 
 	regmap_update_bits(dwmac->regmap, reg, STIH4XX_RETIME_SRC_MASK,

-- 
2.47.0



