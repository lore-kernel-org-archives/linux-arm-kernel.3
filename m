Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F62D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUzBJqhYDO5tEbzuZzamoZ8p2CpTScPUcBetzo+E5UY=; b=pWoRkXQq561C1/ratX8fsI7yw6
	0R9wrVEN6geHrYRS3h3aj9c9L5nCdTWTj3ncBrIg1a3XFs5oSMRWXQaOH60V0Ghjw9qMZCnyl9Pzs
	wUC0jFjO6JBFawphBA7DQpZO4gIq9Epu42N7piMP5P7W/cG4I3FfoaXOWxczB1uk0KRXHjUxYtVkb
	xQm47bTIICH6nxzu391OFVzJKeSA9NHKb2egzf7u/tQ4k4sXqosN/EUCMxqCS2LJ2fNbVQ4JQhSJh
	GWopStcFgpn04kI4GEBeNxvpjw+3tzqmJ0Q6ZdJ//b7dqhRcEGaK8IMpgBq/NOJv61k+SYc/w55PU
	ks9l3LSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6HW-00000000rDr-3JYT;
	Fri, 12 Dec 2025 16:46:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6HS-00000000rDG-0k3A;
	Fri, 12 Dec 2025 16:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765557957; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l6tr3X4FUMEKGypIk7ZpzCZzqUL1yaMlTdltaYOLJAHr6JzX6LvihINsg/1SX3X6ZOgGQQ/Ct4zGv3A10+TaIMF0R5JKYegJwuaPRlJ5v5TvxbRHkaH1MgWY9oK8obBQhYMrICeKTfSUpMpFloxdAEzi4elzY3a6dh/Raz02LlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765557957; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cUzBJqhYDO5tEbzuZzamoZ8p2CpTScPUcBetzo+E5UY=; 
	b=OiJokjfBghdYyW2QkyTjK2r0EfJBCunSpL+AqF6trW9ZBuaELAC1bUr82X5yI5NHOvFtksoMvf+9NTuCv45nofHKmGpLjbbWoo331e6J8vEk0/u2UfKr1D8N/byNBmLS0WhlphikVXZrDUkKYsNUVuCVxljE1vEc7uMQWSFDGhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765557957;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cUzBJqhYDO5tEbzuZzamoZ8p2CpTScPUcBetzo+E5UY=;
	b=MVO4tr0ep1kR8p+ZWCnGrDONr5sKs5/03gmOes0LBUB278ZBCEpCR9lZSXzYJ1jg
	N4bFUN3JRIag8dewb8I/y4iPIA9qCzuG5PSJbFAXtxwWtnd1/YeOif5f87pj4jGfGf1
	QnYrM+mz4Jb+d9RMq0XJzzxz4ob76CBYJa8qlt/U=
Received: by mx.zohomail.com with SMTPS id 1765557954423718.2008254898692;
	Fri, 12 Dec 2025 08:45:54 -0800 (PST)
Message-ID: <511b524a-b573-42f6-8a11-7f0992f8f418@collabora.com>
Date: Fri, 12 Dec 2025 11:45:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps
 controls
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
 <20251022162459.271603-3-detlev.casanova@collabora.com>
 <3ff3c7f76e24fdc92d86be3f92b6947ef86abc25.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <3ff3c7f76e24fdc92d86be3f92b6947ef86abc25.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_084610_304878_C45F862F 
X-CRM114-Status: GOOD (  21.86  )
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

