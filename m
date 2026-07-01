Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB801C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PmqtZ9UynrtR3FXqygucaN5FcrVeXQgED/Jne2Xy9pA=; b=EroxQ97mGyrfn7Zzw88cWUQyyl
	tZBId2UTv2mrNxcjYSq0AVqKMAlbxLKSeiM0uhGSCiH5T+JKDCU+H+gEnCwYzf92vKdhszI9t0aPQ
	N33/MNzR3rVolhnxk1DkOFNY1jUp0bfQuePprapDoT79H0IUhHBo2mMNKtbWTXSTNzUVZtMUcnZe2
	X4WYWIHnOkDzDDUeK4B+Qc0hvUqDhft/1J3nWCfGXf7rPezdL2Mb9ku1h5kyM25uQd3O6jg6L0Yg5
	vSJu0FjqnLT03tLsYPPRtpTSQLMhsMtOds7UOKBE0CVSnISO/QDIxvEmpELnl5zXm5UCLe3Upw8Rf
	HVY28V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1DD-00000002wg3-1Vrc;
	Wed, 01 Jul 2026 20:07:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1DB-00000002wfu-21be;
	Wed, 01 Jul 2026 20:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD73D6001D;
	Wed,  1 Jul 2026 20:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6D41F000E9;
	Wed,  1 Jul 2026 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936428;
	bh=PmqtZ9UynrtR3FXqygucaN5FcrVeXQgED/Jne2Xy9pA=;
	h=From:To:Cc:Subject:Date;
	b=LdmtY/jv28LGUzbuMjalCIUQ4PD/AlaW3wUQLb4XEM13SYZxh/h6ReC3bry7jri/D
	 8pDQkW3eo+CkS/UMSg2+tw0tYzVC0IPvorWqr4pObAn/4rryizJCg+8QR9rZVfo9Tx
	 fW1A4biWSxn4vjHron24xbvORJ9TKpjqg55tKQA0KIJHDX9Yv3x03md5mj7E1viDBU
	 os3h6erWjpCrB4r19hFCoUWn0FVDp8pOuyOIPv/8Gk+QqAR14ncd5SK4IKITxIfO91
	 MHLY8n9VsOulwCUNq017PicsxlBtWkN/8kNBfI3Du3CRvnxQ2C+WLsgLYK1DepXaIK
	 59XxFzIHR8lgA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
Date: Wed,  1 Jul 2026 23:07:03 +0300
Message-ID: <20260701200703.117929-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If dynamic memory allocation in driver's probe function execution fails, it
should be reported to the driver's framework with -ENOMEM error code.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..f74e9a328588 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -531,7 +531,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	for (i = 0; i < mtkd->dma_requests; i++) {
 		c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
 		if (!c) {
-			rc = -ENODEV;
+			rc = -ENOMEM;
 			goto err_no_dma;
 		}
 
-- 
2.51.0


