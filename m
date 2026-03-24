Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683C8E9A745
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fR9TaU7lvH4uvfrULIcHLIjIm0TTYsxcGUZBDQbW9Y=; b=fbMWGKSgW2+W3BDmjEIrWzylRp
	WLE9c2vY93WD+KREtXwne/kSqaRPqxzB/A/f7aMXKMNrMyIBZ4y9a4q4HTVn68piYNfLzQyaHgF4B
	i2Ko7S0IAetY3QcyxrW9K2xqatF8xzYcXlBHoVtkEUNiJbuIdUY2NZb3wPBL/Y15csPRl+HTL0M9O
	9sYc0Bmc0Fe2nruCO7bxvsCgPxNmxy9VLLK70HiyZvt+K6Zbja9akczFlk91TS4LJ1hUfoHYK/P8S
	yVRN1RRAXt8rZ7C1KCVboL2ryrCBaXJKJTbqxoIQ+Ldl3DCRUwwCXNppIrc9cKDACDzVp0xkbAzIa
	2uM8xgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx6-00000001546-1Sld;
	Tue, 24 Mar 2026 09:21:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx2-0000000152Y-2Vtc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:21:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7BAF9C58097;
	Tue, 24 Mar 2026 09:21:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4994F6011D;
	Tue, 24 Mar 2026 09:21:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B977C10451116;
	Tue, 24 Mar 2026 10:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344082; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3fR9TaU7lvH4uvfrULIcHLIjIm0TTYsxcGUZBDQbW9Y=;
	b=0AM3DAUNovS0AoQN8tCoBO5bOV8LDo/FacTUkB56iZvdrUuaPxoPy1Ah89OVi/XSdaT8nb
	FZXbYFiRaV7psWBEFgSjkAutu0QUrRzn6/TcgCvP9W7fmYg526DZobGsn0vrH4MV9+3xS+
	W6+eiefzcn2wPpOOqrvkwBvt0V+eI8MFiYJjgFTpUpF7b7mq6lU4PeBQZAZQdv2yhlL5VW
	ItTEI9zQDsiIZQtLhKDh59bS/Hhvb5vGeFS86ryS6btXPBwvteGyq0NsbZTF+0kf0m9oBM
	YH8Deb/SR9xveifB+KNPKR/JZnRbHovueLqh0Hxm/iyoWvj1EqksvaWP78Ie2Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 1/5] net: stmmac: dwmac-socfpga: Move internal helpers
Date: Tue, 24 Mar 2026 10:20:56 +0100
Message-ID: <20260324092102.687082-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022128_784210_6B73697A 
X-CRM114-Status: GOOD (  10.77  )
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

This is preparatory work to allow reusing the SGMII configuration helper
and the wrapper to get the interface in the fix_mac_speed() callback.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 5f89fd968ae9..42da73b92ceb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -72,6 +72,18 @@ struct socfpga_dwmac {
 	const struct socfpga_dwmac_ops *ops;
 };
 
+static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
+{
+	return dwmac->plat_dat->phy_interface;
+}
+
+static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
+{
+	u16 val = enable ? SGMII_ADAPTER_ENABLE : SGMII_ADAPTER_DISABLE;
+
+	writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
+}
+
 static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
 					phy_interface_t interface, int speed,
 					unsigned int mode)
@@ -244,18 +256,6 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
 	return ret;
 }
 
-static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
-{
-	return dwmac->plat_dat->phy_interface;
-}
-
-static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
-{
-	u16 val = enable ? SGMII_ADAPTER_ENABLE : SGMII_ADAPTER_DISABLE;
-
-	writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
-}
-
 static int socfpga_set_phy_mode_common(int phymode, u32 *val)
 {
 	switch (phymode) {
-- 
2.49.0


