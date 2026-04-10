Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4ABF36B9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgFHpcBi1vc2xoyxBIBDm0qPJGRIbY0TC1t5JEluQ4I=; b=j3B5p/LWEzK1FVddJavnq34Mgs
	n6cssh5/gdQh58IHdxBjZ5q4xkWw9AK2C5i/yjHvAJ6EZgvp7dH5c4KLnqX9Dhill+wmUG/AcNmkQ
	bo7m1/TG1XYjhlC6WKFWUUhYt6WGGh+woawF7JOYuFdSXwpmnUI5bXTpJClUzq9XkfzYOcKNG0vPB
	nr07ULsb7II8ltdG8KjLBCn8cApkee5XKHsZruDiFaEMLn3iQTo2U/V7J818jtKqivbCUl7yZFAZ/
	bOX6AHX2icc6Mw7uISPy1m7Phg6pU8TefYShiwNhzHp7lSdmR3TA0o35pwhf5KR5Acs/l/sGJiCHH
	dmyNk3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1fd-0000000BThD-1fBc;
	Fri, 10 Apr 2026 02:32:33 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1fa-0000000BTgW-27ea
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 02:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775788350; x=1807324350;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wVncFe7SIQwq8Kgb0H/3/ttZShv2kknMzmQX3tCdVuU=;
  b=Dbp80PgZBbiTc7fOt7AhhqOPp0FzIzzKYAGMeVe7PpA/6FjJbumycXMh
   LSLlVZIj1hjjNVb4J+aV4OSkntugGmxRlBI94WDfE+0MH7H+J7iCNLX+f
   /ut4EEMjbWQLGb3O4c9ebmstlWJe5525fVVDOi95QcB7GxhwNmyyZpbd9
   9S/x4iptcZuFBvr0Z5b71bLeuRj50wNNZo0Wk0FKcw2ozKtJ9dv5mm9ao
   h+rzMDS2paLhkfk84+0d/WReMKjB1GFpjGNg1wSha34di1NbJ/X1o/+qd
   MjhHMAMHmwJTZEVF9+zf8kgyXArO8Iv/94T24HSPQlw85M0pfhvU9ndVt
   g==;
X-CSE-ConnectionGUID: a7LLlRjiSkuoUYX9V9wQAg==
X-CSE-MsgGUID: A0vVWRnVRn+UNQhfAO5GTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80399270"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="80399270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:29 -0700
X-CSE-ConnectionGUID: /Q0DNbedQzm+3Gr5cJESAw==
X-CSE-MsgGUID: Z2bwjH9kRGqDrIYeAmS7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="224214256"
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2026 19:32:24 -0700
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
Subject: [PATCH net 1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
Date: Fri, 10 Apr 2026 10:07:35 +0800
Message-ID: <20260410020735.327590-1-khai.wen.tan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_193230_650057_724D6D26 
X-CRM114-Status: GOOD (  10.52  )
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
mdio_bus_data->default_an_inband based on reading a SERDES register.

Therefore, we moved the priv->plat->get_interfaces() to be executed
first before assigning mdio_bus_data->default_an_inband to
config->default_an_inband to ensure default_an_inband is in correct
value during PHY setup.

Fixes: ca732e990fc8 ("net: stmmac: add get_interfaces() platform method")
Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
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


