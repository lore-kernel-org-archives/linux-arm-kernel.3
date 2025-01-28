Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7472FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rfnXHnjbMDiB1789GYEEadHIP4lGhQCiXiqIwLjLMI=; b=mSntJEllm5RLYH91swxqCP5e9m
	xSr7KTwazr0IwJR1VL2dObucthT0MxABsMjPB9m3w73Fius+/a4dqqvBfDp4DR0eXOA4ZhQJCoT63
	Wt/5BsN+3wqajw8ZnyGr2kOagE4gLYelQCgkOjRUEzdm41iY1VNA6f8N5Yv2AQtac8WInkGAeKizJ
	hCAdn7/+kIXu/tt/3ndEQo5ctzYhuDlLeF0emQk8hCbt7HBM71M7PBuFhd/TlJgCZmCUYAMvWDD7Z
	izoVorwh0hx4coavHjssd3rWN3ue8bbnVGI46kP4JItgDW2YB59Qc/3r3LDvGObieL3I/UHuKtJjB
	bAkx79cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoE9-00000005Hn3-1JxF;
	Tue, 28 Jan 2025 16:14:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpa-00000005CXg-2e7v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6rfnXHnjbMDiB1789GYEEadHIP4lGhQCiXiqIwLjLMI=; b=yB2Rd7p3hmHAn71SUOZ1OntbEK
	c6jInQgQtAYCxM3VjPIRwBhe9YRM277yOyYVhXGWPJaocZwYIqeE8u2VLrdq7KVEQd46GcuHjgAKs
	u++FgDDI0Ef7SqzMKzb7pxNgG5rc15PAD2dTgIgBQDep6IRgL5wOQsUm6+9VDr1k2kMhi6B/OkCyG
	qIP2V8OOaBiNHtGghWPH+F9G5CS3BTR4zgDPs8FelzISngZKgilozrVHFUzHK8NHdlHYX63qalaFV
	qzZiKwHwLI4mP/6tmoV7ZZJttEPO4ZBFg32GSYpEAX8QaQO+Kcf2l/ygfcJSm82jyIJdQ/icKa54x
	JoZ2r7Jw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50694 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpW-0007YD-1d;
	Tue, 28 Jan 2025 15:48:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnpD-0037I0-7t; Tue, 28 Jan 2025 15:48:27 +0000
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
Subject: [PATCH RFC net-next 20/22] net: xpcs: remove xpcs_config_eee() from
 global scope
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnpD-0037I0-7t@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074850_669650_D5340673 
X-CRM114-Status: GOOD (  10.18  )
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

Make xpcs_config_eee() private to the XPCS driver, called only from
the phylink pcs_disable_eee() and pcs_enable_eee() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c   | 14 ++++----------
 include/linux/pcs/pcs-xpcs.h |  2 --
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 1f312b5589a3..6a28a4eae21c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,8 +602,8 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-static int __xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
-			     int enable)
+static int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
+			   int enable)
 {
 	u16 mask, val;
 	int ret;
@@ -632,12 +632,6 @@ static int __xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 			   enable ? DW_VR_MII_EEE_TRN_LPI : 0);
 }
 
-int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
-{
-	return 0;
-}
-EXPORT_SYMBOL_GPL(xpcs_config_eee);
-
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
@@ -1203,14 +1197,14 @@ static void xpcs_disable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	__xpcs_config_eee(xpcs, 0, false);
+	xpcs_config_eee(xpcs, 0, false);
 }
 
 static void xpcs_enable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	__xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
+	xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
 }
 
 /**
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 749d40a9a086..e40f554ff717 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -50,8 +50,6 @@ struct dw_xpcs;
 
 struct phylink_pcs *xpcs_to_phylink_pcs(struct dw_xpcs *xpcs);
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
-int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
-		    int enable);
 void xpcs_config_eee_mult_fact(struct dw_xpcs *xpcs, u8 mult_fact);
 struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr);
 struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode);
-- 
2.30.2


