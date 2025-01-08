Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7CEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnyQ8id6uXGb9NG9O3SbSOq/Ua57cbonPEZvVebUg9U=; b=fSgeoo0vGJENN3ttZc499UFGES
	Y2/tZDkUAy+t5xKgnD0um/7uhz1GpSzN8G5fwjZdUbqxVSgHiUolh9AkA5YZDJ6B1VrtxmsEhRAOI
	FZROCN6qTHqufLl3jGKIMn0t4hryt7kA7xJAXpg+EQg9+bcu2aFpxsxLeeLi3yXH0SfMTwAMrlFa3
	5zvZnnYplYcVZ19hYaTu6rfMdK0P/vBJkOutWkYzuwGpzpveXfOo7hmO0Hc/63ES1n7FMiCe0irLB
	H11B7y73/jRwfA5xT5JeIdVqy516e6z+30wn4khUZfo/bDj/X+1MZkSdK5/TjfSfPixBQ8ShYH6Sq
	P1KLFu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVU0s-00000008AUJ-1r2Q;
	Wed, 08 Jan 2025 11:14:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTvT-0000000898q-2aYI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:08:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A75BE13D5;
	Wed,  8 Jan 2025 03:09:05 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F20F3F66E;
	Wed,  8 Jan 2025 03:08:36 -0800 (PST)
Message-ID: <e236f2d3-a9cb-412e-af3f-6ae46851869d@arm.com>
Date: Wed, 8 Jan 2025 11:08:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241223185328.1339616-1-yeoreum.yun@arm.com>
 <065330b5-992e-47ae-9c49-e496d03c20de@arm.com>
 <Z30ltrwxpbVjIaVF@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z30ltrwxpbVjIaVF@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_030839_748740_2F8CAAFD 
X-CRM114-Status: GOOD (  39.34  )
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

On 07/01/2025 13:01, Yeoreum Yun wrote:
> Hi Suzuki,
> 
>> Hi Levi
>>
>> On 23/12/2024 18:53, Yeoreum Yun wrote:
>>> While enable active config via cscfg_csdev_enable_active_config(),
>>> active config could be deactivated via configfs' sysfs interface.
>>> This could make UAF issue in below scenario:
>>>
>>> CPU0                                          CPU1
>>> (sysfs enable)                                load module
>>>                                                 cscfg_load_config_sets()
>>>                                                 activate config. // sysfs
>>>                                                 (sys_active_cnt == 1)
>>> ...
>>> cscfg_csdev_enable_active_config()
>>>     lock(csdev->cscfg_csdev_lock)
>>>     // here load config activate by CPU1
>>>     unlock(csdev->cscfg_csdev_lock)
>>>
>>>                                                 deactivate config // sysfs
>>>                                                 (sys_activec_cnt == 0)
>>>                                                 cscfg_unload_config_sets()
>>>                                                 unload module
>>>
>>>     // access to config_desc which freed
>>>     // while unloading module.
>>>     cfs_csdev_enable_config
>>>
>>> To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
>>> deactivate while there is enabled configuration.
>>
>> Thanks for the finding the problem and the detailed description + patch. I
>> have some concerns on the fix, please find it below.
>>
>>>
>>
>>
>> So we have 3 atomic counters now !
>> cscfg_mgr->sys_active_cnt  // Global count
>> config->active_cnt	   // Per config count,
>>
>> And another one which this one introduces.
>>
>> cscfg_mgr->sys_enable_cnt  // ?
>>
>>
>> And config->active_cnt is always ever 0 or 1. i.e., it is not really a
>> reference counter at the moment but it indicates whether it is active or
>> not. Could  we not use that for tracking the references on the specific
>> config ?
>>
>> i.e., every time we "enable_active_config" atomic_inc(config->active_cnt)
>>
>> and disable_active_config() always decrements the config. These could be
>> wrapped in cscfg_get() cscfg_put() which would, inc/dec the refcounts
>> and also drop the "module" reference when the active_cnt == 0
> 
> This action is done via _cscfg_activate_config() already but its
> activation is done via "sysfs".
> and the checking active_cnt, I think it would increase lots of complex.

I don't understand. We have this today :

cscfg_config_desc which is getting de-activated. This has reference to
the module (owner). If someone is using this config_desc in running 
session (be it perf or sysfg), it must be refcounted. As such I don't
see that the cscfg is refcounted anywhere. (The active_cnt indicates if 
this has been activated, but not used in a session). If we have a 
refcount on the "cscfg_config_desc" for each active session, we could
prevent/delay unloading the module until the last one drops.




Something like this is what I was checking ?



