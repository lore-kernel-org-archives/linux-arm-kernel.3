Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394F5C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=; b=h7d98PXcrNLzHr1vPt6UrA27kf
	GQBAe87Rvy5nKaWjkOUU/JT8whF4TpPwZ314nG4HA8C2TwIPBchLGLFhUizvPVGT7f5N5dS6O/olh
	b4dOvCugorTw0vxYR6cQQo74gNGdDv7pHuUx5zSzVn/lOd/QPfhpLC9tafSaeBgpVdiMcm7UzzbNY
	0SN3teVO2yJJkK1OrMQMB5LC2Tc51FlobN/kprky9BQ7KRO3dNiHSd4079Tg5yHpvGJXKRUstKevB
	g/Xly3Rw4acKFYdl037N99k+OLDBnkxweqepWGbJIglbO2kxniWrdwG2uYz+J2SXugoRsRohEyI6H
	S4jRhAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw7h-0000000AnBU-0bmc;
	Wed, 18 Jun 2025 16:58:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuOq-0000000AYBS-11oc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:08:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3141f9ce4d1so2856689a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750259307; x=1750864107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
        b=V4OHuDcNtVD5YolUSvniuDHdOHd5NPP1Xd+QNrPehdStw/eQ8YbypI+tV0UnP8xc4V
         b0oNzxVZ1jcXxCPcKGmP+teygSig+jfNYx107Rxq4YWC6RCXT7lLjjhCcCytOLBc1l/8
         i1E7eVP6LTQgXpfzNrVsH72y5CWba2Jg1dMqfx3MQ/xgJ633eiaXik6FwgY+Kn45Iov0
         /4/YwgBNTnbeWo3FkxrlQR/FO4+Dk78ifWf1HKb/nW78oBpmaGH7XWtcbM1rCCHAQXdr
         n3NuEPfjjZmbjYPsK2erMrq+gdXUzkYbhHihJGvEQ581YKzYxZ52aF4nLmQA2b+g323H
         LBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259307; x=1750864107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
        b=OshNQ/BLFR2MQCJd1+oMn/VKlgXX5B2Rvcq5IWYA/A1H8CfnRhUU8e1G5Oi7whxw8q
         S/Ep7tN5ooKLhKRNJLqel/sO4W64W/sDwNXobooCOfewAH+GS1j2N/AFr6k5aX+N4btD
         4z4LRUauhO2+VNBhvtcf4mHtNiKwDtTOjPURm36Eby2+ukwcQCZwCWnhmVATgEg+VOH4
         p/xqqCBQO4RWSNcrWZERUOm+XBXyqA4iluo+mvSkcX1pNs+aBTzW07G7Tu++UNViSs2Y
         nP7Jd4rxQa97w+3IkT0Qm9DWGdiZ50T9ysrz0TMRIVWq7QvPyQhWbn66zfmq29mmurCt
         lU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDEFx8AllDOzyAsnC2vIRZpaozUH4yADQar75jS538OUNNZbN/dBbyyyTYtWxSm6TdmHv3gPML53oOVhp4tCO6@lists.infradead.org
X-Gm-Message-State: AOJu0YwOPqWGH+b0Ffpa/cs+Up1LE5dUg/nWxEc4SvmrXaOzQzeegbbg
	ttA5CzgtQalSAq0tWNr1PnpKl/MnkV3edJWOhzBXRT7AP1Zky8mYoEFJ
X-Gm-Gg: ASbGncsDEWkVo4dY1WFxrUg3hE8frWKQzIleTf0Grqz/8hNYcFsP1JI2R6wRsy2kcoL
	IFtv/ji/hmsh6iATj4myxtudnhXVW6+IPE7LNzny3ge7w30bePg3OlalXUpLVyCkXKgKu2OvoZg
	8/uusF4OLAiL9bfnuUFulYdIlJDGkq0Y/pBxQLMvdUJq94NE+Z9M+t6PXxn8uD2CD/oVPdGIwJ/
	mGSeZpDmkX4Azz7xtDviX3fB2IawGwP4Ww9jnBMiBsy24uakAMucmaPI9VqNotQw1FAzy0p4Wdl
	gGWdq4c7yZzHKcg6AA7AwnMcPMh4NV/fkd/GxjOuNAe4Mo6iTrW0VXDaURoyqooY23j6yw==
X-Google-Smtp-Source: AGHT+IGMfD1en+jAPfFZnyKfP/6fLNvoxSDJknXoysVlOSdS/kFg5+qkb2avdYMr18aUztSudZuFfA==
X-Received: by 2002:a17:90b:528d:b0:314:2a2e:9da9 with SMTP id 98e67ed59e1d1-3142a2e9e1cmr8449811a91.25.1750259307379;
        Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a22418dsm16968a91.9.2025.06.18.08.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Message-ID: <c7ff4ca4-da9c-4b86-893b-1ffd9fb0fb4f@gmail.com>
Date: Wed, 18 Jun 2025 23:08:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] backlight: apple_dwi_bl: Include
 <linux/mod_devicetable.h>
Content-Language: en-MW
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-8-tzimmermann@suse.de>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_080828_287254_D7975818 
X-CRM114-Status: GOOD (  11.76  )
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



On 18/6/2025 20:16, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/apple_dwi_bl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
> index 93bd744972d6..ed8bf13d3f51 100644
> --- a/drivers/video/backlight/apple_dwi_bl.c
> +++ b/drivers/video/backlight/apple_dwi_bl.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>

