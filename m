Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4b7YNwI2mId6wV052DaQYNqAr6otwP3QlgPB96X+TU=; b=V1dNWKZJEvLHDB2l+WPPzmySWp
	CdlfLQVFJtcsrJKbL+uexOUVuzn501R/+udpA2BVchwPTfz5owkaNX6v5RQ89q7MeMxE30PfYKyAJ
	qEPP4fXMzQSSSe9EOj3CDR1krH2MLo7WgQFCebp+8XZoz+cd2KZG0Ikiqp9WD2SwlU7HZ7O8tOWcb
	CbNZbsfH0W7zDYAPA92jGhsLoePbJWU6zUI/mA7bu7mt6qAPVu3/+BPbGO6hMv+Sq/ahfsYfHhtVn
	PlecSV46ACP4KkRXLt/RMp+BwGkG/nD9DygA2fV4G+GfiN0uKNRzvZeq5NlYPVd3/Qtp0W+7Ckv4d
	Lf2odZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKU8-00000007AwD-2XUg;
	Wed, 09 Jul 2025 02:24:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKRj-00000007AWd-3F09;
	Wed, 09 Jul 2025 02:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E33D661151;
	Wed,  9 Jul 2025 02:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5D9C4CEED;
	Wed,  9 Jul 2025 02:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752027726;
	bh=OfoDaqQ2V0qjoGLeO8rdU8Wgju6X0K8yq1beZOaKvpU=;
	h=From:To:Cc:Subject:Date:From;
	b=udtmn9gfG8VrwPGMkQ3vvV019c4XopWDfkbFcrockuBii8oioggfvbRiKtg6iKHmg
	 MsLFDqbSYgF5rfqkz4eMrp5zvbKzImvQggkOE1H9P9nJsUHes3p8b8Ea9Nadwg3u4+
	 FyYc06+9kxdnwREUkigBlRmrl2ObHe1wI7ngAJ6LeRTqs863cmywXVBUTF9KOK0LMe
	 3+9m9h5jVNurwtNDTe084zYXGW5lo/cAup1ovudlWRaBTZAqSfpwney/oJ7pc3XxCu
	 lpgOa0u6TeuIiDLvYmH61qba8uDNYb8MhFv5/qmLF69J+NYWP9z0DJSGe8cBp2MSjL
	 fyfzVKeWnDnfw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] wifi: mt76: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Tue,  8 Jul 2025 21:22:01 -0500
Message-ID: <20250709022201.2092329-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
  - Split to separate patch
---
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index c823a7554a3a..5f19b506cc50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -284,20 +284,15 @@ static int mt798x_wmac_coninfra_check(struct mt7915_dev *dev)
 static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 {
 	struct device *pdev = dev->mt76.dev;
-	struct reserved_mem *rmem;
-	struct device_node *np;
+	struct resource res;
 	u32 val;
+	int ret;
 
-	np = of_parse_phandle(pdev->of_node, "memory-region", 0);
-	if (!np)
-		return -EINVAL;
-
-	rmem = of_reserved_mem_lookup(np);
-	of_node_put(np);
-	if (!rmem)
-		return -EINVAL;
+	ret = of_reserved_mem_region_to_resource(pdev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	val = (rmem->base >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
+	val = (res.start >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
 
 	if (is_mt7986(&dev->mt76)) {
 		/* Set conninfra subsys PLL check */
@@ -318,8 +313,8 @@ static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 			       MT_TOP_EFUSE_BASE_MASK, 0x11f20000 >> 16);
 	}
 
-	mt76_wr(dev, MT_INFRA_BUS_EMI_START, rmem->base);
-	mt76_wr(dev, MT_INFRA_BUS_EMI_END, rmem->size);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_START, res.start);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_END, resource_size(&res));
 
 	mt76_rr(dev, MT_CONN_INFRA_EFUSE);
 
-- 
2.47.2


