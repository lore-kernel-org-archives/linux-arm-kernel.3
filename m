Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjzENzNcJI3kMv2wJNKt36aOtMgEQTQOR9G5/GIQJis=; b=CWz/LFq5OaL0Th8RMiuCOPZ0N4
	NXXt2Ssx7pPv2TO4Yfguq4xVt0u5yQP8w7/y4ARjX/ld7lypoUCrWUY8Uk7C556gMDrx4XF1oCs52
	8khxXD/US+XtPQcimEEd9T/eAkB/mF0YBVO22qmeBJ2KKvUyleE7Ha41DRxy6iCtPsIlnfSlOhqDY
	WCFwrf13nC6HXyLhI8f5zW28yBPU15HZVNIIzse3krMFQPwhapHGA3mccnNhEYbC5oHNoY164A8Yx
	v08EQ+GxT/eeNa36iLAI6CtddpXS2vFeTopiIPa3oiZizXY2YsnNL0Ai0yRq7+wKO057K9GDxIgtF
	cv9JG8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI8W-00000008Ub6-3ooL;
	Tue, 21 Jan 2025 17:34:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI72-00000008ULX-3sOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:32:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21675fd60feso125477955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737480748; x=1738085548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tjzENzNcJI3kMv2wJNKt36aOtMgEQTQOR9G5/GIQJis=;
        b=hBGUamnRLfwYeD8Z+T/nnwps0bsNGx/2jEde753PPL6IoQ3miIUuKrL1A27SHOyAXn
         nHGCVvadqdQQpYmxtuct6+N0cF1A/tPTTSIog/j8k55fMAr2+W87EEWr37ys9kYYOwZ0
         JuqI57MNybT1ibyQ9pd/1k3jJVDOGJhdaMuvqkiL8G79y00nJR4bYRNuunGJMTDhvahT
         Bu4NF8WcPYPCgEN1bs0AGIPHFnkHup4IrZ+KwY4wEtQs+SXKQtEaqdIZBc1cJl+oW20f
         NcAxHTa88m/bm0Oa6i4cdbvXidbgG68eZlvoZ8WyWoJS5YOFHvFsASj0z+JD/BNHoSIM
         eT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480748; x=1738085548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjzENzNcJI3kMv2wJNKt36aOtMgEQTQOR9G5/GIQJis=;
        b=E0mI3ENHyKMfj6l9aaJF7V9b12cMfFyEAwI8RJTk3aa8k7di0FJRWQ5me+7MUe/pIv
         4GFMdrACgBglbsNnucK97tYbUJy6jsZjniamsDqNLNUDklAme94lCCeIZBczkhNHAkUu
         a3auObimcGo/ld560sr+SP5E/wbmnHaNHVgaYc/m6/YhX0+5eKcfoyABV9AQwG0SdLSi
         iRYPqKPQ0sXN/qhP9o3ZNIaQ5re+jieEV8DIxWEy0Tp5MG3BD1rnvCHRVxAbL79fnPUP
         7M5eNK6STCsOHI3kRTy/SZuyebp4LDmRsLnZk9rxgYpk/16/iocVNripHxegnmbt+KF5
         BJqw==
X-Forwarded-Encrypted: i=1; AJvYcCXKazwSHViwXgV9ozU6XRCJj3cZhF0tW112nWe7VY/jgoaO2iFdEoGlXXmjLyUmnZ/V021d4Zw4/hZUcEUXrtLd@lists.infradead.org
X-Gm-Message-State: AOJu0YwvkAw23pMiH6oNehuIvmOaQjT+/89QjMOzcknlBYfveFHovd3e
	ZHf/s06aeg8eer5XFaHzX4dUGYyNBgJLZjYZOgbGN16ju1j26h/T
