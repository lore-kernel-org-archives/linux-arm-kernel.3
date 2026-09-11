Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC44C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J+7QTnVPPPZMqiCYBuyFWOTTKbazKI3hnsP8vEZJOS0=; b=AdnGXrRV5N8G//IX+x3UjEkllX
	/Lflj/1Y14KEfSq+f2BYTY7JgNw6DmR0rfzkluq9Yw0bvgmDUNWs3acDy468tSbjHG43uryYT3+LL
	Pqqa+6yyOzFKeLGG9ZP9oLglTGwCMMahchhoLwJbNbc0k3+SzFtIC9EXNcDDO5B6MlWH2KCOi7xrm
	YqqhaxN7m0OM6NCoRuCPty0r4TUsSxn6CS2robd14SX+3ixsHhnesIjeiM1byTuNNbTtOqUjaY0g6
	Vzjv+REbqKnizOgQEqwKBkPSh7fhV5SdfHBBi81z5Ogy7LeeYGXe62DBiJN82AbQYyLSlXvg2b2pE
	hiT+26mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uRy-0000000FusM-3Y2S;
	Fri, 11 Sep 2026 06:09:26 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uRv-0000000FurV-09xf;
	Fri, 11 Sep 2026 06:09:25 +0000
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fad;
	Fri, 11 Sep 2026 14:09:14 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] media: mediatek: vcodec: avoid accessing a failed control
Date: Fri, 11 Sep 2026 14:09:13 +0800
Message-Id: <20260911060913.94267-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f159fd703a1kunmfc8dba361c732f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk1OVkhJHxpJQxhIGUpMTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=SXKGo9ZDCA1zjna9TjRkb7NvxJTUpiZrTqan5RWB91f30zvivz1H5npatBgq1ukX6WQp1igV921ufnKolrgZj1xaOnx6wYy1QUntNrzmcy8mlWboClWgLbP2A7H75KyuGed+4keSruomttWCLcxVPK2PVbnwufYyjIctL5JL9NU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=J+7QTnVPPPZMqiCYBuyFWOTTKbazKI3hnsP8vEZJOS0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_230923_737575_EB78BE6B 
X-CRM114-Status: UNSURE (   7.69  )
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

Set the volatile flag only if the control was created. The existing
handler error path remains responsible for reporting allocation errors.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..8441f1d69d2f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -555,7 +555,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
 
 	ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 0, 32, 1, 1);
-	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 			       V4L2_MPEG_VIDEO_VP9_PROFILE_0, 0,

