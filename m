Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A1CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GQuwRNbbYERF3HcCU5HcRfIcv1oqJBN495ezrVPDYw=; b=v/bqggTugWMxbc5FU4W1Zs/Myk
	1ptWK86R/XbfV0+QEafrbVeYdCk+wF5LMTNi+gpSWZ/E217zp0J7E74EYPJr1xDp3lO/OsxH3hYsR
	imcfyBdBgDGYPCAx6Z6fhk/CiDLEVTyOo5pAJ6v2gbelRNxyCh9sF46yUYPqT3rgJdlEyRPBml36S
	YEZhv6U/KNW/7UgaE0R0/CeYpZODRheDsE5eaMekFba9rLwZMdLSQBLc1CtrYJokNhZNz8B38ItEv
	CePDvvbaBurJwhkDJ1yuSn63Lc8/SCLkzvJwoBHVDkSvunsk5H9YdVz3Wd7U0Taowzj0iGW5eALr3
	Psq6xE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3ka-00000006cw2-2OWt;
	Fri, 29 Aug 2025 18:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us07X-000000061y4-0ZmZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE48B19F0;
	Fri, 29 Aug 2025 07:30:17 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CD023F694;
	Fri, 29 Aug 2025 07:30:20 -0700 (PDT)
Message-ID: <c2a814d6-e235-4589-bdb0-63d08d4ca008@arm.com>
Date: Fri, 29 Aug 2025 15:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/33] arm_mpam: Extend reset logic to allow devices to be
 reset any time
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
 <20250822153048.2287-22-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-22-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_073027_270124_B244B49A 
X-CRM114-Status: GOOD (  23.32  )
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
> cpuhp callbacks aren't the only time the MSC configuration may need to
> be reset. Resctrl has an API call to reset a class.
> If an MPAM error interrupt arrives it indicates the driver has
> misprogrammed an MSC. The safest thing to do is reset all the MSCs
> and disable MPAM.
> 
> Add a helper to reset RIS via their class. Call this from mpam_disable(),
> which can be scheduled from the error interrupt handler.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 62 +++++++++++++++++++++++++++++++--
>  drivers/resctrl/mpam_internal.h |  1 +
>  2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 759244966736..3516cbe8623e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -915,8 +915,6 @@ static int mpam_reset_ris(void *arg)
>  	u16 partid, partid_max;
>  	struct mpam_msc_ris *ris = arg;
>  
> -	mpam_assert_srcu_read_lock_held();
> -
>  	if (ris->in_reset_state)
>  		return 0;
>  
> @@ -1569,6 +1567,66 @@ static void mpam_enable_once(void)
>  	       mpam_partid_max + 1, mpam_pmg_max + 1);
>  }
>  
> +static void mpam_reset_component_locked(struct mpam_component *comp)
> +{
> +	int idx;
> +	struct mpam_msc *msc;
> +	struct mpam_vmsc *vmsc;
> +	struct mpam_msc_ris *ris;
> +
> +	might_sleep();
> +	lockdep_assert_cpus_held();
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
> +		msc = vmsc->msc;
> +
> +		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
> +			if (!ris->in_reset_state)
> +				mpam_touch_msc(msc, mpam_reset_ris, ris);
> +			ris->in_reset_state = true;
> +		}
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +}
> +
> +static void mpam_reset_class_locked(struct mpam_class *class)
> +{
> +	int idx;
> +	struct mpam_component *comp;
> +
> +	lockdep_assert_cpus_held();
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_rcu(comp, &class->components, class_list)
> +		mpam_reset_component_locked(comp);
> +	srcu_read_unlock(&mpam_srcu, idx);
> +}
> +
> +static void mpam_reset_class(struct mpam_class *class)
> +{
> +	cpus_read_lock();
> +	mpam_reset_class_locked(class);
> +	cpus_read_unlock();
> +}
> +
> +/*
> + * Called in response to an error IRQ.
> + * All of MPAMs errors indicate a software bug, restore any modified
> + * controls to their reset values.
> + */
> +void mpam_disable(void)
> +{
> +	int idx;
> +	struct mpam_class *class;
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu))

Why do you use list_for_each_entry_srcu() here when in other places you
use list_for_each_entry_rcu()?

> +		mpam_reset_class(class);
> +	srcu_read_unlock(&mpam_srcu, idx);
> +}
> +
>  /*
>   * Enable mpam once all devices have been probed.
>   * Scheduled by mpam_discovery_cpu_online() once all devices have been created.
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 466d670a01eb..b30fee2b7674 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -281,6 +281,7 @@ extern u8 mpam_pmg_max;
>  
>  /* Scheduled work callback to enable mpam once all MSC have been probed */
>  void mpam_enable(struct work_struct *work);
> +void mpam_disable(void);
>  
>  int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>  				   cpumask_t *affinity);

Thanks,

Ben


