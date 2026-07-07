Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3NpIc8JZ08lCs6TTHGP7X1cz/YqBmnc+QKbmFf0dIk=; b=JohI3N0ewEUNdR8a7Ij/NZPfzj
	dghRg8Qa1qD6p8eU48FZh+5O+MgAqOf6wDPycbdztCXH59WC2jwJ3TuK0+bA4435+1SENmXeZr8+c
	/ICQEOAOI+vkhsCN+lZeK9IalJph63ZLgbBE5VQvCxsZ2wc+sj3XEI7/TKPsiRVRZsVOrJmXtUbIK
	iuK9RcxisQ83Lkg7f4gjkvpA+hr9dauLAvx5aSE21rWUYNCXSNORIIdfllutmdHO5rFTcNlZYjDnD
	oOBv0EoToi1JA0EU0zvyveAojhnvhYCB2fFWnJY96zynzvkGOf40rmX2C7ZTfxMuDYUmTKwVoZVFa
	ICqLPSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBsO-0000000Fp0r-0z2L;
	Tue, 07 Jul 2026 19:54:40 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBsK-0000000Fp0E-3V4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:54:38 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c38:10::3a0])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 316905CD106;
	Tue,  7 Jul 2026 21:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1783454074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3NpIc8JZ08lCs6TTHGP7X1cz/YqBmnc+QKbmFf0dIk=;
	b=jEWu6VgA3R7UyzMjcKI1AAh9/uw2KVhDn2V3vKUuP3vWJgafj6du0Q8IQCV2IJiNJjlHT6
	QH2cpRg9WpF1Csu9dbajDtM1xorXMuc+hFkCz7yn1/A4F1a9XXT7NnsSp1x7CHCQRtE3Zg
	6YhopjV6+pbvB1b7ioeUOb2c54Eo1us=
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
Subject: [PATCH net v2] net: stmmac: resume PHY before hardware setup when opening the interface
Date: Tue,  7 Jul 2026 21:54:25 +0200
Message-ID: <20260707195425.405989-1-stefan@agner.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <message-id-of-your-v1-mail>
References: <message-id-of-your-v1-mail>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_125437_107223_1A3044D0 
X-CRM114-Status: GOOD (  13.91  )
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

Resume the PHY in __stmmac_open() before the hardware setup, making it
the counterpart of the phylink_stop() in __stmmac_release(), like
stmmac_resume() already does for the same reason. phylink_start() also
resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
moved before the hardware setup since it may bring the link up
immediately from a workqueue, racing with the initialization (see the
comment in stmmac_resume()). For the regular ndo_open path the PHY has
just been attached and is not suspended, in which case
phylink_prepare_resume() does nothing.

Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
Link: https://github.com/home-assistant/operating-system/issues/4858
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Changes in v2:
- Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
  that it also counters the PHY suspend caused by __stmmac_release()
  (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
  to match the ordering used in stmmac_resume()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4147,6 +4147,15 @@
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
 
+	/* The PHY is suspended when the interface is reopened without
+	 * disconnecting the PHY, e.g. on MTU change. IEEE 802.3 allows PHYs
+	 * to stop their receive clock while powered down, but the DMA
+	 * software reset in stmmac_hw_setup() requires a running receive
+	 * clock, and phylink_start() below resumes the PHY only after the
+	 * hardware setup. Resume a suspended PHY here first.
+	 */
+	phylink_prepare_resume(priv->phylink);
+
 	stmmac_reset_queues_param(priv);
 
 	ret = stmmac_hw_setup(dev);
-- 
2.49.0

