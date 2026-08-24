Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15572C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:From:
	References:Mime-Version:To:Content-Transfer-Encoding:Content-Type:Date:Cc:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH1V2XBa3EFVQaHX2pCS4ZMV/ZcmzVgpWewcrgvVAVk=; b=wfFUPfwB5bXRAi6BfizgHfTagK
	G8F8cRrc2eOiryIccfoNYZZAEYt7M2c/E+15d9nvK9IC8E06Ys2u81SbLbqovJzw3AL+m2D3zMeaw
	qzJQTm769W3qSZZaSbrXmzDBJ66nXh0LJh5L+iGgyKAAAPOQgoAVN/kl5GNUGQf2xSIMIHXdkmDdZ
	ROSKPPaKOZOIr96KMK1DLFj5ncgJX8VFoeYWRAy57r+8uqqCrT2yuu7Q4xyLcuCmF4WU5EmcQZd3X
	XAvV4JYJcu+oMq4fnnc5jIuLpza9dCe4lKgFoVv6lZkeRHdssc2zjeq5tt2K/XZ9jORmcmac+ek6l
	9aM9dvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRo-0000000HJde-2BxJ;
	Mon, 24 Aug 2026 19:35:08 +0000
Received: from sg-2-1.ptr.blmpb.com ([71.18.227.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRa-0000000HJWi-0UXL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600080; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OH1V2XBa3EFVQaHX2pCS4ZMV/ZcmzVgpWewcrgvVAVk=;
 b=eG966JAsGTTjYKINbV/69IWhZLorf7f0553/LcXwEWmj1icPm5T2Cqh+f+q3W19lPESPIR
 U+6cKzCppq+1H7pgfNYFEWfDB6dtbylcQjqCJgNK/gDQy5zXvtjEK0OkzC/vegslDzLmVj
 YeavJ4Ifaa/fInMCzsOsbuMBzSTn50ML3FkwN802VZP7W0DAyxQ/RM+EdxkyiB9JQcngtm
 7YkXLzaJiR3vvBGqDc8SFiJETrH4VYL+C2Kq+1msyqGLosNz+dEHzmgJyrkcIaBGma6JNt
 HiCc966uicLamYmA5C7K2f1kO7Q7ZWohhJ/45FoTnglyzp+yrO4+qXFZ3uxs4g==
X-Lms-Return-Path: <lba+26a8c9cce+412a78+lists.infradead.org+me@cherr.cc>
In-Reply-To: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:38 +0800
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Date: Tue, 25 Aug 2026 03:34:30 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 7bit
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>
Mime-Version: 1.0
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH 1/3] media: nxp: imx-jpeg: cancel task_timer before freeing ctx
Message-Id: <20260825-media-timeout-work-v1-1-ebfebbeb6c31@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_123454_356179_E6BEB4AB 
X-CRM114-Status: UNSURE (   9.04  )
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

mxc_jpeg_device_run() arms ctx->task_timer for each job; the only place
it is cancelled is the job-completion IRQ handler. If the hardware
never completes the job, mxc_jpeg_release() frees ctx with the timer
still pending, and mxc_jpeg_device_run_timeout() then dereferences the
freed ctx -- a use-after-free.

Cancel the timer before the ctx is torn down, before taking
mxc_jpeg->lock so the cancel never waits on a worker that needs the
mutex.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each frame")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 725e941528848e8f224fe6a96ba7f746fc45ed63..fbb64a1ecb5189d2d7b953b99dcd7bcb54e6e20e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2796,6 +2796,8 @@ static int mxc_jpeg_release(struct file *file)
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct device *dev = mxc_jpeg->dev;
 
+	cancel_delayed_work_sync(&ctx->task_timer);
+
 	mutex_lock(&mxc_jpeg->lock);
 	if (mxc_jpeg->mode == MXC_JPEG_DECODE)
 		dev_dbg(dev, "Release JPEG decoder instance on slot %d.",

-- 
2.47.3

