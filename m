Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80701C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03AhbylEG7HNdpH6NjqbpJVFcId319ILq77ziepvCyQ=; b=lWCfjLAHjEyQ4GjnMSudWfTMAl
	N4/OVYI12vnoGVkzDaBwXezNxLXN9eBXWC+wkIJcLlifABznTysIvgW8+eiUhb0jxmG/FcdgyDMMv
	kvRQoKYABPShZSM2ciZYadZ7lFScBCegYdiKPXrNyuilQkmlT21gYQRUX+mDsbjvH5O2FGHFh3f1c
	B2trqgbu4KufqqjSfvQxWtOq8bvGXV8HvoJ7QIl1rInNVR+eN5AsVUMG0dzxv25U4wJtN3HWVSALc
	dVWE2jbZO/CdLtbJDXnBy8ISWuvU+tgjp6Z7VbXfAQmyWwbc25TPviL4lqbvOExxK/TA0rRd413Pt
	VtsL0BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRgH-0000000HA4g-3kjl;
	Mon, 10 Feb 2025 11:10:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRQW-0000000H67R-3dh9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=03AhbylEG7HNdpH6NjqbpJVFcId319ILq77ziepvCyQ=; b=hNMs4234mNpFZh5NoXhDRhs4dx
	dMG7sdhgggFOSffYCVrZ0cOgQyPLN2FGSGJ+bkHbbbWat8JuzbGz0KTVdmRhaTqANZKY9Z6BcyiEZ
	eYEq7NBx47P1UbM6hy07Sxr3iO+LvgVq1uJCMJ6L2xXMUlm5jPdaX7bHi3FR/klHg1+x9KPoDrYN/
	lFoDkOhjn6XCpAC1Pb6xvGOnkQ6QB3coTrZiFrgnJtPnKS9ucSFEUTj2pCtQy/t51XgDUshshOj0r
	j3fnoRQJ1YhWzkquGHXdL5cn9RU1ZG8ohTeC3ME6FaqGhuw8OjxeuHLZAt3z+J2c8xLYTzfONFc2Q
	wtQ2hW1g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38704 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1thRQS-0006VW-22;
	Mon, 10 Feb 2025 10:54:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1thRQ8-003w70-VT; Mon, 10 Feb 2025 10:53:45 +0000
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/8] net: xpcs: add function to configure EEE clock
 multiplying factor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1thRQ8-003w70-VT@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:53:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025408_904548_A1787B64 
X-CRM114-Status: GOOD (  13.37  )
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


