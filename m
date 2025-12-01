Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093BBD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgBCaTCV//Rn+e5Ee17YCnaLfz3jOXD1AdP/EJu9El8=; b=IAzXjOvX1zX/zE8c9vgyzbx7sC
	3opq3IK8gALnPVvp60AnrCp9fTcQ9ewTWr2UD5W/WNo9cJetNLJ5fVqJg4sjnsQOCqmA+DNGiW/nT
	No6eF/BDPMw5NUzR0G8uTb/JWoLOunNJ2KgLlaNSCl9Qo21gPaX95lXV23ZnSz/QaB0h/tLI7H6AP
	+q/86Y0gqqjBiQV2v+NniVwTKegCWRQ4UMem8HJ+Df4GBoxDrH4P1q7ko7GqRQD5QoWdGFjKMxP6A
	gsL1UQqp1ClLJsS7/bDatv8dkl1m6cv1xmliwPQ/CzaAkEfq48Oi4rDnpRwqNj5Za3ugkMwiYDoWJ
	y4uKcMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ410-00000003yzw-2oh5;
	Mon, 01 Dec 2025 13:32:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3dh-00000003h3Z-2qLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:08:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b79af62d36bso77630666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764594504; x=1765199304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgBCaTCV//Rn+e5Ee17YCnaLfz3jOXD1AdP/EJu9El8=;
        b=xHWl4VOBRSMVc2QcxGPy5mQe6zc8wppYKK63QTbQGAHwf7l+NhD3BqIByWOmz0Hgbt
         Iua6WpkrPcbBnm9GtlRcXtU5Nc5ZHNFKnLhvgnxMcaPdwKtXYDxQ01Apn9Ni1xgrym16
         zgDB86c0o09/X8Pi5TkGp9kkXRGbWFn4jzX116rZPPW8otEi48w3k8Oe6LNLLHaDMsxd
         tsdTYv9QUYaOpYuPWE68LUmw7+TqRXmvsrXS9YtK/vS9+R03UofPlSfSjCtBDtWC5l0w
         u4JI3FrrP5c7EPPS2mFnE6cl2F4fXI0haNvdUtr57iS6dETKmmpIyBeOFaZDUI23tSsD
         qpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594504; x=1765199304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgBCaTCV//Rn+e5Ee17YCnaLfz3jOXD1AdP/EJu9El8=;
        b=owgOatIHLvRGx9Zt/9G3EtHc2hKkjgjpcSheAUSJXH5dtSeEN2h3Pg/PJ2yxT19eLa
         u/XzNKZvncjclSxGJNXWxbqZjLf6sg7lZrISBuup0k4rbbkZ24TX3AMU+nCbZOG/h/U/
         5S6edUzd0DViAK6pws9JelQ/iSjum2cv4/mHOZzcbi5PBFOJH2B0jT+Ttj3Ioo3yi16S
         GVlL/iX4MEICpbtn+t7KZdhb/sOI5TSDZ1ZtO0aMYXZBT+rc99ylwKKtFoR//e1PV7p+
         zB2O7wNyL5jNpsizs9rNheas3Zym2nisH5uIzDlzaTr2RF6jLkte976VwBB0NyUSaE4K
         i9ng==
X-Forwarded-Encrypted: i=1; AJvYcCUvq1qJCe89EmEz1VDv7/gFLRDlfGKndIfm+zek8SXO6Ht4i4c33PMz2uzRPZYYOor/fkR+SqCA+WvTTrZ4rrd/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq+3yD6lX8fbIQIQzaDS4wy88Iz0Mt2Hr+rxOvrqvPKwELNrP7
	HKYL+UE77UDeMmu2+1e0Dv/8w9g2daRHr3scCwczuHj5htOIxprDngm8QjagGbGgwXE=
X-Gm-Gg: ASbGncvvAXRRdXPV9VtVeBvXgTRKhpqVKZJ1EkybPZnZQXDawMoz3YOH+4OfRIbBL4T
	tAFi35T29p9ZRt0FqOYVAyZuE1FQyDrxFWzyR5i9WsRYZksxHFvBjdP+GsNFEg/nv3MVD99tvvX
	5wBLpQVwMt5DUkwCDR6L+mFxaY7OQFlMqFRga3iiGoXNQyr86zpdV1IKsUbxvRfQbXaJ88+Oie0
	DIr+alTRIAJEb1EE8PcuOQz5PoftkhulruOj+lFUhab5VPbi54DJz7WGlEDjJbIs9Sw0QB+yiai
	M4/PCxKCI32w29mAY+RET1xeWTh/aGCgl/7Yz7qgS1E8eBE9hg4R5ztFw4hbFOwqcJYA/h0qk/Q
	S6IAo2hSiIRG0PNRgYbZdIoyXIm+9VfkwAchkcrsT6yptcSuAQO4wy/dB0vp85BxRGqJFCXoyU5
	3WKTg5i/t5pz9NoREH
X-Google-Smtp-Source: AGHT+IHy1zdsI4FJOvPH+ImtRkIFvBBnlJmdvObrk1mNXIvYLiipKTmpgEyhKmFkKGd/qTfSabPc2w==
X-Received: by 2002:a17:907:2d12:b0:b4b:dd7e:65f2 with SMTP id a640c23a62f3a-b76c546d9d3mr3021007766b.5.1764594503849;
        Mon, 01 Dec 2025 05:08:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f519e23esm1251235666b.23.2025.12.01.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:08:23 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:20 +0300
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
	linaro-s32@linaro.org
Subject: [PATCH 1/4] net: stmmac: s32: use the syscon interface
 PHY_INTF_SEL_RGMII
Message-ID: <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050825_734296_6C9A0BB7 
X-CRM114-Status: GOOD (  18.58  )
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

On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit uglier because we to maintain backwards compatibility
to the old device trees so we have to support both ways to access this
register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..20de761b7d28 100644
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
@@ -40,7 +44,10 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		regmap_write(gmac->sts_regmap, gmac->sts_offset, PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
@@ -125,10 +132,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"phy-sel", 1, &gmac->sts_offset);
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


