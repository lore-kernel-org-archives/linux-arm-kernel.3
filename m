Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27C0CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhUWEjlecPu7hlJvyuwWPRxl2TYmG2bGNVOKZVs0d90=; b=uEGrrZjGEvhDu/t0j/RsE0Xrra
	DCGsnsT9v4QBX78DWaKIcTmmx3LcSp1RmgeIYk1QL7mYxW2E3fITjClsVQDuXW13r/RC0KvtgJm9w
	B4R21FPpbFXXuoQxqE+LcZiPD/XuGiukJERJnCJSOuZG1lCPGjvjqKp9sqcd8/uMbzEbsCeUt5adf
	tKXaDbrETGEHOCjybnG6K4/kbaUvwtytUHHvvq0sfxH8YJRRPl5LXuOoRHi5nrr/rmFFnEuOazatY
	6DJB5A1XjxH24Ji9fcy15pFQjYxWaD5z0QXO6fX5fjk0d7yhNuqXrT1Wxq1DOtPuNiXXJA5GCyIp6
	Lzny1XnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneS-0000000H7BA-2HGB;
	Wed, 17 Jun 2026 10:37:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneM-0000000H75b-2Gvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8453427d3f4so17484b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692657; x=1782297457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhUWEjlecPu7hlJvyuwWPRxl2TYmG2bGNVOKZVs0d90=;
        b=VSBLpohunaxGKYPjo9bNH6q2WTwi1Cwbsms3q0rvly7TIF1btjewRWekEWAVq5IO87
         Jwd0grBSjuDmJRPnSsosmtoMb+A0vdRVPznBUsvjhym2J40FTfAXwVZFH5czseLeSQ0i
         fZwrbWJSk13TN7dhdTxZ1xwkkZShOFfzVZInsoCUx3XRMpuV8W6XLi6wV8TMh+5uv2JZ
         UfPDj1ZFCTbBJRXNdBCXoHXuOgJEqmlyHZZ7xfGCPsVsHiuEo4E97UR1FX+qUSl1w33Y
         amnLxmt05FE0QwS3OtCtEB32kBg/uL42UOmTTvUZ9U5ydlEVTZu91qqDgRsUytWfBPU4
         cmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692657; x=1782297457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhUWEjlecPu7hlJvyuwWPRxl2TYmG2bGNVOKZVs0d90=;
        b=HScS+addvSTuODv9Dvq7jPjVVL+BLUx/ifiFLElrlULoitTYwZZbku3rJYIXczMp0m
         uSnURzVC9N0eFo+6BBZTIfW1nPxQkHJcvHpIBfCjJvd78aZw9Om+7Rz8D1+UCbW80wsw
         gTlK1ikCGN70coVipkbb0eYNxEp93s8JStaKlGz0Par3YGdYlVBYnKGnSNQdbnJnjVZ8
         5/Y/cZoC4n4GMmT+0GYLyFk2kufiIg7gvy32eKh8mmrK2eUl3KztUpZj+4atDIn7cw7w
         zz7rm//1KO3zs5Ow2y7GQZjuUxJtjXBRzzebXCcEb6TD4RZ0ftdVsGgToBwDi46/1Ede
         0QuA==
X-Forwarded-Encrypted: i=1; AFNElJ+5jVO3HL9sqp2R8LNgMWpBuXxVtBle6y2c/1M4q3uZ20S2maUyOq3AYq0gpNFzPk3cUBMF8VTfm38RASHF9ji4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Z2utFgQvflvz2nSmQvz7jv23GfQhc4hEahUuvZAcEpah8UAp
	ksMylyMNt20iZBuQy/Lkggrmr+CiIVzoNHL4ZKk4aboXuznuMnQC1ew6
