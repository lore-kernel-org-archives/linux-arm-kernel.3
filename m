Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA284CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA5vz8vzuIaX6iEvobPIRhcauzXwTsJJB7hi0ogzICA=; b=J/spaYrsVllmYfFRFnLFlNU7wT
	iq3kL53t6uNztJUasqQ5z7H2Su6Z8CPUaWIIdsQwYFSQJKON4AWd7x1+Ym0Tjn5PBtMjsHJE4WGOc
	HEVMocxrIGA5rJVBh4qQQwPPxCiixLZTH8zLk0sR81wIMJkbdOiRZXsjkgk/MzJLW5ACi5y10nfxY
	3EWgVWzW0MKxBvCJayDqsw41TQtXCTbND4doYP7G2IuLzpRpiFCMgNiQ5rdDe7Eyp8f+rZYQ/Epb3
	4rX8IdGfCw7IQs4oRWjQX0VECamMxx2u7HEHSNZHsm7ucz2iEonFEqS2eTuZBvynReqNEmk+z3OH/
	ZzIMdzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpx6-000000084id-49JM;
	Fri, 15 May 2026 10:39:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpx5-000000084iF-2jWF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 10:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rA5vz8vzuIaX6iEvobPIRhcauzXwTsJJB7hi0ogzICA=; b=Q3T23I+BUM6bwdtUq/jHGcIJaQ
	+UpYTkx3q/xEZQ3w2RI5HiPPs1TQPFwvvF6KI+eDRGu/FeMUt/UGRPA2G3YOLhB3MKdq7reHVXnKE
	/5p5JExo4VohlYJ/7S+UNCBIeMVFvti5KdJVE4Jyi/jxIUo1t/aLJArIGsRW51KfImgmoxznl/mXy
	lzzgvciB19gGr3zb3VsJBmxhQz3pnxPXDcohmA7Z4grL5hcRJInPg2i6RH5++xomJpqA9glgccCsQ
	p52zP9bYNG3BA3ieq2mCBKvs+2RslQNkG+/mWF8YpoBc6ga42dcEFhkFEyPmI/U0g+cOaLsDCOw9k
	W58kwksg==;
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpx0-00000004vHE-2Mqv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:39:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gH3R63NwnznTXv;
	Fri, 15 May 2026 18:32:02 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 123874048B;
	Fri, 15 May 2026 18:39:04 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 May
 2026 18:39:03 +0800
Message-ID: <6f160e25-9903-4f49-8a95-1192b7acb96d@hisilicon.com>
Date: Fri, 15 May 2026 18:39:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] devfreq: Get and put module refcount when
 switching governor
To: Yaxiong Tian <tianyaxiong@kylinos.cn>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-6-zhanjie9@hisilicon.com>
 <d6e83d90-0c2a-40a7-a939-298c3b393602@kylinos.cn>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <d6e83d90-0c2a-40a7-a939-298c3b393602@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_113928_045146_30724AA9 
X-CRM114-Status: GOOD (  17.58  )
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



On 5/14/2026 2:50 PM, Yaxiong Tian wrote:
> 
> 在 2026/5/13 17:38, Jie Zhan 写道:
>> A governor module can be dynamically inserted or removed if compiled as a
>> kernel module.  'devfreq->governor' would become NULL if the governor
>> module is removed when it's in use.
>>
>> To prevent the governor module from being removed (except for force
>> unload) when it's in use, get and put a refcount of the governor module
>> when starting and stopping the governor.
>>
>> As a result, unloading a governor module in use returns an error, e.g.:
>>    $ cat governor
>>    performance
>>    $ rmmod governor_performance
>>    rmmod: ERROR: Module governor_performance is in use
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>   drivers/devfreq/devfreq.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>> index e1363ab69173..2ea42325d030 100644
>> --- a/drivers/devfreq/devfreq.c
>> +++ b/drivers/devfreq/devfreq.c
>> @@ -345,24 +345,37 @@ static int devfreq_set_governor(struct devfreq *df,
>>                    __func__, df->governor->name, ret);
>>               return ret;
>>           }
>> +        module_put(old_gov->owner);
>>       }
>>         /* Start the new governor */
>> +    if (!try_module_get(new_gov->owner)) {
>> +        df->governor = NULL;
>> +        return -EINVAL;
>> +    }
>> +
> 
> Here, new_gov has already been checked in try_then_request_governor() for whether the module can be obtained.
> 
> I think it might be more reasonable to merge try_then_request_governor() and devfreq_set_governor(), so that when new_gov cannot be obtained, the operation of the old governor is not affected.
> 
Well yeah, indeed! I'll take a look at how to implement this.
Thanks for the suggestion.

Jie
>>       df->governor = new_gov;
>>       ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>       if (ret) {
>>           dev_warn(dev, "%s: Governor %s not started(%d)\n",
>>                __func__, df->governor->name, ret);
>> +        module_put(new_gov->owner);
>>             /* Restore previous governor */
>>           df->governor = old_gov;
>>           if (!df->governor)
>>               return ret;
>>   +        if (!try_module_get(old_gov->owner)) {
>> +            df->governor = NULL;
>> +            return -EINVAL;
>> +        }
>> +
>>           ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>           if (ret) {
>>               dev_err(dev, "%s: restore Governor %s failed (%d)\n",
>>                   __func__, df->governor->name, ret);
>> +            module_put(old_gov->owner);
>>               df->governor = NULL;
>>               return ret;
>>           }
>> @@ -1040,9 +1053,11 @@ int devfreq_remove_device(struct devfreq *devfreq)
>>         devfreq_cooling_unregister(devfreq->cdev);
>>   -    if (devfreq->governor)
>> +    if (devfreq->governor) {
>>           devfreq->governor->event_handler(devfreq,
>>                            DEVFREQ_GOV_STOP, NULL);
>> +        module_put(devfreq->governor->owner);
>> +    }
>>       device_unregister(&devfreq->dev);
>>         return 0;

