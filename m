Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A34EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVl1u5VMeukaNo7ReKCJKjTxBD71PyIp2d69l1+LKGs=; b=ZYyi6GZoeUqixk0Ohsj75DXv7M
	ayjFa3s/AhQkZo8PbzBc53zn1vZ5jV//K4Om2wyxk4c3slwbng1tQT0CywzK2mdioLHpTrfBm8RVd
	BVP7AHiI13BLYa3IKhfcBh3S1Vrp7L00rJb/eY97nSQrzCgGPt+EZqZRClsKg39vMZpGtVtS3j40L
	hJDCWz+7WxVql0bxCuvMu9m0I1JhHJILQNPj06c+OOGms0uOcHQn4pLqcFPsh/Ycnsg0Lo2niw15r
	WcPmE0Oa6eA57j2MZk4hVw0o5w10Lam0dG9SLX3eQyzNJEAPI9MtlEoTZYKdvbuLpMhiypnaBLc0i
	3e8pzYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7y-00000002PoS-01eY;
	Mon, 21 Sep 2026 14:36:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7r-00000002Pkh-3cKz;
	Mon, 21 Sep 2026 14:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DFCC43D72;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00DC3C2BCFC;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001371;
	bh=/RydMHtFmmBYus0MrR48LToVwrPUhgabAvoP9PIGA6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsp5+wxTyNHclGpTFt0NGQXMf0ahNzrz9KJlhtygJ+zTAl6OrHNmFUungT8q1DS09
	 FjMlpqvKtvIH2n8r8+EMrjeWON2kxSAycKXgvPpTdNNVzu/sPbWnyS6xfqmLobx6NP
	 G5RY6y8GKtgDrPUMFaOCQEatl1bIorYnpnQi3lulFEIJK3cADZQFug0wAp52kth/qb
	 PVxLu89bbHA/TwmTaguSIGS2nitfh+W+GLInbOCBvBRmpq27PdyERX7hR4RKfWCXd0
	 OiRfY6I2Db8+jIQyLQzNrTKwv27jW6WbJe92rtN62ZG8Kn56SnZD8WzU6PDRVYAnDV
	 tjSdyw13MQWiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E2EC982F8;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 21 Sep 2026 17:35:49 +0300
Subject: [PATCH v4 3/3] nvmem: mtk-efuse: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-6572-nvmem-v4-3-e9c14156559a@protonmail.com>
References: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
In-Reply-To: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=1270;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=xNpih/0wX5BB+DZCyvEE4EZcS9hf5v5IbyspXQH1sz4=;
 b=lQfi3rcoqxM26rYqiq3bdUfpJqvAXdKZsW6kWv2PX/ps2k/moNydRJooy2jRo67aZWa92Xxwz
 dgNzuOabuoEA0ujfG0LmGrMa2s8dybc+OU7Pzaky9T4g1uYPRgBsOAU
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data struct for the efuse controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..43cc2da2cc1d 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -131,6 +131,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
+	.uses_post_processing = false,
+	.needs_aligned_read = true,
+};
+
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
 	.needs_aligned_read = false,
@@ -142,6 +147,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.55.0



