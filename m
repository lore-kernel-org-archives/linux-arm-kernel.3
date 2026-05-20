Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD4DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ogsLHdMRBDNhx86JrEpkhkME96SjA8tuF11+cYpwtQ=; b=qhyTy7NBRmDi6xerAUFnNBXXiE
	Nq0u5jG3ricS/exbDj/5fWhtiGWFJfc/PdHeHzsKkHahT7/5PruNpDXoDGlSlSb6OxoiMO+syZagL
	9hpNh05LVOcal5uRI7JNRH3KD5GvsmJ+qxeQ4i9qZQ4gPN6+ZlIJiWCp4tUnCBr0CSoa+8pvbIptf
	ewvpdfwhGalvHnGvjywv9MwB+U9mWuL7BGmk50xNR/LaBqlmkE0lDEQ8ttfHd31bmSsisIyxuuljo
	nHXtuQ0xaR1XCUmlTpu44FTmu/+0dOWdJ8P70wNgJzM3yfCqjzhJody6SxbWJp45HkG+2xjaY2KyQ
	/y2z4+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXIZ-00000003MiX-2oN8;
	Wed, 20 May 2026 03:08:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXIX-00000003Mht-1HhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 03:08:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba4efedbeaso31246445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246520; x=1779851320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ogsLHdMRBDNhx86JrEpkhkME96SjA8tuF11+cYpwtQ=;
        b=e4Y/YttpDgodY1RqQV2ZOG4GDdkFvshZuLhu7B4vlQSjFM/n2JViYyx/522f/LrTxm
         Q6rQBHYJxlGGcp8rd/7ayj/ewRcVt3Eg5eU/lLzPLLN0aYqJQeNcIiw53QT2sipGe31D
         IrL9p6GRUtBCU36lz4SU/SqFmwOoYchqdTpiRRJC82kIz/0m01ta6MFf2qir17dnmpSf
         tLBqfH4MNmyc3a5JmIhEkKrhqmr6TQkao/leuEpB/RMxhTwalNRGHffjQ8Hetli3dZPy
         peQCr7FK2tfOuWtIHmCiwGs4JpbeJF+OYdOsyZnOzD1OrrLHybfMyTn+BIrDK+mAy2Fs
         Ctcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246520; x=1779851320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ogsLHdMRBDNhx86JrEpkhkME96SjA8tuF11+cYpwtQ=;
        b=EekNQFNuT2KqVExQWxZuZAza9Slirod6hbZFUvKIGPL5N5ton0jn4xkGER0Sb776Fa
         BIiLM0FI2VryM/WtVdzRZYoHi+I+zR29K2S/NEHsG90Ys7Q72+QlsuSi0eyN5sE1aJbs
         qwM50OPsCykK+oaP5SuZUJ754KfdBanlS3R0TOB9A9BlNmuW210gX0gTOqZpicYGHhCZ
         wyd5gMcNWnJCiwjRFH719tQNT0d9noTJY/vgLan0ZHpbj2F7HLrwJYZkOYH9IxgQoo+J
         ck7H/prATn6PyB29xc0Mkvyvdx96mp3lDhB/pzs/TSMxEZTdP6X8GKbqy8gR1Oo9/MWk
         v3GA==
X-Forwarded-Encrypted: i=1; AFNElJ+VWA+QI8NXEYE2SW+orx822PCa8SmzAls9ZIaZBdHQCh0Ul+5MAhqLAE+yobyA8JpVi8nyeAfD4eNF4jGMnRkE@lists.infradead.org
X-Gm-Message-State: AOJu0YzdJwacNssxExbusiRnkl/mwjsrNpJ86UfRBawWT7YQvb9FdsGm
	Eh5YxaBOm0nHTZzPvgBraw96t9i6ot8IaJY/4VsFp/+MLrvhb+5YBYKR
