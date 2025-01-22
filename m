Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2E7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWtwN2y9htoF2/ngnM+5j1uHKmVDNRI5Y+z51fo5zQI=; b=1yqbRBAa7SPhYEfnD/VZM61dLv
	PiUIdJEOVaYcwveyONQixP2ZDd/XxRrKtWCs7dkLg4VW7FjopNvkPDBl1pyR0N7+oN1jod43UJz88
	dLuk2dDH4jbdwJDqGDJbLArj+PJflRGZMMEtt5QKy/rl26e4IoGSds4sGGknWJdirIkT0b0rcvQ+o
	9L4YadoouNuYuYs95wUQyO9lLIKM/b3q9JyVC0tMVrivzREHFBRSHFjYl1/p5KDjwOimjH6PU4RQD
	A5NvVZKRrBfMRnLOoeP9Wv9Jo2meDldLEL2KWlA63q6dpAEvq+T32gF/x58PwY9sE2kCd8htYPCqE
	RQuPB/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTlq-00000009RUc-3EZd;
	Wed, 22 Jan 2025 05:59:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTkW-00000009RIq-0Oxk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 05:58:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YdCxW310SzmZ87;
	Wed, 22 Jan 2025 13:56:15 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DF251400D1;
	Wed, 22 Jan 2025 13:57:54 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 Jan 2025 13:57:54 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Jan
 2025 13:57:52 +0800
Message-ID: <ef34bf8a-c8d9-13bb-011c-6a4365bb3cb8@huawei.com>
Date: Wed, 22 Jan 2025 13:57:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 19/21] platform/x86: dell-ddv: Fix the type of 'config'
 in struct hwmon_channel_info to u64
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-hwmon@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <oss-drivers@corigine.com>,
	<linux-rdma@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linuxarm@huawei.com>, <linux@roeck-us.net>, <jdelvare@suse.com>,
	<kernel@maidavale.org>, <pauk.denis@gmail.com>, <james@equiv.tech>,
	<sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <matt@ranostay.sg>,
	<mchehab@kernel.org>, <irusskikh@marvell.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <saeedm@nvidia.com>, <leon@kernel.org>,
	<tariqt@nvidia.com>, <louis.peens@corigine.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <kabel@kernel.org>, <W_Armin@gmx.de>, Hans de Goede
	<hdegoede@redhat.com>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
	<jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <20250121064519.18974-20-lihuisong@huawei.com>
 <844c5097-eeb7-7275-7558-83ca4e5ee4b2@linux.intel.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <844c5097-eeb7-7275-7558-83ca4e5ee4b2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_215800_438438_FE47A683 
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


在 2025/1/21 20:18, Ilpo Järvinen 写道:
> On Tue, 21 Jan 2025, Huisong Li wrote:
>
>> The type of 'config' in struct hwmon_channel_info has been fixed to u64.
>> Modify the related code in driver to avoid compiling failure.
> Does this mean that after applying part of your series but not yet this
> patch, compile would fail? If so, it's unacceptable. At no point in a
> patch series are you allowed to cause a compile failure because it hinders
> 'git bisect' that is an important troubleshooting tool.
>
> So you might have to combine changes to drivers and API if you make an
> API change that breaks driver build until driver too is changed. Note that
> it will impact a lot how quickly your patches can be accepted as much
> higher level of coordination is usually required if your patch is touching
> things all over the place, but it cannot be avoided at times. And
> requirement of doing minimal change only will be much much higher in such
> a large scale change.
>
Ack. Thanks for your reply.
>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/platform/x86/dell/dell-wmi-ddv.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
>> index e75cd6e1efe6..efb2278aabb9 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
>> @@ -86,7 +86,7 @@ struct thermal_sensor_entry {
>>   
>>   struct combined_channel_info {
>>   	struct hwmon_channel_info info;
>> -	u32 config[];
>> +	u64 config[];
>>   };
>>   
>>   struct combined_chip_info {
>> @@ -500,7 +500,7 @@ static const struct hwmon_ops dell_wmi_ddv_ops = {
>>   
>>   static struct hwmon_channel_info *dell_wmi_ddv_channel_create(struct device *dev, u64 count,
>>   							      enum hwmon_sensor_types type,
>> -							      u32 config)
>> +							      u64 config)
>>   {
>>   	struct combined_channel_info *cinfo;
>>   	int i;
>> @@ -543,7 +543,7 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
>>   							    struct dell_wmi_ddv_sensors *sensors,
>>   							    size_t entry_size,
>>   							    enum hwmon_sensor_types type,
>> -							    u32 config)
>> +							    u64 config)
>>   {
>>   	struct hwmon_channel_info *info;
>>   	int ret;
>>
> .

