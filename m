Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD1CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQUv8vLQEGFq/E/1HB622NsBhZUYgOGID1QtOn2tk0Y=; b=YKcYIcC0CdO9m4dLB6ag6K+1ZV
	LruPYjX4Fp+4hIL5u3Q/FLHbu70c3hoyI5cBtmppIKDPHWuwSXU/++mfL0YWl3EaXf6USZLPk1e4e
	vj+Ych5bGGFyBrdC2jSulu2T9VgOa8WYKJ4n8idFwkGlZe14vvQPvbvpFw7+0ozCB575itLjww5Uv
	IFV+7OWPEmj0B8X+pY5AtqGzhYsOGVXpxmYSODo4gcD+qzrgbc/bDGX0xPhVSE+q/hoTAt8La1UzX
	p713GAycDnm9LG/wNCpA4nA8Bfo0fWY/ANPd7F9ZntVaEOi8sUY5SHcXHjOyNXnehUfWCqqsVB+XV
	7kk7mlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gPU-0000000HAp5-0wvK;
	Mon, 06 Oct 2025 08:17:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gPS-0000000HAog-1Yic;
	Mon, 06 Oct 2025 08:17:31 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 243221FBC;
	Mon,  6 Oct 2025 10:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759738556;
	bh=aA/I3kEr0Ua0c+w7+YGuNFNBB4mnxQd6zoNE4ELw98c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iHfHZ9Gm4obkvzugFnjJr4sloUJvxTHwN7jxhwrAc3H8V2bbwJkgPc4ltqnLPAgQ1
	 zPrH4tWR2pX5c6OWYEkHSoMyPdQeu+X3pn+rDwb7VHk9UzC9hJrrTMKHOumF5DWESY
	 yj14aMQfqXdDin/+0Ymb0BRZ32Yw5kBKn4IbVed8=
Message-ID: <f64bdf69-bc06-4c83-9e7f-5de18fb64d47@ideasonboard.com>
Date: Mon, 6 Oct 2025 09:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-2-e6db94468af3@ideasonboard.com>
 <20251005001847.GB13055@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251005001847.GB13055@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_011730_560948_ADDE7C6C 
X-CRM114-Status: GOOD (  34.95  )
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

Hi Laurent, Jacopo

