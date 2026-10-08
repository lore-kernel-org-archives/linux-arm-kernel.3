Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FEBCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZAo94LpO2B0yElRNSLGBz0NRZ8kLHR1Iz17jxI1zUg=; b=s+3d1A3ICs/+4tWwZXWWblxd2T
	eadJjrskOFiEa6siq6fUa1K1BbFD5v9gg6J7mvrGwbzyEfSDA8OcUlH/+En+TVGIdXHgXEQgHNHZE
	Uda6Pm+QRxm3tRDyou5cfKCWYxYef8FyP9k/RnO2vxLHC2XF6PHGaaIAUoj2EKvmMBku2c6wHgTGx
	WnlCxFzemmEC13ZK611RTHhmBpD21VrW13VTEnQVi+YpGbgngyJgNKiBdR5rFKqkq44cR9nUjjj6w
	+vk8cXegMGjVU1F6HCISPrkw63IqT6+x/i+UMwo3IX1mVpAfy/+86Vc1obFjkXb/P05zqw0BwPKkF
	MZnFy/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn1Z-00000004KVy-1CHz;
	Thu, 08 Oct 2026 12:15:01 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn1V-00000004KUY-2i2o;
	Thu, 08 Oct 2026 12:14:59 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 504fceb6b;
	Thu, 8 Oct 2026 20:14:40 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Subject: [PATCH v2] media: mediatek: vcodec: Initialize context lock before firmware setup
Date: Thu,  8 Oct 2026 20:14:34 +0800
Message-Id: <20261008121434.946927-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830144827.2701887-1-runyu.xiao@seu.edu.cn>
References: <20260830144827.2701887-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa11b6fe35d03a1kunmde41a01640d4ff
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ09NVh0eT0NMHRpLHx8ZTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=mpuap6vTn5/8zckoWW8m1AHNs9/lrcC5dOJcyxI7o3wqlyxDpZbUynix5R3jV5E4QP1TlxqiCAxXdXkKBLNY9VZXCngNlD9zOFScb1XilepNqRMu5m94NNs+MR9yEckFVuS8w+HDfSmfLLLg6nrgKxqKO7TSfvVKra+weDvEtzU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=bZAo94LpO2B0yElRNSLGBz0NRZ8kLHR1Iz17jxI1zUg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_051458_365777_9E94E0FA 
X-CRM114-Status: GOOD (  11.37  )
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

The normal encoder open path cannot take dev_ctx_lock before
video_register_device(), but there is another path during probe.

On VPU-backed devices, mtk_vcodec_probe() selects firmware before it
initializes dev_ctx_lock. VPU firmware setup registers the encoder watchdog
callback during this selection. A watchdog timeout on the shared VPU
queues reset work, which invokes the registered callbacks. If it runs
before spin_lock_init(), the encoder callback takes the uninitialized lock.

With CONFIG_DEBUG_SPINLOCK=y, an x86_64 QEMU test used a zeroed lock,
initialized an empty context list, and invoked a callback with matching
lock and list operations. It reported:

    [    1.761312] BUG: spinlock bad magic on CPU#0, busybox/58

The lock dump showed .magic: 00000000.

The test reproduces the debug lock diagnostic, not a real VPU watchdog
timeout or its timing during probe. The context list is initialized but
remains empty until video registration, so this shows invalid lock use, not
list corruption or a user-visible failure.

Initialize dev_ctx_lock before firmware setup registers the callback.

Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect encoder context list")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 4e4541b2f..e6cd3817a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -255,6 +255,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
+	spin_lock_init(&dev->dev_ctx_lock);
 
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
@@ -308,7 +309,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
-	spin_lock_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
-- 
2.34.1

