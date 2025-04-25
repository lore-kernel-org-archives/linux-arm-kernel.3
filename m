Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D65C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ClWEzmRneW0GwWNOjPK4pfd8RQDvOwvLGhk6NpunN8=; b=n9MfohIOgTmIt8dQHsUxmiYfRv
	YRmgKGTIp92L2KnSmAt4hXz9BXCVsOYxBdQ24K5OYG/2erLhE4ZYR/RDb2f1tV//8UnNVZI/xjxfk
	rnfk6bMXvQp0JfG1ljkUQRCxZFNnXCzCW4viBvFlBK+RFHpya92OP6p6ESJQ404c9MeIXCHBXvPDZ
	3o6XVG0aYRTJ8KCHNGshYbAZ0pzO6fZ7RcI6mtu4fPwm0hfdcWxlBXw+vg4VJvmPTEAgnEwxjGzEk
	Bnx6fWfgdiQWiaCjPmLspRa7MhiOmqgqrxDIGx5WaCROnQVjxAj9eornN6/6s+nXmsexCKmwOvPhu
	BXUtH5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88gx-0000000FlqN-3QCa;
	Fri, 25 Apr 2025 02:21:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88c5-0000000FlEt-3sJD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:16:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZkGfK6PbCz2TRys;
	Fri, 25 Apr 2025 10:15:53 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 966A71A0188;
	Fri, 25 Apr 2025 10:16:12 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 25 Apr 2025 10:16:12 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 25 Apr 2025 10:16:11 +0800
Subject: Re: [PATCH 3/4] coresight: tmc: refactor the tmc-etr mode setting
To: Jie Gan <jie.gan@oss.qualcomm.com>, <suzuki.poulose@arm.com>,
	<james.clark@arm.com>, <anshuman.khandual@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
 <20250418055820.3689408-4-hejunhao3@huawei.com>
 <49992acc-076d-429d-ac07-092d2fffbcb8@oss.qualcomm.com>
 <ce34c289-2ffc-426a-8b9e-6c8cc9e5e7bd@huawei.com>
 <54a505c9-b313-40f3-a69f-5f99835a510d@oss.qualcomm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <eef23241-915d-ad9d-f25a-0f52ee8ea429@huawei.com>
Date: Fri, 25 Apr 2025 10:16:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <54a505c9-b313-40f3-a69f-5f99835a510d@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_191626_263429_3319E055 
X-CRM114-Status: GOOD (  32.95  )
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


On 2025/4/23 10:07, Jie Gan wrote:
>
>
> On 4/22/2025 8:52 PM, hejunhao wrote:
>>
>> On 2025/4/18 15:12, Jie Gan wrote:
>>>
>>>
>>> On 4/18/2025 1:58 PM, Junhao He wrote:
>>>> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
>>>> in tmc_etr_enable_hw() is triggered sometimes:
>>>>
>>>>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/ 
>>>> coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>>>>   [..snip..]
>>>>   Call trace:
>>>>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>>>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>>>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>>>>    coresight_enable_path+0x1c8/0x218 [coresight]
>>>>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>>>>    enable_source_store+0x58/0xa8 [coresight]
>>>>    dev_attr_store+0x20/0x40
>>>>    sysfs_kf_write+0x4c/0x68
>>>>    kernfs_fop_write_iter+0x120/0x1b8
>>>>    vfs_write+0x2c8/0x388
>>>>    ksys_write+0x74/0x108
>>>>    __arm64_sys_write+0x24/0x38
>>>>    el0_svc_common.constprop.0+0x64/0x148
>>>>    do_el0_svc+0x24/0x38
>>>>    el0_svc+0x3c/0x130
>>>>    el0t_64_sync_handler+0xc8/0xd0
>>>>    el0t_64_sync+0x1ac/0x1b0
>>>>   ---[ end trace 0000000000000000 ]---
>>>>
>>>> Since the sysfs buffer allocation and the hardware enablement is not
>>>> in the same critical region, it's possible to race with the perf
>>>>
>>>> mode:
>>>>    [sysfs mode]                   [perf mode]
>>>>    tmc_etr_get_sysfs_buffer()
>>>>      spin_lock(&drvdata->spinlock)
>>>>      [sysfs buffer allocation]
>>>>      spin_unlock(&drvdata->spinlock)
>>>> spin_lock(&drvdata->spinlock)
>>>>                                   tmc_etr_enable_hw()
>>>>                                     drvdata->etr_buf = 
>>>> etr_perf->etr_buf
>>>> spin_unlock(&drvdata->spinlock)
>>>>   spin_lock(&drvdata->spinlock)
>>>>   tmc_etr_enable_hw()
>>>>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>>>>                                  the perf side
>>>>    spin_unlock(&drvdata->spinlock)
>>>>
>>>> To resolve this, configure the tmc-etr mode before invoking
>>>> `enable_perf()` or sysfs interfaces. Prior to mode configuration,
>>>> explicitly check if the tmc-etr sink is already enabled in a
>>>> different mode to prevent race conditions between mode transitions.
>>>> Furthermore, enforce spinlock protection around the critical
>>>> sections to serialize concurrent accesses from sysfs and perf
>>>> subsystems.
>>>
>>> Is any issue observed during this race condition?
>>>
>>> The etr_buf is checked before assign it to sysfs_buf or perf_buf.
>>> In my understanding, the warning raised to indicate the etr already 
>>> enabled with sysfs mode or perf mode, so terminate current enable 
>>> session, right?
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> The sysfs task is executing the process to enable tmc-etr and has 
>> allocated
>> a sysfs_buf. However, the sysfs spinlock does not ensure atomicity of 
>> the
>> entire enable_etr_sink_sysfs() function execution. In this scenario, 
>> the perf
>> session may preemptively call tmc_etr_enable_hw() to enable tmc-etr.
>>
>> Consequently, during race conditions, perf always prioritizes 
>> execution, and
>> the sysfs_buf remains un-released, leading to memory leaks. Then this 
>> triggers
>> a WARN_ON(drvdata->etr_buf) warning.
>
> The pre-allocated sysfs_buf is stored in drvdata->sysfs_buf. And I 
> think it's fine to remain unreleased until the ETR is enabled with 
> sysfs mode.

