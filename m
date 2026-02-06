Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC81EE20B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hBz1B1ch3uij2mP5ItPRrEZrt2hOKNjok2/Z3SVVwAE=; b=wMX/zqxswVGRnX1ymNNZ/hKVZ2
	FbOzeaCbeqkxNA/5WeAM1mU56eYAOFrdPjPlCMYG1WDhn3tUYtoPLxbSQbUlJtoL7tiBwcc3bReN2
	eCgSEVHm99MELBMpnar7+2R927zCQzU5NzEyLOFTq36hvjtHMU7yapGbhm3LwAX4AMzlRl8CvYgxB
	v8uBBPVQWJnzbkjOwko3SUN2X/g48akr2y7pS+zQNO5Me0HFwkGwhLr1dfm6PPt9d2M+jyoYmxOkG
	UnXyozz6cN3sgb0+GoLhNyc8bkaSg63ebEu4jFv2jYyWDwukVzUfkzxUKw1X5pfTzoYXe6U19oZA1
	urqC5r7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPUV-0000000BcRv-2FKK;
	Fri, 06 Feb 2026 17:19:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPUS-0000000BcNu-3RMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 17:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBz1B1ch3uij2mP5ItPRrEZrt2hOKNjok2/Z3SVVwAE=; b=cGN2Nra3VKLwUUCu1C3ru68F7Q
	430jBi13WUXglaqY7kKbPJYZW98oMB4ViXQ5DgjUo/P7nmDlc998GGuGK1J1DqCM5bAZUt49dq6AL
	dpQ0rhg8Ja4WRD+0ArK/I1JbIugABP2uLpWzbder7O1IyIJ8SlTAB38hyofgs877cXt0gUPxhGOV0
	VugmV3sWVWRk7iWzUcRJfFV5hh4ghVGUJXUyCxdaMLAxIgAsapt4X4xATqC7WRld0UUcbU0yWOH7Z
	/mRNSV50+Ku0SB4w7klqAuhoots6cSVBn4YBUwMJwbyvmIEHnE9V+lSAm3RYWySwAOlFwcYoTgi1S
	sCHa0wFA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1voPUI-000000008Hl-1fh0;
	Fri, 06 Feb 2026 17:19:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1voPUH-000000083ji-25FH;
	Fri, 06 Feb 2026 17:19:21 +0000
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
	Paolo Abeni <pabeni@redhat.com>,
	Sneh Shah <quic_snehshah@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
Date: Fri, 06 Feb 2026 17:19:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_091933_142714_FA295B67 
X-CRM114-Status: UNSURE (   9.77  )
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

Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
was missing calling phy_exit() and phy_power_off() at appropriate
failure points.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 869f924f3cde..af8204c0e188 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -659,10 +659,18 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 		return ret;
 
 	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret)
+	if (ret) {
+		phy_exit(ethqos->serdes_phy);
 		return ret;
+	}
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	if (ret) {
+		phy_power_off(ethqos->serdes_phy);
+		phy_exit(ethqos->serdes_phy);
+	}
+
+	return ret;
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-- 
2.47.3


