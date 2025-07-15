Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02961C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USA2Og1vbx3Iuv7PPIOLyPVakb2nDaD2HJC0yzF81E0=; b=QVKHnl1v3eUnYtGve0dLzF+a0W
	1qrCzESpOmpGd+6xBHOnqhuwBKv1cKemf50h8XB3ld+JkV7dg12XisdU8+hpk2Lv5t+NjWwUPttKo
	0LFWw/E1TaCytwJaSRD1/oJfArUVQoqEher3lUK9MNUXcHtmAfUbSoIgVVdraMl9Oseev+v6jO0rn
	iqgDPxhW9kkRzt4D3w8Q3z6Z2Ds78iFDUIGtWIEYTSn0SXkwhMJU4eVbqBH9WSJUImi6ERHePQKXx
	fWTHHnnNeQpzg+xv5gBQbg2L5IK36ziPGf6YENZ59uBQmN4gy2lcBuNPqDZ4geTHc/OafaJytYW4S
	PnSLRVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubopD-00000006Nen-0wZV;
	Tue, 15 Jul 2025 23:12:39 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubob8-00000006M5v-04o2;
	Tue, 15 Jul 2025 22:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752620275; bh=USA2Og1vbx3Iuv7PPIOLyPV
	akb2nDaD2HJC0yzF81E0=; b=fTCmM11CDqBBRhv2TaFptb/Zk9uH5o9RcqAVXcTKklR8y8Q6sO
	dWIWDPoZtYQrX3a4sv/NN5o4AcsvBiXGb0hYh31hdyY1NqaIUIaRM3Kn68wfIk1L7D2nED4T3EQ
	AyxRblh/s8imbI+zfq75Kxmwqb9BBVYOFlIb8YEQMJoYg0USML6l8BHMPgDnLZBZ5o1Tuz/Agvr
	iechjUJst2dEoqgccLqXswQ/RDF6dZJEUNkffUYhDRq7X/7SCwON4I4+Ps9x0CYiL81suI8dcQD
	QLve68vkKW+22OVMXvLix+RvwEyOjijwXPFTgVGpMdXBuQ+axbIzaDUXIAkoz0OvgGQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752620275; bh=USA2Og1vbx3Iuv7PPIOLyPV
	akb2nDaD2HJC0yzF81E0=; b=rO4B+He+He4CSH4Nhf0+dhiAFI12D96su8wl7pGWBeUvce66fY
	nx8jYGNgnCwcG6NGpn2SPlkgYL9ijRlR8iCw==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1 2/2] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Date: Wed, 16 Jul 2025 02:57:46 +0400
Message-ID: <20250715225746.1321-2-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715225746.1321-1-me@adomerle.pw>
References: <20250715225746.1321-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_155806_207283_C8DA0CF2 
X-CRM114-Status: GOOD (  10.21  )
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

Add PMIC-Wrapper support for MT6789 SoC.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..34b66cb656c7 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -640,6 +640,17 @@ static const int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
+static int mt6789_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x450,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8A4,
+	[PWRAP_WACS2_RDATA] =		0x8A8,
+};
+
 static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1316,6 +1327,7 @@ enum pwrap_type {
 	PWRAP_MT2701,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
+	PWRAP_MT6789,
 	PWRAP_MT6795,
 	PWRAP_MT6797,
 	PWRAP_MT6873,
@@ -1852,6 +1864,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6789:
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 	case PWRAP_MT8195:
@@ -2302,6 +2315,19 @@ static const struct pmic_wrapper_type pwrap_mt6779 = {
 	.init_soc_specific = NULL,
 };
 
+static struct pmic_wrapper_type pwrap_mt6789 = {
+	.regs = mt6789_regs,
+	.type = PWRAP_MT6789,
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
 static const struct pmic_wrapper_type pwrap_mt6795 = {
 	.regs = mt6795_regs,
 	.type = PWRAP_MT6795,
@@ -2448,6 +2474,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6789-pwrap", .data = &pwrap_mt6789 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
 	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
-- 
2.50.0

