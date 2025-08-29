Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C42CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vy6YAO+9ijcxerFDApcAmJBpLGwTnAOTEL8tEqUKCDY=; b=kGiH7Z0OQbyXl+ZWWmb+YNUB8l
	U/Xp4lZINVqwe3cMu5iF/AXYb1FusGEyQ/pqqVT3eYR/SiPn7ouXmLFYlw1oAKOHVdxdn+sNJ4HKg
	cIGAxYwTmv+IYSvTKtzGu46ZfIE+XKeRHMZ9bK1M8gtU+DTWJX1vJ+0YNh0HBJcLmeTx76s+yMBTh
	bLe49mKh/928rq2ZBDxpXmfKJcuCyeiNoM4M/LXjlFBmvflU7HpER96OGkfsaVB1QA5NpRTmb0ucS
	mQXgQUywjsEaBhTW00uae+P1i5lOFRmbhjWutKrTANMc616F1xPikhvsSQko+OucbjKNxGnF+6QT9
	W/ivUkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvbK-00000005BWK-1zJD;
	Fri, 29 Aug 2025 09:40:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv0J-000000054T8-0ose
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vy6YAO+9ijcxerFDApcAmJBpLGwTnAOTEL8tEqUKCDY=; b=PcS1jOtT0ZJ4xMvfp+zOSTYqCp
	vXHpAITooj7Uecu9PRmfUiscGy4obgyJDi6Ckjaw9QDqVE3qDTvxx19yyeKKKqVIKkrG80iPNiPxs
	rJs4uqt4gvLlEOf8CST/78rry+iP0JMSqFbwveXH+/eWGNKycl5kLZBlssJeni0rxWCCBI/nOfmZ8
	ivOR0uHoFMGc1MciGs9FhRlGqxFlEj130/WNyJGXDfL59aw/mCDMWMM3bNijRH/IFiodxdLHoxEiI
	a2QTALzZ81kKTtV1HW0hsieE5gfPAJHGzxDabLcQE80qi6nWIPSfP7mzhbO0OToNopp5ZAAupiIz2
	zoaXcwiQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38032 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1urv0A-000000002Yh-2DaM;
	Fri, 29 Aug 2025 10:02:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1urv09-00000000gJ1-3SxO;
	Fri, 29 Aug 2025 10:02:29 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: mdio: update runtime PM
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
Date: Fri, 29 Aug 2025 10:02:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_020239_503370_502A3344 
X-CRM114-Status: GOOD (  12.30  )
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

Commit 3c7826d0b106 ("net: stmmac: Separate C22 and C45 transactions
for xgmac") missed a change that happened in commit e2d0acd40c87
("net: stmmac: using pm_runtime_resume_and_get instead of
pm_runtime_get_sync").

Update the two clause 45 functions that didn't get switched to
pm_runtime_resume_and_get().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I don't have any way to test this on real hardware as the Jetson Xavier
NX doesn't have a C45 PHY.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index da4542be756a..0a302b711bc2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -303,11 +303,9 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 	u32 value = MII_BUSY;
 	int data = 0;
 
-	data = pm_runtime_get_sync(priv->device);
-	if (data < 0) {
-		pm_runtime_put_noidle(priv->device);
+	data = pm_runtime_resume_and_get(priv->device);
+	if (data < 0)
 		return data;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
@@ -399,11 +397,9 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-- 
2.47.2


