Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F7E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+KcZcHXIUgiCFZrQtosQbPSH3gI4y172Y4f7eREGSA=; b=DuvPoOCSfJlcUvGPb/oWPcW6t1
	BJe3QE/CJ4mBAtL2WKKC1Td7auy+IoFx4m+n4FogKMIo0ccpr7Z5Qp2+SFiHLd6dquQj/7aDKIN1l
	mhyJ+9a5Jg+kiZ9Tw3rrPW+c3KXJecEM3lNQp06EOD1I1BSeQODZh8CXTPE+A6oboJj+nmTRKL/+q
	hx/ZZYrLiA4s7O9B/VxVtRlwjB95K7sU8N9LbVBE+Dc4OmL4A8GEAbHgYnDCoLvVnYw+mtkshHE8g
	7mkEyXUMfRfrPHo/ggrbtf5LeAW7egzP25+8B7bWIgBbZ/v/W2ApWiE9JmPVqnWjjB16Qyp035/c0
	vSG4f6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8VQ-00000004jcW-3GZf;
	Tue, 07 Jan 2025 12:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8MS-00000004h9N-1fl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64919143D;
	Tue,  7 Jan 2025 04:07:31 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D56873F673;
	Tue,  7 Jan 2025 04:07:01 -0800 (PST)
Message-ID: <065330b5-992e-47ae-9c49-e496d03c20de@arm.com>
Date: Tue, 7 Jan 2025 12:07:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241223185328.1339616-1-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241223185328.1339616-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_040704_531902_DFB52879 
X-CRM114-Status: GOOD (  31.18  )
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

Hi Levi

On 23/12/2024 18:53, Yeoreum Yun wrote:
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
> 
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                                cscfg_load_config_sets()
>                                                activate config. // sysfs
>                                                (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
>    lock(csdev->cscfg_csdev_lock)
>    // here load config activate by CPU1
>    unlock(csdev->cscfg_csdev_lock)
> 
>                                                deactivate config // sysfs
>                                                (sys_activec_cnt == 0)
>                                                cscfg_unload_config_sets()
>                                                unload module
> 
>    // access to config_desc which freed
>    // while unloading module.
>    cfs_csdev_enable_config
> 
> To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
> deactivate while there is enabled configuration.

Thanks for the finding the problem and the detailed description + patch. 
I have some concerns on the fix, please find it below.

> 


So we have 3 atomic counters now !
cscfg_mgr->sys_active_cnt  // Global count
config->active_cnt	   // Per config count,

And another one which this one introduces.

cscfg_mgr->sys_enable_cnt  // ?


And config->active_cnt is always ever 0 or 1. i.e., it is not really a
reference counter at the moment but it indicates whether it is active or 
not. Could  we not use that for tracking the references on the specific 
config ?

i.e., every time we "enable_active_config" atomic_inc(config->active_cnt)

and disable_active_config() always decrements the config. These could be
wrapped in cscfg_get() cscfg_put() which would, inc/dec the refcounts
and also drop the "module" reference when the active_cnt == 0


> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
> from v1 to v2:
>      - modify commit message.
> ---
>   .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
>   drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
>   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
>   3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 86893115df17..6218ef40acbc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> 
>   	raw_spin_unlock(&drvdata->spinlock);
> +
> +	cscfg_csdev_disable_active_config(csdev);

This looks like a separate "fix" from what you are trying to address. 
Please could split this ?

Also, would like to hear what Mike has to say about this change.


Suzuki


> +
>   	cpus_read_unlock();
> 
>   	/*
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a70c1454b410..dfa7dcbaf25d 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   			cscfg_mgr->sysfs_active_config = cfg_hash;
>   	} else {
>   		/* disable if matching current value */
> -		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> +		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
> +		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
>   			_cscfg_deactivate_config(cfg_hash);
>   			cscfg_mgr->sysfs_active_config = 0;
>   		} else
> @@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>   	if (!atomic_read(&cscfg_mgr->sys_active_cnt))
>   		return 0;
> 
> +	/*
> +	 * increment sys_enable_cnt first to prevent deactivate the config
> +	 * while enable active config.
> +	 */
> +	atomic_inc(&cscfg_mgr->sys_enable_cnt);
> +
>   	/*
>   	 * Look for matching configuration - set the active configuration
>   	 * context if found.
> @@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>   			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>   		}
>   	}
> +
> +	if (!config_csdev_active || err)
> +		atomic_dec(&cscfg_mgr->sys_enable_cnt);
> +
>   	return err;
>   }
>   EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> @@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>   	if (config_csdev) {
>   		if (!config_csdev->enabled)
>   			config_csdev = NULL;
> -		else
> +		else {
>   			config_csdev->enabled = false;
> +			atomic_dec(&cscfg_mgr->sys_enable_cnt);
> +		}
>   	}
>   	csdev->active_cscfg_ctxt = NULL;
>   	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> @@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)
>   	INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);
>   	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
>   	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
> +	atomic_set(&cscfg_mgr->sys_enable_cnt, 0);
>   	cscfg_mgr->load_state = CSCFG_NONE;
> 
>   	/* setup the device */
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
> index 66e2db890d82..2fc397919985 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.h
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
> @@ -38,6 +38,7 @@ enum cscfg_load_ops {
>    * @config_desc_list:	List of system configuration descriptors to load into registered devices.
>    * @load_order_list:    Ordered list of owners for dynamically loaded configurations.
>    * @sys_active_cnt:	Total number of active config descriptor references.
> + * @sys_enable_cnt:	Total number of enable of active config descriptor references.
>    * @cfgfs_subsys:	configfs subsystem used to manage configurations.
>    * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
>    * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
> @@ -50,6 +51,7 @@ struct cscfg_manager {
>   	struct list_head config_desc_list;
>   	struct list_head load_order_list;
>   	atomic_t sys_active_cnt;
> +	atomic_t sys_enable_cnt;
>   	struct configfs_subsystem cfgfs_subsys;
>   	u32 sysfs_active_config;
>   	int sysfs_active_preset;
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 


