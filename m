Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B27CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmYXu56vMWJ0t4XjeXrR/MLjd+mCYzt4yrK15GJeEYE=; b=tCkoH0y6B/sdtdqZG53tbAuza2
	WcLswWAhzNqDIZtK5Jzv4ftkacCfT1faEpttNrGG3mVLLuKWh7B9/O7gl7uFIRlG+YGDrtcDNLXAR
	FT5iOCzdRWKASe9l0TN2L1TalFZC7NsGqsM7zT3Pg5vc/qbAf2mTLQd1UlQOgMU/wQI+4oWV6MQs5
	lEeIzRiM3GoHysqmlrj+XA6kxjlMe3waFoYcUQ//kN90mDqO8K7OhMKaPH5ZXO51LjGfneh3AoAxW
	fWgiJsM4KtYJdMTyXg246GQyEFq0f/pBDgigbkrbh+TjvpN9lpEO89xDCrD+tCaAz3RkFzRi6ffkr
	sAn2qHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquiS-0000000CH1A-36cY;
	Tue, 26 Aug 2025 14:32:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquFI-0000000CBaR-3mH8;
	Tue, 26 Aug 2025 14:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216915;
	bh=DX2D+C5ydoecfNdBzKvrOSzseuCckWs8nJpneMFTTpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R01YK0RSpGAPcIuC2HvOq2f4j2Cu3hirMFqwM3aC9SIV8O1iRhrDLpQYPjY0JBmgh
	 yd96hRZOmaLiwLYp7NDsnsgv+j8zg4NYjKMZYFEJ5mWwzAJ+vGW5ABG3KzfL6RJWCD
	 72ik8u9xPaXhADwuWZH7Ig7nMRCsEBVIJhxNKUXIU1kav+b2jus3asS6bPEX8Fxcg7
	 qN4uFGVa2fWJ/Q6vzVscwZ9Qox5BEQhpwXij/hf/c4YPWjAZkgXvn6OsQJ4vl+Mskt
	 q0hdU+n0HBWNd1blvg14wfQ4eFyUfZhNpt+GLy0c8ogXPHICGlTIVk87LVjGeQIvlV
	 Yq1QSEDWT0F+A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B88217E07FB;
	Tue, 26 Aug 2025 16:01:54 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 16:01:52 +0200
Subject: [PATCH v2 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-1-7f18fa3fbfc8@collabora.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_070157_117077_4B26A508 
X-CRM114-Status: GOOD (  16.87  )
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

A recent commit in linux-next added support for key events.
However, the key release event is not properly handled:
only key press events are generated, leaving key states
stuck in "pressed".

This patch ensures that both key press and key release events
are properly emitted by handling the release logic correctly.

Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
to identify the devices that have a separate irq for the
release event.

Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 50e2e792c91d2626d3f282d04a1db60845827ef2..c78d9f6d97c4f7a77b4c44cee3b93e4712a19aec 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -55,6 +55,7 @@ struct mtk_pmic_regs {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
 	u32 rst_lprst_mask; /* Long-press reset timeout bitmask */
+	bool key_release_irq;
 };
 
 static const struct mtk_pmic_regs mt6397_regs = {
@@ -116,6 +117,7 @@ static const struct mtk_pmic_regs mt6358_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 static const struct mtk_pmic_regs mt6359_regs = {
@@ -129,6 +131,7 @@ static const struct mtk_pmic_regs mt6359_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6359_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 struct mtk_pmic_keys_info {
@@ -368,7 +371,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		if (keys->keys[index].irq < 0)
 			return keys->keys[index].irq;
 
-		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+		if (mtk_pmic_regs->key_release_irq) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 

-- 
2.50.1


