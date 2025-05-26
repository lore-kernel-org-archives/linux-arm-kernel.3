Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1534C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=; b=abD7nlLk9samw1eiAqRpxbPT/L
	cUz2JZdyXKXmyUUI1cqccgUkcAzbyq5au8qm2uFvdHLeaJqxs+spBbOPNHAx7t0ICBDcNpyqHtTk0
	DPmO815hFXed2qoCGtv26VWyoJPtCK7CZduYWV3qgQrKlSG44zEPNSBVagqOAoZ5U/Jw3Td7MZuJh
	COe8/pdDw6PavYFfWi3ogr9BNMkI4v3kjg3+yiyGrD0P/qlp0Hx2rE8Fwy3yd5smsWOjnLsG4ZRXi
	Q+neGeZg9RjrjNeO+LdObhGHlwZfLgkgmOeTImo8ZVlJHlthQrIMLJZ9AEPJdPNGJrgCJWgt7/aXO
	4ExmyENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcei-00000009N9y-1bno;
	Mon, 26 May 2025 18:34:36 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcaV-00000009MlG-0uqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 18:30:16 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-8616987c261so75195339f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284214; x=1748889014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
        b=Tp20vBUMwPr6ASOoCRLIh/K+D8sESihTVIdE+MkXqxuffUja10TfKQN0gTRm1thC8q
         TPpvp2b9xYrzgnPHWmPHK9eEjpGrEGJrS0UlbWGrJ+7V8yRInwmC34lVvyk/hZFTnF6m
         5TFZuhOzGxWQymwk/4yPnd9ams0jt2RMNJ9C2BHhkSSh1Pa9lIGsriOam6mr9WxolkbT
         mc43Z9G+dfQxwFKB4qxCsRXqQmTa0cUwHlxlpZJbD/GCplT6HgpcF6cgav3qD/3BLa9v
         t6loJPHBiWm5pZEDCLZzjBsgB1AlgLqtpTzE3O4yp4wPCBnbZin4fuiXIJogSybKlH4S
         4BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284214; x=1748889014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
        b=MQcAS+9VZe9PfEBL/YEA+stK9ZpHCbW1TQlvf5NSU/So8f0tPp2G+7gNCr0stRtdyz
         j7F5MT1KFG22QKz9x5PilZZODUpZATlekTxhvE418HlxEZ45qoXrS4QXUUtSamMa2r2L
         S5ULPD/4fGdkFoDlzHlexCBXB+ryMd6EdqaPrfoLmh0GJ2+jqSPLf4hBSVlAyM3eb+mY
         wIOT0MKeEj9CVO/Sp6HWdBP80WJPoKYLQdM7YE6f41T8d51S+cSVOfJi+odtkzcuMAMl
         vX7zyWBYP9N1DD4mbbFinY3f49aGYhwssAh/pnsy6yqCLaf5PDA0BSTtZMRWKzS78KRQ
         QweA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Zu7hEH//qyThG+cLV4W5+1QNMZWXbZCK1iWOZgbIPMwBroD2gxkIGBbnKoiNRW3xc+yij2yBcM2xvzQMk+Il@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzgjko45PSpcgttNToprm0b1d905xd8ca9arOoEoNKH+cDK5hr
	KdiYHdUeP21Nly7i/ZC4PiQ/OR0+WdsTXEJNA/qFbof8h6Gom1++9xqh
X-Gm-Gg: ASbGncuRX7kJ5fEREwrKgXcRU6ZR74HgFyAn5JASUsyyGpT1PcJrXb2iHRdOYi9FqxL
	Xgqksd1sbDGY8rtu/mgvoELni0dlCZ2Z/QV3pMsOxe+Td/jBsSTrHSi3GrtB4Hy9G+ZxC9X3Cqa
	JAd6r8tMWmwN+gV9HRQXeVi155FDvHutaenbWGg5t4yWBzRNiNeXCMMu4ISFVfTtKCyHpXU9n5W
	sDvIJzDRXO/k+MVrcJXbifwn8hVsYefhFiex93HNnRk9cqyUtSD0WKTnzH6/t8vIjn0Opm62ibu
	3lfld1jAPG/CNUgDnurKlc/MCkBPfzmL93Tam7ovs3tmRNeT0jaOGH1DYUe9OoJjA4fmHp448cR
	A+MqZtiAYVVeF0CmYLiXVWG9aTnCVlQ==
X-Google-Smtp-Source: AGHT+IFDdvdL5g5ovSs/1gRBNnLk8GUjN90DAUSZdCdx+omEcVNlJWEAmQHeKYZ7rWqPkDPPkFePrg==
X-Received: by 2002:a05:6602:750c:b0:867:6680:cfd with SMTP id ca18e2360f4ac-86cbb7b82a4mr997010839f.1.1748284214365;
        Mon, 26 May 2025 11:30:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:13 -0700 (PDT)
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
	Serge Semin <fancer.lancer@gmail.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime AC200/AC300 phy selection
Date: Mon, 26 May 2025 12:29:35 -0600
Message-Id: <20250526182939.2593553-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182939.2593553-1-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_113015_269978_8A36C653 
X-CRM114-Status: GOOD (  18.88  )
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


