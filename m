Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35718C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhS/iPoMN1yZRTKWNj0A3kjmWq9kDJx/qF0c8CAbTAw=; b=Bb8TdnkdlO/So4FzxR7BM7k6w0
	P77pzNzzN8+/6GSfNtiIn3VXRrHWCPTapMrB0zN0p7I9I4/OWRpron4apmtUPcbZJKZbTZfGMha0B
	z1ZxhH6YeJrAlnxakgdm6yed9AXeY0x4pZUQGdyETUMmeLK+e/stDEHVww7KIeEnZwin68Y/5c0nC
	zdIbbYhbH4mlOiM/9IsOGK8TXuQ4BZsccTlTB35K4p1mH+R7pCZfYrDJhfs0tyP3Iv/NFbTyT6zoM
	1kSURvnEx5EeyJcaEbJ+VjV3Qs4M3hxFzieqMwjyUZdzhh3pD8l/LnSf++XgfTj8gqYcZR+Gs05hG
	MODmc7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byX-0000000E2oq-429u;
	Thu, 10 Sep 2026 10:25:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byV-0000000E2my-0iNO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 10:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yhS/iPoMN1yZRTKWNj0A3kjmWq9kDJx/qF0c8CAbTAw=; b=Kw8XCkIsFhkNFkaveIqdqQybA4
	KRU/F3a2iKlvLocqVgoIMKqEbe20RwsL/Q1niwaMTPoWwSf9macRvWBmPGj4bGyLANSs2s3yZBhZn
	M6xmJdfpqMx/Y6NM7il+3Gt6UhHxf/GU3+qM2xEfncKrfEA/ML2zGAFaGqcHlbcM8i77R09JEwF5M
	h4Nx62SXVZl9TfOTt3OorVOAiP7J5rJYZaKyXNl2qjhqeH9KNL7HojesWmOKXtJXNA0fw1ehfDKMC
	AqbgICYlczjFvna49HiBWO/WNSyiOTUIdQZY/IU+PdD50agPC2YylXNVLneLC+c8GJVlV/l3utx7j
	ieKbIhEQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4byS-00000002KAe-0vBJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:25:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso50099405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789035942; x=1789640742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhS/iPoMN1yZRTKWNj0A3kjmWq9kDJx/qF0c8CAbTAw=;
        b=Zi400xug6QQn9QChxvAijGoUqS09lC+5t2cRkj0T/1qDh6FQzyB3/NUBMySQrN9Q84
         5ltL8/bnfHx40nppinnnmVtsbYP7XMOqHwTQhoSci9Jvhzr6pB5FWgEPIlDvj3KTad11
         BaV/Ee0zYv7YKHMG6JSW6KWNNIUNjgk1GTpxdoAwUT1ZwSDUpGngaxjdWwe/i9CVePXe
         bbKSVdghBxeUE8j9ANUNFWogzydI0B4e7vbaCcwvS2W1JLyQul/luW+jLGvTzbiV9uUK
         NBbivLpUN6quPos/aRusQvN97Q/lXso1mJ7ImT71jnf4tpd+GnrVZATL0paRW/7GnlTx
         DpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035942; x=1789640742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhS/iPoMN1yZRTKWNj0A3kjmWq9kDJx/qF0c8CAbTAw=;
        b=K40uoTA8L3RJnYvQOvKiXJ5OWz/ii2tFFpQKWQrnPvHNgvEvcMg1SIvcT91aRw74df
         PyBQWjf3nemW1lMRvfjW+Yn9fSfYrNk7CYa8syzC/nMxD3Q/37gRkqDhDA49rg4DQ0AR
         Kq8wpDhHmqXSg/iksYzBZhIFUH/x9mgm5i4uA8YDVLOYjP31UI+wmMWk7L6hMVuZmZgb
         ufP/0kKLz6ja+ehR7aZu7B0U1IMknsYOhvR0AoZxFWSr4+7lKH4ElvMcQTdZA1VfTeFy
         jqUZ7FCXNaRSeTrjfSnaWN1rtIiQzHIDGSOji+E/ZLyl/4yRx7IZWQ51ikfVNzXbETsK
         xr4w==
X-Forwarded-Encrypted: i=1; AKwUvBx6thpYcTyLOhZNgYFdIdzj1KI+qMyunusm+0YBlRxXYw33V2UOSHgU2aeMAHBSsgtmDnBOdjHTbaPfqerNugV1@lists.infradead.org
X-Gm-Message-State: AFuF++k/93iZwBwhT+FNAgcHaWdrbuyQwyaFezwXQplIfCwoINsbrZsk
	qYKNuL8nxt1uTnbUlM9lBRtfn+/3JUJFQ8Ih6dwKiOj5DI85ebTAADVx4EfLUDqlDf0=
