Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D38DC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqCgHy0W6OOYmpQtbQsAq1/yyPs/JR4S/EvsXoobYrk=; b=EBXqjQ8IOUy/73S2DbZJ4kgUnh
	FwKzAYk4wwWy/wmeyaiRhNMlDPA2Qr6i/7sYDhjDbmJIj+1YT15iZp1heuQ4mlaxviUnUOl0icRC+
	VjqC8OeM5mZV4IMoBX7dqOSH9bfqqChinhUD5IH09IwL8biIw3UYjHtruW1WdW/1vogLqBfWfqM0j
	uOiesvygCjhyxR+vEU2iEFNgKuEGBZdQ0Zt5Sy4giyRi8xvbNC1bwSWGwTXVlO67ipiNaFMZ2Zy4x
	LxsPsY0BlhKuJz3f9nbHsw8iflinDPVs20a76o/7FawUmjHQoXq6IWfB5nI7KrNr5ciqU8K+x6EmP
	o4lBnC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhk17-000000057YR-3R8q;
	Fri, 01 Aug 2025 07:17:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjtP-000000056Fu-2STA;
	Fri, 01 Aug 2025 07:09:29 +0000
X-UUID: 7381d6466ea611f09eb0dd999d3936bf-20250801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GqCgHy0W6OOYmpQtbQsAq1/yyPs/JR4S/EvsXoobYrk=;
	b=oMtlIV44eoBQ52aCZBOqcF0pSjTraFt73/SQT7lHuC8lGAYpqy7wM19z+lqjbjUv08z4bQ4y6/XEndU6vn1EL+5DYF4j42CMX53/29Hbl+Tn8KTGCEHiAjHCz1Sn95aFsvRPL2JyI8nEFmTay3NeSnmH0EE7UzKZPYnPDpQxc20=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1e7a1a5e-b91c-4d64-958f-d1ed0e0a495f,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:28750209-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7381d6466ea611f09eb0dd999d3936bf-20250801
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1623157583; Fri, 01 Aug 2025 00:09:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 1 Aug 2025 15:09:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 1 Aug 2025 15:09:18 +0800
From: niklaus.liu <niklaus.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, niklaus.liu
	<niklaus.liu@mediatek.com>
Subject: [PATCH 2/3] soc:mediatek  mt8189: Porting driver for spmi/pwrap
Date: Fri, 1 Aug 2025 14:39:36 +0800
Message-ID: <20250801070913.3109-3-niklaus.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250801070913.3109-1-niklaus.liu@mediatek.com>
References: <20250801070913.3109-1-niklaus.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_000927_626929_45E18BC1 
X-CRM114-Status: GOOD (  12.62  )
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

Modify spmi/pwrap driver for mt8189

Signed-off-by: niklaus.liu <niklaus.liu@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 27 +++++++++++++++++++++++++++
 drivers/spmi/spmi-mtk-pmif.c         |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..e3e8234e29a0 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1087,6 +1087,17 @@ static const int mt8183_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =			0xC28,
 };
 
+static int mt8189_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3e4,
+	[PWRAP_INT_EN] =		0x450,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8a4,
+	[PWRAP_WACS2_RDATA] =		0x8a8,
+};
+
 static const int mt8195_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_STAUPD_CTRL] =		0x4C,
@@ -1324,6 +1335,7 @@ enum pwrap_type {
 	PWRAP_MT8173,
 	PWRAP_MT8183,
 	PWRAP_MT8186,
+	PWRAP_MT8189,
 	PWRAP_MT8195,
 	PWRAP_MT8365,
 	PWRAP_MT8516,
@@ -1854,6 +1866,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		break;
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
+	case PWRAP_MT8189:
 	case PWRAP_MT8195:
 		break;
 	}
@@ -2393,6 +2406,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 	.init_soc_specific = pwrap_mt8183_init_soc_specific,
 };
 
+static struct pmic_wrapper_type pwrap_mt8189 = {
+	.regs = mt8189_regs,
+	.type = PWRAP_MT8189,
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
@@ -2456,6 +2482,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
 	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
 	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },
+	{ .compatible = "mediatek,mt8189-pwrap", .data = &pwrap_mt8189 },
 	{ .compatible = "mediatek,mt8195-pwrap", .data = &pwrap_mt8195 },
 	{ .compatible = "mediatek,mt8365-pwrap", .data = &pwrap_mt8365 },
 	{ .compatible = "mediatek,mt8516-pwrap", .data = &pwrap_mt8516 },
diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 160d36f7d238..00420568afef 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -530,6 +530,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
 	{
 		.compatible = "mediatek,mt6873-spmi",
 		.data = &mt6873_pmif_arb,
+	}, {
+		.compatible = "mediatek,mt8189-spmi",
+		.data = &mt8195_pmif_arb,
 	}, {
 		.compatible = "mediatek,mt8195-spmi",
 		.data = &mt8195_pmif_arb,
-- 
2.46.0


