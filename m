Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE0C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3guYpEVe0jojtjWvcu73KPb7DZ8REKqlzshck7w5p0=; b=OXbcU0mkz6V4bvPeFqMSnw99PD
	5M0a5wlnVsUfPxwndL2KCIztcCR0lp+GYQNMeoDl4PU1xIisHotHyf7RWCEmL+TxSBbD4+57AGu9c
	FCgeyYqtnFL8Z6I7HfbjNZCEaMwCDFGWvK3C9uV9URzqpRfJ6a6mn16hoJtik1kcE0fAkYIjgVWfK
	tRwdtMG7Wu04TJtmO2PGEFJ0ZNYM4breJxsvQpZlFjwJ5kbfkS+DYs1BSYVErmPKUWmKK8d08SQB+
	YG69d7yMSyH4HZ5ux6QjCoO3uHcOSh/bAnPaquZRRd5VXiJLUPwFjsVSexARM+AXSXZAEwAlkbUS5
	3YXOgLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EJ0-00000000Zox-2RMx;
	Thu, 03 Sep 2026 20:45:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EIw-00000000Zm9-3mwP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:45:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a5d42684d7so23541a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788468300; x=1789073100; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3guYpEVe0jojtjWvcu73KPb7DZ8REKqlzshck7w5p0=;
        b=rLh2n31A1pRphJCMXf43KMRoepA8ooAidn/Pl2fXMGKyiO9jsc7gWgGJjqMnBUFgsB
         AiLDhrHVlp8W+J/9C/7FiDJyF6O8FyVoCutdRxIL+mHwmobUVUaKNkMupxc4EFzTC6Z2
         6hG34KymSkI0VCqcKWeQ/9OGenWgm4UyyrMcpXcISgW8ceLrfNLrQGDwHMVfryW0U733
         YVIurqMT82wZy834FMdxssz6o3z4I6ggrdY4/MvqURHaBF7VB9DsmxD6HBuGiCtaIKQg
         Bv6f0eD3+VrYj+6wS31mXiSAW1X3eiokszAP6YwqMHwsgyrl9cDfvlE8GZtwBS1rVrPd
         cEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468300; x=1789073100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3guYpEVe0jojtjWvcu73KPb7DZ8REKqlzshck7w5p0=;
        b=AeCEiN+f25ei/oYyf0e5A3A8Ig+x9jv6WPE9VRVZZjKo/3JNKCaJA0jWVgTyIN9cR0
         bMh4LVnqdkKsTXO6KJUvT5E8QiLkZ4KVOXuLKaLT3FrX3iM/HOCBDG8Btb7ThdR0SsSF
         Vz1rhSw8blWYnluz91dYsOW400lPUqPwVWPYSVWqxm6HOZjYdv8FV4tj+LBxiMw9XdEH
         tkLIXBVLfID1k65aVXJY6tnDYB4/ja9gTkYuQ9KcSlLedMrVGTWWA9MukFTzZqZChd75
         slPPJttXY5PLbwK03URTXq1y93fJmmomdoY8vhGe3XfkNZLQjMttPq1iK81ktD1wMp1o
         gutQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8NjCP79ei7Mp0qQm6BV0Md4mnxDGUUaO7noqqKGj6vMthEdHtgeNQdpM3Ei6AZFjp4Ki/nFp9nFdTaHzozqlU@lists.infradead.org
X-Gm-Message-State: AFuF++maShz1+NdduriHKKRehUdmFNtrIxv3Yi4pJ8bwGVhj5+afdBOX
	86FIyxZuUzUA80SX1rdKkq6yie+RgOexNPp91nxi2ePSgb2QChPDRn4T
X-Gm-Gg: AYBFou2tRdTzBaxH1j5GdXVKue3PfmZoH2xC8dvGwBbzv5KDUmm94Z3L2blE2YeEjEm
	gUfiBuVtN7YWVYzeRJRqoTjVqL5Mv7L55JXvKzoEqTzKSbJtZGBd+REi3/F7LvLvHPZjMOf3uqS
	YD39/9Odlvx2AtqlP9Gqb7N28Rf1KCx5PMdY1BXvw9M886Qii7ELqx8mg3QMX03ezLIJXm7N3yK
	mYQoIMVz2U2oHiPRKZYL3utc+AJukVTqMqs7yK4GSxJb8WuUD+xYLno4zO86dSA0BAR07c7vIx3
	4eeO/ZycRZHpDd0sEZXkJU12CVFQ19qRzWAhKz+IZ93GOVHJ+zFHDmuvsXnhpD7CoeRKrrpFNGd
	4lhEUui/6BhUoNBiSe9/SPdwDWoV7xLLo+lr3VlmL718hPTV3oXYB5fPej0uOQIPiLpEFfaVEQy
	Pwm4g15Rb2rgWXkL0nrKAyT9juQhiDTpveN4m2HDULTudskw3647ytapDR0lFO7uU+XeEYozI4a
	5AaNCarUpLLs1+B8DXCg26LXxlTAihhZfFLfw==
