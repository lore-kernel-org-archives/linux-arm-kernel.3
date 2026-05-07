Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wngsQDsqpebu7MHM/n48uLPxKx8i7ahJKv5knS9cPiI=; b=FkTxcmPT6dIBsLM5oOxJd+9Wgs
	fkwOaLD06GkPvVt/uPGloMKyLLM2RyWKN1des7JfaMqt60xjdH4Y1aZuWbplGKLgDQ9w9tI70qRH4
	+18TwZKOT3EyGuhl5yJTJU+AlQKEV9RRMNweSvWWzDUGW5yClILtuoks3NIhRJCFuwWd+utDknhY3
	vC2osk87Zyu92t/WXmRqkkrN8mTo5GSeu06uPjNaHnP/v44QlRPp25GzJsfBcA+v/yBe4RQ/mw30x
	DndlYKgqIRwGXzHGsTNPf323O8iHtH2z7bOHPAVzTETrKYhAcoHur0gp5BuvIRr7vudXynPUHshb8
	RARxJ0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL08W-000000047KS-2g7O;
	Thu, 07 May 2026 14:55:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL08R-000000047Iy-02Ni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:55:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891f625344so11274585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778165729; x=1778770529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wngsQDsqpebu7MHM/n48uLPxKx8i7ahJKv5knS9cPiI=;
        b=nVKuCWvYebcpTNvaMCL/1pKRbOLryRx/qOW68olJm1n6Gi3g5wxXkFYWsqgUr7UAc+
         SDsxKKRNfa9PwEJy0Vg05B6cDSL+X1438pwj+zz+AE3/cQmMKBfB0bbHYrPlCNpi3xHN
         anepRFwz02Jz12+vTCjP/Sus6o7uz+HZc4IBoiD38NQpDak0sQkMCVbKB7e9jCwVAnHW
         8PH5aB3MS9PPHR+HYAdLqa7RYuhVie7ur3Ryhsa17emGXFeIJU3vJ5DmAz/eYfjRaNjd
         lym73j/SGpH5HfGo/sBOPXFvvj5kxOSyjiffNgAUstDu6z9V6HsfFq2rdIU7fLX4JnwS
         twyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165729; x=1778770529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wngsQDsqpebu7MHM/n48uLPxKx8i7ahJKv5knS9cPiI=;
        b=AIi89Pc7d4x5FyD9bS6ivXkADBN1NjqGmbaI/lSg3LQ/ESE7DxwQAzfPuvdrr1Nj2l
         a7/f5VQBuXQDywotXdJn1xbjE5v3M7FiBsFEbU/YPGJL5rEbsXKELEm97VyPKDPoxUDX
         llG8HDvK8srSTrPqt/p99kBJcGNDDbMSjvE4tBlGtk7sY3RREYWcPfbtrP6yoRydcgGl
         BErR3ThKkD6braNNNWae94p7esaXfxPiLBTtrhQEGBzVlD6fZ5Dv1LwCtH95l3tBY8OZ
         MwMocrCm93Isy5efSY4LEhxSumUurDb3zIaX63rrtfV9aDU2g570IRUe2TcgmDIg7kM2
         pqxw==
X-Forwarded-Encrypted: i=1; AFNElJ9ftlRck5K5ETUVSGlfELrkmLSdG0tBGxFU9r/BK171IIR0fpPIQ66E05E4OQFDJUn8oLSKsr61iFSkHBekg9FK@lists.infradead.org
X-Gm-Message-State: AOJu0YzB24e3eSjPPjLsTwijIvXNRpmHF9ZwEeIaYdITR/qnAJdU7jDE
	2ZA+okFq16WsTlpNGzDwVgNgFLnAqShbyQmhp8mx9mbymKeNkxF6Adf2sSGsDJbJPMs=
