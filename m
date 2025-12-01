Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B1D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9r8fFObJXa5DBjyXPkjBldkH6IAUdkLbluOsbjvx8I=; b=xCMjoXsgKERsFFL5hJDgiMW84V
	gQyIlM80IoZ1lAHXsHdwK8X1B6O51fOn08peJEkwuSOrWPI++9W2R1R/1vOetYy8ruvb89zhAGy9o
	dxBkntrLgTjAFk+260vy6FETfdMlcPgkxzNtOVcixHfvJAg2Qv2NYQqt3BsVlgVC8Ni7O7pW7D6tN
	MKJLAwxfDAnVxYxDu9PYPokIlxmOEgzxXLC3eESwteQ+GpJUtrX3WqkZ9DFUpjSVdLXqxvEgraKLn
	VkPDvpYLz9KZpufFmbikrn7SsIPp7P+ARtJyIU7Sv6V9Z/30nKPA5rFcO9lu2mD9/y0uhxvNl4pyt
	tDrpw4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5F5-000000046hQ-41FP;
	Mon, 01 Dec 2025 14:51:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5F4-000000046eQ-0O4H;
	Mon, 01 Dec 2025 14:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J9r8fFObJXa5DBjyXPkjBldkH6IAUdkLbluOsbjvx8I=; b=sE+OOrbT7htgoFdyHzRr7x1bqX
	N4oxyiAoRkGOan/BMn7k6rZLzWRzsOrcWNzwNIPY7XDut3nOGGVh+ZqZvpMTGEkV3UHcCXMshEBi9
	JbkzladXuSa+7znpjbhyLkvcSVlxKoCDV9rPD9TWV+tDsbTy24WrvbTo4ABgzFzpO6mY02N4tezCx
	UttrX9Dx3K9WdzPXXI8EcWH/qZhLI1+YJAto9iOFG7FFzWPI4Lp1VO+T3oOtyTP1sC1xlWGHHSsWM
	OlXIevTVeqAvbXgQ5eOJviNt6uIfjY563R4P1jIB8E3dkLW5H0wARGiwLQD3vbc5DnSvGj3K98bf4
	rE+RowRw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43544 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vQ5Ew-000000000fU-3De3;
	Mon, 01 Dec 2025 14:50:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vQ5Ev-0000000GNvg-3uGh;
	Mon, 01 Dec 2025 14:50:57 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 03/15] net: stmmac: rk: add SoC specific ->init()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vQ5Ev-0000000GNvg-3uGh@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:50:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_065106_133555_67640EE4 
X-CRM114-Status: UNSURE (   9.42  )
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

Add a SoC specific init method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index f9bc9b145ff4..e9f531d6c22a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -35,6 +35,7 @@ struct rk_reg_speed_data {
 };
 
 struct rk_gmac_ops {
+	int (*init)(struct rk_priv_data *bsp_priv);
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
@@ -1613,6 +1614,14 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 
 	bsp_priv->dev = dev;
 
+	if (ops->init) {
+		ret = ops->init(bsp_priv);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init BSP\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	return bsp_priv;
 }
 
-- 
2.47.3


