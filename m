Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A18CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPN3KyxMz8emyUFUk3HlxuaTyBLn7qeeJmHvt/BIWwI=; b=PtW+UGN5Kp5aIWmzMNFfd2DFOr
	3tgbTGu1EqmEQFBlDMhC5br9MTqn8A14E5wW504o5Q5DCdhTSJRP2BEtqAmIkvIjvZYLCspSpWV0g
	ajcEa9k4H6Rlbzve+SZgM0QReyy+9D8n0VxX0WgixLYJU8GwjNdbNRUlR+q8PfFQlrs3wo0M8+Mwv
	M7vbDO5MTWnZVyZ7GwzwqvXSvl8Pmw3gmmufYq91/SbykuWiv3WnVnebSr7z4MAgFAKoXzMxLBq2X
	rtlEQB1/53PRVDO+0YKFfhOsYrU1RD7wX7o7mjI/IQWxMljDV8Ht28hH6CdrWu2U+8j1HIkCy377S
	ujzhqXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ba2-00000005Hqs-1Jwo;
	Thu, 25 Sep 2025 02:19:34 +0000
Received: from mail-m10104.netease.com ([154.81.10.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bZz-00000005Hof-3XpN;
	Thu, 25 Sep 2025 02:19:33 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23f99a352;
	Thu, 25 Sep 2025 10:19:27 +0800 (GMT+08:00)
Message-ID: <be24f371-3afa-47ce-a5e8-26f3fac9b6ba@rock-chips.com>
Date: Thu, 25 Sep 2025 10:19:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/17] drm/bridge: analogix_dp: Remove panel disabling
 and enabling in analogix_dp_set_bridge()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-16-damon.ding@rock-chips.com>
 <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997eab1b8503a3kunm2418fa8d88dbd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGksfSFZLQ0NNT0tPSB1JGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GsGZ+ILQSnhzfvkwCAq4Z5+SIR0C9MOYar77DGQSbSeGev+Jr7L0Oq+AJf75d65bd6zyRrxMuhWK8gclELJ4evu+yYA7/9XQBUMFnRBep9EUwls+dIUpkvslnvd0hq55ReRjD8rAi0041WcrraaNBRTCVlfzPkJmY1YFlPIkZ8k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RPN3KyxMz8emyUFUk3HlxuaTyBLn7qeeJmHvt/BIWwI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_191932_101344_68D41C7D 
X-CRM114-Status: GOOD (  17.74  )
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

On 9/12/2025 7:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:44PM +0800, Damon Ding wrote:
>> The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
>> help turn on/off the backlight to make the image visible, and the
>> backlight operations are even needless if drm_panel_of_backlight() or
>> drm_panel_dp_aux_backlight() is applied, in which case the enabling
>> and disabling process just add necessary delays.
> 
> Not necessary, it can actually be turning the panel off and on. Maybe
> it's worth squashing this patch into the panel_bridge conversion as it
> will point out that these functions are still being called at a correct
> times by the DRM bridge framework.
> 

Will do in v6.

>>
>> Therefore, it should make sense to remove panel disabling and move
>> panel enabling after analogix_dp_set_bridge() finished.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 66d0cca1f268..c98058e9c917 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>>   {
>>   	int ret;
>>   
>> -	/* Keep the panel disabled while we configure video */
>> -	drm_panel_disable(dp->plat_data->panel);
>> -
>>   	ret = analogix_dp_train_link(dp);
>>   	if (ret) {
>>   		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
>> @@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>>   		return ret;
>>   	}
>>   
>> -	/* Safe to enable the panel now */
>> -	drm_panel_enable(dp->plat_data->panel);
>> -
>>   	/* Check whether panel supports fast training */
>>   	ret = analogix_dp_fast_link_train_detection(dp);
>>   	if (ret)
>> @@ -1156,6 +1150,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
>>   		if (analogix_dp_set_bridge(dp) == 0) {
>>   			dp->dpms_mode = DRM_MODE_DPMS_ON;
>> +			drm_panel_enable(dp->plat_data->panel);
>>   			return;
>>   		}
>>   		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon


