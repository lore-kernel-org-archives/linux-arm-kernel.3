Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FD9C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo0Yx8Ikhbay4ONTglJpP40j7u1kHmhdBZMp3AoNslE=; b=M9RRsbSoLrO9kC2sDWoIyhjB+W
	TDF7c94udQcbj4oh74k3UQ/jrYH9LDjtz0hOKpkz0qIEBmD+gpW4hHUX/kt3YpM0EdSDBVv+uFjl3
	gwHxOfHwn2Z2vHKc2duDo3j7onqS0/DroCakKGGBulsJT7iJAeUVgkGEzNX+9arQpcoOBG4RSKJ5J
	a3pB9fVx5fU8kt2gOsV59HdFIfCbaFSi1oGJPHTzF5mjS8FRqkwgPNwrlGcbJQEIkYLDS0jBX20wR
	8YUTUPhyBB0+vurmEXTVbKbWMlQdII8mmd82haKZX8ckLs4HBdC/GMVHN3dFSAMJILHEuAetVrArm
	+0RD6Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dO-0000000F9R1-2rnh;
	Wed, 15 Jul 2026 14:30:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dL-0000000F9Mg-2Fq2;
	Wed, 15 Jul 2026 14:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3EF742B94;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7B50C2BCF5;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784125846;
	bh=bxddUKlpQ/zaqaV7lCBZr3OZ5pRRSWUAginc50C9BCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dzri78mgMSZBmHzQ+S7tmPsBIUdYNCz8FgeGhmJ/4BSxxnqZ9UhouMpYb4pGsrCUH
	 65Geo5DYXPL9TA/pUDsvslbDK8/GoIcCFP+cN0LDnhDIUbHpafmCgwgygWE5oz89P7
	 0SG8j4jDbog1szeSXPNTSkqtUms7FI4CrpPHIviKujSHfBXdRymSUEJxL8F16bD1VU
	 b2VEVkn1J530ytmU6LJ11UlOeGZZ3ztwQ6UQMrVgs4ROecC4xfHOCFsyKladKGxVve
	 LVauxnMabUllfewYuum3eyo0hR/vGh/H0yMB8Wzd9/QwHXksTiW75eb6rSFPW3FOie
	 nAMXhDFURrs1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95187C4450F;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 17:27:47 +0300
Subject: [PATCH 2/3] nvmem: mtk-efuse: add support for 32-bit aligned reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-nvmem-v1-2-9c13be99d077@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
In-Reply-To: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125843; l=3135;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=gOEk3xV/ih0Hcv+/D9l/u/kTXVslxW9X99D1kWTUUDw=;
 b=q7erFPeQUkoybLyUukh26Ulgz+g/gbaNCEYnLZ0l2O9BHFQ2r6pMpOfwAeh02qLqtGkF7s0QU
 V4bXXhD1MkXAi4268YXyYMS/PwzfqYCaVW+w+m+jt4am6mOtThmMMc0
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

Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
to zeroes or garbage data. 32-bit aligned reads must be used instead.

Introduce an 'needs_aligned_read' field to the platform data to enforce
32-bit aligned register access. All reads will be performed by reading
4-byte words and masking them.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..1462f2760818 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -14,10 +15,12 @@
 
 struct mtk_efuse_pdata {
 	bool uses_post_processing;
+	bool needs_aligned_read;
 };
 
 struct mtk_efuse_priv {
 	void __iomem *base;
+	const struct mtk_efuse_pdata *data;
 };
 
 static int mtk_reg_read(void *context,
@@ -28,6 +31,26 @@ static int mtk_reg_read(void *context,
 	u8 *val = _val;
 	int i;
 
+	if (priv->data->needs_aligned_read) {
+		u32 pos, shift, val32;
+
+		for (i = 0; i < bytes; i++, val++) {
+			pos = reg + i;
+
+			/*
+			 * Read on 32-bit word boundary or if it's the first
+			 * iteration
+			 */
+			if (i == 0 || IS_ALIGNED(pos, 4))
+				val32 = readl(priv->base + (pos & ~3));
+
+			shift = (pos & 3) * 8;
+			*val = (val32 >> shift) & 0xff;
+		}
+
+		return 0;
+	}
+
 	for (i = 0; i < bytes; i++, val++)
 		*val = readb(addr + i);
 
@@ -67,7 +90,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct nvmem_device *nvmem;
 	struct nvmem_config econfig = {};
 	struct mtk_efuse_priv *priv;
-	const struct mtk_efuse_pdata *pdata;
 	struct platform_device *socinfo;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -78,7 +100,8 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	pdata = device_get_match_data(dev);
+	priv->data = device_get_match_data(dev);
+
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.stride = 1;
 	econfig.word_size = 1;
@@ -86,7 +109,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
-	if (pdata->uses_post_processing)
+	if (priv->data->uses_post_processing)
 		econfig.fixup_dt_cell_info = &mtk_efuse_fixup_dt_cell_info;
 	nvmem = devm_nvmem_register(dev, &econfig);
 	if (IS_ERR(nvmem))
@@ -103,10 +126,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
+	.needs_aligned_read = false,
 };
 
 static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 	.uses_post_processing = false,
+	.needs_aligned_read = false,
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {

-- 
2.54.0



