Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6341BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=; b=G2aOP28jYrK76syDBTOd1GyLEe
	VCG3pbSqBYXv+nzJqHMDkwxQEFWfCz2dG+aWYqQ9RiWYiIWMUVL0J+dHMasL9m00RgMGCqF5m7u9d
	yuRbgO9YW0BX0728WVK1Dh1bpDXdx9CZfROC+Y33w9WzmNEe3i1Eg3P5dDZ5A1klDxC+i0nAMuW/Z
	zj2KOjmwYG3vRk9v51gTedLMdvlWxNDh68JJbp3ZfSkjLsmLeVJT5/k6A3F1YK8I8BWNmvMzCM9Y8
	kHq9kxzUwnKyThYQL5oSKoL2Kcs7Z5PPNbrKOhu5Z7evPXwCkcDrzTP4bmtMlJQxu7abWo97pPOQX
	XSftjn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7k-00000003rgl-0JDm;
	Mon, 27 Jul 2026 20:40:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7d-00000003rdn-0nq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso267694b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184824; x=1785789624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=c3efDIrJso6nabF6wO4gcPyKSFEjB6gsBTKD9dM/Go4H+0K2srWh7csp8gdC4prFEJ
         S7nlJ8V2msPm2gbkD/b6DOq0IRxs4ksZBIDGF5YpRyR/bEx30SicdG+oydxcvSitHjBr
         fw/EKtuiKGD/U3tYRsGNRIHTDYd5T7S4Ws4BUvaLAzqDXNvElCSpvx541W9dUupFVpTh
         5muxQS1aaCld1stfaoRZfldc8qqMlC2c1jzxMWp5bESx+PF0mgl/wfcQG5h/pS7niiME
         TigKtHxsVU4O/qDf+4YPBVtFfofTEhJLx7u1UuPM+XlrV4xD+uYTUZGLgNhk9FvsL4eB
         lmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184824; x=1785789624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=jaxoN1PQgpgdvVVBrhcK1j6vb7Dyuj3OKZm60L1r5l/4nmQBWRXgKiu4Vuu4MptvOr
         itaW4vJFQx/D3m82SmsoT1IhNRhtSWnJ3XZEZ8QxdzIVTqWkH6bU47Rw4aoLE0wzTqT0
         OMjMk4ZxBoHRz0Hskz6GzTL3bmIFjdv7vulM6VIxajQKTIkO7J+NAdoMQjbskcXAZM2e
         eCiZwP+UbSO935lvazyCYLtG9g4poH8ac6b5vPRdvZUlsHGftk0AOb/hGcUoM/0rdHXs
         R5ttyoRcGkaytHho2Kt7BXAO+4EYw9o6B68jczZ9mTFsxSWneztSmyQ7i9Kj98xDTvuF
         yQaA==
X-Forwarded-Encrypted: i=1; AHgh+RpLULJyEMpO1x9JGUb7e6R94SHcoRH+bkDipfnQdZmFMtplcVPpKgg4dyeuE+p7J2cpoyk3RF15wb6D3MaqsS0z@lists.infradead.org
X-Gm-Message-State: AOJu0Yyty+c4xVROhn7ezAs7ppQEb1vkhIX3iu9rPodJa1QKZkhTXrrE
	FgroWE+st8Grxx7remMcVgO1oqlrbPnzMvIOPhXRE49+ktsmlWSpcE9O
X-Gm-Gg: AR+sD11vbCr47aanP+ZPOL53/2xtOnljlRS9gfNFrCa0jqsBCi0G1YMr1lqwtGQolgI
	fbTUK3RAH2cVp7o0IkoMraDGFH384v1+zUvUTw0jZQLdC2mAVy0kqSUDjZm9DVTkJsMLsKFNcnD
	OijsN9bAu5jWMSVkvwgNh/sFAScI3gTlW8vtAwNF47BF1Y44Bj8fCEadxkAqidfgx29g2gMA9j4
	oACMgWGA6Yo2zL/d0gcmXd3J0SLq7mUaDqKc6Y7YpCiGzgszX1fj7Sy9QgVQjon0nar8HcrYivV
	Q3sNCvgB/XOvyhga8/UEMuX1Mqrls6jtLqW+DQdQnnKEZ18FSuZhdsepo2x0BgfvM/wFkRGbBap
	G3BI68/7zmmkuVQkWi3PjsSAyFTn5oH7JZigPHEfFe6o1KELFjjlEpOTKwc4l/r8189lavO5YQB
	VYfYcI
X-Received: by 2002:a05:6a00:440e:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84e8fcc10c5mr202785b3a.32.1785184824280;
        Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 44/64] dmaengine: mtk-hsdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:06 -0700
Message-ID: <0bfe8c4b14ebc7446d0424bbe811c310e86bef51.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134025_234169_2F3A2924 
X-CRM114-Status: GOOD (  12.69  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5edd..1c98fcedf3ac 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device *pdev)
 		vc = &hsdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* Disable DMA interrupt */
-- 
2.43.0


