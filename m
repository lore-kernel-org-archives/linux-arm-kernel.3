Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j461s14qgObm3BQcSpP69PwmbamUjRyDGX5X2yhG5V8=; b=4XlIm/kkbVEzTs2twpUJCLP1Rh
	8mI+ZAZdmEwTjhW7i6u2jfF6Qa3jJhfqRvMOtGwbuWPvDKVYRohWiSOv70G2KTF1VsoYnPN7bpGe4
	GnLqbfxUBXKmLFVa2W9WdUY3eez2nyIts/cJg0QHpzhgbZnpSpnznfv3LVcSMzyso/3BfaKvWbu+M
	Q/KpknmF6MZnh028PX+PXRG6W+tx4UfChVOZuPtgQAT2MiPsaVqbr49W2jFt9aM5RnJugHJTGrcrU
	7/Dj9BeSn4BkV7v0Xkoijy0B2sNvS4EwE4RNrBne6Qf48Zo86UEFhRMHOjdDb+enr+VYoHffbnrti
	5jfoT4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoBX-00000005HQM-3tPd;
	Tue, 28 Jan 2025 16:11:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpQ-00000005CQ7-48KW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j461s14qgObm3BQcSpP69PwmbamUjRyDGX5X2yhG5V8=; b=oe44UCKY8l5X1WRxH1YJQkcxVl
	E6fOGhrBZANAxzVyo9bWBMGLJGRm3n6tkqJlJcFXh4aymNHlPBKgT5MwLpAx6pp3mP33+bOs+Hb1M
	dKDJ+ZnGkAIah0SF2w85oC7SyZWg9hd5naUQJxaadXt3DCanjtSPt0nWN2yHNFWFaUrAqwEysDeDE
	0piFftfZ+7TrcF3v207yhem/TVYpn+LwlQmkiQ18L0kHIGaZqCT6l6SdzrzXKqQ5hADUNxdreubf/
	dO1V2fFUrhY0xqvnYg7kiFNr0N2tlizwpQWmRcgVgHaCaNQcnIRAL5etWHkRMESg/7rRLhrKrG1CJ
	DUx4H4fA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45710 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpM-0007Xf-1C;
	Tue, 28 Jan 2025 15:48:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnp3-0037Ho-0d; Tue, 28 Jan 2025 15:48:17 +0000
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
Subject: [PATCH RFC net-next 18/22] net: xpcs: convert to phylink managed EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnp3-0037Ho-0d@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074841_023019_9A18EF3D 
X-CRM114-Status: GOOD (  13.22  )
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

Convert XPCS to use the new pcs_disable_eee() and pcs_enable_eee()
methods. Since stmmac is the only user of xpcs_config_eee(), we can
make this a no-op along with this change.

Questions:
1. Do we actually need this level of control at the PCS - or would it
   be sufficient to configure it once during initialisation?
2. Do we need to clear the mult_fact field when disabling EEE?

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 91ce4b13df32..1f312b5589a3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,7 +602,8 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
+static int __xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
+			     int enable)
 {
 	u16 mask, val;
 	int ret;
@@ -630,6 +631,11 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 			   DW_VR_MII_EEE_TRN_LPI,
 			   enable ? DW_VR_MII_EEE_TRN_LPI : 0);
 }
+
+int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
+{
+	return 0;
+}
 EXPORT_SYMBOL_GPL(xpcs_config_eee);
 
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
@@ -1193,6 +1199,20 @@ static void xpcs_an_restart(struct phylink_pcs *pcs)
 		    BMCR_ANRESTART);
 }
 
+static void xpcs_disable_eee(struct phylink_pcs *pcs)
+{
+	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+
+	__xpcs_config_eee(xpcs, 0, false);
+}
+
+static void xpcs_enable_eee(struct phylink_pcs *pcs)
+{
+	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+
+	__xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
+}
+
 /**
  * xpcs_config_eee_mult_fact() - set the EEE clock multiplying factor
  * @xpcs: pointer to a &struct dw_xpcs instance
@@ -1355,6 +1375,8 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_get_state = xpcs_get_state,
 	.pcs_an_restart = xpcs_an_restart,
 	.pcs_link_up = xpcs_link_up,
+	.pcs_disable_eee = xpcs_disable_eee,
+	.pcs_enable_eee = xpcs_enable_eee,
 };
 
 static int xpcs_identify(struct dw_xpcs *xpcs)
-- 
2.30.2


