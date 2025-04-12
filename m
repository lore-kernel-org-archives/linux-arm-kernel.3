Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E3C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRH5oh1QX3s2+jHLBPnvV1CmrUbx5sVHTAOGvwTjYkg=; b=FmAeJEVwQDM5ajJ8Qtea74bzSn
	LiWvo5053M6pbXluqEfFKq6whYnG/ndPzjQd5GEiQNSGXC9BC9/2bv/0eOSP/0dc+F5BL2jsgAvlW
	GyIoMW0C7uSg+EThPF4kWdudCZmUlZ+D8XZq8TNG1wRJhjwnKAagmR8ZcOeaUYCWRipvaFLFhv8V4
	QfactYE2Mq0cs1TwjWP56jqI7WdosfG5Ln08cKVF2SnJi8zNDbnLq/4CM1WTT0/Ot433Ma7J22Uiv
	LK2rck838NdclpGIMphsxBh93HXFqTuvGlDQAcbZjolq0XbEJ94pv7JY8tXMIXisu4mMPD9TP59+d
	ariNkbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bqb-0000000G18y-1OsM;
	Sat, 12 Apr 2025 14:28:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bgA-0000000Fzzt-1iYR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PRH5oh1QX3s2+jHLBPnvV1CmrUbx5sVHTAOGvwTjYkg=; b=mW5fhlfdh7UKr3dxkZPwaozsLP
	2ZqHku6BZBa6k2qgLhoEYGOlWQB00oGi/7ZmlzaxMHgUduhYmX++kl9o7fpIs2SV/4OEC8xzbRTaz
	RyWjrCHRUe9bZR1rVHadPSKex9os7+PTCbomKbS96vPOI8ihDbQuWuraxIDnHYLsbxsJJuZ+uKACC
	osGJ+nomAW2PSaP/cd0Hxs/LWNpMj+gdpdyuHa3M82eqMNFLvy9BATcJxM/g1Mxo+31AU0ZzbozXp
	tphp5SFNZsVHyJLkKFjXIyyS/JO9st971tD78FTdvSVBgdG18i78kGn02JzR7CeVTqBxBrUPiToHi
	HZRpafZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33250 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bg6-0004co-00;
	Sat, 12 Apr 2025 15:17:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bfU-000Em3-Mh; Sat, 12 Apr 2025 15:17:12 +0100
In-Reply-To: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/4] net: stmmac: anarion: use
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bfU-000Em3-Mh@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:17:12 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071754_447892_90858028 
X-CRM114-Status: GOOD (  12.33  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 8bbedf32d512..84072c8ed741 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -113,7 +113,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	plat_dat->exit = anarion_gmac_exit;
 	plat_dat->bsp_priv = gmac;
 
-	return stmmac_pltfr_probe(&pdev->dev, plat_dat, &stmmac_res);
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


