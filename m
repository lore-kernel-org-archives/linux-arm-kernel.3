Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C43D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBcGUWMKoMXAfjHRum8q0K2V3Ur90DH9u8FTJ1O25rU=; b=YqDgkrEf4JxSlLp+cNdG1OP/nc
	FhPcb9TG7jzjQfaNeDq48hoek46D9h6QRR6xthKGTYfKocPCkLnC9VXfqrRgll/jznMKw7DItMP9Y
	nVDpx9daq3XAKFle7Ng40MOv+d2VQtF/hwF9rhzM8FiI0bcKBAL4JhPvXpLGk5r1ulalXrTCZK8eo
	uXPYejYGuL9g/S/mBsifkL3YK9eaVx2GkTzQ0Hw9G+8suoh+oOcvz/A+GB5RLSDWjENr93fkOLDjB
	0y8BDhQQlpbszG9yUOxBidL6MSVfrW09F76OgxBH51NX3lhXyJi0DMXi4kBWAkcLef34gxrPBcIWr
	QzqLIdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxLg-00000002yHD-2hH3;
	Mon, 01 Dec 2025 06:25:24 +0000
Received: from mail-m3281.qiye.163.com ([220.197.32.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxLT-00000002yGC-0fCR;
	Mon, 01 Dec 2025 06:25:23 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b7b8fa4a;
	Mon, 1 Dec 2025 14:25:00 +0800 (GMT+08:00)
Message-ID: <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com>
Date: Mon, 1 Dec 2025 14:24:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ad895fed203abkunm2883094c9c2a8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0eSFZIQh4fQkNJH0IeQh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=P/uVrnuunyZB/919PaehLsysnwLL21ejHYjRLvw7g97giUwR8fPktLqwXX1sRtEPaoKpVmyRL9oHqPK2GSYjUfo1xki0OoHKB6KgfB2trQRVg4zd1xJKAzSHaopGC319Ll+xn8h1VfOEelIq43zlvHyHxxtIOz++U46ykcTX3GA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XBcGUWMKoMXAfjHRum8q0K2V3Ur90DH9u8FTJ1O25rU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_222511_707821_460581EA 
X-CRM114-Status: GOOD (  53.20  )
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

Hi Quentin,

On 11/29/2025 2:41 AM, Quentin Schulz wrote:
> Hi all,
> 
> I've finally found the time to test the RK3588 NPU (aka Rocket, upstream) on our products and I've been hit with Oopses when loosely following the instructions from https://docs.mesa3d.org/teflon.html. After debugging for a while this is often (not always!) reproducible when DRM_ACCEL_ROCKET=y (but not when built as a module!). The fact it's "not always" is a dead giveaway timing or probe order is involved, more later on that.
> 

This looks like a power domain problem. What would happen if you tried
enabling the regulator for the NPU power domain in U-Boot?

Or did you properly configure the corresponding regulator supply in
the power domain?


> I don't think the Oops is important as I believe it's a symptom of other issues, so I won't post it.
> 
> I'll list the issue I've identified so far, some seem easier to fix than others (the biggest issue of course being the hardest to fix).
> 
> 1. https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_core.c#L79
> 
> The error path after a failed pm_runtime_resume_and_get() probably should be calling rocket_core_fini(core) and not rocket_job_fini() (the former calls the latter) as to unwind everything that's been done in rocket_core_init() before this failed.
> 
> The PM core complains about unbalanced something when the core fails to init and is retried later.
> 
> I suggest the following:
> 
> """
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
> index abe7719c1db46..95a732ab418c3 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -76,7 +76,7 @@ int rocket_core_init(struct rocket_core *core)
> 
>      err = pm_runtime_resume_and_get(dev);
>      if (err) {
> -        rocket_job_fini(core);
> +        rocket_core_fini(core);
>          return err;
>      }
> 
> """
> 
> I can send a patch for that.
> 
> 2. rocket_probe() (https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_drv.c#L159) can result in out-of-bounds access when rocket_core_init() fails as rdev is a global variable (so rdev->num_cores persists between tries). Considering rdev->cores is allocated based on the number of available nodes in the DTB with the rknn compatible, if rocket_probe() is called more than the number of available nodes, rdev->cores[core] will result in out-of-bounds access.
> 
> I believe we could do:
> 
> """
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 5c0b63f0a8f00..ad602ebd17c44 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -158,6 +158,8 @@ static const struct drm_driver rocket_drm_driver = {
> 
>  static int rocket_probe(struct platform_device *pdev)
>  {
> +    int ret;
> +
>      if (rdev == NULL) {
>          /* First core probing, initialize DRM device. */
>          rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
> @@ -177,7 +179,15 @@ static int rocket_probe(struct platform_device *pdev)
> 
>      rdev->num_cores++;
> 
> -    return rocket_core_init(&rdev->cores[core]);
> +    ret = rocket_core_init(&rdev->cores[core]);
> +    if (ret) {
> +        rdev->num_cores--;
> +        if (rdev->num_cores == 0) {
> +            rocket_device_fini(rdev);
> +        }
> +    }
> +
> +    return ret;
>  }
> 
>  static void rocket_remove(struct platform_device *pdev)
> 
> """
> 

It seems hacky. I'm not sure whether this would be better
implemented as a component driver.

> I can send a patch for that.
> 
> 3. I believe (but I may be wrong) that core 0 is special (do we need to schedule through core 0 maybe?). There's a hardcoded fetch of the device associated with core 0 via rocket_iommu_domain_create(rdev->cores[0].dev); (https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_drv.c#L88). The issue is that this assumes that core 0 is always rdev->cores[0], which may not be true as it depends on the probe order (which is not guaranteed), which can be exacerbated by core 0 (HW index) probe being deferred for some reason. Is it necessary for core 0 to be the one initializing the DRM device or could we simply use any core for that (just the first to probe, whichever it actually is HW-wise)?

I think this is because multiple cores share the same IOMMU device.

> 
> If there's a need to know which of the three cores is core 0, we can have a vendor property for it or maybe aliases for the cores? We can also do a check on the base register address of the core in DT and then do a mapping in the driver. Any other suggestion?
> 
> 4. The actual issue I'm unable to suggest something for comes now. The following is all happening in the context of DRM_ACCEL_ROCKET being built-in (that is DRM_ACCEL_ROCKET=y). You can use aarch64's default defconfig, then DRM=y, DRM_ACCEL=y and DRM_ACCEL_ROCKET=y via menuconfig. Remember that this is not 100% reproducible (more often happening than not).
> 
> Points 1, 2 and 3 only are an issue if you hit some error-path during the probe of one of the cores, which is triggered by this point 4 here.
> 
> rknn_core_0 depends on rknn_mmu_0 as highlighted by the iommus phandle property. rknn_mmu_0 depends on RK3588_PD_NPUTOP power-domain. The parent domain (RK3588_PD_NPU) of RK3588_PD_NPUTOP power-domain has a domain-supply on a regulator on i2c (i2c0@42 for Jaguar, patches on the ML at https://lore.kernel.org/linux-rockchip/20250812085213.1071106-2-heiko@sntech.de/). When the rocket driver calls platform_driver_register() in its module_init() function, the kernel core will try to probe the associated device, via driver_probe_device(), then __driver_probe_device() and more specifically pm_runtime_get_suppliers(dev) in there (https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/base/dd.c#L793). Then this calls pm_runtime_get_sync() on all links, c.f. https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/base/power/runtime.c#L1914. Note that pm_runtime_get_suppliers() returns void. One of the links is the rknn_mmu_0.
> 
> Follow the next series of function calls, pm_runtime_get_sync() on rknn_mmu_0, rpm_resume(), rpm_callback(), __rpm_callback(). This then calls cb(). cb() is set via RPM_GET_CALLBACK(dev, runtime_resume). Due to rknn_mmu_0 device being probed with dev_pm_domain_attach() attaching the power-domain device to iommu via the pm_domain member, genpd_runtime_resume() (which goes to rockchip_pd_power_on()) is actually called. This then calls rockchip_pd_regulator_enable() which returns -EPROBE_DEFER. Going up in the call stack up to rpm_callback() you can see that retval = __rpm_callback(cb, dev); now is EPROBE_DEFER and thus, dev->power.runtime_error = EPROBE_DEFER at the end of the function.
> 
> Then once pm_runtime_resume_and_get(dev); is called in rocket_core_init() during probe of the rocket device, it'll call into rpm_get_suppliers() in __rpm_callback() which in turn will call pm_runtime_get_sync() on rknn_mmu_0 which will go up to rpm_resume() where dev->power.runtime_error will be checked and if non-zero will return -EINVAL, effectively eating -EPROBE_DEFER and failing the probe of the rocket device instead of deferring the probe.
> 
> Applying the below patch:
> 
> """
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
> index abe7719c1db46..c4692189bbfc6 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -72,22 +72,9 @@ int rocket_core_init(struct rocket_core *core)
>       */
>      pm_runtime_set_autosuspend_delay(dev, 50);
> 
> +    pm_runtime_set_suspended(dev);
>      pm_runtime_enable(dev);
> 
> -    err = pm_runtime_resume_and_get(dev);
> -    if (err) {
> -        rocket_job_fini(core);
> -        return err;
> -    }
> -
> -    version = rocket_pc_readl(core, VERSION);
> -    version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
> -
> -    pm_runtime_mark_last_busy(dev);
> -    pm_runtime_put_autosuspend(dev);
> -
> -    dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
> -
>      return 0;
>  }
> 
> """
> 
> seems to make it possible to run mesa's example. If pm_runtime_set_suspended(dev); isn't added, we'll only ever get job timeouts.
> 
> Note that I'm pretty sure this isn't the proper way to do it but wanted to give some of my debugging attempts at that.
> 
> I'm not sure how much further I can go and specifically I have no clue how to handle that properly. Please also verify all the claims I'm making, I'm not entirely sure I got every call stack right, it is quite convoluted and I don't have experience with those frameworks.
> 
> Does anyone have a clue how we can deal with that?
> 
> The driver built as a module doesn't have this issue because the regulator has enough time to probe so that PD doesn't return EPROBE_DEFER when the rocket device gets probed once reaching userspace (where the module is). I'm not entirely sure if this could be reproduced by having the regulator driver as a module too for example?
> 
> Cheers,
> Quentin
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
Best, 
Chaoyi

