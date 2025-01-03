Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BCAE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHO73eZ4Zyam8xJy0OuivfQ5bgy3B7zgOoSDsnku8tY=; b=Wph8FqnIoSOUNng4NkgkD/qYYv
	PUOJAx47bGqZNATFbo+3idaEi9rVkY7J3HBPAs55HF0YKR4uu+7v/1b+gOO+700gfZjoe1vq6Z6OD
	SpfpLrxT7DHjvM3QctPPEd10p5AGUAGZ54Ax4pFuDZchfHSUGH4QMIUXuhq5+Y7SfYYDF+Q3HsR2e
	F1xlfk3VUzukMkmCdK2T16jViuqX7rij+wT//K5xxioh/YNWsE0JML3XdpjStbhsZ8BN749UdzVkG
	QuKx85nnicmnUviUTIpqSqZqlxIlrcX40pXs5zcobOQ7n7MQDRtZxol3HJpZGbnW1ZalD1kch34Ao
	hel5Byzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfhi-0000000CoaV-2ueq;
	Fri, 03 Jan 2025 11:18:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTffd-0000000Co4T-1sA8;
	Fri, 03 Jan 2025 11:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mHO73eZ4Zyam8xJy0OuivfQ5bgy3B7zgOoSDsnku8tY=; b=k+Yvh/tL2iCshIm06FH3fLQiHp
	23biTiZNQUVZ6llbZgdfWBYIVvYNZTGT7mlsLiU/wKJmO62waJeX/NpVSUkVlBHHeZK6dKWl9omyf
	Du6vlY/iaURiMJu/aFwv2OcdTcJB/ibt5w/SstS9kB5DUH9jbaeCkc58+Ne8xfSHo30nVnoErlsBd
	VHgsL8GrnFcboYNuyao/a4ZqWr8XMogZIsLxDZOrGJWiueWrXGNE+GaYBRt5PhPRNPrkKM8sCldYL
	lXJEraFGCM6EScJABIkeAgbXHr4f0b1uqzAfHa1rKHhXZWk2IBwj5+16Yyr6pqDYJ9LuLwBXbFk1R
	q2a59OFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55396 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tTffN-00030A-2o;
	Fri, 03 Jan 2025 11:16:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tTffL-007RoD-1Y; Fri, 03 Jan 2025 11:16:31 +0000
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
Subject: [PATCH net-next 1/6] net: phylink: add support for PCS
 supported_interfaces bitmap
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tTffL-007RoD-1Y@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_031649_493909_5205F332 
X-CRM114-Status: GOOD (  16.80  )
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

Add support for the PCS to specify which interfaces it supports, which
can be used by MAC drivers to build the main supported_interfaces
bitmap. Phylink also validates that the PCS returned by the MAC driver
supports the interface that the MAC was asked for.

An empty supported_interfaces bitmap from the PCS indicates that it
does not provide this information, and we handle that appropriately.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 +++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 6d50c2fdb190..31754d5fd659 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -691,6 +691,17 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
+		/* Ensure that this PCS supports the interface which the MAC
+		 * returned it for. It is an error for the MAC to return a PCS
+		 * that does not support the interface mode.
+		 */
+		if (!phy_interface_empty(pcs->supported_interfaces) &&
+		    !test_bit(state->interface, pcs->supported_interfaces)) {
+			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+				    phy_modes(state->interface));
+			return -EINVAL;
+		}
+
 		/* Validate the link parameters with the PCS */
 		if (pcs->ops->pcs_validate) {
 			ret = pcs->ops->pcs_validate(pcs, supported, state);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 5462cc6a37dc..4b7a20620b49 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -393,6 +393,8 @@ struct phylink_pcs_ops;
 
 /**
  * struct phylink_pcs - PHYLINK PCS instance
+ * @supported_interfaces: describing which PHY_INTERFACE_MODE_xxx
+ *                        are supported by this PCS.
  * @ops: a pointer to the &struct phylink_pcs_ops structure
  * @phylink: pointer to &struct phylink_config
  * @neg_mode: provide PCS neg mode via "mode" argument
@@ -409,6 +411,7 @@ struct phylink_pcs_ops;
  * the PCS driver.
  */
 struct phylink_pcs {
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
 	struct phylink *phylink;
 	bool neg_mode;
-- 
2.30.2


