Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F90D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RyK+eRRBkE3UgpmRoyI5D1IfX9f6dcXT9xzKKqqf4w=; b=Qfw3YDbjFhxhkd3ztWbb5uzRKP
	9FofPGEAkucATS8Wlimimnj0XxEjuDLGyw9DdUjQE34mpA0skfHYigIiF4VegKwnnQccjurnRJHbg
	+bZAxiBCGkvGq71G02ZDjozBwdNMH0rwLxkhAtoEH+w9J74uzkdEdw5Vn3hJZIS/0DbIB7CIEZD8U
	39xGOUP0nMCzGGxxLbWoRibOkcDjo9f4QIO9dds8MWGJyZ+EYEugkLnCyPCkVthtIoRruodmYNISm
	gL3H9NWmkV6zqc8ChHq2n36BI6SmHcj8fd+tazDndKRoZ3k7VOqtJHI2n5OVtLPN4nptz6otpuV/+
	XB79J4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puB-0000000ECmk-1YlO;
	Wed, 01 Apr 2026 07:22:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pu8-0000000EChy-33zv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+RyK+eRRBkE3UgpmRoyI5D1IfX9f6dcXT9xzKKqqf4w=; b=FsrWPQtp4PB+mQdaxpcBKCI+DJ
	IipB2NibKru4keiDwcnEEdL08zMlSpXrbhzh3rb0tr5Fr1fa+eYdui5MNI+otccMVgVHfVbcZWtTr
	/UgLuMbM+6qw8DwyInFAhfQ69CjRYGUUoa75ucJQV+cJ3QtEVB1BiSLRzRbKwx1SSZVy45MN1sXHf
	4O8YsxBHygkfvlTwUN1zuzwpCwk/MK+nZjHDIKNQYvswRUyXr79FEyznq1ExXNO3Nb1HvC+Ri/YTc
	J7KXwiQ0j0hdqIeraBRhcN20PDyqgsQy00NicEiHaNcE9CHex+cPqdpCcyTy/XZaTNitr01OYavN6
	hnkFl9LA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59448 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7pu0-000000002ir-3bCU;
	Wed, 01 Apr 2026 08:22:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pty-0000000Eatt-2TjZ;
	Wed, 01 Apr 2026 08:22:10 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 12/14] net: stmmac: add warning when TSO is
 requested but unsupported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pty-0000000Eatt-2TjZ@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:22:10 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002220_773449_BA018B11 
X-CRM114-Status: GOOD (  12.37  )
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

Add a warning message if TSO is requested by the platform glue code but
the core wasn't configured for TSO.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7134f6c6075b..5286ad6412a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4392,8 +4392,10 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
 		return;
 
-	if (!priv->dma_cap.tsoen)
+	if (!priv->dma_cap.tsoen) {
+		dev_warn(priv->device, "platform requests unsupported TSO\n");
 		return;
+	}
 
 	ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-- 
2.47.3


