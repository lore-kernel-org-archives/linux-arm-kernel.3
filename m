Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C6FD778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmphJA0oiA6TDyGHVSdklpPRPAEFYSyTBQggvAD3gKE=; b=mLGbSwN6DNOyq7fDqTIltgDePm
	qRBv5XKtZhDbmb9TTCEzDElmtndQ7WLzogzeWSsmyoMAHYzTlfQaK8VGToPVQrV8YiyJ6MoyrAcso
	xRxmiuTFNMLjLa5aJIALbZFumgmRf56l9rzjztKpbyuONNNT7tK0UNL/GTX89OMmlNvTaWmuJSMcU
	U68QsboN0A1cPILzCEn6eWG1DA6SDPDPgJi6uDDxYHPg0mw693uR1rxbUMXspzEtczAZCIBzz9fKm
	8Qz7GLcAmATAeBFklrU7mOa98s7MqFBdssY7kgke3yfhVaRRY1VGg21NeW6ZikNf8Hh/XYBse3hn/
	+UxT550w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBf-00000009RPl-4AoL;
	Fri, 23 Jan 2026 19:51:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBc-00000009ROi-0izV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:51:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4359019da8cso2446377f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197874; x=1769802674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmphJA0oiA6TDyGHVSdklpPRPAEFYSyTBQggvAD3gKE=;
        b=YDe4ANpU/eaeWKdOlzjdokuPAYh/Fe3d0lxWfTyLHBCmz5YqruQiXJ34Xta9W3TxFz
         kPePZXMc3OqISXer3G8XZ0frcqLiUTnKLS9oQ2Fnf6bZEbhrW18yBiKl4ge3MMK7QVFp
         rd5jZOSMoczQnAudorJowPOqGNzWxhPXfBEG/y9CvUrL/MM4zBvPIoou+LN4AXW3xs9O
         kqSxKLqoSvwyYjsmillmJU82tV4MPlxllStp3uK1ZXgfYmW0ZIbAYBkJm7u8IFMWzSib
         1hocEEmPs5ErU6p7SPJTd6351DaC7YW1sr11urdUfy+8BYDjI20Vxeu9fBTo5WO4PD/w
         BW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197874; x=1769802674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmphJA0oiA6TDyGHVSdklpPRPAEFYSyTBQggvAD3gKE=;
        b=s7+S6WGf34VWSDc9yYbQTslCc8K5tfUiVocgQuErGoLRgwT7J7YcRCMcO7El59DMdn
         1o5gVDxOS40Qj7jTGoSS9myrKMFHPuchlmuG+xDjBAxYtTtQTuHcAejNLDlkGE4c85iT
         /jN7gPqHTgdx5dgPIIG6LAn3vHjHcPSXZOMbb4O5D+0Y9xaixdJHTom7C3ahZIK3I49/
         fIfrMS3RIPCwutssKycSPb/q9UFF18mo9C/i3ad123194kT6YlfV60kFzzqW7TPKeB0E
         oZHinoHqt/HENmk5mlc0Jy7TBUcwMo12JLffX8YWs8XtPG71r/yaBScaB8XCFvM5qiuj
         vrpA==
X-Forwarded-Encrypted: i=1; AJvYcCWjUVSEcZtQMn2zCJjkYXrcuHpm95yohiyIrlPvmzK5PnMSmiBhTd4dzvv8Dw18Mn4okugQqJHIQznyk+cH4eQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YzerrJHnvUpegbXclOzT+w/RB/Xa3GiMTR7kMuIBLxM9nT59szR
	+aDo1mucqNsoOO/feLQ3f5zMPnHl1p6iBoLIrf6remQs2CDcDn2K/+DmCatUlCDZAtU=
X-Gm-Gg: AZuq6aIMv1UDjXBrE5Nn91TbE+jG+nyMJlLwJf2O77Nghgw0AHt8JxLXtXrCh9tKpx/
	fQ4FctrFmr20DwwaqGIryyS/LMAwSjkD0w1mqlA88TxDRO3ir3JD0+Mc7DOpnwDukOtF8Cio1gu
	leEsBkbAVeSjlL6yS3crkNHq1FndcUFdmaquebBKQUhgwn1XXGEHECfj9mrLY4UR7kSFBq7U+2U
	/JMJNsY6wCQRukFZZf2qaE7XUYHv8RGUG60+S/9napyuonBogv+JIiDagfgA2NojFucOhxzz0Pp
	edpCrj89PLiIls9saaOTrNKBzJkEgH80SQJwYP6VaJwLU18U/U+zjtTv/zKom0I6V5VoI2aWEK2
	3S6RO3VVb2G+8rhyaAinIUNvfdhuIRN+UEWujQqdqkBtCJMhEd9puRTvuc+4Nj7ygYkUkz3tlTT
	Wv9nDKok65vLLUm2Dp
X-Received: by 2002:a05:6000:22c1:b0:42f:b707:56f0 with SMTP id ffacd0b85a97d-435b1605719mr7557722f8f.37.1769197874256;
        Fri, 23 Jan 2026 11:51:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm8529079f8f.30.2026.01.23.11.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:13 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:10 +0300
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
	Frank Li <Frank.li@nxp.com>, linaro-s32@linaro.org,
	imx@lists.linux.dev
Subject: [PATCH v4 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
References: <cover.1769195864.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769195864.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_115116_232064_A5D3C4A7 
X-CRM114-Status: GOOD (  18.90  )
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
v3: no change
v2: no change
v1: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..2e6bb41f49e1 100644
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
+		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
@@ -125,10 +132,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
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


