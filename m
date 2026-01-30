Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E641E6BF0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=; b=ZDXOylwnZWdPCuvxVP4wrdFss+
	pNZNBriOnSZrdJgFUdc3Ctcx/qkWWekpBfJgiEOqtIbKha0javOBT7V3fAeFVbbCoqgXpL2yPN2WJ
	AXVApgJnLP8m27wGVaVf2FUnLvuADhS7ERmnGJK3Qh608EtFhG5+KCUXHw9ihW2/BBp/6U+5sNqW0
	mhiu2KnrpdG8s3rHvyUTSlWXmkoeOyxQkI4NcDiGW7p2a5UyVtbTBd+H9tPi+014UZRH9HfHw9pFR
	sZ4heefd1wILrzSlJYx7AuqdipEiutRrBL0kCBnFuGw271NVFeC+Xr335hEeDDgBuhK2HmmkNjySB
	F1W6ZFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPf-00000001WJb-0fCu;
	Fri, 30 Jan 2026 13:19:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPa-00000001WI4-3Nju
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:19:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so18036335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779185; x=1770383985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
        b=cVBpKWfTyUrbfN8KXkIqRn6VGaNZoqQpIgWWDJc8FD/RgkgFoxPRgjQcjyWTFO123e
         3YRu8a0+IzYeFbmYsA2kLo3PVmHhYFlrjrA6pqjOHimXiN8RdKiHwQpbo0UQNGTptRzP
         IIpIj2JzPUuvKJxsnKqCBZO//RLbgZBEVZEPnxEoraXUQvyc66U14HEmsaQTCdielu9Y
         PiAHnwqi1tGW4uJ3gDoKjThrhhciUvlImUh1ByzvIogkoYkeA36FtvyvSqH87dGxzrc7
         6d6Jh261yvkg7IsiavE7Gb+GHuuYMnYhYH6sNQikzvNXFy6hSDoitd+jBO85OSX+Dqjr
         0QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779185; x=1770383985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
        b=AapChxyVoZh3qjhy5g7iaEsCcJJ0pTY3fCusVIN3zPe/JLwuDEzKDAl/V64AI9NSSq
         ckPzN9rESF9dNwjweVsnJgqRLSD2xC9cW9L3AghqwxhcJUTwla9ZGcjRY0oRVbGVeNL6
         nBcvraBvoHB/s7KbQx0nFoLevZ4A8S8YsH4wFZ7GSomEhYqb6CobxvuMsA3p3py3fk2E
         ZS1UHi1c45BBhS8DSUUrc41wMwqeShECyoQ5ijND33roDAqv3VTjacb/AJ+hYONYEJ2U
         YGLzpUYR4VM6VzTGHWiikfYgNA3bG3MSizKjoRsxcsQZzNnn9ZV5OfsrNvzWOaX3hDM/
         DpjA==
X-Forwarded-Encrypted: i=1; AJvYcCVBit+rJ5wHo9JFnqjKAoK+YDD4R/zNiq0My6YcVXjT1rKN6+AEmtVY8U2ALbplbqLSrjceeT1aqZDYp4IaerTY@lists.infradead.org
X-Gm-Message-State: AOJu0YykyaNnenby3lnGwBTwEVeITk4oOdc97R7Tub+PwsbsM6Uu5wC8
	zksUmaLKjPEWyVGkpfh9dhZSumO5oa9q8ZAE8kriMIeE6vAewp/5u/0TOduQhY89mls=
X-Gm-Gg: AZuq6aLuFUZJ6C2V03gk8XlqMm8r2+fjUbI0CyCN2DkS7sG3/n27hjcCr+L2v7vUAj8
	i/HgH3QpzXXu5jlD8DO9AkDWstMoi/tvWCrjW1g+T7Bki84llT8mpascTctUn5kTPDXKOgtE523
	lZHpKLa9r/eV2qLE4YcPHwLDNGmVaRDmE+Be6y41Nk1UpwPPEgZVG9C0Ef+wkX9bOzekxkPaL85
	mhc02tPNyUCGVXQGeorUqdpLPe5Ypg+PUO25N4+INCLYQHYh0iVE3sG6P2DiAGbWmQDRvl4dgqv
	V0UA3VCWAdueVBvEKxW1SolkLsIxyguZ9m5fHd5qQIbN5UooBiex9nC55d7dPrdDbYqio2yuyQB
	+/vk8hEioNW4U2YdaF+mO46qYtYAh827HH/7nbZqasCl8fWJwk5SDcgQngGj6lTyQbiWZjMiiKV
	mblHJkXW1UTUurs/n7
X-Received: by 2002:a05:600c:680a:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-480828745d7mr89683285e9.3.1769779184609;
        Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm200882875e9.3.2026.01.30.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:41 +0300
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
Subject: [PATCH v6 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <b6b60d03344d070b2b4db7f0f00527f166e594e0.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_051947_560406_17A13A8C 
X-CRM114-Status: GOOD (  20.10  )
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
Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
v6: Add Jan's R-b tag
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


