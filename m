Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E548AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIw+cOF+jRX3nkh6neZHJ3ZXms9UEu4kIGlmRAilHSI=; b=c1t5y+LhUMVDEeFyKtnn9YbRbn
	f7AeLMj+R5LwiHh1fqfFJsJ3R0Rl1AHY2lgm8/gNw9eJVV5G5S6VvbzkJvwPChVT+aFcPhYX0UDpQ
	5W2fh4AxeS/i4YGT3T/aA54SPCJ5zfmuCWwMYTKe7zRsdvd6R2TSR44dIYsrywV5UbhNrOVjUYRdo
	nIOO230Iz5WBmAL4YWTaemBTas9Ba2WxAQZW6Ocqvw7tLa3sn6mbEBYKKPLvgOKoXls5phaykkwV+
	84dRuFV6r5ZlLiznNb2P2LYbCRYaaxL5gpR581yuXB62Cwly87AKTO9d8MLNz7pEAZnyibOL7xWBo
	gDbUgtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK74-00000002cyZ-3HzP;
	Mon, 27 Jul 2026 12:07:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK72-00000002cyD-2PbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:07:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso404926b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785154035; x=1785758835; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIw+cOF+jRX3nkh6neZHJ3ZXms9UEu4kIGlmRAilHSI=;
        b=gn2bLE8cg5emocEa0IVWEnZfcPs1MT1cxUq7T+Y/5Qs80yEcAubyJjQLv+vOG/pn22
         YFQGvMxGoB0qqVy5i+Emu24IHWKCgK0Pvef1kTLm2zxhFVfU6sDh7epYzCwfRSzULTQx
         cNnzZWDABHkcE4SuZhuBgiMlvVLXFuz5PYgsaF0D7K0B7LMjgbrjq72HMGJLIRQGyLHr
         nLxWj8QV1eP/845nQUT3hHXmlc2D81RUA+GeUXnyiQFTOOAymOn1U/6pp2IVbtLWzW5H
         G6wqsiWnpRSQ1I9HzCBraOKd2fyJzttU7zKmx3m4mke5zzhqTJ6927HdP2DOHNyhW60O
         vcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154035; x=1785758835;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIw+cOF+jRX3nkh6neZHJ3ZXms9UEu4kIGlmRAilHSI=;
        b=rJIGOVt90hsw+BVAFnYNOBWqQcQYZ5YaVHMIdQcPP50R/wKEsQX3rPrwa6n6C0DG+7
         zvI+9Zf2F9YxKSNvtSVv+uz9M/cxPw7RYhWuJf0yhzJTC9jwilqK/04VL1fPaDZ4F2/T
         DivKQYANyZfNi+71tFWVL2CC5MACrbNsPDIx6K6+7ko3yJ+QJJ3SxleA0wFLnMZOjJXH
         bOqPsVxp08QHLmgZBItXVi9BXUI7PmklhyQEu7eWSD8FiwADoFXTc25L8iqLked9vARQ
         guM8S3lty36RGt1s3X1FDhubW9GtPHi8KsK+j5TtGP16GnK527vBdiJ1ELdvYsSMKbtx
         Xdnw==
X-Forwarded-Encrypted: i=1; AHgh+RqtkXhHLAxYcTH1asnz4OySyVGKGsX/equGbg7gnzbvDcJ7K891FT21ZfFPR+PSuxNT7MDHJjsljGYFncze8c/W@lists.infradead.org
X-Gm-Message-State: AOJu0YzyTKY/BktcsqHhxkD2/DQtdrv5MvloRYRHpOSupZJWG27Ey3sy
	RQrbzjY+1i1xZOxkAtmMTkQf/O7/IaS/lCs0a+sSKAxLgsm7zV80H16/
X-Gm-Gg: AR+sD122qVGTNn4Z2CGzSmSdF4ia20XniALPVPYjoxlG5wivP9g93wADz18wbzqbe7u
	pZin8RwG+NgREsE7t4j7BFotd5erUVBBOax4a6TSGKMdMnAbEemHd0C1/FHo+i/BZ1spUASXvht
	D3rHFLCM7/zpskbXG/4iao1z989UpCAE4kVVe+aYtaWizeA88b0+Pdlp0h1+tVoRFhQncCQ2YKk
	ecfgjgvPzSqDlukQ0R9H5pD+/3Wj1zDvmVZYjUgvg31eK2+xb8hvBfKIrAnZHU6CQkYBdYyRdV9
	8O6eada7vTEqUDcYKDUFIQgMvUpAMqwdPkLLEDD7AZuiZf1G5IBUX90kTq4o6PXMtBAj9kVOrVD
	Jkf8FR8G6Hj9ntw3gtQf5t1FV9mhwER0o+WJOIPSgpsGAnCebJNXQnbCre1HcGE2OeWLYKHx8zs
	xn
