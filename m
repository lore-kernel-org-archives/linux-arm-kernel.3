Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E82CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JlmyHDSwkIRsvpvBKpT31LPv1O4ptlHr2c6u5Zp1Gw=; b=NEzhRV7SHtsceKjgQnr4iSxNtj
	iifa/t2P5dd4+Y1hJJOU2NW2pE6Rx6GGpU3p2K7S6nolBhnoFnCws7AHS30IXTZv1dp8RcNLgzVBc
	32+Or1fpCn3dbgasq4qJQuczk/qo5GgBlCcyu1cBW1ufazHjaozIPKImIhJ3BPifMvFPE3TunYJOl
	ARFyrOqqZjGBvRMzOPrYl6/YC5bdduMAiLKb921AasdXpK8m57RK+v6oXtYW9pCi9SMtfw9xhvi0p
	5JnaTdesXcYg/Uxh6c9RP9KVKr2OBIX+ntRvvffY+osm2D3CHe4lpL+le9kV9RpuJWBpR/LC3uSAk
	Rk3PXBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAaV-00000002vqi-1ZSZ;
	Wed, 13 May 2026 14:29:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAaS-00000002vpu-3l3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:29:25 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNAaD-0002gm-FK; Wed, 13 May 2026 16:29:09 +0200
Message-ID: <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
Date: Wed, 13 May 2026 16:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate into
 separate function
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Philipp Zabel <pza@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
 <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072924_930089_5434DC1A 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Nicola,

On 5/12/26 4:15 PM, Nicolas Dufresne wrote:
> Le mardi 12 mai 2026 à 16:08 +0200, Sven Püschel a écrit :
>
>
>>> To stick with the spec, the capture format needs to be updated, and it needs to
>>> happen in a way user can be able to read it back for the correct frame if
>>> userspace make use of the queues. I see 3 options, let me know what you think,
>>> or what is later implemented if you already thought about that.
>>>
>>> 1. Synchronously update the capture format width/height, document in the
>>> respective control this behaviour, leaving to userspace to remember which frames
>>> the change will apply to.
>>>
>>> This works nicely for this type of HW, but would be a bit complicated for a
>>> deinterlacer, since the buffering might be HW specific. It also make usage of
>>> queues harder, less independent.
>>>
>>> 2. Force a drain/stop/start for any 90 degree rotation
>>>
>>> This might impose a longer idle time for the converter core, and is kind of
>>> opposite of your commit message. But requires no spec work.
>>>
>>> 3. Emit SRC_CH, implement the drain procedure typical to decoder resolution
>>> change.
>>>
>>> Typically it means userspace can keep buffering on the OUTPUT queue, and once
>>> the LAST buffer is met, it can simply read the new format (and new stride, since
>>> due to alignment, this might be hardware specific) and toggle streamoff/on only
>>> on capture queue to reactivate the processing.
>>>
>>> The 3. is more complex for the driver, but its a proven race-free method for
>>> decoders already. 2 would be statusquo to get this series in, and we could post-
>>> poned more advance work for seamless 90degree rorations. 1., I don't really like
>>> that solution, it not quite generic enough.
>> I'll go with option 2 for now to keep it simple and improve the status
>> quo a bit.
> Works for me.

Philipp Zabel just mentioned that a 90 degree rotation would just cause 
the RGA to scale it to the output format (deforming if it isn't 
quadratic). The existing code already considers the rotation to set the 
scaling factor accordingly (which I've also missed in this commit. But 
the commit is dropped anyways in v6 due to the various footguns).

While I see that the V4L2_CID_ROTATE docs mention the need to set the 
format according to the chosen rotation, it feels like it's intended for 
non-scaling converters. So I don't see a problem to just allow the 
current state, as the user has to adjust the format anyways if he isn't 
interested in a deformed image (instead of blocking this potential rare 
use-case).

But I'd add a check in my scaling commit to also check in the streaming 
state that we don't set a 90 degree rotation causing the scaling factor 
to be exceeded (e.g. 1x2 -> 1x32 scales by 16, whereas 90 degree 
rotation causes a scaling factor of 32).

Sincerely
     Sven

>
> Nicolas
>
>> Sincerely
>>       Sven
>>
>>> feedback welcome,
>>> Nicolas
>>>
>>>> ---
>>>>    drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++-----------
>>>>    1 file changed, 34 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> index dac3cb6aa17d3..6c1956b04f6ba 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>>>>    	dest[reg >> 2] |= 0x7 << 8;
>>>>    }
>>>>    
>>>> -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>>>> +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
>>>> +{
>>>> +	u32 *dest = ctx->cmdbuf_virt;
>>>> +	union rga_src_info src_info;
>>>> +
>>>> +	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
>>>> +
>>>> +	if (ctx->vflip)
>>>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>>>> +
>>>> +	if (ctx->hflip)
>>>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>>>> +
>>>> +	switch (ctx->rotate) {
>>>> +	case 90:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>>>> +		break;
>>>> +	case 180:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>>>> +		break;
>>>> +	case 270:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>>>> +		break;
>>>> +	default:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
>>>> +}
>>>> +
>>>> +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
>>>>    {
>>>>    	struct rockchip_rga *rga = ctx->rga;
>>>>    	u32 *dest = ctx->cmdbuf_virt;
>>>> @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>>>>    		}
>>>>    	}
>>>>    
>>>> -	if (ctx->vflip)
>>>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>>>> -
>>>> -	if (ctx->hflip)
>>>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>>>> -
>>>> -	switch (ctx->rotate) {
>>>> -	case 90:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>>>> -		break;
>>>> -	case 180:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>>>> -		break;
>>>> -	case 270:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>>>> -		break;
>>>> -	default:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>>>> -		break;
>>>> -	}
>>>> -
>>>>    	/*
>>>>    	 * Calculate the up/down scaling mode/factor.
>>>>    	 *
>>>> @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>>>    
>>>>    	rga_cmd_set_src_info(ctx, &src->offset);
>>>>    	rga_cmd_set_dst_info(ctx, &dst->offset);
>>>> -	rga_cmd_set_trans_info(ctx);
>>>> +	rga_cmd_set_format_scale_info(ctx);
>>>> +	rga_cmd_set_flip_rotate_info(ctx);
>>>>    
>>>>    	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
>>>>    