X-Gm-Gg: AeBDietF1M/rH/3MMKVj0sNzYtDVWfPM92SH03QrsUzci9eWBCe2ewC9UEwkGTyfoPQ
	GDib10Iom2NYTxyO0EIJbzctjjSuVTTop8wo3p/Rf/0aeCdyLstMfeUjnSY8fg4A2Ttrdo6JacH
	JOE5HUowTrBIIXlXRI3RUll5df38B44m5E2NRipkfMIK6+RN+ybDZmJS/BaziA3dVBDPwDZ+A5j
	wzckzJDNCeQJ8xWOpTUQy4PRdHiVZ0OfWeNaPt3wcafyaq347u9i6sP0s8NnP+xGDaDwrxKL66v
	rwp1hW1NyCkAbuPW2esSYfRgjkLAVtEJBIgu9r7ZQ/X59kULjCTiNYAKcoYzsVqGHngsVjgij07
	0/MXGQOrO18g0QeJRmxTM3NCt+RdF4cfAG1CF7DM+YxmiwUAmJvA0mUSYyDUDEhdiKkR23/Falv
	hZskljlByxc5/Kjwx8wmEqjsDEUjjQJyg5IVIJCUM=
X-Received: by 2002:a05:600c:638e:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48e5e00c1b9mr52529305e9.14.1778165728525;
        Thu, 07 May 2026 07:55:28 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538bc9bdsm155896155e9.11.2026.05.07.07.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:55:28 -0700 (PDT)
Message-ID: <b9fb8b0f-54fc-4fd2-9a0f-44889b5a8eb0@linaro.org>
Date: Thu, 7 May 2026 15:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/27] coresight: Take a reference on csdev
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-7-fc7fb9d5af1c@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-7-fc7fb9d5af1c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075531_113118_D31B893C 
X-CRM114-Status: GOOD (  31.08  )
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



On 01/05/2026 5:47 pm, Leo Yan wrote:
> coresight_get_ref() currently pins the provider module and takes a
> reference on the parent device. That does not pin the CoreSight device
> itself.
> 
> A driver can still be unbound while the CoreSight device is part of an
> active trace path. In that case coresight_unregister() may release the
> coresight_device while the path still holds its csdev pointer.

Hi Leo,

Testing on the Orion O6 board was all good, and so was stress testing 
concurrent sysfs mode and hotplug on Juno. However, I was trying to 
stress test sysfs mode and rmmod on Juno and ran into an issue, although 
a similar issue is present without your patchset.

