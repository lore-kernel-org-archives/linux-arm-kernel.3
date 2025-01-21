Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD00CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyjXj6/KNDcVjaCHEulSXz/uI9P6HE6Zw6E3MuTClVs=; b=dT9N1NmGM5EJ+R2KIDaVSIdMjz
	9DvPo3tOhqyTXc9XMyE5g9uybO6B5TMchBkQXw+AcrYBOMHDPAdeLCD6E3oXPJ1Fp4of2VnIzQIqY
	ff/B92oYj5gNktUOUXbhbPZB14ULyry3BygMKw5gRW+eh4ReXbBKW49QYxX5FQWxYt9rBllFxnBSE
	mIaYiOz+rWFPVR/P0klzeAKw+HHMsZ/0DiSQPwGYJpPd3wtqRGzl3s1YQ5Smhp+9toJlAHpSycbtl
	vUUWfPQeH+qEcXQyLG2UQNywPQPhJy0WRC2tIhUaLL9pvQ+7pIiTu9ke2IpRfLAh8ti6SppF3bska
	kchQh3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFbb-0000000880y-3WQH;
	Tue, 21 Jan 2025 14:51:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFZt-000000087eu-3cig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:50:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163b0c09afso103678415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737471004; x=1738075804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tyjXj6/KNDcVjaCHEulSXz/uI9P6HE6Zw6E3MuTClVs=;
        b=AydLh2J1L0dwrWGes1l0Lg4sR9QsDxbSJnrKdYjAHB48G/OIjubTZVng667eVCtMXU
         47CJ7gtBonkHuC2kD3d9Hx9/XLtV7e/M+O4NP9f3ypOsyjie0/9zWSV7u0qKddwsTUKd
         C1LvbMtAzQ9JupJIK2k3rCNtt8XB41tV1sqR3Ix9Zhog1ExFjvyj6AE8h0f7+8IgMYyM
         gneGhb9DIpf+yfwVEIGuVywK8Eyb3+SFM5MxRXzr8QQuAFj29VQ4D2KuPcACYYVLzCJr
         VZXsLHEdyB1mTH96+TRmGdzxgwKv1OOBDBpPH4WxxhzLP9YNcO6EuxhzSAlWZrKK4E+j
         Pwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471004; x=1738075804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyjXj6/KNDcVjaCHEulSXz/uI9P6HE6Zw6E3MuTClVs=;
        b=IloiSMWwLRnApi6c6n0DhwfYwufV27aYOzmQ8sbrZME11id1l9zTIPqydAefSd4gxs
         OFJbCb+gea5vyB9cWRe5GWNBJrVuYGeOS+RYAWwjd98AK2+D26VilwrHKyaUZZOEm2gX
         jNo/l3ZIiwPC24a+FsRfb2ycw0D3LlIxZKsF4AkdmVLGrGA9vhBzGdN5uKNeDHb11rk0
         e8RL0VNRoVzI86ktVQ7Oe4CxAjVSx8VB5vl37mDQCrUwDNrSF06mysSpO8Tr9snlj93d
         2HTS4xIXOuk192I0FIu6ebxjzY14johuB+2gZo2S1ofnZDeMbL1/31vwgVJgU2IkJF+Q
         V7eA==
X-Forwarded-Encrypted: i=1; AJvYcCX+q6BX882VKWDZ5oA9hemrd4fu91XUSpZX9uoPVdkf7hk+uQiEvVde0jiIPyGMQNBasBHnNfhZB0KzkAsuZr6X@lists.infradead.org
X-Gm-Message-State: AOJu0YwCbgfe+cbXOqKxftBrg++AKwqHFxbF9z3X6079mY8JsTF6Cc7Z
	1xGq4DeNQtO5ZqwGOEBxT7iPsz24ebCJBszhEwXik4FRZGEHP6oD
X-Gm-Gg: ASbGncuL6wVcbdjxSFZ7RAavXeA2jIdIP6dQn0fVD4hHPORRa4KAPTk/OAL/Rt7KDfX
	xdjGEuvA89vFI6X5tlSvKG+21aA0t7FuyF6nSupbH5v86dciBp0Y1Yz4WdNcnZizLMayHCPC6x/
	ZBArAt5xEVVFnyIKsdvU5sU2qVvpOZ97luF6ImJaNs8eJ//Dj7PE4V6CymxXKd/41oRZuQE8n+U
	96U60ZIPB7YFT7VviwQqre1OuBD7TJUuy3Azu94UM8X85zjzxcpgHNKIn3BZgQQyxWDQBTRLZNZ
	CchIONuw8PyeCoo/yEFb1B2fNwJ+oRc3eIUeGtlVz9o=
