Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74804C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jCdzSFwYnDZECKuJL2W/gBgula6jQ6d53Xso4SG8qwc=; b=uGy2gYJ4gMDAJuy0x8/yGSLjrL
	vuiQA+n5kJ5mWVVjZFKV7nJ6P4NNS1kSpPV64uuxuGObqojuqf9y6Ntlw52nibgn2eC9jWyVrQ2zD
	gwuk7go2gGDSxAxtydfOmYLVKM03YzNFqv2NUhWSfzPuBzkPP59VHoWHTkLcOsYbBHWGNKNiR+l1G
	9Z7aUjq6sarXqbfD+P4Lkda2sXbz2wu+OWax7In9NB92PWA6PUT2g4dJdOcmqZbJnFgD2X4wTYCsZ
	0682HdGrJI7hd57sF3IJRbJCga96FWUWbmXVjQ2quj4XB2gIsl3EtOkrA9SPXX5a312bg9KbYOcbF
	CwQvdU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2mg-00000001Cvc-1xPD;
	Fri, 30 May 2025 16:40:42 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Ui-000000019UC-1kkH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=jCdzSFwYnDZECKuJL2W/gBgula6jQ6d53Xso4SG8qwc=;
	b=bgOHFXZ6AOcPgSn6ym7msrP48dbWljzcAVEwnjzBO7/oXxAHAUULqJD6I27cdv
	h+u3PCaPWVgo99D0n4WzIDBoN/1HO8nONEPPv8U6LLdUdo510JQnPBbYoAPTlnF+
	DdEOs9elr2f1D+e77+cMf8c5O3YO7kQv3r+rMGeFbQ+18=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCXjDDH2jlouf2RFA--.37484S2;
	Sat, 31 May 2025 00:20:31 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk,
	david.wu@rock-chips.com,
	jan.petrous@oss.nxp.com,
	detlev.casanova@collabora.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
Subject: [PATCH] net: dwmac-rk: No need to check the return value of the phy_power_on()
Date: Fri, 30 May 2025 09:20:17 -0700
Message-Id: <20250530162017.3661-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXjDDH2jlouf2RFA--.37484S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4xKw1fAF1rZF13ArWDArb_yoW8Ww47p3
	9xCF92yr1kXryxGa17trsrZa45uayxtFy0qF1xt3yfu3WfCF1Dtry8tr4FvF109rykXF1a
	yr4UAF1fCFn8Wr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziFfO5UUUUU=
X-Originating-IP: [112.23.163.108]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMQldq2g502LCbgAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_092208_825413_5269C218 
X-CRM114-Status: GOOD (  12.03  )
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

phy_power_on() is a local scope one within the driver, since the return
value of the phy_power_on() function is always 0, checking its return
value is redundant.

Signed-off-by: 李哲 <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..f7c32934f8a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1645,23 +1645,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 	return 0;
 }
 
-static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
+static void phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
-	int ret;
 	struct device *dev = &bsp_priv->pdev->dev;
 
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
@@ -1839,11 +1834,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = phy_power_on(bsp_priv, true);
-	if (ret) {
-		gmac_clk_enable(bsp_priv, false);
-		return ret;
-	}
+	phy_power_on(bsp_priv, true);
 
 	pm_runtime_get_sync(dev);
 
-- 
2.17.1


