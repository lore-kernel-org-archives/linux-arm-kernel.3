Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC3DD3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeEQYmHFBqqeSJrmP9qmqrphebl43pVxJVKiNxT2TKM=; b=j2SdjZUy8OGCJwlPzL+Jb0v2sk
	zSYrKaKdy2xa2tZd1DNceaHsFaodLAPN3f42zkMzfa9suI16UqnT+7I/R5Q49vk60++hGFKAvT4jn
	Eb7a34bAxtmqvv4tzBc6hTssKrgv5LvlryabDr5riKdUHDGY4GAI4hbNNyYwXpzzqTGkgqWOSozPZ
	qnpoJhEWcOi6+gX8KQoePozn/VxUX7sjCGD/h8HPVEFDd9G2CmbPejJgQtxY81hHVwShv+xvIlJom
	yfXE15XtjRzU3DLNwB8sHBVJ4EFXOGXevM3aQQpH2zB0omY4X3PLV0U23whgSH4t7Ude+TIbonJaH
	nmVDCm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs48-0000000ABtD-0wUX;
	Tue, 26 Nov 2024 09:41:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrpF-0000000A8hZ-3kZy;
	Tue, 26 Nov 2024 09:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qeEQYmHFBqqeSJrmP9qmqrphebl43pVxJVKiNxT2TKM=; b=12TN4zo56C06Has6SuhG9dq6i8
	jdFY2+qKj/Lnr5TlqMu8AJiA8Tys8naY/sxIMZgRRw0NYWJYLzekXJ8SAcSpXzlSc7BL7khiVNcbG
	5aQQiZKirC/z5/aDUJrgYPzzpGG/MQzt+dlV/P9q45OKiMqQ/W6SqZe1FCbeViIE+QGZfxnjfDZ8g
	1b+wtHfxE+XSUWHEyOT01IeLUkSiHVnI0wDRy4QVZLeiwOqXttfv2uu2Qc1HhUmMLGF/KC10AjIBv
	oPgWbjTY23DXEGgJS/esEt8ft4/XjRuxX4xNSfM1yzlclnGXNYKKYVJ5grKPH9dyiLhPT1El+8hm5
	dt4dsFuw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59992 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrp2-0006W6-1W;
	Tue, 26 Nov 2024 09:25:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrp1-005xQw-2y; Tue, 26 Nov 2024 09:25:27 +0000
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
Subject: [PATCH RFC net-next 14/16] net: pcs: xpcs: implement
 pcs_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrp1-005xQw-2y@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012541_931153_C8FB821C 
X-CRM114-Status: GOOD (  11.37  )
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

Report the PCS inband capabilities to phylink for XPCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 7246a910728d..f70ca39f0905 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -567,6 +567,33 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	return 0;
 }
 
+static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
+				     phy_interface_t interface)
+{
+	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+	const struct dw_xpcs_compat *compat;
+
+	compat = xpcs_find_compat(xpcs, interface);
+	if (!compat)
+		return 0;
+
+	switch (compat->an_mode) {
+	case DW_AN_C73:
+		return LINK_INBAND_ENABLE;
+
+	case DW_AN_C37_SGMII:
+	case DW_AN_C37_1000BASEX:
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+
+	case DW_10GBASER:
+	case DW_2500BASEX:
+		return LINK_INBAND_DISABLE;
+
+	default:
+		return 0;
+	}
+}
+
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 {
 	const struct dw_xpcs_compat *compat;
@@ -1306,6 +1333,7 @@ static const struct dw_xpcs_desc xpcs_desc_list[] = {
 
 static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_validate = xpcs_validate,
+	.pcs_inband_caps = xpcs_inband_caps,
 	.pcs_pre_config = xpcs_pre_config,
 	.pcs_config = xpcs_config,
 	.pcs_get_state = xpcs_get_state,
-- 
2.30.2


