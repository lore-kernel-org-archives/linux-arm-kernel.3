Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D30EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np4gP+kVZ9dH3S8OkU+k3ieJFZn7l6DRLrAoselSPRg=; b=I9OZZp5o/crlvB3d2UzYqC5XLy
	JvY1t5FKucrPCs7pKRYQQetc8oUqPNLuERfaqf5bzx/CFieeBDHL07TelmhZ9rC5aFCUqm2gjoBEH
	1y9crkE58uHyu0MO6cEgRziL2RbO0YHnbOvfV4UKf5Zsv457fxrJOyPs+CpLyo0a5W2bEh7U1B/Hy
	UJ3TlGqhOaEc/uPt6NqeazlYmUJ+YT3ZqWZwim9DG4sfDOVxLNCjdTgxRGYh9lQm7EwTX5C9EuTBK
	VUjgkygOM2M04Ea2F6uFEIQigICNIDK03QTFquDncvbrxixV1GOrj/boFVUqoBGBT81TvoyWytcYk
	fLBSmC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTne9-00000003ur2-2Xm0;
	Mon, 23 Jun 2025 20:20:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfsH-00000002bG1-0IIn;
	Mon, 23 Jun 2025 12:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680127;
	bh=eim72WFFw0hgS/DlK1JwbuAVE47pGc2rjtb1MD+9DwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bax/+hUXRf3vYM5Uir6RHyrcs6CzrgdYjTAPJ2N0cYFZUev4eGTmA63KLEsSHX7pV
	 OXwWZ5Tj+R8BnTi9U4qdast8r36NC4bRR3KdtLhY5En4FK8TWV10VcozqjvtpJ2Nbb
	 WV6fLizrVVvQhpdppzRrgRfuQvLEKzRuAaTAJMPuOKkCbL++nHoIeVDwxzXaMF948x
	 SEwq9RWWs+7rMpsDuD2bmIE7gMzsmR6XQK0MnI1Wbgh+TGdE3B55wv072kUQWZFWLO
	 JEaGKkrJLwQbAgHeVrT3gP+kYwbxAuM6VB/RLbTBgdSjxOn7PvqSSeEwewmvp+I0Yd
	 kFSnfXkamNkfw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD86717E35E7;
	Mon, 23 Jun 2025 14:02:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 09/13] pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
Date: Mon, 23 Jun 2025 14:01:50 +0200
Message-ID: <20250623120154.109429-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050209_291305_1BE07259 
X-CRM114-Status: GOOD (  11.76  )
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

Add the bus_prot_blocks handle and declare num_bus_prot_blocks to
allow all of the currently supported AArch64 MediaTek SoCs to use
the new style regmap retrieval in the driver when a new style
devicetree declaring the mediatek,bus-protection phandle(s) in
the main power controller node is found.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mt6795-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8167-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8173-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8183-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8186-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 6 ++++++
 drivers/pmdomain/mediatek/mt8192-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8195-pm-domains.h | 5 +++++
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 6 ++++++
 9 files changed, 47 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mt6795-pm-domains.h b/drivers/pmdomain/mediatek/mt6795-pm-domains.h
