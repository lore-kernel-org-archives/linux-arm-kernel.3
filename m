Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6EE78D44
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmVyyltTZXCiISWlqL6e2pkka9bcBWHjYQjn85OjRHg=; b=wUJy3eVFHydI0TCKjSI/mCoaB7
	Dfl3Vyeo0+J+FJWRjMiTG9C3GItlvPDlyghcZ6aR/rXpxeGaWewDVSSJpNcfgoMukIWrehYFAYrpW
	2xGOA4p9gq5PkQR/mGygSO+bXjwUivRQegS/XvAYhhGMoYrcWXJrAx1YZHs20DB81qNiqk/ojgGoO
	pkxnE2+HOofaohLtZrnTAWGHSa/L43cUBgoh1YPW9h+maqzWk4KJE1IEew1iWxsdRmhgmi5/8NtLk
	FnNCthJ7N8xXX8OwqbHKgppTdJLAAVjDuvabUVOj9J6Rp7PhAGcQbG4Dt5oID4pGCGamXPKOHJwOz
	O7/ZUcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMty-0000000F3fn-1qdg;
	Mon, 09 Feb 2026 08:45:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMtw-0000000F3fG-00Wi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:45:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82318b640beso2128990b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 00:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770626746; x=1771231546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmVyyltTZXCiISWlqL6e2pkka9bcBWHjYQjn85OjRHg=;
        b=F9Npg2x8EAf3JxNAcLkOacdsJxQ5rBkcSXnuFgFHAg34HdQzxJXb7B3VZ/w2TP1Fj6
         zLbGkSaednIq//1+MdiOp58LwZ5gknVAOCfbbGF6MPcyz4OLT9KGjGTpAxyQbtO5LqPa
         C0O83kcmNf7eQzmi+A+EUH2mk1modnjGvimtxwCeAM71g3eFF8KrbQ2swmf7r0El4va6
         GLd/A7fn08jMYNkVfSr7i/xDXKVyimo90wDSWxhhV96wjh6RrLFVk8CiFGX0BgXIQ73N
         2X6iLse9mxUgpxKCmEWtq/Qfe05ske51vdaAS68FiwXfQReO4iLjC0vOUEh+yXORSrkD
         1zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770626746; x=1771231546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmVyyltTZXCiISWlqL6e2pkka9bcBWHjYQjn85OjRHg=;
        b=cTMWYR39c+k8ersEk4VZsPd7oniVVcQdnJlq8zwawTK/LbggnUTAFuTHtOwH5c9ZiE
         j6ihsmEuDj8l8s4ki6pBccA084jxlG+s8nKReFb+xDsLbM3Uym27PoMI4xsc+qQBwhv1
         XFWych30leyLfwcEpjguhhWni4jU9GlqwhKi+iXnnqE6A4fVA/we8/ZkTh7FUrfvlupD
         McWh4UCr5K4gOZjeeFGQj8ANljOOjt9sUCa+ObpfFx78n5tECPqf6OZBSdf1LN+Cdawq
         JC/6bP3Rthbep5Ds2yl4iM3yU0WUDvhBlz+f57czWXJFzcPa2ZT/yWeNyM2zCYQaGATf
         pXvw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1c7bbS7NjK6XLEYd9gfVo7BRPDxd1Yf4JUlxBuz6f4vGFHgr0TTBuVdNfcgnNMCeoT6q2oRl1zklGrrIBVax@lists.infradead.org
X-Gm-Message-State: AOJu0YxmG/N4L8r1KIzXZmk25tdZ94lI5kgqTtbq/CM5DxRqFqNuX4Ur
	LSDi/mRpCg2pxW3sG3hx/DnH02Ynw3fyftoRfbqojUd7y1jRJpAFB+WE
