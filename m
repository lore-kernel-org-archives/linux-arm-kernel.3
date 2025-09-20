Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13883CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i39MNlt+UVbQy0OCfpedB6PVEeJs/a2h3+TPgOfuHAE=; b=nF1XHbZsCgFCOVtxJklzimDBC9
	MSRQmesu2CTU5HyK79/EEBV9as7c7JzgDVWV8oaLougaMstmb/vz6x6iX3vmmnoJTDf2C6sCZsEnJ
	DBB2GImQIsqViZ0YcbSRR+Ky+ybEOcgdq1lQA8XcNwDT0JGIQak4ZQUG+cmTd7g6sJr5CSQsrw4xA
	wuzp+cRkaBDVUF7e+7smtM5YPKCK5Ts5Vf/RghvJf887OVhqebdczj2j0igqGgKRdjCBKlADe1U15
	DlfHSqPHLqJPymbWKOnozo3mRLhrSch8e6BdCv47fHY2bbNEyxjOkQCB2wJ5mlr49DHuV0KQRVn2C
	R++1Tilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYe-00000005XXx-0Onm;
	Sat, 20 Sep 2025 15:31:28 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYT-00000005XU8-2T2B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 15:31:18 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=WAf3mWuW96hFGq4BJ1iyiYkb4moeL6UPzqDlqymZ+dlV7xLfdfkz1x0WMaBLy6FjKAm3pByUXkuGAhwCyn7rIW4TQs86m6jOp62JAXSuMwcqnlE5O4gvRP+ucHbEoVUegH+eyfc+rZOsEXz+vet+wjpu6Gt0nLEIBOgYSUBk3qc0EXvXzXG9SODBcK1Ns2K3VotnwccF4Obr9ILwxjpsSy/NDkiW5CZPn0KoK2FTsb5zRh+Q+fBx/bdwpf+u1k1ks+7PGDln8ASc4soWqdV+LcQqbMp7IamDU508cMnVoBBVoNeNOysORqg5p8fQ47WDgk9CfwzVjBb+YHtaA8KrWw==; s=purelymail1; d=purelymail.com; v=1; bh=L4sIzuHH5e728nteRUrwdrI8eR4rd0jT03HRoNtIA4U=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:12 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 20 Sep 2025 17:31:04 +0200
Subject: [PATCH 2/2] i2c: mediatek: add support for MT6878 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=1715;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=L4sIzuHH5e728nteRUrwdrI8eR4rd0jT03HRoNtIA4U=;
 b=YZB3LNAadsjA02iG5NTdWh8e13gZGiQwzvjF7fYZg4rXVNL7C+SgjfARtCWlDTmE+QZhBzmlw
 3jFtL39WcEyB6tm9nHVany5eM/8qY8rYRGWCPYF767QM2BTe3vzdSln
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_083117_703667_43F9C744 
X-CRM114-Status: GOOD (  10.20  )
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

Add support for the I2C units found in the MediaTek MT6878 SoC.
Just like other recent MediaTek SoCs, it uses the v3 register offsets
(which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index ab456c3717db18eef74226de0ee88c49228796f5..085702aee006a6dd0ac89d1382a12fbac2d91c55 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -402,6 +402,19 @@ static const struct mtk_i2c_compatible mt6589_compat = {
 	.max_dma_support = 32,
 };
 
+static const struct mtk_i2c_compatible mt6878_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+};
+
 static const struct mtk_i2c_compatible mt7622_compat = {
 	.quirks = &mt7622_i2c_quirks,
 	.regs = mt_i2c_regs_v1,
@@ -525,6 +538,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
 	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
+	{ .compatible = "mediatek,mt6878-i2c", .data = &mt6878_compat },
 	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
 	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
 	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },

-- 
2.51.0