X-Received: by 2002:a05:6a00:928f:b0:842:446a:4cb5 with SMTP id d2e1a72fcca58-84e4df6f4dbmr7705050b3a.0.1785154035317;
        Mon, 27 Jul 2026 05:07:15 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1637sm2935168b3a.33.2026.07.27.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:07:14 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	rmk+kernel@armlinux.org.uk,
	alexandre.torgue@foss.st.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com,
	maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback() method for PCS loopback support
Date: Mon, 27 Jul 2026 20:07:04 +0800
Message-Id: <20260727120704.2319467-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_050716_626030_DB38777B 
X-CRM114-Status: GOOD (  22.59  )
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

Some Ethernet MAC drivers (such as stmmac) need to perform PCS-level
loopback for selftest purposes when no external PHY is present. Add a
new phylink_pcs_loopback() method that allows MAC drivers to request
PCS loopback mode through the phylink framework.

Implement the pcs_loopback callback in the stmmac integrated PCS
using the GMAC_AN_CTRL_ELE register bit. Add a helper function
stmmac_selftest_get_pcs() in stmmac selftests to unify PCS lookup
across glue driver PCS and integrated PCS. Update the selftest
enable/disable paths to use the new helper.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 17 +++++++
 .../stmicro/stmmac/stmmac_selftests.c         | 51 ++++++++++++++++---
 drivers/net/phy/phylink.c                     | 19 +++++++
 include/linux/phylink.h                       | 16 ++++++
 4 files changed, 95 insertions(+), 8 deletions(-)

v2:
  - Implement pcs_loopback callback in stmmac integrated PCS using
    GMAC_AN_CTRL_ELE register bit.
  - Add stmmac_selftest_get_pcs() helper to unify PCS lookup across glue
    driver PCS and integrated PCS.
  - Add NULL check in phylink_pcs_loopback() wrapper.
v1: https://lore.kernel.org/netdev/20260724085224.3321663-1-zxyan0222@gmail.com/

Note on loopback direction:
The pcs_loopback callback uses a simple enable/disable boolean, matching
the existing phy_loopback() API. Direction is not needed at this level:
selftest loopback is always host-side (TX looped back to RX). The
future ethtool user-space loopback API can handle direction selection
at a higher layer.

Note on phylink_set_loopback() vs phylink_pcs_loopback():
This patch follows the same pattern as phy_loopback() - a direct
callback on the PCS object. Keeping the API minimal avoids introducing
a new phylink-level loopback abstraction with location enumeration
before Björn's ethtool loopback series lands upstream. Once that
series is merged, phylink_pcs_loopback() can serve as a building block
for a higher-level phylink_set_loopback() if needed.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index df37af5ab837..90a21a2f7e87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -168,6 +168,22 @@ static void dwmac_integrated_pcs_an_restart(struct phylink_pcs *pcs)
 	}
 }
 
+static int dwmac_integrated_pcs_loopback(struct phylink_pcs *pcs, bool enable)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	u32 ctrl;
+
+	ctrl = readl(an_control);
+	if (enable)
+		ctrl |= GMAC_AN_CTRL_ELE;
+	else
+		ctrl &= ~GMAC_AN_CTRL_ELE;
+	writel(ctrl, an_control);
+
+	return 0;
+}
+
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
 	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
@@ -175,6 +191,7 @@ static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
 	.pcs_config = dwmac_integrated_pcs_config,
 	.pcs_an_restart = dwmac_integrated_pcs_an_restart,
+	.pcs_loopback = dwmac_integrated_pcs_loopback,
 };
 
 void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 29e824bd90ca..77a457b2fa5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -19,6 +19,7 @@
 #include <net/udp.h>
 #include <net/tc_act/tc_gact.h>
 #include "stmmac.h"
+#include "stmmac_pcs.h"
 
 struct stmmachdr {
 	__be32 version;
@@ -374,23 +375,51 @@ static int stmmac_test_mac_loopback(struct stmmac_priv *priv)
 	return __stmmac_test_loopback(priv, &attr);
 }
 
