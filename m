Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pkz2zCxLtGFcg99tV8GAj/pB8FhVnzp+yC3RwsgvvYk=; b=e2v3Zoh6FtehDFCOGUD5MjxSjT
	H6bIbuEli1VTiAYjipCiYfuMHtCgqD9xe/LnL3ScU0pUSGaBNXv+Tq2Pys30Jt4nsn0cgK14PDFhi
	csDDKGfF0oOj/I71HaZuVTLGRexe5tCKoakO3c+7RwO+InF6H9NXp2SBgZIRtjpU2b1fTa3RyK+vz
	lXqb91wdNYze0XgRvJ7C/i9niLcn2y3zTJJ45a4BlkutPvbxZz3mQzgZq9ofMtcRzRbw4p93T3F9u
	u3S/jhjple8iMNBWXaTK61MPxBm2N4WxvwfizDIxxxrNsXECxPsLNjWyxYoDfm6NvukYW/ZJuBwo0
	6nMKfoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpL4-0000000Gl0N-1D3W;
	Mon, 03 Aug 2026 09:52:06 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpL1-0000000Gkzk-1VDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:52:05 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c38:10::3a0])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 28C055CD304;
	Mon,  3 Aug 2026 11:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1785750718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:in-reply-to:
	 references; bh=Pkz2zCxLtGFcg99tV8GAj/pB8FhVnzp+yC3RwsgvvYk=;
	b=TGP871zrL3zr/iYve/sZJpijY/WH2BAdts77fOQrkeNdThN7pCb3Qwsg8V5PzVA0XZiYml
	8lN7OvNVs7qSavXdonDFt1D1VIh7UGB8Gjij0PZbtJ0Vh2Ytcwww5JwEQNYyQC7Bye+zoF
	rC5iY3lk88I4T093l55d0xlbIN55QdA=
From: Stefan Agner <stefan@agner.ch>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jakub Raczynski <j.raczynski@samsung.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	regressions@lists.linux.dev,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH net v3] net: stmmac: resume PHY before hardware setup when opening the interface
Date: Mon,  3 Aug 2026 11:51:56 +0200
Message-ID: <20260803095156.132827-1-stefan@agner.ch>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_025203_839945_CE559DE5 
X-CRM114-Status: GOOD (  14.79  )
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
activating the connection, breaking networking entirely. The same
regression has also been reported on i.MX8MP and reproduced on SoCFPGA
based systems.

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
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Changes in v3:
- Repost with no code changes after the patch aged out of patchwork
- Collect Tested-by from Alexander Stein
- Mention that i.MX8MP and SoCFPGA based systems are affected as well
- Defer the suggested renaming of phylink_prepare_resume() to a
  follow-up in net-next
- Add missing Assisted-by tag

Changes in v2:
- Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
  that it also counters the PHY suspend caused by __stmmac_release()
  (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
  to match the ordering used in stmmac_resume()

v2: https://lore.kernel.org/netdev/20260707195425.405989-1-stefan@agner.ch/
v1: https://lore.kernel.org/netdev/20260707162146.73823-1-stefan@agner.ch/

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4134,6 +4134,15 @@
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

