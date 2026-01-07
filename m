Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175CCE9D48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c74FSdrecbt1EpEviQ+M4vP8+WmSPSWHuIuhm36L4Ys=; b=E5fZX1wkeJ2HCLk9cXXs0M3RYW
	4AhOhGlhmElXPF5dYfhsW3TnFp3kGHWnQj1Hq+l72XfUAQujYJXAgk9QgEDSfJ9c8yBPEGc5a6BUm
	MyRHdGrAlPLa4buWmQOMSCLGDeA65P9RPWUUjf7ScBorzaQi7MQ/9MlzMBiOSn3cUmR9M4lSNFcQo
	r0++RLSq4EVmM82y+IFrcL0iegQtbsLuIsyVl6Z/YUny8wABHNJ1zfYLSo+1TN4g9YtgktopdP+qO
	QRgadt/1e2s0Iy0QZKzGr7wOs0DsFV9tcNAeqDhGu5yLSlLxFqdNnyxscXRApiradv1XKp9ps8MMf
	ghARIXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSDc-0000000Erlt-0lub;
	Wed, 07 Jan 2026 12:00:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSDZ-0000000Erkc-1kih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:00:50 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vdSDH-0006cS-Jw; Wed, 07 Jan 2026 13:00:31 +0100
Message-ID: <0dbdad63-df04-4220-96b6-b6af7e6e5a5f@pengutronix.de>
Date: Wed, 7 Jan 2026 13:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/22] media: rockchip: rga: prepare cmdbuf on streamon
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-10-989a67947f71@pengutronix.de>
 <8c3a3299036dd1bab158bdcd589abd027d2864b6.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <8c3a3299036dd1bab158bdcd589abd027d2864b6.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_040049_449982_36B0715F 
X-CRM114-Status: GOOD (  23.08  )
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

Hi,

On 12/24/25 4:29 PM, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 03 décembre 2025 à 16:52 +0100, Sven Püschel a écrit :
>> Prepare the command buffer on streamon to reuse it's contents instead of
>> completely writing it for every frame. Due to the stream settings being
>> fixed after a streamon we only need to replace the source and destination
>> addresses for each frame. This reduces the amount of CPU and memory
>> operations done in each frame.
> My speculation is that flushing to device is usually more expensive then this,

Yeah, it was an idea to maybe get a bit more performance. I didn't see a 
performance improvement after implementing it.

But I thought that it could be beneficial when the CPU is fully loaded 
(instead of my small test with an idle CPU). Therefore I've left it in.

Sincerely
     Sven

> but I didn't check closely if you have enabled the caches. That being said, this
> is good change. It highlight the inflexible nature of V4L2 imho, which in this
> case can be used to optimize.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
>>   drivers/media/platform/rockchip/rga/rga.c    | 13 ++++++++++++-
>>   drivers/media/platform/rockchip/rga/rga.h    |  1 +
>>   3 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index 56a2558539bfb..8cdfe089fd636 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -408,8 +408,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   {
>>   	struct rockchip_rga *rga = ctx->rga;
>>   
>> -	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>> -
>>   	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>>   	/*
>>   	 * Due to hardware bug,
>> @@ -418,11 +416,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
>>   
>>   	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
>> -	rga_cmd_set_mode(ctx);
>>   
>>   	rga_cmd_set_src_info(ctx, &src->offset);
>>   	rga_cmd_set_dst_info(ctx, &dst->offset);
>> -	rga_cmd_set_trans_info(ctx);
>>   
>>   	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
>>   
>> @@ -431,6 +427,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   				   PAGE_SIZE, DMA_BIDIRECTIONAL);
>>   }
>>   
>> +static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
>> +{
>> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>> +
>> +	rga_cmd_set_mode(ctx);
>> +	rga_cmd_set_trans_info(ctx);
>> +}
>> +
>>   static void rga_hw_start(struct rockchip_rga *rga,
>>   			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
>>   {
>> @@ -622,6 +626,7 @@ const struct rga_hw rga2_hw = {
>>   	.max_height = MAX_HEIGHT,
>>   	.stride_alignment = 4,
>>   
>> +	.setup_cmdbuf = rga_hw_setup_cmdbuf,
>>   	.start = rga_hw_start,
>>   	.handle_irq = rga_handle_irq,
>>   	.get_version = rga_get_version,
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index 592c977a07cf3..f02ae02de26ca 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -523,6 +523,17 @@ static int vidioc_s_selection(struct file *file, void *priv,
>>   	return ret;
>>   }
>>   
>> +static int vidioc_streamon(struct file *file, void *priv,
>> +			   enum v4l2_buf_type type)
>> +{
>> +	struct rga_ctx *ctx = file_to_rga_ctx(file);
>> +	const struct rga_hw *hw = ctx->rga->hw;
>> +
>> +	hw->setup_cmdbuf(ctx);
>> +
>> +	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
>> +}
>> +
>>   static const struct v4l2_ioctl_ops rga_ioctl_ops = {
>>   	.vidioc_querycap = vidioc_querycap,
>>   
>> @@ -547,7 +558,7 @@ static const struct v4l2_ioctl_ops rga_ioctl_ops = {
>>   	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>   
>> -	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamon = vidioc_streamon,
>>   	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
>>   
>>   	.vidioc_g_selection = vidioc_g_selection,
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
>> index 0aef348dddb95..93162b118d069 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -154,6 +154,7 @@ struct rga_hw {
>>   	u32 max_width, max_height;
>>   	u8 stride_alignment;
>>   
>> +	void (*setup_cmdbuf)(struct rga_ctx *ctx);
>>   	void (*start)(struct rockchip_rga *rga,
>>   		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>>   	bool (*handle_irq)(struct rockchip_rga *rga);

