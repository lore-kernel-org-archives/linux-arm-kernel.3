Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE935C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5vj31bpi1y4OVWIAK549+QJL7W6V5AmFFu+XdaqTBs=; b=ZkCQRrTYLa9LBKizn38zsnFDOX
	5NDTzF2dggMAkCGA+Vw7vFlpCNWqcBsMGFXT4zqz7Ys/goYC/uWsoP9GZ0ax6QBiFwSKcSDq2YUka
	W5F6wq6ioA7fBnmERSueNL85vjKjs7v4XA5JYYz0/6u1afV8Y9WlY2JTowEssoT6eLea9wpCH4rcm
	eE5MIHr+EQ817v0qpQVl23wqr3f5Nt9eyKVoOmN2zXIZGk8U8iRqgxc0qVooKIMDNih4OREx/nOmV
	konQ9Uz8eTmTrPkS6uZDzNplu8tw8c3R/fjkBfalKbgdXqF+dOlQCLMJz9xDHBjctbzQy+4AzLcf3
	vIdQIBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoU1-0000000882j-3ara;
	Wed, 05 Mar 2025 13:08:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoN2-000000086KG-1KB5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741179669; x=1772715669;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TXMXBDUa/9mgqdVRYWJGOfGPn2lcvQjcuO+122LWB50=;
  b=lV5s5632W5DHYaeUvd5DYqaDgBiL+sKteCQdncTUVrzF0ycZaPa5+xvU
   1QER3V1VXLbgS8GNncad0DTtBiwI826blBiw2Hjtw5U6XlXIy4xa59IYM
   BmS9mQCErbHSVt7i7APS4ICdAfxNHsSgVWnvJMmbMG4gSO6yjZ+txj5n3
   bxriD5JWCCi2raVSOMftVnnGzipu+wQQ/QTYTt8LXNqRaLFm+Z/e/zWDJ
   pO8M3x5Ay+wTP6Snvv0vahG8hextqhbA2HqrmcKXitFt1yc/Lm6uuaBQ0
   wFTmgzRLHyBaJVlIsXKgL9zRlg1ovonyLGpq+5s6ANUQ55KM8cPCoruSs
   g==;
X-CSE-ConnectionGUID: g1wNqmFZRm+E9SMMo/QYew==
X-CSE-MsgGUID: o3a2ahbCRgm/u+bUtBcN/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45794889"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="45794889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:01:08 -0800
X-CSE-ConnectionGUID: 0dfTdEU5QF6bz8I116yfCQ==
X-CSE-MsgGUID: vYf5Oc5dTd+WzvrtST/0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123276969"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 05:01:00 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v8 01/11] net: stmmac: move frag_size handling out of spin_lock
Date: Wed,  5 Mar 2025 08:00:16 -0500
Message-Id: <20250305130026.642219-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_050108_396128_5C3E3016 
X-CRM114-Status: GOOD (  11.23  )
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

The upcoming patch will extract verification logic into a new module,
MMSV (MAC Merge Software Verification). MMSV will handle most FPE fields,
except frag_size. It introduces its own lock (mmsv->lock), replacing
fpe_cfg->lock.

Since frag_size handling remains in the driver, the existing rtnl_lock()
is sufficient. Move frag_size handling out of spin_lock_irq_save() to keep
the upcoming patch a pure refactoring without behavior changes.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 918a32f8fda8..cfe5aea24549 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1216,6 +1216,10 @@ static int stmmac_get_mm(struct net_device *ndev,
 	if (!stmmac_fpe_supported(priv))
 		return -EOPNOTSUPP;
 
+	state->rx_min_frag_size = ETH_ZLEN;
+	frag_size = stmmac_fpe_get_add_frag_size(priv);
+	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
+
 	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
 
 	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
@@ -1224,7 +1228,6 @@ static int stmmac_get_mm(struct net_device *ndev,
 	state->verify_time = priv->fpe_cfg.verify_time;
 	state->tx_enabled = priv->fpe_cfg.tx_enabled;
 	state->verify_status = priv->fpe_cfg.status;
-	state->rx_min_frag_size = ETH_ZLEN;
 
 	/* FPE active if common tx_enabled and
 	 * (verification success or disabled(forced))
@@ -1236,9 +1239,6 @@ static int stmmac_get_mm(struct net_device *ndev,
 	else
 		state->tx_active = false;
 
-	frag_size = stmmac_fpe_get_add_frag_size(priv);
-	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
-
 	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
 
 	return 0;
@@ -1258,6 +1258,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	if (err)
 		return err;
 
+	stmmac_fpe_set_add_frag_size(priv, frag_size);
+
 	/* Wait for the verification that's currently in progress to finish */
 	timer_shutdown_sync(&fpe_cfg->verify_timer);
 
@@ -1271,7 +1273,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
 	if (!cfg->verify_enabled)
 		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 
-	stmmac_fpe_set_add_frag_size(priv, frag_size);
 	stmmac_fpe_apply(priv);
 
 	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
-- 
2.34.1


