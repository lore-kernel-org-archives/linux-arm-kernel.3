Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18621C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/9eQRnbZWy3fenqliLBIYK3Dg5OWOdkIFhRklKvBNI=; b=kt5oqpHhvhkIkqKQhrLWzLmpvd
	ETXSLTeuzA2SYazRCCwQTAySlOFvqlZx2tVwXe+HioCzRHQVBSYI9aTztHtSlBBZzlJPb0Grs1Q0g
	ZF7Kj20mwLzVdAUyRCMTAX6A2xfFDEp0FOzPNQO/wIOcPL+BxuKptrCl68hoBCE4JSZNIq0cgfQav
	bQs+SJjLSIgV28e8XugBp6AYlmrCrzZYCQ+hoEgvCO++xoXjpzhnTVWLAPHWeTJwEVDXUNYoYxe5B
	FaDZSeqyrHlcGRsNr7uk/Vm46K8HY7fX7meiKG6g3S5STey89wfDSVMHWXH32cvEuMW0pm4m95cQd
	FUqSFbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6J-0000000GILz-3H83;
	Fri, 24 Jul 2026 11:29:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6D-0000000GIIZ-0VwE;
	Fri, 24 Jul 2026 11:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B1B745098;
	Fri, 24 Jul 2026 11:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CCA9C2BCFC;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=sLUm6phXL6/UN6hHVSZAI3vFakeEUucBJVxBRFM0FRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kq6cNYrZXLDdgj4cQVUVVXvSGvKz6s0oupShUkrT+n20G1MWau2aKGgoF08H+VUg6
	 8wESZ8bKhIfTT7OWxB6WDwg2Jf76vPQPeNupd2NNnnbdvDDlnEAmXdnJ/mqzUH+wn6
	 hStZkl9Gg8jgcmjXIZ2IpTBBbi6LSnIDSu5XkEZddXwDnrrkCh1cgpbwC4ZUoztIV3
	 aEj0zxySeSStf7fm1FHWIc4sd0jk9u0e3lc+yeYK2z+DD8hr0/mvJ95ZRSwfGol5It
	 o6STaWaciVB7i0ZgQXDJ7s7tpmFlHANB1snDZ6NViSUM/84eWRNto9bxxKRxv7WIJh
	 zx4uEeYMMtVnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B9C53209;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:08 +0300
Subject: [PATCH v2 3/3] nvmem: mtk-efuse: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-3-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
In-Reply-To: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=1270;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=RglpQMmDi1q9EkMmicGwenzoewTZeLQT6m7DchqK7Ko=;
 b=OG+XBny8CdCiVuq4629ceAWRfePgmdbdoWS9+9n5klQ1t9JF/yCDZvd60HdotyH/DS5WUwYPO
 wqPLyIAERdUCjZby1u73qvyf+KlLlX03yWanQDmO2yvcQxLMvbJZZRE
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
2.54.0



