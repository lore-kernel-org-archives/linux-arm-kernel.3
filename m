Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70F7CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z33mAnUolaaopuhgkgsSsR1XqxZfuAXYGKr6UlpMNF4=; b=YQEF8s88wOl8OjCBTCI6ZWalGB
	6xB0m5cyng1YCKJL6Si0UT4tG7rQ1g6dbY0r1WnmvPjI1PSsgc76s15YO0erDAZDC7RLsupgUZgKk
	/sskYZV2oeYVMam/0Thd9gEgMzBnzhkSiGinKzv8iDWY1n4p+MBUoqMxTXeeTXQm1ehePDtm4Sp+O
	rrHIzwvoXc/SnxLXshmtPUwWfLM1bfxLAvgeVdjooJk3z1Xu93vlIWxFQiD485D3bctzGfPjIzxN4
	Z3COuMrH0yeNgcovg6N8wfi5F9NJfwt415hEVQaCT/kXqCNUuGdT7fBOMp2Eapou7sC1vVdl/bxrx
	xG3WUe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8J-0000000GDZL-0zcT;
	Tue, 12 May 2026 09:10:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8G-0000000GDYr-2GZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:10:29 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-83975e992e1so2567241b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577027; x=1779181827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z33mAnUolaaopuhgkgsSsR1XqxZfuAXYGKr6UlpMNF4=;
        b=CknnV4DjemTHHViD4d49WsaL7f0JRZgUQ2WcrNDuZJtd/jEcwvIdnL4vbPabbobYQl
         U17+jy2o+avbiZX4zGsJ8H5RKBSHvulA/SotUVnq32Z+laAk8dvV4+p4JiryBWFoM2xZ
         N98ELLGlsbP4D0eP93ZbuiIGHf2irGkegvzD04cdxPNaXhw6td6Iv2AV0aEnyTXZXrYZ
         AGU0nAWdntpLXOeTjSkGViM5qMb0efVkxqZ0ITi4fM30c4UKL8USB6PB2p03q1cf350r
         b2GgCqaiOCpZxD2fceK4X3AR7FcQCK9ImNUplfwUODi/CO826V+w58VgS/jdmxEM9TUU
         2E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577027; x=1779181827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z33mAnUolaaopuhgkgsSsR1XqxZfuAXYGKr6UlpMNF4=;
        b=Oz+NJ3YZPFhcsX7iOizXl2A/CESMmxHToNQupmtGSgwVw5J/vgoliIvsOCURTwBRhL
         WKoS46c8bAfbw3lm4dx9mHqrpjafbk5h9rX38yHWpMI82T6BFhEUVJpTUKwt+BtSph1R
         Vl1aWHY2vomaeG06EVtk/ht/P/V/qI56eYGqpIeQRQMbfg5RjGx6NOcEcW6xWD/DPc8Y
         zKOBhOZZ5fG7xIsV2eozLPjpD533m3NBZyBY2FVal3zbcOaC3WT9onJ5rcX4svRpjYgg
         U20+j+mqsLhxmRAZlwM2zQX4gZ5crOiVxjSGRE4LjlpmUgc2LLi93Hn3eFnGw5Q17/5c
         svbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kmVradWiQtdMYTBfkUQOwUhNBf8GVj07uf6YGt4WZHBN0dVV1MpH3kzRwdEG9vUljzhXxe098UPClsaVmQnsX@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFFuTZtl4iyypirucORzvgc4KVJ2V0DDQbRk1VBjGxBL4ow4z
	wcSXeE8n2DCLAnI7vbKZIX+O2qFWyRp6ckc756aisqATZqbgst0rJpX2
X-Gm-Gg: Acq92OGiUcR2409R3mtBsWMvcxmrmiT5ym69bzDlU99ImyNAgnkYhz1lSAFW8CXSDUj
	K3xB1I3QzVnSeUE/f8vgoLbr8/q1jBWRpdv2TpGPRS/VWkchwqALVVjaDgXgMInAse7uUP2p6ky
	GEsd6EZXVyyecIIavgt0BfDTvrWfJWbesAZAr7PK6WZ83SccdxaZNgoBPaG2EQVGG5ea2q/rF8q
	kyhMwzh6B6JiTbuBjXYWycCSlR5G3yBwip+K1zWe8L5TC+qXE1KL74f+drgE+neWHKYU3yobblz
	5ygoeXDEPnp3ECP1q4vv25+iyN6jFSw9pjRddaWjOgjP4nI8Gmoym/jQQ2wlTcgZaI9bCBBaoiS
	BG6D9BRr/tgYbuJT2WJjlOImabsnGqXkgd7+1ZyGG6MdtbpEL2yUQHZhJCAtik5Aw6EVpqYRX+f
	FzmmYYelHKXvIT10eKXh1cG/PuqMVG1gcjQoNVJivaKhHZ0ItAVjdND2zvBd1FzvxmUqWt48Q1Q
	4QaCEfrlVsEodY=
