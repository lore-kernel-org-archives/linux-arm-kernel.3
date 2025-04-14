Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EhByh86ktBh8nsaR6OLm5j53J9xcclCQbRNlNedGe0=; b=a8wH0EJ2BIySX6JzzlV2Z/jpv5
	OwijkDl49z+IXA+qtVhltw5BPLTxISyxGKReooJq6czbXo3jopFZDWxT5unJkgqWcauHQvNLA9/+R
	2SkmanOp+n2yTs77C2NwgrhGSli55NJG4rMNCDZ+TbsBjdLpEJwa/GCiaIuo5UDH5t0nbDV6AmJCk
	zeoESM8rLaXwP0+jHK7AM/jw9uSdVphMyoa6X+asKCGn7oLINnnxmKwzU2/01vFlJAMd3LCx0o8OT
	nBndjkJBEckCl626XMxt7I1P4JGlGUlGrvT+E5OG5MZPiUhY7ftagvGWY+8JVxOBODXFVrTdC5hYE
	hGDC9+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GC8-00000001Hk4-17zZ;
	Mon, 14 Apr 2025 09:33:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FqN-00000001EZS-1ebN;
	Mon, 14 Apr 2025 09:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744621865;
	bh=eCRuz3iU92Fps88PsaNqBfRzZ+3SfrbqRNETJMgMqrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRZy+KAe8O5XNKgsFJ+//lJTkFlp2uYBj8Rjtz9xqSTsGdMDdLpYaHmpNoQnGEEYg
	 wxLOuOMeyapBbUnESJP7QvL9SFFTqzFNLOvqDVWo7K+ZVxgJXtOH5Gux7Ys8sH9qtF
	 M7VeGTAyth4newHv+QLNJREnHtuXr/uqKNKpVoJ90TSKL7nVnY0bivZXlHEN+LpD5i
	 ChSLAXaTPzw06dyXU1PtxDMWR3GRqq/bw6BNJjvpgUBqPCD7ToswlIthjTClMh3nbq
	 Al32tqSMOPyk7HYzvGCKPOrsxa0gwf8RjSbUtDGFhjQemYpk1sCN+HBiWCiuePqOea
	 nKvQQK9IpaZ3A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB8DA17E0E92;
	Mon, 14 Apr 2025 11:11:04 +0200 (CEST)
Message-ID: <d3da96bf-d1c8-4bf8-a22a-21a43f78f27d@collabora.com>
Date: Mon, 14 Apr 2025 11:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: vcodec: Implement manual request completion
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-4-5b99ec0450e6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-4-5b99ec0450e6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_021107_586236_2CC4A593 
X-CRM114-Status: GOOD (  26.07  )
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

Il 10/04/25 17:39, Nicolas Dufresne ha scritto:
> From: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This patch is great - but looks like it's worsening naming consistency across the
driver.

Please look below.

> ---
>   .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 +++++
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 50 +++++++++++++++++
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 19 +++++++
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 63 +++++++++++++---------
>   5 files changed, 124 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..c5fd37cb60ca0cc5fd09c9243b36fbc716c56454 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> @@ -105,6 +105,19 @@ enum mtk_instance_state {
>   	MTK_STATE_ABORT = 4,
>   };
>   
> +/**
> + * enum mtk_request_state - Stages of processing a request
> + * @MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> + * @MTK_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
> + *		      needed anymore
> + * @MTK_REQUEST_CORE_DONE: CORE decode finished
> + */
> +enum mtk_request_state {
> +	MTK_REQUEST_RECEIVED = 0,
> +	MTK_REQUEST_LAT_DONE = 1,
> +	MTK_REQUEST_CORE_DONE = 2,
> +};
> +
>   enum mtk_fmt_type {
>   	MTK_FMT_DEC = 0,
>   	MTK_FMT_ENC = 1,
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce25d6a089292f1e57 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
>   					src_buf->vb2_buf.req_obj.req;
>   				v4l2_m2m_buf_done(src_buf,
>   						VB2_BUF_STATE_ERROR);
> -				if (req)
> +				if (req) {
>   					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> +					media_request_manual_complete(req);
> +				}
>   			}
>   		}
>   		return;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 9247d92d431d8570609423156b989878f7901f1c..c80c1db509eaadd449bfd183c5eb9db0a1fc22bd 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -26,6 +26,56 @@
>   #include "mtk_vcodec_dec_pm.h"
>   #include "../common/mtk_vcodec_intr.h"
>   
> +static const char *state_to_str(enum mtk_request_state state)

static const char *mtk_vcodec_req_state_to_str(enum mtk_request_state state)

> +{
> +	switch (state) {
> +	case MTK_REQUEST_RECEIVED:
> +		return "RECEIVED";
> +	case MTK_REQUEST_LAT_DONE:
> +		return "LAT_DONE";
> +	case MTK_REQUEST_CORE_DONE:
> +		return "CORE_DONE";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +void mtk_request_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,

void mtk_vcodec_request_complete( ....)


> +			  enum vb2_buffer_state buffer_state, struct media_request *src_buf_req)
> +{
> +	struct mtk_request *req = req_to_mtk_req(src_buf_req);
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	mutex_lock(&ctx->lock);
> +
> +	if (req->req_state >= state) {
> +		mutex_unlock(&ctx->lock);
> +		return;
> +	}
> +
> +	switch (req->req_state) {
> +	case MTK_REQUEST_RECEIVED:
> +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(src_buf, buffer_state);
> +		if (state == MTK_REQUEST_LAT_DONE)
> +			break;
> +		fallthrough;
> +	case MTK_REQUEST_LAT_DONE:
> +		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> +		media_request_manual_complete(src_buf_req);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> +			  state_to_str(req->req_state), state_to_str(state));
> +	req->req_state = state;
> +	mutex_unlock(&ctx->lock);
> +}
> +
>   static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_dec_dev *dev)
>   {
>   	switch (dev->vdec_pdata->hw_arch) {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..cd61bf46de6918c27ed39ba64162e5f2637f93b2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -126,6 +126,17 @@ struct mtk_vcodec_dec_pdata {
>   	bool uses_stateless_api;
>   };
>   
> +/**
> + * struct mtk_request - Media request private data.
> + *
> + * @req_state: Request completion state
> + * @req: Media Request structure
> + */
> +struct mtk_request {

Maybe mtk_vcodec_dec_request? :-)

> +	enum mtk_request_state req_state;
> +	struct media_request req;
> +};
> +
>   /**
>    * struct mtk_vcodec_dec_ctx - Context (instance) private data.
>    *
> @@ -317,6 +328,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
>   	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
>   }
>   
> +static inline struct mtk_request *req_to_mtk_req(struct media_request *req)

...and this could become req_to_dec_req ... but no strong opinions on this one
specifically, so feel free to keep this as it is.

> +{
> +	return container_of(req, struct mtk_request, req);
> +}
> +
>   /* Wake up context wait_queue */
>   static inline void
>   wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned int hw_id)

After which....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

