Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3DBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMvMUbqwzYMs+NFv5DBsdmg4oCEeEiFeKnSlIqNtn8M=; b=PjXbXrfE37hiRmxk2FPMseGRki
	1slgyiQ0wTe5fbLtBOSzIegXG94RGKvk+97fzI+7u4vGX/ze8XTbbSFscaP/BYrYOIT+irkwAcSPj
	qLDSoaOx/WPooRFhwc+EhHnNLpDf0OW/f7QoNQzKnznLni0HVIa5tIyk3asUSJyJXacBbVH+97FZg
	or1XXPjvweo/l40fxkfJMntvCDxK4P5yvSB9q7Y8Q1+IbqkmYcvEf2vlLZx2pZb5w27PPgP9G0h4b
	G8ddIrFDmYxjR3VOETrWfqGzD4i2L3gmf7E9jZVnQnPBUE+SAW6WWsF37KYiO6YkfrKGA6s2K6yO1
	mH4tYPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5f2-0000000H73s-0VCU;
	Thu, 21 Aug 2025 13:49:00 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2LF-0000000GYim-04RH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:16:22 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6AEDCEC01DC;
	Thu, 21 Aug 2025 06:16:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 21 Aug 2025 06:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755771380;
	 x=1755857780; bh=iMvMUbqwzYMs+NFv5DBsdmg4oCEeEiFeKnSlIqNtn8M=; b=
	MwylDu/r6/thFNHVvnFnXsv7H0tisLf3i64yPJl73lFhkX0K89OwIp7z5L/0qpAo
	c4IGg94aw+j/Ah/iNQjbMH3oeOdsRwOt7SssyssdO3GZEcCJNzydLfxzPFtQvtoP
	cOCkf/0xlW1jVTKavsrP8mZuZblAFHILmd+oM8AFmxjRKy6vcVNzkgvnpXuB5gxG
	0S5QLIX2NK3nLL/v82ffaGhjUhqOjed7zUjLuqfXbMpz1k6THUTRDihtmq5ff22R
	vjD/K6naJuoGFN8F6thKc6pZhKeX3ATz8zKEk7ATve2e54XgT9OBeOGliHy/lGcJ
	gTb6XKwpwZvmyURE147g9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755771380; x=
	1755857780; bh=iMvMUbqwzYMs+NFv5DBsdmg4oCEeEiFeKnSlIqNtn8M=; b=H
	iXiqU1wXWz5ivEAQmabDd4c+zBB8necoB+R0whgu8QVOnB+/sBttD7iy+muxVGpl
	2HC5LoUoiuPheSF/yr54WQgGvi56yrjLoHGD8S7l6YGBYdLlGR1TjysQb0OlnoR0
	smxHTkVlj7oZstm0VbCSzdEwkezC1874Q/biftOLkRq71B9GeWwXTqGPYcA1qM/V
	LXwTmSoX6sdMGqqtpsYiKHcddhPs2CgvOdiGM/mXPvAbmu++4mb22LdSR/0UArui
	sMisLRDCixhlMniYRlpiKeuffrPwUqLDjH2Do2D1AqLK9Ez7d0RoRWtMf/Irn0og
	zqWn6lzLa+/uLA2s4lOBw==
X-ME-Sender: <xms:9PGmaHrmw-TWHOL2cLm9lQSlBZgxz6JiiB_SpM8Bk8jeRtg8cRgAnA>
    <xme:9PGmaHnf4ikb6zHI94n1VvASJ2DKGOu0ZHxnBxY7Q-kr68OIppVpEuAgzAV57j-qD
    ZZMME_uEz3esrB7lNE>
X-ME-Received: <xmr:9PGmaBV8WQEMQTBoMRayPDfsk8sQLErP4V5eGX9uVENlj7Aw45Pl9daeC1RJmeikFdKrxvOAV6RAqyJBNJbnpOwmTagnv9MHnC4_LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpth
    htohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopehiohhmmhhusehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinh
    hugidruggvvh
X-ME-Proxy: <xmx:9PGmaLq92ipQEc0rknsPUOXNqpa2lh_TjutJTRtwL37Jwi-qN5Uhbg>
    <xmx:9PGmaCUwugZBJ04YATvGtOgO6UQiCG5KwoZNaJ_6YHIT3WRuy2tqbw>
    <xmx:9PGmaMGgkRahoRXSAcjwO4_woYoMKSI5RPbP1CYKHx_UmNMFaoR6hg>
    <xmx:9PGmaJDLIKA4CqeTrdi-gqbNmnVMCMT3ed35-Ie2bxYOHOxI3gAafw>
    <xmx:9PGmaM4J45ooUzlZLLphkNhNwBHBJ9xL_Rfbt4QcuI9ksRmyN8F8b9Ff>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 06:16:19 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 21 Aug 2025 12:16:00 +0200
Subject: [PATCH v2 3/3] iommu/apple-dart: Add 4-level page table support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-apple-dart-4levels-v2-3-e39af79daa37@jannau.net>
References: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
In-Reply-To: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4651; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=X3gkHJGczXXUrwmJq+dtwcmyPTUZEqB4c8Tpzbc+JsA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoxlH1/xWwoWGDCeWaNb09pjxp9hpzx3CcsZoS0vtoUz7
 1dlfs/QUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCIxXxj+x/DvNxQ/Ii9w4d/c
 Nfm3WKe3Jc0Ue3u++33B87yzGtqtRxj+Wc/97DX/2c9nzcl2u6X5oy6sifpesWuyWUmMz+RLcY5
 3GQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_031621_132659_F98464F6 