coresight: cscfg: Hold refcount on the config for active
  sessions

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
  .../hwtracing/coresight/coresight-config.h    |  2 +-
  .../hwtracing/coresight/coresight-syscfg.c    | 24 +++++++++++++------
  2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h 
b/drivers/hwtracing/coresight/coresight-config.h
index 6ba013975741..84cdde6f0e4d 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
   * @feats_csdev:references to the device features to enable.
   */
  struct cscfg_config_csdev {
-	const struct cscfg_config_desc *config_desc;
+	struct cscfg_config_desc *config_desc;
  	struct coresight_device *csdev;
  	bool enabled;
  	struct list_head node;
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c 
b/drivers/hwtracing/coresight/coresight-syscfg.c
index 11138a9762b0..53baeaaf907f 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -914,15 +914,20 @@ static int _cscfg_activate_config(unsigned long 
cfg_hash)
  	return err;
  }

+static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
+{
+	if (!atomic_dec_return(&config_desc->active_cnt))
+		cscfg_owner_put(config_desc->load_owner);
+}
+
  static void _cscfg_deactivate_config(unsigned long cfg_hash)
  {
  	struct cscfg_config_desc *config_desc;

  	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
  		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
-			atomic_dec(&config_desc->active_cnt);
  			atomic_dec(&cscfg_mgr->sys_active_cnt);
-			cscfg_owner_put(config_desc->load_owner);
+			cscfg_config_desc_put(config_desc);
  			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
  			break;
  		}
@@ -1047,7 +1052,7 @@ int cscfg_csdev_enable_active_config(struct 
coresight_device *csdev,
  				     unsigned long cfg_hash, int preset)
  {
  	struct cscfg_config_csdev *config_csdev_active = NULL, 
*config_csdev_item;
-	const struct cscfg_config_desc *config_desc;
+	struct cscfg_config_desc *config_desc;
  	unsigned long flags;
  	int err = 0;

@@ -1062,8 +1067,8 @@ int cscfg_csdev_enable_active_config(struct 
coresight_device *csdev,
  	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
  	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
  		config_desc = config_csdev_item->config_desc;
-		if ((atomic_read(&config_desc->active_cnt)) &&
-		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
+		if ((unsigned long)config_desc->event_ea->var == cfg_hash &&
+		    atomic_inc_not_zero(&config_desc->active_cnt)) {
  			config_csdev_active = config_csdev_item;
  			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
  			break;
@@ -1091,12 +1096,15 @@ int cscfg_csdev_enable_active_config(struct 
coresight_device *csdev,
  			 * Set enabled if OK, err if not.
  			 */
  			spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-			if (csdev->active_cscfg_ctxt)
+			if (csdev->active_cscfg_ctxt == config_csdev_active)
  				config_csdev_active->enabled = true;
  			else
  				err = -EBUSY;
  			spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
  		}
+		if (err)
+			cscfg_config_desc_put(config_desc);
+
  	}
  	return err;
  }
@@ -1136,8 +1144,10 @@ void cscfg_csdev_disable_active_config(struct 
coresight_device *csdev)
  	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);

  	/* true if there was an enabled active config */
-	if (config_csdev)
+	if (config_csdev) {
  		cscfg_csdev_disable_config(config_csdev);
+		cscfg_config_desc_put(config_csdev->config_desc);
+	}
  }
  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);

-- 







> because, if so, it should iterate all config in each csdev.
> So, I believe it is the reason why the activation and module_cnt get via "sysfs"
> to prevent iterating every config in csdev when config unload.
> 
> although, active_cnt in each config added to list in csdev be 0 or 1,
> the module could be >= 1 (by sum of active_cnt which have the same
> module owner). So I'm skeptical to use active_cnt like "reference cnt"
> and That's why I decide to use "sys_enable_cnt"
>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>> from v1 to v2:
>>>       - modify commit message.
>>> ---
>>>    .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
>>>    drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
>>>    drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
>>>    3 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index 86893115df17..6218ef40acbc 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>>>    	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>>>
>>>    	raw_spin_unlock(&drvdata->spinlock);
>>> +
>>> +	cscfg_csdev_disable_active_config(csdev);
>>
>> This looks like a separate "fix" from what you are trying to address. Please
>> could split this ?
> 
> I don't think so, because without this calling, the "sys_enable_cnt"
> never down, It makes error.

My point is, we need to "disable_active_config" irrespective of this 
race, in the sysfs path. So this should be a fix apart from fixing the race.

Suzuki



> 
>> Also, would like to hear what Mike has to say about this change.
> 
> IIRC, I followed his suggestion.
> 
> Thanks!
> 


