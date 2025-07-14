Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C3FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 05:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=; b=GZqjKF6iaIVpJNstDdFzLwVzJX
	pgn5E78n9czpbyksaN+OcNPB+c2owDkfk/mV2c1hgLLQusnxu211WBfFk/L/rpDxw3t8ewj86oAY5
	sE5dEC0aRWk/QyoT6YnE/Ff4b7xedj04lNXTYTWt/UDe0QuohDkMW91dzV05KXfzu2eNkWMhdodzE
	B2L5fcQkX7Y0RsLD9CDrUy5VWN26auNHasJLlH7okBP1ZeLJ/K4rvHFyeOfz9j8mOgYomktkLLnpi
	aynt3ubabSH473N8mb98CZZMxfaWeQ6wGdEJCXRn5mC5Vz34jTkl/O7xBPO4uSRX5aFmP74GFxv8l
	2nzdgK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBtQ-00000001DWI-0l3r;
	Mon, 14 Jul 2025 05:38:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBqz-00000001CwQ-3EOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:35:54 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74264d1832eso4969233b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471352; x=1753076152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
        b=fFBgeThdwoE0d3jg+T0Xuy0dmiTCdqvbLNS765OaLZGF0R9Skq+uykeZEuwWV6CsvC
         VCP+kuLI3azheb5M7uq1ApiDkvRtkkp1grmT9WrjENahGjQ0hdniMjLQi2ZUYa5x5Wu1
         6kh9jmdTdpXwg76XmrqOW7k6+pScPSq6mfun9koA6ldpjzeUSt8AQcIyfNS/dL4dC29Y
         v2DNqSM2ksfsvSNKe0daQ8C9JM0dnznI2cOZYGFoY/oNxQNXqAIPHHQ4WVUMAUAQN+7q
         7Zqq02fx/jsfs5y9H8Di70wYo7Q5ENe1fAf8h5OOUY2N1zrC3ywa/zu6bwAcD9++TAT+
         jQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471352; x=1753076152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
        b=sy7l3yu0yhyIitY2x9RMwm+E7WsD1q4x32GWuL+WAqT5AnVmgrdRlf9r74ocMRl3Pq
         Dm1X8tmmuiygscZgXc3upASX1CVfOzXAhyO6UZ1D7wo41N7WM/6MQPY8pBc6Z5MqaYHV
         2rZLctZZCXmirerOSAQquLZoAsybJmRT9JScbEXKJKdFbLhHdSWz26z2ZnqIit04q5ao
         Ksgp1t7wwIdxayK+n4hNN3Pj1/xGb97b/Ps7Tck0JmDXzDQgdPW4B2dIjWfCP4lpg05x
         q7ptR9qrWogZ2CobvpUtBu+hfFbpoXpmwPDZgYJsU2dhAuIdLt46o0Q91oV6tj0iNkUO
         3/jw==
X-Forwarded-Encrypted: i=1; AJvYcCU0qTYIVqGW7184eRsiEkXkhj5DuorI+oaNSjgkYTHlu0JIls9KS6vcJc6fSInumxnY6iGu8A8OiYxh58t/F+2K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrp2gB51K74RbwfJVl5fo8BNClGj3i5MyOeFKPNWD42egwVuMl
	svgWhQ2T1RrS24VR9v2x5FiNptfLyvloTMHmXTZw8iRxUFm5OqW1Rjf6
X-Gm-Gg: ASbGncvBkXcx08q6Ta/rMyxtBIRYvTaDd9ptLc0iar/aRotza3OtBNvd86O50rXWyCW
	8OzANn8LVYguU3UTd2m43gShADkVv33DVeAykZkW4+YXBTW06unLbOpZMOtyTLiq8MoU/p3PKjp
	f840BOTE6oSWLFN8l2UsZOltBgRnXJzbhneHGdgfAH4c8sHjGP1O3HCqSHmdwn6kOGtUtrAT+Rc
	MtIqA8AJu77sLypI3ASOhx3TJm/f/MZb/Uxc21uE2h4hD2hYPoo9751ppf0lIxAex5fJLB1FZ3B
	oGhlLbxLPuj6us322jpdrtZO3qtXWoYijOrT20b0GX+pTr9UTzJYPuhkgl1Ly+REgS2KHNPacIs
	HE2UHHRuUCSyCZLGKA6ewgXEOdWqwjzoEC/hXo6Lzje+/8bWhotqcGvNaEySnCw==
X-Google-Smtp-Source: AGHT+IGYbAKtgDLV5NK0ycsP7CBdgSQY5Ow6NeAjujS3go2updOBJ+OdCtl0cFGcZJwkgawkH+4GqQ==
X-Received: by 2002:a05:6a00:a1f:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-74ee04a9b48mr14846762b3a.2.1752471352312;
        Sun, 13 Jul 2025 22:35:52 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e14e9bsm9313078b3a.49.2025.07.13.22.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:35:51 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	KWLIU@nuvoton.com,
	tmaimon77@gmail.com,
	kflin@nuvoton.com,
	Marvin Lin <milkfafa@gmail.com>
