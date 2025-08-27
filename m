Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62045CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C+iD2Bwrz0RNH7EY/4GviydTcNrXjIHS33uq3mriL4=; b=fRg2wTk4TsXJ3r5AQ3rnDi/ZXN
	1synB54oBoleVxDn7gtZJxh8wdfp5OcDBOPSL03ZBtS/XHu3OQfwZXZobimSNwGJ4XHVo40F2cX8j
	PAQY8vpkvC6W4d7nS3Syj0AEVKU6RI0XMWo8QXYVcqk1V7gpuo+TT5c0Gagz7WncrKrvcp+jlm8qg
	jAyWmrtn7XlR/WLe+uYP5bFXd83N2RhNcxM5LxnX/nd4Qv/9/9bNdLt6N2WJLxFRkr31WSnkrbUPF
	TBWb3tOJArzFMKwB9d/W2KWxlFmJGa3ovlSS5oFyerXKYyvLiiQHyjmotaRUyd0P3jF+86390wcud
	NukDIbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbx-0000000GZI7-0y1z;
	Wed, 27 Aug 2025 19:15:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIsC-0000000GAKm-2f6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:19:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE2E9152B;
	Wed, 27 Aug 2025 09:19:33 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEF773F738;
	Wed, 27 Aug 2025 09:19:36 -0700 (PDT)
Message-ID: <1c20a5b2-2afe-4084-9494-a994e1a275b7@arm.com>
Date: Wed, 27 Aug 2025 17:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/33] arm_mpam: Reset MSC controls from cpu hp callbacks
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
 <20250822153048.2287-20-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-20-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091944_771021_BA297923 
