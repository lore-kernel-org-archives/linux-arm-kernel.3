Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87183CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZImDQ+Y8TYXtCSQO8y+6PrBJlWaG0qDOZHRf851abQ=; b=y+Cb0gIoIqJksBZRmFu4zKsHZD
	2c262jZHMaqf4AVE6rJ+rEQyKNneVVDqaRlNru4ltmAYB1ny7+8n7qO1/MZo4S61sxyPRw0WPNezp
	3iZnPekjuy3XhOV+t7eCX6sd4acj6e7eqKws7g/1OJ3pNczAmU2LrRVXl7th91jZ5WJG5iBX5pLLw
	2TToTiCLD62pBNLyn8KkLm0dft9uk0wK0z4HiYcKaSplMvNjUZKzluB0auBzbK7MD74A8rBqYMIM8
	gfV9Mzis5ZgArE78tJped5rkgGPIazDMeFowArS00Btn36cMcOUuDn4gPLvkGva6RSqDpN+93edYC
	BW6jMoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLG9-00000006Xm4-3gKj;
	Fri, 08 May 2026 13:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLG6-00000006XlG-3WPm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:28:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE026263D;
	Fri,  8 May 2026 06:28:41 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EC883F836;
	Fri,  8 May 2026 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778246927; bh=9KS0WTXCahvKXV/JJ94mT8mROfm5IBLFez8L+EmX2q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdJJXyx7B5G+YJBd6CcSlFvWMz+BPVcwpXgYUYCE5UTVJw2YQjK8VNXkwiphsFmOi
	 UUeGpVvRQDKwzRTnem6x055cPJtt0F4gCAzQ7gcsVqzFLawq4zPF3nQgcVBIW59TUm
	 9Nb66uxeUD9/YpMtygYriY/s5ERnGqUavR8lyF10=
Date: Fri, 8 May 2026 14:28:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v11 07/27] coresight: Take a reference on csdev
Message-ID: <20260508132844.GG3778514@e132581.arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-7-fc7fb9d5af1c@arm.com>
 <b9fb8b0f-54fc-4fd2-9a0f-44889b5a8eb0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9fb8b0f-54fc-4fd2-9a0f-44889b5a8eb0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_062851_030627_0628AB7D 
X-CRM114-Status: GOOD (  33.12  )
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

On Thu, May 07, 2026 at 03:55:26PM +0100, James Clark wrote:

[...]

> Hi Leo,
> 
> Testing on the Orion O6 board was all good, and so was stress testing
> concurrent sysfs mode and hotplug on Juno.

Thanks a lot for test!

> However, I was trying to stress test sysfs mode and rmmod on Juno and
> ran into an issue, although a similar issue is present without your
> patchset.

I don't think CPU PM introduces additional complexity for the above cases.
The reason is that CPU PM notifiers _only_ apply to active sessions, and
once a device is enabled, the module cannot be removed.

If the race conditions between enabling/disabling sessions and module
load/unload are properly handled, CPU PM should be safe. If we have bug
in these race conditions, the high frequency data access in CPU PM may
expose the issues - I don't expect CPU PM is the culprit.

> If you run an rmmod on all the coresight devices at the same time as an
> enable_source / disable loop you always get this:
> 
>  WARNING: possible circular locking dependency detected
>  7.0.0-rc1+ #713 Tainted: G                 N
>  ------------------------------------------------------
>  rmmod/1361 is trying to acquire lock:
>  ffff0008042f69a8 (kn->active#144){++++}-{0:0}, at:
> __kernfs_remove+0x1b8/0x2c8

kn->active is not a lock but an active reference of sysfs node, but it
use lockdep annotation to detect lock dependency.

>   Possible unsafe locking scenario:
>         CPU0                    CPU1
>         ----                    ----
>    lock(coresight_mutex);
>                                 lock(cpu_hotplug_lock);
>                                 lock(coresight_mutex);
>    lock(kn->active#144);
>   *** DEADLOCK ***

The potential deadlock sequence could be:

  kernfs_fop_write_iter()
   `> kernfs_get_active_of()    => acquire kn->active
   `> coresight_enable_sysfs()  => acquire coresight_mutex

  coresight_unregister()        => acquire coresight_mutex
   `> device_unregister()
       `> __kernfs_remove()
           `> kernfs_drain()    => acquire kn->active

> I think the issue can be fixed by releasing the coresight_mutex before
> device_unregister():
> 
>   diff --git a/drivers/hwtracing/coresight/coresight-core.c
> b/drivers/hwtracing/coresight/coresight-core.c
>   index 015363da12fa..620560880f12 100644
>   --- a/drivers/hwtracing/coresight/coresight-core.c
>   +++ b/drivers/hwtracing/coresight/coresight-core.c
>   @@ -1639,8 +1639,8 @@ void coresight_unregister(struct coresight_device
> *csdev)
>           coresight_remove_conns(csdev);
>           coresight_clear_default_sink(csdev);
>           coresight_release_platform_data(csdev->dev.parent, csdev->pdata);
>   -       device_unregister(&csdev->dev);
>           mutex_unlock(&coresight_mutex);
>   +       device_unregister(&csdev->dev);
>    }
>    EXPORT_SYMBOL_GPL(coresight_unregister);

If so, we also need to move device_register() out of the mutex scope.

That said, I still think we should dive a bit if can use smaller locking
granluarity (combining with bus management provided by device model).

> Although I didn't think too hard about the implications, but it might be ok
> because once all the connections are removed the device can't be used so
> releasing the coresight_mutex isn't an issue.
> 
> But then testing that I ran into some kind of refleak where I couldn't
> unload modules anymore, even though I'd disabled everything. But that could
> be a different issue:
> 
>   rmmod: ERROR: Module coresight_funnel is in use
>   rmmod: ERROR: Module coresight_replicator is in use
>   rmmod: ERROR: Module coresight_etm4x is in use
>   rmmod: ERROR: Module coresight_tmc is in use
>   rmmod: ERROR: Module coresight_cti is in use
>   rmmod: ERROR: Module coresight is in use by: coresight_tmc coresight_cti
> coresight_etm4x coresight_replicator coresight_funnel

I suspect this is due to module references are not properly released, or
the entire CS path is not properly disabled.

After the issue occurs, can the ETM sysfs knob still be accessed? I am
curious whether this is caused by the sysfs knob disappearing so no way
to disable the path or the sysfs knob still exists but the driver
internally misses to disable the path.

> Anyway I don't think your patches make this worse, so we can probably ignore
> it, but it would be good to be able to stress test the new modifications
> around the same area.

As no regression in test, I agree that we should not defer this series.

We can fix the race with module load/unload as a separate task:

  - sysfs mode + module load/unload
  - perf mode + module load/unload

Then we can combine stress test with CPU idle/hotplug.

Thanks,
Leo

