Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B7CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8Wo8LLSY0pPyy+dyeSotUY0OkUOTz16hb7bl4GVtIM=; b=Ecinm6Wyy8KV5weJfxqMMFgvdQ
	6W3iRsAXm78LUKJLvTHWdlPZPZW0Lc878Z7Zf8bYgqZoF8rchFIYORuJ6WRyT+mX4QxvfNxzaez8x
	YylDXaKfzifA7yBuiVnnGH3fizRQ6WA/jOuC9lsQtBArXpedW8V7MVCGQa8436Mfx+RAGHSfp5gmT
	Swhc8RqqOGYKfVCZHPBHIp3jSCTdjCUNYVNhtgldYRPcxjeTFdNZWCXuwvEtwp82vFMWj4UgwHisi
	dJYM/g71H3hYJI50hwMHFOeoKk9HuHECLqKWdKfnZ79eIVKVHCbml0xsz2VZQIqT1iXLl0Ff5oTx7
	Zi1GDptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Hp-00000003VvA-2tJo;
	Wed, 27 May 2026 08:06:45 +0000
Received: from mail-m81208.xmail.ntesmail.com ([156.224.81.208])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Hm-00000003VuF-0ghD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:06:44 +0000
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4001c3292;
	Wed, 27 May 2026 16:06:26 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: mchehab@kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Frank.Li@nxp.com,
	martink@posteo.de,
	rmfrfs@gmail.com,
	kernel@puri.sm,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: imx8mq-mipi-csi2: fix memory leak in imx8mq_mipi_csi_probe()
Date: Wed, 27 May 2026 16:06:24 +0800
Message-Id: <20260527080624.1717938-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6878795a03a2kunmfa06458432849
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh0dVh5ITEpOHkxLSE4aTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bRBsSZFszClz8dqsA7AGBJppPnp7fWke1w0tluA+26XTIxjYs+d8dTxAVzw+3pc6tiUY8xvlmReUh1t7yuNOCNpTVQFLLoQm+mXHwmjC9IVFK2W5sb2Ni7snC/rNg95oVgSQzedjjMoJ9p8VmxogeJQdZVlotcNMHZpdMK9VTeQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=u8Wo8LLSY0pPyy+dyeSotUY0OkUOTz16hb7bl4GVtIM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_010642_877625_2B544D24 
X-CRM114-Status: GOOD (  11.46  )
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

If imx8mq_mipi_csi_init_icc() or imx8mq_mipi_csi_runtime_resume() fails
after subdev initialization, the function fails to release the
corresponding resources, leaking the subdev state and media entity.

Fix this by introducing a dedicated subdev cleanup label and routing the
affected error paths to it. This reordering is safe as the consolidated
label chain preserves the correct sequence without affecting other
execution paths.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do not
have suitable i.MX8MQ MIPI-CSI2 hardware to test with, no runtime
testing was able to be performed.

Fixes: cd063027c304 ("media: imx: Unstage the imx8mq-mipi-csi2 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 04ebed8a0493..e5a062cc0788 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1016,7 +1016,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		goto subdev;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -1036,13 +1036,14 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 
-	media_entity_cleanup(&state->sd.entity);
-	v4l2_subdev_cleanup(&state->sd);
 	v4l2_async_nf_unregister(&state->notifier);
 	v4l2_async_nf_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
+subdev:
+	media_entity_cleanup(&state->sd.entity);
+	v4l2_subdev_cleanup(&state->sd);
 mutex:
 	mutex_destroy(&state->lock);
 
-- 
2.34.1


