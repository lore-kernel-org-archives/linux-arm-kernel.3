Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7301C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7how95sR+gejTcHdrd3ySFnJth5O0WF603NX9k38viI=; b=kndmgK/yI755OxFlDm47OG3AWo
	/NX/HBAKi4aHF07J9ujQI5wgBpvfqPfcWN3z7dmYFymzZXzrQ4jvrj38EjRUEc5nj9FAJvRCJ68Ir
	zBS6tYWqpDE3iPXTGoSEeKKFwE0Jbh5bGHzTIQI09nRw4M+9yux47msWNt2GdHT95fo/SglQdFYBs
	8gSNbKmECXVBzpQeQfm/NCgxs9QZVm3FcMvFXmyGifsqzmgxM43cS4HRnWEaeEOSLU+jhUdMr//7j
	+lEoNDUGyiTPmcS1FBOC31ZsWTv3sCBOOxs1rfm68NOpMQb31FQZBj0T5yuK6zynteZ4zIl4OFWUZ
	eavKfh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKvH-00000007mNj-0LEP;
	Tue, 18 Feb 2025 10:33:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKpA-00000007jpq-0KDe;
	Tue, 18 Feb 2025 10:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7how95sR+gejTcHdrd3ySFnJth5O0WF603NX9k38viI=; b=TpYpwGRYd9RcZk5pO4XCnUbyb4
	jx+fTvsH7VAlnGe5qejPL7xF4X6TAzmYM0jWJiT7at/qoCoOEeNyvfyhnyTg2II5sYJrTd0ZOEwY3
	5aDv5xJUo8ddQir0MJMVkedQOx3PP0jNgFbHMErmCQQefsaBBiTbhi+LJApEwzyzCWTfIvEbw+lJ2
	FhfXmrIjxZkudhspXK/PtD3kdMmQ2WPktPJGcJS441uu9OjKNgRc5O91NrR40ObWLE1ap3dLGwfW7
	2AgDlHy48CT5uIuf85waG9eO73i09TIk0BDapdgDfp++dw8Quf7OXT+RYwLiKTPK+6drD2jyHB5Wt
	qcMkYyUg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50306 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkKmc-0001VP-21;
	Tue, 18 Feb 2025 10:24:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkKmI-004ObG-DL; Tue, 18 Feb 2025 10:24:34 +0000
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: netdev@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 2/3] net: stmmac: remove useless priv->flow_ctrl
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 10:24:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_022732_250153_B7477ECB 
X-CRM114-Status: GOOD (  16.99  )
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

priv->flow_ctrl is only accessed by stmmac_main.c, and the only place
that it is read is in stmmac_mac_flow_ctrl(). This function is only
called from stmmac_mac_link_up() which always sets priv->flow_ctrl
immediately before calling this function.

Therefore, initialising this at probe time is ineffectual because it
will always be overwritten before it's read. As such, the "flow_ctrl"
module parameter has been useless for some time. Rather than remove
the module parameter, which would risk module load failure, change the
description to indicate that it is obsolete, and warn if it is set by
userspace.

Moreover, storing the value in the stmmac_priv has no benefit as it's
set and then immediately read stmmac_mac_flow_ctrl(). Instead, pass it
as a parameter to this function..

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++----------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index c602ace572b2..3395188c198a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -282,7 +282,6 @@ struct stmmac_priv {
 	struct stmmac_channel channel[STMMAC_CH_MAX];
 
 	int speed;
-	unsigned int flow_ctrl;
 	unsigned int pause_time;
 	struct mii_bus *mii;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3a13bd8c9b3..4d542f482ecb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -88,9 +88,9 @@ MODULE_PARM_DESC(phyaddr, "Physical device address");
 #define STMMAC_XDP_TX		BIT(1)
 #define STMMAC_XDP_REDIRECT	BIT(2)
 
-static int flow_ctrl = FLOW_AUTO;
+static int flow_ctrl = 0xdead;
 module_param(flow_ctrl, int, 0644);
-MODULE_PARM_DESC(flow_ctrl, "Flow control ability [on/off]");
+MODULE_PARM_DESC(flow_ctrl, "Flow control ability [on/off] (obsolete)");
 
 static int pause = PAUSE_TIME;
 module_param(pause, int, 0644);
@@ -188,12 +188,11 @@ static void stmmac_verify_args(void)
 		watchdog = TX_TIMEO;
 	if (unlikely((buf_sz < DEFAULT_BUFSIZE) || (buf_sz > BUF_SIZE_16KiB)))
 		buf_sz = DEFAULT_BUFSIZE;
-	if (unlikely(flow_ctrl > 1))
-		flow_ctrl = FLOW_AUTO;
-	else if (likely(flow_ctrl < 0))
-		flow_ctrl = FLOW_OFF;
 	if (unlikely((pause < 0) || (pause > 0xffff)))
 		pause = PAUSE_TIME;
+
+	if (flow_ctrl != 0xdead)
+		pr_warn("stmmac: module parameter 'flow_ctrl' is obsolete - please remove from your module configuration\n");
 }
 
 static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
@@ -858,14 +857,16 @@ static void stmmac_release_ptp(struct stmmac_priv *priv)
  *  stmmac_mac_flow_ctrl - Configure flow control in all queues
  *  @priv: driver private structure
  *  @duplex: duplex passed to the next function
+ *  @flow_ctrl: desired flow control modes
  *  Description: It is used for configuring the flow control in all queues
  */
-static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
+static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex,
+				 unsigned int flow_ctrl)
 {
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 
-	stmmac_flow_ctrl(priv, priv->hw, duplex, priv->flow_ctrl,
-			 priv->pause_time, tx_cnt);
+	stmmac_flow_ctrl(priv, priv->hw, duplex, flow_ctrl, priv->pause_time,
+			 tx_cnt);
 }
 
 static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
@@ -925,6 +926,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 			       bool tx_pause, bool rx_pause)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+	unsigned int flow_ctrl;
 	u32 old_ctrl, ctrl;
 
 	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
@@ -1005,15 +1007,15 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 	/* Flow Control operation */
 	if (rx_pause && tx_pause)
-		priv->flow_ctrl = FLOW_AUTO;
+		flow_ctrl = FLOW_AUTO;
 	else if (rx_pause && !tx_pause)
-		priv->flow_ctrl = FLOW_RX;
+		flow_ctrl = FLOW_RX;
 	else if (!rx_pause && tx_pause)
-		priv->flow_ctrl = FLOW_TX;
+		flow_ctrl = FLOW_TX;
 	else
-		priv->flow_ctrl = FLOW_OFF;
+		flow_ctrl = FLOW_OFF;
 
-	stmmac_mac_flow_ctrl(priv, duplex);
+	stmmac_mac_flow_ctrl(priv, duplex, flow_ctrl);
 
 	if (ctrl != old_ctrl)
 		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
@@ -7600,9 +7602,6 @@ int stmmac_dvr_probe(struct device *device,
 			 "%s: warning: maxmtu having invalid value (%d)\n",
 			 __func__, priv->plat->maxmtu);
 
-	if (flow_ctrl)
-		priv->flow_ctrl = FLOW_AUTO;	/* RX/TX pause on */
-
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 
 	/* Setup channels NAPI */
-- 
2.30.2


