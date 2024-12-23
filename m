Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A7E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdWzaenhPj7pSVDMbmZ1N+E1ysWgJk1/ElEfwgye+7I=; b=JmT9o03Tq353Y/TB5zuMyiDKRQ
	9DjQKL/cLjpsq35SIbB3glx0KRVlkT1EjRbzmw5N5Ps5h4Mal3LdVNtpyo40y9VFsbvICov9QDIg5
	hO3fZMwW1MM76s90KDCIWNldtoNi/9ygb6g/qfwQVjvtZtxWW6tVI7KhWThMQ9At12NCNKMhcamPl
	XN8l97rGQx5D+jMzQxUMj1PtTq79stJs6dju1KVSXEpIkXpQFDALs0LfRtHpdUyPj9sxz5hgXuOT3
	Ve5hSIHzHWeX+jDC/OLm5Aw7Ru7/CEWIMNTffURCGo46ifnsSPc6uY1zX/0WvxyLtgMVLFJalQ6u5
	q35IJiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkus-0000000AL6i-3FW6;
	Mon, 23 Dec 2024 16:04:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPktg-0000000AKuz-1pHQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:03:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385de59c1a0so2580669f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 08:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734969786; x=1735574586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LdWzaenhPj7pSVDMbmZ1N+E1ysWgJk1/ElEfwgye+7I=;
        b=tiY/dU9w909NRGBXWHAwiQLpyRedIcfuBdKvylPpIFINYUOU3aHggAk1hYQENlgO6D
         iLk7RwKWkpWQVq3R61ZZobGf0ZOdy8DPN9cgyPIDMNHYU0Qyy6yx+SI1QK/uC6CQAEMw
         n2xRbZL+pJi6LUpZk1N6Jp/5HKQFpjwj8sxu3JQthyxeclbXJ+8STyE4xK+d42O5BWqo
         fNCOL5RYKFkTQy5MWh9kzlcARSCOcc+MPJgQykwlBB4i3CLaCQNjS95ACQPDg5Lh1JBk
         N1HZQ7+2NhIfSAoDIa0jQp02b1FVZ8J+8ES4aG/Bk/cXC2b9sYm9v2FBS7iR13PcUxqm
         GAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734969786; x=1735574586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdWzaenhPj7pSVDMbmZ1N+E1ysWgJk1/ElEfwgye+7I=;
        b=GiTgfDpbXNVH4VbyPUWE5RbbMSeXBtLavm+go3AXdPcri/2s7/IGvg2nLcAvwP2A9g
         BML2CMS+U1e1P5dZjjd0ynRU5eBdrQkvsMOPtu9YemUlx0ka4dUb6iiGi7HPEuJNe9+1
         OCiVOntXZo6+aI9HjPA8keL29zSJ/qLkpjZdbNGPrCx40a+yBoF7crJQw++Yjr7NwqIB
         igiEeaygsWCD14DoTCK3wVXAdpxC/UHVh/iBhJ9I0BG+NBLgrMlhX2AtpwCRvtB2HuZr
         VZzw0OznJ5fKg0u/FEkVAWODwVnxglRH1GQCEye9OtfrPgWs7JjHp2pSK6qNIlnYG/YA
         yIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUhTZIWwwQOgJVr8xDthSGpcO8ZI16ORIDiQHyCtb7g6iuxntIkS91d3qB9+xTrB7NApL0ZBIPGWUPt4zYq3mKZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxTcjJXC5NANtGrEREySYL1olQvIWCVhc0+AKXetQTi8oDwG308
	d8SHL7AhOr98udbamojGUSrN0XbSA4f8YHgBzwD5r31VjDtAI1klliiQI4WzSnA=
X-Gm-Gg: ASbGncuVR8M800q1Hz6ojBY3OMx4crQOnw9Uw7tX78IGd+m/ZWLkD7Ua/RN6uRfpF7U
	BN4ezvqsg1K0p0mO3PNFDRud0BYcBvJwKrXt8HWL4ooE2pSrAsj2Wkwer8wOFwJevIoHaQqkQb9
	AtUwcPGp8q1Fukuhtf8Ufd78zlN6euJwqoqe++bvKuof7Ucr1Y6A8daGkTJPoaGnkU6PZPwoOfb
	mPzPCjshZ8Nh6xrjHlFBhBgFFwGiBsgZgUdVG3z82Qck0H6DjHU6qJUidh6nOxNnA==
X-Google-Smtp-Source: AGHT+IHE60Dcf13LiIZMUWHdjLhfBh3lAm+HyejnZ05aJSHnLJRvay2L62GWlLu036olqZopHY+Y3Q==
X-Received: by 2002:a05:6000:4007:b0:385:d852:29ed with SMTP id ffacd0b85a97d-38a223f5ca6mr11396539f8f.36.1734969786195;
        Mon, 23 Dec 2024 08:03:06 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b1f6sm176212645e9.31.2024.12.23.08.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 08:03:05 -0800 (PST)
Message-ID: <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
Date: Mon, 23 Dec 2024 16:03:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nd@arm.com, suzuki.poulose@arm.com,
 mike.leach@linaro.org, alexander.shishkin@linux.intel.com
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241218084833.609876-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_080308_488677_C3B6649B 
X-CRM114-Status: GOOD (  32.91  )
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



On 18/12/2024 8:48 am, Yeoreum Yun wrote:
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
> 
> CPU0                                          CPU1
> (perf or sysfs enable)                        load module
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

Assuming the left side does Perf, are there some steps missing? To get 
to enable_active_config() you first need to pass through etm_setup_aux() 
-> cscfg_activate_config(). That would also increment sys_active_cnt 
which would leave it at 2 if there were two concurrent sessions. Then it 
would end up as 1 here after deactivate, rather than 0.

It's not explicitly mentioned in the sequence but I'm assuming the left 
and right are the same config, but I suppose it could be an issue with 
different configs too.

>                                                cscfg_unload_config_sets()
>                                                unload module

On the left cscfg_activate_config() also bumps the module refcount, so 
unload wouldn't cause a UAF here as far as I can see.

> 
>    // access to config_desc which freed
>    // while unloading module.
>    cfs_csdev_enable_config
> 
> To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
> deactivate while there is enabled configuration.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
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

So is sys_enable_cnt a global value? If a fix is needed doesn't it need 
to be a per-config refcount?

Say you have two active configs, sys_enable_cnt is now 2, how do you 
disable one without it always skipping here when the other config is 
enabled?

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

When these are next to each other it makes me wonder why active_cnt 
isn't enough to prevent unloading? Enabled is always a subset of active, 
so as long as you gate unloads or modifications on the existing active 
count it seems fine?

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


