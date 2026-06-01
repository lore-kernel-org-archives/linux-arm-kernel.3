Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6E8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 02:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMq/tc49SMdKnk2kZe6NiSfSfI4uUQ19b7sN5eBChAs=; b=DuMfTkl/3KEIJoRZ/k2hVeGwZf
	Z2FyNAOeisSQ5I0+YEl8ALlSAAp+UICDJOnf9S47+Pv9t/XbNjxYKxOimbmtkyoc9Wif/kb1u57ZT
	5nM4/ryX77H79a+njI0HQGBA2zau3WBNlFkygJTcpoUuIln0G8u9ujcsEqVr2aCVTio5Uuy33LR4l
	VgkFxLJW+78VVe3dHS5mGK1Y/KArsA/zozOXjvgyXgYYh4O+W91lLZ2QIfQX3TH865RFpbDNN7Qga
	cq8btkRF5LljG7RjMOKZ2jO6JeNnnGgheqjyr/Jmfask3dZzYQdpnVOavhoz74r+itCbZ6y7K81iO
	hjjHqE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTs04-0000000A2Y7-2WnI;
	Mon, 01 Jun 2026 02:03:32 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTs00-0000000A2Xk-3zO0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 02:03:30 +0000
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gTH9X3dkMzpStM;
	Mon,  1 Jun 2026 09:55:44 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id D5AF440569;
	Mon,  1 Jun 2026 10:03:18 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 10:03:18 +0800
Message-ID: <ceb7d509-39d1-4d80-91a0-e129d0c2ce7b@hisilicon.com>
Date: Mon, 1 Jun 2026 10:03:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] devfreq: Refcount governor modules while in use
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260519113251.3745140-1-zhanjie9@hisilicon.com>
 <20260519113251.3745140-5-zhanjie9@hisilicon.com>
 <5e503177-95e6-460a-b6b8-39f725da34a8@huawei.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <5e503177-95e6-460a-b6b8-39f725da34a8@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_190329_326757_51B730D5 
X-CRM114-Status: GOOD (  16.80  )
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



On 5/21/2026 4:13 PM, zhenglifeng (A) wrote:
> On 5/19/2026 7:32 PM, Jie Zhan wrote:
>> A governor module can be inserted or removed dynamically when built as a
>> kernel module.  'devfreq->governor' would become NULL if the governor
>> module is removed when it's in use.
>>
>> Add a refcount mechanism for governor modules to prevent the governor
>> module from being removed (except for force unload):
>> 1. Add an optional 'owner' member to struct devfreq_governor so the devfreq
>>    core can identify the module that holds the governor code.
>> 2. Get and put a refcount of the governor module when starting and stopping
>>    the governor.
>>
>> The new 'owner' field is optional:
>> - Common governor modules (performance, powersave, simple_ondemand,
>>   userspace, passive) set 'owner' to THIS_MODULE.
>> - Governors that are bundled into a device driver module must leave 'owner'
>>   NULL.  The device's lifetime already pins that module, and setting
>>   'owner' would create a self-reference that blocks the driver from being
>>   unloaded.
>>
>> As a result, a non-forced rmmod of an in-use stand-alone governor now
>> fails with -EBUSY, e.g.:
>>
>>   $ cat governor
>>   performance
>>   $ rmmod governor_performance
>>   rmmod: ERROR: Module governor_performance is in use
>>
>> Force unloads (rmmod -f, if configured) can't be blocked.
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>  drivers/devfreq/devfreq.c                 | 17 ++++++++++++++++-
>>  drivers/devfreq/governor_passive.c        |  1 +
>>  drivers/devfreq/governor_performance.c    |  1 +
>>  drivers/devfreq/governor_powersave.c      |  1 +
>>  drivers/devfreq/governor_simpleondemand.c |  1 +
>>  drivers/devfreq/governor_userspace.c      |  1 +
>>  include/linux/devfreq-governor.h          | 11 +++++++++++
>>  7 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>> index 9e3e6a7348f8..1cee43636ded 100644
>> --- a/drivers/devfreq/devfreq.c
>> +++ b/drivers/devfreq/devfreq.c
>> @@ -345,24 +345,37 @@ static int devfreq_set_governor(struct devfreq *df,
>>  				 __func__, df->governor->name, ret);
>>  			return ret;
>>  		}
>> +		module_put(old_gov->owner);
>>  	}
>>  
>>  	/* Start the new governor */
>> +	if (!try_module_get(new_gov->owner)) {
>> +		df->governor = NULL;
> 
> Shouldn't the old governor be restored here?
> 
Yeah.  Perhaps we just move try_module_get() before stopping the old
governor so as to avoid another hunk of restoring governor.
>> +		return -EINVAL;
>> +	}
>> +
>>  	df->governor = new_gov;
>>  	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>  	if (ret) {
>>  		dev_warn(dev, "%s: Governor %s not started(%d)\n",
>>  			 __func__, df->governor->name, ret);
>> +		module_put(new_gov->owner);
>>  
>>  		/* Restore previous governor */
>>  		df->governor = old_gov;
>>  		if (!df->governor)
>>  			return ret;
>>  
>> +		if (!try_module_get(old_gov->owner)) {
>> +			df->governor = NULL;
>> +			return -EINVAL;
>> +		}
>> +
>>  		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>  		if (ret) {
>>  			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
>>  				__func__, df->governor->name, ret);
>> +			module_put(old_gov->owner);
>>  			df->governor = NULL;
>>  			return ret;
>>  		}
[ ... ]

