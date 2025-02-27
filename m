Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEABC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nwR1ylDJB/ihgDa3u2JD9TKc/16kfW45+c7DvPPlqY=; b=mGEXzSlgFkPXIalhXf/CiPvsQP
	feUBjG3hsMoObmvJbHATwG2qTQV/CbVOFoneeU3zyHXN4+MHXdSxZy2afgegSruVtNEO4cAPKiEw0
	k4IYbsQAFuIf+s877iNtw4z4QRZbf88ImITNszYioelM5nWNmckxFUgpiW/adrhq1g+YQslVCs6f7
	GUalzfWHqquKZhXNHoKDyfCvDyp5SEjAPHzFmFDpo59F4JJ9NAThUQacq6K/8bF8G2YBVk2WVnRM3
	mRl8UinqJPQdjrMLLfA0atZrzSex8+BkzOHXI78ev8W9c3GEUjtVuEnpN/lrLdf67QYiCPUSJPyIy
	zwN5CGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndS2-00000007RVq-3rBy;
	Thu, 27 Feb 2025 12:57:18 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncpI-00000007KUL-1h6u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740658636; x=1772194636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=23Wnyd3qZHaBZICVaJoi2NlVrSEsbcWxMjuwRlV42ko=;
  b=nzjm99Kpp5p+C8z9iI0+nyL7LItd86R8UCkdw1QlaSqukUqyoAUvtl6v
   FVkfXLDwJix2ExrUZBLQzLWjrXPYYSo+o5FeLC7ISY+wHALvbmz8rXpL2
   WNWm3d/eQa+teIfr6SggjZyhmOamAY/9yGaRhIO1jcf9Npqt28AMZXHRo
   C7L8JBWu4HpBAQgruCcofC5eK07j24P+0jeNfiiWWoXatgT5p6BB2cB5Z
   iVXHHkOLRaq+ofppKc3+rwpG8EzEj1UIpD70pED7VpS/fG2IKX+sCWyFj
   flHTqZHzhplDhJ0UYB23Qs1xpJGClRbEdjdrxPZcWaerHKu3BMGBr7wJ7
   g==;
X-CSE-ConnectionGUID: B8ho814BRAyTM5lscJIaHQ==
X-CSE-MsgGUID: X75oW/qgTaOaaCqVOxyuRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41464374"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41464374"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:17:15 -0800
X-CSE-ConnectionGUID: t2HlU1RRQQOkaHSTBT+bwg==
X-CSE-MsgGUID: WDg8vf6+Q46I63fgcAp6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117519259"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa007.jf.intel.com with ESMTP; 27 Feb 2025 04:17:09 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v9 4/6] net: stmmac: configure SerDes on mac_finish
Date: Thu, 27 Feb 2025 20:15:20 +0800
Message-Id: <20250227121522.1802832-5-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_041716_487008_6E9996B0 
X-CRM114-Status: GOOD (  11.64  )
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

SerDes will configure according to the provided interface mode after
finish a major reconfiguration of the interface mode.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 include/linux/stmmac.h                            |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 424fa2fe31c6..72ec2ef3907f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1086,6 +1086,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
+static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
+			     phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (priv->plat->mac_finish)
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+
+	return 0;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
@@ -1094,6 +1106,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
+	.mac_finish = stmmac_mac_finish,
 };
 
 /**
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 6d2aa77ea963..af22a11c2b8a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -236,6 +236,10 @@ struct plat_stmmacenet_data {
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
+	int (*mac_finish)(struct net_device *ndev,
+			  void *priv,
+			  unsigned int mode,
+			  phy_interface_t interface);
 	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
-- 
2.34.1


