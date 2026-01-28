Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF29BD35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=; b=e+W+rRioG21Z4cj5LuQxfDBLSy
	XYorT57JPLYY+QFhQzw59GmVS1uSSc/AQrHWyhujWuj09Pw/+NBfMonYqu5ujDPKcwmKlnMJ7W/tT
	OQmp+IEO/W3tSuKzbCwD5e2AZnXL3CnYdFOY3GZ4ZDA8A5LqVFShD+aXM+UavnWJWaF/jTJtRcprA
	I9kWOqrHjkgjien2r3NsVvcOkHPrJI5W7qv5OP5YEyIVmegH95Q+vCrJhMtp8thNt0hgQ45DguHVa
	ekbSD+CJoZRDu/Jc0V0ZbTzm/83eKQThkgPJDbjO37DaILoFHVZQtvLvGNgouEq1P6KELe+MkfAkK
	8jh+rKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2FW-0000000FmOg-0FW2;
	Wed, 28 Jan 2026 09:54:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2FT-0000000FmNO-209e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:54:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso5863225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594045; x=1770198845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
        b=Opb+k07cjv11jgHJBd37HC3ALUt8fXhe70A/a0pZR/5BQOxQShrZA2GuIblnEwqVgl
         aAAVp0JOUMY7roroYuln47Sq7QDUMdE1s7WyKU/Dk5TSkJVz62L/jwFC0qtdCocC9LhK
         V508zQ3BUU5LonWjdOOWbTdUwdBr67qlSzcyWPPhJRwfzubgjzQaIVsKLb6/saWHJwHx
         +Br4+usJbLuIvdTtPXwNtxiajjkTOfd/TBPO9RZS1Hu3N3guEaHsiuzVnHpwmxJyaq5L
         6gymDFY6ke9bYdE3X7ku4CzzoxFcg6VVJ86cBtBbTV9HiK5anSgQDMd8w0L0g1C9O/Vh
         KNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594045; x=1770198845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
        b=N77gEVV0MIz3cwdeM0GATeLZh7JPzahLhvsWUjTvOUsTMtdLuD9gGTWg4eBrlctmpp
         efywzoGrkuZ06eVMrfkd9r6ttbEmMWSdisJNMYo+vtP8Rz9EcCp5rokaVBEmhkEWUnkl
         wAqoVSST/1wDPLIi6l22HDSBa3tuq0c2R4fJh8FYSe0QwpREOedYuQhG0T7jDNIVwv/G
         8nP8hEYbIgGwIe7WmYblhf6owm1MyGVDlkai2Mtg666xAUCdLBJENb7/IF2AW22vSazl
         MZBgO240VhftDw9esUHPtYUc6Ah/NcVwbZcUyZjKq60EOcoon34WZwdm4I1KpjK8ZrFg
         KP2w==
X-Forwarded-Encrypted: i=1; AJvYcCUIQF4iVtdb6bRc+jjnB0RfHc/Vism3RhPU0PO95eixHGMPqsOCI1xye9nV1/RrUsVj0tetiRQgILMDHfY3ZHC6@lists.infradead.org
X-Gm-Message-State: AOJu0YwW859iynKziZi+WWaN56FKYeypLPkRQdFc2AbLf7RfYIecuLtW
	M/2NoaCTir2vVezRwkn+K8Q1ysB/nITLTlB71LZe/0oicraZwnG7rLxG7xkPAqZOlcM=
X-Gm-Gg: AZuq6aKUVvR5zgN1wh2qSJOCnZjSUu+1ggavNIeNs0ob+Abz1Mr3GoqfC6/wg4tlzwu
	+h4blaiSsxL3y+ydjX0BPSFNGHToAdrW1BCvplYzUzYQXGrEUxYeKIewadZAVxLRVNz7XrqzdlF
	cuoFD/TiO+gIHWSderJqg044Wxl0Xsf7kkuEau1XnnbCfNovpdTPQxL41XRJWA2ykK7ukspZDJs
	bcW1HiaxlXKTNiVIKjc+JCbP8u114WIwkuz/q/crLDkCWmd+GWSpMNyLHCp8EqICc5QbnhlJpiX
	RAYx0fGW9LxhOdiW51MHclxgSuiCyRvcuoUmAnD1cw3rjhQ8w8W1+hEUNYOxOB8zR7Sjj77bnSj
	zem2XjTrlVeRiIURlvzABJ2smPqvoKc4EpetKU5WY33i197vTf3uMnsfVsp8+WiF0c5PVkoQ8pZ
	iaqr3eEaeyUvOEapAp
X-Received: by 2002:a05:600c:458a:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-48069c6970fmr53235125e9.19.1769594045452;
        Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm51986545e9.9.2026.01.28.01.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v5 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015407_536486_BA6D6277 
X-CRM114-Status: GOOD (  19.64  )
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

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v5: Return an error if regmap_write() fails
v4: no change
v3: no change
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..af594a096676 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -11,12 +11,14 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_mdio.h>
 #include <linux/of_address.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -32,6 +34,8 @@
 struct s32_priv_data {
 	void __iomem *ioaddr;
 	void __iomem *ctrl_sts;
+	struct regmap *sts_regmap;
+	unsigned int sts_offset;
 	struct device *dev;
 	phy_interface_t *intf_mode;
 	struct clk *tx_clk;
@@ -40,11 +44,17 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	int ret = 0;
+
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		ret = regmap_write(gmac->sts_regmap, gmac->sts_offset,
+				   S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
-	return 0;
+	return ret;
 }
 
 static int s32_gmac_init(struct device *dev, void *priv)
@@ -125,10 +135,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"nxp,phy-sel", 1, &gmac->sts_offset);
+	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
+		return PTR_ERR(gmac->sts_regmap);
+	if (IS_ERR(gmac->sts_regmap)) {
+		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+		if (IS_ERR(gmac->ctrl_sts))
+			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+					     "S32CC config region is missing\n");
+	}
 
 	/* tx clock */
 	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
-- 
2.51.0


