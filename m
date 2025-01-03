Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80500E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fPVeRok7tYyHKGOJNHqGUAhct3mDxnPXluFsW2qsWM=; b=j5IALSY8ZnYcT8SYyEoC5SSAfa
	w2xONnSxZtNQDNByH49y4sphjf+hpKbTNdeRBkVg/SpiGlIocrHu1BIz55b4d4uJE82YMC+7OG8fK
	ZzCuZQTQWjIxYDuMccxLf4thE/C5lqusxbST/tFPTUyD1B90UZkvwK0uPnqPB1QlEi5of6h6xUTdA
	PjKoeiACndbnTVyTgs3eTaw8Ny7yYhvob+qiHawl6uRnW5/PS3A18ibZGuJWC5+3PoXKxHiPbC6Yd
	PPx7z26ObPQURi45f+5doV3j/q+yokJAuEngt/VyVYjj9tZxEfX00iWjBeJ9YbLY5IVEgIfKGTz+0
	W+paCrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTflH-0000000CpBx-2eVw;
	Fri, 03 Jan 2025 11:22:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTffr-0000000Co8n-1YjY;
	Fri, 03 Jan 2025 11:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3fPVeRok7tYyHKGOJNHqGUAhct3mDxnPXluFsW2qsWM=; b=gOefpy8xxs5g/L1BY+Zh8RPhQj
	v9KfDZSN/ifIgCYkqe781yncGB0YH4fGoElH1eC5LYFFI9M2MOf6DAGXcmDfGLooBdkujx5X1XBOi
	tqOKjWrTLKzx+8/FB6B18Y3o7ICKFHioYewNNR0KdPC/wjOLne5MnMloOeujheh+51WK/18y5hUc+
	V8kwKQ6mzN/FsYHidfWMW67ooW4EppvxiUiZCxhqH9n+QWahTgSgDznMDQcOAv3e9zDRDAmdl5Ua4
	mhEC7/GoL07FAZA8+OH8tjwu+DR6Euq+BzoCOZeI94cM3vRJEZHyHy6U9kwkp6aGSQoyPq23aQF0q
	/42PUrSA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50410 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tTffd-00030z-1d;
	Fri, 03 Jan 2025 11:16:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tTffa-007RoV-Bo; Fri, 03 Jan 2025 11:16:46 +0000
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/6] net: pcs: lynx: fill in PCS supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tTffa-007RoV-Bo@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_031703_442270_7033F528 
X-CRM114-Status: GOOD (  10.80  )
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

Fill in the new PCS supported_interfaces member with the interfaces
that Lynx supports.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-lynx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index 767a8c0714ac..6457190ec6e7 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -334,9 +334,19 @@ static const struct phylink_pcs_ops lynx_pcs_phylink_ops = {
 	.pcs_link_up = lynx_pcs_link_up,
 };
 
+static const phy_interface_t lynx_interfaces[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_QSGMII,
+	PHY_INTERFACE_MODE_1000BASEX,
+	PHY_INTERFACE_MODE_2500BASEX,
+	PHY_INTERFACE_MODE_10GBASER,
+	PHY_INTERFACE_MODE_USXGMII,
+};
+
 static struct phylink_pcs *lynx_pcs_create(struct mdio_device *mdio)
 {
 	struct lynx_pcs *lynx;
+	int i;
 
 	lynx = kzalloc(sizeof(*lynx), GFP_KERNEL);
 	if (!lynx)
@@ -348,6 +358,9 @@ static struct phylink_pcs *lynx_pcs_create(struct mdio_device *mdio)
 	lynx->pcs.neg_mode = true;
 	lynx->pcs.poll = true;
 
+	for (i = 0; i < ARRAY_SIZE(lynx_interfaces); i++)
+		__set_bit(lynx_interfaces[i], lynx->pcs.supported_interfaces);
+
 	return lynx_to_phylink_pcs(lynx);
 }
 
-- 
2.30.2


