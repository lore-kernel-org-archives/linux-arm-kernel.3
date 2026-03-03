Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC163E67A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOoaOEZuNJH/wFIt6h7FeWwE1+oo5QuN+aJxkWYzY4s=; b=e4XAJBiEpMoV3Z4lb+UxsCyFQh
	BQycH+epjnBaICOpuTYpBMaRV86fcsPMAbIhGK7OFMXgsq4LLDhfY6abomxOoGROrMM6W5Q1+03vp
	FctJKEiVG2TvXKS6lzJsBgso21J4kfiJsu1rIsbUwl5MW4rw2wN6VGKxLa7GCyLfU0kyq1Ovu03ja
	tWDu+jx3v2bHryGnn4DUSfQTB9QWoEI0DcMxlcpu/SoBHx48ac4ig+zKVbxkweFJXlf5/O1YrhPkt
	7hgSDRAKbEnT3IVCKqoPzK0b7I7WsOeHmFrTazInJmkovdrnO3YHpsbhjaawRxQ56Wvvi/zBZI/2H
	mO3OOWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKv5-0000000EleQ-3oqe;
	Tue, 03 Mar 2026 08:15:55 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKv4-0000000Eldf-0nfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 08:15:55 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c70ef340a02so3084412a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 00:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772525753; x=1773130553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TOoaOEZuNJH/wFIt6h7FeWwE1+oo5QuN+aJxkWYzY4s=;
        b=Orhgcxp65xFdYkIy6e3TI/B+gKr+KZvpw4x6qjSoiyrTY9U1hcrsJHLycCLly/aUwB
         yyQy1MAbfT6rCX6e7jYu3RB4gV16eU1dMBKuFZkM9KEulgfLtJWAb2x3jpsIBGOvIHjc
         M2NsSqaHkfVX6DCLL2gWJLlUo731BMU/yeNlQGU1Ua3QXJyYJVGh7h/jLNyGcaygyWpf
         gm7JsoXVX8FZ3lTc0D8+rz0YMIQQxhIcWZ3/uTA7a3Mg1AQedVgkxLtYFK6z2GNuN/Hc
         Zro8/tBxkpMMKhBQCrSSoNGdmcmdHkWXDvJnPNF5s7UUGSB3jX4tCO8PDNg9A/sOnPrm
         IBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525753; x=1773130553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOoaOEZuNJH/wFIt6h7FeWwE1+oo5QuN+aJxkWYzY4s=;
        b=ZmOzdWOqZcNgZDmULlG5d5094c0Uhw1n64L/1XZiKWxu6pTFTyL4285weCo02EYRoL
         lbCWz/Nv+y4vzycfAvhcXNpt1tbQKItvaurjXVJqmRGxi3T+925IghsRrOktEQaUr6G0
         5TIjcY6pxiDC3UNi4c2aaaWRuQlIpjZCHk+qhUQKY3RhK/SGX9G4eHGdkr/JIRkAlvC+
         Ab5i9aV5mjZ2TB+5HpwVNVJben4EgZ8ZtU2TtMxunVW4DWjmRzyyh2aArzcjSb2z7al2
         38+7PUU1ByUOqfCcZbX0uFKhjWy2L1XJno8o0h+0C29fUpxwVYm9J+wx0PWDeNSWmQD5
         MkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe0ct8WcW4YoUrCG32yifJC+9/FI03iuHbzsHZbhr3vg5rt5xnqoyZMrZRu/zzw3guozRZ3FOuw2JorCceq/a/@lists.infradead.org
X-Gm-Message-State: AOJu0YyG5ld5u/2cw2m9SUrBpbVqR+y0ilgMFemik1El2qekpgOo2P+x
	47QrP/PKsIvgWOSm51Xjf4oe3O4+mbKGjXgkECxQdoSOcOW5lUwTnVd5
