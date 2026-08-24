Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DB7C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:From:
	In-Reply-To:Date:Subject:To:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQpiRTqyDmsFHrQhXSOP3qjTy3lJ+JjfdqVFx2AjjoM=; b=w0ZnhjNJMngc5wC1Q9Z9PmAP2O
	M5bStXY+/vxFT1kppKnRwyjyQifLWpiXp9PKrKyiEM/RuDyb/S8bEe7OOHKOT/jGa4tmBu3qpm4AW
	pUWFBkXD6ym69CutNaPYf9PzimZ2bxhD1ahTY5uK3tt9iiLZEnA+jLTShlUOnjhZBFSSnS8p2PCR8
	BkUlcndYLzoTRo5WLaKg5p+LsnbB1RRflrEwYWiojnLEmPWZ9RlkItAimAdlQ3w7IxA5hhAxDtzWo
	fKZR1XXS2aNsTXcY0XrdvdD+1/Z9Wj4S1oVqP5Y40B3VfOOmE+5FuvNyqJ0mzuBbjKN6kqyV8wvX3
	gszpvGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRb-0000000HJY9-0XDD;
	Mon, 24 Aug 2026 19:34:55 +0000
Received: from sg-2-4.ptr.blmpb.com ([71.18.227.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRW-0000000HJWw-2pgz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600084; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NQpiRTqyDmsFHrQhXSOP3qjTy3lJ+JjfdqVFx2AjjoM=;
 b=oCGKsyWfAUBYis17BXo7stZKB8sy5L9MG9snJ4/4Ss4RRDngkdD5zfiTJ8DfKSnm6tj6Y5
 WEvu/UMYlcvKM5TtX06gKvEyhpqGxA3ROxWUiHkAtqRUh+E5nX8KJICb8pUNMe+MfmaCcQ
 iVt5fjeLoNHe2CsPQG7QNYSmlcfWoi6BpoRi3pLI4pmtTE6XoCi2okw8FyVlP/fltyPXTT
 81hAMnGuAtVtXo3zwT8ofxEwvuH+8yT0P/q0lPI07SBRIdT81Kni5qfImpbfvezrfDZgpL
 kxF3bt7xrVXWwvL8pjEvDZdYWymVGvUnscfIWCwFQ4whPhe/5Oom1VE7ShpKbw==
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a8c9cd2+c8be14+lists.infradead.org+me@cherr.cc>
Content-Transfer-Encoding: 7bit
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Content-Type: text/plain; charset=UTF-8
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
Subject: [PATCH 3/3] media: mediatek: jpeg: cancel job timeout work before m2m release
Date: Tue, 25 Aug 2026 03:34:32 +0800
In-Reply-To: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:41 +0800
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_123450_897638_19F63A2E 
X-CRM114-Status: UNSURE (   6.77  )
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

Each job arms jpeg->job_timeout_work, cancelled only by the IRQ
completion path. If a job stalls, mtk_jpeg_remove() frees
jpeg->m2m_dev via v4l2_m2m_release() with the timeout still pending,
and mtk_jpeg_job_timeout_work() then dereferences the freed m2m_dev
and the stale ctx it returns -- a use-after-free.

Drain the work before the m2m device is released. The device-level
job_timeout_work was missed by the earlier fix for ctx->jpeg_work.

Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec48308110ae8520662e182dc0445447d8d0..f0fe14e83d515f5011cbfe051abbf565568013d0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1405,6 +1405,7 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
+	cancel_delayed_work_sync(&jpeg->job_timeout_work);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 }

-- 
2.47.3

