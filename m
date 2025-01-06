Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A85E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L72ba9T/btVaZ0v7zbxCUtLo4e4u4BCECDvuXWYYoyM=; b=HNhOsN3CEYsa9veZkdtm5pNl/4
	sLsK1peLOk1sD7KN1sipkyKvPW5i+dQl3lBP+DvteTN3dR00LNYvX/t0awIh1JnYUFEPoAI4rECE4
	JGDFBnAplcx0HRZ+cTJQrIPqV9sJI1rumhYuy4V1pa3XxcFhKhLYcCTZgzc3lvXJ4BHZes0GD5HnL
	ZqPCPxvdwT0BA2nfd3XUF42OKTvy/slwZFugmgl+LMOdpVld1D+IG+FbzDTgldCL2LB3aTobfIeyK
	jrcgAc4yPM2WaAsoGS6c2JdJNgA5QfIdAsx7P5IQj98pLoYHVdVacZTnzUliMcAiV8RO60ji73V2O
	yVSAV/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoyK-00000001km0-0RC7;
	Mon, 06 Jan 2025 15:24:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUox6-00000001kMI-2na0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:23:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F007E1476;
	Mon,  6 Jan 2025 07:24:03 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84A823F7BD;
	Mon,  6 Jan 2025 07:23:34 -0800 (PST)
Message-ID: <dfbca7cc-1e9d-4c78-9790-adcfdf0e2fa4@arm.com>
Date: Mon, 6 Jan 2025 15:23:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
To: Yeo Reum Yun <YeoReum.Yun@arm.com>,
 "mike.leach@linaro.org" <mike.leach@linaro.org>,
 "james.clark@linaro.org" <james.clark@linaro.org>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nd <nd@arm.com>
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
 <GV1PR08MB1052128A5BBEC4E0A9090387FFB0A2@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <208b72a1-06eb-4ac0-8104-20ae3f0cf174@arm.com>
 <GV1PR08MB1052189E5AE025F139F0A3526FB102@GV1PR08MB10521.eurprd08.prod.outlook.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <GV1PR08MB1052189E5AE025F139F0A3526FB102@GV1PR08MB10521.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_072336_795442_6E8FD3DE 
X-CRM114-Status: GOOD (  25.41  )
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

On 06/01/2025 13:41, Yeo Reum Yun wrote:
> Hi Suzuki,
> 
> Sorry this ping was my mistake.
> As you said, v2 is the recent one.
> You can ignore this.
> 

Thanks, will respond on v2.

Also, fyi, your emails not plain text ! Please fix your email client.

Suzuki