X-Gm-Gg: AYBFou254hO+tiOhJW33hJ/hHuLtconX8KHUE39cKzERPvsFKO1CywNhk8cCpC0TjKx
	MPKBUiJh5hShSpmlQWe1EYmkoB+dXA8QTUnP9qT4Kp5lbRRlKu9RTVykB9+oFWKHfVSWxGFLCbT
	mwT8TzH3LDx031XsXJuxqDxrhy4z3ghyFR0NyKbVCOzUOgq6Q/f/YMAstbDmkUeqXWdIQIVBKRn
	ogEDbTiWgpCYK1LQfuLh3rrcCO1FlGDQHoLmSqI6ljkalaE9R/y8XtlvO/V4vIBlbeDW6YZkhwI
	ZyIRo4wkx07A8myvvzfiODuKvV1f6F3MzQm/h0S++S4n6RjgxV8Tt2dLjaThdunkmCq835iiUNM
	vU2cF/IFraZY89g/DcwE9WDOJDVP5sy5RPQKJjqjvFWSM43hYOHg4ZvHL8CFZF+FId5pcym3ffl
	mRWGmSQZS6O5OKYbTVnoz+b1MOV6/cRzyandyMdDxr9sMt959n1W1rGpRyJFWeDuhUAdC9hXy41
	2jqsytNSTp3Nbvm6A==
X-Received: by 2002:a05:600c:3f0a:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49cf81e4a10mr395443005e9.3.1789035942111;
        Thu, 10 Sep 2026 03:25:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdb789sm73960825e9.1.2026.09.10.03.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:25:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:25:27 +0200
Subject: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8196; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iiviwEqL5gcgoRgKHDKcynyJRZSYhYM7KijUYtaKBco=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqooWfZVqP4h/FmhnIkFcpRFeUK9vhz7B5BXAfH
 GVm2YN9pAqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKFnwAKCRDm/A8cN/La
 hXUXD/9O9GcDsf6tEVteDWeDc13oqB3BEWwUiSNY8QkNQ/MlOz1JVGD1oJDrUYGAP7c/bT18jFM
 e+Zw8PmFy1XGty3EQPeh4vYiTiMyQoul16KwvltYnhl/1p4RaVg6RhZZJvRqss/qQOfVwgh5mK0
 X/kbiq0l/7jcZ6ruy6sHPn/6o72QxBlVcIsb1YmsNCiRAvGiOQKnjEXaTKQ7k97kHrBNshJK3q6
 dQG5nqbvdEd/jJoF9n2jBGWfrdF1fd11YAhSOkGszVCmMFoICkwKRn1Rz6m4eaJS3glbenr7hZ3
 SMZ4004904VmgGCiQK/ZVr3BvOXSI9p3TKqtj9T0c2kEjH2NtXzWwWLfEOed39FnEZfm7d2ev46
 TR3lv3liuy8kbKS7AOcIBkC8+6Yz/uohIC4/wbz/L7jGFNEWLzS2R1COwRaniFk4QBNU2di5/Ad
 SgW1a9PQDeapI/rfaUUDN9v9BMY0VzqAs50EDxl77FHE5iy8t2YhjQppsKA3pIW6y/dyu5w68T3
 Om39+TGBVZGN844LxmxBPYdLvFNmxoeXysO0fVorTfoSmEVmlubOBk3tK1AirGbysrePoAjGwxB
 aV2ix5mQPwJZIZujAe3waLNn9jwZMIk48YoRv9h9YPds/P63JVXPy5jr92RSZeiGQzbbpW+DLvG
 JA+jaF8VZnTruFQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_112544_405158_0AB48121 
X-CRM114-Status: GOOD (  26.86  )
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

The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
the A523 GMAC200 already supported by this driver, with the following
differences to handle:

* The glue configuration registers are a dedicated MMIO region of the
  controller instead of a syscon register. This new register region
  appears to be in the reset domain of stmmac's main reset. This requires
  the glue driver to handle the reset rather than letting stmmac deal with
  it.
* The TX clock delay value is 5 bits wide, split over 2 register fields,
  allowing delays up to 3100ps.
* The DMA channels have their own interrupt lines, so the per-DMA-channel
  interrupt mode is enabled, as the vendor SDK does.
* TX LPI clock gating is supported, as the vendor SDK indicates. Follow
  the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
  forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
  property.

Unlike the A523, both GMAC instances are supported by the same driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 1 file changed, 127 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index 862df173d963..3d434a52fb02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -10,21 +10,22 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-#define SYSCON_REG		0x34
-
 /* RMII specific bits */
 #define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
 /* Generic system control EMAC_CLK bits */
