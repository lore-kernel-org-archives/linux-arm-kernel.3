Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEEC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRFFly5Q7WXB+UD29AZYdW7l7YBmHbQto4mCrn/YvLU=; b=gRukwOFF3ObZR4c0nQErFl/Tg6
	4C/3VCAnF4uFLHUNrA6iRPsV+L6kEBW4Hop9KCka1i4cNXM0bqbEvXv3djHHEPVfyCoBA1GyZa2Ha
	BKFmyFXpCP5Ss0sJq6CVb9cEPCXqLhvK6T63JyPwgQILG9Z2xjO0u27HTleOac89bktedYtPwo7Od
	rovDnewUddy5KmrbiuJDUaomhq74SmEYYm0/wHiLVDaKJR8GSRDJCV3U6EKxDYifEfDF8ifN2d8Hm
	B8/46DY6snLTHW74LOw4jbYCJGYQthBu8c3tk1D8B64D0qd8rh//hCgwIQywwS2EobRDlQYFuY/Pd
	ZWh33i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdeS-0000000G0QC-2lX7;
	Tue, 29 Jul 2025 06:17:28 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdby-0000000G0C1-2zu8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 06:14:56 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 56T6BUc7063426;
	Tue, 29 Jul 2025 14:11:30 +0800 (+08)
	(envelope-from baisheng.gao@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx06.spreadtrum.com [10.0.1.11])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4brlGs62QBz2KJGTb;
	Tue, 29 Jul 2025 14:06:45 +0800 (CST)
Received: from BJ15137PCW.spreadtrum.com (10.0.73.32) by
 shmbx06.spreadtrum.com (10.0.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Tue, 29 Jul 2025 14:11:28 +0800
From: Baisheng Gao <baisheng.gao@unisoc.com>
To: <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baolin.wang@linux.alibaba.com>,
        <ben.horgan@arm.com>, <bobo.shaobowang@huawei.com>,
        <carl@os.amperecomputing.com>, <dave.martin@arm.com>,
        <david@redhat.com>, <dfustini@baylibre.com>, <kobak@nvidia.com>,
        <lcherian@marvell.com>, <lecopzerc@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <peternewman@google.com>, <quic_jiles@quicinc.com>,
        <rex.nie@jaguarmicro.com>, <robh@kernel.org>, <rohit.mathew@arm.com>,
        <scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
        <shameerali.kolothum.thodi@huawei.com>, <tan.shaopeng@fujitsu.com>,
        <xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
        <hao_hao.wang@unisoc.com>
Subject: Re: [RFC PATCH 17/36] arm_mpam: Add cpuhp callbacks to probe MSC hardware
Date: Tue, 29 Jul 2025 14:11:27 +0800
Message-ID: <20250729061127.206-1-baisheng.gao@unisoc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711183648.30766-18-james.morse@arm.com>
References: <20250711183648.30766-18-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.32]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx06.spreadtrum.com (10.0.1.11)
X-MAIL: SHSQR01.spreadtrum.com 56T6BUc7063426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_231455_407776_321AD6EF 
X-CRM114-Status: GOOD (  33.13  )
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

> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
> 
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed.
> 
> Later once MPAM is enabled, this cpuhp callback will be replaced by
> one that avoids the global list.
> 
> Enabling a static key will also take the cpuhp lock, so can't be done
> from the cpuhp callback. Whenever a new MSC has been probed schedule
> work to test if all the MSCs have now been probed.
> 
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/platform/arm64/mpam/mpam_devices.c  | 149 +++++++++++++++++++-
>  drivers/platform/arm64/mpam/mpam_internal.h |   8 +-
>  2 files changed, 152 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> index 0d6d5180903b..89434ae3efa6 100644
> --- a/drivers/platform/arm64/mpam/mpam_devices.c
> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
> @@ -4,6 +4,7 @@
>  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
>  
>  #include <linux/acpi.h>
> +#include <linux/atomic.h>
>  #include <linux/arm_mpam.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
> @@ -21,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  
>  #include <acpi/pcc.h>
>  
> @@ -39,6 +41,16 @@ struct srcu_struct mpam_srcu;
>  /* MPAM isn't available until all the MSC have been probed. */
>  static u32 mpam_num_msc;
>  
> +static int mpam_cpuhp_state;
> +static DEFINE_MUTEX(mpam_cpuhp_state_lock);
> +
> +/*
> + * mpam is enabled once all devices have been probed from CPU online callbacks,
> + * scheduled via this work_struct. If access to an MSC depends on a CPU that
> + * was not brought online at boot, this can happen surprisingly late.
> + */
> +static DECLARE_WORK(mpam_enable_work, &mpam_enable);
> +
>  /*
>   * An MSC is a physical container for controls and monitors, each identified by
>   * their RIS index. These share a base-address, interrupts and some MMIO
> @@ -78,6 +90,22 @@ LIST_HEAD(mpam_classes);
>  /* List of all objects that can be free()d after synchronise_srcu() */
>  static LLIST_HEAD(mpam_garbage);
>  
> +static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
> +{
> +	WARN_ON_ONCE(reg > msc->mapped_hwpage_sz);
> +	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +
> +	return readl_relaxed(msc->mapped_hwpage + reg);
> +}
> +
> +static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
> +{
> +	lockdep_assert_held_once(&msc->part_sel_lock);
> +	return __mpam_read_reg(msc, reg);
> +}
> +
> +#define mpam_read_partsel_reg(msc, reg)        _mpam_read_partsel_reg(msc, MPAMF_##reg)
> +
>  #define init_garbage(x)	init_llist_node(&(x)->garbage.llist)
>  
>  static struct mpam_vmsc *
> @@ -513,9 +541,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>  	return err;
>  }
>  
> -static void mpam_discovery_complete(void)
> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  {
> -	pr_err("Discovered all MSC\n");
> +	u64 idr;
> +	int err;
> +
> +	lockdep_assert_held(&msc->probe_lock);
> +
> +	mutex_lock(&msc->part_sel_lock);
> +	idr = mpam_read_partsel_reg(msc, AIDR);
> +	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
> +		pr_err_once("%s does not match MPAM architecture v1.0\n",
> +			    dev_name(&msc->pdev->dev));
> +		err = -EIO;
> +	} else {
> +		msc->probed = true;
> +		err = 0;
> +	}
> +	mutex_unlock(&msc->part_sel_lock);
> +
> +	return err;
> +}
> +
> +static int mpam_cpu_online(unsigned int cpu)
> +{
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
> +		mpam_cpuhp_state = 0;
> +	}
> +	mutex_unlock(&mpam_cpuhp_state_lock);
>  }
>  
>  static int mpam_dt_count_msc(void)
> @@ -774,7 +877,7 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>  	}
>  
>  	if (!err && fw_num_msc == mpam_num_msc)
> -		mpam_discovery_complete();
> +		mpam_register_cpuhp_callbacks(&mpam_discovery_cpu_online, NULL);
>  
>  	if (err && msc)
>  		mpam_msc_drv_remove(pdev);
> @@ -797,6 +900,46 @@ static struct platform_driver mpam_msc_driver = {
>  	.remove = mpam_msc_drv_remove,
>  };
>  
> +static void mpam_enable_once(void)
> +{
> +	mutex_lock(&mpam_cpuhp_state_lock);
> +	cpuhp_remove_state(mpam_cpuhp_state);
> +	mpam_cpuhp_state = 0;
> +	mutex_unlock(&mpam_cpuhp_state_lock);

Deleting the above 4 lines?
The mpam_cpuhp_state will be removed firstly in mpam_register_cpuhp_callbacks
if the mpam_cpuhp_state isn't 0.

> +
> +	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
> +
> +	pr_info("MPAM enabled\n");
> +}
> +
[snip]

Regards,
Baisheng