Yes, you're right. The tmc-etr is retaining the sysfs_buf, so no memory 
leak occurs.

> The ETR will not setup a new sysfs_buf if drvdata->sysfs_buf already 
> exists. But in other words, it definitely consumes some 
> memory(especailly allocated a large size of sysfs_buf) for a while or 
> forever if we dont enable the ETR with sysfs mode in the future?
>
> I think this is the issue try to address?
>

Patch 3 of patchset [1] is visible, serving as the basis, and you can 
understand what the patch aims to achieve.

This patch aims to avoid race conditions, as warnings can lead to 
concerns about potential hidden bugs, such
as getting out of sync. I may need to update the commit to include the 
commit log for patch 1's fix in patchset [1].

[1]: 
https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-4-yangyicong@huawei.com/

Best regards,
Junhao.

> Thanks,
> Jie
>
>>
>> This patch also addresses the issue described in [1], simplifying the 
>> setup and
>> checks for "mode".
>>
>> [1] Closes: https://lore.kernel.org/linux-arm- 
>> kernel/20241202092419.11777-2-yangyicong@huawei.com/
>>
>> Best regards,
>> Junhao.
>>
>>>>
>>>> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation 
>>>> function for ETR")
>>>> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> Closes: https://lore.kernel.org/linux-arm- 
>>>> kernel/20241202092419.11777-2-yangyicong@huawei.com/
>>>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>>>> ---
>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 77 
>>>> +++++++++++--------
>>>>   1 file changed, 47 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> index a48bb85d0e7f..3d94d64cacaa 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> @@ -1190,11 +1190,6 @@ static struct etr_buf 
>>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>>           spin_lock_irqsave(&drvdata->spinlock, flags);
>>>>       }
>>>>   -    if (drvdata->reading || coresight_get_mode(csdev) == 
>>>> CS_MODE_PERF) {
>>>> -        ret = -EBUSY;
>>>> -        goto out;
>>>> -    }
>>>> -
>>>>       /*
>>>>        * If we don't have a buffer or it doesn't match the 
>>>> requested size,
>>>>        * use the buffer allocated above. Otherwise reuse the 
>>>> existing buffer.
>>>> @@ -1205,7 +1200,6 @@ static struct etr_buf 
>>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>>           drvdata->sysfs_buf = new_buf;
>>>>       }
>>>>   -out:
>>>>       spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>>         /* Free memory outside the spinlock if need be */
>>>> @@ -1216,7 +1210,7 @@ static struct etr_buf 
>>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>>     static int tmc_enable_etr_sink_sysfs(struct coresight_device 
>>>> *csdev)
>>>>   {
>>>> -    int ret = 0;
>>>> +    int ret;
>>>>       unsigned long flags;
>>>>       struct tmc_drvdata *drvdata = 
>>>> dev_get_drvdata(csdev->dev.parent);
>>>>       struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>>>> @@ -1226,23 +1220,10 @@ static int tmc_enable_etr_sink_sysfs(struct 
>>>> coresight_device *csdev)
>>>>         spin_lock_irqsave(&drvdata->spinlock, flags);
>>>>   -    /*
>>>> -     * In sysFS mode we can have multiple writers per sink. Since 
>>>> this
>>>> -     * sink is already enabled no memory is needed and the HW need 
>>>> not be
>>>> -     * touched, even if the buffer size has changed.
>>>> -     */
>>>> -    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>>> -        csdev->refcnt++;
>>>> -        goto out;
>>>> -    }
>>>> -
>>>>       ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
>>>> -    if (!ret) {
>>>> -        coresight_set_mode(csdev, CS_MODE_SYSFS);
>>>> +    if (!ret)
>>>>           csdev->refcnt++;
>>>> -    }
>>>>   -out:
>>>>       spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>>         if (!ret)
>>>> @@ -1652,11 +1633,6 @@ static int tmc_enable_etr_sink_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>       struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>>>         spin_lock_irqsave(&drvdata->spinlock, flags);
>>>> -     /* Don't use this sink if it is already claimed by sysFS */
>>>> -    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>>> -        rc = -EBUSY;
>>>> -        goto unlock_out;
>>>> -    }
>>>>         if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>>>>           rc = -EINVAL;
>>>> @@ -1685,7 +1661,6 @@ static int tmc_enable_etr_sink_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>       if (!rc) {
>>>>           /* Associate with monitored process. */
>>>>           drvdata->pid = pid;
>>>> -        coresight_set_mode(csdev, CS_MODE_PERF);
>>>>           drvdata->perf_buf = etr_perf->etr_buf;
>>>>           csdev->refcnt++;
>>>>       }
>>>> @@ -1698,14 +1673,56 @@ static int tmc_enable_etr_sink_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>>>>                      enum cs_mode mode, void *data)
>>>>   {
>>>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    enum cs_mode old_mode;
>>>> +    int rc;
>>>> +
>>>> +    scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>>>> +        old_mode = coresight_get_mode(csdev);
>>>> +        if (old_mode != CS_MODE_DISABLED && old_mode != mode)
>>>> +            return -EBUSY;
>>>> +
>>>> +        if (drvdata->reading)
>>>> +            return -EBUSY;
>>>> +
>>>> +        /*
>>>> +         * In sysFS mode we can have multiple writers per sink. 
>>>> Since this
>>>> +         * sink is already enabled no memory is needed and the HW 
>>>> need not be
>>>> +         * touched, even if the buffer size has changed.
>>>> +         */
>>>> +        if (old_mode == CS_MODE_SYSFS) {
>>>> +            csdev->refcnt++;
>>>> +            return 0;
>>>> +        }
>>>> +
>>>> +        /*
>>>> +         * minor note:
>>>> +         * When sysfs-task1 get locked, it setup the mode first. Then
>>>> +         * sysfs-task2 gets locked，it will directly return success 
>>>> even
>>>> +         * when the tmc-etr is not enabled at this moment. 
>>>> Ultimately,
>>>> +         * sysfs-task1 will still successfully enable tmc-etr.
>>>> +         * This is a transient state and does not cause an anomaly.
>>>> +         */
>>>> +        coresight_set_mode(csdev, mode);
>>>> +    }
>>>> +
>>>>       switch (mode) {
>>>>       case CS_MODE_SYSFS:
>>>> -        return tmc_enable_etr_sink_sysfs(csdev);
>>>> +        rc = tmc_enable_etr_sink_sysfs(csdev);
>>>> +        break;
>>>>       case CS_MODE_PERF:
>>>> -        return tmc_enable_etr_sink_perf(csdev, data);
>>>> +        rc = tmc_enable_etr_sink_perf(csdev, data);
>>>> +        break;
>>>>       default:
>>>> -        return -EINVAL;
>>>> +        rc = -EINVAL;
>>>>       }
>>>> +
>>>> +    scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>>>> +        if (rc && old_mode != mode)
>>>> +            coresight_set_mode(csdev, old_mode);
>>>> +    }
>>>> +
>>>> +    return rc;
>>>>   }
>>>>     static int tmc_disable_etr_sink(struct coresight_device *csdev)
>>>
>>> .
>>>
>>
>
> .
>


