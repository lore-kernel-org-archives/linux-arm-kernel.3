Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB1E9380B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 02:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5eMBXzSEAO7BufTTyEROYYDXiefQqA9u6INAxla288=; b=04TquPdmHCoxbu6fK2oLm1V/WE
	lOuuNnJHSotQj2pI40kSZC/r8nDW4CMeN1Xefj6JA81+44cV3BBMzhHdnAngGd0CfumKsYcsxIuUJ
	foZzMxSlXEdLXroRiRe+wTvfGY/n/U6xsCKBLD5cJqDyAUpdhYI9WFr6aAko1LSDVf3gnfLgQX1n/
	UomVjYrxeKmliYO3eHpUI3N8lc92rX57bqgdmM1/mNiyExxw0JIuySbjbAYgN+uk4tzzBxXqjrvKL
	637kn7Cx5jO/62L8In1+L0P4bir0FDkyTUGH7tVI6Gksv5p9g7bgopv9wLhB1Pbz9BX8M8dInDhR4
	LC5RwpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC70Q-0000000EsEC-2DxU;
	Mon, 13 Apr 2026 02:26:30 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC70N-0000000EsDr-3ZCP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 02:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776047188; x=1807583188;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cYFFXHwwvGuibt1PZzWRliLfIKEX30gWC7CvWsMh4B0=;
  b=IfzB4V0D/4LAn+tZ4U2l/JJK251ugzgaAH9nzuOFIWQ+4XPl2lwwjpN1
   ntva7X+knRF9R5VSLRne1VyqsoN+iTOAIq+KNdwVe+C253MltwLmTb9bO
   qchkasr0ikWbcTfT1/WeCA+0baHuDYxu/a4IK/z9blisPpFZh+8G8aJxq
   PLRY9+Fnrd7VBmBsII1ootcrr/ujdufsKZVxDMoKg0EbsO6Xwx9lEIbkq
   WZhnQn8FBSbBcKbIc9aVlMHM5FuIqAzSxQLvQDokcn7cn3NP34EKeqXOL
   ibKuoRX6ojGir/W84qu7O6riCEsvwLeY2jtjSyKHJtHMALNcQBNyC8j8L
   w==;
X-CSE-ConnectionGUID: HqPf++L7RhuZPVmwMO49Zg==
X-CSE-MsgGUID: /Ikr8c0BRZeMK2pZ4IfZPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76885980"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76885980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 19:26:24 -0700
X-CSE-ConnectionGUID: jXtFVFBiTOGC3ltGX6nwmA==
X-CSE-MsgGUID: XXTjSMEWRLGlIxVqUw5xug==
X-ExtLoop1: 1
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2026 19:26:19 -0700
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	ovidiu.panait.rb@renesas.com,
	vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yoong.siang.song@intel.com,
	hong.aun.looi@intel.com,
	khai.wen.tan@intel.com,
	KhaiWenTan <khai.wen.tan@linux.intel.com>
Subject: [PATCH net,v2 1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
Date: Mon, 13 Apr 2026 10:03:39 +0800
Message-ID: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_192627_943106_050287ED 
X-CRM114-Status: GOOD (  10.48  )
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

get_interfaces() will update both the plat->phy_interfaces and
mdio_bus_data->default_an_inband based on reading a SERDES register. As
get_interfaces() will be called after default_an_inband had already been
read, dwmac-intel regressed as a result with incorrect default_an_inband
value in phylink_config.

Therefore, we moved the priv->plat->get_interfaces() to be executed first
before assigning mdio_bus_data->default_an_inband to
config->default_an_inband to ensure default_an_inband is in correct value.

Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
---
v2:
  - update commit message for better understanding (Russell King)
  - corrected the blamed commit (Russell King)
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260410020735.327590-1-khai.wen.tan@linux.intel.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13d3cac056be..c92054648a7e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1345,10 +1345,6 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 	priv->tx_lpi_clk_stop = priv->plat->flags &
 				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 
-	mdio_bus_data = priv->plat->mdio_bus_data;
-	if (mdio_bus_data)
-		config->default_an_inband = mdio_bus_data->default_an_inband;
-
 	/* Get the PHY interface modes (at the PHY end of the link) that
 	 * are supported by the platform.
 	 */
@@ -1356,6 +1352,10 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		priv->plat->get_interfaces(priv, priv->plat->bsp_priv,
 					   config->supported_interfaces);
 
+	mdio_bus_data = priv->plat->mdio_bus_data;
+	if (mdio_bus_data)
+		config->default_an_inband = mdio_bus_data->default_an_inband;
+
 	/* Set the platform/firmware specified interface mode if the
 	 * supported interfaces have not already been provided using
 	 * phy_interface as a last resort.
-- 
2.43.0