X-Received: by 2002:a05:6a00:9a8:b0:835:5557:31fa with SMTP id d2e1a72fcca58-83eebe7fd90mr2418145b3a.46.1778577027383;
        Tue, 12 May 2026 02:10:27 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm28990915b3a.16.2026.05.12.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:10:26 -0700 (PDT)
Message-ID: <07ca65f6-33da-40b1-afcd-0b0ceabd49f9@gmail.com>
Date: Tue, 12 May 2026 17:10:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1
 DCUltra Lite display controller
To: Thomas Zimmermann <tzimmermann@suse.de>, zhengxingda@iscas.ac.cn,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-3-a0987203069@gmail.com>
 <5157ab4d-3195-49f3-a3e9-aef6d58e869e@suse.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <5157ab4d-3195-49f3-a3e9-aef6d58e869e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_021028_590890_DBD66E79 
X-CRM114-Status: GOOD (  24.17  )
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


On 5/12/2026 4:24 PM, Thomas Zimmermann wrote:
> Hi,
>
> instead of this if-else branchery, I strongly recommend to add a new 
> file with a new mode-setting pipeline for the new chipset. You can 
> share existing helpers where possible, and implement variants where 
> chips differ.  It's a bit more code, but will be a lot easier to 
> maintain in the future.
>
> See ast and mgag200 for example. Both drivers support various 
> revisions of their chipset, where each rev has its oddities.
>
> Best regards
> Thomas

Thank you for the detailed suggestion.

I see your point and will refactor by adding a new file with a 
mode-setting pipeline for the chipset, reusing helpers where possible 
and handling variants as needed.

>
> Am 11.05.26 um 09:51 schrieb Joey Lu:
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltra Lite display
>> controller, which is a previous generation of the DC8000 series. While
>> the general register layout is similar to the DC8000, there are several
>> key differences that require per-variant handling in the driver.
>>
>> Add a vs_dc_info platform data structure (in vs_hwdb.h) to describe
>> per-IP-variant capabilities, and use it throughout the driver to select
>> the correct code paths at runtime.
>>
>> Key differences between DC8000 and DCUltra Lite handled:
>>
>> 1. No chip identity registers (0x0020-0x0030): DCUltra Lite uses static
>>     platform data instead of reading model/revision/customer_id from HW.
>>
>> 2. No CONFIG_EX commit mechanism: DC8000 uses registers at 0x1CC0
>>     (FB_CONFIG_EX), 0x24D8 (FB_TOP_LEFT), 0x24E0 (FB_BOTTOM_RIGHT),
>>     0x2510 (FB_BLEND_CONFIG), 0x2518 (PANEL_CONFIG_EX). DCUltra Lite
>>     omits all of these and instead uses enable/reset bits in FB_CONFIG
>>     (bit 0 = enable, bit 4 = reset) for direct framebuffer updates.
>>
>> 3. No PANEL_START register (0x1CCC): DCUltra Lite panel output starts
>>     when PANEL_CONFIG.RUNNING is set; no separate multi-display sync
>>     start register is needed.
>>
>> 4. Different IRQ registers: DCUltra Lite uses 0x147C (IRQ_STA) /
>>     0x1480 (IRQ_EN); DC8000 uses 0x0010 (IRQ_ACK) / 0x0014 (IRQ_EN).
>>
>> 5. Different clock/reset topology: DCUltra Lite requires only "core"
>>     (bus gate) and "pix0" (pixel divider) clocks with no reset lines
>>     managed by the driver. DC8000 needs core/axi/ahb clocks and three
>>     resets.
>>
>> 6. Single output only: DCUltra Lite has one display output; per-output
>>     index logic is still in place but display_count is fixed at 1.
>>
>> 7. Reduced register space: max_register is 0x2000 vs DC8000's 0x2544.
>>
>> Add the "nuvoton,ma35d1-dcu" compatible string to the OF match table,
>> extend Kconfig to allow building on ARCH_MA35 platforms, and expose
>> vs_formats_no_yuv444 as the default format table for DCUltra Lite
>> (YUV444 blending is a DC8000-only feature).
>>
>> All changes have been tested on Nuvoton MA35D1 hardware and are
>> functioning correctly.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c           | 129 ++++++++++++------
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
>>   drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
>>   .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
>>   10 files changed, 187 insertions(+), 74 deletions(-)
>>
>>
>

