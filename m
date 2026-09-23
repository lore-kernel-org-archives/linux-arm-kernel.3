Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC3FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHpHp+F5tI4LZnE8xFoLfG2BiWUFVvoyvHapbJH+e74=; b=X9T5Qr9SnTUqtyOMc3M6UeObZ4
	qBg+gRMh1jk3AQGeP45Ft0Vb7ocDSnbp9SQ19GuPVHgvjC9kmWIZFPsUfk5A6+n23nNx9TSYHWbc4
	TZcH5ol5bvN8Og3vh766m+HyAyu7K7tjf8dG4ffE3PzbCSkTvycijSnSRl4QRXjbfCDL/KF4vg4sC
	kD8puPdDRapoXebU175AKrsMDAWkXZPVIu44Zqba8tvqGYUD3gHae4yAt0h9RnjvMySElN3KeQhYd
	Q1SdepQsmSCeUAfzzhViG03i+OXXm6A0538YELBzrZ1rCMGuE4B5PzZxfTsOXUcJiPxilX7F05vPx
	No5uxiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tt8-00000009Vgc-39VH;
	Wed, 23 Sep 2026 20:48:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsi-00000009VRj-2Zbh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kHpHp+F5tI4LZnE8xFoLfG2BiWUFVvoyvHapbJH+e74=; b=LlZ609FJnyw+3nGb6PAx35iVfD
	R9j5xURvKX1v9PhSgQp6sch43oj8SawOPatplIEspYdkPimr/V8fNHNGFIuzU6JSQOFZuRcK79QPp
	wedGn33MYAOKAJ/DntSZJSKbDR0N3/XnShUsNDwQBtDuKTqg1eFFaFNKKHsqTrBfz3c43bRxAU1Fu
	RfsL7KRp9GGtT/viwLbIprWCz2lBMawaknIokSbV+Kmi0aBxA60MY37Uv7bm0qsiQx3t8sroLTKaX
	rcq68DnVwIF0GQ8/xZXgYazaYhBlTinA883rWS+waE8To7PiIxVm6RYhDw92Dxj2PotXYOZs2sffG
	jkh2ADAg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Tsd-0000000FGmJ-0WoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:55 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so15422245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196469; x=1790801269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHpHp+F5tI4LZnE8xFoLfG2BiWUFVvoyvHapbJH+e74=;
        b=cAF/RWz50ojURq7Unl7vkLVlWCwzSAFD6FTHhR9pvB4scXNb/T6hYljgGxnjQ4Zmcw
         7Sm7O97tt/pCYAQ86cLWuO5GqAdkfL15PnfiwkcF4M+MCjWNs07u2Dn7vyAjYG5ZtGBH
         gMNheTuJwImW01DwWi5YJzW4PrP62Sn08v3dSZxn4XQWXpN+mo5/dMJQjtWqpGcGOhfn
         Alu/L4t50bObWcnQAlWs8HhxBqKLhScai/A/mcFJ7DGtDUO0Zk0kt5+Tfl0yoUqDt5w2
         CjQMejnETqOE86rXA/4HRtoeKETB9jBG6bgi0IY1OxWXQMSkZ8Us+QSS5xGi/anPgDRT
         DgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196469; x=1790801269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHpHp+F5tI4LZnE8xFoLfG2BiWUFVvoyvHapbJH+e74=;
        b=cJBTuf9Yx1LIly8fxvEi+3nkchm2cgbErqOM/nqLVwC/tL/DN2T1zc7OGTZtC79ETo
         RKX21Ypdyqxk06y58lEtDGu5kJL6yjMFOglWiwi1NuQ4MmJ6xlVP4mwBtYt2HDlVnLUL
         eipvMUeUiNBdaH4rXVQk4h6EGTefOOs9zAcoYfM7EdqCeNyVrhLmGsPyrL0SpsjemNYi
         KJKAVapyINBQRAIdZtJApM7k03ZCGZFXEM6mFJIRRWBFJW0W3M39Kcw0o3lZI5bQAlHf
         Dp1r1Cc5ogpv1/mXCVFcygvBjwlliZuwtLgINMIaYrQyNWWCqXefAE5AgQ4RsUM8eWGt
         wPnw==
X-Forwarded-Encrypted: i=1; AKwUvBxUB/qlgXsIJyC30CBv6IBBF7Toip5pCPqEl6ni/fqUOHTl7uaUxa92PVR7RmJbZHSIkluE/kQaNSyHQHURS1Ec@lists.infradead.org
X-Gm-Message-State: AFuF++k7nc04XZZ7ZkBSAdO8iTCvDR+omXjMVfKeSjL9B3gmJQufAWmp
	0yLOfEPJSkre1cKRTtezdLJxJraZPHlAPVpGOwenWZ1zoQibBsOr37IcKaZWvZb25Rs=
