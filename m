Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5834DCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cKOc9ymYgduRLbjwAbYYsJz6WnNI5zIjxvxjVDfgGQE=; b=aie4DwELvv/xpqoiiyijoSBa7k
	wSqa38RYZqdsBcH+yi5lVmL9M1DOAbu+vrKrzJv1cJFDxSZWH3gs3H5TFqZCLDsroiMVwqO/8XedD
	mvdzSW95FpGeLM0GK0cJ6cPagOC/9sk6gES3RRqzRZvkf8WwvwVni0fgMNHEw8NbnPhYXRk+FIVpv
	UWXFJ0RseSgBwA8bvyA4SHB6z0PHvIZUNoBnpOqq7KColjNNys4bJLYeH+C3yTd/DVlE97ftWeqBI
	v3shoJLcXv3LeKOEgYG9aOa4WGI6LsKc+sH1ed+cLOXq5Hpsh1LRJ4iIy3ZSELebXByvwn93vz0aL
	goDocyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZ0-0000000Dmdh-05jz;
	Mon, 27 Oct 2025 11:39:02 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLYr-0000000DmZA-3l5G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565134; x=1793101134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JUbvz9IlQ6+L8KQRASSmO9wSpjWPjTFfbMmzkjCOkKw=;
  b=klUoVDgyJnDRDwUzsrTNvgc5yHNXP8SQ/wmSyvk35p0nyVZKn8tk2QiC
   8X6UMSLzf+Q5b8Y4HHIGWdQBEXCwFs8KV0u4EamQoGFwbYybQ7itklJGe
   0QO56NBCP+joySZ0PfLOmC/cqD5wBWhpvsW45/W3yKYFfVQo7Jii+nNv6
   Ri1z/vqEw+A1gIpfbmWt8o5XhweVbJL29fmnqLfilJDvkQJr1KISzcSEG
   CxnKtd57J8gOANRmcEntzWMMaE64OaPL1+IIVopx4i59I7hG9r+G0/MIP
   1cqSJ9D7/i2aCwzJGQqX8ZgbThdP/grSOUNwspIau5q0k9P7rSuO5xsWd
   Q==;
X-CSE-ConnectionGUID: xYoYhylRT8aNnSGLPpxtRw==
X-CSE-MsgGUID: UsmD6mK5SXOMmEsyYN5X2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51217020"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="51217020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:54 -0700
X-CSE-ConnectionGUID: G0A95y7PTseda62niZdwoA==
X-CSE-MsgGUID: p+9mo0ATQgWn2d6ZEMfL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="215672873"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91DF7121E63;
	Mon, 27 Oct 2025 13:38:45 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLYY-00000001ddb-22ra;
	Mon, 27 Oct 2025 13:38:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Nemanov <michael.nemanov@ti.com>,
	Kalle Valo <kvalo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] net: ethernet: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:38:31 +0200
