Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E87CAC584
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdEPLvEjyzwutXa1vJA1nZXuqv6b4zrFGZ+8cJRYLeM=; b=3Jiy4wss0fVtHVItD8+YwAu4wh
	qRPoOB5wcARz3I/E6751Ey4TrBR4vO3qr2i9+S+ZzTjKqoo68yujMVUmfORDtOZLdPMlD8XRqVJmz
	zInYHGJnGm6DapYX+df3w5ETEZHGCWqu8zAruEzJ5XfJlfzonZF/KLNomps3KhmI3ZbeRqroyqD4/
	yC/QLQWjLLkhNv5qjHsGwfwyWSSh8nBeTKos/YuCdrL+vbk3lnlTvisW/IdyIoYlde5USq9PMQCyM
	hxT4OsY4bHA4+RE9qCIyYmKme5oBlMNU8mWQ6iqyoLSVIrkWkWbWkdzHd05A6MDlADxvaOKlPdkA9
	jNZpuQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVR-00000005RCk-3C2p;
	Sat, 06 Sep 2025 00:10:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZTy-00000003AXg-3OFr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:40:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1970152B;
	Fri,  5 Sep 2025 09:40:05 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6442A3F63F;
	Fri,  5 Sep 2025 09:40:08 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:40:05 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lecopzer Chen <lecopzerc@nvidia.com>
Subject: Re: [PATCH 14/33] arm_mpam: Add cpuhp callbacks to probe MSC hardware
Message-ID: <aLsSZWUlbrEzbx6O@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-15-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-15-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_094014_943403_E9114EC0 
X-CRM114-Status: GOOD (  42.18  )
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

Hi James,

On Fri, Aug 22, 2025 at 03:29:55PM +0000, James Morse wrote:
> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
> 
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed.

It may be worth mentioning that the low-level MSC register accessors
are added by this patch.

> Later once MPAM is enabled, this cpuhp callback will be replaced by
> one that avoids the global list.

I misread this is as meaning "later in the patch series" and got
confused.

Perhaps, something like the following? (though this got a bit verbose)

--8<--

Once all MSCs reported by the firmware have been probed from a CPU in
their respective cpu-affinity set, the probe-time cpuhp callbacks are
replaced.  The replacement callbacks will ultimately need to handle
save/restore of the runtime MSC state across power transitions, but for
now there is nothing to do in them: so do nothing.

-->8--

> Enabling a static key will also take the cpuhp lock, so can't be done

What static key?

None in this patch that I can see.

> from the cpuhp callback. Whenever a new MSC has been probed schedule
> work to test if all the MSCs have now been probed.
> 
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 144 +++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |   8 +-
>  2 files changed, 147 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c

[...]

> @@ -511,9 +539,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,

[...]

> +static int mpam_cpu_online(unsigned int cpu)
>  {
> -	pr_err("Discovered all MSC\n");

I guess this disappears later?

If we print anything, it feels like it should be in the
mpam_enable_once() path, otherwise it looks like dmesg is going to get
spammed on every hotplug.  I might have missed something, here.

> +	return 0;
> +}
> +
> +/* Before mpam is enabled, try to probe new MSC */
> +static int mpam_discovery_cpu_online(unsigned int cpu)
> +{
> +	int err = 0;
> +	struct mpam_msc *msc;
> +	bool new_device_probed = false;
> +
> +	mutex_lock(&mpam_list_lock);

I take it nothing breaks if we sleep here?

Pending cpuhp callbacks for this CPU look to be blocked while we sleep,
at the very least.

Since this only happens during the probing phase, maybe that's not such
a big deal.

Is it likely that some late CPUs might be left offline indefinitely?

If so, we might end up doing futile work here forever.


> +	list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +			continue;
> +
> +		mutex_lock(&msc->probe_lock);
> +		if (!msc->probed)
> +			err = mpam_msc_hw_probe(msc);
> +		mutex_unlock(&msc->probe_lock);
> +
> +		if (!err)
> +			new_device_probed = true;
> +		else
> +			break; // mpam_broken

What's the effect of returning a non-zero value to the CPU hotplug
callback dispatcher here?

Do we want to tear anything down if MPAM is unusable?

> +	}
> +	mutex_unlock(&mpam_list_lock);
> +
> +	if (new_device_probed && !err)
> +		schedule_work(&mpam_enable_work);
> +
> +	return err;
> +}
> +
> +static int mpam_cpu_offline(unsigned int cpu)
> +{
> +	return 0;
> +}
> +
> +static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
> +					  int (*offline)(unsigned int offline))
> +{
> +	mutex_lock(&mpam_cpuhp_state_lock);
> +	if (mpam_cpuhp_state) {
> +		cpuhp_remove_state(mpam_cpuhp_state);
> +		mpam_cpuhp_state = 0;
> +	}
> +
> +	mpam_cpuhp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mpam:online",
> +					     online, offline);
> +	if (mpam_cpuhp_state <= 0) {
> +		pr_err("Failed to register cpuhp callbacks");

Should an error code be returned to the caller if this fails?

> +		mpam_cpuhp_state = 0;
> +	}
> +	mutex_unlock(&mpam_cpuhp_state_lock);
>  }
>  
>  static int mpam_dt_count_msc(void)
> @@ -772,7 +875,7 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>  	}
>  
>  	if (!err && fw_num_msc == mpam_num_msc)
> -		mpam_discovery_complete();
> +		mpam_register_cpuhp_callbacks(&mpam_discovery_cpu_online, NULL);

Abandon probing the MSC if this fails?

(However, the next phase of probing hangs off CPU hotplug, so it just
won't happen if the callbacks can't be registered -- but it looks like
MPAM may be left in a half-probed state.  I'm not entirely convinced
that this matters if the MPAM driver is not unloadable anyway...)

Nit: redundant &

(You don't have it in the similar call in mpam_enable_once().)


>  
>  	if (err && msc)
>  		mpam_msc_drv_remove(pdev);
> @@ -795,6 +898,41 @@ static struct platform_driver mpam_msc_driver = {
>  	.remove = mpam_msc_drv_remove,
>  };
>  
> +static void mpam_enable_once(void)
> +{
> +	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);

Should it be fatal if this fails?

> +
> +	pr_info("MPAM enabled\n");
> +}
> +
> +/*
> + * Enable mpam once all devices have been probed.
> + * Scheduled by mpam_discovery_cpu_online() once all devices have been created.
> + * Also scheduled when new devices are probed when new CPUs come online.
> + */
> +void mpam_enable(struct work_struct *work)
> +{
> +	static atomic_t once;

Nit: possibly unnecessary atomic_t?  This is slow-path code, and we
already have to take mpam_list_lock.  Harmless, though.

> +	struct mpam_msc *msc;
> +	bool all_devices_probed = true;
> +
> +	/* Have we probed all the hw devices? */
> +	mutex_lock(&mpam_list_lock);
> +	list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
> +		mutex_lock(&msc->probe_lock);
> +		if (!msc->probed)
> +			all_devices_probed = false;
> +		mutex_unlock(&msc->probe_lock);
> +
> +		if (!all_devices_probed)
> +			break;

WARN()?

We counted the MSCs in via the mpam_discovery_cpu_online(), so I think
we shouldn't get in here if some failed to probe?

> +	}
> +	mutex_unlock(&mpam_list_lock);
> +
> +	if (all_devices_probed && !atomic_fetch_inc(&once))
> +		mpam_enable_once();
> +}

[...]

Cheers
---Dave

