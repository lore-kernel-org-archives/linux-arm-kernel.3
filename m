Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09ACD78306
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXlmNZxEsl6Jzw4YgMOFH6p/k8jdPidImXEfI1Sv5o4=; b=SLVAwSQtpHRbJPOR65UH3HiIMn
	KFG23JTwzqFOGndF3uixUi61ZrwxZIOoZMMWvaofB7+KtvUdJzXpQQn48htoUUlsffZMxd+NqC7Ua
	bBWA6NYrXJx8PwQq7cV3LEUx51IVzA9S77ism/Crj86ldRM+FTm/fLDSj2OjGEDzv2DNFp+E5luak
	AbIdrspgi+Oe2KhK8FzZg1ri/zfyBYuA/zuFebP//XCmXuJvWobjcbnILtowe00d2pljm3m81uWXB
	NpdCrpe8HkG+adAxa4aYzg96DtCww+YLC0v0MpWpNldal+IyqWZNIe9OlMXbmV3+7CVhwBsZ6EXUP
	gFx1QAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI45h-00000005mnJ-2dZv;
	Mon, 02 Dec 2024 10:55:45 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI44i-00000005mgO-0rDG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:54:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y20wg2BYBz1T5r4;
	Mon,  2 Dec 2024 18:52:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FFDF14011B;
	Mon,  2 Dec 2024 18:54:34 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 18:54:33 +0800
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <yangyicong@hisilicon.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] coresight: tmc-etr: Fix race condition between sysfs
 and perf mode
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20241202092419.11777-1-yangyicong@huawei.com>
 <20241202092419.11777-4-yangyicong@huawei.com>
 <62f5d1c5-05bd-41b6-8703-baacec3e2619@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b88ca1ef-469d-1c04-03f6-d51518b77bc2@huawei.com>
Date: Mon, 2 Dec 2024 18:54:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <62f5d1c5-05bd-41b6-8703-baacec3e2619@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_025444_554465_52BFB297 
X-CRM114-Status: GOOD (  20.91  )
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

On 2024/12/2 17:46, Suzuki K Poulose wrote:
> Hi Yicong
> 
> On 02/12/2024 09:24, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
>> in tmc_etr_enable_hw() is triggered sometimes:
>>
>>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>>   [..snip..]
>>   Call trace:
>>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>>    coresight_enable_path+0x1c8/0x218 [coresight]
>>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>>    enable_source_store+0x58/0xa8 [coresight]
>>    dev_attr_store+0x20/0x40
>>    sysfs_kf_write+0x4c/0x68
>>    kernfs_fop_write_iter+0x120/0x1b8
>>    vfs_write+0x2c8/0x388
>>    ksys_write+0x74/0x108
>>    __arm64_sys_write+0x24/0x38
>>    el0_svc_common.constprop.0+0x64/0x148
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x3c/0x130
>>    el0t_64_sync_handler+0xc8/0xd0
>>    el0t_64_sync+0x1ac/0x1b0
>>   ---[ end trace 0000000000000000 ]---
>>
>> Since the enablement of sysfs mode is separeted into two critical regions,
>> one for sysfs buffer allocation and another for hardware enablement, it's
>> possible to race with the perf mode. Fix this by double check whether
>> the perf mode's been used before enabling the hardware in sysfs mode.
> 
> Thanks for the fix. Some minor comments below.
> 
> It needs a Fixes tag.
> 
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 30 +++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index ad83714ca4dc..d382d95da5ff 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1230,6 +1230,36 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>         spin_lock_irqsave(&drvdata->spinlock, flags);
>>   +    /*
>> +     * Since the sysfs buffer allocation and the hardware enablement is not
>> +     * in the same critical region, it's possible to race with the perf
>> +     * mode:
>> +     *   [sysfs mode]                   [perf mode]
>> +     *   tmc_etr_get_sysfs_buffer()
>> +     *     spin_lock(&drvdata->spinlock)
>> +     *     [sysfs buffer allocation]
>> +     *     spin_unlock(&drvdata->spinlock)
>> +     *                                  spin_lock(&drvdata->spinlock)
>> +     *                                  tmc_etr_enable_hw()
>> +     *                                    drvdata->etr_buf = etr_perf->etr_buf
>> +     *                                  spin_unlock(&drvdata->spinlock)
>> +     *   spin_lock(&drvdata->spinlock)
>> +     *   tmc_etr_enable_hw()
>> +     *     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>> +     *                                  the perf side
>> +     *   spin_unlock(&drvdata->spinlock)
>> +     *
>> +     * So check here before continue.
>> +     */
>> +    if (coresight_get_mode(csdev) == CS_MODE_PERF) {
>> +        drvdata->sysfs_buf = NULL;
>> +        spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +        /* Free allocated memory out side of the spinlock */
>> +        tmc_etr_free_sysfs_buf(sysfs_buf);
>> +        return -EBUSY;
>> +    }
> 
> With this in place, I think we should remove the check for CS_MODE_PERF in get_etr_sysfs_buf() to avoid confusion (which I believe opened up this race)
> 

ok, considering that maybe we can optimize it a bit more in the tmc_etr_get_sysfs_buffer().
Check whether the perf mode's already running before we actually allocate the buffer.
Then we can save the time of allocating/freeing the sysfs buffer if race with the perf mode.

Thanks.


