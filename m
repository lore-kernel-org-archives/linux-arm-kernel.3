Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB90FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYHYMMQNyPankXBbRMqXeOpq9/s7Dc9NDhL2nVI10Tc=; b=HUYnhzo6mEalggOkBg0+vi45z3
	+Pb2MHd4tR/WlmHw7xo4sQel13+ZVbhwoaDUOnDo+6ecyf+kqnSXRAZf4i/aRG6Eq1BTJjMkeJh04
	lq6bGntyD6c3jMbT7jJ1JMzqNVHwoSEmuvCiQqOLPJXFwTRc196/kz/Ofy7aRgGq+uYLI+tUi/g3e
	Y5zjMJvmf/Ph6/VBfEAFCfrSHv22x0sTj1S6at2NJGQcDOcjREoBJQKEuNY9Cs5gKQW4Z1UtHB4Fo
	1DuPKH34vUz8ePffPNzmtJV3hBC+XsinHtrMTg4eOD1WxM2IM/Lag/U4AHV37VKlAt1BV0ZRfpUx7
	3ETLCKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoGl-00000005IF4-2nrF;
	Tue, 28 Jan 2025 16:16:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpl-00000005Cbh-20Su
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IYHYMMQNyPankXBbRMqXeOpq9/s7Dc9NDhL2nVI10Tc=; b=FrwZRmJHLwfATFGXy1APiwPtpZ
	UgRMGwPbUKOl6q/YhJHjQQ/SGeqERmGHvUophAT6qbpMZVydILqHaNW5ARqJfB0X6hutuiMcKr6uv
	4P1sykj+BYMkXnT4k8+lqoxeimZp+JaeA2bet5UBoasZ4qVUCSHR/MVVBSGAH/3rrw5zE4vv+uDuc
	Pe1nAlBRFVZC02ieB+m92ptWea/T1dnzmxR7FqLZHOyybC1J/w8/16Pa+shA2H3sv08ts94QIy5Fo
	VKN7NoK3mB2saz4rw6ArgaGFuEh2HRfuQU95PKRBJUqu+ae17awYF5/Sz7+0BypHOd4uMt6Z0LQMm
	ZLkiqV/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59948 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpg-0007Yl-2Y;
	Tue, 28 Jan 2025 15:48:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnpN-0037IC-G9; Tue, 28 Jan 2025 15:48:37 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 22/22] net: xpcs: group EEE code together
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnpN-0037IC-G9@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074901_515201_7A7342FC 
X-CRM114-Status: GOOD (  11.25  )
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

Move xpcs_config_eee() with the other EEE-related functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 58 +++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index cae6e8377191..ee0c1a27f06c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,35 +602,6 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-static int xpcs_config_eee(struct dw_xpcs *xpcs, bool enable)
-{
-	u16 mask, val;
-	int ret;
-
-	mask = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
-	       DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
-	       DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
-	       DW_VR_MII_EEE_MULT_FACT_100NS;
-
-	if (enable)
-		val = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
-		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
-		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
-		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
-				 xpcs->eee_mult_fact);
-	else
-		val = 0;
-
-	ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL0, mask,
-			  val);
-	if (ret < 0)
-		return ret;
-
-	return xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL1,
-			   DW_VR_MII_EEE_TRN_LPI,
-			   enable ? DW_VR_MII_EEE_TRN_LPI : 0);
-}
-
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
@@ -1192,6 +1163,35 @@ static void xpcs_an_restart(struct phylink_pcs *pcs)
 		    BMCR_ANRESTART);
 }
 
+static int xpcs_config_eee(struct dw_xpcs *xpcs, bool enable)
+{
+	u16 mask, val;
+	int ret;
+
+	mask = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
+	       DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
+	       DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
+	       DW_VR_MII_EEE_MULT_FACT_100NS;
+
+	if (enable)
+		val = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
+		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
+		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
+		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
+				 xpcs->eee_mult_fact);
+	else
+		val = 0;
+
+	ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL0, mask,
+			  val);
+	if (ret < 0)
+		return ret;
+
+	return xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_EEE_MCTRL1,
+			   DW_VR_MII_EEE_TRN_LPI,
+			   enable ? DW_VR_MII_EEE_TRN_LPI : 0);
+}
+
 static void xpcs_disable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
-- 
2.30.2


