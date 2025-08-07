Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF32C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+wSeTgD+KyHlh1LNjtbFb9cuhDfBkha0K0sJfYhWTQ=; b=CA5S5O58o4x7LKxJ2kepayykpU
	xFw1QbySdjF0TRHzYQ6RyRTelOsfvrsLml+uhkQ05Uo/zZWSw+sq0Y4MPRk5z4yKjvUMalmBtVGOc
	stFoFz9M8lgEkABX/Dg4Y8/vHuxXcq52KlSDH8L7x7FlOdUp7RtTuxA7HQk/6d0Z878wNBnaNSpmp
	VyEdavGv/wPgB5l+VCY/r5wC8e30MAFna3gFfIFqRG9/FHZJrBOByQO7cVEgxDawVSvATrez5h/HB
	mGTP6pUefm76eosx7T9NCymaTk4NLPnR3Z0UIiiFOTWUb6Em4j7IuN0gCzfmoLqR4pldWMyF1DdQ5
	/69A0ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5Td-00000001LRA-2ucQ;
	Thu, 07 Aug 2025 18:36:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5R6-00000001LF2-0KkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:33:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so12647805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754591634; x=1755196434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+wSeTgD+KyHlh1LNjtbFb9cuhDfBkha0K0sJfYhWTQ=;
        b=iUJQCq/9cpIJwBEkufZcpu/55wcuDvjdSqugJ8VP8IUKllMugpmSd3662C7MEgWSRB
         gJD6cDq9ca+hvl52C6I4pff8oW5lUkHvnaHGoeVLv4ROOvYiER+pYCRSGg5qPw8/cZUT
         yAxfexMlXb/BX/0YkW49gzpFRGU92UaFynm6raR9f1VenoAAFTXQv9L7qyHFYQl2h1bD
         sWGelnVP2t52itGGKG7xskm0SSHtEC1dW/0JDoZfV+wFQA67kM/+VgLyT6Sdkuj62btT
         UkIun7lpWhozjnBo7Xw+rZHodXNwnq9mAKM56RTXs2RRhrLaIex+24Rr2IO3PYH/N7/l
         dtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754591634; x=1755196434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+wSeTgD+KyHlh1LNjtbFb9cuhDfBkha0K0sJfYhWTQ=;
        b=Kn3ee7kUQYrWGJLVkJBEcTkk7X1m4KYEnNL3Bxykx+YmgZ4V4AavFSwhBQm/7o25hj
         NszgEbXRWoUDBwYvjNtu/NyICvRyKzpaD+Krze/qhilVeIibcQSPRfKJrd/Hkd/utytf
         0x8LR4U5T2yJDzE02aToXxaBrEuaeo0O1NxZRO4TQSEIfUM/u8lITkze1dvJMmQPom3F
         QRxcDGJDCrzWEOw/vruv95hIMQmoJp3ck90iPgH9cDchkI0TiGwO8opY6MejhHOunhox
         CQDG4QfwhBvuFoI8mA6d42WEnzcjnH/A3pJGIwLAYPHyDbwl8eZ5qFXg4q+B6BtlDhTS
         HMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVayUT07TXF7FEJEhm0MBDRF2Io0TynszicmM+n5B/tUJonwmvhT51iJ1Lr8DE0RnD2ydw0DLkMsjRayJ/qWD75@lists.infradead.org
X-Gm-Message-State: AOJu0YzSHnZbjPAn0dJ8JSELbH8Swrt6wwwAMBU79g61cY8Zmxlrg32k
	lM7DfHPVBHDWwj4IBH2qhHntPWYoz6kq33M1BwXZhr/GQSUv927IkIIA
X-Gm-Gg: ASbGncsg/A0xf007ubJpZHHhID8c3ndmnwsGTNxaMHglGJs9aG5J3/3xFQ33s7dVPJz
	cr2BGErJMcqapm/B7HlpNNRXK4HAQuGTPkcCKnn6iqiEtGMxk/+M4EVMzxYd0E65mxb9GXSYobL
	/uYHb28zk0J6JbZSkVEVon6a1vG831IJ3WiJtFcsi7gVYXFS5zPyxgE4XdoemcJjxz2aeYu4n8M
	cuaQwSuk2sU19jP0BK4GR6NuGS263BMDdgKVfixmogRDvL3r53YgcIuZinTerJrg7kZwuAfdEQg
	MgBfhLBkEt0EJnVXrVPNFhUMLYdLAKeSiPHQa6ldiRJ1j8ISkXrgX+VKdn0lDSGJis2U/fnWx1C
	G5swi47qjfMOG8R0lvXUplUIW9xinh85Sz7E=
X-Google-Smtp-Source: AGHT+IFb4+WXBcmMoW0cDyf2/cXHSKSUU3eLFCEXiDD/KNdBemcmwemt2zGCACE2Ixg6JsmlwXBZMg==
X-Received: by 2002:a05:600c:a03:b0:459:d9a2:e952 with SMTP id 5b1f17b1804b1-459f4e9e738mr321815e9.1.1754591633873;
        Thu, 07 Aug 2025 11:33:53 -0700 (PDT)
