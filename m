Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E01AF54AAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MM4CKfvekRnbdssLA4JA4ZjAWHpP2xfu6E+VZAwiwI=; b=gTQzgUpoXGfExmI2gtfypUGORm
	1aQGGtBA8P8gnspXoIpVQikeGN7s97+UxFj6ZWuNUjE2GPyUvPlE9voT2uqIQxfbl31Qq4+s7goHl
	Wi+9MGOeqasRgr6WYEb4GkHuLHDsJI/g88UerLX12yIPQtDh/DyOsYX7dzeCUB7ASCYcFy7bu1POu
	g0w0BCxX6mXxM4wNGDB2I1xFnMC4T8dJfcXenw3H+fKcUs5Nuwayp7IuTfGM+w6xlTxL646XjFLpV
	MQDKsVGUwuv7u5Umx0vslcDsuk+CT/r8okLbF0CxjYqMzBWnpajud0rgqSoYq3U3I4HIfLuvfapdK
	2qhdQZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Yx-00000001VYo-1SI1;
	Tue, 24 Mar 2026 13:12:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Yv-00000001VXg-2mW7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 13:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=4MM4CKfvekRnbdssLA4JA4ZjAWHpP2xfu6E+VZAwiwI=; b=dUnMlvFstrxy1wumD5I1PnZpzg
	fbv0TLuqSvtNGMmD5d621mf7BM/zhxvXsCUgoODNthm9cYSJuTCIwUviFkI84qV1LrG0uMZwjCMdn
	Y7uvz9LvncNQLohApGNv+MWNUUfUGepizyeg5Rjxl/xOqdLZJI02/TgIPyvKQiEmzzBh8n0UqcEDs
	mcOl/k4j+AiADjD+JWz1fdiBnMlKws8QF9pquT+WrovcsFpYVdfixGjcces/+Svw1XG2lat06imdz
	lJ6fuCQFOS41KdBGeBVvxaAS1wJiEAJYKjjFVLVE69nicBpapsq+DleqjqNEVzZewS4OVc6q7+w6B
	jH5XTAUg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Ys-000000048GK-1Aar
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4MM4CKfvekRnbdssLA4JA4ZjAWHpP2xfu6E+VZAwiwI=; b=DXaVnAXDmhSIWdF3BwOpPIL5CG
	7XYxgwSyHSm0EnImq3Zv23V7qEDpPNvY19/er27XT20Ng/H0TNfthqJTRAtNp7Vy2PGOlxPIpHsnI
	OCJAjuW25jdwMO0BLiXmGfTuxJa41yNPUEfzO76pJLf3uzjRtEVfSMRdUKsrqZlrYfAnOhWkIsaFk
	nIkQH0pnA5WqOEOchTkMNyznVSjva4tsGy5Pw4uaZj7FyVnc7oEj9mj22ROaSy5VR6LHahRNyuKmZ
	928tcXx4bXqqG8oh+cNUQMo20ZzUVAiISLNldDk7UqFhiXoWnIbc662ye/6QVXoZL2ypgf5qX5T9t
	ta/cUZvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43498 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51YK-0000000024M-2oAJ;
	Tue, 24 Mar 2026 13:12:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51YI-0000000DwVy-1JHX;
	Tue, 24 Mar 2026 13:12:10 +0000
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
Subject: [PATCH net-next 08/15] net: stmmac: qcom-ethqos: move 100M/10M speed
 programming
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51YI-0000000DwVy-1JHX@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_131246_414067_B9942B64 
X-CRM114-Status: GOOD (  10.07  )
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

Move the speed programming for 100M and 10M out of the switch. There
is no programming done for 1G speed.

It looks like there are two fields, 7:6 which are programemd to '1'
to select a /2 divisor for 100M, and bits 16:8 which are programmed
to '19' to select a /20 divisor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 84db57b3d7cb..10676897619e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -425,6 +425,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN, phase_shift,
 		      RGMII_IO_MACRO_CONFIG2);
 
+	if (speed == SPEED_100)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
+			      RGMII_IO_MACRO_CONFIG);
+	else if (speed == SPEED_10)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
+			      RGMII_IO_MACRO_CONFIG);
+
 	switch (speed) {
 	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -453,9 +462,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -479,9 +485,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
-- 
2.47.3


