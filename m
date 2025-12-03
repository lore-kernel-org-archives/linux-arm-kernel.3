Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1392FD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBWkDmp0ag7+CgslCW5LIViCBNAVEg0ADBw+IhLNr+o=; b=IYfLlEnCihR7PWEt8e4h1PN9rb
	CWg5PiHvYU5xtyL4qnmbWRC/bMzvlgMAFdRMd/QrEUq60AHIGPuyJD9ebni7JtNpdOYHWMucPIchT
	tnPv1lzz1+bzX4FTyQGiIJ1tQMvC8aIYb4HADR0xePgveqJa9Y6Vpjjte0nSoBL/hbmh36CUNd6RK
	A1FzsIOH27H8LdKRSGTl+YmCqXFnQCwQ/cyVGfNKW0drTq6wlB5BPL+KzFe2YU0cTkGLEFoVK+rHH
	++TwJFmKg2FzIHSzuVQgg+/V6xODMCPnNSND41CtDPZhdKlPmzuTwsBUBESyDqjOg2C7TWjaFf15H
	rCUOSRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIv-00000006WA3-3U03;
	Wed, 03 Dec 2025 11:45:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIs-00000006W6P-009n;
	Wed, 03 Dec 2025 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764762347;
	bh=7rOHPZhf4PD5pAFldbx7LxIk29O+cfxEaxF+eBGZ1tw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GmhYL6v+QMpo5rIY30ipper51Gu0HdFzgGWsuDUak1EROzNGEHC9tiF7Ca4IajGDf
	 MzytSZJTCwgTg2J4BKB7g9DR/k6qrsa3Ex2H5XhBaVNqz6tAJedY/GsTFjk60uGhLt
	 EDaI7R325yEFT9cMqFksaRz1g5hew9T4AivNW2YvHOnn4ZHNzuU1oPoVTNtfohMEOJ
	 k4CQ76udrfPEyUOrCC8EynbGf6WMtsKMjjgNLbDiEfH5h5hKFlcwOBOHGtM7FmZxkF
	 RYAP2n+7F3C+mS5aBGOUqBUe8N6NULtqergAmG6/tc5+fcKs77EfPJUxeEjf1A71Yq
	 9eLxvnHmCaLRg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 769A617E13F2;
	Wed,  3 Dec 2025 12:45:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 12:45:36 +0100
Subject: [PATCH 3/3] mmc: mtk-sd: add support for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-mt8189-add-mmc-support-v1-3-f5ce43212fe9@collabora.com>
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764762344; l=1893;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7rOHPZhf4PD5pAFldbx7LxIk29O+cfxEaxF+eBGZ1tw=;
 b=SLgz3INqPxcoBYI65advm9kShlkIf/WYvat1ohh0WEg1Xbz3muok1O8f7wjV0GWKXmcr+rjgw
 vpfwQNz49lGDcW3y7gPbtg+vco6PO887setn29kDXGgjrU/pYQGoN50
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_034550_256685_6B2F4DAD 
X-CRM114-Status: GOOD (  10.96  )
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

Even though MMC IP in MT8189 SoC is partially compatible with the one
found in MT8196 SoC, its register layout has some slight differences
and additional features such as the system power management release
resource control support.
Thus, add new compatible and platform data to support this SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4ce596d616409646613748086476c58d8b7b8de9..302ac8529c4f093a541db2d37dcc8709c3775557 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -675,6 +675,25 @@ static const struct mtk_mmc_compatible mt8516_compat = {
 	.stop_dly_sel = 3,
 };
 
+static const struct mtk_mmc_compatible mt8189_compat = {
+	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
+	.hs400_tune = false,
+	.needs_top_base = true,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.stop_dly_sel = 1,
+	.pop_en_cnt = 2,
+	.enhance_rx = true,
+	.support_64g = true,
+	.support_new_tx = true,
+	.support_new_rx = true,
+	.support_spm_res_release = true,
+};
+
 static const struct mtk_mmc_compatible mt8196_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
@@ -705,6 +724,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
+	{ .compatible = "mediatek,mt8189-mmc", .data = &mt8189_compat},
 	{ .compatible = "mediatek,mt8196-mmc", .data = &mt8196_compat},
 	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
 

-- 
2.52.0


