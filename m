Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB852C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=; b=36CpLfi3Dg7d9EQCWC/3LIR/AZ
	/ssOZ5Cv1aIbT4ZRTn79MSMMeLL8L5Zezi5aEltGpMRBDclEzlv+5jz5YA6pVW98lTh8MemKqdCV+
	FxqT7NqmCE5bpBAlQBJwxwWoXgypHCquy1i8PPirB3dr633z6Ep6W33vvj3NjWd8I8jrN2d3ekAND
	UuILhWuL08/FgkfCnS1TjghaZsf9JvRQSePba10dOQTO6oP2wnf8HmSvPlZ106ffMOC+UvmoTodu5
	J0bC/2CfJYr1irdq1tijnKvwD18jccpFIhjmeQ0tAEfeBSTGcc6fy/iOLlUmGJEp2Nu9MnU9xu8+T
	9N6h139g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyiy-0000000BKP1-1chy;
	Tue, 27 May 2025 18:08:28 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyXS-0000000BITB-2vNs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 17:56:35 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso32413346d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368593; x=1748973393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
        b=Fw9HToOe1y8IdeZAiE542VJVKTIN1wbG/srPAnIBFFshsPD8kMyHdkMuQDMmLVi68A
         mCvOnQ0BdZ5j7ngSf6Fo2vLPgmb5PG4vLC76otqgwnMkzY4sqWGOj6pzdgl1+ozzfQX7
         vOgukH6Jpm7AmejYo38Ow1HdGb4ruWEqBaNKyU2fLApyGubW6tVJOiy/pMMNM0KW5tCa
         TcvYnlBHMDO8QYL3zZL/2mpvR7zsq0jgxbpiVzGza3Qk5pi6AEmewaJBC+askF5HOGkn
         JVGVQ/8pxNiXxTcXAy12ydH6VO/HROYWuKyqv5qVGU97Ayxywdkx6o+MNJt+1mWZnpE5
         Sbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368593; x=1748973393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
        b=ZJujQiDagbryODYVneNyD0EN4e389TuWcpd+t4f70wYUcNh3sceSV2CMOa9kgXvG63
         daUoA+VyUMGG6djqT13W1iVYVh2reF1bBanPwClKbGCigRRnlfFiQWCVH8+9L6kxW0cq
         duFOFTkpKn91yWaylvbyUS3FS5wuWxP5p2sS2b+VJSnglEsVi8uuMaRDtR/D1xwX7Iqc
         Zh4Ou/Zf/aoWo7YKjL/vj2BiO8Wfh/gneQtKyTWFg9sQTgnq/gXsO5OiaPjZ5LWzCywo
         xGzuS8EHj/QHmjuMAlJhgU/OTp5Yg/GYeCZH7UVD6OYGzXVzggmf/bG6tg99UbnBiWrO
         gAYg==
X-Forwarded-Encrypted: i=1; AJvYcCXgNz4KZo91YewX29e6TUv099UQZP0A64dXuD8fwabLVzT5KviOu65JBHZqaZ1Wgh6RLK5oK9+toTRr9C2iUrTw@lists.infradead.org
X-Gm-Message-State: AOJu0YzuSMCTyqRMkjquY+wBt0HZDM2+vBPCib3NgbSvdj/iba1A1tZ9
	4dGxSwGTqENi9r6oW3eOmicMiSxDT9H2XbjEJGmC27WRBuCB1aJ1uZfAFQ/t1OiA2MI=
X-Gm-Gg: ASbGncvMJVxacNTTHF3Uc4QizfsBz8Jz0fhsRdFcu/Oc7C1qx7C9tGErJmHkMq1a+Ns
	Rgr9GIvZbNrse4k+XgRh3Zj5wqSvT69bd45YjwNVXXPocRf77WEfLG4TUT8VHzajj13oKtsVA/C
	EwKf5LtTtSzmdry47zK9qdzM7SMz7Ntxi6mHHn0xI09kIIxd9LZWWxPUZtMmCTHBbrYEtfT7LlS
	C4OTBvR52cOdWRibi8ICaosLE7rjgmjnVGKIABdGcKdyW1Ubmr3zkQ2+OmtMolbexFXDTRw7Xgk
	UL471mLVIpusOx7y2UhWA8vLao6GvIHB9RCHIOSem4o0HMkc7IO05ikc80WxBqNs41QAPhgKPhZ
	glY2h4tbZIHHrHn6/MyCBVMAGIslfXg==
X-Google-Smtp-Source: AGHT+IGb7ZAkz0DXl6pr3hb3Rtl1mnfnjPXpzgihCk3W+jtxghNllqAVA4MuKf6P/Nz/db42HhLmew==
X-Received: by 2002:a05:6e02:1b05:b0:3dc:7563:c3d7 with SMTP id e9e14a558f8ab-3dc9b6a1250mr157952185ab.12.1748368582436;
        Tue, 27 May 2025 10:56:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:22 -0700 (PDT)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Tue, 27 May 2025 11:55:55 -0600
Message-Id: <20250527175558.2738342-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_105634_735016_B980FF13 
X-CRM114-Status: GOOD (  19.23  )
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

The Allwinner H616 ships with two different copackaged phy variants,
in order to determine the phy being used we need to read an efuse and
then select the appropriate PHY based on the AC300 bit.

By defining an emac node without a phy-handle we can override the
default PHY selection logic in stmmac by passing a specific phy_node
selected based on the ac200 and ac300 names in a phys list.

This allows us to have a device tree that defines both PHY variants
even though only one will actually end up being used at runtime
based on the ac300 nvmem efuse bit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..50d37876fabf 100644
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
 
+#define AC300_KEY		BIT(8) /* 1: AC300 PHY, 0: AC200 PHY */
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1149,6 +1152,35 @@ static struct regmap *sun8i_dwmac_get_syscon_from_dev(struct device_node *node)
 	return regmap;
 }
 
+/* H616 SoCs can contain either an AC200 PHY (needs i2c init) or an AC300
+ * PHY (no i2c). The silicon variant is flagged by the AC300_KEY efuse.
+ */
+static int sun8i_dwmac_get_ac300_phy(struct device *dev,
+				     struct plat_stmmacenet_data *plat_dat)
+{
+	u16 val;
+
+	/* If the nvmem cell is absent, use normal phy selection. */
+	if (nvmem_cell_read_u16(dev, "ac300", &val))
+		return 0;
+
+	const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+	int index = of_property_match_string(dev->of_node, "phy-names",
+					     phy_name);
+	if (index < 0) {
+		dev_err(dev, "PHY name not found in device tree\n");
+		return -EINVAL;
+	}
+
+	plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+	if (!plat_dat->phy_node) {
+		dev_err(dev, "Failed to get PHY node from phys property\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int sun8i_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1222,6 +1254,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	ret = sun8i_dwmac_get_ac300_phy(dev, plat_dat);
+	if (ret)
+		return ret;
+
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-- 
2.34.1


