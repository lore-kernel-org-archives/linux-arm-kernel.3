Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A480CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 23:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=; b=pn/GnqpHvYOUNpwUBsujVhgjSU
	yoIHPazO8npJR0osnmJxGcJ9U5HFHbCXfvKl1i8LFCT0P/ygddGMR24HFB5txMl+faXymI+O5YeHy
	HlKx1L3dAlOc5oNBvzm2cZG/BmirtfzjLsxL7sWEZd36IImR4JDCfLDq/X4Z5K+6ty5qIrtwuvvx3
	RP48qD8Nv0Zi09m3p1QSLT2f73WxujIHXZ8tfHXOIpziEbMdbRolaLuEJc4DebqMzMhWbypJ5mkOS
	bHpw3ETSP68QkxOm4T2R7gSFJiE02JsH7HvVICn55R7ADJ59lc5O0HjK6nUDSyBStj6muPpiGN57+
	51pNfj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbl2-00000009MVh-42w8;
	Mon, 11 Aug 2025 23:16:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZlV-000000093ry-0uPI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Aug 2025 21:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=; b=SVIb+nSS8eBeP0EpqstYt/qtUJ
	RWnIzAj/+fv+LnSvuiTeTSrPPVBsX13mL5XI1bhNKI6JDK3NRQ7r+RiCTcF/MrzP6DVGcA50m8i5O
	yU/asrF7+UK8r8XMpXr0L/PdR9Cr0G6FaNOAQuEpHklLO+kBumUB621wyRqN2NCA9ttOCeUAZYovK
	O5xouqAj0unRvdoKIF4e7QSOdFGAeiEvrErokrBSHfsw4Rd4AmWXPikx5K/LWBp9zR6wmW9nT/h5Y
	coCndvgvd1CRLkCUWqGc0SJ7VmH7+5YIPy6CD8xxVr1CmyY6aAz40DAcTyob3KgMPds2zZTJ5Oqqc
	hXEvIiUg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZlR-0000000FXYD-2k93
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 21:09:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so41455595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754946543; x=1755551343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=;
        b=knvwQzprVDJQ+laTHldLZPInks7EpDRg34vWLp3UTG6xpQ7aiQh/IYaU0pCNz/lYnq
         z1fdrdbyXDhRlaiwzF6F79d/VgCExqDXw6WO1E6Ipl8t6p/z8EmAauvcW0nMURtbucxc
         cfI8o8yuyrE+bM2brpJWI8yzOfu+roeLjSyIl+y30/k5DdkoabbPkmG1I4AX5Y03rY1m
         bIBOOYoe1gvsqHE3g7n1UXE1CJAyIHfPqPhJBpPhr2JDV58HCDR2d/Duvc3lUgIXt/Jv
         ukC/7znK/IdRYYet4JWCFaPUp/GPJE8xFhC3cs954mymR1syMkzUD3EpGrlgK0N+eqg1
         PXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754946543; x=1755551343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nd6uUzXaSR6qkFSyGw/hvNkLx6tLkM/B6UqTDLBsI0=;
        b=TFaBpC4bIfwHYYY90zWqXNJeoNHabKe2e6FdbQiyEd06Zq6uuyTNXsB/ODdIc3aisD
         NW1HACh5t52SRUEO0CHVmMbdZ+LpaXLxwGYlNvFOV4IpBpBu+BJjKjrkhFO9oPZ5YtM6
         Lyt4kxqp2aDdNAynMqM6mtolya7o7lRVIwJNpoz0/P0uLKRbCSx+bgBzuP59KB9s3cQP
         RJBng/n6ebOMsVuCuzUmJjFcnpm9NYF8f/aWFFfqXjZ3JHP0s+G7ze6+8NDe8lkFq6+Y
         xLt0a/YR1ZfQgbLxFj/kwJeolGiT/oVvkOehOSG3ZXjLagkZNMjxGs0QX51uPv9PxF0a
         UteQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Pf2HVjF/K8A5Dc0uYZRighFkt8242PqiQyneMPiwNXiP/toEHpN82hvkMv4/LI0fy7PDoqs/YlmnOmJH7jvL@lists.infradead.org
X-Gm-Message-State: AOJu0YyUTS+Z8KBlSCVKnFN0Zv0eMJmHgRvMGd5pGpxrYZSDOTd/ocPZ
	rp7i8F0QFiSCxK8Z4e6YMZoKxlMlHHKsmvlC5od80PDOuAOImglpCrgb
