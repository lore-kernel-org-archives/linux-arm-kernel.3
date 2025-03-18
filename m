Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12040C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raqgNQYeZfUNMgpwzQs2jk+AK3YWFAlpqT7qkVz0Epc=; b=C1gk1bqcsBNIX6Wj8YHQ53W9m2
	4B2r7zNkZarpIIto/v96efN61WejYF7vkR6yLDvWEAMq42Rigc7fXEOzBMDx7SXSD2QgrSARPZfbf
	A01qlsWrhbBMK/dutsj/NC2J4s2BiXbN78YZgnMjzIrpZ4YJ25yCqTLBhQ/3sju6f9j8GNs1cJvcv
	I4JDt1+/FArgVEuceL7F/DAyoIjEQ/53W0x9+ByiLJpuGE2sOscnlXUflnz9Y9kfuNRAI6pypk1Tf
	3wcE5FhIFAd/F50BNmg9rVYrKKNiId54B5dtxGpc6+SGHx3oCbJoxnVCCOnCzfGKe15jDjBNtGAew
	HMNoQ4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNO6-00000004U8Z-09ek;
	Tue, 18 Mar 2025 03:13:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNJg-00000004TEP-0tMi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267312; x=1773803312;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZEBqaG+/lKPqTcu2zNT1xpn2hWeJ6QQfZLTvGeGhISU=;
  b=iVY1HARSNce9S7mSXqzFHR5HuxYjaVRrmHYdRtF9LYJ0NDmWlvD+ckr6
   YdgjVamTzHTcuD3jXSzCUownE7kOPUVuk+pdIeUZUV0IxAaYvMQDDWM5Q
   oMYzOHN83fxkhyWXPx6VFAE+XAeZ443vIgNFX2QCC+cCTwbMRPw8V9hUr
   qsA7LH3Cs190JOq1EzClT/a7v/0Qn/dn+dvpslOBsi7S0u9/JJS1lnQDA
   kW78Ml9xoEmDq38Ul8nkxzZ0wO6h8bw51gQbMokXsEzEOjxKH0NCCo5Xr
   hmT0EYRhcyj5Fqo05MgKfrQIxQwSuoZ25wAJqd4OlQh+Q+ebgJq/0RrUi
   w==;
X-CSE-ConnectionGUID: 298zm+cvTvaMbNtu9LAeRQ==
X-CSE-MsgGUID: F7v37mq/S2W3s3kUDGZv4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54382876"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54382876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:08:31 -0700
X-CSE-ConnectionGUID: QY9YH/n2QQe2wbUB3ApTTA==
X-CSE-MsgGUID: u40T4e8SR9GDudO0U8XKNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126313693"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:08:24 -0700
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH iwl-next v10 01/14] net: stmmac: move frag_size handling out of spin_lock
Date: Mon, 17 Mar 2025 23:07:29 -0400
Message-Id: <20250318030742.2567080-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200832_301014_5DF32FC7 
X-CRM114-Status: GOOD (  10.96  )
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
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Furong Xu <0x1207@gmail.com>
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