X-Google-Smtp-Source: AGHT+IGa8euy8ctdPku6RH9wn/ij1IoREIcMzIg1bS3C5EBD9/bby5gxudV4Xq/7CPl6KPAotuFPGA==
X-Received: by 2002:a17:902:e74b:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-21c35513386mr223610615ad.20.1737471004421;
        Tue, 21 Jan 2025 06:50:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d402d40sm78437145ad.231.2025.01.21.06.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:50:03 -0800 (PST)
Message-ID: <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
Date: Tue, 21 Jan 2025 06:50:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: Armin Wolf <W_Armin@gmx.de>, Huisong Li <lihuisong@huawei.com>,
 linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
 linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linuxarm@huawei.com, jdelvare@suse.com, kernel@maidavale.org,
 pauk.denis@gmail.com, james@equiv.tech, sudeep.holla@arm.com,
 cristian.marussi@arm.com, matt@ranostay.sg, mchehab@kernel.org,
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, saeedm@nvidia.com,
 leon@kernel.org, tariqt@nvidia.com, louis.peens@corigine.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, kabel@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 alexandre.belloni@bootlin.com, krzk@kernel.org, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_065005_906542_009CC9B1 
X-CRM114-Status: GOOD (  21.18  )
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

On 1/21/25 06:12, Armin Wolf wrote:
> Am 21.01.25 um 07:44 schrieb Huisong Li:
> 
>> The hwmon_device_register() is deprecated. When I try to repace it with
>> hwmon_device_register_with_info() for acpi_power_meter driver, I found that
>> the power channel attribute in linux/hwmon.h have to extend and is more
>> than 32 after this replacement.
>>
>> However, the maximum number of hwmon channel attributes is 32 which is
>> limited by current hwmon codes. This is not good to add new channel
>> attribute for some hwmon sensor type and support more channel attribute.
>>
>> This series are aimed to do this. And also make sure that acpi_power_meter
>> driver can successfully replace the deprecated hwmon_device_register()
>> later.
> 

This explanation completely misses the point. The series tries to make space
for additional "standard" attributes. Such a change should be independent
of a driver conversion and be discussed on its own, not in the context
of a new driver or a driver conversion.

> Hi,
> 
> what kind of new power attributes do you want to add to the hwmon API?
> 
> AFAIK the acpi-power-meter driver supports the following attributes:
> 
>      power1_accuracy            -> HWMON_P_ACCURACY
>      power1_cap_min            -> HWMON_P_CAP_MIN
>      power1_cap_max            -> HWMON_P_CAP_MAX
>      power1_cap_hyst            -> HWMON_P_CAP_HYST
>      power1_cap            -> HWMON_P_CAP
>      power1_average            -> HWMON_P_AVERAGE
>      power1_average_min        -> HWMON_P_AVERAGE_MIN
>      power1_average_max        -> HWMON_P_AVERAGE_MAX
>      power1_average_interval        -> HWMON_P_AVERAGE_INTERVAL
>      power1_average_interval_min    -> HWMON_P_AVERAGE_INTERVAL_MIN
>      power1_average_interval_max    -> HWMON_P_AVERAGE_INTERVAL_MAX
>      power1_alarm            -> HWMON_P_ALARM
>      power1_model_number
>      power1_oem_info
>      power1_serial_number
>      power1_is_battery
>      name                -> handled by hwmon core
> 
> The remaining attributes are in my opinion not generic enough to add them to the generic
> hwmon power attributes. I think you should implement them as a attribute_group which can
> be passed to hwmon_device_register_with_info() using the "extra_groups" parameter.
> 

I absolutely agree. More specifically, it looks like this is about the following
attributes.

 >      power1_model_number
 >      power1_oem_info
 >      power1_serial_number
 >      power1_is_battery

Those are not hwmon attributes and should not be (or have been) exposed
as sysfs attributes in the first place, but (if really wanted/needed)
through debugfs files. Even _if_ exposed as sysfs attributes they should
not have the power1_ prefix (except maybe for the last one).

On top of that, doubling the size of configuration bits for everything
because one sensor type needs more than 32 bits seems excessive.
If we ever get to that point I think I'd rather introduce a second
sensor type for power sensor attributes.

Guenter


