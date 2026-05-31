Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187FFCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/3KeoLPm7hmyo0nljw/zsEB/dun7MNqHyVRj1yWNVw=; b=CSU4A7DCUYdxkZBg8wA5ABuETt
	ommU/H5tEqlUYQkBxfkC9dfiBRjXOtkVg1RmKn2VkrdjR5itTfkLzQ87S1IQx0zY0M9DJaGUDx+ly
	28WPgW8JpWzr9lQrVL5r70AxMmoBmAannxjvqo8LL03u6DhkpYg8VbQkWJwdIsZsJieA3WGWS3OXv
	UmT8uceO7NVMsYlGsyjsLakyip0K+OQCMxP1LYQzdNQueR3/cPoR+7ZokvJZuY14tDCfrJRsdWjQ7
	AAtLar55YicQfZenhBW5rmviBWJAmyFQj/oHDD8pkNueWbdx1NIjRrfrjMvGYVnYtUbR1jP3bAB6g
	PlImi9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcCA-00000009PDu-0Pg7;
	Sun, 31 May 2026 09:10:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcBy-00000009P74-1k8Y;
	Sun, 31 May 2026 09:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52AF844672;
	Sun, 31 May 2026 09:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 292D9C2BCFA;
	Sun, 31 May 2026 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218645;
	bh=6/oMIOAJ1Qzv7x2FN/hHsOLQFSqBCNkvqDPY2Y8JW24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iXzL26ytLKY2kWbtMH/8kkPcRAd5Ri2U43UyF30R34udyttJ9oNcm92e04e4iPZYJ
	 v9HEQdLnKUchGkU8BQ/li2h4ligNIAFb5b+JKr7Q5RJ4ZzCqb3NdLRgSWHyWW1W2RP
	 tWY60yFH12g+m0itr24pb+mTL45tdNKuWHQqBonIEAgNyfwio8Cb5HUUwwIETHgYLk
	 0vmDetHL4sJZyfAs1RHULpIBau3DsUGIOgjrRA5MU5TjKjI5+AIEJoE3GLyPOSzsnE
	 sH3YhntSnx1RBh1z5wnp2Cme6AcAfGf5v07TimLnNzrV2TQQl75sIzJ/jZYhcRGdxa
	 XuXgocVUctWOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20867CD6E56;
	Sun, 31 May 2026 09:10:45 +0000 (UTC)
From: Yassine Oudjana via B4 Relay <devnull+y.oudjana.protonmail.com@kernel.org>
Date: Sun, 31 May 2026 11:10:45 +0200
Subject: [PATCH v2 4/4] Input: mtk-pmic-keys - Add support for MT6328
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mt6735-pwrap-mt6328-pmic-v2-4-dac37bf92894@protonmail.com>
References: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
In-Reply-To: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780218643; l=1904;
 i=y.oudjana@protonmail.com; s=20260531; h=from:subject:message-id;
 bh=CI2JtjrfQGfceMW9Mo7uuZDEncWSbsLSjy6NPimDCZ8=;
 b=YumAYlYpzOnp4NdRv+QSZzgC27vFRedblud7yqmZoD1WccQnx+bmUwOBZrHH5iqjvuYbuKUR/
 4msldZHl4rBCGFN1KEIleh8cgcC0AuzhnP4TgGssjazW09rDi/Yage7
X-Developer-Key: i=y.oudjana@protonmail.com; a=ed25519;
 pk=sr7uwnyVqGKAIhvwnIwormkDM3d2VNc3VOTEU1GmsEM=
X-Endpoint-Received: by B4 Relay for y.oudjana@protonmail.com/20260531 with
 auth_id=802
X-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_021046_514813_C5B5587A 
X-CRM114-Status: GOOD (  11.37  )
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
Reply-To: y.oudjana@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a compatible string and related data for the PMIC keys on the
MT6328 PMIC.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..6aaca67e7703 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6328/registers.h>
 #include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
@@ -80,6 +81,17 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6328_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6328_TOPSTATUS,
+		0x2, MT6328_INT_MISC_CON, 0x4, MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6328_TOPSTATUS,
+		0x4, MT6328_INT_MISC_CON, 0x2, MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6328_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6331_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
@@ -304,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6328-keys",
+		.data = &mt6328_regs,
 	}, {
 		.compatible = "mediatek,mt6331-keys",
 		.data = &mt6331_regs,

-- 
2.54.0