Received: from [192.168.1.3] ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e577d0f5sm104736335e9.0.2025.08.07.11.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 11:33:53 -0700 (PDT)
Message-ID: <0856a87c-9f7f-41c8-a35b-49d90094e5b1@gmail.com>
Date: Thu, 7 Aug 2025 21:33:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm: atmel-hlcdc: replace dev_* print funtions
 with drm_* variants
To: Manikandan.M@microchip.com
Cc: skhan@linuxfoundation.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
 <20250806183049.52112-2-eslam.medhat1993@gmail.com>
 <09cc3c77-d5e8-47d2-9bbe-f82b5a8a8447@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <09cc3c77-d5e8-47d2-9bbe-f82b5a8a8447@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_113356_132676_D6FE03F7 
X-CRM114-Status: GOOD (  18.42  )
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


On 8/7/25 10:05, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
>
> On 07/08/25 12:00 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> According to documentation[1] drm_* variants are preferred over dev_*
>> print functions.
>>
>> [1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>
>> v1->v2
>> replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c
> The change logs should be placed after Signed-off-by and below a
> separate 3 dash lines.
ok
> IMO
> The commit message can be -
> 'Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
> dev_warn() and dev_err(). This change ensures consistency with DRM
> subsystem logging conventions [1].
>
> [1]
> https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter'
yes it's better . thanks.
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
>>    drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>    4 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 0f7ffb3ced20..da94ab0540bb 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -215,32 +215,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_CM),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
> The files atmel_hlcdc_crtc.c and atmel_hlcdc_output.c failes to compile
> due to missing headers for drm_(warn/err) macros.
yes. thanks for pointing this out. i was already planning for a fix 
today in v3.
>>                   regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                status & ATMEL_XLCDC_SD,
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>           }
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_DISP),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_SYNC),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        !(status & ATMEL_HLCDC_PIXEL_CLK),
>>                                       10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>
>>           clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
>>           pinctrl_pm_select_sleep_state(dev->dev);
>> @@ -269,32 +269,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_PIXEL_CLK,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_SYNC,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>
>>           regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
>>           if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                        status & ATMEL_HLCDC_DISP,
>>                                        10, 1000))
>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>
>>           if (crtc->dc->desc->is_xlcdc) {
>>                   regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                status & ATMEL_XLCDC_CM,
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>
>>                   regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_SD),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>           }
>>
>>           pm_runtime_put_sync(dev->dev);
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index fa8ad94e431a..acb017a2486b 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -724,19 +724,19 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>>
>>           ret = atmel_hlcdc_create_outputs(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create HLCDC outputs: %d\n", ret);
>> +               drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
>>                   return ret;
>>           }
>>
>>           ret = atmel_hlcdc_create_planes(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create planes: %d\n", ret);
>> +               drm_err(dev, "failed to create planes: %d\n", ret);
>>                   return ret;
>>           }
>>
>>           ret = atmel_hlcdc_crtc_create(dev);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to create crtc\n");
>> +               drm_err(dev, "failed to create crtc\n");
>>                   return ret;
>>           }
>>
>> @@ -778,7 +778,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>
>>           ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>>           if (ret) {
>> -               dev_err(dev->dev, "failed to enable periph_clk\n");
>> +               drm_err(dev, "failed to enable periph_clk\n");
>>                   return ret;
>>           }
>>
>> @@ -786,13 +786,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>
>>           ret = drm_vblank_init(dev, 1);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to initialize vblank\n");
>> +               drm_err(dev, "failed to initialize vblank\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>>           ret = atmel_hlcdc_dc_modeset_init(dev);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to initialize mode setting\n");
>> +               drm_err(dev, "failed to initialize mode setting\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>> @@ -802,7 +802,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>           ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
>>           pm_runtime_put_sync(dev->dev);
>>           if (ret < 0) {
>> -               dev_err(dev->dev, "failed to install IRQ handler\n");
>> +               drm_err(dev, "failed to install IRQ handler\n");
>>                   goto err_periph_clk_disable;
>>           }
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> index 50fee6a93964..945a475c33ac 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> @@ -92,7 +92,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>>           output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
>>           of_node_put(ep);
>>           if (output->bus_fmt < 0) {
>> -               dev_err(dev->dev, "endpoint %d: invalid bus width\n", endpoint);
>> +               drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
>>                   return -EINVAL;
>>           }
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> index 4a7ba0918eca..817284509b57 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>> @@ -1034,7 +1034,7 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>           if (isr &
>>               (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
>>                ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>                           desc->name);
>>    }
>>
>> @@ -1051,7 +1051,7 @@ static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>           if (isr &
>>               (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
>>                ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>                           desc->name);
>>    }
>>
>> @@ -1140,7 +1140,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
>>           if (state) {
>>                   if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
>>                           kfree(state);
>> -                       dev_err(p->dev->dev,
>> +                       drm_err(p->dev,
>>                                   "Failed to allocate initial plane state\n");
>>                           return;
>>                   }
>> --
>> 2.43.0
>>

