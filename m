Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A89C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVJN0sWxqaDviJO96beuUvXfIlWg6sK4NWcXwAhmrL8=; b=CcJJ+REnL6OPYYobMtEn0qSnKs
	WzmlOtMVQc20gd5IyXaORSai2NM0nPtHagktgr41loWdil0zL+HaUeCH02raIye7OqA/IxG5LPd6u
	wQckDvNQh+vOl0tr4b2pY6tGce7xGgcAaIug6krRmTIoHWWvsum6GSpeoaEYGYUh8eicFILycIpo4
	0oV1MnP9ZDGkcCS5W/9zz7khQ2lvr1Z0nBT68/7bdlSna71kxZmhjTUCyXt2dlYRImwulK3TYkwYf
	KD5T06dwHWRIVB+gBRBxNpXI+aTFgyv0GZgEaI9ZtValJXqo6/c3GRCYNS44RyBZis2Geg/iNQlY5
	CP08BNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5UP-0000000EB0J-0WQR;
	Sat, 19 Jul 2025 11:12:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5Ru-0000000EAnN-0fIP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 11:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bkkRm4th1ztSLD;
	Sat, 19 Jul 2025 19:08:36 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 66FB5180468;
	Sat, 19 Jul 2025 19:09:41 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:09:41 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:09:40 +0800
Subject: Re: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
To: Leo Yan <leo.yan@arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-3-hejunhao3@huawei.com>
 <20250702164729.GA1039028@e132581.arm.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <8e359805-ac00-8d19-f278-9172d9daef96@huawei.com>
Date: Sat, 19 Jul 2025 19:09:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20250702164729.GA1039028@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_040950_517149_B0A4D3CE 
X-CRM114-Status: GOOD (  31.46  )
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



On 2025/7/3 0:47, Leo Yan wrote:
> On Fri, Jun 20, 2025 at 03:54:11PM +0800, Junhao He wrote:
>
> [...]
>
>> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
>> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
>> enabled in a different mode, and simplily the setup and checks for "mode".
>> To prevent race conditions between mode transitions.
> I have a similiar fixing for CTI driver, see:
> https://lore.kernel.org/linux-arm-kernel/20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com/T/#maccd68b460fb8d74ccdd3504163d8f486f04178b
>
> [...]
>
>> @@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>>   			       enum cs_mode mode, void *data)
>>   {
>> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +	enum cs_mode old_mode;
>> +	int rc = -EINVAL;
>> +
>> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {

Ok, will fix it.

> I am concerned that the spinlock is acquired and released for several
> times in a single flow. It is possible to hit some corner case, e.g.,
>
> - CPU0 acquires the lock, set sink as SYSFS mode, and releases the lock;
> - CPU1 acquires the lock, detects the SYSFS mode has been set,
>    directly bail out, then enable ETM.
>
> The problem is the sink has not been enabled yet. This leads to CPU1
> to enable the tracer but prior to sink's enabling.

Yes, you are right. So I added a minor note for that. The impact of this 
corner case may not have been fully considered.

> The key piont is we should ensure the mode is consistent to the
> hardware state. I will take a bit time for if we can have a better idea
> for this.
>
>> +		old_mode = coresight_get_mode(csdev);
>> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
>> +			return -EBUSY;
>> +
>> +		if (drvdata->reading)
>> +			return -EBUSY;
>> +
>> +		/* In sysFS mode we can have multiple writers per sink. */
>> +		if (old_mode == CS_MODE_SYSFS) {
>> +			csdev->refcnt++;
> I am just wandering if we can unify the "refcnt" code for both SYSFS
> mode and Perf mode, and as a result, we can consolidate the code cross
> different drivers.
>
> Something like:
>
>                  if (!csdev->refcnt) {
>                          coresight_set_mode(csdev, mode);
>                  } else {
>                          /* The device has been configured with an incompatible mode */
>                          if (coresight_get_mode(csdev) != mode)
>                                  return -EBUSY;
>
>                          csdev->refcnt++;

we need to check the mode, cannot directly increase the reference count 
In performance mode.

>                  }
>
> Then when disable the device:
>
>                  csdev->refcnt--;
>                  if (!csdev->refcnt)
>                          coresight_set_mode(csdev, CS_MODE_DISABLED);
>
> We should not check "drvdata->reading" when enable or disable sink, as
> it is a flag to track if reading the trace buffer, it is irrelevant to
> the sink device's enabling or disabling.

In sysfs mode, it is necessary to check drvdata->reading.

>
> Please verify perf mode (especially for system wide session) to avoid
> anything missed.

I will refactor this code and upload a new version that includes all of 
your suggested solutions.

Thanks,
Junhao

> Thanks,
> Leo
>
>> +			return 0;
>> +		}
>> +
>> +		/*
>> +		 * minor note: In sysFS mode, the task1 get locked first, it setup
>> +		 * etr mode to SYSFS. Then task2 get locked，it will directly return
>> +		 * success even when the tmc-etr is not enabled at this moment.
>> +		 * Ultimately, task1 will still successfully enable tmc-etr.
>> +		 * This is a transient state and does not cause an anomaly.
>> +		 */
>> +		coresight_set_mode(csdev, mode);
>> +	}
>> +
>>   	switch (mode) {
>>   	case CS_MODE_SYSFS:
>> -		return tmc_enable_etr_sink_sysfs(csdev);
>> +		rc = tmc_enable_etr_sink_sysfs(csdev);
>> +		break;
>>   	case CS_MODE_PERF:
>> -		return tmc_enable_etr_sink_perf(csdev, data);
>> +		rc = tmc_enable_etr_sink_perf(csdev, data);
>> +		break;
>>   	default:
>> -		return -EINVAL;
>> +		rc = -EINVAL;
>>   	}
>> +
>> +	if (rc && old_mode != mode) {
>> +		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>> +			coresight_set_mode(csdev, old_mode);
>> +		}
>> +	}
>> +
>> +	return rc;
>>   }
>>   
>>   static int tmc_disable_etr_sink(struct coresight_device *csdev)
>> -- 
>> 2.33.0
>>
> .
>


