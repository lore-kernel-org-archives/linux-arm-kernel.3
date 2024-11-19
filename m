Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF2CD44154
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bQE3MEJYF4o+UFy3/g+j32V4DdG9OeRnxp326DoaMI=; b=bPlVRgQz84ol1Gl3kBQ36uQVez
	b0BUfBd4cjYrT4lvj4ycM9Ry5zYDwn7XRpFgBvsncT/Nx4dgJ9rwLYh6Ubeq9DH2Zh0Yy0FPFON5h
	z+7kjanDKzrUQGrc+6cvb+DlkTLR4fCskJ3GQ1VZQhvx6Pm1dzjPJ0NMSEqZmJUDto+UDG3dr2DQ6
	s6PueDTTRmeQjJNyZ15R0k3553hdaOxB8/wyEPhjKNnN4BbrDiML2AQRAr070/clRa1ZvYFCO3geG
	DG+o7tShM6wxMhDsIR2qaE5iw55O0IJPPgApgHDiKSJMtIkZn1fj1zqQ+7BdBLWpauYOIf63oTFkg
	tXUZCfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNXx-0000000COYa-0dZB;
	Tue, 19 Nov 2024 12:41:33 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNX0-0000000COUr-2SLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:40:36 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xt3vB284Xz2GZk2;
	Tue, 19 Nov 2024 20:38:30 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 15470180041;
	Tue, 19 Nov 2024 20:40:28 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 19 Nov 2024 20:40:27 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] coresight: tmc: Don't change the buffer size if it's
 in use
To: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>, <mike.leach@linaro.org>,
	<coresight@lists.linaro.org>
References: <20241114081653.24328-1-yangyicong@huawei.com>
 <9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org>
 <0cfbd546-ee9a-da6e-904a-c1da4e59e286@huawei.com>
 <658fec30-af5e-4a90-bf5a-426aedb55e50@linaro.org>
 <df8967cd-2157-46a2-97d9-a1aea883cf63@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <7e2a3ff5-885e-f20c-6cd7-61ff9ff7ab04@huawei.com>
Date: Tue, 19 Nov 2024 20:40:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <df8967cd-2157-46a2-97d9-a1aea883cf63@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_044034_955079_B2582DA0 
X-CRM114-Status: GOOD (  42.41  )
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

