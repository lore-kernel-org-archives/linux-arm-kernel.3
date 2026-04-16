Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B3F8A15B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+BdHshRdDBzIgmYo7x3AfQXwIjmxwkuyzWSkGfreww=; b=R/+Z4VxrxhGrRMqUKy7bMZu5Iv
	AIZqWarQvgtRuh1XBGSiR8jx/pkxaAycHYK+jUFTMGnnNpIPKnx/1nxUS1tw9BYq2hEqzfVeXRLDA
	rE26jXQcwkM2lHN8gekaKmAUZsVb2CBcv28jglX2aRMgHY8MSBonbYavr/qWkjqiCFJ7+cdqOx9t1
	Haikr7xr2iscAn65fNn+6C4go1yhHzfFpbKmmo3N5G2zCwVwAcbqKuuQnC20ydYbhzu1tHWiYc1DG
	u4CHqmMN4jjicaqguM503XuaVdmOA1spquhBHZeX5oY40KoUN1bdT0qArMehqbY5z7CvSFVTRlKdq
	3CBQxqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKHM-00000002KQN-3wBA;
	Thu, 16 Apr 2026 10:49:00 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKHK-00000002KPp-3XUj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 10:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776336539; x=1807872539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wXkfIYpS6b/Rm6RISVw0uD+Z7OPzR8Gm6AByQPr0xkc=;
  b=NL84u2OhkPNfRRvfD2LrlBtc1gq/PwWguvNGirBaA/UqQOrbcrhkcbor
   xaHltEeX/zdYcAjRNLEh6GurXigTSCv2mleSXyvFUzMI1viV/jSW5cLcx
   kvxgSOWWRYL054ZibYtR41m7bWRz+y/2SduE/zsSBOh4bkbt0Ae+8z+Nk
   Y80IpJ5LcDj/kTBG/anF2ouwCeuyv9gKesCx64oOZURIUAsCA6CSGhqjg
   VGr1OfPu299HBBOgOs6u/ZnPLGUD+4ToSTfOax+y3u9hncy8/bumEWXE0
   8fviOvFI21+O30gVQHn4NCZ03CnwlJsyry0M938rDYLhs0fSO6xgXZJ69
   A==;
X-CSE-ConnectionGUID: b30aQzDZTHinH7BrjUZbHQ==
X-CSE-MsgGUID: AQorlTChREiptIBVVRai+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88410756"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88410756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 03:48:56 -0700
X-CSE-ConnectionGUID: EuPlTi58RSGNxq0lcRmGWQ==
X-CSE-MsgGUID: imgnVKh1QGqItlImdg15EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235076890"
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2026 03:48:52 -0700
From: KhaiWenTan <khai.wen.tan@intel.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yoong.siang.song@intel.com,
	hong.aun.looi@intel.com,
	khai.wen.tan@intel.com,
	KhaiWenTan <khai.wen.tan@linux.intel.com>
Subject: [PATCH net,v3 1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
Date: Thu, 16 Apr 2026 18:26:09 +0800
Message-ID: <20260416102609.7953-1-khai.wen.tan@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_034858_956076_3088E489 
X-CRM114-Status: GOOD (  11.53  )
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

From: KhaiWenTan <khai.wen.tan@linux.intel.com>

get_interfaces() will update both the plat->phy_interfaces and
mdio_bus_data->default_an_inband based on reading a SERDES register. As
get_interfaces() will be called after default_an_inband had already been
read, dwmac-intel regressed as a result with incorrect default_an_inband
value in phylink_config.

Therefore, we moved the priv->plat->get_interfaces() to be executed first
before assigning priv->plat->default_an_inband to config->default_an_inband
to ensure default_an_inband is in correct value.

Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v3:
  - rebase on the latest net tree (Paolo Abeni)

v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260413020339.68426-1-khai.wen.tan@linux.intel.com/
  - update commit message for better understanding (Russell King)
  - corrected the blamed commit (Russell King)

v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260410020735.327590-1-khai.wen.tan@linux.intel.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 01a983001ab4..ca68248dbc78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1410,8 +1410,6 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 	priv->tx_lpi_clk_stop = priv->plat->flags &
 				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 
-	config->default_an_inband = priv->plat->default_an_inband;
-
 	/* Get the PHY interface modes (at the PHY end of the link) that
 	 * are supported by the platform.
 	 */
@@ -1419,6 +1417,8 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		priv->plat->get_interfaces(priv, priv->plat->bsp_priv,
 					   config->supported_interfaces);
 
+	config->default_an_inband = priv->plat->default_an_inband;
+
 	/* Set the platform/firmware specified interface mode if the
 	 * supported interfaces have not already been provided using
 	 * phy_interface as a last resort.
-- 
2.43.0