X-Gm-Gg: Acq92OGq5MPVY0iEbl0DrNqIkvhy5Y8J/uBH4MFHmmy6X+ATtaC5hDjVxCz2+48hfES
	v3f/FjwztTILSxyJismm67LIozHcrmkmsXBxYtPX2yEN8Z7BwUvaMYwwNpRRiZ63gZs2JE1f3Tv
	Vfukk+hWrXBPi3N/LvGrerjxafwNMPBBnsSuN/cOmaj0sw88L5A1069Ws2PyfsB8YXDlrXjjXb3
	kr2Xnjc4OOZJtqLe9pY5FHMyHu8kRDltFaQJsCxoZk52tF6Puer/EjALnABqPTu7dysvhy7a5iR
	nqno2OvTPl6Dzoo95rtGO4/Uepe3pnEz+i+efNIIfpbN10iQZ+0KAxz9FxEwMwsEMGBVyD6YH+3
	esyC1VU9OAY1I/MiuHs+qad1J/KFwbvssH5ofYkZ733sKyURf8122wV5KzkPkM6tkN8uOPc5iIM
	ZPTTUJnm4PgE7zx+vFIyiSXdkqvCLbwPBUddbcsuTUCndtXDIrNZ9UYfEGLFDgf8cHPjrlJEm/N
	9Bn
X-Received: by 2002:a05:6a00:10d5:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-84524550f44mr3301789b3a.29.1781692657527;
        Wed, 17 Jun 2026 03:37:37 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm15269159b3a.24.2026.06.17.03.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:37:37 -0700 (PDT)
Message-ID: <bd90109d-5c1c-47d6-ac1a-c9b81de5cf7b@gmail.com>
Date: Wed, 17 Jun 2026 18:37:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] drm/verisilicon: add DCUltraLite chip identity to
 HWDB
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-6-a0987203069@gmail.com>
 <62c0b8ab9b6d9f994daa8bb60b3b626688af7d5e.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <62c0b8ab9b6d9f994daa8bb60b3b626688af7d5e.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033738_601938_CF176189 
X-CRM114-Status: GOOD (  19.17  )
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


On 6/15/2026 4:57 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>> Register the Nuvoton MA35D1 DCUltraLite chip identity in
>> vs_chip_identities[]:
>>    model       = 0x0   (DCUltraLite; Verisilicon uses 0 for this IP)
>>    revision    = 0x5560
>>    customer_id = 0x305
>>    generation  = VSDC_GEN_DC8000
>>    display_count = 1
>>    max_cursor_size = 32
> I suggest make this more human-readable instead of replicating the
> machine-readable data of HWDB.
>
> My proposal here:
>
> ```
> The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
> model number 0x0 (sic, the model name contains no number either),
> revision 0x5560 and customer ID 0x305. It has a similar register map
> with DC8000, only one display output and only 32x32 cursor supported.
> ```
Thanks. I will use your proposed wording for the commit message in v5
>> Placing this entry last makes it the gate that enables MA35D1
>> hardware
>> recognition only after all the supporting ops and DT binding changes
>> are
>> in place.
> It's a little ambiguous that "last" here means whether the last in the
> patchset or the last in the HWDB array, although I think it's not so
> needed to explain the reason of the place in the patchset.
>
> I propose just say `Adding it to the HWDB to enable it to be usable
> with the verisilicon driver.` .
I will simplify the placement sentence to "Adding it to the HWDB to 
enable it to be usable with the verisilicon driver." in v5.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> index 91524d16f778..7d630a667a3f 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> @@ -129,6 +129,16 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>>   	},
>> +	{
>> +		.model = 0x0,		/* DCUltraLite */
>> +		.revision = 0x5560,
>> +		.customer_id = 0x305,
>> +
>> +		.generation = VSDC_GEN_DC8000,
>> +		.display_count = 1,
>> +		.max_cursor_size = 32,
>> +		.formats = &vs_formats_no_yuv444,
>> +	},
>>   };
>>   
>>   int vs_fill_chip_identity(struct regmap *regs,

