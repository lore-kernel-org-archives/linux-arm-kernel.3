Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB829C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSNFXUitTBQmBWJf8ItL/iUtTikNWM/6SKlHYshO2Eo=; b=ArNzIVjLSeSjkh0UQLEVaTPIIy
	sJ0kjhYRoj7nlV2xgPShYNXwVuyPWpW4XEhxpDEOrENJhOPQyas5U7w4eigpMJNpvAf3iqLXTnz03
	wwXm7SFU1gvcHpOsOVgOjmXfF9GtDpCyFmeuTA2XbUaGdjJaaCCXKtd4wvejNjgeR8YA6M8aZHYyN
	slHQ7INxowF0dijPQolsQw3awVUphKaSehbrJYdPwxTYIqxciCgIc2XrAWkC5IsDa4rGltu5pQuXa
	YaKLxElgLKkW1aipWhYZ6CrbNZA7lqVGzY+RMzIIdJ7YLkGLonoVl8oDabzKvYuRpC4MEhYZ/f9bH
	ZgHT2kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jbB-00000006U2e-3p05;
	Tue, 15 Apr 2025 16:57:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jAq-00000006Q29-0C1q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OSNFXUitTBQmBWJf8ItL/iUtTikNWM/6SKlHYshO2Eo=; b=kzCjuU/B23MPb3sv40S02ftkml
	7OwG1tLDmV/hKnUsmNKynV3BEisSYlOWnS6rJs/4MbUiOXcNHIv9ZxDP1h+zetgB4J/AXcdzwOtYu
	gVQgunW/21kD+KYsjND/tarMIVCjHVm5J74WBIxAlAhn9XZutV8Uww5tzTZPsQlQ90iEy8OUv7I5k
	jvnnRtmT/lIlo9YPCUULADz4Hnta5jFAnrsnE2EVZCEJOBSXboS4kPy69UVBQO4fDZbsFZInOc4/m
	PI2edD1IA+OhzIu+iy6XCTfn542/bmE+aQzorpBayt47Yoo4AkC8HCpvPdu4x0HOe6unBXLt2oSO2
	RS3SG5sg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54230 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4jAj-0008UJ-0a;
	Tue, 15 Apr 2025 17:30:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4jA7-000r1h-5I; Tue, 15 Apr 2025 17:29:27 +0100
In-Reply-To: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/5] net: stmmac: socfpga: convert to
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4jA7-000r1h-5I@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:29:27 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_093012_083617_E131D731 
X-CRM114-Status: GOOD (  13.97  )
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

Convert socfpga to use devm_stmmac_pltfr_probe() to further simplify
the probe function, wrapping the call to the set_phy_mode() method
into socfpga_dwmac_init() which can be called from the plat_dat->init()
method. Also call this from socfpga_dwmac_resume() thereby simplifying
that function.

Using the devm variant also means we can remove the call to
stmmac_pltfr_remove().

Unfortunately, we can't also convert to stmmac_pltfr_pm_ops as there is
extra work done in socfpga_dwmac_resume().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 251d8b72bed5..8e6d780669b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -501,11 +501,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->riwt_off = 1;
 
-	ret = socfpga_dwmac_init(pdev, dwmac);
-	if (ret)
-		return ret;
-
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
@@ -525,7 +521,6 @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
 
 static struct platform_driver socfpga_dwmac_driver = {
 	.probe  = socfpga_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2