On 2024/11/15 1:20, Suzuki K Poulose wrote:
> Hi,
> 
> Thanks for the report, see my comments inline.
> 
> On 14/11/2024 15:26, James Clark wrote:
>>
>>
>> On 14/11/2024 2:51 pm, Yicong Yang wrote:
>>> On 2024/11/14 18:30, James Clark wrote:
>>>>
>>>>
>>>> On 14/11/2024 8:16 am, Yicong Yang wrote:
>>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>>
>>>>> Enable the trace in below steps will crash the kernel by NULL pointer
>>>>> dereferencing:
>>>>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>>>>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>>>>> echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
>>>>> echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>>>>> dd if=/dev/tmc_etr0 of=test_etm_sysfs_etr_030.data
>>>>>
>>>>> The call trace will be like:
>>>>>    WARNING: CPU: 39 PID: 8586 at drivers/hwtracing/coresight/ coresight-tmc-etr.c:1123 __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>>>>    [...]
>>>>>    Call trace:
>>>>>     __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>>>>     tmc_read_prepare_etr+0xc0/0xd0 [coresight_tmc]
>>>>>     tmc_open+0x60/0xa0 [coresight_tmc]
>>>>>     misc_open+0x11c/0x170
>>>>>     chrdev_open+0xcc/0x2b0
>>>>>     do_dentry_open+0x140/0x4e0
>>>>>     vfs_open+0x34/0xf8
>>>>>     path_openat+0x2b0/0xf58
>>>>>     do_filp_open+0x8c/0x148
>>>>>     do_sys_openat2+0xb8/0xe8
>>>>>     __arm64_sys_openat+0x70/0xc0
>>>>>     el0_svc_common.constprop.0+0x64/0x148
>>>>>     do_el0_svc+0x24/0x38
>>>>>     el0_svc+0x40/0x140
>>>>>     el0t_64_sync_handler+0xc0/0xc8
>>>>>     el0t_64_sync+0x1a4/0x1a8
>>>>>    ---[ end trace 0000000000000000 ]---
>>>>>    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
>>>>>    [...]
>>>>>    Call trace:
>>>>>     tmc_etr_get_sysfs_trace+0x10/0x80 [coresight_tmc]
>>>>>     vfs_read+0xcc/0x310
>>>>>     ksys_read+0x74/0x108
>>>>>     __arm64_sys_read+0x24/0x38
>>>>>     el0_svc_common.constprop.0+0x64/0x148
>>>>>     do_el0_svc+0x24/0x38
>>>>>     el0_svc+0x40/0x140
>>>>>
>>>>> Due to the buffer size changed, the buffer will be reallocated in
>>>>> tmc_etr_get_sysfs_buffer() when the second source enabled. At trace
>>>>> end tmc_etr_sync_sysfs_buf() will reset the drvdata->sysfs_buf and
>>>>> trigger the later NULL pointer dereference when reading out the
>>>>> data.
>>>>>
>>>>> But it doesn't make sense to change the buffer size when it's
>>>>> already in use. So block such behavior.
>>>>>
>>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>>> ---
>>>>>    drivers/hwtracing/coresight/coresight-tmc-core.c | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ drivers/hwtracing/coresight/coresight-tmc-core.c
>>>>> index 475fa4bb6813..9660af63e9bc 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>>>> @@ -319,6 +319,11 @@ static ssize_t buffer_size_store(struct device *dev,
>>>>>        if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
>>>>>            return -EPERM;
>>>>>    +    /* Don't change the buffer size if it's in use */
>>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
> 
> Could we do something like this below ?
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f..863a645fa88a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1178,7 +1178,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>          */
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>         sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
> -       if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
> +       if (!sysfs_buf ||
> +           ((sysfs_buf->size != drvdata->size) &&
> +             coresight_get_mode(csdev) != CS_MODE_SYSFS))
>                 spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
>                 /* Allocate memory with the locks released */
> 
> i.e., do not allocate a new buffer if the sysfs mode is active. The new
> size can be set when the new session starts
> 

tested with steps in the commit and perf (below) simultaneously and don't see the
problem mentioned.
perf record -e cs_etm// -C 0 -- sleep 1 2>&1 > /dev/null

It's a bit confusing with this fix since we actually discard/delay the user's request
of changing the buffer size but no error/information returned to user. If this is not
a problem the fix is fine for me.

Thanks.

> 
>>>>
>>>> Size isn't used in perf mode is it? So it can be -EBUSY only when mode == CS_MODE_SYSFS.
>>>>
>>>
>>> alloc_etr_buf() on the perf path will read drvdata->size, not sure it matters if user
>>> change it through sysfs in the meanwhile. Will test and have a check if there are any
>>> other places using size on the perf path.
> 
> That was there to make sure the user can allocate a bigger buffer (of
> the AUX size vs sysfs configured size) and possibly collect more trace
> (i.e., in multiple aux buffers). But looks like that is not useful,
> given we can only ever collect to one AUX (the last one turning ETR off).
> 
> So we could remove that check.
> 
> Suzuki
> 
> 
>>>
>>
>> Hmmm I assumed that Perf mode completely ignored anything from sysfs mode. I see that alloc_etr_buf() does sometimes use the sysfs value. I don't really see why that's necessary because that means it sometimes ignores the buffer size from the perf command line depending on what's in sysfs, but the modes should be mutually exclusive.
>>
>> Unless we fix that then I think you do need to use the device spinlock. But I think we should tidy up alloc_etr_buf() to only try to allocate from the Perf size down to TMC_ETR_PERF_MIN_BUF_SIZE, ignoring drvdata-  >size. Then the behavior is less surprising to users and also anyone reading the code. And rename it to alloc_etr_buf_perf().
>>
>> Unless Suzuki knows of a reason it was done that way to begin with? I checked the commit message but it just says that it was like that but not why.
>>
>>>>> +        return -EBUSY;
>>>>> +
>>>>>        ret = kstrtoul(buf, 0, &val);
>>>>>        if (ret)
>>>>>            return ret;
>>>>
>>>> Looks ok to me. Although for consistency it might be worth changing to guard(mutex)(&coresight_mutex) because this is about sysfs mode only and other usages of mode and comments point to coresight_mutex. Using the device's spinlock will technically work but it did make me go and double check the code. And there are other cases of reading the mode like this:
>>>>
>>>
>>> ok, I thought to also serialize the use of drvdata->size. But as you mentioned
>>> use coresight_mutex is enough and will be consistenct with other places.
>>>
>>>> static ssize_t enable_source_show(struct device *dev,
>>>>                    struct device_attribute *attr,
>>>>                    char *buf)
>>>> {
>>>>      struct coresight_device *csdev = to_coresight_device(dev);
>>>>
>>>>      guard(mutex)(&coresight_mutex);
>>>>      return scnprintf(buf, PAGE_SIZE, "%u\n",
>>>>               coresight_get_mode(csdev) == CS_MODE_SYSFS);
>>>> }
>>>>
>>>> Mode can change to CS_MODE_PERF while inside coresight_mutex but the device would end up not being enabled for sysfs, so it's still ok to update the sysfs size value in that case.
>>>>
>>>> With that change:
>>>>
>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>
>>> Thanks.
>>>
>>
> 
> 
> .

