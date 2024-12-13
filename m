Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9137FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnbzjYFJC7QCn5g6ZiNpVxr72nno0JcTQWP0iYxpqpc=; b=zXx1A83zEIbwexSIuMA9Jgb4km
	1naDq+dpfJk0s25JobNlVw3BVaW7mxx6Am85V98vIC+5yGdcoPAZYm+06LjNTFAil25yHIlpQd0+4
	qknJEEh9DEEiiveK/xaEpy9ma1o+ss8+TlGjcjpUESJr0IQI4vJR6czBDml7XParQvVi/RBaB4p0/
	9XteUgYMu/vu5IXEiFKtCRz63qcOoTrFoWAptmPvR/ALL609pQ06KE0KXjx/VrcV3pzpoksu12x/d
	1PPnfrt3mD9HecDObkpEP+R7Y2tzgZkQVV0r6WnK+maKbhQRhs/VuaeQQHGVfLWnJ/9NAximh8FE/
	i7tULWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBSV-00000004oUc-3noA;
	Fri, 13 Dec 2024 19:36:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBRP-00000004o1I-0Bvn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pnbzjYFJC7QCn5g6ZiNpVxr72nno0JcTQWP0iYxpqpc=; b=xummMPINdqRamBjSov0p819TXB
	ALjkFaYS3mgw/pTnEHaXHZ6sc882vTo53cevOgCSHZELyZTa03evhpiJSPd866JOMDsvsx4KUTgYm
	WnLSFygA71xLrh/K73uDFmOdlif45PAgGy3OcdB8fkp/7oFwMPiADH1yroVLwyW5kaEDYLm9j76sG
	j2RyrdF9kVVR2yKr3CEFaSClAyAESPMDGPQFQ0DPYqrTcqYLlw9EbnM0DTxLb03ixoCoxKlZfy6YU
	vLPQZgnP0+bUxk2Aky78dbY84/RB1dtw/0+YwDHVho+9OMx5GY5qsCXA24nKk14hxtfLjm9YB3Cr5
	x+zTpQ4g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41828 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tMBR7-0007DA-2X;
	Fri, 13 Dec 2024 19:34:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tMBR5-006vaS-Ou; Fri, 13 Dec 2024 19:34:51 +0000
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	 Jose Abreu <joabreu@synopsys.com>,
	 Andrew Lunn <andrew+netdev@lunn.ch>,
	 davem@davemloft.net,
	 Eric Dumazet <edumazet@google.com>,
	 Jakub Kicinski <kuba@kernel.org>,
	 Paolo Abeni <pabeni@redhat.com>,
	 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
	 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	 netdev@vger.kernel.org,
	 linux-stm32@st-md-mailman.stormreply.com,
	 linux-arm-kernel@lists.infradead.org,
	 linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/5] net: phylink: add support for PCS
 supported_interfaces bitmap
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tMBR5-006vaS-Ou@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Dec 2024 19:34:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_113511_084940_4777C29B 
X-CRM114-Status: GOOD (  17.03  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 +++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 95fbc363f9a6..3e9960f54550 100644
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


