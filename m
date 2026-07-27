Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1423BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z16dJnLnSv95Qpq+A/raImdSjBDYDMk7y4iTWRylGiE=; b=G5LpxG4/GoZC+BuweQayauCjLE
	rvFRjOmmlTTedHZAKHQrPAsmHuvO/hYQcqboMQ3X6iC0WLbwcPLlpodke0oFiS/MkFodXNfBQGQFw
	8gxSlkRDw3AL/HLl64I0xtrdBOIQgv8KRlwalESgKPS8IMIB53tMmva1754Idt7XymhmL899DUlmV
	MI2V0zlrV+PzQm7DdEGrY6/dNIcJgEK2N9PkZO45sWswEyTfnrm2/Trda4e+1J1dGboy5KTO9eSOS
	WMRudsthjgEEETyd4Wwq8Y8aUFcBWsAp70qImlVNpHQJluGiUnNK3A7dGBvD3oPcCjrS3kcPcX2bm
	DvQqvMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHnO-00000002LYT-3Flv;
	Mon, 27 Jul 2026 09:38:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHnL-00000002LXb-2xNj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:38:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cad4170e8eso36471865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145127; x=1785749927; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z16dJnLnSv95Qpq+A/raImdSjBDYDMk7y4iTWRylGiE=;
        b=LStMNXj/N6RLVVfRwwCOLI+QerCjmU1CdXuqtxBO8kkKYvG+vpMipddTIasz5G+kpG
         eC6EhJDZ4LbTwQNwbzk+BT9iP1zhV5EPskZrlZ4BYb+3aWs4jwxJpuCvoRxJ7NnsxhSV
         7rf7v6fZusgjFH6OH74qgT9NQ0inNVZJvHAMjCohdt5iSgDiox+NE2L/YLai9gUMdXZU
         xJ8X38/S6O2Oy5rAOlrOTSGZFiSVK0U+qz8dnaJlljRzK/P1eI1QVO/Q4X2H7y4bd0Pt
         VYqGmuk9ItNrfE0fb/xLUwh/gt6xOGTgjE9pffZSyPVKzDzaR1Pk1jO7O6QaLLUVDhN1
         7+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145127; x=1785749927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z16dJnLnSv95Qpq+A/raImdSjBDYDMk7y4iTWRylGiE=;
        b=L2UvDR5AD8042CHZi02UinY5R6jPyuSWiE1C0ZEMcuDn+k7PH/k6Q4TquIifdoHoQq
         uRAR5caovgVyVNFGYMIR7z7PMMls2YRLsixe0Ii3B48KeDLD5NAsknpQ3gI8vSg0RldW
         6muHuMOiJ4oPbn/Ysz+BwrgN+poAWwdOYbq2/SSkRmX3tfXedipEdfJxzdf0Hdw9vYh3
         tSMHNm6aEEI5yumDR6520O8LNReRpaNPbOrZlTEMQA7Raqte7Ogq5dsx53WOX92tlZmm
         imA192DM8hMyXTRWPuSv9zGEIHxsecKrNrra4eDGnQv6KYMOXwA7vzPOOUNg134705bW
         ijkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/XG8UfA1R2GXrrIC/Ob3Rp3ULVvg6DfT7MpZH48ms9A6pelRM4FXVS8rDEdBxEmoXt1ZJMBals6zP1Pb4QZS3@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkKBotE1GvOIs8ZwxDdBPxC0wY4FdKxG/37S+JaO8XK6Z/vWf
	4jtzqdR2OCvJ/SZMLLJBGZx8N1m5eJL0NSPP0fGw4X4/EV0gPiUS7Dw/
X-Gm-Gg: AR+sD12AbvvfgsCk9nVxlmc90sZLw+LjMieCzbQZmUk/flR5QlHD9qKgQgZMReCyNGP
	VTI/exZZ0mAO+VnKL5u8pUVZ+OegaycWWo4591qYtgmq8/eRO7s25XOJAwdobKGpeZ1FBeHYI1g
	Zy2+mqLRgtdzrCqCN4uTdxTeEkxbAmQO9d8NfCFSPxKA0cCToKicGR5GVEag0Chh0IPzeOge7W5
	yXhtXe8wH2wndw5wrsYMxHO8xL1qCFMnd0Xqp7ayREBJ2kCaboVybZwJW8eC3ZeLCacUjW+Q6LZ
	p+9vjh+LBj3GnRPu1URQ7RfL6CLafbYOUtpeLyBGYQ5XiQHf3AVftd97yzS066KgzIVM9Z5W3PB
	kinX/UJ48o1xJYLFtP+FFZ+48j7MLOI3ZZeqj9SrxU2WA8LMTzGBSkKxgLSelOagGY42j4dCN4n
	Yy
X-Received: by 2002:a17:903:1c7:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2cfde7a9a93mr78616115ad.16.1785145126625;
        Mon, 27 Jul 2026 02:38:46 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a44sm32574905ad.35.2026.07.27.02.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:38:46 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux@armlinux.org.uk,
	hkallweit1@gmail.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback() method for PCS loopback support
Date: Mon, 27 Jul 2026 17:38:35 +0800
Message-Id: <20260727093835.1708262-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724085224.3321663-1-zxyan0222@gmail.com>
References: <20260724085224.3321663-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_023847_754961_55134D43 
X-CRM114-Status: GOOD (  23.09  )
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

Changes in v2:
- Implement pcs_loopback callback in stmmac integrated PCS using
  GMAC_AN_CTRL_ELE register bit.
- Add stmmac_selftest_get_pcs() helper to unify PCS lookup across glue
  driver PCS and integrated PCS.
- Add NULL check in phylink_pcs_loopback() wrapper.

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


