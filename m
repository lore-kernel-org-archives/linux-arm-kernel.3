Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F90AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MH/1XbuHmmzMIpU0/jitxqDYSfeHmJOlhMeOQiQWSQ=; b=zhZ1QJjTIdiPx29XqXeaF1MVfg
	WjU7sgVDreN1IysvymL8mDTQVak2flbOxnLvyzgoBNFPRBIcOIlG2NuLlTw09JfrYmJldfY4gob6o
	wUmPqgI+TG9APGvcDiMrPGk2afHs8m4TJ8EVBUS2J2H+PLgADLW0yY6bJStwXnJq7RwqN3+J25k4s
	JN2sVto8m020MljgCSKITxix5IcxVcQMKWMpS9/I17bwWaM3DktqpI0BLCnsMF65SABjfQv7IFoFi
	Pixy0cISvHKn4DdSp++h2iU+tw2WpEFRThWQZmoIYenEQTuqQnZ3jaRALt2fzC07aKpHqrZ9+C0U1
	QGrmnxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfnb-0000000CpQZ-36cX;
	Fri, 03 Jan 2025 11:25:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfg0-0000000CoCR-0IBf;
	Fri, 03 Jan 2025 11:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/MH/1XbuHmmzMIpU0/jitxqDYSfeHmJOlhMeOQiQWSQ=; b=kyq2ffionUdzxezwxw1n7SSUNJ
	QOwJve95yZcDFYj/8AbI4Cd7R27VoBHYCihpPknn1P/j1BxO3KEhCfgxJqhvq0TnDSeEOzj3Ps0uh
	zHmXaY0gXRIM9i/eJtzcnExq8UkRkzCESa+xUsBtpWvg7x7gJALYXj1t8eHTgWxUdlMPzinWZeX7G
	cJARELl9wB4lXw1v7OAaH+hyFepu73JhFPIMuxmjWQ39FAw/ZJHwPRBEuZHOvrPH9XijDcPAm+QBz
	sr8R3d8+C0vbT6YLCbMOodxu7X5mr9qbkCvtWOcMjJ4r8iBbqV0myf5LRi4BWRNrGhHc466Pv5EPn
	IAOHlwDA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39002 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tTffn-00031h-2c;
	Fri, 03 Jan 2025 11:16:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tTffk-007Roi-JM; Fri, 03 Jan 2025 11:16:56 +0000
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
Subject: [PATCH net-next 6/6] net: pcs: xpcs: make xpcs_get_interfaces()
 static
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tTffk-007Roi-JM@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_031712_110254_6AAB3ED0 
X-CRM114-Status: UNSURE (   9.82  )
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

xpcs_get_interfaces() should no longer be used outside of the XPCS
code, so make it static.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c   | 3 +--
 include/linux/pcs/pcs-xpcs.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index cf41dc5e74e8..c06b66f40022 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -594,14 +594,13 @@ static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
 	}
 }
 
-void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
+static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 {
 	const struct dw_xpcs_compat *compat;
 
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		__set_bit(compat->interface, interfaces);
 }
-EXPORT_SYMBOL_GPL(xpcs_get_interfaces);
 
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index b5b5d17998b8..733f4ddd2ef1 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -50,7 +50,6 @@ struct dw_xpcs;
 
 struct phylink_pcs *xpcs_to_phylink_pcs(struct dw_xpcs *xpcs);
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
-void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr);
-- 
2.30.2


