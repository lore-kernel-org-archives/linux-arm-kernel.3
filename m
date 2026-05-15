Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0108FCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FL2Ht1pJWO26wflxEZyGX/gD0cNb1r33NP2jdahxIPE=; b=jVJWLCejfH0lAStlsza3BK0Wbd
	z0O0LEobwn5uhCeKKZzUsFkGZrlXs3nVaaF8XHOMI1/tkP8O20FRd5zJk4c6T5N5PereXtP97oO7x
	WsLYSiPKtIyST5FRsZeKqilU2uOhf9Cfn44I1bFnqSgGMKTDCIMllkQ1y+j4Rjq37FLZuVhakGv4g
	PrOQAzg2pG3tDHg8S6uZ0ekDu0ekaFIgCXblHEpZzjDcJBzU41SwCxRLeIPUsfioSzZdcWVm8pgfU
	IYqfmlI03W5ldRegBC2a9hQ/KH0SzI3UVINXg0cdnNLpNH7hD2N3PF6mZdSkW72jOnYLgjBC8Zbn+
	rQfJ4sVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuRN-00000008hCW-2TDk;
	Fri, 15 May 2026 15:27:05 +0000
Received: from mail-m83204.xmail.ntesmail.com ([156.224.83.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuRJ-00000008hAu-2Pm1;
	Fri, 15 May 2026 15:27:03 +0000
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e998b3a5;
	Fri, 15 May 2026 23:26:45 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: kernel-list@raspberrypi.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: bcm2835-unicam: fix dummy buffer double free when register fails
Date: Fri, 15 May 2026 23:25:29 +0800
Message-Id: <20260515152529.1007540-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e2c3f470303a2kunm2a038511b5e75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkwdVhkYSkIdGBhNQ0JPH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=SdU+snalX6XbTgzVHEGABfiY0lcMHjp4/bBOPoOgQd6bkyf96v58DGrzuruV5vUDAEOeOOz1D+5NBOIEcbF2iKpX0+W5ijw4T4v1mxRsse9ULURc2xPkjKAmPxWCotldo1ThZGNEGl4YVk+kwUo2EvwtOPGLzfnKoJYF0tWSArM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=FL2Ht1pJWO26wflxEZyGX/gD0cNb1r33NP2jdahxIPE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_082701_882926_BFB102E4 
X-CRM114-Status: GOOD (  10.99  )
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

unicam_register_node() allocates node->dummy_buf_cpu_addr before
registering the video device. If video_register_device() fails, the
error path frees the dummy buffer but leaves the pointer unchanged.
unicam_async_complete() then unwinds the partial setup through
unicam_unregister_nodes(), which sees the stale non-NULL pointer and
frees the same buffer again.

Set dummy_buf_cpu_addr to NULL after dma_free_coherent() in both the
local error path and unicam_unregister_nodes() so later cleanup skips
already released buffers.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc3.

Runtime validation was not attempted because reproducing this failure
path requires fault injection in a hardware-specific driver.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..94c80601c50d 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2360,6 +2360,7 @@ static int unicam_register_node(struct unicam_device *unicam,
 	dma_free_coherent(unicam->dev, node->dummy_buf.size,
 			  node->dummy_buf_cpu_addr,
 			  node->dummy_buf.dma_addr);
+	node->dummy_buf_cpu_addr = NULL;
 err_entity_cleanup:
 	media_entity_cleanup(&vdev->entity);
 err_unicam_put:
@@ -2379,10 +2380,12 @@ static void unicam_unregister_nodes(struct unicam_device *unicam)
 			node->registered = false;
 		}
 
-		if (node->dummy_buf_cpu_addr)
+		if (node->dummy_buf_cpu_addr) {
 			dma_free_coherent(unicam->dev, node->dummy_buf.size,
 					  node->dummy_buf_cpu_addr,
 					  node->dummy_buf.dma_addr);
+			node->dummy_buf_cpu_addr = NULL;
+		}
 	}
 }
 
-- 
2.34.1