+static struct phylink_pcs *stmmac_selftest_get_pcs(struct stmmac_priv *priv)
+{
+	/* Try glue driver's PCS first, then the integrated PCS. */
+	if (priv->hw->phylink_pcs)
+		return priv->hw->phylink_pcs;
+
+	if (priv->integrated_pcs)
+		return &priv->integrated_pcs->pcs;
+
+	return NULL;
+}
+
 static int stmmac_test_phy_loopback(struct stmmac_priv *priv)
 {
 	struct stmmac_packet_attrs attr = { };
+	struct phylink_pcs *pcs;
 	int ret;
 
-	if (!priv->dev->phydev)
-		return -EOPNOTSUPP;
+	if (priv->dev->phydev) {
+		ret = phy_loopback(priv->dev->phydev, true, 0);
+		if (ret)
+			return ret;
 
-	ret = phy_loopback(priv->dev->phydev, true, 0);
-	if (ret)
+		attr.dst = priv->dev->dev_addr;
+		ret = __stmmac_test_loopback(priv, &attr);
+
+		phy_loopback(priv->dev->phydev, false, 0);
 		return ret;
+	}
 
-	attr.dst = priv->dev->dev_addr;
-	ret = __stmmac_test_loopback(priv, &attr);
+	/* Use PCS loopback for interfaces without an external PHY. */
+	pcs = stmmac_selftest_get_pcs(priv);
+	if (pcs) {
+		ret = phylink_pcs_loopback(pcs, true);
+		if (ret)
+			return ret;
 
-	phy_loopback(priv->dev->phydev, false, 0);
-	return ret;
+		attr.dst = priv->dev->dev_addr;
+		ret = __stmmac_test_loopback(priv, &attr);
+
+		phylink_pcs_loopback(pcs, false);
+		return ret;
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int stmmac_test_mmc(struct stmmac_priv *priv)
@@ -1986,6 +2015,9 @@ void stmmac_selftest_run(struct net_device *dev,
 			ret = -EOPNOTSUPP;
 			if (dev->phydev)
 				ret = phy_loopback(dev->phydev, true, 0);
+			else
+				ret = phylink_pcs_loopback(stmmac_selftest_get_pcs(priv),
+							   true);
 			if (!ret)
 				break;
 			fallthrough;
@@ -2019,6 +2051,9 @@ void stmmac_selftest_run(struct net_device *dev,
 			ret = -EOPNOTSUPP;
 			if (dev->phydev)
 				ret = phy_loopback(dev->phydev, false, 0);
+			else
+				ret = phylink_pcs_loopback(stmmac_selftest_get_pcs(priv),
+							   false);
 			if (!ret)
 				break;
 			fallthrough;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 59dfe35afa54..69242caffaef 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -997,6 +997,25 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_pre_init);
 
+/**
+ * phylink_pcs_loopback() - Enable or disable loopback at the PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ * @enable: true to enable loopback, false to disable
+ *
+ * Enable or disable loopback mode at the PCS level. This is used by MAC
+ * drivers for selftest purposes when no external PHY is present.
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+int phylink_pcs_loopback(struct phylink_pcs *pcs, bool enable)
+{
+	if (pcs && pcs->ops->pcs_loopback)
+		return pcs->ops->pcs_loopback(pcs, enable);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(phylink_pcs_loopback);
+
 static void phylink_mac_config(struct phylink *pl,
 			       const struct phylink_link_state *state)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 2bc0db3d52ac..66c7016d4acd 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -518,6 +518,7 @@ struct phylink_pcs {
  *		    the MAC.
  * @pcs_pre_init: configure PCS components necessary for MAC hardware
  *                initialization e.g. RX clock for stmmac.
+ * @pcs_loopback: enable/disable loopback mode at the PCS.
  */
 struct phylink_pcs_ops {
 	int (*pcs_validate)(struct phylink_pcs *pcs, unsigned long *supported,
@@ -542,6 +543,7 @@ struct phylink_pcs_ops {
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
+	int (*pcs_loopback)(struct phylink_pcs *pcs, bool enable);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -717,8 +719,22 @@ void pcs_enable_eee(struct phylink_pcs *pcs);
  */
 int pcs_pre_init(struct phylink_pcs *pcs);
 
+/**
+ * pcs_loopback() - Enable or disable loopback at the PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ * @enable: true to enable loopback, false to disable
+ *
+ * Enable or disable loopback mode at the PCS level. This is used by MAC
+ * drivers for selftest purposes when no external PHY is present.
+ *
+ * Returns 0 on success, or a negative error code on failure.
+ */
+int pcs_loopback(struct phylink_pcs *pcs, bool enable);
+
 #endif
 
+int phylink_pcs_loopback(struct phylink_pcs *pcs, bool enable);
+
 struct phylink *phylink_create(struct phylink_config *,
 			       const struct fwnode_handle *,
 			       phy_interface_t,

base-commit: 1df10cef2d1e7f9f2fb7eddb67fc70d3abf101f9
-- 
2.34.1