X-Gm-Gg: ASbGncu3xWzBK4dViXrKwvvfRA0Y3ZyINiKFEff9Zt3kfSXbRN32QqBKmKncXyKeRhj
	XXiaxrTA+N6cgruJJPEkS2b+W2ffbTT8YfZ/6gHmw3dk4/htrodckF18GjpXeQDAJoVRMXm1bp0
	1fJYRf9LBjWVQgzfBrCyebNRX3cozGG5gAvQFVQ34rabWRYaVHBQlq2JbnX1wqZfQ38Ac3bVUK7
	fkU4BhBxJcLjvIyn90zLadGf+g7dIgfFVhYdlWrVR28gXwkYYtWBuZNXQLAJgxuglKxqoiB5ttA
	utBfZMZwUGMVBDZ7LCIzZcEx/7AW33QzgAzlMybg/ZE=
X-Google-Smtp-Source: AGHT+IEuvg3vAcQfjXET6AR8ux8wjRA5zzJlIOjxyWZLfufb5XYvWraoCGwicb2vYnn92H36vXW25w==
X-Received: by 2002:a05:6a00:340c:b0:728:e906:e446 with SMTP id d2e1a72fcca58-72dafbda6ddmr28903077b3a.24.1737480747843;
        Tue, 21 Jan 2025 09:32:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab81336esm9324395b3a.38.2025.01.21.09.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:32:27 -0800 (PST)
Message-ID: <193f1583-973e-4d5b-8a9f-559622b16441@roeck-us.net>
Date: Tue, 21 Jan 2025 09:32:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 oss-drivers@corigine.com, linux-rdma@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linuxarm@huawei.com, jdelvare@suse.com,
 kernel@maidavale.org, pauk.denis@gmail.com, james@equiv.tech,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matt@ranostay.sg,
 mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
 louis.peens@corigine.com, hkallweit1@gmail.com, kabel@kernel.org,
 W_Armin@gmx.de, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 alexandre.belloni@bootlin.com, krzk@kernel.org, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <20250121064519.18974-2-lihuisong@huawei.com>
 <Z4_T3s7zn3UQNkbW@shell.armlinux.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z4_T3s7zn3UQNkbW@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093228_975238_D5EA6346 
X-CRM114-Status: GOOD (  25.01  )
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

On 1/21/25 09:05, Russell King (Oracle) wrote:
> On Tue, Jan 21, 2025 at 02:44:59PM +0800, Huisong Li wrote:
>>    */
>>   struct hwmon_channel_info {
>>   	enum hwmon_sensor_types type;
>> -	const u32 *config;
>> +	const u64 *config;
>>   };
>>   
>>   #define HWMON_CHANNEL_INFO(stype, ...)		\
>>   	(&(const struct hwmon_channel_info) {	\
>>   		.type = hwmon_##stype,		\
>> -		.config = (const u32 []) {	\
>> +		.config = (const u64 []) {	\
>>   			__VA_ARGS__, 0		\
>>   		}				\
>>   	})
> 
> I'm sorry, but... no. Just no. Have you tried building with only your
> first patch?
> 
> It will cause the compiler to barf on, e.g. the following:
> 
> static u32 marvell_hwmon_chip_config[] = {
> ...
> 
> static const struct hwmon_channel_info marvell_hwmon_chip = {
>          .type = hwmon_chip,
>          .config = marvell_hwmon_chip_config,
> };
> 
> I suggest that you rearrange your series: first, do the conversions
> to HWMON_CHANNEL_INFO() in the drivers you have.
> 
> At this point, if all the drivers that assign to hw_channel_info.config
> have been converted, this patch 1 is then suitable.
> 
> If there are still drivers that assign a u32 array to
> hw_channel_info.config, then you need to consider how to handle
> that without causing regressions. You can't cast it between a u32
> array and u64 array to silence the warning, because config[1]
> won't point at the next entry.
> 
> I think your only option would be to combine the conversion of struct
> hwmon_channel_info and the other drivers into a single patch. Slightly
> annoying, but without introducing more preprocessor yuckiness, I don't
> see another way.
> 

This is moot because the series does not explain which attributes
would be added ... and it turns out the to-be-added attributes would be
non-standard and thus not be acceptable anyway. On top of that, if the
size of configuration fields ever becomes an issue, I would look for a
much less invasive solution.

The author of this series did not contact me before submitting it,
and I did not have a chance to prevent it from being submitted.
Still, sorry for the noise.

Guenter