Subject: [PATCH] net: stmmac: Add NCSI support
Date: Mon, 14 Jul 2025 13:35:27 +0800
Message-Id: <20250714053527.767380-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_223553_813855_59D3FC8C 
X-CRM114-Status: GOOD (  27.28  )
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

The NCSI is defined as the interface between BMC and Network
Controller on Host side. The interface is responsible for providing
external network connectivity for BMC.

This patch adds support for NCSI that registers and starts NCSI
device, it also skips PHY-related operations if use-ncsi property is
defined in the DTS.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 166 +++++++++++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
 include/linux/stmmac.h                        |   1 +
 4 files changed, 142 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..9dc386e0bc6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -365,6 +365,8 @@ struct stmmac_priv {
 	/* XDP BPF Program */
 	unsigned long *af_xdp_zc_qps;
 	struct bpf_prog *xdp_prog;
+
+	struct ncsi_dev *ncsidev;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b948df1bff9a..dfe3e588ffb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -51,6 +51,7 @@
 #include "dwmac1000.h"
 #include "dwxgmac2.h"
 #include "hwif.h"
+#include <net/ncsi.h>
 
 /* As long as the interface is active, we keep the timestamping counter enabled
  * with fine resolution and binary rollover. This avoid non-monotonic behavior
@@ -3131,10 +3132,12 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
-	if (ret) {
-		netdev_err(priv->dev, "Failed to reset the dma\n");
-		return ret;
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_reset(priv, priv->ioaddr);
+		if (ret) {
+			netdev_err(priv->dev, "Failed to reset the dma\n");
+			return ret;
+		}
 	}
 
 	/* DMA Configuration */
@@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");
+}
+
 static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
