Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE26410BA445
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DigMrnI/JE7R5NqvfuBaK1nizsaQmBG/fde8RVluEk=; b=ZzycEFoKa4xF5kyN3moTl8QZ8R
	DW1LB4LMxxt6O46HafvF6MpzcRKlpzMfaSCZYkQqFLYNxwFQd8xtRhbbp4FIySfcUNceh0uNS5a4n
	XRfnczRGTe2DDUY/o58cktmwr5VT5VA8K1cTBKgQfj37UIIdvv0VVXfTW4RzXCRza6F5bxBY29m+N
	OtxH+wQg2MpG4rSGwZi8XZJ72CazFUN2an8r9wYBHRKmjDlILPNW8eR9cuhQqj3h14LHkMSK4U3yG
	XOkF03Mj9ApoztPN6+h8ShyzJTc+q8D2FhFHbcDSPs8s6jYReqYeAw5kRlAYQRxy1sD86ues3l5jW
	gsrK84Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o8-000000070BF-2Xr7;
	Fri, 27 Mar 2026 08:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o6-0000000708g-0eGZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=6DigMrnI/JE7R5NqvfuBaK1nizsaQmBG/fde8RVluEk=; b=Xz/SQtmzXfdFa+SD63gC3vSm3S
	8ge92xFmu1eQyS6/DLDaomTu7eUS9qSOs0QylG0dz2R8pfj8gM/wnEzse15l0TIjH4zCSQb8ZW+bY
	79+t1MkxP0EjaqFvrjkY7tyrDFSXBjuiVnfrLMGbJ0w5U0pil8pDaSyQFX5KIDSF62WFjgLB7sRts
	Mc4mer/DOVu3Ro+0gywiHtLZZH8D0H5vqCKoa+pRcPG05Ecri6Fbg/35H0XBCpGVVCJAeo1Xpn0/C
	iS9y4SBCATv6GmoMkXFvY2/bAFKga8TIZDa/xTJoHRE71gOgasyJI2qwzGy8PTDBOVhWMJAD0bY7W
	cGcWwBqQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o3-00000009zxm-0a0U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6DigMrnI/JE7R5NqvfuBaK1nizsaQmBG/fde8RVluEk=; b=Sho6R/c34IQJwUJOYbt0TbTzjl
	wtiZ9BmP3i7P9bFZ19gxSiZDUe4evzyMV/vxpc+O5gPAgH9OIcbaoTIlIc9WAzdNZFyfBjkBhfuGn
	pGtyi2HCVjZdI97q+98BkplvCOn+oEYEK8bdxH+F23UV/4i+T9xmvhgSvDf2O6lKkzQTyz6bPuVpM
	cGTuScdGpLSx7MhRWWpxjL6ymFqmLABWcoky01tP458PeZwkE0CZPjecQTVALuOQzu75Up7RJ2IUK
	papHbXYjGrSylWRdLUYRBrwQAZharHYzpRqQ7N4gZVKkl4ebE6nnfnathqivH+hWQtl95s9ECtjDE
	c4X+9+cQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51092 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nw-000000005rw-1JLG;
	Fri, 27 Mar 2026 08:44:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nt-0000000E3D2-2fWk;
	Fri, 27 Mar 2026 08:44:29 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 13/15] net: stmmac: qcom-ethqos: move loopback
 decision next to reg update
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nt-0000000E3D2-2fWk@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084439_370925_81BD11D1 
X-CRM114-Status: GOOD (  12.27  )
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

Move the loopback decision next to the register update, and make the
local variable unsigned. As a result, there is now no need for the
comment referring to the programming being later.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 580deec1dc30..9dae40c27903 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -374,9 +374,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	unsigned int prg_rclk_dly;
+	unsigned int prg_rclk_dly, loopback;
 	int phase_shift;
-	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
 	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
@@ -389,12 +388,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	/* Determine if this platform wants loopback enabled after programming */
-	if (ethqos->rgmii_config_loopback_en)
-		loopback = RGMII_CONFIG_LOOPBACK_EN;
-	else
-		loopback = 0;
-
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
@@ -476,6 +469,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
+	if (ethqos->rgmii_config_loopback_en)
+		loopback = RGMII_CONFIG_LOOPBACK_EN;
+	else
+		loopback = 0;
+
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
 
-- 
2.47.3


