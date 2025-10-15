Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAEBCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BOKrldhzYmG3bHimJ60jaR/beM+0hshn7u1LiiCp9E=; b=RurSPPiIdtR0rjqveA6fWJi/HR
	Zah8y5IfRStw8XAHF3RUClT7UaPSvgSxgDM2SJu3OedVwDTS4KDjmpKSarXOl0zW7YF/c18ZYWv54
	M45EWac2c/ylnJ+FeUDpBoe+G/4vxyX3ce18BdSnq1uI7IexqXMsxob6sTH8tGxVXXxoBcHUpxZKC
	wuSdwdhpI6L5fco6Vw/jEbdLc8/3pbQNCGKCUNVDV2pi1g0taI1eUD05Uf716aSiTb5HTFH9cPA7z
	3Ep14JR705aIOqL0lOfiA6t7X7RYWfpxHmymsg06V7LihWzYK1JUrigM0UBi7UpjEnDS1tR5WvqJ6
	eloYL/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLB-00000000ovu-2Rli;
	Wed, 15 Oct 2025 07:54:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wL3-00000000okc-0cEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:54:26 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B43861A8F;
	Wed, 15 Oct 2025 09:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514765;
	bh=GyN5dO2q8CNnA8mbshQ6j2DDwtQzZldeYpp1do0QZpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S57TxcW3dbK975VLRiYnG8xeJTNAWYQKdgUVfFfieeDokkdXkuL1Dpm92ojA+sM5Q
	 W5YM7WkvjAPX61ovLj6IpfTKdVTnWTmfuixqOLJqR3iV8HPSn/OYFblmIUm6mbHRTV
	 z2ZDpeSNnLJ2W/VAPrVZg9y1CB0ZlEqXFkQtyx3U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:35 +0300
Message-ID: <20251015075353.22625-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005425_323008_7FC8F1E4 
X-CRM114-Status: GOOD (  10.71  )
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

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 6cc9b07ea53a..3f9a67a6bd4d 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct pxp_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 
 	f->fmt.pix.width	= q_data->width;
@@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


