Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C41C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrLcFFTBNy2GALhK2bqsbtufwTc98WKvdD69kxXbf7s=; b=S7UN4/z3gY90WrsIaAOvdCNcAk
	nr3ZasDRoFxbzSuzkBZkupTjTeZF+pVA6HmqswBKDSmY+MUZUt5sz2tFlXFQRXU2Wpo3EDR8TF8v4
	QvVn/CSm413pFTi2eW2xwb5II3wq2jJFhHrdNMZYoqRfEebP04WAztMBRXlH4OjwFBScz0bm7bGqT
	UmO5qF6jVaIYnSvtNQdb5krdGxxr79EWzJRsoWHsq48NYS5XtW6sfs/34Y+aJ12UWLGJe9BLIYsxX
	qCnc8S4sIxosUGKiwON3OjD3SLH3PRHHOnJD6gCUK3Zr+WXHmI55nAjK3gQvInCOptELoUeupu9Rv
	l6Qp5fZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzy-0000000CTuI-39PL;
	Thu, 03 Jul 2025 20:57:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM4q-0000000Brrx-4BLo;
	Thu, 03 Jul 2025 15:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557339;
	bh=QTbnWAayA30BBivWJPpqyOG+fUTqPYXweWMPu/sAVpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fuECaOsRJ+a5oKQv/+vraH3cGWALtojlLUzAlblxBoqEmM+B0kHCQcsqsN4fZpMHp
	 h8R2raZElyNnef+3cjyYAd+HaZ/Db6p4B7UYuD+jfIZmZJdQDclhb0UM4ynmJWdH5/
	 xFY33Ley4YTSJH3xnj/bDjJC6KUdRRdakq9Xi968iGhnMOpDG+dOSWMRJtPMikkbLE
	 jGYxI/76dIZbEcsigPEJpV+dkY4EEKu5U+o568BGTGG0z8y5d7Q321xHNByDa47v2y
	 OnQZljJXiqBp91Vh+9q2dTTdsaj7yuec8790J4pGPrxGn91OT0Idujv6y1fKYezkY5
	 vigfm0jVqPxHw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B288617E0B1E;
	Thu,  3 Jul 2025 17:42:18 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:03 +0200
Subject: [PATCH 1/3] Input: mtk-pmic-keys - add support for MT6359 PMIC
 keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=1760;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=QTbnWAayA30BBivWJPpqyOG+fUTqPYXweWMPu/sAVpw=;
 b=khzbvBhxLyH1a2Q/3rP/3wy8zQTM35b3ONQBLfWQnTAxVIyv5iTy90OoIV3ClQHtjZmALABm+
 b3jKceypMLRAPrZ+EwbNQPJmjG9TuHyf1RyWX8dDqBkzaIHV34Ra676
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084221_211941_D3BB9673 
X-CRM114-Status: GOOD (  11.21  )
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

Add PMIC key support on MT6359 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 061d48350df661dd26832b307e1460ee8b8fd535..50e2e792c91d2626d3f282d04a1db60845827ef2 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -117,6 +118,19 @@ static const struct mtk_pmic_regs mt6358_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6359_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+				   0x2, MT6359_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+				   0x8, MT6359_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6359_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -296,6 +310,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,
+	}, {
+		.compatible = "mediatek,mt6359-keys",
+		.data = &mt6359_regs,
 	}, {
 		/* sentinel */
 	}

-- 
2.50.0


