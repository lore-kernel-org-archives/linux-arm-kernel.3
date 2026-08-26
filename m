Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F01C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQkt+AxOVU6u5IygNkiSEdsCB3ba9YtCG7UYdDpFwmo=; b=V/mZ798ImNaqmutjJ+8q54eWe6
	m0eIR+m+4iWq5sweEAtWno7yEzBt2P4jetqFte/d3ein/HCoOZudlzgtVIim0fC0pmsGJM/nVR4nU
	2Y5NEbnh7hGehyKRISMC2WwfUd7td3nf2Q3Q4TZWz9a+fP9t4dBswuFUVlGSia40jat+oOanHjaRm
	m/XA0vuToS+5I7+OYDz0Q3tf5LGp7W6S7JU17MWmb+BL06RxxbC/k4YdOKxHZnKy+tTOGbUqcosFk
	rV26XjM3yQ7HvjK6THj5Gcxnt9hHpzQsImdoLYS/pR7gOClMcUfHZHz2Tv6HKeCmPeSFD9lprbCG0
	gtP56fFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCuV-00000002S9T-0Bph;
	Wed, 26 Aug 2026 12:39:19 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCuC-00000002Rxi-2sE3;
	Wed, 26 Aug 2026 12:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787747932; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ByEOzvJz0+cY+J20QOmb+TXXI3p1JDkHAuyk6U63St+/IL0L4JmfEZ4ziNwY3bBxfaSQ3uY2KrGI1DwQuDAGf1Ou/pU6Sshh95+rT8RJl/3nlRZk/8yRh2RYtH0hQjroVa2d+WpIbEn+aRhmieZxxUxEYZ/RYCOEufhqnb8QwvU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787747932; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gQkt+AxOVU6u5IygNkiSEdsCB3ba9YtCG7UYdDpFwmo=; 
	b=mu1RdgmmWcl5SdrjkPkpLApKyZpv4FPZV+mpfgN9tsg036tVLfy+frZfYo179wpdUWGk9qWgONTfiPzsE50Fb0fpSbHAAA8YHvljA2JYCWddK6syyE5KtXLb8Bsur3MmFijuTxr1WBvZFj0Nvc00xMS6+NFq+5+bhDFHFl5BE88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787747932;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=gQkt+AxOVU6u5IygNkiSEdsCB3ba9YtCG7UYdDpFwmo=;
	b=AIQJqf4QPRH0VCACXg9NC/nXpzAmws5B/UVx65Z6w2Hq4E6/+hEAkgIJgilYMh90
	F1/o+3vvXlWAGz8JMbYS7yZo3BQHBwmnR2//+efZfxWDfABiZCcL3GKTZTs3VhkHdVp
	YEE2cKDcAXrrBnp2RqFqwFu+7VU8uGsvADBnDBOU=
Received: by mx.zohomail.com with SMTPS id 1787747930692813.6414076114834;
	Wed, 26 Aug 2026 05:38:50 -0700 (PDT)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 26 Aug 2026 14:38:36 +0200
Subject: [PATCH 2/2] phy: mediatek: xsphy: add optional repeater support
 for USB2 ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mtk-usb2-repeater-usb2-v1-2-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053901_004211_53D03E31 
X-CRM114-Status: GOOD (  14.89  )
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

USB2 PHY port sub-nodes may carry an optional phys property referencing
an external eUSB2 repeater.

Fetch the repeater during probe using devm_of_phy_optional_get(),
initialize and exit it alongside the USB2 PHY, and propagate USB mode
changes to it.

This follows the same pattern used by the Synopsys eUSB2 PHY driver.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index cc1d66954212..7bc3d6794d7b 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -94,6 +94,7 @@ struct xsphy_instance {
 	struct phy *phy;
 	void __iomem *port_base;
 	struct clk *ref_clk;	/* reference clock of anolog phy */
+	struct phy *repeater;
 	u32 index;
 	u32 type;
 	struct regmap *type_sw;
@@ -391,6 +392,11 @@ static int mtk_phy_init(struct phy *phy)
 
 	switch (inst->type) {
 	case PHY_TYPE_USB2:
+		ret = phy_init(inst->repeater);
+		if (ret) {
+			clk_disable_unprepare(inst->ref_clk);
+			return ret;
+		}
 		u2_phy_instance_init(xsphy, inst);
 		u2_phy_props_set(xsphy, inst);
 		break;
@@ -438,7 +444,11 @@ static int mtk_phy_exit(struct phy *phy)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
 
+	if (inst->type == PHY_TYPE_USB2)
+		phy_exit(inst->repeater);
+
 	clk_disable_unprepare(inst->ref_clk);
+
 	return 0;
 }
 
@@ -446,9 +456,16 @@ static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
 	struct mtk_xsphy *xsphy = dev_get_drvdata(phy->dev.parent);
+	int ret;
 
-	if (inst->type == PHY_TYPE_USB2)
-		u2_phy_instance_set_mode(xsphy, inst, mode);
+	if (inst->type != PHY_TYPE_USB2)
+		return 0;
+
+	ret = phy_set_mode_ext(inst->repeater, mode, submode);
+	if (ret)
+		return ret;
+
+	u2_phy_instance_set_mode(xsphy, inst, mode);
 
 	return 0;
 }
@@ -590,6 +607,11 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
 		retval = phy_type_syscon_get(inst, child_np);
 		if (retval)
 			return retval;
+
+		inst->repeater = devm_of_phy_optional_get(dev, child_np, NULL);
+		if (IS_ERR(inst->repeater))
+			return dev_err_probe(dev, PTR_ERR(inst->repeater),
+					 "failed to get repeater\n");
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);

-- 
2.55.0