X-CRM114-Status: GOOD (  15.15  )
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

From: Hector Martin <marcan@marcan.st>

The T8110 variant DART implementation on T602x SoCs indicates an IAS of
42, which requires an extra page table level. The extra level is
optional, but let's implement it.

Later it might be useful to restrict this based on the actual attached
devices, since most won't need that much address space anyway.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Sven Peter <sven@kernel.org>
---
 drivers/iommu/apple-dart.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index e72a93e78e26ca61b233c83d439dbdfadf040fc6..9696c8f143876416b10f812423aa5bd8986bfc88 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -133,6 +133,7 @@
 #define DART_T8110_TCR                  0x1000
 #define DART_T8110_TCR_REMAP            GENMASK(11, 8)
 #define DART_T8110_TCR_REMAP_EN         BIT(7)
+#define DART_T8110_TCR_FOUR_LEVEL       BIT(3)
 #define DART_T8110_TCR_BYPASS_DAPF      BIT(2)
 #define DART_T8110_TCR_BYPASS_DART      BIT(1)
 #define DART_T8110_TCR_TRANSLATE_ENABLE BIT(0)
@@ -177,6 +178,7 @@ struct apple_dart_hw {
 	u32 tcr_enabled;
 	u32 tcr_disabled;
 	u32 tcr_bypass;
+	u32 tcr_4level;
 
 	u32 ttbr;
 	u32 ttbr_valid;
@@ -217,6 +219,7 @@ struct apple_dart {
 	u32 pgsize;
 	u32 num_streams;
 	u32 supports_bypass : 1;
+	u32 four_level : 1;
 
 	struct iommu_group *sid2group[DART_MAX_STREAMS];
 	struct iommu_device iommu;
@@ -305,13 +308,19 @@ static struct apple_dart_domain *to_dart_domain(struct iommu_domain *dom)
 }
 
 static void
-apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map)
+apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map, int levels)
 {
 	struct apple_dart *dart = stream_map->dart;
+	u32 tcr = dart->hw->tcr_enabled;
 	int sid;
 
+	if (levels == 4)
+		tcr |= dart->hw->tcr_4level;
+
+	WARN_ON(levels != 3 && levels != 4);
+	WARN_ON(levels == 4 && !dart->four_level);
 	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
-		writel(dart->hw->tcr_enabled, dart->regs + DART_TCR(dart, sid));
+		writel(tcr, dart->regs + DART_TCR(dart, sid));
 }
 
 static void apple_dart_hw_disable_dma(struct apple_dart_stream_map *stream_map)
@@ -569,7 +578,8 @@ apple_dart_setup_translation(struct apple_dart_domain *domain,
 	for (; i < stream_map->dart->hw->ttbr_count; ++i)
 		apple_dart_hw_clear_ttbr(stream_map, i);
 
-	apple_dart_hw_enable_translation(stream_map);
+	apple_dart_hw_enable_translation(stream_map,
+					 pgtbl_cfg->apple_dart_cfg.n_levels);
 	stream_map->dart->hw->invalidate_tlb(stream_map);
 }
 
@@ -614,7 +624,7 @@ static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
 	dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
 	dart_domain->domain.geometry.aperture_start = 0;
 	dart_domain->domain.geometry.aperture_end =
-		(dma_addr_t)DMA_BIT_MASK(dart->ias);
+		(dma_addr_t)DMA_BIT_MASK(pgtbl_cfg.ias);
 	dart_domain->domain.geometry.force_aperture = true;
 
 	dart_domain->finalized = true;
@@ -807,6 +817,8 @@ static int apple_dart_of_xlate(struct device *dev,
 	if (cfg_dart) {
 		if (cfg_dart->pgsize != dart->pgsize)
 			return -EINVAL;
+		if (cfg_dart->ias != dart->ias)
+			return -EINVAL;
 	}
 
 	cfg->supports_bypass &= dart->supports_bypass;
@@ -1137,6 +1149,7 @@ static int apple_dart_probe(struct platform_device *pdev)
 		dart->ias = FIELD_GET(DART_T8110_PARAMS3_VA_WIDTH, dart_params[2]);
 		dart->oas = FIELD_GET(DART_T8110_PARAMS3_PA_WIDTH, dart_params[2]);
 		dart->num_streams = FIELD_GET(DART_T8110_PARAMS4_NUM_SIDS, dart_params[3]);
+		dart->four_level = dart->ias > 36;
 		break;
 	}
 
@@ -1169,9 +1182,9 @@ static int apple_dart_probe(struct platform_device *pdev)
 
 	dev_info(
 		&pdev->dev,
-		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d] initialized\n",
+		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, AS %d -> %d] initialized\n",
 		dart->pgsize, dart->num_streams, dart->supports_bypass,
-		dart->pgsize > PAGE_SIZE);
+		dart->pgsize > PAGE_SIZE, dart->ias, dart->oas);
 	return 0;
 
 err_sysfs_remove:
@@ -1292,6 +1305,7 @@ static const struct apple_dart_hw apple_dart_hw_t8110 = {
 	.tcr_enabled = DART_T8110_TCR_TRANSLATE_ENABLE,
 	.tcr_disabled = 0,
 	.tcr_bypass = DART_T8110_TCR_BYPASS_DAPF | DART_T8110_TCR_BYPASS_DART,
+	.tcr_4level = DART_T8110_TCR_FOUR_LEVEL,
 
 	.ttbr = DART_T8110_TTBR,
 	.ttbr_valid = DART_T8110_TTBR_VALID,

-- 
2.50.1


