Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1lw1VBDE1/D2I6ja8qlx//S0jIyLgr96wpIl4MJHkxE=; b=GQMBJHaL47ahlQnkQ39IvVVWtX
	4jIsq10ejdcd4JWAMMT2sUDb6x14kqi/G2poCQCsKw7DgShV0CguJyB4DkIYxTj94FYSBKjlINmFL
	0c3vz0oEEyGkRiEzM17yyqEPvu1vhCwH5/XBk3P7s+huAHXvoFyOtZolT9krnNK8+cpI8ImPrwGJ/
	UE9B8ZmWenxGrLK0kwvg12sUfskSXHYqUXzxvwjuv78XUqEcnM0UY7usG1I3dfG4SFbMuD5kKxSrU
	NnQOoVycn+uySViLMzbYzQ9zpbfRVZB1Olv1XumbDjXgJdSccKW5hYDOVLPblGNXI8/66Vu0tkUFX
	7TQDNXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8YY-0000000FRwE-2dpI;
	Tue, 07 Jul 2026 16:21:58 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8YW-0000000FRvh-0LIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:21:58 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c38:10::3a0])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5A49C5CA16B;
	Tue,  7 Jul 2026 18:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1783441310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:in-reply-to:
	 references; bh=1lw1VBDE1/D2I6ja8qlx//S0jIyLgr96wpIl4MJHkxE=;
	b=OExklQX0Z1RbE+wjJPmTMPSVhBQoTHdvN82uETaE1DHuFypcgBk2aUoB16NyUEuQN0lUe4
	0X/5M9sDKZj7IoVSnybczAGLz9yKrX1VHWAUjX1+XzzOmz6OPBeG2pUd6bb87VxYv6/OwM
	AlvuAaXr2C2jIkXgK31f8EO6df7/474=
From: Stefan Agner <stefan@agner.ch>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	regressions@lists.linux.dev,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH net] net: stmmac: resume PHY before reopening the interface on MTU change
Date: Tue,  7 Jul 2026 18:21:46 +0200
Message-ID: <20260707162146.73823-1-stefan@agner.ch>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092156_565654_95FFEA2D 
X-CRM114-Status: GOOD (  10.76  )
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

Since the referenced commit, changing the MTU on a running interface no
longer disconnects and reconnects the PHY; __stmmac_release() merely
stops phylink, which also suspends the PHY (BMCR power-down) when WoL
is not enabled. __stmmac_open() then performs the DMA software reset in
stmmac_hw_setup() before phylink_start() resumes the PHY again.

IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
powered down, and stmmac requires a running receive clock for the DMA
software reset to complete (the phylink config sets mac_requires_rxc).
On such setups, e.g. the RK3566-based Home Assistant Green with an
RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
leaves the interface dead:

  rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
  rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
  rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
  rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change

In the field this is triggered by NetworkManager applying an MTU while
activating the connection, breaking networking entirely.

Resume the PHY before reopening the interface, like stmmac_resume()
does, to ensure the receive clock is running for the DMA software
reset.

Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
Link: https://github.com/home-assistant/operating-system/issues/4858
Assisted-by: Claude:claude-fable-5
Tested-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Note: phylink_prepare_resume()'s kernel-doc says it is to be called
prior to phylink_resume(); here it is paired with phylink_start()
(called from __stmmac_open()) instead, which phylink_resume() itself
uses to restart the machinery. If preferred, I can extend the
kernel-doc or introduce a more generically named helper.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5884,6 +5884,15 @@
 
 		__stmmac_release(dev);
 
+		/* phylink_stop() in __stmmac_release() suspends the PHY.
+		 * IEEE 802.3 allows PHYs to stop their receive clock while
+		 * powered down, but the DMA software reset performed by
+		 * stmmac_hw_setup() requires a running receive clock.
+		 * Resume the PHY, as on system resume, to ensure its clocks
+		 * are running before reopening the interface.
+		 */
+		phylink_prepare_resume(priv->phylink);
+
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
-- 
2.49.0