index a3f7785b04bd..dc8e9f8877ad 100644
--- a/drivers/pmdomain/mediatek/mt6795-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt6795-pm-domains.h
@@ -9,6 +9,9 @@
 /*
  * MT6795 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt6795[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt6795[] = {
 	[MT6795_POWER_DOMAIN_VDEC] = {
@@ -107,6 +110,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt6795[] = {
 static const struct scpsys_soc_data mt6795_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt6795,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt6795),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt6795,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt6795),
 };
 
 #endif /* __SOC_MEDIATEK_MT6795_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8167-pm-domains.h b/drivers/pmdomain/mediatek/mt8167-pm-domains.h
index 8a0e898b79ab..f6ee48a711a1 100644
--- a/drivers/pmdomain/mediatek/mt8167-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8167-pm-domains.h
@@ -12,6 +12,9 @@
 /*
  * MT8167 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8167[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 	[MT8167_POWER_DOMAIN_MM] = {
@@ -99,6 +102,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 static const struct scpsys_soc_data mt8167_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8167,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8167),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8167,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8167),
 };
 
 #endif /* __SOC_MEDIATEK_MT8167_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8173-pm-domains.h b/drivers/pmdomain/mediatek/mt8173-pm-domains.h
index 7be0f47f5214..561a644b5d1c 100644
--- a/drivers/pmdomain/mediatek/mt8173-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8173-pm-domains.h
@@ -9,6 +9,9 @@
 /*
  * MT8173 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8173[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 	[MT8173_POWER_DOMAIN_VDEC] = {
@@ -118,6 +121,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 static const struct scpsys_soc_data mt8173_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8173),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8173,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8173),
 };
 
 #endif /* __SOC_MEDIATEK_MT8173_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
index c4c1b63d85b1..3742782a2702 100644
--- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
@@ -9,6 +9,9 @@
 /*
  * MT8183 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8183[] = {
+	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 	[MT8183_POWER_DOMAIN_AUDIO] = {
@@ -290,6 +293,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 static const struct scpsys_soc_data mt8183_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8183,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8183),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8183,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8183),
 };
 
 #endif /* __SOC_MEDIATEK_MT8183_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8186-pm-domains.h b/drivers/pmdomain/mediatek/mt8186-pm-domains.h
index cbac715c38fa..00b9861af7c9 100644
--- a/drivers/pmdomain/mediatek/mt8186-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8186-pm-domains.h
@@ -13,6 +13,9 @@
 /*
  * MT8186 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8186[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 	[MT8186_POWER_DOMAIN_MFG0] = {
@@ -361,6 +364,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 static const struct scpsys_soc_data mt8186_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8186,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8186),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8186,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8186),
 };
 
 #endif /* __SOC_MEDIATEK_MT8186_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
index 007235be9efe..3a989e83e9b7 100644
--- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
@@ -14,6 +14,10 @@
  * MT8188 power domain support
  */
 
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8188[] = {
+	BUS_PROT_BLOCK_INFRA
+};
+
 static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 	[MT8188_POWER_DOMAIN_MFG0] = {
 		.name = "mfg0",
@@ -685,6 +689,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 static const struct scpsys_soc_data mt8188_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8188,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8188),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8188,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8188),
 };
 
 #endif /* __SOC_MEDIATEK_MT8188_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8192-pm-domains.h b/drivers/pmdomain/mediatek/mt8192-pm-domains.h
index 6f139eed3769..5d62fac5f682 100644
--- a/drivers/pmdomain/mediatek/mt8192-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8192-pm-domains.h
@@ -9,6 +9,9 @@
 /*
  * MT8192 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8192[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 	[MT8192_POWER_DOMAIN_AUDIO] = {
@@ -380,6 +383,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 static const struct scpsys_soc_data mt8192_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8192,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8192),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8192,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8192),
 };
 
 #endif /* __SOC_MEDIATEK_MT8192_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8195-pm-domains.h b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
index 59aa031ae632..9405e8f62eaf 100644
--- a/drivers/pmdomain/mediatek/mt8195-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
@@ -13,6 +13,9 @@
 /*
  * MT8195 power domain support
  */
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8195[] = {
+	BUS_PROT_BLOCK_INFRA
+};
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 	[MT8195_POWER_DOMAIN_PCIE_MAC_P0] = {
@@ -661,6 +664,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 static const struct scpsys_soc_data mt8195_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8195,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8195),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8195,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8195),
 };
 
 #endif /* __SOC_MEDIATEK_MT8195_PM_DOMAINS_H */
diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 6fbd5ef8d672..33265ab8ce76 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -33,6 +33,10 @@
 			      _sta_mask, _sta,				\
 			      BUS_PROT_INVERTED | BUS_PROT_REG_UPDATE)
 
+static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8365[] = {
+	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_INFRA_NAO, BUS_PROT_BLOCK_SMI
+};
+
 static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 	[MT8365_POWER_DOMAIN_MM] = {
 		.name = "mm",
@@ -190,6 +194,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 static const struct scpsys_soc_data mt8365_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8365,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8365),
+	.bus_prot_blocks = scpsys_bus_prot_blocks_mt8365,
+	.num_bus_prot_blocks = ARRAY_SIZE(scpsys_bus_prot_blocks_mt8365),
 };
 
 #endif /* __SOC_MEDIATEK_MT8365_PM_DOMAINS_H */
-- 
2.49.0


