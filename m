Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12798C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pDMTcWpJsDRXzT/2JxMsS956FfhtnBwYmuLpB0+Kts=; b=1dXd7cFHuJYGPAty3YauRm/tsC
	FFs/q3KhGABgaoFCfU0HSzssbqZCVmOci/5rSOcYJhLPoBT61jE1v2r8ZwFywdrOmysYNiMFbw5WL
	A4R76azPlxvHP7sCoduPH/eUWZH+mQqxyB5KaTbRjl+6N2vNWtYL7614UgyAJrxZ8Fiie1OZUP2Y5
	/+eY3kYZQZp/LUfmdui5Mk1dAyC3dWMZpaYURpBZUPwG2YCDp+hki2KKLZimZ3fLIgWNo4oxrJgDt
	ToU2UD1Ach/Q7Z++YMTHiJPIREefHzCOzIK2uvrv6hvjxjmChYueTr00JD37GSsvgB4oGBpYa8yjI
	xEGLNsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszl0-0000000DLkn-2cpv;
	Fri, 14 Mar 2025 07:47:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszjJ-0000000DLSl-1WKb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:45:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZDbyF55mhz27gbb;
	Fri, 14 Mar 2025 15:45:41 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D5B01A0171;
	Fri, 14 Mar 2025 15:45:06 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Mar 2025 15:45:06 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 15:45:05 +0800
Subject: Re: [PATCH] coresight: Fixes device's owner field for registered
 using coresight_init_driver()
To: Suzuki K Poulose <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>
References: <20240918035327.9710-1-hejunhao3@huawei.com>
 <e2194d2a-0f51-4e59-a1ca-b4563b3389ec@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, hejunhao <hejunhao3@huawei.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <c3744062-f7c1-82df-2fa1-591da3b2dc5e@huawei.com>
Date: Fri, 14 Mar 2025 15:44:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <e2194d2a-0f51-4e59-a1ca-b4563b3389ec@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_004517_722827_3CE72299 
X-CRM114-Status: GOOD (  19.83  )
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

Hi Suzuki,

Could you confirm if this patch was queued in coresight/next or upstream 
of the mainline?

I couldn't find it in: kernel/git/coresight/linux.git or Kernel v6.14.0-rc4.

Maybe am I missing some information?

Best regards,
Junhao.


