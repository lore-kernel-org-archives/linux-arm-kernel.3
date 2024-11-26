Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47BFD5A6F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyeX0uBYtM9HvUPxJZMO7niMsetQIUIDkY6DvJRVK/c=; b=V8BX3J1TbSevJQcksGz3KzRv+r
	tvfb/bzt+wzjMPK/1e8nIQWGFBqoP7up80H1zxYwe4TkgcBZDvEcYYiTtB53nTsSMa6D4xGq7+OwC
	Hcw9YrfWwGzxxz7XVS3ZQWw7whyzYm/l8GHVsc+N1lqk0oFc/RRGFTWYbFhBfozr+PP3g0p1B+noK
	vJ23+t8TMHGp/bEgJ3UNXJAg0JdfY1mgqxziQuwBSfqacMuSwn9ZOS29Ida4Z5j5iaPFfvfTm7qls
	MYyPLw9OOq6/kzHFG5HHv4qyJD35CCvHHSPgXj+koubQFW2RBKhx+AqNyCDTb3OeHlo/aUXgLzVMS
	n0LfAUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqeC-00000009w32-01nB;
	Tue, 26 Nov 2024 08:10:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqYr-00000009v5L-1rWX;
	Tue, 26 Nov 2024 08:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732608265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UvvLFPJqE1oeeNGaBSnKujv4XjJ/NfXb3AOu0V2VL2pxeg0XRF2kpKyu3L3IF03Z2Vc114osM7k+pfS79zqhZH95p45U0Q1NkCeiO9W1M6LgumK3+r/Zxf6uYb5cc0bmGrj8X+JS+p8RE8FrMzSQ5rYJGABTu5cCRQ9Y+GgACGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732608265; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyeX0uBYtM9HvUPxJZMO7niMsetQIUIDkY6DvJRVK/c=; 
	b=oJ5cb4LwlJ8pB+OSP9a1Bd8MWFUH8eqbbszFybu4zo2IQlwGGEA7T9dHzjWUGo2LFHLObzPQ11VLRYbOUSciJxXlZOtKG8YLhfaMkmVkzyCBFkMIBQEkDOni3CIMunkchizdpIsgSj6mLyEf0rK0BF4qU5qeFLvujhH7ea/JR7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732608265;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oyeX0uBYtM9HvUPxJZMO7niMsetQIUIDkY6DvJRVK/c=;
	b=WWtHciXmaATXFOS5oxEkABTQix2ArX5vRwxb80Ig5p/WqQl8B8lViIt5m/AKq3bp
	Kjox92J1a3KJ51ZGpX2zIqSVRatA+2E807R4OP007PAmnPn6jzSbbc36gRGtVqKt9v0
	fzxCJU+NeG8oyI4l9hCHZ5PUk1NAHA4wIUiR+DA8=
Received: by mx.zohomail.com with SMTPS id 1732608259305773.6767418297189;
	Tue, 26 Nov 2024 00:04:19 -0800 (PST)
Date: Tue, 26 Nov 2024 09:04:13 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 1/5] media: mediatek: vcodec: support manual request
 completion
Message-ID: <20241126080413.kr7jty7oz3ylfxsu@basti-XPS-13-9310>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
 <20241116031724.15694-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031724.15694-2-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_000441_595273_C90B47D4 
X-CRM114-Status: GOOD (  15.48  )
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

Hey Yunfei,

On 16.11.2024 11:17, Yunfei Dong wrote:
>There is only a buffer object for some codecs, the request is marked
>as completed if the buffer is set to done. Framework will add a new
>control handler object to the request with latest control values, will
>get below warning if the driver calling v4l2_ctrl_request_complete to
>set media request complete again. Using manual request completion to
>fix this issue.

Thank you for working on this.
I am currently working on this as well, so I would like to ask you for a
bit more patience, once I am finished with my testing and have a working
patch I'll send that patch and then we can discuss on the basis of that.

Regards,
Sebastian

>
>Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
>pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
>pc : media_request_object_bind+0xa8/0x124
>lr : media_request_object_bind+0x50/0x124
>sp : ffffffc011393be0
>x29: ffffffc011393be0 x28: 0000000000000000
>x27: ffffff890c280248 x26: ffffffe21a71ab88
>x25: 0000000000000000 x24: ffffff890c280280
>x23: ffffff890c280280 x22: 00000000fffffff0
>x21: 0000000000000000 x20: ffffff890260d280
>x19: ffffff890260d2e8 x18: 0000000000001000
>x17: 0000000000000400 x16: ffffffe21a4584a0
>x15: 000000000053361d x14: 0000000000000018
>x13: 0000000000000004 x12: ffffffa82427d000
>x11: ffffffe21ac3fce0 x10: 0000000000000001
>x9 : 0000000000000000 x8 : 0000000000000003
>x7 : 0000000000000000 x6 : 000000000000003f
>x5 : 0000000000000040 x4 : ffffff89052e7b98
>x3 : 0000000000000000 x2 : 0000000000000001
>x1 : 0000000000000000 x0 : 0000000000000000
>Call trace:
> media_request_object_bind+0xa8/0x124
> v4l2_ctrl_request_bind+0xc4/0x168
> v4l2_ctrl_request_complete+0x198/0x1f4
> mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> process_one_work+0x140/0x480
> worker_thread+0x12c/0x2f8
> kthread+0x13c/0x1d8
> ret_from_fork+0x10/0x30
>
>Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  8 +++++---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++++---
> 2 files changed, 19 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 98838217b97d..d2146724f5de 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -887,10 +887,12 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 			if (src_buf != &ctx->empty_flush_buf.vb) {
> 				struct media_request *req =
> 					src_buf->vb2_buf.req_obj.req;
>-				v4l2_m2m_buf_done(src_buf,
>-						VB2_BUF_STATE_ERROR);
>-				if (req)
>+
>+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>+				if (req) {
> 					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
>+					media_request_manual_complete(req);
>+				}
> 			}
> 		}
> 		return;
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index afa224da0f41..1e11c08d708f 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -264,8 +264,10 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
> 		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> 	}
>
>-	if (src_buf_req)
>+	if (src_buf_req) {
> 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>+		media_request_manual_complete(src_buf_req);
>+	}
> }
>
> static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
>@@ -308,6 +310,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>
> 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
>+	media_request_manual_complete(vb->req_obj.req);
> }
>
> static void mtk_vdec_worker(struct work_struct *work)
>@@ -375,8 +378,10 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
> 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
>-		if (src_buf_req)
>+		if (src_buf_req) {
> 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>+			media_request_manual_complete(src_buf_req);
>+		}
> 	} else {
> 		if (ret != -EAGAIN) {
> 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>@@ -731,9 +736,15 @@ static int fops_media_request_validate(struct media_request *mreq)
> 	return vb2_request_validate(mreq);
> }
>
>+static void fops_media_request_queue(struct media_request *req)
>+{
>+	media_request_mark_manual_completion(req);
>+	v4l2_m2m_request_queue(req);
>+}
>+
> const struct media_device_ops mtk_vcodec_media_ops = {
> 	.req_validate	= fops_media_request_validate,
>-	.req_queue	= v4l2_m2m_request_queue,
>+	.req_queue	= fops_media_request_queue,
> };
>
> static void mtk_vcodec_add_formats(unsigned int fourcc,
>-- 
>2.46.0
>
>

