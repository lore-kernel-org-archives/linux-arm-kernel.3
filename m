Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB47C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljd/4gl9s8BMLZwtY7uCqzAwcB0VrpKpPpDg1DCzLNw=; b=4HUX1XEseazhKe/55431iAbHDR
	dlbYZhsO4ztYpeBOhACjPLYLOPGANyOE/Oxk21UgL1d8SfyxLSU/ArUhMxHhWoG3lq+Q4DztuIVm8
	pPz54mRLqI3rO0udyHWNTsGr6x5YppyhawmLmIqBIciYPX397xwuWB/icldFJVObqActsU+Bwnpeh
	zMLLuLOjMkRqvpyeWosYLDjq3n5fW4tbF/u/ZFhZ1ntKcOqM+wsS4CqdYHn/dd/VrXVN6pON5rMm1
	l4ChReIfApcrKPz3aszFzPf4+ZNRtuFgW2IGgkmH72b6HS0cugO3E9/r7YHiwJhMC6rVSgT7A+ePS
	Xw8CA/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIRP-00000007ytf-0igV;
	Wed, 12 Mar 2025 09:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHY-00000007wQ5-1DJC;
	Wed, 12 Mar 2025 09:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Ljd/4gl9s8BMLZwtY7uCqzAwcB0VrpKpPpDg1DCzLNw=; b=nfaBio57ppRRFZPntwqTB+q7GL
	8OCEUgUaGeQIDvnaizJZsZ869/ZLfTCKojr/pn2dhz4trvcsdgKQPj9okXYP0iYWrOFqozOa1Uo4a
	jxIqWAOrhL8vB/I7JRNKYcpgFDl2ugbecbiRbbBrag//NQ4ZVuclYhSRNoABqTLigjLJLX1a/9PpZ
	PJ42YgK70hqp0IcDD4fflLlVZWi8h5XoOQXmlUtZXESmXA7WNYgKF8ioPxjLor8+tsVxlS6eIMOGn
	S/sIV6wjW7o/Z0XyvOekpabtJ8NCsWOLkHFRn3q6217l2YXde2Z6uGwosLInR4qegGsYYLQD7/JRp
	ZZvXhyBA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHV-00000002LLA-0fCH;
	Wed, 12 Mar 2025 09:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ljd/4gl9s8BMLZwtY7uCqzAwcB0VrpKpPpDg1DCzLNw=; b=Xeh2oXMuFYJw2GTzizDBHsyuGM
	wZsjxAV4cZVsFm/b+P+vrTEtu4EubFq5O+VecsRs/8AoAumd1gcJeuzq2cX9H0B60XDhXDxxI/Qsm
	mFjEZkDQMWfez7QEzDsXs8vQaKT+zoEtNgetqnoLxfpLYGJUya4PTCcaZY6o+ILGrNvql97WHz5Jc
	tt0y4Z5MTpJhg3K/YIREUFB3hpYV5QCWL/mWSvCyUR3C4ubfuiu1LQr+Mcrb4amNheVKAk2L4Uz+e
	3sSusb6yW+6h04nlxTJ8iXVXvuZsYYBAlLhm4JxELa4nLh7hVW+Ph5d2dGlcENc86lv20xJP3/Xbk
	ZCG6+jBg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53872 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIHA-0005D1-37;
	Wed, 12 Mar 2025 09:21:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGn-005v02-7G; Wed, 12 Mar 2025 09:20:57 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 7/9] net: stmmac: sti: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGn-005v02-7G@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092141_455956_4ACDB8EA 
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into sti_dwmac_parse_data(), and set dwmac->interface
from plat_dat->phy_interface.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 13b9c2a51fce..be57c6c12c1c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -185,7 +185,8 @@ static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 }
 
 static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
-				struct platform_device *pdev)
+				struct platform_device *pdev,
+				struct plat_stmmacenet_data *plat_dat)
 {
 	struct resource *res;
 	struct device *dev = &pdev->dev;
@@ -204,12 +205,7 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_get_phy_mode(np, &dwmac->interface);
-	if (err && err != -ENODEV) {
-		dev_err(dev, "Can't get phy-mode\n");
-		return err;
-	}
-
+	dwmac->interface = plat_dat->phy_interface;
 	dwmac->regmap = regmap;
 	dwmac->gmac_en = of_property_read_bool(np, "st,gmac_en");
 	dwmac->ext_phyclk = of_property_read_bool(np, "st,ext-phyclk");
@@ -268,7 +264,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	ret = sti_dwmac_parse_data(dwmac, pdev);
+	ret = sti_dwmac_parse_data(dwmac, pdev, plat_dat);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
 		return ret;
-- 
2.30.2


