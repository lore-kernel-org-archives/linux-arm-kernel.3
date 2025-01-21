Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5796C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jf7WV5ga5PRFeHWUE2GCzgTBrGtNsbqhwozJ8Rj3Uww=; b=3yf+KZYa37g1vQqk4WSdcntIjM
	ZwyQfufQyv0TqTTSD8LEphi7lJGJlzPhfOvYXClRr4DlAiQGW0anILsOHr3JNXUncw95ZReXnpjgC
	U5bq/r5QFrs9kbJneAxicBHVl3b9aI8pazkszodFbI4CLPo3ULm1X0p2lukD/7HQRY5yMa3EFl/Cq
	HFguN87TGsr/hJ2Vu8rn1Ykka3lwThCUlexUUBKrvbDZ56ITdfDZ5gYlDjsuRIL7HbbHtRreoqzod
	62KRrUgPYumzIjtgwj0tP3vK3vJ9PRUn2sUFM5WuxA5l64RP5Je0LdeNQg7vzh5JjZiQjEVm9Zv4B
	hGA0r8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9Qu-00000007Ekn-45od;
	Tue, 21 Jan 2025 08:16:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9Pb-00000007ETd-42no
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:15:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ycg0F3dPczgc2x;
	Tue, 21 Jan 2025 16:11:41 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 65860140203;
	Tue, 21 Jan 2025 16:14:52 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 Jan 2025 16:14:52 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jan
 2025 16:14:50 +0800
Message-ID: <d42bf49b-e71b-d31e-2784-379076ebf370@huawei.com>
Date: Tue, 21 Jan 2025 16:14:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<oss-drivers@corigine.com>, <linux-rdma@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linuxarm@huawei.com>,
	<linux@roeck-us.net>, <jdelvare@suse.com>, <kernel@maidavale.org>,
	<pauk.denis@gmail.com>, <james@equiv.tech>, <sudeep.holla@arm.com>,
	<cristian.marussi@arm.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<saeedm@nvidia.com>, <leon@kernel.org>, <tariqt@nvidia.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <W_Armin@gmx.de>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <alexandre.belloni@bootlin.com>,
	<jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <870c6b3e-d4f9-4722-934e-00e9ddb84e2e@kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <870c6b3e-d4f9-4722-934e-00e9ddb84e2e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_001504_174037_0D8519D1 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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


在 2025/1/21 15:47, Krzysztof Kozlowski 写道:
> On 21/01/2025 07:44, Huisong Li wrote:
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
> Avoid combining independent patches into one patch bomb. Or explain the
> dependencies and how is it supposed to be merged - that's why you have
> cover letter here.
These patches having a title ('Use HWMON_CHANNEL_INFO macro to simplify 
code') are also for this series.
Or we need to modify the type of the 'xxx_config' array in these patches.
If we directly use the macro HWMON_CHANNEL_INFO, the type of 'config' 
has been modifyed in patch 1/21 and these driver don't need to care this 
change.

/Huisong
>
>
> .

