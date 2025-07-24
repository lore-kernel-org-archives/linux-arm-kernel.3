Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADD3C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0/ftlUT3T4YqMwvPMEgNV2Q5n32xLsQwMhPMe7PGH0=; b=SJ2YkoRjKL5Vq6ZyudbhvvVCwQ
	2BxlzquYndlRKqRo81/r/KgNdAUIIOmGcMpCtTf3cMSv2Fp6+NtSKd8n4YO0B3HVITVCaW10cLvLP
	hj8ycCtiSYQxXlBvHED8SB/QYHpGa2dXtiw2kndU0NzlZzkCexZFRcVxESeLWmScBbh6uj+WPhdDE
	dSbDtjrI79kgSXQUt1N52a+f1KlzBJtuC6OCP0s+F0ALfN2JzM1MJke0+nUVehmfNz/SREZNwZkAu
	vj4OjOQbTdaNW8N0doNbwYG0+qq/8dsDl8xINUky8L1JQ2m+//GNLGJ0yczymdWWwTwdRrCO4O9MZ
	eovSjmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNW-000000082ve-3vsT;
	Thu, 24 Jul 2025 17:05:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewhK-00000007iFl-2OIj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 14:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w0/ftlUT3T4YqMwvPMEgNV2Q5n32xLsQwMhPMe7PGH0=; b=e6re+GJnka5CELYYJCQ+1Rpk4A
	dYxBy2uYFSXGVct0+0wEnGhlssSbJ0RyNQqV0Ck0quhuWhjzYKxiN8c0gnHpzVVRcqlFt0TQfuZo8
	bs94sL2SlbMEzxH79CPp9gW+tdVCF94Fuo+gX57XaBqBReFY3KTbSNNhXdxX10B9fAY5OFGywUeAA
	KBo4XKXqD4yyN8tMxT+0ECjpH5rnZsjf6qI4c1zKWUgU4/r/jsDeoprfnn1FprxaG/1w2lpDyFz+6
	GFAWEU6L9i77Gigw5qlF/7lJjta+Pmhtu+WBbqydWAS5fE8nvc8UvezxuTX8ghdVA449rSZA08Khn
	b7f/jZIg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewhG-0000000BdRd-1Wyw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 14:13:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DA3F1A00;
	Thu, 24 Jul 2025 07:13:12 -0700 (PDT)
Received: from [10.57.84.166] (unknown [10.57.84.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDAB03F66E;
	Thu, 24 Jul 2025 07:13:15 -0700 (PDT)
Message-ID: <48e482f2-e7a8-4d6a-bf16-ad29f9331e3b@arm.com>
Date: Thu, 24 Jul 2025 15:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/36] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
Content-Language: en-GB
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
 <20250711183648.30766-18-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-18-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151322_909520_F3E235A4 
X-CRM114-Status: GOOD (  27.08  )
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

On 11/07/2025 19:36, James Morse wrote:
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
>   drivers/platform/arm64/mpam/mpam_devices.c  | 149 +++++++++++++++++++-
>   drivers/platform/arm64/mpam/mpam_internal.h |   8 +-
>   2 files changed, 152 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> index 0d6d5180903b..89434ae3efa6 100644
> --- a/drivers/platform/arm64/mpam/mpam_devices.c
> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
> @@ -4,6 +4,7 @@
>   #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
>   
>   #include <linux/acpi.h>
> +#include <linux/atomic.h>
>   #include <linux/arm_mpam.h>
>   #include <linux/cacheinfo.h>
>   #include <linux/cpu.h>
> @@ -21,6 +22,7 @@
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #include <acpi/pcc.h>
>   
> @@ -39,6 +41,16 @@ struct srcu_struct mpam_srcu;
>   /* MPAM isn't available until all the MSC have been probed. */
>   static u32 mpam_num_msc;
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
>   /*
>    * An MSC is a physical container for controls and monitors, each identified by
>    * their RIS index. These share a base-address, interrupts and some MMIO
> @@ -78,6 +90,22 @@ LIST_HEAD(mpam_classes);
>   /* List of all objects that can be free()d after synchronise_srcu() */
>   static LLIST_HEAD(mpam_garbage);
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
>   #define init_garbage(x)	init_llist_node(&(x)->garbage.llist)
>   
>   static struct mpam_vmsc *
> @@ -513,9 +541,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>   	return err;
>   }
>   
> -static void mpam_discovery_complete(void)
> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
>   {
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
The error message need only mention the major revision. You've added 
support for v1.1 and v1.0.> +		err = -EIO;
> +	} else {
> +		msc->probed = true;
> +		err = 0;
> +	}
> +	mutex_unlock(&msc->part_sel_lock);
> +
> +	return err;
> +}
[snip]
Thanks,

Ben