X-Gm-Gg: AZuq6aLZXrUJPBgrw6XaBk61FayGXkZTm5ORTjXNAbq7z0O0fEculs89yvPIIyeT+oo
	r1Um7BCg9hPuK/F+W7YenhrLm90jjIYNgEWsHEVZW3CjDFqoWMYnbQTl6BdevKn2fRPvnU9gz7o
	iuW5Bj4064l3eRYerqZmWNhmOoTvDVBVUOh9ghLW64fm7UB4pMTeXXtsPYEtOHuvoOfPOOQVZJ7
	auYeIJdoGdyA+YjkrZbLmeYL5r9rIg65zGrOGvGJhht9LhkEFSmu5DnlSJmsqRDwyzWUkTZEAME
	V2IDugFS6mv+SIQuQnpfI6d8YutQNsw0b7iEpGjJzeBxBvpFV7iIfqrbcMxcoOBuNuIBxfM9cS1
	UI8Lti4oTHofuq4sfe8rFgGbY9tyLPkJ4cM7dAwYIHvDHVM4bNAJ2sbrfaTfEh57RoNgxGKozqG
	pE67PerbOxTOviLof4+5WppBWpdPaF9GkdqORvj9dFH1K3py0F/EyZ9ZT0RA8qSzdn
X-Received: by 2002:a05:6a00:1949:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82441609809mr8859019b3a.6.1770626746380;
        Mon, 09 Feb 2026 00:45:46 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441695f7dsm10130745b3a.23.2026.02.09.00.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:45:45 -0800 (PST)
Message-ID: <f556ef68-dac3-4652-ac21-ea4bbb4e912c@gmail.com>
Date: Mon, 9 Feb 2026 16:45:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
To: Icenowy Zheng <uwu@icenowy.me>, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
 <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_004548_126883_C4BA3236 
X-CRM114-Status: GOOD (  13.18  )
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


On 2/6/2026 11:09 PM, Icenowy Zheng wrote:
> 在 2026-01-29星期四的 12:05 +0800，Joey Lu写道：
>> ========== 8< ============
>> +#endif
>> diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h
>> b/drivers/gpu/drm/nuvoton/ma35_regs.h
>> new file mode 100644
>> index 000000000000..0f4a7a13e7d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Nuvoton DRM driver
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + *
>> + * Author: Joey Lu <a0987203069@gmail.com>
>> + */
>> +
>> +#ifndef _MA35_REGS_H_
>> +#define _MA35_REGS_H_
>> +
>> +#define MA35_FRAMEBUFFER_CONFIG                   0x1518
> Please check my Verisilicon DC8200 driver, which is already part of
> drm-misc-next now.
>
> The display controller here seems to be a earlier one from
> Verisilicon.it looks like a DC8000, or maybe a more earlier one?

The DCU is a Vivante DCUltra IP rather than a DC8000 series.

It's an earlier generation display controller and was customized for 
Nuvoton, so it doesn't have a public model ID.

Because of that lineage, parts of the register layout and functionality 
remain similar to older DC IPs.

Please refer to MA35D1 datasheet for more details.

