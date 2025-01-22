Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 03:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycCJe4iHPRkD54eEU7PyOP9GUqchf9MNTCeZuUiby6c=; b=u1yA7O+YnbnFCZ/w9U2Gu5SKBK
	X9od6AmDNxKCf1PPgJWapGPPZXtfEslvvbBGkmt1wsUumWBPP2MdDg/g5BhZImS6/inYFQfwWm3QM
	xymhViNGTKnb0B0vHv1QI30k1SNVaWldX+PCOpygiN9KUuebjXJzACJyvQ5Z+GnVj4SSjOQ7mv6sC
	NRBtoSQAWJ1cR3sds+UATsYmgZNbBkVcxjGvvNE6p4NAheDOjjXiuZpoRW2KWro64PVtk3rujhW+r
	TL3nd9WagZKn0gyt2yoCt2/vJG094U2I6SXWkq4nWSPrXmy85LMdg0JEkQv+I/DqUe6+4F14g3EAE
	3ynEIk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taRIN-00000009IgC-09R5;
	Wed, 22 Jan 2025 03:20:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taRH6-00000009IY1-0kL7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 03:19:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so140717825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 19:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737515967; x=1738120767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ycCJe4iHPRkD54eEU7PyOP9GUqchf9MNTCeZuUiby6c=;
        b=X12Sb7MFNmSY2MEsk/19zNRIfhumIB3fsVmc9XPUVuYLzBn4o5l61TwRWpC7x85wwU
         RUHV/B/NF7FA3wvHZ8/8ZCMAOQr1ppxTTZKBoCAgs9RR6XnK837qXTJt2CHFlwdvB5Oo
         jChzCdqXWm1l0ckaD9Jxw8MRbDLRDAemveBRcYYE5m8xZx0xqU6NdqSd7P5dtn4fI/ih
         d9LCkEsxqMsKqtn2eeRBJtvzwg920yeeaw896FtEzVSmzJl4FwAUrb+CGYTi5VNJRrgy
         Icrw6oAVHrNGPC2m2oi65h7mmeDQC8BUMeeSK0VdaO5cOFc63KGYp+Vaho3BsNJL/k4i
         257g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515967; x=1738120767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycCJe4iHPRkD54eEU7PyOP9GUqchf9MNTCeZuUiby6c=;
        b=QX676HVUksuRnYiUkISlV7xAPSUur+6AkDNlMR0cWZR6blA4LCbYSH/Q/HN4LK8G+d
         cweGmpOMkkCL+BXwt+4dhe478NzkapQDQzk20EJvjYLgu9antZ4dgCDuFI9GfPi4qfpv
         dXXxY4W0eqgIsATl9Hxj/nwAZFfwYtzntPFlYjRwQe33KOZArGQZ4lF5wkWVD9kqlj31
         OnIDnZZ/7/1CDwHsKCTgACVEpwOPyQTlyqAE0/iGtD/p36YPREJkwgQE9nEg6xjwtPcM
         MXYYBU5CDZ7sdaKqnoeoTFdtgLmH7K6w1UOFUqyVcZQbNMWOxYBBPH0g6tgjPiOKTw88
         IQtw==
X-Forwarded-Encrypted: i=1; AJvYcCXUjPoJMw9Ek2V0M9S4K3YfOBXy940FEcJyRcLvdxFRwUUCVV0fQZRB0yZf4poAzpYUmdMn8ehn4HG3SeEzPUqd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4/bARVcu+s6rhI48qYzrejgW2ooK7lqdXCOOwx4/ZPOPHGqVj
	LOY55/Mpb7kAn9KHXmstRrp4GUCyxi23oXakC5OhmWzk544uV+Lw
X-Gm-Gg: ASbGncvfQBzffcERmnl5JrJ4WQnqpliBJydDhGk/+5uZaD8A5c/0i+oLuIAioHjQG4p
	aXNZEkhU4nozXTMuOnGVsLOJH3kBwhgn77p6wAwcqLRL7Os1JM3eCaTnTGN2lhdfHw/FDtIRCd9
	8IGg52ldCOzGhlrofXPShxgm4sN6U9qQtwoLybNX0HoDHA+QrZXiEqcCZmhUHDkbolPQ5Rr+AoI
	Cw/+FpZuHoqD0PxV8YrpgnFOd+1bNfDfXzG6M/CjhWkY6PzeSgRCawFsRMW9rz9q34UooA5fBqr
	+wtTL1pyPw5PGsbD0EYIEKBSmqLv3SWFI53Gejozvos=
X-Google-Smtp-Source: AGHT+IEOuQB/DKea8GblfO+5X1HYu9hNJgnmEWoKRQBMmJDQJ7xU3ANrN9lhrrI96HZOMNUSbHisWw==
X-Received: by 2002:a05:6a20:748f:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1eb2160f41fmr35258743637.35.1737515967111;
        Tue, 21 Jan 2025 19:19:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba4eaacsm10183893b3a.135.2025.01.21.19.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 19:19:25 -0800 (PST)
Message-ID: <b965f04e-a706-4abf-89ed-4749a2c0b9b9@roeck-us.net>
Date: Tue, 21 Jan 2025 19:19:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: "lihuisong (C)" <lihuisong@huawei.com>, Armin Wolf <W_Armin@gmx.de>,
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
 <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
 <fd412ce2-ec40-fe73-6b1b-284a99a39f12@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fd412ce2-ec40-fe73-6b1b-284a99a39f12@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_191928_227253_8FEC86B0 
X-CRM114-Status: GOOD (  11.84  )
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

On 1/21/25 18:52, lihuisong (C) wrote:

>> Those are not hwmon attributes and should not be (or have been) exposed
>> as sysfs attributes in the first place, but (if really wanted/needed)
>> through debugfs files. Even _if_ exposed as sysfs attributes they should
>> not have the power1_ prefix (except maybe for the last one).
> I plan to accept the suggestion Armin proposed that acpi_power_meter can use the "extra_groups" parameter for these "not generic hwmon power attributes".
> Should we drop the power1_ prefix? But this will lead to the change of these attributes.
> Do you mean 'power1_is_battery' can be added to hwmon power attributes in hwmon.h?

No; power1_is_battery is still not a hardware monitoring attribute,
much less one to standardize. Also, don't change any attribute names.
They are wrong, but they are the ABI for this driver.

Guenter


