Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D1DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHKUyEn30JFRHmi+ydY8WGA10PyE0rwHqa0xIh1iBFs=; b=oHWmv8vFqaMdkQwLEIvOQ/4GTw
	aaFk/ki+JB5ezVKuNrUEV7Sof2gCIGJraaMsfdOpVGpSMfW+TPfZ7EVOpbDXLokHuCJuk0zK2YH2q
	aGN50Tou3JQzix5JFH3IU8B+RHVRvXFaWUYxxu8SOFI9riinzay/JizeyTsd1+2uUMboDewg9BdSv
	AhePib5na7JZI/Q5YQ/Ww/3DurLVgCMI4c6u7kTY0+OF+yB/ERYfwfoHXTUEIWwroYrVh+q/GubRU
	RQdA5ok+VC63XxaLUommKlc/yjpdp9JPuh6lJY62fSt9tYcV+l83Rw/UGTq0WNQRsruJxAiTWb1/R
	duLSIA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL4j-0000000EERn-3zoq;
	Mon, 28 Jul 2025 10:27:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL0U-0000000EDiP-1VXv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 10:22:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93294152B;
	Mon, 28 Jul 2025 03:22:49 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419383F673;
	Mon, 28 Jul 2025 03:22:54 -0700 (PDT)
Message-ID: <fcbe5517-0256-48ce-aa50-8017928737d7@arm.com>
Date: Mon, 28 Jul 2025 11:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/36] arm_mpam: Extend reset logic to allow devices
 to be reset any time
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-25-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-25-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_032258_479060_EF5184F1 
X-CRM114-Status: GOOD (  22.95  )
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

On 7/11/25 19:36, James Morse wrote:
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
>   drivers/platform/arm64/mpam/mpam_devices.c  | 62 ++++++++++++++++++++-
>   drivers/platform/arm64/mpam/mpam_internal.h |  1 +
>   2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> index 2e32e54cc081..145535cd4732 100644
> --- a/drivers/platform/arm64/mpam/mpam_devices.c
> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
> @@ -916,8 +916,6 @@ static int mpam_reset_ris(void *arg)
>   	u16 partid, partid_max;
>   	struct mpam_msc_ris *ris = arg;
>   
> -	mpam_assert_srcu_read_lock_held();
> -
>   	if (ris->in_reset_state)
>   		return 0;
>   
> @@ -1575,6 +1573,66 @@ static void mpam_enable_once(void)
>   		READ_ONCE(mpam_partid_max) + 1, mpam_pmg_max + 1);
>   }
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
> +		mpam_reset_class(class);
> +	srcu_read_unlock(&mpam_srcu, idx);
> +}
Consider moving to the next patch where you introduce interrupt support.
> +
>   /*
>    * Enable mpam once all devices have been probed.
>    * Scheduled by mpam_discovery_cpu_online() once all devices have been created.
> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
> index f3cc88136524..de05eece0a31 100644
> --- a/drivers/platform/arm64/mpam/mpam_internal.h
> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
> @@ -280,6 +280,7 @@ extern u8 mpam_pmg_max;
>   
>   /* Scheduled work callback to enable mpam once all MSC have been probed */
>   void mpam_enable(struct work_struct *work);
> +void mpam_disable(void);
>   
>   int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>   				   cpumask_t *affinity);


Thanks,

Ben


