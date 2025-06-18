Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874F8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm/933WhUbzY2Ue6anpW6daO4H0jv7g+t//DGt737a8=; b=XhHDwzLuTxWs0Dr3WHtbGP9hbW
	orqc8y0Qh5OX7nf/Jg8w/Du20Z+FLFa/bGoHxQ57TkEQqegTkUdu6gBwLsloTXzzkr7QvcUdbPEf8
	0WbOskUXYEA7H7AavMf9wsWUrH3ACYnbLKZf7PFiSP2qW5KaZuXvHGEGuI4APSakaJg0Btbpc5zHE
	X917m+vMO7CIzCvst21DxlKv+AUFaM6nlsNsS4YoZfWUf2i0g9+ve/cpSmQvTb3S9iK9C6xkjLdQT
	ehHdfiSJdU2UfO0jI7ucoHFkXqWTyKLoopQ46jW76PJBceDu6smf7kDaADNB4sfVTnSR1amNClBty
	Aurm8Ppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsJU-0000000ACJv-0tjb;
	Wed, 18 Jun 2025 12:54:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqEv-00000009p9y-0hwl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cm/933WhUbzY2Ue6anpW6daO4H0jv7g+t//DGt737a8=; b=KmCEIcKFhTTTC5XlkVRRdi6Q6L
	gfoMjuP0cDyjUGyz6KEdDcJ4zuuhX1KMcLtXoxV8o8d3WaE170hQxYgs1LCHMXnbmT8GzEgoxu7eT
	JkAWuUVRWRg5kFGOnCZ3b6p2L8eK6I+9U2qGgn4b+RM07Ii0Zgys1xaiDlj+UCrV/9e+EVBDNvkgn
	+I0YA/ADwi77krhLJI5A0+xuqPOm+2SviJzaI/OosZh/q48Jb6AjhXYz0HvTTmm6drETWag1lHHQT
	Og5Sbx2F2kpBkYZ6E7CgL5yccMDomgqa7y8S55Rwy2vW0q7fyji2C+zrUJPhB30SPp2rWGGE3FeQG
	0AhIcjxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRqEn-0006Ia-2s;
	Wed, 18 Jun 2025 11:41:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRqE9-004c7G-CB; Wed, 18 Jun 2025 11:41:09 +0100
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data
 struct
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Jun 2025 11:41:09 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_034157_209616_22E0BF8F 
X-CRM114-Status: GOOD (  13.35  )
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

Provide a structure for match data rather than using the function
pointer as match data. This allows stronger type-checking for the
function itself, and allows extensions to the match data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 3e86810717d3..78d9540be10c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -46,6 +46,10 @@ struct ls1x_dwmac {
 	struct regmap *regmap;
 };
 
+struct ls1x_data {
+	int (*init)(struct platform_device *pdev, void *bsp_priv);
+};
+
 static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 {
 	struct ls1x_dwmac *dwmac = priv;
@@ -143,9 +147,9 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
+	const struct ls1x_data *data;
 	struct regmap *regmap;
 	struct ls1x_dwmac *dwmac;
-	int (*init)(struct platform_device *pdev, void *priv);
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -159,8 +163,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
 				     "Unable to find syscon\n");
 
-	init = of_device_get_match_data(&pdev->dev);
-	if (!init) {
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
 		dev_err(&pdev->dev, "No of match data provided\n");
 		return -EINVAL;
 	}
@@ -175,21 +179,29 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->init = init;
+	plat_dat->init = data->init;
 	dwmac->plat_dat = plat_dat;
 	dwmac->regmap = regmap;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct ls1x_data ls1b_dwmac_data = {
+	.init = ls1b_dwmac_syscon_init,
+};
+
+static const struct ls1x_data ls1c_dwmac_data = {
+	.init = ls1c_dwmac_syscon_init,
+};
+
 static const struct of_device_id ls1x_dwmac_match[] = {
 	{
 		.compatible = "loongson,ls1b-gmac",
-		.data = &ls1b_dwmac_syscon_init,
+		.data = &ls1b_dwmac_data,
 	},
 	{
 		.compatible = "loongson,ls1c-emac",
-		.data = &ls1c_dwmac_syscon_init,
+		.data = &ls1c_dwmac_data,
 	},
 	{ }
 };
-- 
2.30.2


