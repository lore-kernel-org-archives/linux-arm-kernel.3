Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA07DCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 01:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r40/9/byFQ5Kdho5bSZgFzvBLnr6GNZb9hi7qVjYjLk=; b=WmLJMJ1Tq/jvUF1pvrxY/1eDRt
	jmJ0+UV7fdPJ+ghCq7i7CO2JEvZtbw0LrEHuZxrHGy6fdOSl2DJUIeKJAVv1IX0eRecnrj9k9qCG4
	DQ2KLGgq2Cwhi5xGuXgMie/4u3Vn1eVyH/AnNj2kyHPT1XVbkyop6vr53T23c50YUKzs34PvRWFgp
	kYMcrNLyin0xBN2Uqm3wMCqf/jgc0r2FPTFICWqmGmn3uB2RToy2uhVvOBFjDVlhvCX5A7OhgaKjl
	AXbkw7Bsgkbn6/Gdy5BwWcgNabNJS+YR8gUtN8m4bcvI2T0EjbaXnlZgzoPC6p1tuPqFcJUaG+hy8
	dPEU7aZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKVg-000000069fR-0wA6;
	Tue, 16 Sep 2025 01:29:32 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKVd-000000069eG-3sFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 01:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1757986004;
	bh=r40/9/byFQ5Kdho5bSZgFzvBLnr6GNZb9hi7qVjYjLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GbyOTn+8beVLVUek1GwkGtMa1kYvqAlmPmvxkbwG5zKuwVQrzhJUG9WzSPOm166F8
	 4LOKptBret0Jrt3+PXKeoSReK3OkXaREWS0UhW1/TKsinPgyM7MdfTNTOCTWRRP4K2
	 jkRQGsAEqAnu91I5KQqwRMfXq1Rzbwz68yU8wjUo=
X-QQ-mid: esmtpgz16t1757985994tb691f01f
X-QQ-Originating-IP: 9WqvNV5m81o9OAQGGCKKLjLtxMwpN1LWrrj43UnBIq8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 16 Sep 2025 09:26:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13026834714890684059
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>,
	David Wu <david.wu@rock-chips.com>
Cc: sebastian.reichel@collabora.com,
	ziyao@disroot.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH net-next] Revert "net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy"
Date: Tue, 16 Sep 2025 09:26:28 +0800
Message-ID: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N5h2Wk9Y6/Jsi6D/v1xwNuWh6fW4STFXUTjYoJIM4VYjIyaP73E0q2z4
	xJJBKrxB1ecHig9CObGuy/wD8iaM7jNKhoeQj8gQCbNthX1q+zUKhTOdJSnhypl5EZM/bHk
	X97ZLtNgsLcTUtHOxuEXV8qswFvW0wQt4V+MTSnO64onE0JYE52kIZU7GlFptjc9WsTEmuq
	pCnPs7w2kYx5+Lderh0Qgdocq0h70/oHhjezUM0dWSb8IYdTvZq36zGrXAB04gM0VrLmMah
	zq5/ONPJ5oRqTq073TXcb5HiNT1kEvMXFSkmqq5XbQPoSU82M4hdXl3zoR5rIeRS7x0u7Nq
	00kAMDUaXyvC+mzFpS6UvbtWwURuSxSfgY9R7BK2jCEIZmM4w8GODfamhuD3U0QGTr0fFu7
	oaFv9SuG3urEx3Mrg7SwaHMB4BkYFaP12USuvuPRcqN6B3QMdIi2czXOUBMQZKWDE8tlvSv
	ZvO0tFgFPIT4orPg04G4M3tt6HIwM54ELi7npIyJ/GOK4uOo5gy8QC74OaQudTnpNxwW8Ky
	qAFcqUUuAz5exdZl3Mdb8bh2I7YJO/xtz2+mN2tHtgReuwhtg9wxGt6EZGiw/LOaPIJbiXk
	KSQdhiDrKDk27gptwS9uNY7k4ewAEyJZyE7AQyvXr56p4VbQX0PndlWShiPJ899DF6mD23Y
	Y1qgYugVtQbfSVjUBGDDHTK7BpoNzmHT5JabFjhOxw9CRkFQSZcqMwJWWuKcaCih4v97GjD
	+bsHZS/7Vq3qyCvkPT65qqnVWoUPDPyHuDQwO3cneYfUZUeBDj4UPpuFZGtwXDUN6+tGQgn
	LpYaR2GJBAe6mzCGqAnBf9GlDjHIu/Am0eel3tHnz1wv1q2uQ0ve2Zt1H6aJWjkSMGxdtXR
	z/O5T98ObeXu5CGkfW8wm9tONcufmZr3gpGZUFvOz/MfjBPzhXryKmBhSIVJF3GsGJNFPZh
	omV1KlRodRICPquH9XdxDVm0mnFMhRxpIesBZ+FPJGwNKag==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_182930_490665_77CC2AF4 
X-CRM114-Status: GOOD (  11.50  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This reverts commit da114122b83149d1f1db0586b1d67947b651aa20.

As discussed, the PHY clock should be managed by PHY driver instead
of other driver like dwmac-rk.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 266c53379236..49f92cd79aa8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1410,15 +1410,12 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(plat->stmmac_clk, 50000000);
 	}
 
-	if (plat->phy_node) {
+	if (plat->phy_node && bsp_priv->integrated_phy) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
 		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		/* If it is not integrated_phy, clk_phy is optional */
-		if (bsp_priv->integrated_phy) {
-			if (ret)
-				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
-			clk_set_rate(bsp_priv->clk_phy, 50000000);
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
+		clk_set_rate(bsp_priv->clk_phy, 50000000);
 	}
 
 	return 0;
-- 
2.49.0


