Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD97C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Av+e+xwJa3OI09Ag1r1Hzotm7mvuweVojm+b6LjeE4s=; b=wDGoTD7TRbNyNVAEqIW1kZMeKM
	lvbDo/zlUc6yUElQ8N8JKCYJzXOjKs7OP5ERZWKj3HzfX5+NiNgIODFlhH4sJcc2gtGAQZFdEiDco
	fu0+L3nS58AUGIE4i45HWD+U1FOVns0cjrtkcHIUYQ9x9gWwcepgTVdx1oKfDt74NFAYA9RXF2rzP
	ibynbaOEidtdklNC8AYxTS4sADPoOomt94TrbduNcJ1FOidxewiFnvP8M+sJo2tw5OgHHzko2Y1b7
	b2ggCUxqCS9IYZZ5qbvIZ1Uol4irzwzIV/jqYipakD7dcqPJn7XDMK81eqzWXgaYtlhzPqWGK3tXx
	vXO0YGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TDj-0000000DtF1-06wh;
	Thu, 17 Apr 2025 17:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SqZ-0000000Do2t-2dba
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 17:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Av+e+xwJa3OI09Ag1r1Hzotm7mvuweVojm+b6LjeE4s=; b=giXq50aZ70VwSE87Hlhf57iayL
	v4NVlhtvN2j94egZsK1Pq72lxB7lq+XEbjdkgxjyRJRLS4reJlJpl9/nMvrDp9fi7n2auW8KaWLwV
	nbrhpK4rCKeBliSR0UgeKB8ra3FDhrntDx3yU3q+qQesYY1U2jIGYI/3QqGwHFc9atHyO4NOISUxR
	aiGfFQTinZKb4pYZZLWxdYEtvpICmyEXeiRoVOXcOep1/XEB8eRTg9EYPFWtA9THe7C5PQtJPMPs8
	f1iQkNJYZMYIu5KC6XAgY9kQbV9Ld2ey7CdR1UxTW8eBl7//Vki8A0FZ0Q1wzLQl5t0r4YCrI+YeB
	iWy0agAA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5SqW-0000000AL7w-3BdG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Av+e+xwJa3OI09Ag1r1Hzotm7mvuweVojm+b6LjeE4s=; b=nxnMqhLEb1TI0pUGVAnWFuqt2k
	Ak6NRrozkutqBVw2qHaUgYrgZ8w6zuo41z70cEiDr7HJEiCU6hCmDP/5j6ACsrhcjDXlB/aPol61M
	HKeo2ktRS1B317UiaLeC+WREg0140wah5+ucPRmBX3YThkEKR/3marfAgk5d1nvdZHUEfwft41ya0
	s69ipD0GdYmTL2/BLTz0lBMfEP7hpBBRHsmY/58yVO2TpPAkyhOJb3++xesxTexvSpPcgD31x5/qg
	k1az1qVUM1FdU6o01cozesllfOEsUM+mj3w8UGsVUGZOmd1HT2PpiHyfOd3qCoBb9ogRjLQ+TdTRi
	mqxBo29w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35752 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u5SoU-0007hW-0t;
	Thu, 17 Apr 2025 18:14:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u5Sns-001IJw-OY; Thu, 17 Apr 2025 18:13:32 +0100
In-Reply-To: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
References: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 5/5] net: stmmac: socfpga: convert to
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u5Sns-001IJw-OY@rmk-PC.armlinux.org.uk>
Date: Thu, 17 Apr 2025 18:13:32 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_181616_931883_64BE8893 
X-CRM114-Status: GOOD (  13.33  )
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
index c7c120e30297..59f90b123c5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -500,11 +500,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->riwt_off = 1;
 
-	ret = socfpga_dwmac_init(pdev, dwmac);
-	if (ret)
-		return ret;
-
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
@@ -524,7 +520,6 @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
 
 static struct platform_driver socfpga_dwmac_driver = {
 	.probe  = socfpga_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2


