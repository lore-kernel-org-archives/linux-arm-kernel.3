Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD2CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh6AFhinNITQqNLY1hSWIvQH3NkLkA7t+Dx3cTizntA=; b=jROredhQdQbrBM37c0CNP7q3nr
	Ry0e71qwhA+cjKgZwE/U8piBA1J5PthJ5/xiq1nlJg32Xzmcz3oM9dqnAd3GLujfYkSYERxWmbJpF
	r4/v2Hl043S9CvCdi9fnFTy/cKIPkXBkmN9o4XZc59rzlb6G57BzX2N16qsHQ1EMMbjBWJ39dA+wG
	u6z7J0/j/QL0abeX3ajYaw6H50h5ZoJYSiOCbJDo58nk8/qfBRtl02w0jL9Q1Sulxp7PZAryl5n9K
	xOzRmWr3+nQW2Rsg70pNdzQaZY2iEvOnliV1n6ic7aFWMgNyBdJL4qDR8HpsGL/IqqhFBovASHocG
	+BKcEBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfBu-00000002Z6E-0Ady;
	Thu, 11 Sep 2025 11:10:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfBr-00000002Z2T-1enb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yh6AFhinNITQqNLY1hSWIvQH3NkLkA7t+Dx3cTizntA=; b=d6Z1uDhHOvu5nZrz/WgkmSA3AU
	SDosRHgjqTqT3Icp6Xe1/dHHw0k6QFTIE5XImnfLDb3FAG+ZxX+p9iAP0gSHlOJXosT1NJqdGBRls
	SApiVDL/c2G1KbSZvAmYgKfjZnDTWemUABPLwGBqHXHcLFjJN1f3cQw9JqvB4xhr1lWFzuBn2okSK
	wzMFb/Uxj4SPJQR3D1zXg6+nbQV4V/2r+aOQho1hbhCwSQ3zLJWJ3BEkALWSZgFSVGGWJ2YJeeQvd
	Cqc2c1WDBFy5NyRhycC4On5xeAEV+jfnsn3FPf6I8ynBE60/9Wm4JMLOujbgeAHUVlxTRPd5wr8tg
	mcLzY5zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40158 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfBe-000000002sv-2oNZ;
	Thu, 11 Sep 2025 12:09:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfBd-00000004j8p-2lDi;
	Thu, 11 Sep 2025 12:09:57 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 05/11] net: stmmac: unexport
 stmmac_init_tstamp_counter()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfBd-00000004j8p-2lDi@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:09:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041011_462166_FCCEEC35 
X-CRM114-Status: GOOD (  11.20  )
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

Nothing outside of stmmac_main.c makes use of
stmmac_init_tstamp_counter(), so there's no point exporting it for
modules, or even having it non-static. Remove the export and make
it static.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index ec6bccb13710..151f08e5e85d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -392,7 +392,6 @@ int stmmac_pcs_setup(struct net_device *ndev);
 void stmmac_pcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
-int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
 void stmmac_ptp_register(struct stmmac_priv *priv);
 void stmmac_ptp_unregister(struct stmmac_priv *priv);
 int stmmac_xdp_open(struct net_device *dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8cb1a97e18af..efce7b37f704 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -726,7 +726,8 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
  * Will be rerun after resuming from suspend, case in which the timestamping
  * flags updated by stmmac_hwtstamp_set() also need to be restored.
  */
-int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
+static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
+				      u32 systime_flags)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	struct timespec64 now;
@@ -770,7 +771,6 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(stmmac_init_tstamp_counter);
 
 /**
  * stmmac_init_ptp - init PTP
-- 
2.47.3


