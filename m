Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C37C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TPOtzbmQGRV73MYqtxOj+BiN3+8SVX1XW9kMVr6SL8=; b=qI0jno5an/UHqi0lARijpg1/5v
	nb4INhFW9nDWEUiyWkvSXgBgfTFhnox2fEzTeKI40bXZGh/mCfTkGEQtyQaI0BOjgJEOJaC+VF+GK
	EA+pWaLZZnVI6M2AaS20ik0vjeqMhG9XQ+VAX7hEsmgTV8eZo5ERAMiZdmQksP1djXB1ebnYcFcKk
	K3/E+sjDCpbc5Sp4IJx2yU8ziFoVHcL6afj16uoApEcMlO+BOUzk41rGcGFfEFYGD+e4zTJGqDYvx
	LtbsPUzGkmA+SWp5bfhEqlRpdyS924tLdqjtwDAb1oiNgcQrtjopg9bAR6ALdXVqNoH4nQvOHiuVH
	vcqRlv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRl7-0000000GNcF-2HLl;
	Mon, 24 Aug 2026 10:18:29 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRl4-0000000GNbi-3iIW;
	Mon, 24 Aug 2026 10:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787566695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vty+lnonCfkUWiOF/SSVZY92GjXasmd1w9NuoRw8rVeRiWT3l4tVpmPwWzzQEmgyLKxIDgoUZSb0Uprk5CGPFZkKaNUiiKnBdbMCQ9nlBbchSPx+3AAQl/qWo/ZcpH5h24F4KgdMb8JTuPb0QzsKyDSAtxaCSQzdXivnzlxNbag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787566695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9TPOtzbmQGRV73MYqtxOj+BiN3+8SVX1XW9kMVr6SL8=; 
	b=Vy8wzpbbHQuasDws18W6snVeEqxdJEV4QS7zIsu3xZI0SEy5HmigOS28RgFlgOUcAhdmE5ejUM1rfd/fC9EZqEI1HbpEhc+yyt0HtQnfpiz9kg7Di2aeT07sgyA0tcdlHkOrAoRzZbeAeHFYue2wFvNu5ZNhno8lYgA4mMzuzAk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787566695;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9TPOtzbmQGRV73MYqtxOj+BiN3+8SVX1XW9kMVr6SL8=;
	b=XPtRbULAn4jq/NdvDbzor9DYIvRF+TpYBD26bQf5oh0UXtw5pn5Nnuk+TSx8+ZdR
	rgR4qxSBci5vHavVyIZd2WyntoGXqlGNDoI3lXynJB5p8opg+bZUTP0RqmAVB0N8aTp
	BBFaCrbWe/lio0FBrUoEKwd6Zsg3yQ3NH3lynOs0=
Received: by mx.zohomail.com with SMTPS id 1787566694200896.890085447856;
	Mon, 24 Aug 2026 03:18:14 -0700 (PDT)
Message-ID: <72c028ad-a7c5-45d8-b50f-b39cbca19879@collabora.com>
Date: Mon, 24 Aug 2026 12:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
 <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260824-rk3588-jpegdec-v1-1-180a30a2852d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_031826_959018_DCBC35F1 
X-CRM114-Status: GOOD (  37.20  )
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


