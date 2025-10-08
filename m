Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205CBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u28Xe7prKr4hVzwbYPSThg7IJJsdY2TAdmNJBJwi0xU=; b=q343lgqH4yr48r/LPR1W2w+eFw
	QPvS5O2K9H04PyCni3B2K1Mr3VtRX4yoebBFo1e2+CfL0mKQc+T+fo6VHM3ZUTOeiwusfNI3QuDVm
	D2zZ6O7zofGMQvzT3XS0BGWrFMMIbA5GE3gieUTZUvA/pVBUAaTcb/DvUHb0dumZ7n6wTcsjL/NC1
	ccFe2oMo89cFHBHcyTMfLwsLHNhvbkDzdHaAiQCSxpy57EWuFPOAVU8fbpMsNVYs0A1p3frP45LHH
	euh/l+kyvF76gu/nv2aMGpGOiExTK3P7BkKK6D4VYrvm0zzEiGelUdaWsXVvEn78RHHUoGyToLe+O
	zhv+/7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJu-00000004PNW-3eFj;
	Wed, 08 Oct 2025 17:51:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJs-00000004PJD-0QnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 17:51:21 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 878E01E3A;
	Wed,  8 Oct 2025 19:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945784;
	bh=UFX+dEUBdcw4TCv0Sa2aSXJbi5QNte0jSA97Pgn18e0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iuL3VnMG7XN4+GOsEc9Hz/mq0luIqZmgWuM9bTRlAl2uo6W5kALNKsSLFh9AOJRXE
	 Pm+WcgXpGOEsGFD5rgWpsAcnrupgmaxkkJ6M+u86P1zqKs5SeJzNuDQAzyWNRrQtAM
	 ORCD6eHMFp+HGBN11YZWgeeStthLnuoDa30hHDAc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 11/25] media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:38 +0300
Message-ID: <20251008175052.19925-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105120_303506_845D2A72 
X-CRM114-Status: UNSURE (   9.26  )
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

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 8681dd193033..37e0670f98c5 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2492,8 +2492,6 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
@@ -2529,8 +2527,6 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 		return 0;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, cap_type);
-	if (!dst_vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(dst_vq))
 		return 0;
-- 
Regards,

Laurent Pinchart