@@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if ((!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			goto init_phy_error;
+	if (!priv->plat->use_ncsi) {
+		if ((!priv->hw->xpcs ||
+		     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
+			ret = stmmac_init_phy(dev);
+			if (ret) {
+				netdev_err(priv->dev,
+					   "%s: Cannot attach to PHY (error: %d)\n",
+					   __func__, ret);
+				goto init_phy_error;
+			}
 		}
 	}
 
@@ -4082,9 +4095,23 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_init_coalesce(priv);
 
-	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		u32 ctrl;
+
+		stmmac_mac_flow_ctrl(priv, DUPLEX_FULL, FLOW_AUTO);
+		ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
+		ctrl &= ~priv->hw->link.speed_mask;
+		ctrl |= priv->hw->link.speed100;
+		ctrl |= priv->hw->link.duplex;
+		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
+
+		/* If using NC-SI subsystem, set our carrier on and start the stack */
+		netif_carrier_on(dev);
+	} else {
+		phylink_start(priv->phylink);
+		/* We may have called phylink_speed_down before */
+		phylink_speed_up(priv->phylink);
+	}
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -4094,17 +4121,29 @@ static int __stmmac_open(struct net_device *dev,
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
 
-	return 0;
+	/* Start the NCSI device */
+	if (priv->plat->use_ncsi) {
+		ret = ncsi_start_dev(priv->ncsidev);
+		if (ret) {
+			netdev_err(priv->dev, "ERROR: start the ncsi device(%d)\n", ret);
+			goto ncsi_error;
+		}
+	}
 
+	return 0;
+ncsi_error:
+	stmmac_disable_all_queues(priv);
 irq_error:
-	phylink_stop(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_stop(priv->phylink);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_hw_teardown(dev);
 init_error:
-	phylink_disconnect_phy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_disconnect_phy(priv->phylink);
 init_phy_error:
 	pm_runtime_put(priv->device);
 	return ret;
@@ -4139,11 +4178,15 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	if (device_may_wakeup(priv->device))
-		phylink_speed_down(priv->phylink, false);
-	/* Stop and disconnect the PHY */
-	phylink_stop(priv->phylink);
-	phylink_disconnect_phy(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		ncsi_stop_dev(priv->ncsidev);
+	} else {
+		if (device_may_wakeup(priv->device))
+			phylink_speed_down(priv->phylink, false);
+		/* Stop and disconnect the PHY */
+		phylink_stop(priv->phylink);
+		phylink_disconnect_phy(priv->phylink);
+	}
 
 	stmmac_disable_all_queues(priv);
 
@@ -6230,7 +6273,8 @@ static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	case SIOCGMIIPHY:
 	case SIOCGMIIREG:
 	case SIOCSMIIREG:
-		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
+		if (!priv->plat->use_ncsi)
+			ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
 		break;
 	default:
 		break;
@@ -6691,6 +6735,9 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_add_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -6725,6 +6772,9 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_kill_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -7504,7 +7554,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (!priv->xstats.pcpu_stats)
 		return -ENOMEM;
 
-	stmmac_set_ethtool_ops(ndev);
+	if (!plat_dat->use_ncsi)
+		stmmac_set_ethtool_ops(ndev);
+
 	priv->pause_time = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
@@ -7619,6 +7671,9 @@ int stmmac_dvr_probe(struct device *device,
 	 * host DMA width for allocation and the device DMA width for
 	 * register handling.
 	 */
+	if (priv->plat->use_ncsi)
+		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	if (priv->plat->host_dma_width)
 		priv->dma_cap.host_dma_width = priv->plat->host_dma_width;
 	else
@@ -7728,22 +7783,35 @@ int stmmac_dvr_probe(struct device *device,
 	if (!pm_runtime_enabled(device))
 		pm_runtime_enable(device);
 
-	ret = stmmac_mdio_register(ndev);
-	if (ret < 0) {
-		dev_err_probe(priv->device, ret,
-			      "MDIO bus (id: %d) registration failed\n",
-			      priv->plat->bus_id);
-		goto error_mdio_register;
-	}
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_mdio_register(ndev);
+		if (ret < 0) {
+			dev_err_probe(priv->device, ret,
+				      "MDIO bus (id: %d) registration failed\n",
+				      priv->plat->bus_id);
+			goto error_mdio_register;
+		}
 
-	ret = stmmac_pcs_setup(ndev);
-	if (ret)
-		goto error_pcs_setup;
+		ret = stmmac_pcs_setup(ndev);
+		if (ret)
+			goto error_pcs_setup;
 
-	ret = stmmac_phy_setup(priv);
-	if (ret) {
-		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
-		goto error_phy_setup;
+		ret = stmmac_phy_setup(priv);
+		if (ret) {
+			netdev_err(ndev, "failed to setup phy (%d)\n", ret);
+			goto error_phy_setup;
+		}
+	} else {
+		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
+			netdev_err(priv->dev, "CONFIG_NET_NCSI not enabled\n");
+			goto error_phy_setup;
+		}
+		dev_info(priv->device, "register NCSI dev\n");
+		priv->ncsidev = ncsi_register_dev(priv->dev, stmmac_ncsi_handler);
+		if (!priv->ncsidev)
+			goto error_phy_setup;
+
+		dev_info(priv->device, "Using NCSI interface\n");
 	}
 
 	ret = register_netdev(ndev);
@@ -7768,9 +7836,11 @@ int stmmac_dvr_probe(struct device *device,
 	return ret;
 
 error_netdev_register:
-	phylink_destroy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_destroy(priv->phylink);
 error_phy_setup:
-	stmmac_pcs_clean(ndev);
+	if (!priv->plat->use_ncsi)
+		stmmac_pcs_clean(ndev);
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
@@ -7868,13 +7938,15 @@ int stmmac_suspend(struct device *dev)
 
 	mutex_unlock(&priv->lock);
 
-	rtnl_lock();
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_down(priv->phylink, false);
+	if (!priv->plat->use_ncsi) {
+		rtnl_lock();
+		if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+			phylink_speed_down(priv->phylink, false);
 
-	phylink_suspend(priv->phylink,
-			device_may_wakeup(priv->device) && priv->plat->pmt);
-	rtnl_unlock();
+		phylink_suspend(priv->phylink,
+				device_may_wakeup(priv->device) && priv->plat->pmt);
+		rtnl_unlock();
+	}
 
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..de500e59461f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -447,17 +447,30 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		eth_zero_addr(mac);
 	}
 
-	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
-		return ERR_PTR(phy_mode);
+	if (of_get_property(pdev->dev.of_node, "use-ncsi", NULL)) {
+		plat->use_ncsi = true;
+		plat->has_xgmac = 0;
+		plat->has_gmac4 = 0;
+		plat->has_gmac = 0;
+	} else {
+		plat->use_ncsi = false;
+	}
 
-	plat->phy_interface = phy_mode;
+	if (!plat->use_ncsi) {
+		phy_mode = device_get_phy_mode(&pdev->dev);
+		if (phy_mode < 0)
+			return ERR_PTR(phy_mode);
+
+		plat->phy_interface = phy_mode;
+	}
 	rc = stmmac_of_get_mac_mode(np);
 	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
 
-	/* Some wrapper drivers still rely on phy_node. Let's save it while
-	 * they are not converted to phylink. */
-	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	if (!plat->use_ncsi) {
+		/* Some wrapper drivers still rely on phy_node. Let's save it while
+		 * they are not converted to phylink. */
+		plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	}
 
 	/* PHYLINK automatically parses the phy-handle property */
 	plat->port_node = of_fwnode_handle(np);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 26ddf95d23f9..668768043f7e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -288,5 +288,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	int use_ncsi;
 };
 #endif
-- 
2.34.1


