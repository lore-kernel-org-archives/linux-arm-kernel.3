Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z7GnmkTaAdXN+TwZ1qp0XZ2z7Z2RdV2bNh+iEGCPco=; b=mgAI6LibvT1ioOHwzM5uHv9TRg
	FqNemQAnNazaCa3Yjbn0tnYjDWvSXJ7EOJSksci0QZm0eMqsGApI7gd1MXtfG4/58/8qmy6VkfSrL
	STbj3cgI5g4WOQEC8BOVrL5xTT0q0vy4uZZIR472G97qZ6+WytTs1Bs687B5uqejnD7kmnuaha5YS
	MWXjOdBGdjv5rdUVJqZdil4Xft4p4xS40u7LWdeT2yVFpigG7AvS1/xLpWd8Z7lrvbzjhwgzFjQTy
	VoefStKS9IPYNXd7ixqJ2kzIEXlLZTGM9XHDWOn+nEM82GM15Y/gzHOc2e87OTIIn3ujsZ50nSSsm
	42DgfRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFf-000000091jC-02LF;
	Tue, 16 Sep 2025 20:26:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFK-0000000917v-3qJ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 20:25:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ea115556b2so1872770f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758054349; x=1758659149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Z7GnmkTaAdXN+TwZ1qp0XZ2z7Z2RdV2bNh+iEGCPco=;
        b=nnE7pvCsXVInckrUGu6ehAH5frxEZnG1EOJsR3kD22seP6z/BDtUp3t2tRuiMZ3ae3
         XsiOLNBqyRH9Vj5vDudj3GUnkbk/jVM7i48YN5kMu2of46S2+Xz0aw4nGIsVlkHHtKs9
         hddLZENiqZlckbhnii0k9wgq3KRtFlmk0JrWPF8vkO31H4zTmVo7dW0h5CGp16N4kOwN
         d1QIeIV73Y6jGhR9pCN6SpK6XGOz15mjxNI1CkRvUK0LdxcH3GxND+EN26ijaeOOvqDT
         z390ECedqfjI/3wJwPRVde+1bgeuQ6hPNUBSAcMvEvAn04LV01jBM+U8AMrKB3oB+Pzn
         xrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758054349; x=1758659149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z7GnmkTaAdXN+TwZ1qp0XZ2z7Z2RdV2bNh+iEGCPco=;
        b=EgP6k7hVWCx1cHx+rfh+I/pD0aZYuqncNEF6/L1p0VU1u22L+753lqguc1aqN8eSZt
         zs0C8Aw31z9pqzZhwQGYNY2LPG7XqmQW0K1rIyMiPqUk6TSPPwMABqZ9FY3UrSyGi1TX
         psnvo31JAHSzEvxSGh7iqkoy8x4nL+YVIrNDGI7RTcgiLNc1PbSS9+C4wo4K4vVjybiF
         4Nx807k9fp2rfXk1ydOVU1U7tJybmKXZQLIDHPmWJ6hH1A5p1wZOprqvK87diLweULu7
         kxwJakuOa04w5DPNUzQxL1EtqPYgU/hUoPFyiJjVV5a3KW5FeJSDgVJF9r3zaftZwNLr
         WcBw==
X-Forwarded-Encrypted: i=1; AJvYcCWFGajZ6MODvg11kqfsQ9sDVwcGp2b7IX7i+ShPgLH1BL/DmHcu+lWceMG5lWpViRBzQzeLgoRQXP7Z3AVx+77s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4yXEaYM/aynx/SWD6Y5Juqa13RxE0MpDb6OqyRw8xUT/8Un7Z
	hp+nSvcwlnEMeFJZMS240RvK4qSOCgQn+z0qJkyQ57D0ZC6rSQxvFkSE
