Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D61DD5B177
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=; b=DGpqNe6qEfg04KLuJbxg/1hxY5
	c1VxBXowWUWc3TKJg/0RZhOF0iQz13905jqmHCzGG8Nb64Qhtt9FBxFytqtwilKfwnCqtqwsnzQWa
	KzZFVec05Whp0D/XJVFUZtlwukZdzB0LNOKGJx+RkM9WojHvZ3uxfq/YngpKId/ZDTaJvIWI0d3Zi
	MYdITSpYLOzG0Sj7knjXxYRlqvfmsUZa1tL103U7n1a6EYC+z695vR7EfFFnyI8Z1nycLbX/9kDms
	NqvUy+WsRVgs8zf19dyISOdrmFnSwIEVHhmKgyBei7CrqlNGKGOF2q18ez4uV4v6q8nUAzP84cIH9
	HmrLmQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9ls-00000003opg-2529;
	Mon, 15 Dec 2025 14:41:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9lp-00000003oo7-3Cpj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:41:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so27245405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809712; x=1766414512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
        b=PiRLrU80Ug5LrNCYY7cHqTVm0aT4kO78dssDMSDTPyc07LnYH9DCB6hPQpELZNsJIm
         XQTkY90uatfap4QppsRGjWjHPWAEpAufGh4V/YKilWlpO+4e1gAZSLACFFgPP/t3uH+6
         Dc63gSutP345kRtFtTohRBzvqrxtgb4s1WWHqV3bW9CM0hXPweMMmExFJddBx0rxIS6w
         VLSB/NQU5DC1uJyS7pUhJoh469a32MPvl7PDqqBpyvBBPXmKtf2x3qZ/1BFibX1Kzk4w
         rSFRPIA69b2LVkwbEyCUC0gqXUO/Y5+x5owfmCNCL4wcagvOmRTEOFSTvbbsRJY/yyJd
         /P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809712; x=1766414512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
        b=Jv87zIvJ20mtiwcioIpLDwzfiMeYQ9uYf4KbwqxmCZlTjT7c3TXD9Ht75vyav3LVaB
         whURsHxfUpHbFzWJIWjD8+1VpZpdN78YrfBWdPNEgKFw/Y1eGnyNGLqU8mqh6YNyPLwE
         Yqp6wImVYa4uM5oQ2wsj3WaN56MQx8npuSFBJFkb3ezDySiNxw/NYDxkBQISMgbCfoN3
         oxAYI1tNovtaVCzPKkM37SvGu3KN6V5uieShhfJGUiJsG32Q0n8q2YrliabFVxLQjPjk
         hu6yGP0kPuxoErdxq95+YhO+D9h0VOtF7WhvS3w8iv0m8ckYJNvCfJviVMHm6msN1o21
         hoog==
X-Forwarded-Encrypted: i=1; AJvYcCWPqAAMZH+/lYdqyBw/5Mq2dVjz5fVmc8e4sK8En8t10L4d/Fnf8ZvnzuoiXg45gl3Xvv7XFzgm5AFpOAezrtsn@lists.infradead.org
X-Gm-Message-State: AOJu0YwoAi51j80vAR1oyHOAQB8OwzTRtfsw9q6G/svVG+rXVGCEG/V3
	ZbtGK4p2EZr0bPjod0S+WM3+9X/3hPJGyWg4w1rqyw9dL+0FUoCffrH4CZtARR6zV2o=
X-Gm-Gg: AY/fxX7aLYezivYH2QFnVNX2tv2ti0XTRvOFm5w0Wyu5Tg2ak9B7IFyKpmuVIqBpRhW
	19D1//WwkMHq9WJr7BorF/wRPskNSnqGzmMDFgENNR3TZrsbwOwslp7NXV1hPCTjJi+bI8z7rXE
	FzYot+oCbOMeCtdxXT2Bif7f+DMgY5CZ8qax1lXc3lnBMRcdGEL2DFB1nssNpEeTT1nyrgSEQAr
	G7ppVslSuRgoOq0+IZTU6xhp9q0W3o7J5pq6epxLZLnIg2aJyCInhCFNpv2aeBABcTyI7714RAG
	gl3Hfq2iZuBCJA++UfY4X7kPv5P5AHOsRoFS3lViH/+psQqbAmV9JxjYvC3akKWuiof+/+3w7FP
	vlwV+i3S+8Mew+17tUyx5awlJaVdvFTYdWvKswlS19HJXReA1tHEeDkW47QGeORbdnfLakER2sv
	eNFFyKE7HNlbsJc2snJMNfmQlwdPg=
X-Google-Smtp-Source: AGHT+IEW/XhvEhUWKukxpWXuAbDWYWTlu7iooVXodta81YuWRVJW/8nSpMCMutfNZkEu59rJRR8Kmw==
X-Received: by 2002:a05:600c:35c9:b0:479:3046:6bb3 with SMTP id 5b1f17b1804b1-47a8f906f07mr122335555e9.23.1765809711699;
        Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9a06sm187528625e9.10.2025.12.15.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:48 +0300
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
	imx@lists.linux.dev, linaro-s32@linaro.org
Subject: [PATCH v2 1/4] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <f7ee93f0a8c6d6b9de3f2b37da9e038bfa7f290a.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_064153_820532_3C9968A1 
X-CRM114-Status: GOOD (  19.08  )
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
Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

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