Le 24/08/2026 à 08:39, Sascha Hauer a écrit :
> A codec ->run() operation that fails leaves three things behind, and they
> cannot be untangled one at a time, so fix them together.
>
> hantro_start_prepare_run() sets up the controls of the request attached
> to the source buffer, hantro_end_prepare_run() completes them again and
> arms the watchdog for the job that is about to be started. That pairing
> does not survive the error paths. The two ->run() operations that do
> reach hantro_end_prepare_run() arm a watchdog for a job that is never
> started: device_run() finishes the job synchronously via
> hantro_job_finish_no_pm() and nothing cancels the delayed work, so it
> expires two seconds later and aborts whatever unrelated job happens to be
> running by then.
>
> Split the two jobs hantro_end_prepare_run() would otherwise have to do.
> It keeps its meaning for the success path, complete the request and arm
> the watchdog, and a new hantro_abort_prepare_run() completes the request
> and nothing else for the error paths. Note the resulting invariant: after
> hantro_end_prepare_run() the ->run() operation must return 0, as the
> watchdog is armed and only the interrupt handler disarms it.
>
> rockchip_vpu981_av1_dec_run() then calls hantro_irq_done() on its error
> path and returns the error code to device_run(), which finishes the job a
> second time. The buffers have already been given back by then, so the
> second attempt trips the WARN_ON(!src) in hantro_job_finish_no_pm() and
> bails out. Without the watchdog change this at least reached the first
> finish by accident, because the cancel_delayed_work() in
> hantro_irq_done() returned true for the watchdog the error path had just
> armed. Neither behaviour is something to rely on, so drop the call and
> let device_run() clean the job up. No other codec calls hantro_irq_done()
> from ->run().
>
> That leaves device_run() itself. It takes a pm_runtime reference and
> enables the clocks, then on any subsequent failure jumps to a single
> err_cancel_job label that calls hantro_job_finish_no_pm() - which
> releases neither. Release the acquired resources there.
>
> This last part is what ties the three together. hantro_irq_done() ends up
> in hantro_job_finish(), which already drops the pm reference and disables
> the clocks, so as long as the AV1 error path still goes through it,
> releasing the same resources in device_run() would trip the
>
>    WARN_ON(core->enable_count == 0)
>
> in clk_core_disable() and underflow dev->power.usage_count. Conversely,
> as soon as a failed job no longer arms the watchdog, hantro_irq_done()
> stops releasing anything at all and the resources are leaked until
> device_run() takes over.
>
> The late_postproc setup is skipped on the error path as well. It is part
> of preparing the run, the hardware is not started and the next job
> configures it again, so hantro_abort_prepare_run() simply does not have
> it. Only the sunxi variant sets late_postproc, and its only decoder is
> VP9.
>
> Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@gmail.com>

> ---
>   drivers/media/platform/verisilicon/hantro_drv.c    | 35 ++++++++++++++++++++--
>   .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 +-
>   drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  3 +-
>   4 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..a9ebf856096e6 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -147,6 +147,18 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
>   	}
>   }
>   
> +/**
> + * hantro_end_prepare_run() - finish the preparation of a job and arm the
> + *			      watchdog
> + * @ctx:	context the job belongs to
> + *
> + * Complete the controls of the request that hantro_start_prepare_run() set up
> + * and arm the watchdog. The caller must go on and start the hardware, as only
> + * the interrupt handler disarms the watchdog again.
> + *
> + * A ->run() operation that gives up before the hardware is started must call
> + * hantro_abort_prepare_run() instead.
> + */
>   void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   {
>   	struct vb2_v4l2_buffer *src_buf;
> @@ -167,6 +179,21 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>   			      msecs_to_jiffies(2000));
>   }
>   
> +/**
> + * hantro_abort_prepare_run() - give up on a job before the hardware is started
> + * @ctx:	context the job belongs to
> + *
> + * Counterpart of hantro_end_prepare_run() for the error paths of ->run().
> + */
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src_buf;
> +
> +	src_buf = hantro_get_src_buf(ctx);
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->ctrl_handler);
> +}
> +
>   static void device_run(void *priv)
>   {
>   	struct hantro_ctx *ctx = priv;
> @@ -182,15 +209,19 @@ static void device_run(void *priv)
>   
>   	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>   	if (ret)
> -		goto err_cancel_job;
> +		goto err_pm_put;
>   
>   	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	if (ctx->codec_ops->run(ctx))
> -		goto err_cancel_job;
> +		goto err_clk_disable;
>   
>   	return;
>   
> +err_clk_disable:
> +	clk_bulk_disable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> +err_pm_put:
> +	pm_runtime_put_autosuspend(ctx->dev->dev);
>   err_cancel_job:
>   	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>   }
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 56c79e339030e..78100d1c7e850 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -895,7 +895,7 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
>   
>   	ret = start_prepare_run(ctx, &decode_params);
>   	if (ret) {
> -		hantro_end_prepare_run(ctx);
> +		hantro_abort_prepare_run(ctx);
>   		return ret;
>   	}
>   
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 13e573f1f19de..c6addab4d758b 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -431,6 +431,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
>   		     enum vb2_buffer_state result);
>   void hantro_start_prepare_run(struct hantro_ctx *ctx);
>   void hantro_end_prepare_run(struct hantro_ctx *ctx);
> +void hantro_abort_prepare_run(struct hantro_ctx *ctx);
>   
>   irqreturn_t hantro_g1_irq(int irq, void *dev_id);
>   void hantro_g1_reset(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..99ffb4a743764 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2192,8 +2192,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>   	return 0;
>   
>   prepare_error:
> -	hantro_end_prepare_run(ctx);
> -	hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
> +	hantro_abort_prepare_run(ctx);
>   	return ret;
>   }
>   
>

