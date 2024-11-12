Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C182D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EradIqKRVAwlOY51wXY8AuKgkvt+yzcN6MYPvIqBgrs=; b=duNwuPC8h5sqjuNSeY6ct4Dha6
	Hkx94pXD67poAsf2EAPYnKqzOJJZr7RWyl3UUXpAN0FQgLnY2pF/keZjdumK7bfKkqBi+3AYJ2PYl
	A03M/yhwXqK2LkTU6IMvzjnzmWsKhFG6K/sBb9A7xkKWvRWOy1MS53ujsdURGmdsVAx1WGT8hyU5s
	YkYIHlyWXaJK87LhS1M0m8uM9uawO7lwD/LjH0AKsM6TOL7RfaUriUFcNiAtHASovk4DcU2YNzYEi
	V2H+oiKz3pPitefDReCtUv5n5HvLSyaA/QojNVNx9DiwMDDQ9MEWk6KzgjfvGZO922KQPXsBv2vw1
	PPbT1WfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlMS-00000002TRT-48Wh;
	Tue, 12 Nov 2024 07:30:53 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlHE-00000002SgK-04g6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731396328; x=1762932328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HJUJ4+L4CnC/4Dsqig6kGVJWQvrMvkHAl3v7go1mWiQ=;
  b=Iqsw9gt363BmxZ0uDeHt+q790vK8Ry/JYXWAlkT6GvysFwP+mQP3nhjN
   4ojrA4aApDTqrvmCl1MUMbRZGI8Y7vj1DeLr/7VytFJBFtPPrxPBbTF8H
   C97qja7mDZzHlNa/X5Ek7fcAlT0rvRS5IicsMsSIn5TQ+nK7DVYmuCNcV
   +sjUP62SxnQv8qYBAGWyYoCsJSrkyWmU1lxyVSs+kzXrEzSt5hKifJuQ+
   kwvQWv251zZeprYS+LpnzqjXYt8R6sXPha+ZJ04Kw3Sz3l5TixnDf8RT9
   uR6ETk4RX5z2v4BFBLjCiv5TugPDJCns+saREloUfjitXj3hvXql7h84g
   w==;
X-CSE-ConnectionGUID: 8dmWt7oPRe2PYxhDBucB+Q==
X-CSE-MsgGUID: OzrwzCKYRJy/NM6xb5kZiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387820"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31387820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:25:27 -0800
X-CSE-ConnectionGUID: VJxMQNAyRCqk1YIV90zEkQ==
X-CSE-MsgGUID: CEatCA5dQICZymbRza30iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87074244"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:24 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v1 2/2] net: stmmac: update eee_cfg after mac link up/down
Date: Tue, 12 Nov 2024 15:24:47 +0800
Message-Id: <20241112072447.3238892-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_232528_126049_09DAB32C 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

Update the eee_cfg values during link-up/down to ensure that
'ethtool --show-eee <devname>' works correctly.

Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..1e16c2d8f951 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1005,6 +1005,8 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	priv->tx_lpi_enabled = false;
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
+	phy_update_eee(priv->dev->phydev, priv->tx_lpi_enabled, priv->eee_enabled,
+		       priv->tx_lpi_timer);
 
 	if (priv->dma_cap.fpesel)
 		stmmac_fpe_link_state_handle(priv, false);
@@ -1118,6 +1120,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
+		phy_update_eee(phy, priv->tx_lpi_enabled, priv->eee_enabled,
+			       priv->tx_lpi_timer);
 	}
 
 	if (priv->dma_cap.fpesel)
-- 
2.34.1