X-Gm-Gg: ASbGnct6Pt+XT3cr5QpD0P46FDVnfEkrrL9RYcljB3cFX7vEqJZzn3cwEh2SMJcsLHV
	y034ANc5cbDP+UzATmamZfJND7s/fvMZit0u8aKdk4zSef6nHfCNITE9jvktcXKY8EsSVTudpX8
	QidTmh6e0BQCqSt5OUHZsp6BxEa1U5LNaEqGEIQ2vOVTLKjAHXsvO6sx06GD0gJ1ijQDH58UYVA
	ZOALXZP0a4mgVIU3OydrpuY6EwCIt3skxJ37w+jQLSRcB/rs0YJTy8UqLaWVZ4txMCwXeq4ofeg
	3t4N9IA+7k44gk28RdlhM2gCNPz5KRERdii1G7vLMTAsTm1hlZJem8agVdrhXpH6hs9JXjZPKDu
	KG5kijWeq8pBaJUnCy+UVWr/jWws86CrARk8=
X-Google-Smtp-Source: AGHT+IFYef1W20KdCqlCjiXb8p7T+iogcnhGNGzTT397wbKbR5kPv4DEsNQAhBPJAhFNJZRRTTSYYQ==
X-Received: by 2002:a05:6000:2209:b0:3cd:ac2b:7f0 with SMTP id ffacd0b85a97d-3e7659f3bccmr14918748f8f.49.1758054348300;
        Tue, 16 Sep 2025 13:25:48 -0700 (PDT)
