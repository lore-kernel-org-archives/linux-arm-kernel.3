Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E3EC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1oII/RrxF/OFnXa7ZDr/acIcGvy/rs2x4VPOQEqgg/g=; b=moLb2FQgTBd/6sxh81jdjZBmOX
	Qtvjq7z+gfbW9qrPE7LvYJIUVeSciG5ft9A7/M5a90KwPI7X7YgPlbvmO90fcthoO3rbImecNnG5m
	aXcLR1+AcyrDlsQ3ZxB1rh2yJRILSz1X/vJ1acwpSMP7EcY4h5IHUIP2RP+72ns8JzIdWuU6+jkxc
	ALrs8ZAN3pb2WztPyQGq+Zc30VEegavim5VNn8+A5aGUXcX8tnMHwguQnpFqwq5KUTCchyYnWDYkY
	pFwE+/grBAlG9Tkn0TQrIA1GGKgwf/2MACO16gVs7nsBrgQYgMpHRL7KB3CcQeefDQ1yQAzDK9Dca
	RD9+mgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ogo-00000003orj-4B1v;
	Tue, 22 Sep 2026 00:48:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ogn-00000003orY-16N8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5D45437B4;
	Tue, 22 Sep 2026 00:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FFD0C2BCB3;
	Tue, 22 Sep 2026 00:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038132;
	bh=MhECZ01GWljS+dSYSDphB4oUMuaC49wghxWhnDKzGhI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Xax4A2m5o3qrpoh+RsXBuRryi62bfZGB1vbojfeLz6ggLJvW5qO8K3Q5XqgsVoK9c
	 WJ5ocrHFOEgCgB1PSmGfNjElvxMn47J27m5QMOyHZ7SK4RtDhmdP/d5BOXmItQkiGl
	 ruNM7PxYrTa/oFVmkX8d9BFpDUljAyVZOTTiKP5MwYF5FWpu1j1J5VRDnzG0jyH7Qb
	 kZRvwRMYj2i+/N6ord2dsJnZ/FuDZ6xymUD0zGVQinZoTjxJYnGaFoXKikXEq1FsGl
	 d9XNkBhHMhEqXzSKt0lPWHTnd5NlpjdyQXsqcldMPBaOP8kVL9uQvCRSu4wkjoeOh0
	 FgThoEtk2SOvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5508CC982F0;
	Tue, 22 Sep 2026 00:48:52 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 20:48:49 -0400
Subject: [PATCH] soc: sunxi: sram: order the publication of base against
 sram_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
X-B4-Tracking: v=1; b=H4sIAHDQsWoC/yXMwQ6CMBAE0F8he3ZNKU1Ff8V4aOsqa0I1u0JIC
 P9ui8c3mZkVlIRJ4dKsIDSz8jsXtIcG0hDyk5DvxWCN9eZsWxwj6pQXRpUwomtTZ/s+OO8NlM1
 H6MHL/ne9/a1TfFH61pPaiEEJo4SchhrtnE/HDiU52LYfZR29qpEAAAA=
X-Change-ID: 20260921-mb-sunxi-sram-41c3288a4660
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038131; l=2938;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=iWOUCfUb74J3AaIrMMoha+tqbbn7gGU2kZjJNz75+qo=;
 b=xNk3bETupvhxPj+ON3wVvUrT00jS57UuN8Fn/ZStgW4M+sscHW5o3tqneSp1mYeN0l0G53/Sb
 TmEtkw7niOuDlqX1aVZUwXlG4rAhSg8GVuFGrkqvbw+7ityyJaG8aaV
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
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
Reply-To: jaidevshastri@vt.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jaidev Shastri <jaidevshastri@vt.edu>

sunxi_sram_claim() is called from the probe functions of the EMAC, the
video engine and other consumers. It gates on the file-scope base
pointer:

	if (!base)
		return -EPROBE_DEFER;

and then walks sram_dev->of_node in sunxi_sram_of_parse().
sunxi_sram_probe() writes sram_dev and then base, both with plain
stores, and the claimer reads both with plain loads. Neither the two
stores nor the two loads are ordered, so a claimer on another CPU can
pass the gate and dereference sram_dev == NULL.

Keep the mapped registers in a local and publish base with
smp_store_release() once sram_dev is set; read it with
smp_load_acquire() in sunxi_sram_claim(). The error value is still
stored to base so that a failed probe keeps reporting it to claimers.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/soc/sunxi/sunxi_sram.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2ccaeacf8..0e0b86ad3 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -266,10 +266,14 @@ int sunxi_sram_claim(struct device *dev)
 	int err;
 	int count = 0;
 
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	void __iomem *regs;
 
-	if (!base)
+	/* Pairs with smp_store_release() in sunxi_sram_probe(). */
+	regs = smp_load_acquire(&base);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	if (!regs)
 		return -EPROBE_DEFER;
 
 	if (!dev || !dev->of_node)
@@ -410,6 +414,7 @@ static int __init sunxi_sram_probe(struct platform_device *pdev)
 	const struct sunxi_sramc_variant *variant;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
+	void __iomem *regs;
 	int ret;
 
 	sram_dev = &pdev->dev;
@@ -420,12 +425,21 @@ static int __init sunxi_sram_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, (struct sunxi_sramc_variant *)variant);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs)) {
+		base = regs;
+		return PTR_ERR(regs);
+	}
+
+	/*
+	 * base is the gate that sunxi_sram_claim() tests before it walks
+	 * sram_dev->of_node. Publish it after sram_dev so that a claimer on
+	 * another CPU that passes the gate also sees sram_dev.
+	 */
+	smp_store_release(&base, regs);
 
 	if (variant->num_emac_clocks || variant->has_ldo_ctrl) {
-		regmap = devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
+		regmap = devm_regmap_init_mmio(dev, regs, &sunxi_sram_regmap_config);
 		if (IS_ERR(regmap))
 			return PTR_ERR(regmap);
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-sunxi-sram-41c3288a4660

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>



