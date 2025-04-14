Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB36DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmTbfO2XzBCI5WUjtZDeqNTumSUDOLu5j8tSDSzeqjw=; b=vK8sAjxXITMnmdXHtDXe7Wdxdh
	OtEcLAh+GDOPpGIdiKbLwcHP56PpKvc1QqfrRCirT4r5yWvnrcHAcAEJGyu867IRoHmC7xEAhJwIt
	Tn45qTuqLQSLd0wJrEVzEoXFTBCeiyDtUypgHhOzmMeKTGVW74PvkRf0fJQft5iIe/CU0RwUzAVjW
	DWoUoEwq5VtZXc/0rh4T1kA6iHN4gFvhMBWBTpwo+cmv+rRg2hoxWNqrZYI9R1QTIhQS0dfcBYdoS
	Osyi8eKugFasoDwkW11Vx1SiKEr3mKfRu+4e9QhHkP4JRleATTwuoRrpbBOrgSSrz1B09wVGEGJhS
	pnCG298Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G6j-00000001H0R-3sZp;
	Mon, 14 Apr 2025 09:28:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Fme-00000001Df0-3Bu0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FmTbfO2XzBCI5WUjtZDeqNTumSUDOLu5j8tSDSzeqjw=; b=aZs867V0nvhBEraOD8+wtPp4Ot
	LZG9u1F29qgKWIJmS4+FpzKs4mpYPJ2rYbG+852jURIxyG/rgRiA5j5mbVl1aBSpPrZtRjUgC34u+
	MpTumZQWWJtHE1QaJb3aOQG/rYaP8d3QYYtPF0Y8q/uDz+tNIVdwLf71q+opjRWkSKKQVnrbNEQ4C
	HGHA0mkv5HUFggzPPd3oghQvF+rQwv7oc/f3jrp+0m5rQrW3bfhm229fXHeZr9HGvLLVD8aIVRZWK
	6DW7YzY4rX7WGe+XqFqYXht5hmJIf4OKgPEU2HrKLzAFt+XJYX3zJA+lwnT7iUSOPknxBq4schcd4
	Vnk3hGEw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60814 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4FmK-0006DB-1A;
	Mon, 14 Apr 2025 10:06:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4Flf-000XjS-Fi; Mon, 14 Apr 2025 10:06:15 +0100
In-Reply-To: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
References: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 4/4] net: stmmac: anarion: use
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4Flf-000XjS-Fi@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 10:06:15 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_020716_807017_AC84F1C0 
X-CRM114-Status: GOOD (  12.08  )
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

Convert anarion to use devm_stmmac_pltfr_probe() which allows the
removal of an explicit call to stmmac_pltfr_remove().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 99f6c977ec41..84072c8ed741 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -113,7 +113,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	plat_dat->exit = anarion_gmac_exit;
 	plat_dat->bsp_priv = gmac;
 
-	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id anarion_dwmac_match[] = {
@@ -124,7 +124,6 @@ MODULE_DEVICE_TABLE(of, anarion_dwmac_match);
 
 static struct platform_driver anarion_dwmac_driver = {
 	.probe  = anarion_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "anarion-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2


