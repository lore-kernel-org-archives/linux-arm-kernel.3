Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A4ED3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kOJIq7pUg3mGJ75MZAjwvVXNtVVlgH9+izX3rJU590=; b=2/h0ShnYTInUmUUCtr8OjBzfPo
	aGIgwbQdApxJ9F+pkpqkL8EeblWr7isTEVS+DRYCFofP6CE+8TMgLkE46T9Lc+jlNxpLWIgxDz/x9
	dW924CYE6mtD93OfeDo6dbkiZdV3/wK3Ur/BrbFNcgf0HU78UXjSGnYAf2hxZVlbYlHBD9DTKrOyN
	maaq/HJZFNSI3l1p87vXJafUPiNqIzaA6GPqymkbhdX1M0toHIM7DuRVQLTZ/lWhm47p5n0sn7Zq3
	Y0r8TYiiX162I/Fy7MGO5BjdRWjRu0NXo/HQzu0SgqxxNVibcCRuC3paRrbkgvuBnc8Ni1Yc5gjz+
	PNeIB31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8bQ-00000003TPl-4A7v;
	Mon, 29 Dec 2025 08:27:45 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8bN-00000003TOn-1wze
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:27:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/kOJIq7pUg3mGJ75MZAjwvVXNtVVlgH9+izX3rJU590=;
	b=A3W1FT9CcyVYgqL7G7ovNf+z0lSZu4SKF+R47SHwUm0dUiQJDyd3gJfeRDAENK2OD+rX5eGEC
	43MIl9FB/xtSiQmDgu0cebaQZQmUwVb9hkSDwTBhUDXGiein8+m/CP9tod4TCt4IcF2yJgDsGpj
	vmmRg2xiCJBrrZIGTzTgKKw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dfq4w5xVHz1K96D;
	Mon, 29 Dec 2025 16:24:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id B3D6A40565;
	Mon, 29 Dec 2025 16:27:24 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 29 Dec 2025 16:27:24 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 29 Dec 2025 16:27:23 +0800
