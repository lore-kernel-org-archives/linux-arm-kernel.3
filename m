Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C886CD2D10B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=; b=V7ot4JF1dlA7HbYKMCyhyZboOb
	1znGhemazY+J7F3jJSsxS8grsuaon1T0LqCk8JprG4pyZK9W3KhkNadm+8TSPzD4NM3Ga8kuimAo4
	qizYPW8879efI0DcQzlwYbjcOBec22ORply+d7JBizQSrR3KkU7dwfkQWTELyckq6ubE5Lv2l40Qx
	9zM6//Sw5su7Q8AkB1EQ0Qy3J17+93foYzMen0wc0j6uFPDbdpuUY11Qa8uoE1zymAwxQP2aFrLog
	zJPyMVDCt10y8dWdMS1RBLC0gDL0xk+vMERHD8EEJJ6vxqTvNJEyiC6klsjexYS+RkjHAJkrnQpRI
	HLZV4j8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff9Q-00000007Cyz-1jLM;
	Tue, 13 Jan 2026 14:13:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff9O-00000007Cxt-3Ews
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:13:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so76618605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313617; x=1768918417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
        b=XpDLWTD561kDiefAmM3bBTrZRLGYaL3NfOD7Vh8m5iLbUiQAtuJ7nIBMPNoyCzHvcb
         AmVcV//zmeWr7lhBpN6Gm9ZbUI6zHp4V9TDCE2jdrXwKqdHot2fLzF2/DOhx0YiR14O2
         rAvYnVfkJJR7j8MDXIvSUrbPn6YD04YtCl0MKas1fk4U3GhTzmFOIDPkfhxdufAMwo3A
         saCA9u3OYY2N7u58p5ul12CuV2ptJbh73v9IZFJjcejWKD7BedaY2o4EUTCamMCqkMmQ
         qULgD3JyErjqX/LV0JzvANwKxlsFLThibZOF7nfK64liO0VcRm+x+2CWTVCCd6dMSbEh
         uanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313617; x=1768918417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
        b=bgO5Km/Od5ol4TYqh2YNH38CdBpYfe+L2OWmHkrylqCiMgSEcqgScPqao2I9TyQoZz
         qz4/lGbWod6rf2HPZIbSi1lE9iJfVhIl69mBfbDLxiq6R8D9ulcfaefZW2WuX6/lj0FP
         2cEvXFeQ4WdJDbYO2jYziZeadP+903ZGg8NTUA9pNjJfONHYqMSQXiIoS1SYVhfsb74G
         MnUIDvFAyG6I0IhIqeK84fLZnx5WVMFnajgaax9HSl8KFJ1iCFPB2iIrDSnXjbUJBUbt
         QgbzzLYwCs4fDEYbhgeuEXKm/Hq5NHizsT3cj4ZToMcTkUN8oVXtAtj6IGkZpHGmcfeI
         uESw==
X-Forwarded-Encrypted: i=1; AJvYcCVFrjloT4xdqEe4UHfWgcQ5ShpZ4SYnfFVwg+pA6sp5AtHqYmVgosVB2LOZC3zNN/ttAYtWJZ2oyW15WukExODQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyt1rTzIwjBHbXOGoS755pRJHXIjOJoShAS+iotfT1YQWCdllD
	TKy6ktRnM4O5IbZc8lruQZq6G5ZEYnSQilpgPlFqCW5ZmWyTAVMKkb3t8law7kKXhc4=
X-Gm-Gg: AY/fxX7vJwQPKr6MkWsnxTuLtsVjD+o0ZLi/XldNOgfIizPYrLpNcENmFfgQOlg8Enz
	8uYiKpcXX1uBonhgKfcdvE/rkm5gTKac8QI7+LYAznwLma4DXpjSZ6mIOhOu70OXWlQMw0gj9as
	hXnUdnAG0NubNP680N2CAP+Fr30VFw+IsKyORiz3dLNUS2K+G44XnM9SsQ3jpn/GiN7uLAbDdXL
	pFfwNQw1NZsfK0MFFKHlQ/z5VkUiFRdOu5YPkSNsMt1wDvwK9gvBjD2dF57sAfQ7K4FnCZgV2PM
	3duKhnhazJ7a0+Y7LMRwf3gAYT6siKbVgKhaxXH8a2cahKLLlWUGlspbVdb0u0gV4+F3VxkS4CJ
	vQJ6GhaMs7TcFLSjCMTaxAh4lGRPrF4LEYY19pcDO0/CguktlSVkOjy/ad7zbtCotKPpFTKXIks
	zAycxVJSngdOlm6KfJ
X-Google-Smtp-Source: AGHT+IEV6roObAcijlx4iVb9hdZfVlmXIQUK0U2XACejoOBJ5fxJJv4g1ZBGNz5KDAWxxOTyVwwC4Q==
X-Received: by 2002:a05:600c:45ce:b0:47d:264e:b371 with SMTP id 5b1f17b1804b1-47d84b30d79mr233877785e9.18.1768313616542;
        Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edb26792fsm33518525e9.14.2026.01.13.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: [PATCH v3 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <30e6a67514e97e798905872e2907b5b005ff2292.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_061338_831867_7ECB4856 
X-CRM114-Status: GOOD (  19.11  )
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
v3: Unchanged
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
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