On 05/10/2025 01:18, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Mon, Sep 15, 2025 at 07:18:11PM +0200, Jacopo Mondi wrote:
>> With the introduction of common types for extensible parameters
>> format, convert the rkisp1-config.h header to use the new types.
>>
>> Factor-out the documentation that is now part of the common header
>> and only keep the driver-specific on in place.
>>
>> The conversion to use common types doesn't impact userspace as the
>> new types are either identical to the ones already existing in the
>> RkISP1 uAPI or are 1-to-1 type convertible.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
>> ---
>>   include/uapi/linux/rkisp1-config.h | 104 ++++++++-----------------------------
>>   1 file changed, 22 insertions(+), 82 deletions(-)
>>
>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>> index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..b90d94d3a852fb0af0fe447649487e9e80aca795 100644
>> --- a/include/uapi/linux/rkisp1-config.h
>> +++ b/include/uapi/linux/rkisp1-config.h
>> @@ -7,8 +7,13 @@
>>   #ifndef _UAPI_RKISP1_CONFIG_H
>>   #define _UAPI_RKISP1_CONFIG_H
>>   
>> +#ifdef __KERNEL__
>> +#include <linux/build_bug.h>
>> +#endif /* __KERNEL__ */
>>   #include <linux/types.h>
>>   
>> +#include <linux/media/v4l2-isp.h>
>> +
>>   /* Defect Pixel Cluster Detection */
>>   #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>>   /* Black Level Subtraction */
>> @@ -1158,79 +1163,26 @@ enum rkisp1_ext_params_block_type {
>>   	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
>>   };
>>   
>> -#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
>> -#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
>> +/* For backward compatibility */
>> +#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
>> +#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
>>   
>>   /* A bitmask of parameters blocks supported on the current hardware. */
>>   #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
>>   
>>   /**
>> - * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
>> - *					   header
>> + * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
>>    *
>>    * This structure represents the common part of all the ISP configuration
>> - * blocks. Each parameters block shall embed an instance of this structure type
>> - * as its first member, followed by the block-specific configuration data. The
>> - * driver inspects this common header to discern the block type and its size and
>> - * properly handle the block content by casting it to the correct block-specific
>> - * type.
>> + * blocks and is identical to :c:type:`v4l2_params_block_header`.
>>    *
>> - * The @type field is one of the values enumerated by
>> + * The type field is one of the values enumerated by
>>    * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
>> - * interpreted by the driver. The @size field specifies the size of the
>> - * parameters block and is used by the driver for validation purposes.
>> - *
>> - * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
>> - *
>> - * When userspace wants to configure and enable an ISP block it shall fully
>> - * populate the block configuration and set the
>> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
>> - *
>> - * When userspace simply wants to disable an ISP block the
>> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
>> - * driver ignores the rest of the block configuration structure in this case.
>> - *
>> - * If a new configuration of an ISP block has to be applied userspace shall
>> - * fully populate the ISP block configuration and omit setting the
>> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
>> - * in the @flags field.
>> - *
>> - * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
>> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
>> - * and not accepted by the driver.
>> - *
>> - * Userspace is responsible for correctly populating the parameters block header
>> - * fields (@type, @flags and @size) and the block-specific parameters.
>> - *
>> - * For example:
>> + * interpreted by the driver.
>>    *
>> - * .. code-block:: c
>> - *
>> - *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
>> - *		struct rkisp1_ext_params_bls_config *bls =
>> - *			(struct rkisp1_ext_params_bls_config *)block;
>> - *
>> - *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
>> - *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
>> - *		bls->header.size = sizeof(*bls);
>> - *
>> - *		bls->config.enable_auto = 0;
>> - *		bls->config.fixed_val.r = blackLevelRed_;
>> - *		bls->config.fixed_val.gr = blackLevelGreenR_;
>> - *		bls->config.fixed_val.gb = blackLevelGreenB_;
>> - *		bls->config.fixed_val.b = blackLevelBlue_;
>> - *	}
>> - *
>> - * @type: The parameters block type, see
>> - *	  :c:type:`rkisp1_ext_params_block_type`
>> - * @flags: A bitmask of block flags
>> - * @size: Size (in bytes) of the parameters block, including this header
>> + * The flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
>>    */
>> -struct rkisp1_ext_params_block_header {
>> -	__u16 type;
>> -	__u16 flags;
>> -	__u32 size;
>> -};
>> +#define rkisp1_ext_params_block_header v4l2_params_block_header
>>   
>>   /**
>>    * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
>> @@ -1594,21 +1546,7 @@ enum rksip1_ext_param_buffer_version {
>>   /**
>>    * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>>    *
>> - * This struct contains the configuration parameters of the RkISP1 ISP
>> - * algorithms, serialized by userspace into a data buffer. Each configuration
>> - * parameter block is represented by a block-specific structure which contains a
>> - * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
>> - * populates the @data buffer with configuration parameters for the blocks that
>> - * it intends to configure. As a consequence, the data buffer effective size
>> - * changes according to the number of ISP blocks that userspace intends to
>> - * configure and is set by userspace in the @data_size field.
>> - *
>> - * The parameters buffer is versioned by the @version field to allow modifying
>> - * and extending its definition. Userspace shall populate the @version field to
>> - * inform the driver about the version it intends to use. The driver will parse
>> - * and handle the @data buffer according to the data layout specific to the
>> - * indicated version and return an error if the desired version is not
>> - * supported.
>> + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
>>    *
>>    * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
>>    * When a new format version will be added, a mechanism for userspace to query
>> @@ -1624,11 +1562,6 @@ enum rksip1_ext_param_buffer_version {
>>    * the maximum value represents the blocks supported by the kernel driver,
>>    * independently of the device instance.
>>    *
>> - * For each ISP block that userspace wants to configure, a block-specific
>> - * structure is appended to the @data buffer, one after the other without gaps
>> - * in between nor overlaps. Userspace shall populate the @data_size field with
>> - * the effective size, in bytes, of the @data buffer.
>> - *
>>    * The expected memory layout of the parameters buffer is::
>>    *
>>    *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
>> @@ -1678,4 +1611,11 @@ struct rkisp1_ext_params_cfg {
>>   	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>>   };
>>   
>> +#ifdef __KERNEL__
>> +/* Make sure the header is type-convertible to the generic v4l2 params one */
>> +static_assert((sizeof(struct rkisp1_ext_params_cfg) -
>> +	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
>> +	      sizeof(struct v4l2_params_buffer));
>> +#endif /* __KERNEL__ */

This is where I was thinking v4l2_params_buffer_size could be used:


static assert(sizeof(struct rkisp1_ext_params_cfg) == 
v4l2_params_buffer_size(RKISP1_EXT_PARAMS_MAX_SIZE))

Dan

>> +
>>   #endif /* _UAPI_RKISP1_CONFIG_H */
>>
> 


