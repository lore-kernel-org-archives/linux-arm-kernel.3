Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3566D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpTJ7ep7WjNgRdD+PpFVRfcu1rVLPyYDfT8jjGhsaVw=; b=VuGmazAv9ilI9FIAqQfTcBWnlR
	hZHzCwb7Lv3zR/VF6Jd1HBWsEJOEePdZRDPT1PSi9wj4qx/NCvsZvmlgXBiIwzqknRW6Ud9cRIKUC
	y/TZPp8qZe6ArdC8SE2kCtFL8y7Zulxw9O7jdjh7AqA7b/jIc9vVz2lXfkgpeA1s9LesVwNfNAPy0
	2c+P6FR+S67GvZ77Ud6ZacQcjSnSbYv3ulbOKdYuFZcPXe+QZ3cjpgWlTDYz5A5thCDsfbXC43aU5
	mnz8Mkm83NM/8gNXVMebveAWv+hcpI9FNn7LuARcO/jFKhsolT9xMw+3WxhqDPpOeVhD6nT5Up9P6
	05dJIX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs6x-0000000ACPs-16Sb;
	Tue, 26 Nov 2024 09:43:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrp4-0000000A8di-1NlC;
	Tue, 26 Nov 2024 09:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CpTJ7ep7WjNgRdD+PpFVRfcu1rVLPyYDfT8jjGhsaVw=; b=LnPuZ5cM/QCEy7/toUkkCR2DJI
	Kmc7f/FM73ibcxdv6sLAU1AFBh0/aRfTwx99wKGolnP5yH6geh2UAbUIHttlBji/1UOkqbAK06aVv
	TIfJ/qp0eftWm07O0Kdc68e6y+MvMl/UgFFte7as5W2iQfmE3sZbU7od5JXmipeosu//+E3XeFxro
	3gwxNoZhxeTF1iohFsbs+9yT5Ryzld0oYvjEdOyAS4f4YrmUtirsT0ccfwmKCaty3mzm3MxjOLafp
	MDQCjHy9ZkJMUFzjIks9aiPe7jEny+2bUHFJpqCa6t22ss1TpTy/ggYdUzWbQWPaEnJWpBIwU+ZxK
	sGC3dkcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35156 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFros-0006VM-13;
	Tue, 26 Nov 2024 09:25:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroq-005xQk-SU; Tue, 26 Nov 2024 09:25:16 +0000
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
Subject: [PATCH RFC net-next 12/16] net: pcs: pcs-lynx: implement
 pcs_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroq-005xQk-SU@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012530_365970_B7F58785 
X-CRM114-Status: GOOD (  10.53  )
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

Report the PCS in-band capabilities to phylink for the Lynx PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-lynx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index b79aedad855b..767a8c0714ac 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -35,6 +35,27 @@ enum sgmii_speed {
 #define phylink_pcs_to_lynx(pl_pcs) container_of((pl_pcs), struct lynx_pcs, pcs)
 #define lynx_to_phylink_pcs(lynx) (&(lynx)->pcs)
 
+static unsigned int lynx_pcs_inband_caps(struct phylink_pcs *pcs,
+					 phy_interface_t interface)
+{
+	switch (interface) {
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+
+	case PHY_INTERFACE_MODE_10GBASER:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return LINK_INBAND_DISABLE;
+
+	case PHY_INTERFACE_MODE_USXGMII:
+		return LINK_INBAND_ENABLE;
+
+	default:
+		return 0;
+	}
+}
+
 static void lynx_pcs_get_state_usxgmii(struct mdio_device *pcs,
 				       struct phylink_link_state *state)
 {
@@ -306,6 +327,7 @@ static void lynx_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 }
 
 static const struct phylink_pcs_ops lynx_pcs_phylink_ops = {
+	.pcs_inband_caps = lynx_pcs_inband_caps,
 	.pcs_get_state = lynx_pcs_get_state,
 	.pcs_config = lynx_pcs_config,
 	.pcs_an_restart = lynx_pcs_an_restart,
-- 
2.30.2


