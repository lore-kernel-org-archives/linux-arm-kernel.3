Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE33FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3/plAyMgQO6xa8WeDoGRxrZ7mxHjmv8z+pGzYQwv7w=; b=CJt8Nq6k3IhHSNGwjfM7VuKPVZ
	9uiVNLgC/lH8kzn+rp33Refz7esKgBm2ybJoxFPpil5pqtb4jr1yhtz2wJsYjSoOtzbgIPB0+776w
	NEAvaFR4wbA0Jn2kGrWSa8/tk6sgo9rmRMx58v+oN1gAYo18ULFNJudr8DnI2uqQabVVQP4WwMrdu
	gX17kyfBmoFWguYl0hzsH3yLCeHJ9rILyvJkbK+vBhkDU8jedJRYu+3kDPMth6jU3av87gFqoRz9N
	yXSWsvuJCgqHoPDp0WCANCFNbu3Ah/EAZQLbWeiLZJQyGJBMyEYZ6nlwO+P72kQby38e1w0nEy0Wh
	/gWNikKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCui-0000000C8pn-3x9D;
	Tue, 05 Aug 2025 08:20:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCPe-0000000C48d-1w7m;
	Tue, 05 Aug 2025 07:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754380125;
	bh=cvoBP4O9/ZJfi9ma34IbO7MMSJEg5uF0GVg1HKc7csA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dv36Bq5o1DyB+jJUcEbnZkGF1qVYLcUbqqwPX8Vpg1zs9keL4nXfsk1n/zOdOOh0d
	 06zZNKt3KASmeWXNth7rZDztKkvUJcD9vX85Grd9f6kHHWqcYVlpjCnOX7AjCdk2OH
	 cX9HJvTMeDrpnX/8pqT1ZzbqO7fOWtyGRSM+K16R5gcOcnsIGI7SxJZNC7Bzv9VJb9
	 WIEdijTX/G0Ph0ztbC6uR5/C+4uQ8zTPbzNyP390wPHA2EwX1q3ig/k57x0PL5Zkg3
	 rFR9nIC4qtfjq4KVXsMwuiRVszkreD8PP1/Krm3n8ln+IIR/qkSa6Xj4npoXwEAm+T
	 qLusp4qqWbMvw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49B6E17E0DB9;
	Tue,  5 Aug 2025 09:48:44 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 09/10] pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
Date: Tue,  5 Aug 2025 09:47:45 +0200
Message-ID: <20250805074746.29457-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004846_648134_25DF3C3D 
X-CRM114-Status: GOOD (  12.47  )
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
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
2.50.1


