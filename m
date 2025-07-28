Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C33C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeiV4NODkxjfxtGWIe0xh6ntlFkFQ7e97BJBGJKxzmE=; b=Ag3HMiAOPDujDo80peMMJ5x5Gw
	CMgTf4jannKKijKPq3b9Mr2j0X49/sdtA0M2+NZlpihvFS0n+oSfvT72JcWKt+wdUC64uglBLSuGv
	f3KJ91ecIaH0uDPvsWo9vHXyZ+k49st4JoWZ8PeZvW05Jt9myNmMy+Xm00nXTT9PIyY2zV3QEUmNv
	ErzUkjFZuPr0JIs193PSDHqphTZMDGKE8RxqWt8kx7oAurO07MU2+IIp5eIoSG+g33VRUU8QlqPzr
	KbGnQWwhoeO4h6ra0oigKomZ+3RDIQ1WNyyzUy1140JrEhVlRGyVGU9ksN1E8J/LysRO8QeP3OZTk
	Nw3z0NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKWj-0000000EAOB-2peb;
	Mon, 28 Jul 2025 09:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKUE-0000000EA5f-250h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:49:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B4DB150C;
	Mon, 28 Jul 2025 02:49:29 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8ED263F66E;
	Mon, 28 Jul 2025 02:49:33 -0700 (PDT)
Message-ID: <b69f7207-84b3-424f-b675-b423c56e5dcd@arm.com>
Date: Mon, 28 Jul 2025 10:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/36] arm_mpam: Reset MSC controls from cpu hp
 callbacks
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
 <20250711183648.30766-23-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-23-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024938_621065_90B3748F 
X-CRM114-Status: GOOD (  31.00  )
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
>   drivers/platform/arm64/mpam/mpam_devices.c  | 124 +++++++++++++++++++-
>   drivers/platform/arm64/mpam/mpam_internal.h |   8 ++
>   2 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> index 7b042a35405a..d014dbe0ab96 100644
> --- a/drivers/platform/arm64/mpam/mpam_devices.c
> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
> @@ -7,6 +7,7 @@
>   #include <linux/atomic.h>
>   #include <linux/arm_mpam.h>
>   #include <linux/bitfield.h>
> +#include <linux/bitmap.h>
>   #include <linux/cacheinfo.h>
>   #include <linux/cpu.h>
>   #include <linux/cpumask.h>
> @@ -849,8 +850,116 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>   	return 0;
>   }
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
> +	if (bm)
> +		__mpam_write_reg(msc, reg, bm);
Drop the 'if' as the 0 bit will always be part of the mask.

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
> +
> +	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
> +		mpam_write_partsel_reg(msc, MBW_PROP, bwa_fract);
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
>   static int mpam_cpu_online(unsigned int cpu)
>   {
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
>   	return 0;
>   }
>   
> @@ -886,6 +995,19 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>   
>   static int mpam_cpu_offline(unsigned int cpu)
>   {
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
>   	return 0;
>   }
>   
> @@ -1419,7 +1541,7 @@ static void mpam_enable_once(void)
>   	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>   
>   	printk(KERN_INFO "MPAM enabled with %u partid and %u pmg\n",
> -	       mpam_partid_max + 1, mpam_pmg_max + 1);
> +		READ_ONCE(mpam_partid_max) + 1, mpam_pmg_max + 1);

Belongs in 'arm_mpam: Probe MSCs to find the supported partid/pmg values'.

>   }
>   
>   /*
> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
> index be56234b84b4..f3cc88136524 100644
> --- a/drivers/platform/arm64/mpam/mpam_internal.h
> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
> @@ -5,6 +5,7 @@
>   #define MPAM_INTERNAL_H
>   
>   #include <linux/arm_mpam.h>
> +#include <linux/atomic.h>
>   #include <linux/cpumask.h>
>   #include <linux/io.h>
>   #include <linux/llist.h>
> @@ -43,6 +44,7 @@ struct mpam_msc {
>   	struct pcc_mbox_chan	*pcc_chan;
>   	u32			nrdy_usec;
>   	cpumask_t		accessibility;
> +	atomic_t		online_refs;
>   
>   	/*
>   	 * probe_lock is only take during discovery. After discovery these
> @@ -247,6 +249,7 @@ struct mpam_msc_ris {
>   	u8			ris_idx;
>   	u64			idr;
>   	struct mpam_props	props;
> +	bool			in_reset_state;
>   
>   	cpumask_t		affinity;
>   
> @@ -266,6 +269,11 @@ struct mpam_msc_ris {
>   extern struct srcu_struct mpam_srcu;
>   extern struct list_head mpam_classes;
>   
> +static inline void mpam_assert_srcu_read_lock_held(void)
> +{
> +	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
> +}
> +
>   /* System wide partid/pmg values */
>   extern u16 mpam_partid_max;
>   extern u8 mpam_pmg_max;


Thanks,

Ben


