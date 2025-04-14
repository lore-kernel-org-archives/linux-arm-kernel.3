Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED50C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhFzwgkdtFig+wSBVpbiTQ6PyiK1BHIb2bxLfvyCxnQ=; b=DMJ+eTeaqrojRQA+FaoAT2dFxb
	dU/o6kAYSBPz/SbMnT1dQPOI1kS9wMrc5ISr9szJBBT9Vdaf4jZIXq9iNA8IgzYMDlIJ1odPcl7/m
	DK19mYITBagkgnQXuJJNgQ+rPrDVbFZFl9Xp9LDX7KIIE5QVT0jHkH230bpEeVQ2aLlugJsACiQ2v
	+EsP9OkG2dzo7uXIunhd+SOQhtQ+MvIZrHwzKztOwXML5tVGmTH3kryUy2Lp3R6FWFW4mF3KebyXT
	mU1AguNM6TeSONaSAvJu0mVsefBQ0z5Nld5CYykSneMz7u/37gaHeOwRNhrWX4Slh4hqsdchgLsx7
	9pKPoi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4MBT-00000002i8F-3MRH;
	Mon, 14 Apr 2025 15:57:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M69-00000002hR1-06kV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HhFzwgkdtFig+wSBVpbiTQ6PyiK1BHIb2bxLfvyCxnQ=; b=Wbl8gfonUQZznefGkRxyfoZSbu
	XayvzADa8sqk88ah+QtUcvFL0yjtwd9Uh8eyEICwpjndetOBUPoDA0JBnK4iKMsdfOhNmM+un+VDJ
	IxpfD2jYyC/FI2WoAOJVh46fjXy0oCffACU1we/+Fc78LhkyzpI/YHsuDjM+AqUpKACcVGUWQ8tgD
	N4LUjaBK5Xnyzdk8qCA0j9ZrXYWNTiZ9bziBUdzLxlHi+KNKjTE7BgH4RoB7bPogmnEaVwts6pamj
	SzCmSR5Q/qUUg7d997Ieid+JzBHU29ho1a8znibPA4M16MD3jsL40Hn1ZrMrrLBftNeY6oP769Aqs
	vLI5vW+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47062 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4M63-0006oO-2G;
	Mon, 14 Apr 2025 16:51:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4M5S-000YGJ-9K; Mon, 14 Apr 2025 16:51:06 +0100
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/2] net: stmmac: ingenic: convert to
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4M5S-000YGJ-9K@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 16:51:06 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_085149_062714_D8F7DF53 
X-CRM114-Status: GOOD (  12.91  )
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

As Ingenic now uses the stmmac platform PM ops, convert it to use
devm_stmmac_pltfr_probe() which will call the plat_dat->init() method
before stmmac_drv_probe() and appropriately cleaning up via the
->exit() method, thus simplifying the code. Using the devm_*()
variant also allows removal of the explicit call to
stmmac_pltfr_remove().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 607e467324a4..15abe214131f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -290,11 +290,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = mac;
 	plat_dat->init = ingenic_mac_init;
 
-	ret = ingenic_mac_init(pdev, mac);
-	if (ret)
-		return ret;
-
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static struct ingenic_soc_info jz4775_soc_info = {
@@ -345,7 +341,6 @@ MODULE_DEVICE_TABLE(of, ingenic_mac_of_matches);
 
 static struct platform_driver ingenic_mac_driver = {
 	.probe		= ingenic_mac_probe,
-	.remove		= stmmac_pltfr_remove,
 	.driver		= {
 		.name	= "ingenic-mac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2


