Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41AACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u009rK8NBkfDo1e7Yz5QlxEzEoGCc9HxaXbQXCuXZqs=; b=gvo3MtyRiYC8c2dMwgo4xiVCAB
	I8LyIe0kcnwr5V5VZylp7Num2QQm1vDcsDRSPWafRwT7EqQ1FCb33hxgSzFQ6NydbaKzqVo/ETmGG
	H4LyiPaVhNVCmtCSi/RNiRR3xObJsBWtnLptvJB7BfH14GRjZJ4i4Tk2o+ap+6NWmgXel/PssaOpx
	q0gdFb9mr0+fh/bC245b2ENhj57ghbi71YRWfpNaKv2OeXbYyT4rV6fff1LNkulFH5edWvPtrjjmv
	1Rfk82PPstLx+1K8X+/c+v/VqRUDc3llhS6pJxAUXFfp9zr2lIYJqarCoQQfuZQVdgOvHlZPNL4o4
	44j/HuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyad-00000009JO5-0S3e;
	Sun, 11 Oct 2026 18:48:07 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyaa-00000009JLM-0atB;
	Sun, 11 Oct 2026 18:48:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791744482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u009rK8NBkfDo1e7Yz5QlxEzEoGCc9HxaXbQXCuXZqs=;
	b=NL3Lv06R2LADRYVeayP35rIkdbbC1D51GheIAHVayAoaf1logy/9PFsdeq7V9yl9tPaXg9
	U9dp1YBiX4eKdkZhiQJc4CGj93yL4s2C/Wu1NzHkaqN27ovWcjSC1myyVUilWAEkLj/9qw
	J5DJlBjFItleFfQppkvsht5Si95azAIAAyOIQFv6nHYaxpfArWwZUBi/QUImTfUMTjhdu6
	N6tIlGRdmqKOwSRUw90NPzouIVR7vIQ0T110/hvDQyjwJIH07fjD8Uf9tWCZDqx4aYGK6e
	jzxGBVMyohQp6rR3O2PPZKkB4bDNPwmr2iHg1DcM636aitVeT0XmEm1QtiHKzQ==
To: ulfh@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v2 3/4] pmdomain: mediatek: mt8188: Enable the GPU timestamp counter
Date: Sun, 11 Oct 2026 20:47:54 +0200
Message-ID: <20261011184755.2058017-4-michal@nozomi.space>
In-Reply-To: <20261011184755.2058017-1-michal@nozomi.space>
References: <20261011184755.2058017-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_114804_346098_0132CE78 
X-CRM114-Status: GOOD (  12.23  )
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

The GPU timestamp counter only counts once the TOP_TSVALUEB enable bits
in MFGCFG feed it the SoC system timer, and MFGCFG loses them whenever
the MFG1 power domain is turned off. Without them GPU_TIMESTAMP reads
zero, so timestamp queries in userspace drivers and the timestamps
written by GPU jobs are always zero.

Add MFGCFG as the second MT8188 access controller and set the bits every
time MFG1 has been powered on.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 drivers/pmdomain/mediatek/mt8188-pm-domains.h | 16 +++++++++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
index 3a989e83e9b79..88035cc6a808b 100644
--- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
@@ -14,8 +14,21 @@
  * MT8188 power domain support
  */
 
+#define MT8188_MFG_TIMESTAMP			0x130
+#define MT8188_MFG_TIMESTAMP_EN			GENMASK(1, 0)
+
 static enum scpsys_bus_prot_block scpsys_bus_prot_blocks_mt8188[] = {
-	BUS_PROT_BLOCK_INFRA
+	BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_MFGCFG
+};
+
+/*
+ * The GPU timestamp counter only counts once MFGCFG feeds it the SoC system
+ * timer, which MFGCFG forgets whenever MFG1 is powered off.
+ */
+static const struct scpsys_reg_init mt8188_mfg_timestamp = {
+	.block = BUS_PROT_BLOCK_MFGCFG,
+	.ofs = MT8188_MFG_TIMESTAMP,
+	.val = MT8188_MFG_TIMESTAMP_EN,
 };
 
 static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
@@ -70,6 +83,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA),
 		},
 		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+		.reg_init = &mt8188_mfg_timestamp,
 	},
 	[MT8188_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 4c2c56addb3cc..191d5cfb60fe7 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -71,6 +71,7 @@ enum scpsys_bus_prot_block {
 	BUS_PROT_BLOCK_CAM_SUB0,
 	BUS_PROT_BLOCK_IPE_SUB0,
 	BUS_PROT_BLOCK_VLP,
+	BUS_PROT_BLOCK_MFGCFG,
 	BUS_PROT_BLOCK_COUNT,
 };
 
-- 
2.56.0


