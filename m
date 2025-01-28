Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2CFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSrV54CZkdKosAaMmEy/XHbQ07NRRzWFba+cISFZsFY=; b=paxboUjQo7MJsSvg1M3noFoUfT
	g7BGvxIQtOlrnwPuve0XH8lYm7smO+sEtdVDkjtkF9vPTQ4v3iNiZFY/Ui+YzDQmIZJDfY9STq1Jg
	j9J6zv4/om3OobOH/cq+kujPQdPLe6oqLGCq3CQuYf+siQvbheQ3HTob2XjO4wAvg+j2mqF2I3TAo
	3wA++Bta30xHaAFauyfShG+t5nAOzFsclKbC/Xc1zGX+XpqtHc2rdsUZZU9V6BcOsBWq4e/EWptIQ
	DDGkdMcecYwr+57ZwHEbzHL1Bt8yk2a2xRPRCHKzbcug8xGqOAR1LyGQLy21PZj7wznOxy3TRi72f
	+t4VDeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tco8v-00000005H4G-2F8w;
	Tue, 28 Jan 2025 16:08:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpH-00000005CJp-0c9X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CSrV54CZkdKosAaMmEy/XHbQ07NRRzWFba+cISFZsFY=; b=sQL2X3J9A+Dxb9UAwmqesJ2Wr1
	YjcLEMsf59y60fdMHdoNTi6mtYzZqVNjjLKxxk086u1VtYEGtL8ltTZMypyd70hQt/W1m6LZR4st9
	yf0zpZs/b8ZBZ0+NqDT78/L6au0OyMecHvaEjafeoVnlYQQ/mHLNIH/0b3ewR+ovOqtPahp7ly7kD
	y+YnZm0asTsdFqZcN0y05zElSblq/1lJk3Cqf6DF9BL3qfqzR/Ku2BA/UW3XEceubuKzmslu+pxM2
	zai3JEigmtoDN2WdnniOUs/YK0hpZOpto8VH8/MdD3TqPtvQcY3wi48qvvH8AdZeTioUCR5+tEFbg
	FuV4TEGg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43236 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpC-0007X0-0G;
	Tue, 28 Jan 2025 15:48:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnos-0037Hc-PG; Tue, 28 Jan 2025 15:48:06 +0000
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
Subject: [PATCH RFC net-next 16/22] net: xpcs: add function to configure EEE
 clock multiplying factor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnos-0037Hc-PG@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:06 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074831_186149_00042DF1 
X-CRM114-Status: GOOD (  14.70  )
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

Add a function to separate out the EEE clock multiplying factor. This
will be called by the stmmac driver to configure this value.

It would have been better had the driver used the CLK API to retrieve
this clock, get its rate and calculate the appropriate multiplier, but
that door has closed.

Question: Is there any other solution to this so we can avoid keeping
this XPCS-specific function that MAC drivers have to know about if
they are going to use EEE with XPCS?

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c   | 14 ++++++++++++++
 drivers/net/pcs/pcs-xpcs.h   |  1 +
 include/linux/pcs/pcs-xpcs.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 1faa37f0e7b9..91ce4b13df32 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1193,6 +1193,20 @@ static void xpcs_an_restart(struct phylink_pcs *pcs)
 		    BMCR_ANRESTART);
 }
 
+/**
+ * xpcs_config_eee_mult_fact() - set the EEE clock multiplying factor
+ * @xpcs: pointer to a &struct dw_xpcs instance
+ * @mult_fact: the multiplying factor
+ *
+ * Configure the EEE clock multiplying factor. This value should be such that
+ * clk_eee_time_period * (mult_fact + 1) is within the range 80 to 120ns.
+ */
+void xpcs_config_eee_mult_fact(struct dw_xpcs *xpcs, u8 mult_fact)
+{
+	xpcs->eee_mult_fact = mult_fact;
+}
+EXPORT_SYMBOL_GPL(xpcs_config_eee_mult_fact);
+
 static int xpcs_read_ids(struct dw_xpcs *xpcs)
 {
 	int ret;
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index adc5a0b3c883..39d3f517b557 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -122,6 +122,7 @@ struct dw_xpcs {
 	struct phylink_pcs pcs;
 	phy_interface_t interface;
 	bool need_reset;
+	u8 eee_mult_fact;
 };
 
 int xpcs_read(struct dw_xpcs *xpcs, int dev, u32 reg);
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 733f4ddd2ef1..749d40a9a086 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -52,6 +52,7 @@ struct phylink_pcs *xpcs_to_phylink_pcs(struct dw_xpcs *xpcs);
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
+void xpcs_config_eee_mult_fact(struct dw_xpcs *xpcs, u8 mult_fact);
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr);
 struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode);
 void xpcs_destroy(struct dw_xpcs *xpcs);
-- 
2.30.2


