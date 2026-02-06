Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8876BEE6B58
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dWmLCHSX/zl5TXT9/CAx8lBKbFhSqb8YTbzRq8kmEq0=; b=ykCGU5ZaPMj3Oew1I7ES1oYbkg
	xYcJh7dJBQAUGmxU2aKSOAd+H+4KNIGoQ3Vqx7a+gJSDKgWG5+5M0AoTQlhh2E8X1xmxtiT0JCilH
	hQuSf3SpVhcnH4PAY/eF/SgOcGoAWgN2rEUP+SL6V4FN/KIxQeH11VFcT1ofBGZtM0L7z+CltzXsK
	CeAdQ6qvp4m4fQeDvaAxyLZgmu0a988uebmrKU+zrl0aJ18at2K1BNwnrinUb/938cBXwhHidzokr
	TpopOXmoMIrsCD54ZZHjqycOXrb5cA2hrveIVEVSQgIvzMUu6fhfivqVoPxt3AhNJibb1nj75sGY0
	z22/oalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSTv-0000000BoCV-0ZQz;
	Fri, 06 Feb 2026 20:31:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSTs-0000000BoBs-0KgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dWmLCHSX/zl5TXT9/CAx8lBKbFhSqb8YTbzRq8kmEq0=; b=ueVs8yE3A44c9vupcFdGhLYxOh
	ROPCEf6Z4FYw076aNt16760QLDmoc/fa/pSwLM8l7pOXvQfsNMX4DiVon41rGE4ZHpLGt31e7fwNm
	v3uqcrTSEJm9ycSNe5rrecAB3jO4/xgnVgT0QFQ9MQ+KFL6GsDhzY0NF36mAyEMpBRb98eRBLgAdh
	Tpz0pD7lzWi6bUEg3RBPbSZT7DVUtj/TATmLvfOG3N7tW1ecFuSkDHUOaJsNJ5LBbFgMUmDHWyVEs
	NMhX/3fwnQr+ZUAYLbrAVmtGOdHnF1vWGmuyP0L+QBrjqfnFDeuGlNi4B6Zotw0b6pv6rmWSYA8Ov
	1CQdvJrA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44050 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1voSTm-000000008P8-3Fkf;
	Fri, 06 Feb 2026 20:31:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1voSTm-000000087qO-04ua;
	Fri, 06 Feb 2026 20:31:02 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next] net: stmmac: qcom-ethqos: convert register field
 updates
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1voSTm-000000087qO-04ua@rmk-PC.armlinux.org.uk>
Date: Fri, 06 Feb 2026 20:31:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_123109_127442_A5F56880 
X-CRM114-Status: GOOD (  11.51  )
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

Convert the register field update values to something more recognisable
to a human.

For example, using (BIT(29) | BIT(27)) to update a register field that
consists of bits 29:27 is just a way of obfuscating the constant so
the bare constant doesn't attract review comments.

Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
decimal value 19 for the bitfield 16:8.

Fix these, and a few others by using FIELD_PREP(). Yes, it means we
have bare numeric constants, but that's way more preferable than
having them obfuscated away.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188..5ee2a6ee5840 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -361,10 +361,12 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 			      SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
-			      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
+			      FIELD_PREP(SDCC_DLL_CONFIG2_MCLK_FREQ_CALC, 26),
+			      SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
-			      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
+			      FIELD_PREP(SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
+					 1), SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
 			      SDCC_HC_REG_DLL_CONFIG2);
@@ -425,11 +427,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      115, SDCC_HC_REG_DDR_CONFIG);
+				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+						 115), SDCC_HC_REG_DDR_CONFIG);
 		} else {
 			/* 1.8 ns */
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      57, SDCC_HC_REG_DDR_CONFIG);
+				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+						 57), SDCC_HC_REG_DDR_CONFIG);
 		}
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
@@ -451,7 +455,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
-			      BIT(6), RGMII_IO_MACRO_CONFIG);
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
+			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -464,7 +469,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
@@ -487,7 +493,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
-			      BIT(12) | GENMASK(9, 8),
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -499,7 +505,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 				      RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-- 
2.47.3


