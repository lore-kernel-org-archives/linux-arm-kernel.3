Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925ECCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8AmhX4mok0robJuG+QG0gW6GyqInlmPgtsWPUDrb0M=; b=U33V6+qBHIBQmNeg2YSvNjEPD3
	c2BteTJ+Yu23bduRjcXoyXbXIE23mXAaz2yibEhdSjgDRR0VRIdaDSSt27qMyNmyPLeJXc7b8u5nw
	a2fipZ/fj1dfD1u0Oj/+6e6mbmq6tcG911UXDIvcKrKGOnKzuAL61nP3eMhMRgGqcf7oiAJYyvf0Q
	wW87RGMpa2Qe9/eSbMpTxsef1YIxSZHv9EqkHvH8bHwoQ6WuBHFlnljM4kVlXVjvzcQPifYxnZQD0
	uOkCK2pmbRs/71/gjfCt9lTchtB/d8Y5QTD26ze239C/qJUjfzTC3qYfp2Q3OAu6bxhL7GesLOqBm
	gN9QV7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjX7-00000003DWS-1V3g;
	Thu, 28 Aug 2025 20:47:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfFZ-00000002DYd-0hj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:13:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89BC41688;
	Thu, 28 Aug 2025 09:13:11 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 688EE3F694;
	Thu, 28 Aug 2025 09:13:14 -0700 (PDT)
Message-ID: <8635e616-79b7-4d7d-a8b8-aa76ba027bc4@arm.com>
Date: Thu, 28 Aug 2025 17:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/33] arm_mpam: Add a helper to touch an MSC from any CPU
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-21-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-21-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_091321_304172_825E7A5F 
X-CRM114-Status: GOOD (  25.54  )
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

On 8/22/25 16:30, James Morse wrote:
> Resetting RIS entries from the cpuhp callback is easy as the
> callback occurs on the correct CPU. This won't be true for any other
> caller that wants to reset or configure an MSC.
> 
> Add a helper that schedules the provided function if necessary.
> Prevent the cpuhp callbacks from changing the MSC state by taking the
> cpuhp lock.
At first, I thought this was referring to something done in the patch.
Consider changing to something like:

Callers should take the cpuhp lock to prevent the cpuhp callbacks from
changing the MSC state.

Regardless, this looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 37 +++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c1f01dd748ad..759244966736 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -906,20 +906,51 @@ static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
>  	mutex_unlock(&msc->part_sel_lock);
>  }
>  
> -static void mpam_reset_ris(struct mpam_msc_ris *ris)
> +/*
> + * Called via smp_call_on_cpu() to prevent migration, while still being
> + * pre-emptible.
> + */
> +static int mpam_reset_ris(void *arg)
>  {
>  	u16 partid, partid_max;
> +	struct mpam_msc_ris *ris = arg;
>  
>  	mpam_assert_srcu_read_lock_held();
>  
>  	if (ris->in_reset_state)
> -		return;
> +		return 0;
>  
>  	spin_lock(&partid_max_lock);
>  	partid_max = mpam_partid_max;
>  	spin_unlock(&partid_max_lock);
>  	for (partid = 0; partid < partid_max; partid++)
>  		mpam_reset_ris_partid(ris, partid);
> +
> +	return 0;
> +}
> +
> +/*
> + * Get the preferred CPU for this MSC. If it is accessible from this CPU,
> + * this CPU is preferred. This can be preempted/migrated, it will only result
> + * in more work.
> + */
> +static int mpam_get_msc_preferred_cpu(struct mpam_msc *msc)
> +{
> +	int cpu = raw_smp_processor_id();
> +
> +	if (cpumask_test_cpu(cpu, &msc->accessibility))
> +		return cpu;
> +
> +	return cpumask_first_and(&msc->accessibility, cpu_online_mask);
> +}
> +
> +static int mpam_touch_msc(struct mpam_msc *msc, int (*fn)(void *a), void *arg)
> +{
> +	lockdep_assert_irqs_enabled();
> +	lockdep_assert_cpus_held();
> +	mpam_assert_srcu_read_lock_held();
> +
> +	return smp_call_on_cpu(mpam_get_msc_preferred_cpu(msc), fn, arg, true);
>  }
>  
>  static void mpam_reset_msc(struct mpam_msc *msc, bool online)
> @@ -932,7 +963,7 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
>  	mpam_mon_sel_outer_lock(msc);
>  	idx = srcu_read_lock(&mpam_srcu);
>  	list_for_each_entry_srcu(ris, &msc->ris, msc_list, srcu_read_lock_held(&mpam_srcu)) {
> -		mpam_reset_ris(ris);
> +		mpam_touch_msc(msc, &mpam_reset_ris, ris);
>  
>  		/*
>  		 * Set in_reset_state when coming online. The reset state

Thanks,

Ben


