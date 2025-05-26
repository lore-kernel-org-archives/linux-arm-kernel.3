Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4BCC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=; b=SlxrE4elamaGFONbSNE+rL6hPa
	mpI3vqoPmlsnZjHD3draMXsOgb3NU2ADdY2yn0FP9OX0zKHptwophKc7lt8+Efj4IYoWErnNlbTUF
	iP6yd4zEbe6YXH1U/0BMp56Kl0taQ9C8JMaw7R8nvAOs316m6tB9KxHOnB/BvwEMqm2f1R1weseaS
	Q2iHSr6j2Q/fOKo68GOFWV0JgZZNdUVQAt6A/+nh1HEdWUL72g16jiOe5neOKx6YJCIYrrukG3bLA
	mkPCfhZrtHsSKerpz01MW6asr034Sc0am2n75wcwpDBSmW/ThSMtQQ1zfRasd3bZfcR0oLa/62JEN
	l3RQ13Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLnn-00000007rSk-29SM;
	Mon, 26 May 2025 00:34:51 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLjZ-00000007rEq-3Gut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 00:30:34 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3dd24c86779so8123615ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 17:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748219429; x=1748824229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
        b=eZFfz5X/b3E0sWuvc0QGHedX+r8AlDJI0qs4v61pG4xDvXozcPag0KYzSi60k8l7et
         ogaebMI5Oa6K/y/xh2bZLk7MKxEsvPFwGpfnkTUyWj1XNQhYibvliMXLJVE8jo19c+9V
         lZu0EOjCPW+w9KaETMIbTkr0MrGzTyUPLmWYgy8/YMf5m6RhM6uyXk8DzKMRR0eKg72E
         fpmpZH78ZcBF7hMlUp895AloETqrb3R9DFLyqZRH9bY5n4ZawoHtAOUyihZBM1HEvKjm
         inBDZ6eTjsdW1V+Jg5MFgsJ97ouEogoEs4pWha7ZALYcBURx77hbQme37mZji8XrLbDN
         rMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748219429; x=1748824229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
        b=pC+uI0CrOEe8JJ1MCVAHkDui5SgpDO6IyqWFCnzZuzWzG7aUmrk9q9FTYhQKoCweBG
         SZTfT+H9zFgqRMshsxUqqNfmNRXG3lXB5ylqABTCKhJgRE6HX0lWDnfCxut5jv9Vdg/V
         YhI9M4FMQznJax8lHMIEFv1IS8hDfw47fyoGxpwS7EvOWvulnqfNLcvD5zaI309dwQcQ
         H61z6wTdxQ79TXTxFVvrA42y1LZQR4oJK1TBrVm9fOpgtNJ2i7zLcUiuF84b06oMslcl
         GTJeXqWDC2Dg/wU9x1Tdwi/ApgboIibreAfJLQ3r/CJlzChmLIumzvj+w3P0hBtoH/o8
         4b/w==
X-Forwarded-Encrypted: i=1; AJvYcCXo7ubxAMi2+34+OUGIZB2K7ULFtCDTDpJTp5nFPOxCp3+qd0sKJBiqSxudjW7k8mS+r87N2FRK1yHThJ0AWcBx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ydSPTBtnZFWmWfytZ5FBQAwX8TjCBXOAVX63itSAlDcYc7Ba
	EGBErgGNCRYOe17iibH852+JeEaH5ni2URIISVq+yTUlA7pL4VhIfUBL
X-Gm-Gg: ASbGnctQO9K//6OrraiJgQLnPldaVtBSwG/HPLocjEK/Q1Rq7VOHUX2qHYMfdNwewZ3
	6YbkuTxVG2lNK6qwI4J3P0+wdQOtErnGv9oE3gujgo/kc/tSvqJM1ID/n8/hVDgwKwwj/abG5sh
	+AzLw7D//Dl34y9TO4sgCmhDxkUefjO71El6rUgYwEhkJyKcRSKVpQ3rt2m0m/rYY9B66mN4I96
	qFQrWR7JGD2K9d75qOQA102NhHw7nMsGFzRiBfm2YXmKaQ6KJVmQ/85FYXtGRRkXF/sZG2qZd/E
	An3Ie2MSyA1+LOVbKlaaKJVoBSFsU6y+Mczyf5bFWND65mAxk654RelRYlqoJPN2P53T6LegsdJ
	4oxsc4LwDmjAbipS050s9rQ9rbR/R4w==
X-Google-Smtp-Source: AGHT+IHeprWN0OT6Xq1C608Ko9smpP11pwLwlFe3T1+FZlCl5LSrUPerfPVKNYI6owNKSrybdMvlyA==
X-Received: by 2002:a05:6e02:2193:b0:3dc:8b57:b759 with SMTP id e9e14a558f8ab-3dc9b7517a5mr74670715ab.21.1748219428699;
        Sun, 25 May 2025 17:30:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 17:30:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Sun, 25 May 2025 18:29:22 -0600
Message-Id: <20250526002924.2567843-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526002924.2567843-1-james.hilliard1@gmail.com>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_173029_816287_706CC69A 
X-CRM114-Status: GOOD (  16.74  )
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

The Allwinner H616 ships with two different on-die phy variants, in
order to determine the phy being used we need to read an efuse and
then select the appropriate PHY based on the AC300 bit.

By defining an emac node without a phy-handle we can override the
default PHY selection logic in stmmac by passing a specific phy_node
selected based on the ac200 and ac300 names in a phys list.

This allows us to have a device tree that defines both PHY variants
even though only one will actually end up being used at runtime
based on the ac300 nvmem efuse bit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..e275f4caa684 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -11,6 +11,7 @@
 #include <linux/mdio-mux.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
@@ -280,6 +281,8 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+#define AC300_KEY		BIT(8)
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1159,6 +1162,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	struct regmap *regmap;
 	int ret;
+	u16 val;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1222,6 +1226,21 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
+		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
+		if (index < 0) {
+			dev_err(dev, "PHY name not found in device tree\n");
+			return -EINVAL;
+		}
+
+		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+		if (!plat_dat->phy_node) {
+			dev_err(dev, "Failed to get PHY node from phys property\n");
+			return -EINVAL;
+		}
+	}
+
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-- 
2.34.1


