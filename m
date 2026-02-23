Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63ECEA4FBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKB1O0+HzYGJ9lwi8Ey/2t00ghdB8jtDvy5I/0kBQUk=; b=V0wQb7XNhVRcBvat8CPrw3qY+y
	Lf16THgUSjvcOJd7GvINLsAbSC1A0aoM10AogKq3VyxhexNQL6SgNAsYGDGRw2xCeqOw4SZPHukE0
	aRRWMjBSkTFIoHaxfnWXPx2Oz0/XCBi9hOYYzOng5UNB/xoOIgog/a98Cqb3wfRC0xj6+R6IjzQ4Q
	bxn14tI22hHpzcfroMs9Utb5TBB01ljvIrLAleqPzDTR+G+ldoIHXh4XnoV9ofZbmk3T663Opk5zH
	kkJgY8A2eGW5jlaR14F0b/95zQy//SQVzdHBriq9fGUUNCzMlSPpvUexNBGk/R5/ix2XpkYa/n3DH
	CIgWaq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVys-00000000MeQ-2lT9;
	Mon, 23 Feb 2026 13:28:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVyq-00000000Me1-07BQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:28:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0E4339;
	Mon, 23 Feb 2026 05:28:00 -0800 (PST)
Received: from [10.57.13.34] (unknown [10.57.13.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCAF93F59E;
	Mon, 23 Feb 2026 05:28:04 -0800 (PST)
Message-ID: <ad38ffc4-eb0b-4430-8d5e-898a2e66977b@arm.com>
Date: Mon, 23 Feb 2026 13:28:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] coresight: Fix device registration and
 unregistration
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_052808_179208_FA812A5D 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Leo

On 09/02/2026 12:44, Leo Yan wrote:
> This series is to fix and refactor CoreSight device registration and
> unregistration, it can be divided into three small parts:
> 
>    Patches 01-03: Three fixes for memory leak, device reference and mutex
>                   protection.
>    Patches 04-05: Move connection cleanup operations into
>                   coresight_remove_conns().
>    Patches 06-08: Refactor error handling in coresight_register().
> 
> This series is verified on Juno board.
> 

I get the following splat with LOCKDEP, with the series applied, on Juno.

Here is how I reproduced it :

root@juno-server:~# for m in coresight_etm4x coresight_stm coresight_cti 
coresight_cpu_debug coresight_tmc coresight_funnel coresight_replicator 
coresight; do modprobe $m; done


root@juno-server:~# for m in coresight_etm4x coresight_stm coresight_cti 
coresight_cpu_debug coresight_tmc coresight_funnel coresight_replicator 
coresight; do modprobe -r $m; done



[  826.897923] ======================================================
[  826.904111] WARNING: possible circular locking dependency detected
[  826.910300] 7.0.0-rc1+ #429 Not tainted
[  826.914141] ------------------------------------------------------
[  826.920328] modprobe/489 is trying to acquire lock:
[  826.925211] ffffffc07bfd85e8 (ect_mutex){+.+.}-{4:4}, at: 
cti_device_release+0x3c/0x128 [coresight_cti]
[  826.934650]
[  826.934650] but task is already holding lock:
[  826.940488] ffffffc07bf9b980 (coresight_mutex){+.+.}-{4:4}, at: 
coresight_unregister+0x50/0x218 [coresight]
[  826.950283]
[  826.950283] which lock already depends on the new lock.
[  826.950283]
[  826.958471]
[  826.958471] the existing dependency chain (in reverse order) is:
[  826.965962]
[  826.965962] -> #1 (coresight_mutex){+.+.}-{4:4}:
[  826.972073]        __mutex_lock+0xb0/0x8e0
[  826.976181]        mutex_lock_nested+0x2c/0x40
[  826.980634]        coresight_add_helper+0x58/0x108 [coresight]
[  826.986494]        cti_probe+0x294/0x440 [coresight_cti]
[  826.991819]        amba_probe+0x11c/0x1d0
[  826.995837]        really_probe+0xc8/0x3f0
[  826.999940]        __driver_probe_device+0x88/0x190
[  827.004825]        driver_probe_device+0x48/0x120
[  827.009535]        __driver_attach+0x168/0x2b0
[  827.013984]        bus_for_each_dev+0x7c/0xe8
[  827.018346]        driver_attach+0x2c/0x40
[  827.022446]        bus_add_driver+0x128/0x258
[  827.026808]        driver_register+0x68/0x138
[  827.031170]        __amba_driver_register+0x2c/0x48
[  827.036054]        debug_runtime_resume+0x30/0x78 [coresight_cpu_debug]
[  827.042680]        do_one_initcall+0x6c/0x520
[  827.047044]        do_init_module+0x60/0x268
[  827.051322]        load_module+0x1f30/0x2128
[  827.055600]        init_module_from_file+0xdc/0x100
[  827.060487]        idempotent_init_module+0x190/0x290
[  827.065548]        __arm64_sys_finit_module+0x74/0xf8
[  827.070604]        invoke_syscall.constprop.0+0x58/0xf8
[  827.075841]        do_el0_svc+0x48/0xd0
[  827.079683]        el0_svc+0x5c/0x360
[  827.083348]        el0t_64_sync_handler+0xa0/0xe8
[  827.088057]        el0t_64_sync+0x198/0x1a0
[  827.092245]
[  827.092245] -> #0 (ect_mutex){+.+.}-{4:4}:
[  827.097834]        __lock_acquire+0x12e8/0x1ce0
[  827.102370]        lock_acquire+0x1c4/0x400
[  827.106557]        __mutex_lock+0xb0/0x8e0
[  827.110659]        mutex_lock_nested+0x2c/0x40
[  827.115109]        cti_device_release+0x3c/0x128 [coresight_cti]
[  827.121129]        device_release+0x3c/0xa0
[  827.125319]        kobject_put+0xb8/0x280
[  827.129334]        device_unregister+0x34/0x98
[  827.133785]        coresight_unregister+0x1b0/0x218 [coresight]
[  827.139730]        cti_remove+0xac/0xe8 [coresight_cti]
[  827.144966]        amba_remove+0x38/0x138
[  827.148981]        device_remove+0x54/0x90
[  827.153081]        device_release_driver_internal+0x1e8/0x250
[  827.158836]        driver_detach+0x58/0xa8
[  827.162938]        bus_remove_driver+0x78/0x108
[  827.167474]        driver_unregister+0x38/0x70
[  827.171923]        amba_driver_unregister+0x18/0x30
[  827.176807]        cti_exit+0x1c/0xe90 [coresight_cti]
[  827.181955]        __arm64_sys_delete_module+0x1bc/0x2f0
[  827.187274]        invoke_syscall.constprop.0+0x58/0xf8
[  827.192509]        do_el0_svc+0x48/0xd0
[  827.196352]        el0_svc+0x5c/0x360
[  827.200016]        el0t_64_sync_handler+0xa0/0xe8
[  827.204725]        el0t_64_sync+0x198/0x1a0
[  827.208911]
[  827.208911] other info that might help us debug this:
[  827.208911]
[  827.216924]  Possible unsafe locking scenario:
[  827.216924]
[  827.222849]        CPU0                    CPU1
[  827.227380]        ----                    ----
[  827.231912]   lock(coresight_mutex);
[  827.235491]                                lock(ect_mutex);
[  827.241073]                                lock(coresight_mutex);
[  827.247176]   lock(ect_mutex);
[  827.250233]
[  827.250233]  *** DEADLOCK ***
[  827.250233]
[  827.256158] 2 locks held by modprobe/489:
[  827.260170]  #0: ffffff88015488f0 (&dev->mutex){....}-{4:4}, at: 
device_release_driver_internal+0x48/0x250
[  827.269858]  #1: ffffffc07bf9b980 (coresight_mutex){+.+.}-{4:4}, at: 
coresight_unregister+0x50/0x218 [coresight]
[  827.280084]
[  827.280084] stack backtrace:
[  827.284444] CPU: 1 UID: 0 PID: 489 Comm: modprobe Not tainted 
7.0.0-rc1+ #429 PREEMPT
[  827.292377] Hardware name: ARM LTD ARM Juno Development Platform/ARM 
Juno Development Platform, BIOS EDK II Feb  1 2019
[  827.303176] Call trace:
[  827.305621]  show_stack+0x20/0x38 (C)
[  827.309290]  dump_stack_lvl+0x90/0xd0
[  827.312960]  dump_stack+0x18/0x28
[  827.316281]  print_circular_bug+0x294/0x378
[  827.320474]  check_noncircular+0x15c/0x170
[  827.324579]  __lock_acquire+0x12e8/0x1ce0
[  827.328593]  lock_acquire+0x1c4/0x400
[  827.332258]  __mutex_lock+0xb0/0x8e0
[  827.335838]  mutex_lock_nested+0x2c/0x40
[  827.339768]  cti_device_release+0x3c/0x128 [coresight_cti]
[  827.345267]  device_release+0x3c/0xa0
[  827.348935]  kobject_put+0xb8/0x280
[  827.352429]  device_unregister+0x34/0x98
[  827.356358]  coresight_unregister+0x1b0/0x218 [coresight]
[  827.361783]  cti_remove+0xac/0xe8 [coresight_cti]
[  827.366498]  amba_remove+0x38/0x138
[  827.369991]  device_remove+0x54/0x90
[  827.373571]  device_release_driver_internal+0x1e8/0x250
[  827.378804]  driver_detach+0x58/0xa8
[  827.382384]  bus_remove_driver+0x78/0x108
[  827.386399]  driver_unregister+0x38/0x70
[  827.390327]  amba_driver_unregister+0x18/0x30
[  827.394690]  cti_exit+0x1c/0xe90 [coresight_cti]
[  827.399318]  __arm64_sys_delete_module+0x1bc/0x2f0
[  827.404115]  invoke_syscall.constprop.0+0x58/0xf8
[  827.408829]  do_el0_svc+0x48/0xd0
[  827.412151]  el0_svc+0x5c/0x360
[  827.415293]  el0t_64_sync_handler+0xa0/0xe8
[  827.419481]  el0t_64_sync+0x198/0x1a0

Kind regards
Suzuki