Message-ID: <20251027113834.390681-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043853_993166_90629C34 
X-CRM114-Status: GOOD (  11.05  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/net/ethernet/cadence/macb_main.c  | 5 -----
 drivers/net/ethernet/freescale/fec_main.c | 8 --------
 drivers/net/ethernet/renesas/ravb_main.c  | 4 ----
 drivers/net/ethernet/ti/davinci_mdio.c    | 7 -------
 4 files changed, 24 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 39673f5c3337..847c4ab9df23 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -327,7 +327,6 @@ static int macb_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
 	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
 
 mdio_read_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -373,7 +372,6 @@ static int macb_mdio_read_c45(struct mii_bus *bus, int mii_id, int devad,
 	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
 
 mdio_read_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -405,7 +403,6 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 		goto mdio_write_exit;
 
 mdio_write_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -451,7 +448,6 @@ static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
 		goto mdio_write_exit;
 
 mdio_write_exit:
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 mdio_pm_exit:
 	return status;
@@ -5564,7 +5560,6 @@ static int macb_probe(struct platform_device *pdev)
 		    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
 		    dev->base_addr, dev->irq, dev->dev_addr);
 
-	pm_runtime_mark_last_busy(&bp->pdev->dev);
 	pm_runtime_put_autosuspend(&bp->pdev->dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 1edcfaee6819..4875101c4f3f 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2231,7 +2231,6 @@ static int fec_enet_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
 	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2280,7 +2279,6 @@ static int fec_enet_mdio_read_c45(struct mii_bus *bus, int mii_id,
 	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2312,7 +2310,6 @@ static int fec_enet_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	if (ret)
 		netdev_err(fep->netdev, "MDIO write timeout\n");
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2356,7 +2353,6 @@ static int fec_enet_mdio_write_c45(struct mii_bus *bus, int mii_id,
 		netdev_err(fep->netdev, "MDIO write timeout\n");
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2839,7 +2835,6 @@ static void fec_enet_get_regs(struct net_device *ndev,
 		buf[off] = readl(&theregs[off]);
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -3616,7 +3611,6 @@ fec_enet_open(struct net_device *ndev)
 err_enet_alloc:
 	fec_enet_clk_enable(ndev, false);
 clk_enable:
-	pm_runtime_mark_last_busy(&fep->pdev->dev);
 	pm_runtime_put_autosuspend(&fep->pdev->dev);
 	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
 	return ret;
@@ -3647,7 +3641,6 @@ fec_enet_close(struct net_device *ndev)
 		cpu_latency_qos_remove_request(&fep->pm_qos_req);
 
 	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
-	pm_runtime_mark_last_busy(&fep->pdev->dev);
 	pm_runtime_put_autosuspend(&fep->pdev->dev);
 
 	fec_enet_free_buffers(ndev);
@@ -4616,7 +4609,6 @@ fec_probe(struct platform_device *pdev)
 
 	INIT_WORK(&fep->tx_timeout_work, fec_enet_timeout_work);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c3fc15f9ec85..21a45583e7e1 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1975,7 +1975,6 @@ static int ravb_open(struct net_device *ndev)
 out_set_reset:
 	ravb_set_opmode(ndev, CCC_OPC_RESET);
 out_rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 out_napi_off:
 	if (info->nc_queues)
@@ -2404,7 +2403,6 @@ static int ravb_close(struct net_device *ndev)
 	if (error)
 		return error;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -3116,7 +3114,6 @@ static int ravb_probe(struct platform_device *pdev)
 	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
 		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
@@ -3301,7 +3298,6 @@ static int ravb_resume(struct device *dev)
 
 out_rpm_put:
 	if (!priv->wol_enabled) {
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 
diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 68507126be8e..9f049ebbf107 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -234,7 +234,6 @@ static int davinci_mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
 
 	ret = mdiobb_read_c22(bus, phy, reg);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -251,7 +250,6 @@ static int davinci_mdiobb_write_c22(struct mii_bus *bus, int phy, int reg,
 
 	ret = mdiobb_write_c22(bus, phy, reg, val);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -268,7 +266,6 @@ static int davinci_mdiobb_read_c45(struct mii_bus *bus, int phy, int devad,
 
 	ret = mdiobb_read_c45(bus, phy, devad, reg);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -285,7 +282,6 @@ static int davinci_mdiobb_write_c45(struct mii_bus *bus, int phy, int devad,
 
 	ret = mdiobb_write_c45(bus, phy, devad, reg, val);
 
-	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
 
 	return ret;
@@ -332,7 +328,6 @@ static int davinci_mdio_common_reset(struct davinci_mdio_data *data)
 	data->bus->phy_mask = phy_mask;
 
 done:
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return 0;
@@ -441,7 +436,6 @@ static int davinci_mdio_read(struct mii_bus *bus, int phy_id, int phy_reg)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 	return ret;
 }
@@ -478,7 +472,6 @@ static int davinci_mdio_write(struct mii_bus *bus, int phy_id,
 		break;
 	}
 
-	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
-- 
2.47.3