X-Received: by 2002:a05:6402:1d48:b0:6a0:d411:930d with SMTP id 4fb4d7f45d1cf-6a7e8d9b328mr180296a12.2.1788468300064;
        Thu, 03 Sep 2026 13:45:00 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm233448a12.7.2026.09.03.13.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:44:59 -0700 (PDT)
Message-ID: <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
Date: Thu, 3 Sep 2026 22:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to
 devm_drm_bridge_alloc() API
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>
References: <20260824-drm-v2-1-7f9273c6020b@gmail.com>
 <2814844.6tgchFWduM@diego>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <2814844.6tgchFWduM@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_134502_971015_E6C79ECE 
X-CRM114-Status: GOOD (  21.84  )
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

On 9/3/26 17:12, Heiko Stübner wrote:
> Am Montag, 24. August 2026, 12:21:19 Mitteleuropäische Sommerzeit schrieb Johan Jonker via B4 Relay:
>> From: Hüseyin BIYIK <boogiepop@gmx.com>
>>
>> The function devm_drm_bridge_alloc() is the new API for allocating DRM bridges.
>> This conversion was missed during the initial conversion of all bridges to
>> the new API.
>>
>> Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> index f28d6a883e09..39c65ee07caa 100644
>> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> @@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>>  			 DRM_MODE_ENCODER_TMDS, NULL);
>>  

>>  	hdmi->bridge.driver_private = hdmi;

Can this be removed?
See link/comment below.


>> -	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
>>  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
>>  			   DRM_BRIDGE_OP_EDID |
>>  			   DRM_BRIDGE_OP_HDMI |
>> @@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
>>  	int irq;
>>  	int ret;
>>  
>> -	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>> -	if (!hdmi)
>> -		return -ENOMEM;
>> +	hdmi = devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
>> +				     &rk3066_hdmi_bridge_funcs);
>> +	if (IS_ERR(hdmi))
>> +		return PTR_ERR(hdmi);
> 

> If I'm reading things correctly, the parts in rk3066_hdmi_register setting
> hdmi->bridge.driver_private (should use the container field of struct
> drm_bridge instead) 

The driver_private line was added with this patch:

[PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
https://lore.kernel.org/all/20250428102309.1501986-1-andyshrk@163.com/

and hdmi->bridge.funcs are redundant by this change?

Not redundant, just funcs are attached in a common function __devm_drm_bridge_alloc()

https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/drm_bridge.c#L383

void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
			      const struct drm_bridge_funcs *funcs)
{
	void *container;
	struct drm_bridge *bridge;
	int err;

	if (!funcs) {
		dev_warn(dev, "Missing funcs pointer\n");
		return ERR_PTR(-EINVAL);
	}

	container = kzalloc(size, GFP_KERNEL);
	if (!container)
		return ERR_PTR(-ENOMEM);

	bridge = container + offset;
	INIT_LIST_HEAD(&bridge->list);
	bridge->container = container;
	bridge->funcs = funcs;
	kref_init(&bridge->refcount);

	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
	if (err)
		return ERR_PTR(err);

	return container;
}
EXPORT_SYMBOL(__devm_drm_bridge_alloc);

===========

Other example from sti:

https://lore.kernel.org/all/ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com/

>>>> It looks like you don't set bridge->driver_private anymore. Is it on purpose?
>>> This looks correct to me. In current code, driver_private is used to
>>> hold a pointer to the driver private struct (struct
>>> analogix_dp_device). With devm_drm_bridge_alloc() container_of() is now
>>> enough, no pointer is needed. With the patch applied, driver_private
>>> becomes unused.
>> Then we should remove it from the structure if it's unused.


drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac4531424d907f3983e919a7bda2b90ea0cede4f

============

This serie was missing a few bridges too many.

drm: convert all bridges to devm_drm_bridge_alloc()
https://patchwork.freedesktop.org/series/148229/

====

Please advise what changes are needed?
RK3066_hdmi is broken since somewhere 2025-05.

Johan


> 
> 
> Heiko
> 
> 
> 
>>  
>>  	hdmi->dev = dev;
>>  	hdmi->drm_dev = drm;
>>
>> ---
>> base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
>> change-id: 20260824-drm-e4689f65ab8c
>>
>> Best regards,
>>
> 
> 
> 
> 


