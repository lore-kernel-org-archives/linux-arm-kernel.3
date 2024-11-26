Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28EBD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vuVuSz1ikyfCg09UlbCqoDgZ9MeD4Xre3c4jOWt9Zo=; b=xGkAoZrTEWUDW93aqc57aiClZD
	nCs+eQR7R5c4mARLyNU6lPECb1rPdQn/HrBJ2eukrwOxOWcEhPrzG6lfbkJ1+dDT+qucH3+3VQyIC
	MAqosnaqOeM7mv7rs93bgKyW62UZBhD4+gueva18AM+wC+rCbRwredXm3Pj7PAFXYnY8XPIIeil+L
	7xnVp/TVZs0BkrYVlCpCtscGnlRUZGopnhcpx7az2Ag5EtEGGCpzlstdMuEb5wBxIavuMCPbtkrQ0
	vepkjwrxxMjvJULgad9uUYd9hOXPDZJwV3SD/Gv3l/JtqBHT46zHt/AB8Az1XQJA0UZugCY4ORYCa
	14TKcIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs3B-0000000ABjH-1NeQ;
	Tue, 26 Nov 2024 09:40:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrp9-0000000A8fs-0k9w;
	Tue, 26 Nov 2024 09:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7vuVuSz1ikyfCg09UlbCqoDgZ9MeD4Xre3c4jOWt9Zo=; b=R1xRbhVbO3X3ElH4ipfqT/sK3y
	szMeNVq21WHN7qs2wvbMNb9qbnbl+JF0622GZnG45lZ7rCpOo0YHbU7o+85uWT+w2L7CjTC2Rkb1t
	mHjvzLol0WlhBZqsmSwDg3akFga0vh+UxwtRjBEv+MiFJiAviKNqrr9vPLNZjNZPDcrNhuUa1jNNs
	OZVkCwdwVeJum3obf8al8s5xLMohBDAzUW6bnh/RXS8ySAWrKWPgFQvaFZ0n+nrVTn5Wd8cfd3kqN
	+VMC6lrnBch4o//zG6joUVGNaAT4cs3O0BtThbsH+dayQXFhN11VecEBXxGPv+zzxFBN8Y8gVhoN0
	hqvDMV0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35162 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrox-0006Vi-25;
	Tue, 26 Nov 2024 09:25:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrov-005xQq-W8; Tue, 26 Nov 2024 09:25:22 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 13/16] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrov-005xQq-W8@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012535_212105_526A1895 
X-CRM114-Status: GOOD (  10.18  )
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