>> +#define MA35_FRAMEBUFFER_ADDRESS                  0x1400
>> +#define MA35_FRAMEBUFFER_STRIDE                   0x1408
>> +#define MA35_HDISPLAY                             0x1430
>> +#define MA35_HSYNC                                0x1438
>> +#define MA35_VDISPLAY                             0x1440
>> +#define MA35_VSYNC                                0x1448
>> +#define MA35_PANEL_CONFIG                         0x1418
>> +#define MA35_DPI_CONFIG                           0x14B8
>> +#define MA35_CURSOR_ADDRESS                       0x146C
>> +#define MA35_CURSOR_CONFIG                        0x1468
>> +#define MA35_CURSOR_LOCATION                      0x1470
>> +#define MA35_CURSOR_BACKGROUND                    0x1474
>> +#define MA35_CURSOR_FOREGROUND                    0x1478
>> +#define MA35_FRAMEBUFFER_UPLANAR_ADDRESS          0x1530
>> +#define MA35_FRAMEBUFFER_VPLANAR_ADDRESS          0x1538
>> +#define MA35_FRAMEBUFFER_USTRIDE                  0x1800
>> +#define MA35_FRAMEBUFFER_VSTRIDE                  0x1808
>> +#define MA35_INDEXCOLOR_TABLEINDEX                0x1818
>> +#define MA35_INDEXCOLOR_TABLEDATA                 0x1820
>> +#define MA35_FRAMEBUFFER_SIZE                     0x1810
>> +#define MA35_FRAMEBUFFER_SCALEFACTORX             0x1828
>> +#define MA35_FRAMEBUFFER_SCALEFACTORY             0x1830
>> +#define MA35_FRAMEBUFFER_SCALEFCONFIG             0x1520
>> +#define MA35_HORIFILTER_KERNELINDEX               0x1838
>> +#define MA35_HORIFILTER_KERNEL                    0x1A00
>> +#define MA35_VERTIFILTER_KERNELINDEX              0x1A08
>> +#define MA35_VERTIFILTER_KERNEL                   0x1A10
>> +#define MA35_FRAMEBUFFER_INITIALOFFSET            0x1A20
>> +#define MA35_FRAMEBUFFER_COLORKEY                 0x1508
>> +#define MA35_FRAMEBUFFER_COLORHIGHKEY             0x1510
>> +#define MA35_FRAMEBUFFER_BGCOLOR                  0x1528
>> +#define MA35_FRAMEBUFFER_CLEARVALUE               0x1A18
>> +#define MA35_DISPLAY_INTRENABLE                   0x1480
>> +#define MA35_INT_STATE                            0x147C
>> +#define MA35_PANEL_DEST_ADDRESS                   0x14F0
>> +#define MA35_MEM_DEST_ADDRESS                     0x14E8
>> +#define MA35_DEST_CONFIG                          0x14F8
>> +#define MA35_DEST_STRIDE                          0x1500
>> +#define MA35_DBI_CONFIG                           0x1488
>> +#define MA35_AQHICLOCKCONTROL                     0x0000
>> +#define MA35_OVERLAY_CONFIG                       0x1540
>> +#define MA35_OVERLAY_STRIDE                       0x1600
>> +#define MA35_OVERLAY_USTRIDE                      0x18C0
>> +#define MA35_OVERLAY_VSTRIDE                      0x1900
>> +#define MA35_OVERLAY_TL                           0x1640
>> +#define MA35_OVERLAY_BR                           0x1680
>> +#define MA35_OVERLAY_ALPHA_BLEND_CONFIG           0x1580
>> +#define MA35_OVERLAY_SRC_GLOBAL_COLOR             0x16C0
>> +#define MA35_OVERLAY_DST_GLOBAL_COLOR             0x1700
>> +#define MA35_OVERLAY_CLEAR_VALUE                  0x1940
>> +#define MA35_OVERLAY_SIZE                         0x17C0
>> +#define MA35_OVERLAY_COLOR_KEY                    0x1740
>> +#define MA35_OVERLAY_COLOR_KEY_HIGH               0x1780
>> +#define MA35_OVERLAY_ADDRESS                      0x15C0
>> +#define MA35_OVERLAY_UPLANAR_ADDRESS              0x1840
>> +#define MA35_OVERLAY_VPLANAR_ADDRESS              0x1880
>> +#define MA35_OVERLAY_SCALE_CONFIG                 0x1C00
>> +#define MA35_OVERLAY_SCALE_FACTOR_X               0x1A40
>> +#define MA35_OVERLAY_SCALE_FACTOR_Y               0x1A80
>> +#define MA35_OVERLAY_HORI_FILTER_KERNEL_INDEX     0x1AC0
>> +#define MA35_OVERLAY_HORI_FILTER_KERNEL           0x1B00
>> +#define MA35_OVERLAY_VERTI_FILTER_KERNEL_INDEX    0x1B40
>> +#define MA35_OVERLAY_VERTI_FILTER_KERNEL          0x1B80
>> +#define MA35_OVERLAY_INITIAL_OFFSET               0x1BC0
>> +#define MA35_GAMMA_EX_INDEX                       0x1CF0
>> +#define MA35_GAMMA_EX_DATA                        0x1CF8
>> +#define MA35_GAMMA_EX_ONE_DATA                    0x1D80
>> +#define MA35_GAMMA_INDEX                          0x1458
>> +#define MA35_GAMMA_DATA                           0x1460
>> +#define MA35_DISPLAY_DITHER_TABLE_LOW             0x1420
>> +#define MA35_DISPLAY_DITHER_TABLE_HIGH            0x1428
>> +#define MA35_DISPLAY_DITHER_CONFIG                0x1410
>> +#define MA35_DISPLAY_CURRENT_LOCATION             0x1450
>> +
>> +#endif

