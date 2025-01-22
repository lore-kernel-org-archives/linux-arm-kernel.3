Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72AAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 03:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alq2K4xgc0RqK/rZXD7bWtB6FGGPdwTBR9krmPvLQT8=; b=OoxWeAvvjt0IoHyqo7psC6KGTW
	dsediVO4so9o2jyZZ6OaM1DNwfWTQ05X5YKTr3yM4BQ0T/YoVRfEfDk0dUmrMcvkM/NIuF0OQ+0Wb
	MGG4yWBGrfSy+V4SH0TBdIeJHz2TFt6+Oq+D4hSDrA8fy37gfSv3UKoocs9ZiUy0cRPZN4tETMImW
	YBaThl8tCPXOm5mABEuIQLLn+FuXowwAe5XRmPeWDzC8F5kgsk/f4Ik97ihSz4e06tE4UBMm3hSZW
	1/Nyj5KSVAgDje8R+0IN97d7PMxEoyuS1I0BLdoR35GE+OsnvzcELWeezR6e++8Te2bqjYiOo0bTu
	7U+PUqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taRXT-00000009KQa-2MOC;
	Wed, 22 Jan 2025 03:36:23 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taRWB-00000009KJj-3OXg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 03:35:05 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yd8kb6CTFz1kygS;
	Wed, 22 Jan 2025 11:31:35 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FC281A016C;
	Wed, 22 Jan 2025 11:34:54 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 Jan 2025 11:34:54 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Jan
 2025 11:34:52 +0800
Message-ID: <4aa36466-6b22-738e-36ab-41413dd64a0c@huawei.com>
Date: Wed, 22 Jan 2025 11:34:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 01/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <oss-drivers@corigine.com>,
	<linux-rdma@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linuxarm@huawei.com>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<kernel@maidavale.org>, <pauk.denis@gmail.com>, <james@equiv.tech>,
	<sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <matt@ranostay.sg>,
	<mchehab@kernel.org>, <irusskikh@marvell.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <saeedm@nvidia.com>, <leon@kernel.org>,
	<tariqt@nvidia.com>, <louis.peens@corigine.com>, <hkallweit1@gmail.com>,
	<kabel@kernel.org>, <W_Armin@gmx.de>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <alexandre.belloni@bootlin.com>,
	<krzk@kernel.org>, <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <20250121064519.18974-2-lihuisong@huawei.com>
 <Z4_T3s7zn3UQNkbW@shell.armlinux.org.uk>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <Z4_T3s7zn3UQNkbW@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_193504_167730_0D23BF2B 
X-CRM114-Status: GOOD (  18.78  )
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


在 2025/1/22 1:05, Russell King (Oracle) 写道:
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
Yes.
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
got it. Thanks for suggestion.