> Thanks!
> ------------------------------------------------------------------------
> *보낸 사람:* Suzuki K Poulose <suzuki.poulose@arm.com>
> *보낸 날짜:* Monday, January 6, 2025 1:37:40 PM
> *받는 사람:* Yeo Reum Yun <YeoReum.Yun@arm.com>; mike.leach@linaro.org 
> <mike.leach@linaro.org>; james.clark@linaro.org 
> <james.clark@linaro.org>; alexander.shishkin@linux.intel.com 
> <alexander.shishkin@linux.intel.com>
> *참조:* coresight@lists.linaro.org <coresight@lists.linaro.org>; linux- 
> arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; 
> linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; nd <nd@arm.com>
> *제목:* Re: [PATCH 1/1] coresight: prevent deactivate active config 
> while enable the config
> Hi Yeo,
> 
> 
> On 31/12/2024 14:37, Yeo Reum Yun wrote:
>> Gentle ping in case of forgotten.
>> 
> 
> Gentle reminder: Please avoid top posting.
> 
> I thought there is a v2 of this one ? I am now confused.
> 
> Kind regards
> Suzuki
> 
>> ________________________________________
>> From: Yeoreum Yun <yeoreum.yun@arm.com>
>> Sent: 18 December 2024 08:48
>> To: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexander.shishkin@linux.intel.com
>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; nd; Yeo Reum Yun
>> Subject: [PATCH 1/1] coresight: prevent deactivate active config while enable the config
>> 
>> While enable active config via cscfg_csdev_enable_active_config(),
>> active config could be deactivated via configfs' sysfs interface.
>> This could make UAF issue in below scenario:
>> 
>> CPU0                                          CPU1
>> (perf or sysfs enable)                        load module
>>                                                cscfg_load_config_sets()
>>                                                activate config. // sysfs
>>                                                (sys_active_cnt == 1)
>> ...
>> cscfg_csdev_enable_active_config()
>>    lock(csdev->cscfg_csdev_lock)
>>    // here load config activate by CPU1
>>    unlock(csdev->cscfg_csdev_lock)
>> 
>>                                                deactivate config // sysfs
>>                                                (sys_activec_cnt == 0)
>>                                                cscfg_unload_config_sets()
>>                                                unload module
>> 
>>    // access to config_desc which freed
>>    // while unloading module.
>>    cfs_csdev_enable_config
>> 
>> To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
>> deactivate while there is enabled configuration.
>> 
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>   .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
>>   drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
>>   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
>>   3 files changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 86893115df17..6218ef40acbc 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>>          smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>> 
>>          raw_spin_unlock(&drvdata->spinlock);
>> +
>> +       cscfg_csdev_disable_active_config(csdev);
>> +
>>          cpus_read_unlock();
>> 
>>          /*
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>> index a70c1454b410..dfa7dcbaf25d 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>>                          cscfg_mgr->sysfs_active_config = cfg_hash;
>>          } else {
>>                  /* disable if matching current value */
>> -               if (cscfg_mgr->sysfs_active_config == cfg_hash) {
>> +               if (cscfg_mgr->sysfs_active_config == cfg_hash &&
>> +                   !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
>>                          _cscfg_deactivate_config(cfg_hash);
>>                          cscfg_mgr->sysfs_active_config = 0;
>>                  } else
>> @@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>>          if (!atomic_read(&cscfg_mgr->sys_active_cnt))
>>                  return 0;
>> 
>> +       /*
>> +        * increment sys_enable_cnt first to prevent deactivate the config
>> +        * while enable active config.
>> +        */
>> +       atomic_inc(&cscfg_mgr->sys_enable_cnt);
>> +
>>          /*
>>           * Look for matching configuration - set the active configuration
>>           * context if found.
>> @@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>>                          raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>>                  }
>>          }
>> +
>> +       if (!config_csdev_active || err)
>> +               atomic_dec(&cscfg_mgr->sys_enable_cnt);
>> +
>>          return err;
>>   }
>>   EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
>> @@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>>          if (config_csdev) {
>>                  if (!config_csdev->enabled)
>>                          config_csdev = NULL;
>> -               else
>> +               else {
>>                          config_csdev->enabled = false;
>> +                       atomic_dec(&cscfg_mgr->sys_enable_cnt);
>> +               }
>>          }
>>          csdev->active_cscfg_ctxt = NULL;
>>          raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>> @@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)
>>          INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);
>>          INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
>>          atomic_set(&cscfg_mgr->sys_active_cnt, 0);
>> +       atomic_set(&cscfg_mgr->sys_enable_cnt, 0);
>>          cscfg_mgr->load_state = CSCFG_NONE;
>> 
>>          /* setup the device */
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
>> index 66e2db890d82..2fc397919985 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.h
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
>> @@ -38,6 +38,7 @@ enum cscfg_load_ops {
>>    * @config_desc_list:  List of system configuration descriptors to load into registered devices.
>>    * @load_order_list:    Ordered list of owners for dynamically loaded configurations.
>>    * @sys_active_cnt:    Total number of active config descriptor references.
>> + * @sys_enable_cnt:    Total number of enable of active config descriptor references.
>>    * @cfgfs_subsys:      configfs subsystem used to manage configurations.
>>    * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
>>    * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
>> @@ -50,6 +51,7 @@ struct cscfg_manager {
>>          struct list_head config_desc_list;
>>          struct list_head load_order_list;
>>          atomic_t sys_active_cnt;
>> +       atomic_t sys_enable_cnt;
>>          struct configfs_subsystem cfgfs_subsys;
>>          u32 sysfs_active_config;
>>          int sysfs_active_preset;
>> --
>> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>> 
> 


