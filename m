Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFF6C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/oZwA3AlTNfmx4P7C3GWExCuKTHEtbzFqxGSx8S9/k=; b=4+2tlKBJ4tf+D/AfVTO8xH/zEd
	LhDmNuvAyhU8vv8Jbif2K6clg7bvKe/FjbpOcgJaX/On9ZuI2SvKgGfqCO31Z5HWcdfaTI6RT7lnE
	fvfHuIogTR5/ngyfg8ns8AGGq/j4uUnrvK3VkfoOrwWHhkxkfc0BwgFqij6IhJ1EOUIMJNJSfkCd6
	aC7Uy9gX0FzTiAmLGO7Rt6Z3AaH7KXW7TuUV61MXFBBEtNLPAYVNgbadUsrUhXNgQLgWMNrBOXYYg
	VPbOU2ucXGHdKKlNZd8s9YuBrYuindO1qj+fx62p3ygsDn95CPwRXqaAm0E+gSRnozaIvnGWqNYha
	vrA8QuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugb0P-0000000Fqao-0koR;
	Tue, 29 Jul 2025 03:27:57 +0000
Received: from mail-m158216.netease.com ([47.251.158.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugavY-0000000Fq0Y-2TCV;
	Tue, 29 Jul 2025 03:22:59 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d8de167e;
	Tue, 29 Jul 2025 11:22:50 +0800 (GMT+08:00)
Message-ID: <63226b37-1dec-4998-b2b6-e969ca786f37@rock-chips.com>
Date: Tue, 29 Jul 2025 11:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] drm/rockchip: analogix_dp: Apply
 drmm_encoder_init() instead of drm_simple_encoder_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-4-damon.ding@rock-chips.com>
 <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9854344c1803a3kunmbc6d5ef53b5bbd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklKGlZIHx1LHkkeSx9DH09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LiMF/V4rH3QqRzk0VLBeqKLCLbx/NP1Emxe528xmhWl9Zye0NFzYX4UPlWJWn/fBxk/znUKcFCVyqFWK/urEAE3LRP6IEmQNllUopbTDUvA9KZ7BnHHZB1R5zzAf8eLa+eIeuBYiAe2DouhqA3FKqaEfD9JHKsZvXXMvHM6RQTY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=n/oZwA3AlTNfmx4P7C3GWExCuKTHEtbzFqxGSx8S9/k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_202257_454704_B758156D 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Dmitry,

On 2025/7/26 8:12, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 04:02:53PM +0800, Damon Ding wrote:
>> Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
>> the cleanup automatically through registering drm_encoder_cleanup() with
>> drmm_add_action().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index d30f0983a53a..4ed6bf9e5377 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -29,7 +29,6 @@
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_probe_helper.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   
>>   #include "rockchip_drm_drv.h"
>>   
>> @@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>>   							     dev->of_node);
>>   	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>   
>> -	ret = drm_simple_encoder_init(drm_dev, encoder,
>> -				      DRM_MODE_ENCODER_TMDS);
>> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> 
> It's not possible to use drmm_encoder_init() here. Per the documentation
> the encoder data structure should be allocated by drmm_kzalloc().
> However this drm_encoder is a part of struct rockchip_dp_device. It's
> allocated by rockchip_dp_probe() via devm_kzalloc(). This means that it
> can potentially be freed before the drm device is completely released,
> creating a use-after-free error.
> 
>>   	if (ret) {
>>   		DRM_ERROR("failed to initialize encoder with drm\n");
>>   		return ret;
>> -- 
>> 2.34.1
>>
> 

Got it. This patch will be dropped in the next version.

Best regards,
Damon


