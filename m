Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB02D25926
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQbhJic195icRH9DOBVb9n01Zo2c/1UpNVxdtJLDUFQ=; b=uSHAcLhQg2LvS6VDcJbVDx+Hov
	PirpKep48/3+KkQ0e/wkPo+C2eBiuOWpW2p/P4X2F9Ons3sGAPfnmyBH/LihCdQkle4BQE8vkiVD4
	ZxbOH56RCMwrwYnYoJ5h7/pJR31DC/a28g406azEXHScdaM8lEYCeGst+EW5NP7+3UrBfHcBE76Hu
	GLtEh3h4XOGew9MDCmg5WcO/snsoYLDMlLUrv5g+0fpifZ0KUf31xIWY06MqbFmM5AtBFE7FXUw52
	F14JGF/13/kri+zf/9u3SbH+xyJbV/yFVjvJORlVAZKmO2t/o0n7XpGPWp7/Wo7djeAh5aWhDzwMs
	A76wnu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3G4-0000000Fsja-1HKC;
	Wed, 28 Jan 2026 10:58:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3G1-0000000Fsha-2qW4;
	Wed, 28 Jan 2026 10:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TQbhJic195icRH9DOBVb9n01Zo2c/1UpNVxdtJLDUFQ=; b=mfBPwzQbQzvTKMcS5/G0eCK4rz
	rcDywclYF9VAv0s9JEq72l0epMmo74oiFqc46YpNDaEtuotCdWtWEEKsCFLAlW+9lU1ZKkbSX2Ts/
	1BZ38F5KTEYdlWGGtejahfmDwc6CaLS6loCWdbUed+NpkLOrkqc3tYdXkG2WkX0wW7PAmp9kBsIHU
	51YoIluLMukWdGn60Z/qcUz7n33B3CPiVIIk2zttQiHRW+AEqlppz8qFRP+HQgkmIGnq5t+4UkXvk
	VEXUQmXZrMzSNKNabRMJutvyipQ4+LEmqDbzhd6B14FndGjYUpa/ker1ESK3DNXPOq8uKjVIrt76V
	Jk8dRsBQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42246 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vl3Fw-000000007Fm-0wVm;
	Wed, 28 Jan 2026 10:58:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vl3Fv-00000006v3L-215v;
	Wed, 28 Jan 2026 10:58:39 +0000
In-Reply-To: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH net-next 1/3] net: stmmac: rk: fix missing reset_control_put()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
Date: Wed, 28 Jan 2026 10:58:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_025845_721642_9FF2EE6C 
X-CRM114-Status: GOOD (  10.94  )
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

rk_gmac_setup() delves into the PHY's DT node to retrieve its reset
control using of_reset_control_get(). However, it never releases it
when the driver is removed. Add reset_control_put() to rk_gmac_exit()
to clean this up.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 5f8d2031b97c..bc69cbb5a7d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1784,6 +1784,8 @@ static void rk_gmac_exit(struct device *dev, void *bsp_priv_)
 
 	if (priv->plat->phy_node && bsp_priv->integrated_phy)
 		clk_put(bsp_priv->clk_phy);
+
+	reset_control_put(bsp_priv->phy_reset);
 }
 
 static int rk_gmac_probe(struct platform_device *pdev)
-- 
2.47.3


