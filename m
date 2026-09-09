Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A2C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDfo5hhrnudGHNXZvlvxctBv/iDSQARsu1jc+aa/YKc=; b=RxgiXs/kT9L0mP7PJrpW+2CaIv
	j77Ycj7KvgSbOJ0vQMJBqvLJg+dFzBixNRXEv6HRq30b5+/HPr56JmoY8u1hKK1PVuBdftNeUgkAk
	5PiKtrJQvxKJhc3Golp1IrnsiiIs4L/aEmb9sPJvwcl4anAuWz2j9xjbWIHwsGXEIGKj4AycksfxW
	OvWaUTMIdisKEEM6j3Kzo2Z6s0rlGT3DlakQs9GUfL4G9Ju5zgkCdbKcwykvFE3yAjZ8fk8xiZTjw
	3k7bTij23C8dugfcPiJ4VXhu1qnOAVt8uBUOpM/tSf7xlUMCOXcNpLTxrKw7ocvxun/JCvlgqk3N0
	O5Cubh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FsB-0000000BTgt-3OV2;
	Wed, 09 Sep 2026 10:49:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fs7-0000000BTeG-3EGF;
	Wed, 09 Sep 2026 10:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56BA643B66;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30685C2BD00;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=z/IHrbK6Kmc41Oj/Z168GnVdZNmfWEF1Ga3MCPTNHZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ta+yhd+Fzo3eja/mzuoxXhx5v8ITsZQMzMcXjgFK6tOpH7M/HM72DAFPCu/URs1KS
	 avcVL/dzSr782ZG+WrUaanqv9uXgkccm7wtbpuy4nWJaAdvb2kZ/RpU0E8CFebSYBX
	 c8xr/usgF5/xzJ0E55mQOIZMD4v28+CQ7MFW52ZCGKqA6BxCYr7DLyJnF+TwIbKNtb
	 a7vwupFqldQmzfYTxwZYL5RKmJ++ZgIo/BR88InR2kq6rlUaOMwBDW8l4h2dCMeBpP
	 QJ2f8lQTb47hF1N1jWgaErJZ9UMnduxTAaT0tgMhJuuQTtjV1mqfsfqeVkhCEZoMI+
	 KtS9uZBgyq5tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E34C79FBE;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 09 Sep 2026 13:48:52 +0300
Subject: [PATCH v3 3/3] nvmem: mtk-efuse: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-6572-nvmem-v3-3-c0c441656431@protonmail.com>
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=1270;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=j/0pkhNqmD2kWRqTyBoB6Qy34fCNHrTMKNnHg2hhmLk=;
 b=5t1b0Kn5gUv3X47QncGs0iNVDDFmY67ZSD/Uqr1Nmr+N+pCIziA96GyYNqqRczjvwl7pVCkpG
 EzAZSKelSYdD46PQ0cDr5qFZcaB4HxSJHyx6WkGe/TSY/vZ9rzeu1g4
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
index 178b9d85f813..99d061eef6e3 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -132,6 +132,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
@@ -143,6 +148,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.55.0