X-Gm-Gg: ASbGncuVpmJk+rkqVBC8Gq5hOrbn9ZDpSzu3oFzSpkwZQu1SwyYpCW1oWoCpiXaqoQk
	Z3/VYfaO/cbGbD+M8MvxNYFAgUFOwoHHev41i7OpDjg+ZBG8X7u2tllKQoPLKuO9p20cCNRfdBh
	b49WBO6Z67A8ZbU/v3sP4g9PjEAPHLqWU6Bgr5xa9GpQwNZO46rYrY9bmFgEHFQEUsnjwWVtdx3
	2pDaINyYQCzh0XqVBeUAB7IZFfS4taWYe6ESxDhpROXgWXeoaU6nudG0IhIa0gHO9vUUtSFsTgr
	r+0E4gpLH7U8Ca9hIiqdIIfIqqc8loUiP2MysLux9N5Atby7yTbT3fFmoxMcFOngIVFuYR9VUJ0
	DIqTV8J6o+HTXkfseUrROGNENRqYNh2DKne3588UpEYI=
X-Google-Smtp-Source: AGHT+IErQtpmXh1g8vSy5qbvpdmc6lj7oC4wS4Sz70CDtHckb2+a4JBWdmZXp8VmbH4r/uUE6PKmGw==
X-Received: by 2002:a05:600c:a03:b0:458:bc2c:b2ed with SMTP id 5b1f17b1804b1-459f4e9e7dfmr125883185e9.7.1754946542542;
        Mon, 11 Aug 2025 14:09:02 -0700 (PDT)
Received: from [192.168.1.3] ([41.40.216.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f8b1bc81sm19679242f8f.69.2025.08.11.14.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 14:09:02 -0700 (PDT)
Message-ID: <1df2b47e-74d1-4232-957a-21d7a6f5da1d@gmail.com>
Date: Tue, 12 Aug 2025 00:08:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: atmel-hlcdc: replace dev_* print funtions with
 drm_* variants
To: Manikandan.M@microchip.com
Cc: skhan@linuxfoundation.com, Dharma.B@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250807190857.92431-1-eslam.medhat1993@gmail.com>
 <d26192c9-bba0-4fb8-aff8-fc4164a89a73@microchip.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <d26192c9-bba0-4fb8-aff8-fc4164a89a73@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220905_851280_3241F667 
X-CRM114-Status: GOOD (  22.44  )
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


On 8/11/25 11:54, Manikandan.M@microchip.com wrote:
> Hi Eslam Khafagy,
Hi Manikandan,
>
> The patch appears to have been sent with spaces in place of
> tabs in the diff, which breaks kernel coding style [1] and makes it fail
> to apply.
> Please ensure your editor is configured to use tabs for indentation and
> use `git send-email` or b4 directly, not via an email client that may
> alter whitespace.

Thank you for the feedback.

But i have rechecked the patch. I don't seem to have altered any tabs 
with spaces.

>
> Could you please run checkpatch.sh and fix any reported errors or
> warnings before submitting the patch?

checkpatch.sh only reports two warnings:

WARNING: 'funtions' may be misspelled - perhaps 'functions'?
#78:
Subject: [PATCH v3] drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants
                                                           ^^^^^^^^

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#95:
https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

but no errors regarding tabs or spaces.
I'll fix the first one in v4. can you confirm indeed i have not altered tabs with spaces first?

>
> [1] Documentation/process/coding-style.rst
>
> On 08/08/25 12:33 am, Eslam Khafagy wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Update the Atmel HLCDC code to use DRM print macros drm_*() instead of
>> dev_warn() and dev_err(). This change ensures consistency with DRM
>> subsystem logging conventions [1].
>>
>> [1]
>> https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter
>>
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>> v3:
>> * include header file to fix compilation. Thanks Manikandan.
>>
>> v2:
>> * replace dev_dbg with drm_dbg  in atmel_hlcdc_plane.c
>> * https://lore.kernel.org/all/20250806183049.52112-2-eslam.medhat1993@gmail.com/
>>
>> v1:
>> * replace dev_* print funtions with drm_* variants
>> *https://lore.kernel.org/all/20250806000141.239753-2-eslam.medhat1993@gmail.com/
>>
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 ++++++++++---------
>>    drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  3 ++-
>>    .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  6 +++---
>>    4 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 0f7ffb3ced20..e0efc7309b1b 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -20,6 +20,7 @@
>>    #include <drm/drm_atomic_helper.h>
>>    #include <drm/drm_crtc.h>
>>    #include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_print.h>
>>    #include <drm/drm_probe_helper.h>
>>    #include <drm/drm_vblank.h>
>>
>> @@ -215,32 +216,32 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>>                   if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
>>                                                !(status & ATMEL_XLCDC_CM),
>>                                                10, 1000))
>> -                       dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
>> +                       drm_warn(dev, "Atmel LCDC status register CMSTS timeout\n");
>>
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
>> @@ -269,32 +270,32 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
>> index 50fee6a93964..0b8a86afb096 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> @@ -15,6 +15,7 @@
>>    #include <drm/drm_bridge.h>
>>    #include <drm/drm_encoder.h>
>>    #include <drm/drm_of.h>
>> +#include <drm/drm_print.h>
>>    #include <drm/drm_simple_kms_helper.h>
>>
>>    #include "atmel_hlcdc_dc.h"
>> @@ -92,7 +93,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
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