X-Gm-Gg: AYBFou2+MTOgbquyEp9xvlCy65nIIAtdNQjeKBDS8Y9hJ24PBW3R4LVIgkIxEX0JXMW
	e0QRy2a5sA10gVGLzNVkCkVsHWhO37LtOnCF6lTodhkLVr9+OUfo+O1H5Gg30EWOpnF4ykkt5KN
	kp1GiHzNgUNHjyxCELaLMGOU97zzIhKJyGSi/lmiBrPCCoJvplmiLzgpayN7IrlYqsXptKPvFDg
	MnTFabbxm4ifVb/I9cWSlIqmeQOx+dm+7I6nJ396+mBhmA1BVDXTHE7oJb7EsTvQ0ik++bVIHYO
	npF+eRzcpZWO0VEXfoO58GLxaEtdPV6iyfsrqEambKN9EoQTLmQXDICYCDNUBHTnrQ5Gv2ejrlx
	UvBXAPHDGBNoXnZS/lEanpIT+Ba6R+qQleJY2RucozT72MkZZvgZE2QEgFyj2u0WdI2UP4NKW8P
	qzRaQFPtz4KT4yTmgVBLLQqf76+2v9uzgpZxCtKN5yB/HyDHHO+6gnFJBKaMt51gzVDTscoc6ob
	C5Y0YBopx7PE7LWcw==
X-Received: by 2002:a05:600c:1989:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fe66ab9d1mr6607445e9.4.1790196469631;
        Wed, 23 Sep 2026 13:47:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b44db6sm14839105e9.0.2026.09.23.13.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:35 +0200
Subject: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4132; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=sjLoecwDQJXaWVmzvGOQ+F7IRuyAd48CcawjSycmYoQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN669B39qPeAbW7OgdsplxQT71j87Zx16uqMiimtn
 Lp1lh6lHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiIihkjwyb31d8uyoQbH75s
 9sfsjf4n69Uei5jkzL5psmk98r3+tIrhv7f6q8R7G+4cYbbpqebm5Ntqsd2bf3uH2dmQ2SHdm9s
 c+AA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_214753_641575_FDF14FB7 
X-CRM114-Status: GOOD (  20.96  )
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
  controller instead of a syscon register. This region is in the AHB
  reset domain, so the glue driver releases the shared AHB reset before
  writing the configuration.
* The TX clock delay value is 5 bits wide, split over 2 register fields.
  Both TX and RX delays use a 180ps step.
* The DMA channels have their own interrupt lines, so the per-DMA-channel
  interrupt mode is enabled, as the vendor SDK does.
* TX LPI clock gating is supported, as the vendor SDK indicates. Follow
  the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
  forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
  property.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index 49abbb248b61..675b83cd52c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -19,6 +19,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
@@ -65,6 +66,41 @@ static int sun55i_gmac200_init_resources(struct platform_device *pdev,
 	return 0;
 }
 
+static const struct regmap_config sun60i_a733_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int sun60i_gmac210_init_resources(struct platform_device *pdev,
+					 struct sun55i_gmac *gmac)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *ahb_reset;
+	void __iomem *base;
+
+	/*
+	 * Get the configuration region out of reset before changing it.
+	 * stmmac core holds the same shared reset but only deasserts it later.
+	 */
+	ahb_reset = devm_reset_control_get_shared_deasserted(dev, "ahb");
+	if (IS_ERR(ahb_reset))
+		return dev_err_probe(dev, PTR_ERR(ahb_reset),
+				     "Failed to get ahb reset\n");
+
+	base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "Unable to get config memory region\n");
+
+	gmac->regmap = devm_regmap_init_mmio(dev, base, &sun60i_a733_regmap_cfg);
+	if (IS_ERR(gmac->regmap))
+		return dev_err_probe(dev, PTR_ERR(gmac->regmap),
+				     "Unable to get regmap for config memory region\n");
+
+	return 0;
+}
+
 static int sun55i_gmac200_validate_delay(struct device *dev, const char *dir,
 					 u32 *val, u32 step, u32 max)
 {
@@ -132,9 +168,11 @@ static int sun55i_gmac200_setup(struct device *dev,
 				     phy_modes(plat->phy_interface));
 	}
 
+	/* The dwmac will sample this when stmmaceth reset is deasserted */
 	ret = regmap_write(gmac->regmap, gmac->data->offset, reg);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
+		return dev_err_probe(dev, ret,
+				     "Failed to write glue configuration\n");
 
 	return 0;
 }
@@ -202,9 +240,22 @@ static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
 	.rxdly_step_ps = 100,
 };
 
+static const struct sun55i_gmac_data sun60i_a733_gmac210_data = {
+	.init_resources = sun60i_gmac210_init_resources,
+	.flags = (STMMAC_FLAG_SPH_DISABLE |
+		  STMMAC_FLAG_MULTI_MSI_EN |
+		  STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP),
+	.offset = 0x0,
+	.etxdc_ext_mask = GENMASK(17, 16),
+	.txdly_step_ps = 180,
+	.rxdly_step_ps = 180,
+};
+
 static const struct of_device_id sun55i_gmac200_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-gmac200",
 	  .data = &sun55i_a523_gmac200_data },
+	{ .compatible = "allwinner,sun60i-a733-gmac210",
+	  .data = &sun60i_a733_gmac210_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);

-- 
2.53.0


