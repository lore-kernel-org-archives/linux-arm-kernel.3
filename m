Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4358AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+HmNWhMxJHCsYut0EOjx8jbXqGZJzUfWIAUZn7a8C0=; b=cnzT8ygyvmZHvc3wN13grBlZ3R
	iIbat/lVYzkb0LQnSDnVhaNHvNC4pJnsHTvPyiuzRT9JuXkI9jmFeqB1OtbgfqBkJHYGJfHUzsGCR
	UCiDGHIDEL9WEzr4kuOKelSu6iKt/pe23XaAVmK4B5hwOA4FWd8+DxJY/PnFiYsA7VmwPeS49TFrs
	hHXvW3NuRcrcO6fzeqCIgho2KnMB3MpVDS3il8/guJvOkp32/wYhB0aD8Gzff0fDMsj9jfi/qF3yL
	ITMXVxGm0MSiyuqBxLCc44fqJ4JpQPHIh/94ODC2CitpVadKAY57J0mFKL/1SmSaHKqityqwFw8Um
	p3KUOjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJCh-0000000GtdC-3EhI;
	Fri, 24 Jul 2026 16:56:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJCe-0000000Gtbf-49IZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:56:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 668EE1476;
	Fri, 24 Jul 2026 09:56:46 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E7FA3F66F;
	Fri, 24 Jul 2026 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784912210; bh=Y/D+EBCOl4xfZY6uaoNm+O2KJzSkIgk4kAcSgLDA6bA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qe8jE+gsv+/Q4qlBLzzvyPnYYhSl/TJg9JqOCElVDhe4g7WE+huzN3U3J4hr0VYmg
	 qc2psGQKI2hRUq2hoNMZ4+L6jeVX49AV58u2uXKqHcrwHbOLhM5cccN4APKsjZIdaD
	 CtDGvdJI7Ul/xl6OPsALfIUxwURYm82RmHPmD94w=
Message-ID: <ba68cf32-7b67-43ae-b65e-07003a755700@arm.com>
Date: Fri, 24 Jul 2026 17:56:44 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 07/10] arm_mpam: prepare mon_sel locking for MPAM-Fb
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-8-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260723155454.1760823-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_095653_507277_DEB69F6A 
X-CRM114-Status: GOOD (  26.48  )
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

Hi Andre,

On 7/23/26 16:54, Andre Przywara wrote:
> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSCs are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with
> MPAM-Fb mailbox MSC access it must be able to sleep, meaning a mutex must
> be used. So MPAM-Fb platforms cannot support an overflow interrupt easily.
> Clearly these two methods can't exist for one MSC at the same time.
> 
> Change the mon_sel locking wrapper function to only use a spinlock when
> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
> mutex, but only if we are in a sleepable context. If that's not the
> case, we return an error. This should not happen, as MPAM-Fb by design
> does not require an MSC access to happen from a specific CPU, so there
> is no need for any IPIs or preemption disabling to satisfy CPU
> constraints. And since overflow interrupts are not supported at the moment
> anyway, we also wouldn't meet the other case.
> Bailing out early is already happening in rare occasions today.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  |  5 ++++-
>  drivers/resctrl/mpam_internal.h | 32 ++++++++++++++++++++++++++------
>  2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 6329443c451f..e2cb884eacf4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2225,7 +2225,10 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	mpam_mon_sel_lock_init(msc);
> +	err = mpam_mon_sel_lock_init(dev, msc);
> +	if (err)
> +		return ERR_PTR(err);
> +
>  	msc->id = pdev->id;
>  	msc->pdev = pdev;
>  	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 0c3f6a040b20..b3a6ed9ed175 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -126,6 +126,7 @@ struct mpam_msc {
>  	 */
>  	raw_spinlock_t		_mon_sel_lock;
>  	unsigned long		_mon_sel_flags;
> +	struct mutex		mon_sel_mutex;
>  
>  	void __iomem		*mapped_hwpage;
>  	size_t			mapped_hwpage_sz;
> @@ -139,27 +140,46 @@ struct mpam_msc {
>  /* Returning false here means accesses to mon_sel must fail and report an error. */
>  static inline bool __must_check mpam_mon_sel_lock(struct mpam_msc *msc)
>  {
> -	/* Locking will require updating to support a firmware backed interface */
> -	if (WARN_ON_ONCE(msc->iface != MPAM_IFACE_MMIO))
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
> +
> +		return true;
> +	}
> +
> +	if (!preemptible())
>  		return false;
>  
> -	raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
> +	mutex_lock(&msc->mon_sel_mutex);
> +
>  	return true;
>  }
>  
>  static inline void mpam_mon_sel_unlock(struct mpam_msc *msc)
>  {
> -	raw_spin_unlock_irqrestore(&msc->_mon_sel_lock, msc->_mon_sel_flags);
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		raw_spin_unlock_irqrestore(&msc->_mon_sel_lock,
> +					   msc->_mon_sel_flags);
> +
> +		return;
> +	}
> +
> +	mutex_unlock(&msc->mon_sel_mutex);
>  }
>  
>  static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
>  {
> -	lockdep_assert_held_once(&msc->_mon_sel_lock);
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		lockdep_assert_held_once(&msc->_mon_sel_lock);
> +	else
> +		lockdep_assert_held_once(&msc->mon_sel_mutex);
>  }
>  
> -static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
> +static inline int mpam_mon_sel_lock_init(struct device *dev,
> +					 struct mpam_msc *msc)
>  {
>  	raw_spin_lock_init(&msc->_mon_sel_lock);
> +
> +	return devm_mutex_init(dev, &msc->mon_sel_mutex);

Any reason not to just init the lock that's being used?

Thanks,

Ben

>  }
>  
>  DEFINE_GUARD(mon_sel,


