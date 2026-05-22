Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4365CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah41GH8YeHk1tfRxCEu8S0xYjZ7Z8N5VnvweRoNKxak=; b=I3HVug6NejBw+p8n/G04vlOxie
	JZI76Tde1GoTU9zDV+v6Nlxvpl/nMkYoycs8/d3nYgVHME/C2THnEYCBYinCU7qrx26cgRBPyhp7A
	UFwccaRgstIGQ/nesFYW37lSvwOQsFNXnHftUWgVxleCUIw8ET6Ssae3/YfDMbpnz76mMUnxS07Dm
	8mQqwCc0cyBaRsLSwRjUHL4RWaGpp73KuEiOxFSI9VAnCMiJMXGyv7uRFV2ETxO/Ga7RDC7S33leW
	N/E1rlOUjPI6brqOoG4SSyJcunoa/M8oixRq5o4kT0UlKzk6agv8UawOWbE3pBuw2zpTu2v+6fXaf
	nclkO0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxK-0000000ATja-0WhU;
	Fri, 22 May 2026 10:18:14 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxG-0000000ATfQ-2m37
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:18:13 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9EECF37002A1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:17:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DB7C1B408D1; Fri, 22 May 2026 10:17:53 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id A4C02B408C9;
	Fri, 22 May 2026 10:17:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 09/14] media: verisilicon: Cancel job with runtime pm put/clk disable on failure
Date: Fri, 22 May 2026 12:16:48 +0200
Message-ID: <20260522101653.2565125-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031810_902894_78766B62 
X-CRM114-Status: GOOD (  13.10  )
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

The no-pm variant of hantro_job_finish is only good to use directly if
runtime pm get failed. In other cases, we need to do a runtime pm put
and bulk clk disable to correctly undo what was set up.

Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/hantro_drv.c   | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e0c11fe8b55c..e21306f2bf2e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -169,29 +169,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_cancel_job_no_pm;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_cancel_job_pm;
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_cancel_job_clk;
 
 	return;
 
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+err_cancel_job_clk:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_cancel_job_pm:
+	pm_runtime_put_autosuspend(vpu->dev);
+err_cancel_job_no_pm:
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.53.0


