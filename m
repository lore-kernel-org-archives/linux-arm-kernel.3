Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D254ED68B36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMnqEl2QX/kv6miVRhHYMr7KDYkHo0DvooRUl2CosCo=; b=NRUx1XNfgFZ019qZKzNuxT2s4Z
	8p6rl2cKT4RmSgdOIZwu36GQN67obl3LUCQCSfikJ1ByfR1e33PozPHtNCTuEeYgZlWMa1L5YFYrC
	lmU7RefdG65ap5L9VkN43mFXW32DP2KmqXkoY7crL3iTwEcWQjeuSJTPFX1mHSqDEUlcu3LzEASDL
	xd/hOV/7xDenZ1YiA/TAiPr/XS9QqKgjSNd2deOcQtML7+xyEnRlBgbrSDNWmfBSS6266+bIS3Fgt
	0Qu0TmmUzO9r0H3hXsB+/ZHLU8R0aoEwzHenTUplKTW+so/GC4GkJ/zD/872GFUmYvZ61CmJOk7M1
	yFzxxCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcrQ-00000000ABm-2bc1;
	Thu, 14 Nov 2024 16:38:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcpr-000000009ih-2CsL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WMnqEl2QX/kv6miVRhHYMr7KDYkHo0DvooRUl2CosCo=; b=U0tcTQvBJAe2MXPovgKqnaZJvE
	qCKyz/SAhv2mEYiKGdv/jw06aDwaDgGA4boNLCS5velg2i0kdme/aBgRANNgntcExQb/liScjcSbN
	OAP02mzQ47XhIPPXkQt1nW/CoUuwZ3IytR9RBi6zq+sz84mR0YEEQo7rD+bH3nU9BWmIdHaVFSBKs
	a8eaNuQ64Ozivv4CPNT1Hbs2qSLyKHiyo/KAxS1ZjEz1tH3iDYrNYsiB3I+ThBA1KDUJePudZ/4F5
	G6abg5GCszWw95ItM6eWf1T8GPN8IJW+c0lw6OIk9h7+o9my5D+kSV1uK1b16RDZ+u7+qZdaxCnMv
	9/TVDyTQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbDB-000000002LB-0bAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:52:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xq33318Jxz2DfPZ;
	Thu, 14 Nov 2024 22:49:51 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A29F2140259;
	Thu, 14 Nov 2024 22:51:42 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 22:51:41 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] coresight: tmc: Don't change the buffer size if it's
 in use
To: James Clark <james.clark@linaro.org>, <suzuki.poulose@arm.com>,
	<mike.leach@linaro.org>, <coresight@lists.linaro.org>
References: <20241114081653.24328-1-yangyicong@huawei.com>
 <9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <0cfbd546-ee9a-da6e-904a-c1da4e59e286@huawei.com>
Date: Thu, 14 Nov 2024 22:51:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_145249_186873_B4E7670B 
X-CRM114-Status: GOOD (  24.12  )
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

On 2024/11/14 18:30, James Clark wrote:
> 
> 
> On 14/11/2024 8:16 am, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Enable the trace in below steps will crash the kernel by NULL pointer
>> dereferencing:
>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
>> echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>> dd if=/dev/tmc_etr0 of=test_etm_sysfs_etr_030.data
>>
>> The call trace will be like:
>>   WARNING: CPU: 39 PID: 8586 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1123 __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>   [...]
>>   Call trace:
>>    __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>    tmc_read_prepare_etr+0xc0/0xd0 [coresight_tmc]
>>    tmc_open+0x60/0xa0 [coresight_tmc]
>>    misc_open+0x11c/0x170
>>    chrdev_open+0xcc/0x2b0
>>    do_dentry_open+0x140/0x4e0
>>    vfs_open+0x34/0xf8
>>    path_openat+0x2b0/0xf58
>>    do_filp_open+0x8c/0x148
>>    do_sys_openat2+0xb8/0xe8
>>    __arm64_sys_openat+0x70/0xc0
>>    el0_svc_common.constprop.0+0x64/0x148
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x40/0x140
>>    el0t_64_sync_handler+0xc0/0xc8
>>    el0t_64_sync+0x1a4/0x1a8
>>   ---[ end trace 0000000000000000 ]---
>>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
>>   [...]
>>   Call trace:
>>    tmc_etr_get_sysfs_trace+0x10/0x80 [coresight_tmc]
>>    vfs_read+0xcc/0x310
>>    ksys_read+0x74/0x108
>>    __arm64_sys_read+0x24/0x38
>>    el0_svc_common.constprop.0+0x64/0x148
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x40/0x140
>>
>> Due to the buffer size changed, the buffer will be reallocated in
>> tmc_etr_get_sysfs_buffer() when the second source enabled. At trace
>> end tmc_etr_sync_sysfs_buf() will reset the drvdata->sysfs_buf and
>> trigger the later NULL pointer dereference when reading out the
>> data.
>>
>> But it doesn't make sense to change the buffer size when it's
>> already in use. So block such behavior.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 475fa4bb6813..9660af63e9bc 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -319,6 +319,11 @@ static ssize_t buffer_size_store(struct device *dev,
>>       if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
>>           return -EPERM;
>>   +    /* Don't change the buffer size if it's in use */
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
> 
> Size isn't used in perf mode is it? So it can be -EBUSY only when mode == CS_MODE_SYSFS.
> 

alloc_etr_buf() on the perf path will read drvdata->size, not sure it matters if user
change it through sysfs in the meanwhile. Will test and have a check if there are any
other places using size on the perf path.

>> +        return -EBUSY;
>> +
>>       ret = kstrtoul(buf, 0, &val);
>>       if (ret)
>>           return ret;
> 
> Looks ok to me. Although for consistency it might be worth changing to guard(mutex)(&coresight_mutex) because this is about sysfs mode only and other usages of mode and comments point to coresight_mutex. Using the device's spinlock will technically work but it did make me go and double check the code. And there are other cases of reading the mode like this:
> 

ok, I thought to also serialize the use of drvdata->size. But as you mentioned
use coresight_mutex is enough and will be consistenct with other places.

> static ssize_t enable_source_show(struct device *dev,
>                   struct device_attribute *attr,
>                   char *buf)
> {
>     struct coresight_device *csdev = to_coresight_device(dev);
> 
>     guard(mutex)(&coresight_mutex);
>     return scnprintf(buf, PAGE_SIZE, "%u\n",
>              coresight_get_mode(csdev) == CS_MODE_SYSFS);
> }
> 
> Mode can change to CS_MODE_PERF while inside coresight_mutex but the device would end up not being enabled for sysfs, so it's still ok to update the sysfs size value in that case.
> 
> With that change:
> 
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks.