X-Gm-Gg: ATEYQzyved+OeTY57Rfo9/XsNlnu10sFmYF26xiokAP1EhvQX9sQFBF1jORrbmQYL8a
	OlZ/6kJnO6rJTw4z/QU+AiFpHrnSVbcfO7ZdaSuYauNOePPAMbjiyvvKIu3hYAB59C2Q6xz+EES
	QdlU09jzUw5fuk4hwe4dlNyZb+y5ZNycN/u2rAJ/X08/V+IV8fN7V+wuqHKuoQ/ljDvscrOfqOx
	qo1jENmh+mVNlwbze8BUbcVKMGSU4Rxs4IJ3tUJ8cO9cJsp9DvitRRoIN7IUOpqDSIgKoXsYdXT
	mQqs6IbGwvqwMIUNZNvNmOtnH8rGE4mhsddJhiEKFqUf1zOJEfogbFUYIRyWwY2nJ/colwfx9TL
	rJBcLzEznip+Fi+ficPZaa2GOzkzwmvosEUr37o9rFIQfNVTA4zzrd+cO6kntGEZw3GlrRgRsBY
	nZE82JDf+qtAiwbYb1fSwofiX1bwVX3mz7U+npncSrhXQp0uAgZWDRZm8WHXTwzK7DkKVia33Dw
	Jll
X-Received: by 2002:a17:90b:4b50:b0:354:a662:47ff with SMTP id 98e67ed59e1d1-35965d188d6mr12983648a91.35.1772525752831;
        Tue, 03 Mar 2026 00:15:52 -0800 (PST)
Received: from [192.168.0.101] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c408296sm1377885a91.5.2026.03.03.00.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:15:52 -0800 (PST)
Message-ID: <b69d5393-f122-44e9-96d9-342f458c3487@gmail.com>
Date: Tue, 3 Mar 2026 16:15:44 +0800
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
 <f556ef68-dac3-4652-ac21-ea4bbb4e912c@gmail.com>
 <9cccf8cd84b394f66b85e2af3bef0a3ecd154747.camel@icenowy.me>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9cccf8cd84b394f66b85e2af3bef0a3ecd154747.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_001554_234750_62604188 
X-CRM114-Status: GOOD (  19.86  )
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


On 2/10/2026 8:02 PM, Icenowy Zheng wrote:
> 在 2026-02-09星期一的 16:45 +0800，Joey Lu写道：
>> On 2/6/2026 11:09 PM, Icenowy Zheng wrote:
>>> 在 2026-01-29星期四的 12:05 +0800，Joey Lu写道：
>>>> ========== 8< ============
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> b/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> new file mode 100644
>>>> index 000000000000..0f4a7a13e7d8
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> @@ -0,0 +1,88 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * Nuvoton DRM driver
>>>> + *
>>>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>>>> + *
>>>> + * Author: Joey Lu <a0987203069@gmail.com>
>>>> + */
>>>> +
>>>> +#ifndef _MA35_REGS_H_
>>>> +#define _MA35_REGS_H_
>>>> +
>>>> +#define MA35_FRAMEBUFFER_CONFIG                   0x1518
>>> Please check my Verisilicon DC8200 driver, which is already part of
>>> drm-misc-next now.
>>>
>>> The display controller here seems to be a earlier one from
>>> Verisilicon.it looks like a DC8000, or maybe a more earlier one?
>> The DCU is a Vivante DCUltra IP rather than a DC8000 series.
>>
>> It's an earlier generation display controller and was customized for
>> Nuvoton, so it doesn't have a public model ID.
>>
>> Because of that lineage, parts of the register layout and
>> functionality
>> remain similar to older DC IPs.
> The kernel seems to dislike different drivers for similar IPs.
>
>> Please refer to MA35D1 datasheet for more details.
> I checked it, and the register definitions looks compatible with DC8000
> registers at [1]. However no identification information is shown in the
> manual.
>
> I may get a MA35D1 board after the Lunar New Year (although it looks a
> little expensive), is it easy to bring up mainline kernal on arbitary
> MA35D1 boards?
>
> [1]
> https://github.com/milkv-megrez/rockos-u-boot/blob/c9221cf2fa77d39c0b241ab4b030c708e7ebe279/drivers/video/eswin/eswin_dc_reg.h
Our team is actively working on upstreaming support for MA35D1. It is 
possible to bring up the mainline kernel on arbitrary MA35D1 boards, but 
for the best experience I strongly recommend using our Buildroot[1] or 
Yocto[2] tooling available on the official GitHub. These provide 
board-specific configurations and greatly simplify the process.

If you decide to get an MA35D1 board yourself, our Buildroot/Yocto setup 
will help you get started quickly and ensure you have the right patches 
and configurations in place.

Currently, the mainline kernel version is 6.6, which is sufficient for 
checking registers and basic functionality. For more complete feature 
support, our Buildroot/Yocto tooling remains the recommended path.

[1] https://github.com/OpenNuvoton/buildroot_2024

[2] https://github.com/OpenNuvoton/MA35D1_yocto-v5.0

Best regards,

Joey


