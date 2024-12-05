Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vuVuSz1ikyfCg09UlbCqoDgZ9MeD4Xre3c4jOWt9Zo=; b=FJzNPg3nEFmWTnZbzevyoGWCq9
	/ZorTq7JKf4K8rqKDcK5ZebNlZwgPWGJU1Frzfs/+eWlTV/c+cuYt3vb2j0y63GxF/KtDXndbaAOP
	YeVzwFvhGxZWLf4zUR+X9B8QW6yOqwPyZqHZ1RTMuOCIwbbq+wYxNNg67o4OedFBJQlKXAFrluyv2
	WOTuD48OEDc79Ac1X4Ky6Got0qdqPfvR/VNwMiPzYaJV3YDekpPh2Ru2wwy7Dd+/A6qZFIrs1M1g2
	7pGCnexAB6RaOiD7y8KuwGWjNVni1Jral7oCTSB/m0LaZjedr4l4A3SQozPGNBUv44cFjK3xgJgBT
	HVT/sg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Qb-0000000FPJd-2cBt;
	Thu, 05 Dec 2024 09:45:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Pa-0000000FOs5-0tO8;
	Thu, 05 Dec 2024 09:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7vuVuSz1ikyfCg09UlbCqoDgZ9MeD4Xre3c4jOWt9Zo=; b=HEcRky85EwU1g0js4DcqNJdJeF
	Pful7qFqOyJByMWBEF8hwNdiMb8KgxMeQROWtoxp75zIDjuZfB/4jG7or1yJEBofi6vtvs6sMwjuB
	q4lprrbPOIXwj2tdIk0UBXKLAUq1fiMk1hRFg9hBVcaUPSlTWyi6tKC1g2hHAG9mGnxaKm+nkd37d
	QbJSm+xe2DPMb7mwg/pmbSDAKU1OAGWEet079h7Ti9SDqYbCp/mka/bjk57RCkJcotiU25zgskTew
	eOhQAxNCeceJC6SGFMSgy/54gV9k4u8pJY7QfW0gflEOQHQAM4qTToVUcD4MwbVDN6B0B0v3okBZu
	ygRujPkg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59736 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tJ8NS-0004U2-2B;
	Thu, 05 Dec 2024 09:42:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tJ8NR-006L5P-E3; Thu, 05 Dec 2024 09:42:29 +0000
In-Reply-To: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 2/3] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Dec 2024 09:42:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_014442_246942_F5D3FB6D 
X-CRM114-Status: UNSURE (   9.60  )
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

Report the PCS in-band capabilities to phylink for the LynxI PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 4f63abe638c4..7de804535229 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
 	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
 }
 
+static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
+					      phy_interface_t interface)
+{
+	switch (interface) {
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+
+	default:
+		return 0;
+	}
+}
+
 static void mtk_pcs_lynxi_get_state(struct phylink_pcs *pcs,
 				    struct phylink_link_state *state)
 {
@@ -241,6 +256,7 @@ static void mtk_pcs_lynxi_disable(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops mtk_pcs_lynxi_ops = {
+	.pcs_inband_caps = mtk_pcs_lynxi_inband_caps,
 	.pcs_get_state = mtk_pcs_lynxi_get_state,
 	.pcs_config = mtk_pcs_lynxi_config,
 	.pcs_an_restart = mtk_pcs_lynxi_restart_an,
-- 
2.30.2


