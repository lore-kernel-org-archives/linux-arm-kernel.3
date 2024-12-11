Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BCAE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsqAVGRVtN7IvQG7hD+SDFUGpEQJ+euBRQSBpwnKYF0=; b=Ima6REvGJ21ftgt4dvvhXenqb2
	VFuJv/S6avFMvXfkS6jozjoiTl+uJHJr6iL8ES9hFRZLSqNRAkdu27t1hy2n4zfwBI5eQoXaTciyl
	slBiv4ljsqCQaMRWhd+WKKBxusI3BAarIGpo8dUP0X3eSbc1YUp6Rte/JOd8TtAS03PCxoJJluM1o
	4eBFHZeSuhynach5W9QenEIWggzAhTK+bUIOBX8xgGuo3w9r0dGYjw8L2UGkyLj1DVLHeQ6o5z2rB
	M5dJS2aFLoHBwMSowT9LqtfpZmfj39yJ6qWx0gWtyQFxygQlFEA8QCIbP5/9fDNmkoSsC6F5zrr6u
	cGVk2ILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMci-0000000Exg5-3xis;
	Wed, 11 Dec 2024 13:19:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMbD-0000000ExHf-3BdU;
	Wed, 11 Dec 2024 13:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1733923070; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FzvZ9vsnFE8JzCyYwN4aLGg2OJMY5cChGxYQKjgnm8TZnC3sivb2D3NQe5AGWFNmfGXvWOhnxlMn9E1wjH88RWTkmxIPE59+cUy8brBq6BLbII2Sf2HejM76PfdtbcXrmHUtPtk4bVXpxDB/fzyVXM7PEwCROi22piNRfSqGnFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733923070; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BsqAVGRVtN7IvQG7hD+SDFUGpEQJ+euBRQSBpwnKYF0=; 
	b=YyoevzDEhEBD9I0uOZRY1MfqT+sxvkk4ejbLqJgAA9jh/Uvf8ELD0IjayI+vpxsulbTibKcr12gzxnoXg/2l+ExlFqQmeVVlkIfhvhzWBX7LJ0GDJ1+bvHj/Me2ouYAHDJwwPOOZ1WTHCSLHHs4PC5NnA56tYmO9fY0DDFRfFUI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733923069;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BsqAVGRVtN7IvQG7hD+SDFUGpEQJ+euBRQSBpwnKYF0=;
	b=i8gtEjfnc1uU6Wn4uJYSxg7l+sdRaVL1IsuPriyvQJj1bILMotZUQVomKAxwnTYo
	Ijnox4tIspXC/FI7aiWy0tTSWGKqRh3umARJVSIf7rF+3WsZm5RDoWmofwMOBzPerng
	BqQZjXcxUnRRpUvIA+603sbS00M15OmUn1yvYMWo=
Received: by mx.zohomail.com with SMTPS id 173392306724954.317217262560916;
	Wed, 11 Dec 2024 05:17:47 -0800 (PST)
Date: Wed, 11 Dec 2024 14:17:40 +0100
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
Subject: Re: [PATCH v6 1/3] media: mediatek: vcodec: remove vsi operation in
 common interface
Message-ID: <20241211131740.x6lrlamgi5ogdq7b@basti-XPS-13-9310>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
 <20241116031616.15656-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031616.15656-2-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_051755_820700_C361E74F 
X-CRM114-Status: GOOD (  13.21  )
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

On 16.11.2024 11:16, Yunfei Dong wrote:
>Extend struct video shared information (vsi) to send different
>parameters to scp for mt8188 architecture is changed.
>Remove vsi related operation in common interface to make sure the
>interface can be called by extended and non extended architecture
>at the same time. The new extended interfaces with new vsi will
>be introduced in later patches.

My recommendation:

Extend the VSI (video shared information) struct to allow sending slice
parameters to SCP, as the parameters have changed on MT8188
architecture. Remove VSI related information from the common interface
to ensure, that the interface is usable by architectures with and
without the extended parameters. The new VSI extensions will be
introduced in later patches.

The rest looks good to me.

Regards,
Sebastian Fricke

>Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 +++++++------
> 1 file changed, 7 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>index 1ed0ccec5665..ab192ce0b851 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>@@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
> };
>
> static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
>-						  struct vdec_h264_slice_share_info *share_info)
>+						  struct vdec_h264_slice_share_info *share_info,
>+						  struct vdec_h264_slice_lat_dec_param *slice_param)
> {
>-	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
> 	const struct v4l2_ctrl_h264_decode_params *dec_params;
> 	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
> 	const struct v4l2_ctrl_h264_sps *sps;
>@@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
> 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
> 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
>
>-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
>-	       sizeof(inst->vsi_ctx.h264_slice_params));
>-
> 	return 0;
> }
>
>@@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
>
>-	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
>+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
>+						     &inst->vsi->h264_slice_params);
> 	if (err)
> 		goto err_free_fb_out;
>
>@@ -749,6 +747,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
> 	if (err)
> 		goto err_free_fb_out;
>
>+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
>+	       sizeof(inst->vsi_ctx.h264_slice_params));
>+
> 	buf = (unsigned char *)bs->va;
> 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
> 	if (nal_start_idx < 0) {
>-- 
>2.46.0