On 2024/9/18 16:29, Suzuki K Poulose wrote:
> On 18/09/2024 04:53, Junhao He wrote:
>> The coresight_init_driver() of the coresight-core module is called from
>> the sub coresgiht device (such as tmc/stm/funnle/...) module. It calls
>> amba_driver_register() and Platform_driver_register(), which are macro
>> functions that use the coresight-core's module to initialize the 
>> caller's
>> owner field.  Therefore, when the sub coresight device calls
>> coresight_init_driver(), an incorrect THIS_MODULE value is captured.
>>
>> The sub coesgiht modules can be removed while their callbacks are
>> running, resulting in a general protection failure.
>>
>> Add module parameter to coresight_init_driver() so can be called
>> with the module of the callback.
>>
>> Fixes: 075b7cd7ad7d ("coresight: Add helpers registering/removing 
>> both AMBA and platform drivers")
>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>
> Thanks for the fix, looks good to me. I will queue this for v6.13
>
> Suzuki
>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
>>   drivers/hwtracing/coresight/coresight-core.c       | 6 +++---
>>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 3 ++-
>>   drivers/hwtracing/coresight/coresight-funnel.c     | 3 ++-
>>   drivers/hwtracing/coresight/coresight-replicator.c | 3 ++-
>>   drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
>>   drivers/hwtracing/coresight/coresight-tpiu.c       | 2 +-
>>   include/linux/coresight.h                          | 2 +-
>>   9 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c 
>> b/drivers/hwtracing/coresight/coresight-catu.c
>> index bfea880d6dfb..337668f9cfd4 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -702,7 +702,7 @@ static int __init catu_init(void)
>>   {
>>       int ret;
>>   -    ret = coresight_init_driver("catu", &catu_driver, 
>> &catu_platform_driver);
>> +    ret = coresight_init_driver("catu", &catu_driver, 
>> &catu_platform_driver, THIS_MODULE);
>>       tmc_etr_set_catu_ops(&etr_catu_buf_ops);
>>       return ret;
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c 
>> b/drivers/hwtracing/coresight/coresight-core.c
>> index 9fc6f6b863e0..c546a417836c 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -1399,17 +1399,17 @@ module_init(coresight_init);
>>   module_exit(coresight_exit);
>>     int coresight_init_driver(const char *drv, struct amba_driver 
>> *amba_drv,
>> -              struct platform_driver *pdev_drv)
>> +              struct platform_driver *pdev_drv, struct module *owner)
>>   {
>>       int ret;
>>   -    ret = amba_driver_register(amba_drv);
>> +    ret = __amba_driver_register(amba_drv, owner);
>>       if (ret) {
>>           pr_err("%s: error registering AMBA driver\n", drv);
>>           return ret;
>>       }
>>   -    ret = platform_driver_register(pdev_drv);
>> +    ret = __platform_driver_register(pdev_drv, owner);
>>       if (!ret)
>>           return 0;
>>   diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c 
>> b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> index 75962dae9aa1..cc599c5ef4b2 100644
>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> @@ -774,7 +774,8 @@ static struct platform_driver 
>> debug_platform_driver = {
>>     static int __init debug_init(void)
>>   {
>> -    return coresight_init_driver("debug", &debug_driver, 
>> &debug_platform_driver);
>> +    return coresight_init_driver("debug", &debug_driver, 
>> &debug_platform_driver,
>> +                     THIS_MODULE);
>>   }
>>     static void __exit debug_exit(void)
>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c 
>> b/drivers/hwtracing/coresight/coresight-funnel.c
>> index 5a819c8970fb..8f451b051ddc 100644
>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>> @@ -433,7 +433,8 @@ static struct amba_driver dynamic_funnel_driver = {
>>     static int __init funnel_init(void)
>>   {
>> -    return coresight_init_driver("funnel", &dynamic_funnel_driver, 
>> &funnel_driver);
>> +    return coresight_init_driver("funnel", &dynamic_funnel_driver, 
>> &funnel_driver,
>> +                     THIS_MODULE);
>>   }
>>     static void __exit funnel_exit(void)
>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c 
>> b/drivers/hwtracing/coresight/coresight-replicator.c
>> index 3e55be9c8418..f7607c72857c 100644
>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>> @@ -438,7 +438,8 @@ static struct amba_driver 
>> dynamic_replicator_driver = {
>>     static int __init replicator_init(void)
>>   {
>> -    return coresight_init_driver("replicator", 
>> &dynamic_replicator_driver, &replicator_driver);
>> +    return coresight_init_driver("replicator", 
>> &dynamic_replicator_driver, &replicator_driver,
>> +                     THIS_MODULE);
>>   }
>>     static void __exit replicator_exit(void)
>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c 
>> b/drivers/hwtracing/coresight/coresight-stm.c
>> index 117dbb484543..403eea8f95d4 100644
>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>> @@ -1046,7 +1046,7 @@ static struct platform_driver 
>> stm_platform_driver = {
>>     static int __init stm_init(void)
>>   {
>> -    return coresight_init_driver("stm", &stm_driver, 
>> &stm_platform_driver);
>> +    return coresight_init_driver("stm", &stm_driver, 
>> &stm_platform_driver, THIS_MODULE);
>>   }
>>     static void __exit stm_exit(void)
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c 
>> b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index b54562f392f3..e31e36635394 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -742,7 +742,7 @@ static struct platform_driver tmc_platform_driver 
>> = {
>>     static int __init tmc_init(void)
>>   {
>> -    return coresight_init_driver("tmc", &tmc_driver, 
>> &tmc_platform_driver);
>> +    return coresight_init_driver("tmc", &tmc_driver, 
>> &tmc_platform_driver, THIS_MODULE);
>>   }
>>     static void __exit tmc_exit(void)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c 
>> b/drivers/hwtracing/coresight/coresight-tpiu.c
>> index b048e146fbb1..f9ecd05cbe5c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
>> @@ -318,7 +318,7 @@ static struct platform_driver 
>> tpiu_platform_driver = {
>>     static int __init tpiu_init(void)
>>   {
>> -    return coresight_init_driver("tpiu", &tpiu_driver, 
>> &tpiu_platform_driver);
>> +    return coresight_init_driver("tpiu", &tpiu_driver, 
>> &tpiu_platform_driver, THIS_MODULE);
>>   }
>>     static void __exit tpiu_exit(void)
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index f09ace92176e..e6c26952ddc2 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -660,7 +660,7 @@ coresight_find_output_type(struct 
>> coresight_platform_data *pdata,
>>                  union coresight_dev_subtype subtype);
>>     int coresight_init_driver(const char *drv, struct amba_driver 
>> *amba_drv,
>> -              struct platform_driver *pdev_drv);
>> +              struct platform_driver *pdev_drv, struct module *owner);
>>     void coresight_remove_driver(struct amba_driver *amba_drv,
>>                    struct platform_driver *pdev_drv);
>
>
> .
>