Subject: Re: [PATCH v4 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
To: Suzuki K Poulose <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<mike.leach@linaro.org>, <leo.yan@arm.com>
References: <20251111122149.1981162-1-hejunhao3@h-partners.com>
 <20251111122149.1981162-3-hejunhao3@h-partners.com>
 <15868ecb-c1e7-4273-a2e2-5c10f2701c0b@arm.com>
 <14a564bf-f9a2-c49c-9cd6-a5b68bc43500@h-partners.com>
 <a0ff9d15-c0e8-4ba2-9187-2abbe5676b01@arm.com>
CC: <anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jonathan.cameron@huawei.com>, Linuxarm
	<linuxarm@huawei.com>, Junhao He <hejunhao3@h-partners.com>
From: hejunhao <hejunhao3@h-partners.com>
Message-ID: <0406ae9f-28f6-44e1-26dd-8f243e7fc9fb@h-partners.com>
Date: Mon, 29 Dec 2025 16:27:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <a0ff9d15-c0e8-4ba2-9187-2abbe5676b01@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_002742_147342_EC488157 
X-CRM114-Status: GOOD (  38.94  )
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


On 2025/11/19 22:46, Suzuki K Poulose wrote:
> On 15/11/2025 02:09, hejunhao wrote:
>>
>>
>> On 2025/11/13 23:02, Suzuki K Poulose wrote:
>>> Hi Junhao,
>>>
>>> While your patch fixes the problem it introduces imbalance in the
>>> way perf vs sysfs modes are handled.
>>>
>>
>> Hi Suzuki,
>>
>> Thank you for your comments.
>>
>> What you mean is that, as long as tmc_etr_enable_hw() has not yet been
>> called (i.e., ETR hasn't been fully enabled), both the perf and sysfs 
>> sessions
>> have the opportunity to take ownership of ETR device?
>>
>> Based on the following sysfs-based ETR enablement sequence, the 
>> spinlock is
>> released at two points (denoted as points a and b).
>> At either of these points, perf may acquire the lock and invoke
>> tmc_etr_enable_hw() to complete the ETR initialization, resulting in
>> ETR_mode == PERF. This would interrupt the ongoing sysfs enablement
>> flow and effectively give precedence to perf over sysfs.
>>
>> mode:
>>    [sysfs mode]
>>    tmc_enable_etr_sink_sysfs()
>>      tmc_etr_get_sysfs_buffer()
>>        spin_lock(&drvdata->spinlock)
>>        sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
>>        if (!sysfs_buf || (sysfs_buf->size != drvdata->size))
>>          spin_unlock(&drvdata->spinlock)  <-- point a
>>          [sysfs buffer allocation]
>>          spin_lock(&drvdata->spinlock)
>>        drvdata->sysfs_buf = new_buf;
>>        spin_unlock(&drvdata->spinlock)  <-- point b
>>      spin_lock(&drvdata->spinlock)
>>      tmc_etr_enable_hw()
>>      spin_unlock(&drvdata->spinlock)
>>
>>    [perf mode]
>>    tmc_enable_etr_sink_perf()
>>      spin_lock(&drvdata->spinlock)
>>      tmc_etr_enable_hw()
>>      spin_unlock(&drvdata->spinlock)
>>
>> After the patch, both the perf and sysfs sessions contend fairly for 
>> the lock at
>> the entry point of tmc_enable_etr_sink(). The first to acquire the 
>> lock gains
>> exclusive control over the ETR sink for the remainder of the session.
>
> TBH, we don't care about fairness of the different modes of operation.
>
> 1. Perf must be given the priority - Because that provides a full easy
> framework for making any meaningful sense of the trace.
>
> 2. Sysfs mode should be only used for custom use cases, where you have
> full control of the system. (e.g., System bringup, Validation or event
> crash capture).
>
> In other words, if someone wants to use sysfs mode they must know what
> they are doing and not run any perf session in parallel.
>
Hi Suzuki,

I understand now.
This issue has been present for some time. Based on the discussion 
above, the
quickest way to resolve it is to revert to patch [1]. I will rebase the 
series onto
for-next, submit the next version.

Additionally, I might delay or suspend the planned refactoring of
the mode handling.

Thanks
Junhao

[1] 
https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

> Thanks
> Suzuki
>
>
>>
>>> On 11/11/2025 12:21, Junhao He wrote:
>>>> From: Junhao He <hejunhao3@huawei.com>
>>>>
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
>>>
>>> ^^ Could we not double check the mode here and break out ?
>>>
>>> Something like this :
>>>
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> index e0d83ee01b77..2097c57d19d0 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> @@ -1314,6 +1314,9 @@ static int tmc_enable_etr_sink_sysfs(struct 
>>> coresight_device *csdev)
>>>         if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>>                 csdev->refcnt++;
>>>                 goto out;
>>> +       } else if (coresight_get_mode(csdev) != CS_MODE_DISABLED) {
>>> +               ret = -EBUSY;
>>> +               goto out;
>>>         }
>>>
>>>         ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
>>>
>>>
>>> Suzuki
>>
>> Indeed, this approach addresses only the race condition between the 
>> perf and sysfs
>> components. It represents the simplest viable solution.
>>
>> This patch also resolves the potential null pointer dereference of 
>> drvdata->sysfs_buf,
>> which could occur when the buffer size is modified after ETR has 
>> already been
>> enabled, followed by enabling a second source device [1].
>>
>> If the refactored patch introduces additional issues, the 
>> implementation may be
>> reworked based on Yicong's original patches [2] ?
>>
>> [1]https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2- 
>> yangyicong@huawei.com/
>> [2]https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-4- 
>> yangyicong@huawei.com/
>>
>> Best regards,
>> Junhao.
>>
>>>
>>>
>>>>   tmc_etr_enable_hw()
>>>>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>>>>                                  the perf side
>>>>    spin_unlock(&drvdata->spinlock)
>>>>
>>>> A race condition is introduced here, perf always prioritizes 
>>>> execution, and
>>>> warnings can lead to concerns about potential hidden bugs, such as 
>>>> getting
>>>> out of sync.
>>>>
>>>> To fix this, configure the tmc-etr mode before invoking 
>>>> enable_etr_perf()
>>>> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
>>>> enabled in a different mode, and simplily the setup and checks for 
>>>> "mode".
>>>> To prevent race conditions between mode transitions.
>>>>
>>>> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation 
>>>> function for ETR")
>>>> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> Closes: https://lore.kernel.org/linux-arm- 
>>>> kernel/20241202092419.11777-2-yangyicong@huawei.com/
>>>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>>>> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> Signed-off-by: Junhao He <hejunhao3@h-partners.com>
>>>> ---
>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 106 
>>>> +++++++++---------
>>>>   1 file changed, 55 insertions(+), 51 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> index b07fcdb3fe1a..fe1d5e8a0d2b 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> @@ -1263,11 +1263,6 @@ static struct etr_buf 
>>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>>           raw_spin_lock_irqsave(&drvdata->spinlock, flags);
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
>>>> @@ -1278,7 +1273,6 @@ static struct etr_buf 
>>>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>>>           drvdata->sysfs_buf = new_buf;
>>>>       }
>>>>   -out:
>>>>       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>>         /* Free memory outside the spinlock if need be */
>>>> @@ -1289,7 +1283,7 @@ static struct etr_buf 
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
>>>> @@ -1299,23 +1293,10 @@ static int tmc_enable_etr_sink_sysfs(struct 
>>>> coresight_device *csdev)
>>>>         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
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
>>>>       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>>         if (!ret)
>>>> @@ -1729,39 +1710,24 @@ static int tmc_enable_etr_sink_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>   {
>>>>       int rc = 0;
>>>>       pid_t pid;
>>>> -    unsigned long flags;
>>>>       struct tmc_drvdata *drvdata = 
>>>> dev_get_drvdata(csdev->dev.parent);
>>>>       struct perf_output_handle *handle = data;
>>>>       struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>>>   -    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>>> -     /* Don't use this sink if it is already claimed by sysFS */
>>>> -    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>>>> -        rc = -EBUSY;
>>>> -        goto unlock_out;
>>>> -    }
>>>> -
>>>> -    if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>>>> -        rc = -EINVAL;
>>>> -        goto unlock_out;
>>>> -    }
>>>> +    if (WARN_ON(!etr_perf || !etr_perf->etr_buf))
>>>> +        return -EINVAL;
>>>>         /* Get a handle on the pid of the session owner */
>>>>       pid = etr_perf->pid;
>>>>         /* Do not proceed if this device is associated with another 
>>>> session */
>>>> -    if (drvdata->pid != -1 && drvdata->pid != pid) {
>>>> -        rc = -EBUSY;
>>>> -        goto unlock_out;
>>>> -    }
>>>> +    if (drvdata->pid != -1 && drvdata->pid != pid)
>>>> +        return -EBUSY;
>>>>   -    /*
>>>> -     * No HW configuration is needed if the sink is already in
>>>> -     * use for this session.
>>>> -     */
>>>> +    /* The sink is already in use for this session */
>>>>       if (drvdata->pid == pid) {
>>>>           csdev->refcnt++;
>>>> -        goto unlock_out;
>>>> +        return rc;
>>>>       }
>>>>         rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
>>>> @@ -1773,22 +1739,60 @@ static int tmc_enable_etr_sink_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>           csdev->refcnt++;
>>>>       }
>>>>   -unlock_out:
>>>> -    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>>>       return rc;
>>>>   }
>>>>     static int tmc_enable_etr_sink(struct coresight_device *csdev,
>>>>                      enum cs_mode mode, void *data)
>>>>   {
>>>> -    switch (mode) {
>>>> -    case CS_MODE_SYSFS:
>>>> -        return tmc_enable_etr_sink_sysfs(csdev);
>>>> -    case CS_MODE_PERF:
>>>> -        return tmc_enable_etr_sink_perf(csdev, data);
>>>> -    default:
>>>> -        return -EINVAL;
>>>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    int rc;
>>>> +
>>>> +retry:
>>>> +    scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
>>>> +        if (coresight_get_mode(csdev) != CS_MODE_DISABLED &&
>>>> +            coresight_get_mode(csdev) != mode)
>>>> +            return -EBUSY;
>>>> +
>>>> +        switch (mode) {
>>>> +        case CS_MODE_SYSFS:
>>>> +            if (drvdata->reading)
>>>> +                return -EBUSY;
>>>> +
>>>> +            if (csdev->refcnt) {
>>>> +                /* The sink is already enabled via sysfs */
>>>> +                csdev->refcnt++;
>>>> +                return 0;
>>>> +            }
>>>> +
>>>> +            /*
>>>> +             * A sysfs session is currently enabling ETR, preventing
>>>> +             * a second sysfs process from repeatedly triggering the
>>>> +             * enable procedure.
>>>> +             */
>>>> +            if (coresight_get_mode(csdev) == CS_MODE_SYSFS && ! 
>>>> csdev->refcnt)
>>>> +                goto retry;
>>>> +
>>>> +            /*
>>>> +             * Set ETR to sysfs mode before it is fully enabled, to
>>>> +             * prevent race conditions during mode transitions.
>>>> +             */
>>>> +            coresight_set_mode(csdev, mode);
>>>> +            break;
>>>> +        case CS_MODE_PERF:
>>>> +            return tmc_enable_etr_sink_perf(csdev, data);
>>>> +        default:
>>>> +            return -EINVAL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    rc = tmc_enable_etr_sink_sysfs(csdev);
>>>> +    if (rc) {
>>>> + guard(raw_spinlock_irqsave)(&drvdata->spinlock);
>>>> +        coresight_set_mode(csdev, CS_MODE_DISABLED);
>>>>       }
>>>> +
>>>> +    return rc;
>>>>   }
>>>>     static int tmc_disable_etr_sink(struct coresight_device *csdev)
>>>
>>>
>>> .
>>>
>>
>
>
> .
>


