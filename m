Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0AAF54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH0p07GOQGgxFnggDxBIntgpjM6eEkiCbLnr6koKf/I=; b=qXjRyte+hoVj6RDITqQDwQydfO
	7aM+FxYZMsHUdN/jqQiFytsGejgCDDi04l59XbdjUXJ5cQyJyji6clrzqY7nJRx268Xv2/nU9Sc4e
	398kLFzKcjaDwMV0oUz1LVE8hIRyciuSXlwerBBY0iGh7NBhH4TsDLva6612RPdWGsOLtjPKIKlIK
	fYoTC9IvR4c1Qe2WhTL2H/43q27EMspOo2wjeTT1wrI6FEob0X5pE5THIXaoJg8K7S49Y8aS5hEqB
	eOwR3K2KHCVRBwNi1got+YYfKqDxjDctf3zZDfDBPL7xhzfI5iclcyj7W5izTcKrkoXEwFFD1en8o
	83nNQSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54m2-00000001tsi-3jZP;
	Tue, 24 Mar 2026 16:38:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54m0-00000001trl-1Zjr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:38:33 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w54ll-0007mM-59; Tue, 24 Mar 2026 17:38:17 +0100
Message-ID: <b6b54f99-a55b-4faf-840d-75532e58fb39@pengutronix.de>
Date: Tue, 24 Mar 2026 17:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/27] media: rockchip: rga: check scaling factor
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
 <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
 <90da83de861e8268745255720554ad23341e6839.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <90da83de861e8268745255720554ad23341e6839.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_093832_427735_6C216DBA 
X-CRM114-Status: GOOD (  25.69  )
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

Hi Nicolas,

On 3/20/26 6:57 PM, Nicolas Dufresne wrote:
> Le mardi 27 janvier 2026 à 15:39 +0100, Sven Püschel a écrit :
>> Check the scaling factor to avoid potential problems. This is relevant
>> for the upcoming RGA3 support, as it can hang when the scaling factor
>> is exceeded.
>>
>> There are two relevant scenarios that have to be considered to protect
>> against invalid scaling values:
>>
>> When the output or capture is already streaming, setting the format on
>> the other side should consider the max scaling factor and clamp it
>> accordingly. This is only done in the streaming case, as it otherwise
>> may unintentionally clamp the value when the application sets the first
>> format (due to a default format on the other side).
>>
>> When the format is set on both sides first, then the format won't be
>> corrected by above means. Therefore the second streamon call has to
>> check the scaling factor and fail otherwise.
>>
>> As try functions should only be state aware if specified, the scaling
>> limitation is only done in s_fmt.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
>>   drivers/media/platform/rockchip/rga/rga-hw.h |  1 +
>>   drivers/media/platform/rockchip/rga/rga.c    | 47 ++++++++++++++++++++++++++++
>>   drivers/media/platform/rockchip/rga/rga.h    |  1 +
>>   4 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index dcd540ed3fd5b..7a4070665fed7 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw = {
>>   	.max_width = MAX_WIDTH,
>>   	.min_height = MIN_HEIGHT,
>>   	.max_height = MAX_HEIGHT,
>> +	.max_scaling_factor = MAX_SCALING_FACTOR,
>>   	.stride_alignment = 4,
>>   
>>   	.setup_cmdbuf = rga_hw_setup_cmdbuf,
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index f4752aa823051..fffcab0131225 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -14,6 +14,7 @@
>>   
>>   #define MIN_WIDTH 34
>>   #define MIN_HEIGHT 34
>> +#define MAX_SCALING_FACTOR 16
>>   
>>   #define RGA_TIMEOUT 500
>>   
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index 6947c472a8b01..fad921ddd8348 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
>>   	struct rga_ctx *ctx = file_to_rga_ctx(file);
>>   	struct rockchip_rga *rga = ctx->rga;
>> +	const struct rga_hw *hw = rga->hw;
>>   	struct vb2_queue *vq;
>>   	struct rga_frame *frm;
>>   	int ret = 0;
>>   	int i;
>> +	struct rga_frame *limit_frm = NULL;
>> +
>> +	/* Limit before try_fmt to avoid recalculating the stride */
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
>> +	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
>> +		limit_frm = &ctx->out;
>> +	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
>> +	    v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
>> +		limit_frm = &ctx->in;
>> +	if (limit_frm) {
>> +		const struct v4l2_frmsize_stepwise frmsize = {
>> +			.min_width = DIV_ROUND_UP(limit_frm->pix.width,
>> +						  hw->max_scaling_factor),
>> +			.max_width =
>> +				limit_frm->pix.width * hw->max_scaling_factor,
>> +			.min_height = DIV_ROUND_UP(limit_frm->pix.height,
>> +						   hw->max_scaling_factor),
>> +			.max_height =
>> +				limit_frm->pix.height * hw->max_scaling_factor,
>> +			.step_width = 1,
>> +			.step_height = 1,
> Is there a risk to re-introduce odd sizes ? Should this be the hdiv / vdiv
> values ?

I'm still calling try_fmt afterwards, which does all of the further 
clamping (min/max size supported by the core and the yuv step size). 
Therefore I don't see the risk of re-introducing invalid sizes. It's 
just an additional clamping only done in s_fmt to avoid the try_fmt 
getting stateful.

Sincerely
     Sven

>
>> +		};
>> +		v4l2_apply_frmsize_constraints(&pix_fmt->width,
>> +					       &pix_fmt->height, &frmsize);
>> +	}
>>   
>>   	/* Adjust all values accordingly to the hardware capabilities
>>   	 * and chosen format.
>> @@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, void *priv,
>>   	return ret;
>>   }
>>   
>> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst_size)
>> +{
>> +	if (src_size < dst_size)
>> +		return src_size * hw->max_scaling_factor >= dst_size;
>> +	else
>> +		return dst_size * hw->max_scaling_factor >= src_size;
>> +}
>> +
>>   static int vidioc_streamon(struct file *file, void *priv,
>>   			   enum v4l2_buf_type type)
>>   {
>>   	struct rga_ctx *ctx = file_to_rga_ctx(file);
>>   	const struct rga_hw *hw = ctx->rga->hw;
>>   
>> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
>> +	     v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) ||
>> +	    (V4L2_TYPE_IS_CAPTURE(type) &&
>> +	     v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)) {
>> +		/*
>> +		 * As the other side is already streaming,
>> +		 * check that the max scaling factor isn't exceeded.
>> +		 */
>> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
>> +		    !check_scaling(hw, ctx->in.pix.height, ctx->out.pix.height))
>> +			return -EINVAL;
>> +	}
>> +
>>   	hw->setup_cmdbuf(ctx);
>>   
>>   	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
>> index c741213710b32..454af283b1694 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -150,6 +150,7 @@ struct rga_hw {
>>   	size_t cmdbuf_size;
>>   	u32 min_width, min_height;
>>   	u32 max_width, max_height;
>> +	u8 max_scaling_factor;
>>   	u8 stride_alignment;
>>   
>>   	void (*setup_cmdbuf)(struct rga_ctx *ctx);

