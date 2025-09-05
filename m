Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E968DCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSgyI2tX0K3gVRFEFD1Oi9MHV/XOMckXu67I5YrANPU=; b=IrzRPUt8EzhrjJhRgBaTorZTSm
	BXlt+/NdXc+fSfCVpnl5cniHRyS6cfQ0YTFab7dWw/ZQUq1FCucxaWNZtrSg6PHka6AMv6DTiRluK
	f3j7i4pLeZoZgsc713aiErtdaatea+YJJNPk8yYripCCSy2cRl7N7NCjy0ZgGhHVyA/6YNwCBwo8q
	M42GwKke4ilI65XwkOur9eUdZSyxFhpjiqwj1kQEC7yaiUDZatRjDEuzOPMS7uq0IC9K9FqgX2+S8
	hCCjMZJUnpWT/m3HqZySmBXGssqs8Zk57ITzU15HtSeHJuha6gmbfxRyl6f9oDlIGx38EXYlaCBGx
	vI8Vktlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXaR-00000002RG4-2cq0;
	Fri, 05 Sep 2025 14:38:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUzA-00000001UiP-1FRO;
	Fri, 05 Sep 2025 11:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757073125;
	bh=nGCQcq61aKBRf0b7FK8UVUHa2H+P8YyeOd1I16hGvAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ka30bxE/Hc2F9cak9VvSldw3iz5FIERcNisml9glefat2t87MRZXYic3aowp3CZZX
	 Y27XoFU1d0MpumDaskc4UX8Iyv5kCKq+bDwtlNwZDPsab7EmrRg+QBw1qYbE9XNCm8
	 4p7au7KfEpSnTjKXOsNAPoCLVURld3vDndgRNBLsf2Da09gkLHKNUt/iLMazMb6xqb
	 s7NC/iJap3WDwUevCweXxsyezYv/7GkFrsj9eUsVfhG3rI+hYsmMczkMz8N2930ZSB
	 PPjvwry9XqXqHWdE0bG8Zcq6IZ6lHwFWOFQJUSjAFRn4RYDA3YiAKeUycujuYB4zEk
	 l5vsQJ3Q9gH5A==
Received: from localhost-live.home (2a01cb0892F2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEDC817E0237;
	Fri,  5 Sep 2025 13:52:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 05 Sep 2025 13:51:58 +0200
Subject: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
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
X-CRM114-CacheID: sfid-20250905_045208_499945_FD338C23 
X-CRM114-Status: GOOD (  17.75  )
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

Support for MT6359 PMIC keys has been added recently.
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
2.51.0


