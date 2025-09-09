Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D808FCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sKuKc3Qj6aT4N6gC/kM/PNRF15fBEbOJso7abJK5Vk=; b=dJPQlp3iU7Zk+kS6wnqus44aGi
	/0klJFPjlDwGdOr+AzAzqQGWj2XyN7zrDXhjlXm4Sh8wfRSNqcA6GV9ReiVmG8pSv2OaGVtDO4iaz
	zhUTBrINqWJYVM74K+bCidl1UgvdbywcmD/3YBXZHH+aVMUvD/WYgrm5KFWuVb7mX3EpQwVbLxhs4
	sHWgkqlE3BDq8whcAO1slktXbFterGNzKFlJBrh6thGhSNOzN5YsmPLGhUzEA6/m429ky2joWThb9
	So6qPGDxFDltDLqitP5TLXoiOgJZ5WoJfpHDBQ1chkc7lon/c25rQrbCUmjnPM6Qt8Q04SAoQ0NEC
	KwyHkM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27V-000000096pB-09TK;
	Tue, 09 Sep 2025 17:27:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1fs-00000008hKV-2Vxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:58:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A50C915A1;
	Tue,  9 Sep 2025 09:58:23 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67EE63F694;
	Tue,  9 Sep 2025 09:58:21 -0700 (PDT)
Message-ID: <6844fbe7-5b23-431d-879f-ec03ad78b190@arm.com>
Date: Tue, 9 Sep 2025 17:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/33] arm_mpam: Register and enable IRQs
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
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
 <20250822153048.2287-23-james.morse@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250822153048.2287-23-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_095832_748641_F4AA1D15 
X-CRM114-Status: GOOD (  25.30  )
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

Hi James, (:p)

On 22/08/2025 16:30, James Morse wrote:
> Register and enable error IRQs. All the MPAM error interrupts indicate a
> software bug, e.g. out of range partid. If the error interrupt is ever
> signalled, attempt to disable MPAM.
> 
> Only the irq handler accesses the ESR register, so no locking is needed.
> The work to disable MPAM after an error needs to happen at process
> context, use a threaded interrupt.
> 
> There is no support for percpu threaded interrupts, for now schedule
> the work to be done from the irq handler.
> 
> Enabling the IRQs in the MSC may involve cross calling to a CPU that
> can access the MSC.
> 
> Once the IRQ is requested, the mpam_disable() path can be called
> asynchronously, which will walk structures sized by max_partid. Ensure
> this size is fixed before the interrupt is requested.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 3516cbe8623e..210d64fad0b1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -1547,11 +1640,171 @@ static void mpam_enable_merge_features(struct list_head *all_classes_list)

> +static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
> +{
> +	u64 reg;
> +	u16 partid;
> +	u8 errcode, pmg, ris;
> +
> +	if (WARN_ON_ONCE(!msc) ||
> +	    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
> +					   &msc->accessibility)))
> +		return IRQ_NONE;
> +
> +	reg = mpam_msc_read_esr(msc);
> +
> +	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
> +	if (!errcode)
> +		return IRQ_NONE;
> +
> +	/* Clear level triggered irq */
> +	mpam_msc_zero_esr(msc);
> +
> +	partid = FIELD_GET(MPAMF_ESR_PARTID_MON, reg);
> +	pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
> +	ris = FIELD_GET(MPAMF_ESR_RIS, reg);
> +
> +	pr_err("error irq from msc:%u '%s', partid:%u, pmg: %u, ris: %u\n",
> +	       msc->id, mpam_errcode_names[errcode], partid, pmg, ris);
> +
> +	if (irq_is_percpu(irq)) {
> +		mpam_disable_msc_ecr(msc);
> +		schedule_work(&mpam_broken_work);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_WAKE_THREAD;
> +}

> +static void mpam_unregister_irqs(void)
> +{
> +	int irq, idx;
> +	struct mpam_msc *msc;
> +
> +	cpus_read_lock();
> +	/* take the lock as free_irq() can sleep */
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(msc, &mpam_all_msc, glbl_list, srcu_read_lock_held(&mpam_srcu)) {
> +		irq = platform_get_irq_byname_optional(msc->pdev, "error");
> +		if (irq <= 0)
> +			continue;
> +
> +		if (msc->error_irq_hw_enabled) {
> +			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
> +			msc->error_irq_hw_enabled = false;
> +		}
> +
> +		if (msc->error_irq_requested) {
> +			if (irq_is_percpu(irq)) {
> +				msc->reenable_error_ppi = 0;
> +				free_percpu_irq(irq, msc->error_dev_id);
> +			} else {
> +				devm_free_irq(&msc->pdev->dev, irq, msc);
> +			}
> +			msc->error_irq_requested = false;
> +		}
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +	cpus_read_unlock();
> +}


> @@ -1615,16 +1889,39 @@ static void mpam_reset_class(struct mpam_class *class)
>   * All of MPAMs errors indicate a software bug, restore any modified
>   * controls to their reset values.
>   */
> -void mpam_disable(void)
> +static irqreturn_t mpam_disable_thread(int irq, void *dev_id)
>  {
>  	int idx;
>  	struct mpam_class *class;
> +	struct mpam_msc *msc, *tmp;
> +
> +	mutex_lock(&mpam_cpuhp_state_lock);
> +	if (mpam_cpuhp_state) {
> +		cpuhp_remove_state(mpam_cpuhp_state);
> +		mpam_cpuhp_state = 0;
> +	}
> +	mutex_unlock(&mpam_cpuhp_state_lock);


> +	mpam_unregister_irqs();

When out-of-range PARTID get used, all the MSC go off at once - which means the interrupts
can be delivered to multiple CPUs at the same time. This unregister call is outside any
lock, and the msc->error_irq_* flags aren't atomic - leading to hilarity as this races
with itself.

Also turns out you can't devm_free_irq() from a threaded irq as it blocks forever in
syncrhonise_irq().

Naturally I didn't hit either of these issues when scheduling the thread from debugfs.

I've made the flags atomic, and thrown the threaded-irq away - instead the work always
gets scheduled.


Thanks,

James

>  	idx = srcu_read_lock(&mpam_srcu);
>  	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>  				 srcu_read_lock_held(&mpam_srcu))
>  		mpam_reset_class(class);
>  	srcu_read_unlock(&mpam_srcu, idx);
> +
> +	mutex_lock(&mpam_list_lock);
> +	list_for_each_entry_safe(msc, tmp, &mpam_all_msc, glbl_list)
> +		mpam_msc_destroy(msc);
> +	mutex_unlock(&mpam_list_lock);
> +	mpam_free_garbage();
> +
> +	return IRQ_HANDLED;
> +}
/*error_irq_requested

