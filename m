Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00168CD6E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc4sJfcwE234sCoLeSfNws+4rHy29ABTjnHCIwUL8OY=; b=ZmkCso4Pp6ieAo6Oowal4cSxlp
	uFKytERer75EHnhjGapFd00tRApczfUY8XSTNaQM0WR3ZG1supiNkkp3twF7J3xHu2xvv1x2UR3Lc
	AqlSkexwQYdeIvCOLtGLU84EEJ5WTymIIIExTBmoQa2/ZjdI0Ln6aEv4s+wqJUJBoYlBVBAN0soc1
	fJeFaOc7nmw6Wi2ZWIPdV3hMUKwpsfFhhJ4ztTa74bb1ymj2ZyKtgjGPWbn9+MvcAmrjy2036hz6R
	8ppgIn4fIPO4azqhZPuLiGLp7UUr19JsvfdugYZFQC4N15RFXbq7RLT0fWEg3Vr0Uegq5ooAgn8DE
	1bSbirqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLo-0000000ARlK-3LQA;
	Thu, 13 Nov 2025 12:22:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLf-0000000ARbo-2mbb;
	Thu, 13 Nov 2025 12:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036563;
	bh=Q2b+AjuDHevZT4A1PbKOjLTq44s3ZXzwctElSef5DkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AqzCZw7CIvF8nNsn4zNOR9TlsnXWZ5jX3pRJd70nu119E0AdTHT2xQW8OOkl6wqIR
	 t+YZK1XXycaY0f4eCQo0B/LMbK0HjZlLfBAGmIjUnjBHyV46pfmVeDvhNYY4M8ZBOr
	 fK8hckHYvYh1a2NLlLz3fHymL6qBjAtKaH23XJ2jl+CIo3oxnrqntl7bidTNvIb1ZL
	 OHbUgrSER0cP87qIzweuaUBAhxeqA1M7Sr3IdTnc2xTRPE3n2F1bUY8KNYiSnPVAMc
	 PgPtaBMlUQ839RGdlM2p0e/AQ7Vj3XT1cS8h6FNV99WrNW3aaKpokBOT44uPWMHyhY
	 vrDihRTf5iZPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E41817E1416;
	Thu, 13 Nov 2025 13:22:42 +0100 (CET)
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
Subject: [PATCH 7/8] dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 6300
Date: Thu, 13 Nov 2025 13:22:28 +0100
Message-ID: <20251113122229.23998-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042248_015219_4325CC76 
X-CRM114-Status: UNSURE (   9.52  )
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
found in the MediaTek Dimensity 6300 MT6835 SoC; this supports
extended addressing with up to 34 bits.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 802a4d6c11fa..dfcfc618bb8c 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -470,6 +470,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 static const struct of_device_id mtk_uart_apdma_match[] = {
 	{ .compatible = "mediatek,mt6577-uart-dma", .data = (void *)32 },
 	{ .compatible = "mediatek,mt6795-uart-dma", .data = (void *)33 },
+	{ .compatible = "mediatek,mt6835-uart-dma", .data = (void *)34 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_uart_apdma_match);
-- 
2.51.1


