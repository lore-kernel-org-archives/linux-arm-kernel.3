Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD9ECD6E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfoYzyAiHqlT95hK6Ci4cSsppvY2FcvmiRjaWC8MTUo=; b=EWoedeWQcuWjfl0ppvbxMBpQjd
	Zw4VotMtrHETmc65pwQjc5if+Vr7t+xuteHmM149LVwh2g2wFqPfsrEg+cZErIsMb6fLODpWHCQ2E
	1MidhjsuFR0+n+CcdB/yknQAEh4tV5flyjjBKEi77y5z9uCmaSyrhUyjx/+pykF/eVYGvoE8dhFUq
	GBrH71wtlSo11QHLfU5l0lOqVyvpwI9eEpbIUAxVSW0xePyrwG3t9LKqbIi2lFDWutjDf4gxrxKYS
	KMJTVnEWZOrb0eSxdigezTORLZYgKlHct/koqtCqfUAXbla/48x/Nf6BpnwqMiIxD6YjZS3RFC8LG
	eEh8C3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLr-0000000ARpU-3V6S;
	Thu, 13 Nov 2025 12:22:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLf-0000000ARbS-0uZF;
	Thu, 13 Nov 2025 12:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036563;
	bh=JFgZElGuW7huMLg5IeTiiaMe7V7hDDxmcenUv8VvhSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdaT2YM10QNyrQb4uPfRepfG9a90LnHiYl+WClEpOpiN6E9jWAfbDQDLzds2Zi17p
	 yGHOxASDgHDbrC3kxt/4vD9Y64iTUUQIeQaWg19rUwUSob9YPgrzc+I3xYEf56lb8F
	 FpDFx1y6A7scsOWlNlSmePFPtFPj2iWln7E/BnHX3gZZZO5pydt4zPRviDs2BzmSGa
	 soHqTzBQ6388YsykB6RBOJND7kejaY2MLrxwoKiATdqb4bDgFNLDtc3WoCUX+K74GP
	 XZUNnfEiIW0K2fc512pBlEFtRfnAVBa0NAdFfRNR5zgCb6hkOhDKOCkqQEihBiAqpt
	 rqfylKbOkCWmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E40017E151F;
	Thu, 13 Nov 2025 13:22:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 8/8] dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 9200
Date: Thu, 13 Nov 2025 13:22:29 +0100
Message-ID: <20251113122229.23998-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042248_021265_586957BF 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string and match data for the APDMA IP version
found in the MediaTek Dimensity 9200 MT6985 SoC; this supports
extended addressing with up to 35 bits.

Other SoCs with this IP version also include the Dimensity 9400
MT6991 and Kompanio Ultra MT8196 (which don't need a specific
compatible in this driver and can reuse the mt6985 one).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index dfcfc618bb8c..ead00636b048 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -471,6 +471,7 @@ static const struct of_device_id mtk_uart_apdma_match[] = {
 	{ .compatible = "mediatek,mt6577-uart-dma", .data = (void *)32 },
 	{ .compatible = "mediatek,mt6795-uart-dma", .data = (void *)33 },
 	{ .compatible = "mediatek,mt6835-uart-dma", .data = (void *)34 },
+	{ .compatible = "mediatek,mt6985-uart-dma", .data = (void *)35 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_uart_apdma_match);
-- 
2.51.1


