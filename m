Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAAFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWTmdggI1wrqKzQN44F171C0Oq8MU3PXDbUpFboH5dg=; b=e0aboBXnrVknBrAZ6nVoRwkd1Z
	IK/p+NmDoHZb69nbVeWIxc/mLVGklaGE7/VFAZT4Hps+ifSEpZvCOy1kqZSSKlWR0r7fw+y3o1aZw
	PnJylF3n/ja7dBot3knZq3yHo5p5FJiUk/yHgVuSRiTnhUnlsQLimsc2T9m64DMI+qXTo/x1S8ci8
	JPiGO/583yIlXBqbW327HC18yDoR56KC67o8M1k+/Sk8Ggt2H/V4K6rkL6FO/B0w3qhJlQddW2Id4
	nAme5wZjVUPiu0qmgwIfsrd/CYsFsFZ1a+71GAAddhbQvTmcEJt6G7iyFBmXTXUeLMgHjRIC7RIwX
	RdJH1cGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcAa-00000002b2b-2ONw;
	Mon, 10 Mar 2025 12:23:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbyR-00000002Y7z-2ji6;
	Mon, 10 Mar 2025 12:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aWTmdggI1wrqKzQN44F171C0Oq8MU3PXDbUpFboH5dg=; b=es/Rpd3PwEPJxZRKiCIjjDwd9k
	ehkjloYok5y0PwNlCriZSGPf90QjawDiKF/SWpXsE42pv5JUCh1XXAp2Msn5v+SHGER1Q75vIEd4u
	dTwo/dhf1bhq0lwMJAZhEfaJsYvH9+jVBuOvEhNA433CkL/MwvGdftcvJtqeiiJ0ZK08OaNYXACMc
	+/dqDn6FwCXr18QuphazWCwzR+QihwgTjRE9frL0UQSXYk5XQQ2NKJYSprvFr3kp7hfL1qBWrzvWv
	8zzbipbZD2mD2EC1gZ5YFTKpIrAsKS+ozt9izFaiCN/9joCwkckAhMthVxcCBMp7FkiBzjDCitGEg
	eBo7RCOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58186 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyB-0002Yr-2g;
	Mon, 10 Mar 2025 12:10:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxq-005qYG-2E; Mon, 10 Mar 2025 12:10:34 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 4/9] net: stmmac: ipq806x: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxq-005qYG-2E@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_051111_687443_89EA1EA0 
X-CRM114-Status: GOOD (  12.34  )
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into ipq806x_gmac_of_parse(), and set gmac->phy_mode from
plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 0a9c137cc4e6..ca4035cbb55b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -211,16 +211,12 @@ static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, int speed)
 	return 0;
 }
 
-static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
+static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac,
+				 struct plat_stmmacenet_data *plat_dat)
 {
 	struct device *dev = &gmac->pdev->dev;
-	int ret;
 
-	ret = of_get_phy_mode(dev->of_node, &gmac->phy_mode);
-	if (ret) {
-		dev_err(dev, "missing phy mode property\n");
-		return -EINVAL;
-	}
+	gmac->phy_mode = plat_dat->phy_interface;
 
 	if (of_property_read_u32(dev->of_node, "qcom,id", &gmac->id) < 0) {
 		dev_err(dev, "missing qcom id property\n");
@@ -398,7 +394,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	gmac->pdev = pdev;
 
-	err = ipq806x_gmac_of_parse(gmac);
+	err = ipq806x_gmac_of_parse(gmac, plat_dat);
 	if (err) {
 		dev_err(dev, "device tree parsing error\n");
 		return err;
-- 
2.30.2


