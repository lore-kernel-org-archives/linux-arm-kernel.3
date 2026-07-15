Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D87C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0djkKfI5/VlvpMz3KnyKplv8Mo8bSmqPV2Jh7uF93w=; b=uTTgsYTLOzHH9IKleSb+TYYuwU
	Vbut298N8e7cmN28FLAh34vUr03So8W4W/XR7V4wmzPpTWhrPH6hYcVbrZ4NAiV2EQMj0+7B2MmvJ
	d8/ERJLZO5DjqfLsKWCMOO1qxYK8PsNsgSIjfAMqyKyR14MGIB3xKXWacbwXtytWC3CkhuHLWpYLe
	JEt7Wu4wnwriMeUxuWXIfxqQVmBhE/T9at9lChCkU1gIxAJc87At0dB5HAzoj2oqhrn5m3nE3sAoA
	G1Pwg91TsFsRBnQVubOUMfSqdiYSBRhfQC4/HraoJvYEp0aqrhIm4li+SjIiSCoQZGiDevJImkDVY
	EHjRYHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1M3-0000000FHSs-3RXK;
	Wed, 15 Jul 2026 15:16:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1M1-0000000FHS8-1RTS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:16:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53C141477;
	Wed, 15 Jul 2026 08:16:52 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E28683F905;
	Wed, 15 Jul 2026 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784128616; bh=Elyu2hBbLCzVOZv+VKUbmy1slaLvbqNRvF6FD7GR/d8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VU2ekDC/Y1ZZJYP6uA7vaTByi5nq5SBTz7aEz0edcZG04Pj6nSi/pa52RUTM4FHZy
	 4aUseb9LXATvNNOm0yFrXdUOSxsMmbaC0HMjkElsGB9jd6H3Pk+0lS0RUL6lAJ90Eb
	 NeTyNiUv4dyw614l8r+3X19xrAMkFsS+1j4b/zyk=
Message-ID: <42eff7e7-695c-4e2a-aae2-8abd1b92f615@arm.com>
Date: Wed, 15 Jul 2026 16:16:52 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 13/16] arm_mpam: prepare mon_sel locking for MPAM-Fb
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
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-14-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260710144520.917375-14-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_081657_467409_EED7992D 
X-CRM114-Status: GOOD (  27.82  )
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

On 7/10/26 15:45, Andre Przywara wrote:
> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSC are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with SCMI
> mailboxes it must be able to sleep, meaning a mutex must be used. The
> SCMI platforms can't support an overflow interrupt.
> Clearly these two can't exist for one MSC at the same time.

Is an MPAM-Fb platform using overflow interrupts definitely not possible? I would have thought that
as long as things were fast enough that threaded interrupts could be used. I do agree that it would
make things harder and the increased latency may make it unworkable.
> 
> Change the mon_sel locking wrapper function to only use a spinlock when
> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
> mutex, but only if we are in a sleepable context. If that's not the
> case, we return an error. This should not happen, as MPAM-Fb by design
> does not require an MSC access to happen from a specific CPU, so there
> is no need for any IPIs or preemption disabling to satisfy CPU
> constraints. 

It'd be good to mention that on the rare occasion that all cpus are no_hz_full and resctrl does the
monitor read via IPI that we already bail out early.

Thanks,

Ben

And since overflow interrupts are not supported at the moment
> anyway, we also wouldn't meet the other case.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_internal.h | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 04d1a59f02af..7b6e0df904f8 100644
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
> @@ -139,27 +140,44 @@ struct mpam_msc {
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
>  static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>  {
>  	raw_spin_lock_init(&msc->_mon_sel_lock);
> +	mutex_init(&msc->mon_sel_mutex);
>  }
>  
>  /* Bits for mpam features bitmaps */


