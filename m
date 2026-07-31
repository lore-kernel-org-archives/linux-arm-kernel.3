Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C713EC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djWGAgZFPMEwkPACC0SH0yA3REA4ghQKhBwTkhJwSTQ=; b=y1hv6BvI8FR29mjhpnplL9lwaX
	DyE+M6YqheF2NGc4PKcs18w230zsMdT+NjXkBhNhvJb/j0JeCH/z4bebA5lIiXW332w13w6rTNONa
	wOo86MABU2ovuGOvWimu42wgchBIWGDh+MXOdhEZdLZQAQtIy2F12O/PNDYOjWss/tJLdRyiXUZ4T
	BwUyzQyp5tE/hAXviyFgx1sT9H9oSTD7DZETSd/AJrKfzy14c4odL9HMT+B6n8aKMexTDbPmfNqCN
	zvRc7Ddj5ApqWMPx9QXW+NuqZO67HjQgNHN8cbqwHJk0v+w5YoG1E3HioqLTJtfRvecdYLE8OBIMl
	jipASI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8Z-0000000D8Mk-2Tfs;
	Fri, 31 Jul 2026 16:31:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8P-0000000D8IM-0OOT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:30:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1444495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785515455; x=1786120255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djWGAgZFPMEwkPACC0SH0yA3REA4ghQKhBwTkhJwSTQ=;
        b=bDl7JoyrDlyjxTeCTZ8ncWVgMTRQqR5+PPX8ApO0gVphUPZ8Hpwx/QcUXTeE0XILwP
         kScbs5zDSqos6krT44QlNX3UCFozZwkr1JCpopfhHT2w1us397d/qjXM9SfwchnlECOU
         yC88r1HzUA9uWjwxIcRNM2flL5AwbDnGdnbtjy6kTkvuezVX/9Bd/awfseBYx3vDPr2N
         q82xmzGvSoyW467dMkEGfXHToTi07IdfsZ2UU2fnS2tHAuUo1+K3R9eLevzwoFRbOUgL
         KLAhe1gfb6XlRqdsOvZU4ek4yP1hl4r9IQYabVSLdo3ks4tAaJj1XrKuOS9T8+t+M39w
         M1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515455; x=1786120255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djWGAgZFPMEwkPACC0SH0yA3REA4ghQKhBwTkhJwSTQ=;
        b=miTEWV64Ow0o0dtXk/+I7+g9FYsFASyY0VLp6bSZ73WwrTwM0FKfN96vZqu3HviU0U
         /HNuHpR+pX+2UHvhVFaCWWCmM9fW3aGaI+e/MwILxXvqNbKRoCoKXSp+X6rIxRFb8UCu
         mCAk0g97F+FGzDvelZBMvUQV49mvi/6inSkQnzknwlCNUVFPqIeA2NipwZrk9KVqxi8G
         INneWWVAAiI+PAdoDwuWDMSrnKtWtbHrUcjKBudffbqMqC7Kokns2X45ewIGhXAnsnw8
         oCCkPvol+8xlwUDjF79DpDfq18KVvnyS7A/vPB+TKcHORu6lWZnfcw0Zb3DKaG1Vcrc3
         hDJw==
X-Forwarded-Encrypted: i=1; AHgh+RqYelDQpTKAoj5yEPu7sQ0o/h9foFebYl/3kS/qHjKIk+Qe4InVRnwqIi5kaJ6KlOZsWW162VnPUlU5RKC4PkNN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/jSbf0yCg+88QxdKl8qslH45iMvtSajvhIYCj0mTGTvmvS1P
	SUcm39S9hWaAQgVL2CqUwCtU+NxHRfBW0xvH+jrf+NFMFF8MnNpWVd316bpoZKGzlvs=
X-Gm-Gg: AR+sD12LpCUTBXVALHZwCikAEZvpDHVJF3d2tx3qs9C3o4fGiTq7jukHhvyjzeJE7HU
	AIDmrU87cyxjj3LGsqUwJNabQZ5xudd4On9zySnNBGArJZnyYWPlIIzThNnAj7x0sn2Wm2cFwnf
	bMQ27/U5ijG/RroyJT3+V+V7Z1spem1XERy5mW7vGqo/HV27Dhsk2R5JQO4CBfW/D/pAXCWCLlG
	LaqUTg/Gsx1wcZ/PvwvRPbSIr82cBdQM88tdjVi/NQMFHzfnYu+ggzvZp1zoOJ77Ad80P6FKhOG
	rfDxA3FzvqrC6oT7hSwBSbsLpbcOQ0YQt+AKQX4zHBRXv26i5mefciP3ziP7PLuYwdHO5Umrd3C
	LXwpaU1oBtjvRkzqurdli3JoALKpoIB1jddXQ9AijD/yZjU1GYGLdEnoiwAU1nBKTyBvWn57Py4
	uHqTdGmC4bbSYifeA9itjL0eqPZNzZtPpVo/PFWerRxlTwarKBnCJQqmY8BA==
X-Received: by 2002:a05:6000:1846:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fd729208fmr726837f8f.14.1785515455179;
        Fri, 31 Jul 2026 09:30:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd4562667sm6935966f8f.24.2026.07.31.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:30:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:30:27 +0200
Subject: [PATCH RFC/RFT 2/2] net: stmmac: Add support for Allwinner A733
 GMAC210
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-gmac-support-v1-2-d0a8732bfa82@baylibre.com>
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
In-Reply-To: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8196; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=R6z60t6FDjDvLZiOQXYefYIG0bNfh9SKw55q0G81SGM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbM2yrm2AuGpFLVpemVLX90B3DnBbzHrGoGWqT
 xiLTieBOeuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzNsgAKCRDm/A8cN/La
 hegtD/wPspDO73Xa87akPckAschP4dgHAyp7127Gd1baf5ZpC5mHrFkJXQpW9DiH5scwiM465l+
 /kS8Z8F/V8xxYrn6InOmmg/dw3Im+JiNr+W1C1xOiEAwzmTNPdfFLIOAv0V8tsjCj9bpgFecs+P
 QOPV3JtzpAvELG9QPOWIxEnOYwEdvP7uKtEK5GdqccTQd4ICtdKau1GlPaXRKjaPxhv960YnUWl
 jJrW3w/jXAcgMkwJLB/y0OVjiziU5HKrnCmrAHcvvMDjeYRs+q6rO5kmTcaBBNPdfWrmCAKjfAx
 t+JIUu1mHbWuFIG4S78NQNN6J4X9I89doMc8xQ6/2LW68RfiEJQJzKVp2Q5E4XxUwYs8XSxBSZC
 vTzp79KWSngh19GFNZy8KDFx2Bp1kPSDKFxY2xuTFMGhyTj+JNeJ1hlPV9m1rTkesoKvhBiUSVx
 N4x+SYbDcm497L01W8ONCfXmClBY+JNsPFNjefBlt6MfBGSPl3z26CioYv8WRKxavAamQWnaXt8
 AIKw2rFOKWxIf0i8jV6PHQgag5tkp+byybxhFHvdnTU9YQCshdOpxxtcZyFC9qMNxgDlq2qdx44
 X/NwUNm2POmlNsmBFMBLdKzYyjYJOlByszNC50hS74Bz0CHcBhBoU0gNs649jNUCrhb/KUjN7h7
 Zma6cXT7h4ab0HQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093057_213356_5497D5C2 
X-CRM114-Status: GOOD (  26.01  )
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
2.47.3


