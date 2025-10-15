Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B1ECCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8qagTfnP+U3q0F8E63xc12CZLmAkp6qB26cnOxilr8=; b=Xql8XRQrp4fEqpYjUCZGnfBgsH
	UCU0DcrjEu3ec/vKFSYzjpgiQQgd+wUNbhF6o9C2Phj3ibt/7D5rOJPkQfUxMitLnt6aq71Eofu5N
	3usY/NIjNODg7knvMkKzCSLNEZhPSWVoZJ2f+xgr7NUoytQH7tcciF6PIQ2SeJxA4Q61zEAYD7vY1
	EwCglLUAqybGKfBJKujjWXfp4Iir5LHu04Xni7K2xKEnfp6LeubF7gkT937TkZc9Bp1rDnsxuJt5X
	ODVZDc+cSidhq13PuLjFal09gCofChSnYhpRWfoFriSHwr2tpR3LLAoe90jfR1ZMYEP1pYVp2awIv
	9shVkUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8sq0-00000000OX5-3tKn;
	Wed, 15 Oct 2025 04:10:08 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8spx-00000000OVp-1Cp4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=F8qagTfnP+U3q0F
	8E63xc12CZLmAkp6qB26cnOxilr8=; b=Wq681msYKhw1B/NUTb0zuyzYfVfOZdm
	3k0JEoYtRbxscNKNFaQX2cnE2TkcCuzJPc28tfYpVKfvPVsBxkoAGbl3XGnVCcLx
	q99Vs12Io7dOm0AkEiV6IKvSGHgTAMEP3tISYKqHYnABpEUYIUP2M+M+9zgRtPrz
	omQsyEy4qfac=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCXnOhRHu9ovBl6AQ--.40673S2;
	Wed, 15 Oct 2025 12:09:04 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	david.wu@rock-chips.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH net-next] net: dwmac-rk: No need to check the return value of the phy_power_on()
Date: Tue, 14 Oct 2025 21:08:47 -0700
Message-Id: <20251015040847.6421-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCXnOhRHu9ovBl6AQ--.40673S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4xKw13WFyfXr15Gr4fGrg_yoW8ZryUp3
	93CF9Fyw1kXa4xGa17tFsrZa45u3y7Kry0qF1xA34ru3W3AF1DKF18tr1FvF1jgrykXFya
	yF4UAF1xC3Z8ur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRFPfQUUUUU=
X-Originating-IP: [112.4.48.30]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKBrnq2jvHAA8fgAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_211005_709235_9084FD68 
X-CRM114-Status: GOOD (  13.06  )
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

'phy_power_on' is a local scope one within the driver, since the return
value of the phy_power_on() function is always 0, checking its return
value is redundant.

the function name 'phy_power_on()' conflicts with the existing
phy_power_on() function in the PHY subsystem. a suitable alternative
name would be rk_phy_power_set(), particularly since when the second
argument is false, this function actually powers off the PHY

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 51ea0caf16c1..9d296bfab013 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 	return 0;
 }
 
-static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
+static void rk_phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
 	struct device *dev = bsp_priv->dev;
-	int ret;
 
 	if (enable) {
-		ret = regulator_enable(ldo);
-		if (ret)
+		if (regulator_enable(ldo))
 			dev_err(dev, "fail to enable phy-supply\n");
 	} else {
-		ret = regulator_disable(ldo);
-		if (ret)
+		if (regulator_disable(ldo))
 			dev_err(dev, "fail to disable phy-supply\n");
 	}
-
-	return 0;
 }
 
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
@@ -1655,11 +1650,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = phy_power_on(bsp_priv, true);
-	if (ret) {
-		gmac_clk_enable(bsp_priv, false);
-		return ret;
-	}
+	rk_phy_power_on(bsp_priv, true);
 
 	pm_runtime_get_sync(dev);
 
-- 
2.17.1