X-Gm-Gg: Acq92OGIoGD+DOUMzTfAXM1gtvoKNItL/ZYCoai/qCsMV1tfOn8Nuq3kBthvVOTA5+L
	SFzHs9oQKDl6aOMPcp2PFoSPZLZ2y7z1AP9ligzYLORCj7scp/58D+vWU2cSB3QzDBa9bTyK9jp
	v3jiwc6bKBrvbdtMuzdiMcTFU58n+N4KFLyzBb6mxt739aMtAoh7RPX2yW3Rn2S+gJK0HU0WmyY
	Yq9V66HfQNKD1XCQ1Ufu6dx76EkrPUsbdp2V0/mBcnz9bbZg7LP3YsYk8k2z9ry2Z6VQchy7FpR
	QntMRKwVFPw6JvWCH9cR9R12y097LDDLZCeatAYKOP/OZmiCj3Jh43Yfg+MnEV3iiugbhBguvcJ
	eM0v6M2b5efrgxxZSDeKhbwetlAOBBnRZIVtgSc1x4PooBDd3BnMy6PPHbTygsAQs+BS6+5A3nT
	E8NDwbV5/HRZyzo3g7eIC6d5uD5fq3xeytsI8eL0qH5DRCdYuLaJGpwsw3SVEro9Xb7nyeLH7/v
	H1crUkv3/WOqSY=
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr241246245ad.12.1779246520280;
        Tue, 19 May 2026 20:08:40 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c26355csm202030405ad.35.2026.05.19.20.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:08:39 -0700 (PDT)
Message-ID: <c85299a1-1ea6-4c6c-ba77-ce46969b8c39@gmail.com>
Date: Wed, 20 May 2026 11:08:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/verisilicon: add model ID constants and DCU
 Lite chip identity
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260519055114.1886525-1-a0987203069@gmail.com>
 <20260519055114.1886525-3-a0987203069@gmail.com>
 <5b7b28558aece1d99e93c1d69ce2c381929813a2.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <5b7b28558aece1d99e93c1d69ce2c381929813a2.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_200841_359882_211C6CA3 
X-CRM114-Status: GOOD (  26.66  )
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

