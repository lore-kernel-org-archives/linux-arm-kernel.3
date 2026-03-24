Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE2F54AAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POMVsS5ld9MZxejcVy6TTgyd7cLBF/njXwzWKzP8T9A=; b=2du0QXR/wRsC3w4AcP3GvZ5/Zj
	6cASlNND0ONLM6148wr/0krMU1jTVTzrqF8F44d+O7vKcAurpgsL7xNtGHSfnQtbKRYnNP5PHMwAJ
	U9+O39AAcb/7plae9+vlOkk7P6ZMafne2PPJpVnfb9I7sladSOe4RlkbrSa02bWfNoJBUpI6OkzCU
	uxzPssrwpnLLIdrljNLnWF/So0FKokmxCp4zb+i+S6aLivTR9NvgHcSePS3lx6YzM0scngrqpBhWV
	cumtXvEerfozJB3M+G6rk4zefG80WbazA3eR4lh/N639FHZnkcsq/LMy7wWm9bwODyJoggnyNJ70f
	ms0qHhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Z3-00000001VdF-3Jnf;
	Tue, 24 Mar 2026 13:12:57 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Z0-00000001VZg-49tH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=POMVsS5ld9MZxejcVy6TTgyd7cLBF/njXwzWKzP8T9A=; b=YWncZp5moXCzk3Lhj6fxUpM+BA
	Tea3SQxGrm2yh5++86o9ph0T/OSL830ZeuwaecsCaefQp7uDlHFmuPteshoEahmcssgmWFThLXcb1
	BiE8rydDJu80bdoi8I2Nbc4dsxcwz+NUJS8lAKiwxFHQYT0KRGeXmEhGpbAY0q/6MGbp+DWyxCgCB
	yeR6aAGNsbzrV9wEm21IT52pZLYY8U7ocPjKQuPj1I/pfuMta7LT7Gv/BDAndKRoLlbYYmPYYOTUH
	+oD5zQDPt5ucPSLXdoe/PdKeDFccC0SPMRmQW1jIhzs5y/bGxTAavgnyqL8DlPvXIieU6DokGzM42
	jIF048AA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38274 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51YZ-0000000024p-0v6G;
	Tue, 24 Mar 2026 13:12:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51YS-0000000DwWA-2Ob1;
	Tue, 24 Mar 2026 13:12:20 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
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
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 10/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG2_RX_PROG_SWAP
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51YS-0000000DwWA-2Ob1@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061255_092256_D77138E4 
X-CRM114-Status: UNSURE (   9.58  )
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

Move RGMII_CONFIG2_RX_PROG_SWAP out of the switch. 1G speed always
sets this field. 100M and 10M sets it for has_emac_ge_3 devices,
otherwise it is cleared.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 73f0ebc5eddd..a24f0b24f778 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -437,11 +437,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG2);
 
+	switch (speed) {
+	case SPEED_1000:
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
 		 */
@@ -463,13 +467,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		if (ethqos->has_emac_ge_3)
-			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
@@ -483,12 +480,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		if (ethqos->has_emac_ge_3)
-			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
-		else
-			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-- 
2.47.3


