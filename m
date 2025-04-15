Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j3qmk+PLNPRkwcbnRoXCkpFbV5l4jb32cwoTVChRAA=; b=Jhbj9aHapowNRlDbiROs+xOToB
	Lw+uYMjUt6NDamG6J7Q+GwkFdjJm5PAGj0Xbi4pDD134Q3mCV/NZkYZxBoMBMJjCGnQdjA3CrGuT0
	m6iNs/QjXodpRMWh8+tuCw/HUtVsjukjp6Y9qaSrcOOimEJ/sfzfLrD/nm3CqDVaY6EV90KlCEF2P
	RzvFZXBzf7YRMFwQbhYHD1UNB/dEJkZdJg3UgY0PzX55pWNAv0ADtcXtpEy1+n9tjSvO0P3lPaKWc
	V320kj+Tg+caHpAlDXUN86P5KSbekInU/D54aXvRXg66iHJbOdsLxAp9bx2JLEC0AXBRWaC9cCWWh
	pky2YF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jkD-00000006Vis-3f5f;
	Tue, 15 Apr 2025 17:06:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jNV-00000006Rzv-3N13
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6j3qmk+PLNPRkwcbnRoXCkpFbV5l4jb32cwoTVChRAA=; b=dWVPmuqLkjRgDS4eABop1SUB+d
	j1kPQn2IN8b3fUtMYxTdiwHgw7Vj4k6Lt+pS4fofFOMk+VeOhohtBPX0PFbrbPJNiBNP53l0zz51g
	RQ6lAp2vQNgK+9RAXIKc9C8kOaGRWSyRgqYZOaaOaTsHYsqkJ5JWAGuRqjnaHioFFGivvPx0nYybZ
	uG2cC+17xP5j7/9/al5rBM0ztUnWyFzT5VgfpThJLlqFJWEdfkfvLYMbGiH/92jAIoyU9oF1a3DHJ
	zZKQJbh2Yrn4sjb9+mw2N+jdkjHj3EAcmjaSN7PwkDLJNDnFPNGffIK0NITKYeYC7axug2SJL226q
	KRPpytgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44024 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4jNP-0008WK-2D;
	Tue, 15 Apr 2025 17:43:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4jMo-000rCS-6f; Tue, 15 Apr 2025 17:42:34 +0100
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/3] net: stmmac: sti: convert to stmmac_pltfr_pm_ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4jMo-000rCS-6f@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:42:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_094317_840026_386F62A5 
X-CRM114-Status: GOOD (  13.32  )
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

As we now have the plat_dat->init()/plat_dat->exit() populated which
have the required functionality on suspend/resume, we can now use
stmmac_pltfr_pm_ops which has methods that call these two functions.
Switch over to use this.

Doing so also fills in the runtime PM ops and _noirq variants as well.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index b6e09bd33894..53d5ce1f6dc6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -298,29 +298,6 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
-static int sti_dwmac_suspend(struct device *dev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
-	int ret = stmmac_suspend(dev);
-
-	clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static int sti_dwmac_resume(struct device *dev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
-
-	clk_prepare_enable(dwmac->clk);
-	sti_dwmac_set_mode(dwmac);
-
-	return stmmac_resume(dev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
-						  sti_dwmac_resume);
-
 static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
 };
@@ -335,7 +312,7 @@ static struct platform_driver sti_dwmac_driver = {
 	.probe  = sti_dwmac_probe,
 	.driver = {
 		.name           = "sti-dwmac",
-		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = sti_dwmac_match,
 	},
 };
-- 
2.30.2