Received: from [192.168.1.12] ([156.204.69.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613869528bsm7470655e9.14.2025.09.16.13.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 13:25:47 -0700 (PDT)
Message-ID: <2d3fd438-06db-4ba2-82f9-22a5c9267952@gmail.com>
Date: Tue, 16 Sep 2025 23:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: atmel-hlcdc: replace dev_* print functions with
 drm_* variants
To: Manikandan.M@microchip.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813224000.130292-1-eslam.medhat1993@gmail.com>
 <2e4334ac-ebd2-4686-8d5c-6d7a637a6d57@microchip.com>
 <CAFRctSHGG-7tx0o5-hi2pZbsw-9jGV1FZrFquOOnFAB=i+O8Gw@mail.gmail.com>
 <4e7faa33-6e39-4b9c-b5df-bccaa9cbb1cc@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <4e7faa33-6e39-4b9c-b5df-bccaa9cbb1cc@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132551_128762_412C9A77 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Manikandan,

Understood. thank you for the follow-up.

On 9/16/25 09:50, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
>
> I am still awaiting approval for my commit access request to the
> drm-misc repository. I will be able to apply your changes as soon as the
> access is granted.Thank you for your patience.
>
> On 14/09/25 3:49 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hello Manikandan,
>> This patch has been reviewed for a while now. but i didn't get an
>> update if it's been pulled yet or not .
>>
>> kindly can you kindly update if it's been pulled or not ?
>> thanks in advance.
>>
>>
>> On Mon, Aug 18, 2025 at 12:16 PM <Manikandan.M@microchip.com> wrote:
>>> On 14/08/25 4:09 am, Eslam Khafagy wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
>>>> dev_warn() and dev_err(). This change ensures consistency with DRM
>>>> subsystem logging conventions [1].
>>>>
>>>> [1]
>>>> Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>>>
>>>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>>> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>>>
>>>> ---
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 ++++++++++---------
>>>>     drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  3 ++-
>>>>     .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>>>     4 files changed, 23 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> index 0f7ffb3ced20..e0efc7309b1b 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>>> @@ -20,6 +20,7 @@
>>>>     #include <drm/drm_atomic_helper.h>
>>>>     #include <drm/drm_crtc.h>
>>>>     #include <drm/drm_modeset_helper_vtables.h>
>>>> +#include <drm/drm_print.h>
>>>>     #include <drm/drm_probe_helper.h>
>>>>     #include <drm/drm_vblank.h>
>>>>
>>>> @@ -215,32 +216,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 !(status & ATMEL_XLCDC_CM),
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>>>
>>>>                    regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 status & ATMEL_XLCDC_SD,
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>>>            }
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_DISP),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_SYNC);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_SYNC),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_PIXEL_CLK);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         !(status & ATMEL_HLCDC_PIXEL_CLK),
>>>>                                        10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>>
>>>>            clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
>>>>            pinctrl_pm_select_sleep_state(dev->dev);
>>>> @@ -269,32 +270,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_PIXEL_CLK,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_SYNC);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_SYNC,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register LCDSTS timeout\n");
>>>>
>>>>            regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_DISP);
>>>>            if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                         status & ATMEL_HLCDC_DISP,
>>>>                                         10, 1000))
>>>> -               dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>> +               drm_warn(dev, "Atmel LCDC status register DISPSTS timeout\n");
>>>>
>>>>            if (crtc->dc->desc->is_xlcdc) {
>>>>                    regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 status & ATMEL_XLCDC_CM,
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>>>
>>>>                    regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
>>>>                    if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>>>                                                 !(status & ATMEL_XLCDC_SD),
>>>>                                                 10, 1000))
>>>> -                       dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
>>>> +                       drm_warn(dev, "Atmel LCDC status register SDSTS timeout\n");
>>>>            }
>>>>
>>>>            pm_runtime_put_sync(dev->dev);
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> index fa8ad94e431a..acb017a2486b 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>>>> @@ -724,19 +724,19 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>>>>
>>>>            ret = atmel_hlcdc_create_outputs(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create HLCDC outputs: %d\n", ret);
>>>> +               drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
>>>>                    return ret;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_create_planes(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create planes: %d\n", ret);
>>>> +               drm_err(dev, "failed to create planes: %d\n", ret);
>>>>                    return ret;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_crtc_create(dev);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to create crtc\n");
>>>> +               drm_err(dev, "failed to create crtc\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>> @@ -778,7 +778,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>
>>>>            ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>>>>            if (ret) {
>>>> -               dev_err(dev->dev, "failed to enable periph_clk\n");
>>>> +               drm_err(dev, "failed to enable periph_clk\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>> @@ -786,13 +786,13 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>
>>>>            ret = drm_vblank_init(dev, 1);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to initialize vblank\n");
>>>> +               drm_err(dev, "failed to initialize vblank\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>>            ret = atmel_hlcdc_dc_modeset_init(dev);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to initialize mode setting\n");
>>>> +               drm_err(dev, "failed to initialize mode setting\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>> @@ -802,7 +802,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>>>            ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
>>>>            pm_runtime_put_sync(dev->dev);
>>>>            if (ret < 0) {
>>>> -               dev_err(dev->dev, "failed to install IRQ handler\n");
>>>> +               drm_err(dev, "failed to install IRQ handler\n");
>>>>                    goto err_periph_clk_disable;
>>>>            }
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> index 50fee6a93964..0b8a86afb096 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>>>> @@ -15,6 +15,7 @@
>>>>     #include <drm/drm_bridge.h>
>>>>     #include <drm/drm_encoder.h>
>>>>     #include <drm/drm_of.h>
>>>> +#include <drm/drm_print.h>
>>>>     #include <drm/drm_simple_kms_helper.h>
>>>>
>>>>     #include "atmel_hlcdc_dc.h"
>>>> @@ -92,7 +93,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
>>>>            output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
>>>>            of_node_put(ep);
>>>>            if (output->bus_fmt < 0) {
>>>> -               dev_err(dev->dev, "endpoint %d: invalid bus width\n", endpoint);
>>>> +               drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
>>>>                    return -EINVAL;
>>>>            }
>>>>
>>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> index 4a7ba0918eca..817284509b57 100644
>>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
>>>> @@ -1034,7 +1034,7 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>>>            if (isr &
>>>>                (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
>>>>                 ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
>>>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>>>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>>>                            desc->name);
>>>>     }
>>>>
>>>> @@ -1051,7 +1051,7 @@ static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>>>            if (isr &
>>>>                (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
>>>>                 ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
>>>> -               dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
>>>> +               drm_dbg(plane->base.dev, "overrun on plane %s\n",
>>>>                            desc->name);
>>>>     }
>>>>
>>>> @@ -1140,7 +1140,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
>>>>            if (state) {
>>>>                    if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
>>>>                            kfree(state);
>>>> -                       dev_err(p->dev->dev,
>>>> +                       drm_err(p->dev,
>>>>                                    "Failed to allocate initial plane state\n");
>>>>                            return;
>>>>                    }
>>>> --
>>>> 2.43.0
>>>>
>>> --
>>> Thanks and Regards,
>>> Manikandan M.
>>>
>>
>> --
>>
>> Eslam Medhat Khafagy
>>
>> https://www.linkedin.com/in/eslam-khafagy-a8a68159/

