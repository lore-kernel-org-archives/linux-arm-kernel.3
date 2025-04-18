Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0495C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=en5gdMxExqw1aD8bG9IqTvDUrdOVPKSMS7wnF9SEYCg=; b=xKguJ0dn92BKWC0KeRaRZ+zXKO
	0CnjkD/TpWN+XFoJXZUf2klSFJzdJlNnlDkvNqZawhkB32gfawWA92xiUETS3gL+XAr6GDfLjpaTu
	qlSOSQL/gmATc+dJjO90L4sMRKmZsbaIjmR0QGfsWlTfT61c6gefrcphRc4seZ4qwvD/J7bonKB3Q
	CWQ0GO6LzOa55a/oVcy2HMqAaquA5v2N/R13OjmJhDJbM2JVsv4PEyXxX2GH8+SdBxNiMKc8xaFf5
	q8//Yiahy4fzkeQRYv4zPQKIqr2uVQ2t7Ji9/OajS9xGQ7aLSI9MzxXJc4elaQ7XJOYpyaVdvpAh1
	3yQigElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iT6-0000000FoIT-3WtR;
	Fri, 18 Apr 2025 09:57:08 +0000
Received: from mail-m155115.qiye.163.com ([101.71.155.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iNb-0000000FnVo-13a7;
	Fri, 18 Apr 2025 09:51:29 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 125a97193;
	Fri, 18 Apr 2025 17:51:20 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	David Wu <david.wu@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	netdev@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH v3 3/3] ethernet: stmmac: dwmac-rk: Make the phy clock could be used for external phy
Date: Fri, 18 Apr 2025 17:51:14 +0800
Message-Id: <20250418095114.271562-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250418095114.271562-1-kever.yang@rock-chips.com>
References: <20250418095114.271562-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09JSlZLQ0saH0seSUNPSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96484f541803afkunm125a97193
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6HSo4OTJRFgorSUhJI1FO
	GBdPChNVSlVKTE9PQk1CQ0NJSU5DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0lDNwY+
DKIM-Signature: a=rsa-sha256;
	b=aIsvloBfoUv0GslYV58lWI7EmDBe+MlX+QXMqQLdeV5Fe9ADD6yiZPce7TAeWNiQE84AIFKe+Jdw4XGERK8MVZewOzXhj6XgO4EF8Dxet17Ll6HogvUCQIz0BHsKh3hB7QtY3a8j5fu33+8kHPYuYTCum2KqybyJcjNGPQSdRP8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=en5gdMxExqw1aD8bG9IqTvDUrdOVPKSMS7wnF9SEYCg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_025127_468364_0F9EE028 
X-CRM114-Status: GOOD (  11.70  )
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

From: David Wu <david.wu@rock-chips.com>

Use the phy_clk to prepare_enable and unprepare_disable related phy clock.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Update the code logic for backwards compatible;

Changes in v2: None

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 82174054644a..b237771f687a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1784,12 +1784,17 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(bsp_priv->clk_mac, 50000000);
 	}
 
-	if (plat->phy_node && bsp_priv->integrated_phy) {
+	if (plat->phy_node) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
-		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		if (ret)
-			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
-		clk_set_rate(bsp_priv->clk_phy, 50000000);
+		/* If it is not integrated_phy, clk_phy is optional */
+		if (bsp_priv->integrated_phy) {
+			if (IS_ERR(bsp_priv->clk_phy)) {
+				ret = PTR_ERR(bsp_priv->clk_phy);
+				dev_err(dev, "Cannot get PHY clock: %d\n", ret);
+				return -EINVAL;
+			}
+			clk_set_rate(bsp_priv->clk_phy, 50000000);
+		}
 	}
 
 	return 0;
-- 
2.25.1


