Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9983C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP4bmdXmXS3DS6R8vDn0Rac2upM01LYINyBFr62ugPo=; b=QVM0ic5b9xb/OI5asU2P0KRE1J
	UsSeisKRWBv5h1EYO5Ae1TU2ZESckMZsROG357Yd+prNxUIFminmlUwNX7X7za4uzofMdD4zciPrN
	ZKcta+jL7E+SVg38n0LCpD0+PVjm5H3pPGeAGl5+vcO3jOmIBSsZhgCYaGqmLwaP+fJX945B27nfC
	iz/9+HtjRVYe/1wTOMLTGop4y+Hn18jMGbkxLLm1TSOCJ9SLal+KZl0Vfr7/YXHCJ33T0wU/8AsWM
	FilftOPjBs5pvW2RsdCOttLwOF3/W80RPlZL0uHAb961U6fkxNLjc3rijD85+SSONmapDehvv7H0X
	FVh8i1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRml-0000000GNrw-0Yac;
	Mon, 24 Aug 2026 10:20:11 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRmf-0000000GNqP-2gz9;
	Mon, 24 Aug 2026 10:20:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787566799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MjlXq010zON+lhCukkiDKvUkuY8wnt1XnNGvuBKXbURyCVOL4FS47MC31P2QnjSKZiE9XZk7xLR9OrxBjSn3LT8druCQf9oql09xzqfsBSiDVniQXQAyvZcRvGGnOcMeg05nSqfdkPkyOiSm8rt/tTYj0Y6tQZoC+oqmm+EZELA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787566799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kP4bmdXmXS3DS6R8vDn0Rac2upM01LYINyBFr62ugPo=; 
	b=meWbWJYT3NkBsUR8+RQuHM6446urMJohtPi8nJNa1x5wjk2gP2zBi5aZE0RxlhHBJlTyoa0KNtHsZ852hObqb4DnFF0MFpXVGXGAF4jhrwpgAwSdPqd36RVojLhEi9RB7j6Umf9oQrkdI5z4VHqSoK09e8ccvhqiYiU9ogFhTXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787566799;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kP4bmdXmXS3DS6R8vDn0Rac2upM01LYINyBFr62ugPo=;
	b=MXQa01zm9fNrYBbSS58u6mFLXD0DDjh4TsB9mkoL/a4eWFlrcAV7CdIMyGm4Ta4L
	47ISE3IjNS2kQidHF7n+t6Gr6zZkSiYGGKqtlxxg8XtFc9iDdd4vw1WZ0wPQM0DuIvR
	tjbdt+3rPSrCfAVH8tWkEjKFyUN96qb5A5NhZ77A=
Received: by mx.zohomail.com with SMTPS id 1787566797597783.6306751888679;
	Mon, 24 Aug 2026 03:19:57 -0700 (PDT)
Message-ID: <e6e917df-21d8-4641-9116-64fac30b8f63@collabora.com>
Date: Mon, 24 Aug 2026 12:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: verisilicon: Allow the EOS event to be
 subscribed
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
 <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_032006_375092_568E7CBF 
X-CRM114-Status: GOOD (  22.87  )
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
> hantro queues a V4L2_EVENT_EOS in three places.  vidioc_encoder_cmd()
> sends it when a V4L2_ENC_CMD_STOP has drained the encoder:
>
> 	if (ec->cmd == V4L2_ENC_CMD_STOP &&
> 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> 		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
>
> hantro_buf_queue() sends it for a capture buffer queued after the last
> one, and hantro_stop_streaming() when the output queue stops while
> draining.
>
> No application can ask for any of them.  The ioctl ops offer
>
> 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>
> and v4l2_ctrl_subscribe_event() only knows about V4L2_EVENT_CTRL, so
> VIDIOC_SUBSCRIBE_EVENT for V4L2_EVENT_EOS fails with -EINVAL and the
> queued events are dropped on the floor.  An application following the
> drain sequence in the stateful encoder documentation has to fall back to
> V4L2_BUF_FLAG_LAST, which hantro does set, so this has gone unnoticed.
>
> Dispatch on the event type and hand V4L2_EVENT_EOS to
> v4l2_event_subscribe(), the way coda-common.c does.  Everything else
> keeps going to the control handler.
>
> V4L2_EVENT_SOURCE_CHANGE is deliberately not added, hantro never sends
> one.
>
> Fixes: daf3999c12dc ("media: hantro: Implement support for encoder commands")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_v4l2.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 83af9fa1ce949..9e19daffe0075 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -765,6 +765,17 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
>   	return 0;
>   }
>   
> +static int hantro_subscribe_event(struct v4l2_fh *fh,
> +				  const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	default:
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +	}
> +}
> +
>   const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>   	.vidioc_querycap = vidioc_querycap,
>   	.vidioc_enum_framesizes = vidioc_enum_framesizes,
> @@ -787,7 +798,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>   	.vidioc_remove_bufs = v4l2_m2m_ioctl_remove_bufs,
>   	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>   
> -	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_subscribe_event = hantro_subscribe_event,
>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>   
>   	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>