@@ -37,17 +38,99 @@
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
-static int sun55i_gmac200_set_syscon(struct device *dev,
-				     struct plat_stmmacenet_data *plat)
+struct sun55i_gmac_data {
+	struct regmap *(*get_regmap)(struct platform_device *pdev,
+				     struct plat_stmmacenet_data *plat);
+	unsigned int flags;
+	u32 etxdc_ext_mask;
+	u32 offset;
+};
+
+static struct regmap *sun55i_gmac200_get_regmap(struct platform_device *pdev,
+						struct plat_stmmacenet_data *plat)
+{
+	struct regmap *map =
+		syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "syscon");
+
+	if (IS_ERR(map))
+		dev_err_probe(&pdev->dev, PTR_ERR(map), "Unable to map syscon\n");
+
+	return map;
+}
+
+static const struct regmap_config sun60i_a733_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static void sun60i_gmac210_reset_assert(void *data)
 {
-	struct device_node *node = dev->of_node;
+	struct reset_control *rst = data;
+
+	reset_control_assert(rst);
+}
+
+static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
+						struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(base)) {
+		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
+		return ERR_CAST(base);
+	}
+
+	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
+		dev_err(dev, "missing required reset controls\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * The configuration registers are inside the controller
+	 * reset domain, so the reset must happen before any write to them
+	 * and should not be done again by stmmac or the configuration will
+	 * be lost.
+	 */
+	ret = reset_control_assert(plat->stmmac_rst);
+	if (!ret)
+		ret = reset_control_deassert(plat->stmmac_rst);
+
+	if (ret) {
+		dev_err_probe(dev, ret, "device reset failed\n");
+		return ERR_PTR(ret);
+	}
+
+	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
+				       plat->stmmac_rst);
+	if (ret)
+		return ERR_PTR(ret);
+
+	plat->stmmac_rst = NULL;
+
+	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);
+}
+
+static int sun55i_gmac200_setup(struct platform_device *pdev,
+				struct plat_stmmacenet_data *plat,
+				const struct sun55i_gmac_data *data)
+{
+	unsigned int lo_bits = hweight32(SYSCON_ETXDC_MASK);
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	u32 val, reg = 0;
+	u32 max_delay;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
+	max_delay = (1U << (lo_bits + hweight32(data->etxdc_ext_mask))) - 1;
+
+	regmap = data->get_regmap(pdev, plat);
 	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
+		return PTR_ERR(regmap);
 
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
 		if (val % 100)
@@ -55,12 +138,15 @@ static int sun55i_gmac200_set_syscon(struct device *dev,
 					     "tx-delay must be a multiple of 100ps\n");
 		val /= 100;
 		dev_dbg(dev, "set tx-delay to %x\n", val);
-		if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
+		if (val > max_delay)
 			return dev_err_probe(dev, -EINVAL,
-					     "TX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
-					     val, FIELD_MAX(SYSCON_ETXDC_MASK));
+					     "TX clock delay exceeds maximum (%u00ps > %u00ps)\n",
+					     val, max_delay);
 
-		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
+		reg |= field_prep(SYSCON_ETXDC_MASK, val);
+		if (data->etxdc_ext_mask)
+			reg |= field_prep(data->etxdc_ext_mask,
+					  val >> lo_bits);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
@@ -95,21 +181,29 @@ static int sun55i_gmac200_set_syscon(struct device *dev,
 				     phy_modes(plat->phy_interface));
 	}
 
-	ret = regmap_write(regmap, SYSCON_REG, reg);
+	ret = regmap_write(regmap, data->offset, reg);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
 
+	plat->flags |= data->flags;
+	plat->host_dma_width = 32;
+
 	return 0;
 }
 
 static int sun55i_gmac200_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sun55i_gmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct clk *clk;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
 		return ret;
@@ -118,11 +212,7 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	/* BSP disables it */
-	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
-	plat_dat->host_dma_width = 32;
-
-	ret = sun55i_gmac200_set_syscon(dev, plat_dat);
+	ret = sun55i_gmac200_setup(pdev, plat_dat, data);
 	if (ret)
 		return ret;
 
@@ -138,8 +228,27 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
+	.get_regmap = sun55i_gmac200_get_regmap,
+	.flags = STMMAC_FLAG_SPH_DISABLE,
+	.offset = 0x34,
+	.etxdc_ext_mask = 0,
+};
+
+static const struct sun55i_gmac_data sun60i_a733_gmac210_data = {
+	.get_regmap = sun60i_gmac210_get_regmap,
+	.flags = (STMMAC_FLAG_SPH_DISABLE |
+		  STMMAC_FLAG_MULTI_MSI_EN |
+		  STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP),
+	.offset = 0x0,
+	.etxdc_ext_mask = GENMASK(17, 16),
+};
+
 static const struct of_device_id sun55i_gmac200_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-gmac200" },
+	{ .compatible = "allwinner,sun55i-a523-gmac200",
+	  .data = &sun55i_a523_gmac200_data },
+	{ .compatible = "allwinner,sun60i-a733-gmac210",
+	  .data = &sun60i_a733_gmac210_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);

-- 
2.53.0


