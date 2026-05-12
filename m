Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1421CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liVM2EqeK6UO+mWFQsdjtalngmiYjIplysZ/U2oXbJw=; b=mYyK2dAJsva0TNSxI1m11yhwRx
	ujtqbqJ3Re9A6PgyCmZ0ESiXoJ3jV4Pvl6DWXxH6xLB83jvuj/1Okvfx3dtbWZsBJfuoE25x11lLi
	lJ6OjtZ3KYRZmAx6smCWp7k4AUZyq1+PfvGjvgFDRMJHkH7uQ/HP7B36fKG8VV6fJ6FgDxkaFpMKu
	cszCOHhxHqWLwS9BakP13FKP0qGYovSbTSjEUcngLrvxwnJHANh+qPrnOV+6o5KpePnw4ha9MuB8T
	7ZwrJCBl704QvcaU2ZByECHxa9hgtMz0kxUQ+q31NFM8HeT6a4OnS102n/1WiJQijoDz6Q6O9+d5C
	CEjOBZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoXs-0000000H7jB-1LAh;
	Tue, 12 May 2026 14:57:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoXp-0000000H7hC-2baA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:57:15 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMoXZ-0006ha-1B; Tue, 12 May 2026 16:56:57 +0200
Message-ID: <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
Date: Tue, 12 May 2026 16:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
 <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075713_657273_23139576 
X-CRM114-Status: GOOD (  25.53  )
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

On 5/8/26 11:18 PM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Avoid odd frame sizes for YUV formats, as they may cause undefined
>> behavior. This is done in preparation for the RGA3, which hangs when the
>> output format is set to 129x129 pixel YUV420 SP (NV12).
>>
>> This requirement is documented explicitly for the RGA3 in  section 5.6.3
>> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
>> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
>> x/y offsets and stride aligning requirements. But the vendor driver for
>> the RGA2 also contains checks for the width and height to be aligned to
>> 2 bytes.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index f599c992829dd..77b8c7ab74274 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   	struct rga_ctx *ctx = file_to_rga_ctx(file);
>>   	const struct rga_hw *hw = ctx->rga->hw;
>>   	struct rga_fmt *fmt;
>> +	struct v4l2_frmsize_stepwise frmsize = {
>> +		.min_width = hw->min_width,
>> +		.max_width = hw->max_width,
>> +		.min_height = hw->min_height,
>> +		.max_height = hw->max_height,
>> +		.step_width = 1,
>> +		.step_height = 1,
>> +	};
>> +
>> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
>> +		frmsize.step_width = 2;
>> +		frmsize.step_height = 2;
> I think its fine like this, so let's start with:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> But it does not feel like a hardware alignment to me. When we process in
> software these things, the minimum alignment is bound to the subsampling, since
> there is no way to store half or quarter pixels, the padded width/height
> requires a step that follow the subsampling, something like:
>
> 		frmsize.step_width = finfo->hdiv;
> 		frmsize.step_height = finfo->vdiv;

I agree that this looks better. My main intention is to be more 
conservative, as the Rockchip related code/docs seem to always ensure a 
2 pixel alignment in both directions even for formats like YUV422, where 
we shouldn't have an alignment requirement in the height. Besides the 
vendor driver and TRM mentioned in the datasheet, the librga and it's 
docs also mention an alignment of 2 (pixels?!) for all YUV formats (see 
format alignment list in [1] and Q2.5 in [2]).

Given that the driver currently doesn't have any way to get the cores 
unstuck/reset in case of a hang, I'd like to play it more safely by 
adhering to what the vendor does instead of trying to do more and 
therefore allowing some potential breaking format. E.g. I've also 
experimented with sizes of 68x2, which the librga allows as input/output 
of the RGA3 (whereas the TRM specifies a min size of 128x128), but 
quickly dropped it as it produced some interesting broken outputs.

Sincerely
     Sven


[1] 
https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Developer_Guide_RGA_EN.md#image-format-alignment-instructions

[2] 
https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_FAQ_RGA_EN.md

>
> Nicolas
>
>
>> +	}
>>   
>>   	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
>>   		const struct rga_frame *frm;
>> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   	if (!fmt)
>>   		fmt = &hw->formats[0];
>>   
>> -	pix_fmt->width = clamp(pix_fmt->width,
>> -			       hw->min_width, hw->max_width);
>> -	pix_fmt->height = clamp(pix_fmt->height,
>> -				hw->min_height, hw->max_height);
>> -
>> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
>>   	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
>>   	pix_fmt->field = V4L2_FIELD_NONE;
>>   

