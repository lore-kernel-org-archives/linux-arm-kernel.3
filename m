Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B9EC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXACaEKDc7l/ytvNs6hjCC+fzdSguwb6QUDm1mUCdQ0=; b=cB/20FFNyInux9A7KLWSf+W9xh
	Kyaey1rmsS8AvDBGdEfAupnCwDGLei7reabT6cmaeT0TUkjkQwtDmsqYnpX/v78e2P2u/Y9t51/Ix
	rH0+k1jUQtskiI2CgSEnF+aQEYxy4lzNhGe7HqWfVjFTCzOVrVWrF+klkORYtPU6lhxgkvn4b6alu
	3QOO1SEVv+nExaINxAuhzWDzHv1U9edZUlJhKyRX16r2xi3K4wg8Z+HnfI+vhje1FZnV16LxXBaZ5
	sihUHZfj3jT1kJnvGKW7uGNuq81FuG/9FAzprWQ17dRVM2QlYbGBJflYUvUG3mWpkiib69WieSqgr
	18biJQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt58w-0000000EHmE-1fdi;
	Fri, 14 Mar 2025 13:32:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt543-0000000EGu7-2Bua;
	Fri, 14 Mar 2025 13:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741958814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XQJWIVK2qMI1ScgbVEEAArXbYLsJPrbuzUPh6pCzFrA8d6EmqWN79E2fB9AM3goz0mx6JwqVObNCHa0aJh1DU3DHfLsFd6/tCmcGim4bv6j4XHZcq5CDN/xzK8Qf9P+g2Y9iPklAuwjioKurYrBG2r+XPBACCTkQVDLRNFiUIPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958814; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uXACaEKDc7l/ytvNs6hjCC+fzdSguwb6QUDm1mUCdQ0=; 
	b=mpCbogDaVoeYSeGcq1/FccrTfD0K3HJh0hIa0sy+dagyb9R8QmHgYcnfx61X1rnuxBDCKPBw4ERBuwzdym0zvL6m6/3TmNlOqsuKJjn95oAwXF6bmmPkEm+mzlZSiF55Gfej1N+c2aPPT2UGtp5tRnuCMvpB+q+BTtp9lMZnvNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958814;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uXACaEKDc7l/ytvNs6hjCC+fzdSguwb6QUDm1mUCdQ0=;
	b=MRDqTmOp9ITF0wEglKu/te5ZX/0hcjt/PiRHf4ctZXa9bE+ZbIm0mUX4ZyiifXng
	4dNMF1zo+9PFne0EiBpvsAXMXKHfN/BkIVQiaqxy7D+3jY8sSwsthiCXNCkILbdd2xz
	8UraER3YV2WHocySRI5hFcke7QPzi/XVdHT0RG38=
Received: by mx.zohomail.com with SMTPS id 1741958811570783.6540028974323;
	Fri, 14 Mar 2025 06:26:51 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Fri, 14 Mar 2025 14:26:27 +0100
Subject: [PATCH 2/5] media: vicodec: add support for manual completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-2-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=2581;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=LP+cDWb9txkkC2/qdjribPzGGgfAS/BIXNqjRzmbVj8=;
 b=OJGb/6zw6xhr6cJd5YfPuS4KtTMkzNYtKweE0Hqvzbd4E82jGna7SWrIvWV3kM+Ph4RE75Mn3
 27evC1fQu0aAoJHMarKjBfmBeMo4XLXoZFOBLACrEsw0vgl3cyD7wD0
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_062703_598278_DB6C0228 
X-CRM114-Status: GOOD (  12.58  )
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

From: Hans Verkuil <hverkuil@xs4all.nl>

Manually complete the requests: this tests the manual completion
code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded3c8b57483b148bf7bbffb8a458c5..88cb6e6a713f08bd4f412ca2940b1309bb87513b 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -448,8 +448,10 @@ static void device_run(void *priv)
 	ctx->comp_magic_cnt = 0;
 	ctx->comp_has_frame = false;
 	spin_unlock(ctx->lock);
-	if (ctx->is_stateless && src_req)
+	if (ctx->is_stateless && src_req) {
 		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
+		media_request_manual_complete(src_req);
+	}
 
 	if (ctx->is_enc)
 		v4l2_m2m_job_finish(dev->stateful_enc.m2m_dev, ctx->fh.m2m_ctx);
@@ -1525,8 +1527,12 @@ static void vicodec_return_bufs(struct vb2_queue *q, u32 state)
 			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		if (vbuf == NULL)
 			return;
-		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
-					   &ctx->hdl);
+		if (ctx->is_stateless && V4L2_TYPE_IS_OUTPUT(q->type)) {
+			struct media_request *req = vbuf->vb2_buf.req_obj.req;
+
+			v4l2_ctrl_request_complete(req, &ctx->hdl);
+			media_request_manual_complete(req);
+		}
 		spin_lock(ctx->lock);
 		v4l2_m2m_buf_done(vbuf, state);
 		spin_unlock(ctx->lock);
@@ -1679,6 +1685,7 @@ static void vicodec_buf_request_complete(struct vb2_buffer *vb)
 	struct vicodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 
@@ -2010,6 +2017,12 @@ static int vicodec_request_validate(struct media_request *req)
 	return vb2_request_validate(req);
 }
 
+static void vicodec_request_queue(struct media_request *req)
+{
+	media_request_mark_manual_completion(req);
+	v4l2_m2m_request_queue(req);
+}
+
 static const struct v4l2_file_operations vicodec_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vicodec_open,
@@ -2030,7 +2043,7 @@ static const struct video_device vicodec_videodev = {
 
 static const struct media_device_ops vicodec_m2m_media_ops = {
 	.req_validate	= vicodec_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= vicodec_request_queue,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {

-- 
2.34.1