X-CRM114-Status: GOOD (  30.64  )
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
> When a CPU comes online, it may bring a newly accessible MSC with
> it. Only the default partid has its value reset by hardware, and
> even then the MSC might not have been reset since its config was
> previously dirtyied. e.g. Kexec.
> 
> Any in-use partid must have its configuration restored, or reset.
> In-use partids may be held in caches and evicted later.
> 
> MSC are also reset when CPUs are taken offline to cover cases where
> firmware doesn't reset the MSC over reboot using UEFI, or kexec
> where there is no firmware involvement.
> 
> If the configuration for a RIS has not been touched since it was
> brought online, it does not need resetting again.
> 
> To reset, write the maximum values for all discovered controls.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since RFC:
>  * Last bitmap write will always be non-zero.
>   * Dropped READ_ONCE() - teh value can no longer change.
> ---
>  drivers/resctrl/mpam_devices.c  | 121 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |   8 +++
>  2 files changed, 129 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index bb62de6d3847..c1f01dd748ad 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -7,6 +7,7 @@
>  #include <linux/atomic.h>
>  #include <linux/arm_mpam.h>
>  #include <linux/bitfield.h>
> +#include <linux/bitmap.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
>  #include <linux/cpumask.h>
> @@ -849,8 +850,115 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	return 0;
>  }
>  
> +static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
> +{
> +	u32 num_words, msb;
> +	u32 bm = ~0;
> +	int i;
> +
> +	lockdep_assert_held(&msc->part_sel_lock);
> +
> +	if (wd == 0)
> +		return;
> +
> +	/*
> +	 * Write all ~0 to all but the last 32bit-word, which may
> +	 * have fewer bits...
> +	 */
> +	num_words = DIV_ROUND_UP(wd, 32);
> +	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
> +		__mpam_write_reg(msc, reg, bm);
> +
> +	/*
> +	 * ....and then the last (maybe) partial 32bit word. When wd is a
> +	 * multiple of 32, msb should be 31 to write a full 32bit word.
> +	 */
> +	msb = (wd - 1) % 32;
> +	bm = GENMASK(msb, 0);
> +	__mpam_write_reg(msc, reg, bm);
> +}
> +
> +static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
> +{
> +	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
> +	struct mpam_msc *msc = ris->vmsc->msc;
> +	struct mpam_props *rprops = &ris->props;
> +
> +	mpam_assert_srcu_read_lock_held();
> +
> +	mutex_lock(&msc->part_sel_lock);
> +	__mpam_part_sel(ris->ris_idx, partid, msc);
> +
> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops))
> +		mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
> +
> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops))
> +		mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
> +
> +	if (mpam_has_feature(mpam_feat_mbw_min, rprops))
> +		mpam_write_partsel_reg(msc, MBW_MIN, 0);
> +
> +	if (mpam_has_feature(mpam_feat_mbw_max, rprops))
> +		mpam_write_partsel_reg(msc, MBW_MAX, bwa_fract);
MPAMCFG_MBW_MAX_MAX can be used directly instead of bwa_fract.
> +
> +	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
> +		mpam_write_partsel_reg(msc, MBW_PROP, bwa_fract);
Shouldn't this reset to 0? STRIDEM1 is a cost.
> +	mutex_unlock(&msc->part_sel_lock);
> +}
> +
> +static void mpam_reset_ris(struct mpam_msc_ris *ris)
> +{
> +	u16 partid, partid_max;
> +
> +	mpam_assert_srcu_read_lock_held();
> +
> +	if (ris->in_reset_state)
> +		return;
> +
> +	spin_lock(&partid_max_lock);
> +	partid_max = mpam_partid_max;
> +	spin_unlock(&partid_max_lock);
> +	for (partid = 0; partid < partid_max; partid++)
> +		mpam_reset_ris_partid(ris, partid);
> +}
> +
> +static void mpam_reset_msc(struct mpam_msc *msc, bool online)
> +{
> +	int idx;
> +	struct mpam_msc_ris *ris;
> +
> +	mpam_assert_srcu_read_lock_held();
> +
> +	mpam_mon_sel_outer_lock(msc);
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(ris, &msc->ris, msc_list, srcu_read_lock_held(&mpam_srcu)) {
> +		mpam_reset_ris(ris);
> +
> +		/*
> +		 * Set in_reset_state when coming online. The reset state
> +		 * for non-zero partid may be lost while the CPUs are offline.
> +		 */
> +		ris->in_reset_state = online;
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +	mpam_mon_sel_outer_unlock(msc);
> +}
> +
>  static int mpam_cpu_online(unsigned int cpu)
>  {
> +	int idx;
> +	struct mpam_msc *msc;
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(msc, &mpam_all_msc, glbl_list, srcu_read_lock_held(&mpam_srcu)) {
> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +			continue;
> +
> +		if (atomic_fetch_inc(&msc->online_refs) == 0)
> +			mpam_reset_msc(msc, true);
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +
>  	return 0;
>  }
>  
> @@ -886,6 +994,19 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  
>  static int mpam_cpu_offline(unsigned int cpu)
>  {
> +	int idx;
> +	struct mpam_msc *msc;
> +
> +	idx = srcu_read_lock(&mpam_srcu);
> +	list_for_each_entry_srcu(msc, &mpam_all_msc, glbl_list, srcu_read_lock_held(&mpam_srcu)) {
> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +			continue;
> +
> +		if (atomic_dec_and_test(&msc->online_refs))
> +			mpam_reset_msc(msc, false);
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index a2b0ff411138..466d670a01eb 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -5,6 +5,7 @@
>  #define MPAM_INTERNAL_H
>  
>  #include <linux/arm_mpam.h>
> +#include <linux/atomic.h>
>  #include <linux/cpumask.h>
>  #include <linux/io.h>
>  #include <linux/llist.h>
> @@ -43,6 +44,7 @@ struct mpam_msc {
>  	struct pcc_mbox_chan	*pcc_chan;
>  	u32			nrdy_usec;
>  	cpumask_t		accessibility;
> +	atomic_t		online_refs;
>  
>  	/*
>  	 * probe_lock is only take during discovery. After discovery these
> @@ -248,6 +250,7 @@ struct mpam_msc_ris {
>  	u8			ris_idx;
>  	u64			idr;
>  	struct mpam_props	props;
> +	bool			in_reset_state;
>  
>  	cpumask_t		affinity;
>  
> @@ -267,6 +270,11 @@ struct mpam_msc_ris {
>  extern struct srcu_struct mpam_srcu;
>  extern struct list_head mpam_classes;
>  
> +static inline void mpam_assert_srcu_read_lock_held(void)
> +{
> +	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
> +}
> +
>  /* System wide partid/pmg values */
>  extern u16 mpam_partid_max;
>  extern u8 mpam_pmg_max;

Thanks,

Ben


