Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C35CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM9Sb17d2wXHQmFbrZTrBs7g3dLHXZeM4mN9jnHjrl0=; b=emjWjq7kGWMrmHZrMv7UO45Mds
	27FpE8LToZJBxtKOQWtWLGUmebwzl5GBmfO0Wnm2JzxqRHuDKZDhFOGjhVBUtLmrxJokUhln4ZO8z
	t9Y4/o9vF7KkpTuV/j/VmvHgpSoICtmmJeM/MtAqNYzDi80PcXe4lKZsmMiU9GvRMZixe9cD91SuB
	yCilVS6kPPJC4+vsNdHt4ikNl0JBdYGJwAsq6Y9E4i0LKslKwg/mkUnI7vtcNeVuJwp85+91t7gKv
	mnQcmKMiU2hEsTfck8HP0+H6QqXBNAqozR1vsWvmLqyv0ZJdqoCj1cvUDmnhVMbedOWni9FSSyRq2
	BV7fPOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DI8-00000002Ugw-3X5e;
	Mon, 29 Sep 2025 12:47:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DI5-00000002Ug8-2DGP;
	Mon, 29 Sep 2025 12:47:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759150047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n/vEwH+icZvAJ+wPzCv3oMoOoJXMpjE6uyaRXrEdinYA5mUpUfd1RSxQHi1WRgkfBb3kfGtw8C+IEiliFF45xYRimVF48MHqSD2JUeUgdcQ+Qr2ldFocfgtRMpEEqim0kV0bHtWnsDVXZQLaGMhI1QFbHpf5tuz6+3SUSDnJbGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759150047; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eM9Sb17d2wXHQmFbrZTrBs7g3dLHXZeM4mN9jnHjrl0=; 
	b=Vmv/WoItTpQS0hRkpFSlxbfmbmZ/B3aYli3H6mgY9rqjcLZyIYCPxRXcciSvwPHVkPlBVVAB8TQ7dD1rXRVavmNSRRa25u9eMfYRJ1xbIG0ha8h0lU8/Hkmkml/6jIWS58/z2tdzHq0p8TwjKM4AsiyzTPhys2AiE3UpGyFPfjQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759150047;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eM9Sb17d2wXHQmFbrZTrBs7g3dLHXZeM4mN9jnHjrl0=;
	b=il1zHjhaaXVDFOdcexPGAxw/XiOtxreugDTpWq4k8JnCRu8KWgdyfr0agmmzKv/H
	EXZW4UdY7Mt/Eb4LxlZflVvqlBR/o6GzU8xepxcJ4Q2nueSKZZTVhwcXL76MJ8F2192
	gpiWbG6d/gdCP/Aq6ihti5lycHI6eQ2xrInKzagg=
Received: by mx.zohomail.com with SMTPS id 1759150044812903.0717172368667;
	Mon, 29 Sep 2025 05:47:24 -0700 (PDT)
Message-ID: <969d4f9d-457e-4188-8741-8d88dda59dc9@collabora.com>
Date: Mon, 29 Sep 2025 08:47:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381
 variant
To: Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-12-detlev.casanova@collabora.com>
 <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_054741_603973_F4126AC9 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Diederik

Thanks for spotting that ! I'll change it in the next patch set :)

Detlev.

On 9/20/25 11:07, Diederik de Haas wrote:
> Hi again,
>
> I think I've found a similar issue here as I did for H264.
>
> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
>> The VDPU381 supports HEVC decoding up to 7680x4320@30fps.
>> It could double that when using both decoder cores.
>>
>> It support YUV420 (8 and 10 bits) as well as AFBC (not implemented
>> here)
>>
>> The fluster score is 146/147 for JCT-VC-HEVC_V1, tested on ROCK 5B.
>> None of the other test suites works.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
>>   .../media/platform/rockchip/rkvdec/Makefile   |    2 +
>>   .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3435 +++++++++++++++++
>>   .../rockchip/rkvdec/rkvdec-hevc-common.c      |  546 +++
>>   .../rockchip/rkvdec/rkvdec-hevc-common.h      |  101 +
>>   .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
>>   .../media/platform/rockchip/rkvdec/rkvdec.c   |   81 +
>>   .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>   8 files changed, 4763 insertions(+)
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> index 5f3bdd848a2cf..3303b0ce32809 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
>> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
>>   	select VIDEOBUF2_VMALLOC
>>   	select V4L2_MEM2MEM_DEV
>>   	select V4L2_H264
>> +	select V4L2_HEVC
>>   	select V4L2_VP9
>>   	help
>>   	  Support for the Rockchip Video Decoder IP present on Rockchip SoCs,
>>
>> ...
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index dab34a2322c95..cd01f1e41beb5 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -257,6 +257,60 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
>>   	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
>>   };
>>   
>> +static const struct rkvdec_ctrl_desc rkvdec_hevc_ctrl_descs[] = {
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
>> +		.cfg.ops = &rkvdec_ctrl_ops,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>> +		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
>> +		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> +		.cfg.menu_skip_mask =
>> +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> +		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> +		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>> +		.cfg.dims = { 65 },
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>> +		.cfg.dims = { 65 },
>> +	},
>> +};
>> +
>> +static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
>> +	.ctrls = rkvdec_hevc_ctrl_descs,
>> +	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>> +};
>> +
>>   static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_NV12,
>> @@ -276,6 +330,17 @@ static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>   	},
>>   };
>>   
>> +static const struct rkvdec_decoded_fmt_desc rkvdec_hevc_decoded_fmts[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV12,
>> +		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV15,
>> +		.image_fmt = RKVDEC_IMG_FMT_420_10BIT,
>> +	},
>> +};
>> +
>>   static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
>>   	{
>>   		.cfg.id = V4L2_CID_STATELESS_VP9_FRAME,
>> @@ -354,6 +419,22 @@ static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
>>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>   	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
>> +		.frmsize = {
>> +			.min_width = 16,
>> +			.max_width = 65472,
>> +			.step_width = 16,
>> +			.min_height = 16,
>> +			.max_height = 65472,
>> +			.step_height = 16,
>> +		},
> In the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size" :
> 64x64 to 65472x65472; step size 16 pixels
>
> So I think .min_width and .min_height should be 64, not 16.
>
> Cheers,
>    Diederik
>
>> +		.ctrls = &rkvdec_hevc_ctrls,
>> +		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
>> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> +		.decoded_fmts = rkvdec_hevc_decoded_fmts,
>> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +	},
>>   };
>>   
>>   static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] = {
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index acb9d72b130bb..df56bc0516ac9 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -173,6 +173,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>>   
>>   /* VDPU381 ops */
>>   extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
>> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops;
>>   
>>   /* VDPU383 ops */
>>   extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;