On 12/10/25 15:07, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 22 octobre 2025 à 12:22 -0400, Detlev Casanova a écrit :
>> The vdpu381 decoder found on newer Rockchip SoC need the information
>> from the long term and short term ref pic sets from the SPS.
>>
>> So far, it wasn't included in the v4l2 API, so add it with new dynamic
>> sized controls.
>>
>> Each element of the hevc_ext_sps_lt_rps array contains the long term ref
>> pic set at that index.
>> Each element of the hevc_ext_sps_st_rps contains the short term ref pic
>> set at that index, as the raw data.
>> It is the role of the drivers to calculate the reference sets values.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
>>   include/uapi/linux/v4l2-controls.h        | 61 +++++++++++++++++++++++
>>   include/uapi/linux/videodev2.h            |  2 +
>>   4 files changed, 91 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 85d07ef44f62..779936727505 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -418,6 +418,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		pr_cont("HEVC_SLICE_PARAMS");
>>   		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		pr_cont("HEVC_EXT_SPS_ST_RPS");
>> +		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		pr_cont("HEVC_EXT_SPS_LT_RPS");
>> +		break;
>>   	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
>>   		pr_cont("HEVC_SCALING_MATRIX");
>>   		break;
>> @@ -1173,6 +1179,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		break;
>>   
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		break;
>> +
>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>   		break;
>>   
>> @@ -1925,6 +1937,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>>   		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps);
>> +		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_lt_rps);
>> +		break;
>>   	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
>>   		elem_size = sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
>>   		break;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index ad41f65374e2..167286c9e424 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1233,6 +1233,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>>   	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
>>   	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:		return "HEVC Short Term Ref Sets";
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:		return "HEVC Long Term Ref Sets";
>>   	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Parameters";
>>   	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Group Entry";
>>   	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters";
>> @@ -1578,6 +1580,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   		*type = V4L2_CTRL_TYPE_U32;
>>   		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>>   		break;
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:
>> +		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:
>> +		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>>   	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
>>   		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
>>   		break;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 2d30107e047e..dd9e29afa155 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -2093,6 +2093,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
>>   #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
>>   #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
>>   #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_STATELESS_BASE + 407)
>> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 408)
>> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 409)
>>   
>>   enum v4l2_stateless_hevc_decode_mode {
>>   	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
>> @@ -2548,6 +2550,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
>>   	__u8	scaling_list_dc_coef_32x32[2];
>>   };
>>   
>> +#define V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED	0x1
>> +
>> +/*
>> + * struct v4l2_ctrl_hevc_ext_sps_st_rps - HEVC short term RPS parameters
>> + *
>> + * Dynamic size 1-dimension array for short term RPS. The number of elements
>> + * is v4l2_ctrl_hevc_sps::num_short_term_ref_pic_sets. It can contain up to 65 elements.
>> + *
>> + * @delta_idx_minus1: Specifies the delta compare to the index. See details in section 7.4.8
>> + *                    "Short-term reference picture set semantics" of the specification.
>> + * @delta_rps_sign: Sign of the delta as specified in section 7.4.8 "Short-term reference picture
>> + *                  set semantics" of the specification.
>> + * @abs_delta_rps_minus1: Absolute delta RPS as specified in section 7.4.8 "Short-term reference
>> + *                        picture set semantics" of the specification.
>> + * @num_negative_pics: Number of short-term RPS entries that have picture order count values less
>> + *                     than the picture order count value of the current picture.
>> + * @num_positive_pics: Number of short-term RPS entries that have picture order count values
>> + *                     greater than the picture order count value of the current picture.
>> + * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the current picture.
>> + * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in the source candidate
>> + *                  short-term RPS is included in this candidate short-term RPS.
>> + * @delta_poc_s0_minus1: Specifies the negative picture order count delta for the i-th entry in
>> + *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
>> + *                       picture set semantics" of the specification.
>> + * @delta_poc_s1_minus1: Specifies the positive picture order count delta for the i-th entry in
>> + *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
>> + *                       picture set semantics" of the specification.
>> + * @flags: See V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_{}
>> + */
>> +struct v4l2_ctrl_hevc_ext_sps_st_rps {
>> +	__u8	delta_idx_minus1;
>> +	__u8	delta_rps_sign;
>> +	__u16	abs_delta_rps_minus1;
>> +	__u8	num_negative_pics;
>> +	__u8	num_positive_pics;
>> +	__u32	used_by_curr_pic;
> Did you run pahole ? This one does not seem to align, it starts with 16bit
> offset. The remark is because 32bit and 64bit platform, and all compiler should
> have the same binary representation, otherwise it will break in some ways.

That's a good point. I moved abs_delta_rps_minus1 with the other __u16 
fields and changed flags to be 16 bits too.

Also changed flags to 16 bits in v4l2_ctrl_hevc_ext_sps_lt_rps.

> regards,
> Nicolas
>
>> +	__u32	use_delta_flag;
>> +	__u16	delta_poc_s0_minus1[16];
>> +	__u16	delta_poc_s1_minus1[16];
>> +	__u8	flags;
>> +};
>> +
>> +#define V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT		0x1
>> +
>> +/*
>> + * struct v4l2_ctrl_hevc_ext_sps_lt_rps - HEVC long term RPS parameters
>> + *
>> + * Dynamic size 1-dimension array for long term RPS. The number of elements
>> + * is v4l2_ctrl_hevc_sps::num_long_term_ref_pics_sps. It can contain up to 65 elements.
>> + *
>> + * @lt_ref_pic_poc_lsb_sps: picture order count modulo MaxPicOrderCntLsb of the i-th candidate
>> + *                          long-term reference picture.
>> + * @flags: See V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_{}
>> + */
>> +struct v4l2_ctrl_hevc_ext_sps_lt_rps {
>> +	__u16	lt_ref_pic_poc_lsb_sps;
>> +	__u8	flags;
>> +};
>> +
>>   /* Stateless VP9 controls */
>>   
>>   #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index becd08fdbddb..ae1d33fd37b7 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1981,6 +1981,8 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
>>   	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
>>   	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
>> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	= 0x0275,
>> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	= 0x0276,
>>   
>>   	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
>>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,