On 5/19/2026 3:37 PM, Icenowy Zheng wrote:
> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>> Introduce symbolic constants VSDC_MODEL_DC8200 and
>> VSDC_MODEL_DCU_LITE
>> to replace magic numbers in the hardware database and probe path.
>>
>> Register the DCU Lite chip identity (model 0x0, revision 0x5560,
>> customer_id 0x305) in vs_chip_identities[], making the existing
>> vs_fill_chip_identity() path able to recognise Nuvoton MA35D1
>> hardware
>> purely through register reads.
> The HWDB change should be added in the end of the series, making it a
> gate to the newly added changes that is finally opened when
> everything's ready.
>
>> Also add three register-level macros for forthcoming DCU Lite
>> support:
>> - VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h, for per-output VSYNC IRQ
>>    bits used by the DCU Lite IRQ enable/status registers.
>> - VSDC_FB_CONFIG_ENABLE, VSDC_FB_CONFIG_VALID and
>> VSDC_FB_CONFIG_RESET
>>    in vs_primary_plane_regs.h, for the framebuffer enable and
>>    commit-cycle bits used by the DCU Lite plane update path.
> Maybe you can split the register change
Understood. I will split the register macro additions into a separate 
patch: one for the new vs_crtc_regs.h IRQ macro and one for the 
vs_primary_plane_regs.h FB_CONFIG bits, keeping them independent of the 
HWDB identity change.
>> No behaviour change for existing DC8200 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/vs_crtc_regs.h       |  1 +
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c            | 16 ++++++++++++--
>> --
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h            |  3 +++
>>   .../gpu/drm/verisilicon/vs_primary_plane_regs.h  |  3 +++
>>   4 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>> b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>> index c7930e817635..d4da22b08cd5 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>> @@ -54,6 +54,7 @@
>>   #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 +
>> 0x4 * (n))
>>   
>>   #define VSDC_DISP_IRQ_STA			0x147C
>> +#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
>>   
>>   #define VSDC_DISP_IRQ_EN			0x1480
>>   
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> index 09336af0900a..a25c4b16181d 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> @@ -90,7 +90,7 @@ static const struct vs_formats
>> vs_formats_with_yuv444 = {
>>   
>>   static struct vs_chip_identity vs_chip_identities[] = {
>>   	{
>> -		.model = 0x8200,
>> +		.model = VSDC_MODEL_DC8200,
> I don't think such a macro is needed.
Understood. I will remove `VSDC_MODEL_DC8200` and use the literal 
`0x8200` directly in vs_hwdb.c with a comment.
>>   		.revision = 0x5720,
>>   		.customer_id = ~0U,
>>   
>> @@ -98,7 +98,7 @@ static struct vs_chip_identity vs_chip_identities[]
>> = {
>>   		.formats = &vs_formats_no_yuv444,
>>   	},
>>   	{
>> -		.model = 0x8200,
>> +		.model = VSDC_MODEL_DC8200,
>>   		.revision = 0x5721,
>>   		.customer_id = 0x30B,
>>   
>> @@ -106,7 +106,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.formats = &vs_formats_no_yuv444,
>>   	},
>>   	{
>> -		.model = 0x8200,
>> +		.model = VSDC_MODEL_DC8200,
>>   		.revision = 0x5720,
>>   		.customer_id = 0x310,
>>   
>> @@ -114,13 +114,21 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.formats = &vs_formats_with_yuv444,
>>   	},
>>   	{
>> -		.model = 0x8200,
>> +		.model = VSDC_MODEL_DC8200,
>>   		.revision = 0x5720,
>>   		.customer_id = 0x311,
>>   
>>   		.display_count = 2,
>>   		.formats = &vs_formats_no_yuv444,
>>   	},
>> +	{
>> +		.model = VSDC_MODEL_DCU_LITE,
> The number is 0x0 and the whole public name of this IP is
> "DCUltraLite", w/o any numbers.
>
> I suggest leave it at 0x0 and add a comment saying this is DCUltraLite
> -- Verisilicon people are abusing suffix for their IP names now.
Understood. I will remove the `VSDC_MODEL_DCU_LITE` macro and use `0x0` 
directly with a `/* DCUltraLite */` comment in vs_hwdb.c.
>> +		.revision = 0x5560,
>> +		.customer_id = 0x305,
>> +
>> +		.display_count = 1,
>> +		.formats = &vs_formats_no_yuv444,
>> +	},
>>   };
>>   
>>   int vs_fill_chip_identity(struct regmap *regs,
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> index 92192e4fa086..cca126bd2da5 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> @@ -9,6 +9,9 @@
>>   #include <linux/regmap.h>
>>   #include <linux/types.h>
>>   
>> +#define VSDC_MODEL_DC8200 0x8200
>> +#define VSDC_MODEL_DCU_LITE 0x0
>> +
>>   struct vs_formats {
>>   	const u32 *array;
>>   	unsigned int num;
>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
>> b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
>> index cbb125c46b39..67d4b00f294e 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
>> @@ -16,6 +16,9 @@
>>   #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
>>   
>>   #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
>> +#define VSDC_FB_CONFIG_ENABLE			BIT(0)
>> +#define VSDC_FB_CONFIG_VALID			BIT(3)
>> +#define VSDC_FB_CONFIG_RESET			BIT(4)
> Should the new IRQ register to be added here too?
>
> Thanks,
> Icenowy
`VSDC_DISP_IRQ_VSYNC(n)` is a bit-mask for the IRQ status/enable 
registers (`VSDC_DISP_IRQ_STA` / `VSDC_DISP_IRQ_EN`) which already live 
in vs_crtc_regs.h. Keeping it there alongside the register addresses it 
operates on is cleaner than splitting the IRQ definitions across two 
headers.
>>   #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
>>   #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13,
>> 11)
>>   #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)