If you run an rmmod on all the coresight devices at the same time as an 
enable_source / disable loop you always get this:

  WARNING: possible circular locking dependency detected
  7.0.0-rc1+ #713 Tainted: G                 N
  ------------------------------------------------------
  rmmod/1361 is trying to acquire lock:
  ffff0008042f69a8 (kn->active#144){++++}-{0:0}, at: 
__kernfs_remove+0x1b8/0x2c8
  but task is already holding lock:
  ffff80007abfc9d8 (coresight_mutex){+.+.}-{4:4}, at: 
coresight_unregister+0x50/0x280 [coresight]
  which lock already depends on the new lock.
  the existing dependency chain (in reverse order) is:
  -> #2 (coresight_mutex){+.+.}-{4:4}:
         __mutex_lock_common+0xe0/0x1408
         mutex_lock_nested+0x38/0x50
         coresight_enable_sysfs+0x34/0x1f0 [coresight]
         enable_source_store+0x6c/0xc0 [coresight]
         dev_attr_store+0x24/0x40
         sysfs_kf_write+0xa8/0xd0
         kernfs_fop_write_iter+0x120/0x1d0
         vfs_write+0x238/0x310
         ksys_write+0x80/0xf8
         __arm64_sys_write+0x28/0x40
         invoke_syscall+0x4c/0xe8
         el0_svc_common+0x9c/0xf0
         do_el0_svc+0x28/0x40
         el0_svc+0x50/0x230
         el0t_64_sync_handler+0x78/0x130
         el0t_64_sync+0x198/0x1a0
  -> #1 (cpu_hotplug_lock){++++}-{0:0}:
         cpus_read_lock+0x5c/0x160
         enable_source_store+0x5c/0xc0 [coresight]
         dev_attr_store+0x24/0x40
         sysfs_kf_write+0xa8/0xd0
         kernfs_fop_write_iter+0x120/0x1d0
         vfs_write+0x238/0x310
         ksys_write+0x80/0xf8
         __arm64_sys_write+0x28/0x40
         invoke_syscall+0x4c/0xe8
         el0_svc_common+0x9c/0xf0
         do_el0_svc+0x28/0x40
         el0_svc+0x50/0x230
         el0t_64_sync_handler+0x78/0x130
         el0t_64_sync+0x198/0x1a0
  -> #0 (kn->active#144){++++}-{0:0}:
         __lock_acquire+0x1b0c/0x3478
         lock_acquire+0x118/0x338
         kernfs_drain+0xe8/0x1e8
         __kernfs_remove+0x1b8/0x2c8
         kernfs_remove_by_name_ns+0x74/0xf0
         sysfs_remove_group+0xb0/0x118
         sysfs_remove_groups+0x40/0x68
         device_remove_attrs+0xc0/0x108
         device_del+0x1e4/0x360
         device_unregister+0x2c/0x90
         coresight_unregister+0x244/0x280 [coresight]
         etm4_remove_dev+0xa4/0xc8 [coresight_etm4x]
         etm4_remove_amba+0x24/0x38 [coresight_etm4x]
         amba_remove+0x3c/0x138
         device_release_driver_internal+0x188/0x2a0
         driver_detach+0x9c/0xe8
         bus_remove_driver+0xec/0x178
         driver_unregister+0x3c/0x68
         amba_driver_unregister+0x1c/0x30
         cleanup_module+0x1c/0xcc0 [coresight_etm4x]
         __arm64_sys_delete_module+0x240/0x3c0
         invoke_syscall+0x4c/0xe8
         el0_svc_common+0x9c/0xf0
         do_el0_svc+0x28/0x40
         el0_svc+0x50/0x230
         el0t_64_sync_handler+0x78/0x130
         el0t_64_sync+0x198/0x1a0
  other info that might help us debug this:
  Chain   kn->active#144 --> cpu_hotplug_lock --> coresight_mutex
   Possible unsafe locking scenario:
         CPU0                    CPU1
         ----                    ----
    lock(coresight_mutex);
                                 lock(cpu_hotplug_lock);
                                 lock(coresight_mutex);
    lock(kn->active#144);
   *** DEADLOCK ***
  2 locks held by rmmod/1361:
   #0: ffff00080103b0e8 (&dev->mutex){....}-{4:4}, at: 
device_release_driver_internal+0x5c/0x2a0
   #1: ffff80007abfc9d8 (coresight_mutex){+.+.}-{4:4}, at: 
coresight_unregister+0x50/0x280 [coresight]
  stack backtrace:
  CPU: 4 UID: 0 PID: 1361 Comm: rmmod Tainted: G                 N 
7.0.0-rc1+ #713 PREEMPT
  Tainted: [N]=TEST
  Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno 
Development Platform, BIOS EDK II Oct 19 2019
  Call trace:
   show_stack+0x24/0x38 (C)
   dump_stack_lvl+0x3c/0xb8
   dump_stack+0x18/0x24
   print_circular_bug+0x324/0x330
   check_noncircular+0x178/0x198
   __lock_acquire+0x1b0c/0x3478
   lock_acquire+0x118/0x338
   kernfs_drain+0xe8/0x1e8
   __kernfs_remove+0x1b8/0x2c8
   kernfs_remove_by_name_ns+0x74/0xf0
   sysfs_remove_group+0xb0/0x118
   sysfs_remove_groups+0x40/0x68
   device_remove_attrs+0xc0/0x108
   device_del+0x1e4/0x360
   device_unregister+0x2c/0x90
   coresight_unregister+0x244/0x280 [coresight]
   etm4_remove_dev+0xa4/0xc8 [coresight_etm4x]
   etm4_remove_amba+0x24/0x38 [coresight_etm4x]
   amba_remove+0x3c/0x138
   device_release_driver_internal+0x188/0x2a0
   driver_detach+0x9c/0xe8
   bus_remove_driver+0xec/0x178
   driver_unregister+0x3c/0x68
   amba_driver_unregister+0x1c/0x30
   cleanup_module+0x1c/0xcc0 [coresight_etm4x]
   __arm64_sys_delete_module+0x240/0x3c0
   invoke_syscall+0x4c/0xe8
   el0_svc_common+0x9c/0xf0
   do_el0_svc+0x28/0x40
   el0_svc+0x50/0x230
   el0t_64_sync_handler+0x78/0x130
   el0t_64_sync+0x198/0x1a0


I think the issue can be fixed by releasing the coresight_mutex before 
device_unregister():

   diff --git a/drivers/hwtracing/coresight/coresight-core.c 
b/drivers/hwtracing/coresight/coresight-core.c
   index 015363da12fa..620560880f12 100644
   --- a/drivers/hwtracing/coresight/coresight-core.c
   +++ b/drivers/hwtracing/coresight/coresight-core.c
   @@ -1639,8 +1639,8 @@ void coresight_unregister(struct 
coresight_device *csdev)
           coresight_remove_conns(csdev);
           coresight_clear_default_sink(csdev);
           coresight_release_platform_data(csdev->dev.parent, csdev->pdata);
   -       device_unregister(&csdev->dev);
           mutex_unlock(&coresight_mutex);
   +       device_unregister(&csdev->dev);
    }
    EXPORT_SYMBOL_GPL(coresight_unregister);

Although I didn't think too hard about the implications, but it might be 
ok because once all the connections are removed the device can't be used 
so releasing the coresight_mutex isn't an issue.

But then testing that I ran into some kind of refleak where I couldn't 
unload modules anymore, even though I'd disabled everything. But that 
could be a different issue:

   rmmod: ERROR: Module coresight_funnel is in use
   rmmod: ERROR: Module coresight_replicator is in use
   rmmod: ERROR: Module coresight_etm4x is in use
   rmmod: ERROR: Module coresight_tmc is in use
   rmmod: ERROR: Module coresight_cti is in use
   rmmod: ERROR: Module coresight is in use by: coresight_tmc 
coresight_cti coresight_etm4x coresight_replicator coresight_funnel


Anyway I don't think your patches make this worse, so we can probably 
ignore it, but it would be good to be able to stress test the new 
modifications around the same area.

> 
> Take a reference on &csdev->dev when grabbing a CoreSight device and drop
> it in coresight_put_ref().
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 5519d323f21f38d719b9030c7d77a9a61948ba1d..1a389f63ed006e054dc6bc9764f8be8c1def9da1 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -651,14 +651,18 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
>    */
>   static bool coresight_get_ref(struct coresight_device *csdev)
>   {
> -	struct device *dev = csdev->dev.parent;
> +	struct device *parent = csdev->dev.parent;
>   
>   	/* Make sure the driver can't be removed */
> -	if (!try_module_get(dev->driver->owner))
> +	if (!try_module_get(parent->driver->owner))
>   		return false;
> -	/* Make sure the device can't go away */
> -	get_device(dev);
> -	pm_runtime_get_sync(dev);
> +
> +	/* Make sure parent device can't go away and is powered on */
> +	get_device(parent);
> +	pm_runtime_get_sync(parent);
> +
> +	/* Make sure csdev can't go away */
> +	get_device(&csdev->dev);
>   	return true;
>   }
>   
> @@ -670,11 +674,12 @@ static bool coresight_get_ref(struct coresight_device *csdev)
>    */
>   static void coresight_put_ref(struct coresight_device *csdev)
>   {
> -	struct device *dev = csdev->dev.parent;
> +	struct device *parent = csdev->dev.parent;
>   
> -	pm_runtime_put(dev);
> -	put_device(dev);
> -	module_put(dev->driver->owner);
> +	put_device(&csdev->dev);
> +	pm_runtime_put(parent);
> +	put_device(parent);
> +	module_put(parent->driver->owner);
>   }
>   
>   /*
> 


