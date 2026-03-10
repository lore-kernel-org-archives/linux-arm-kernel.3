Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC993FCC9C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=app7xGe8oMjvB71vTCi2tRDtRjSSKrIDsBPuZ+BRhJY=; b=2j5FiCNrPU1esgGFuIsEs5lGtL
	DbVnpSBPjx1fBEaTwI5xgrD5QwbwHzWQcaEfFF9cBqxhHLckONSqdUPoJdBwQoEkNIFd027/Nt5s0
	f23cjNPQxySbvViYuyZmXTegJkUmGCi1ItsKOPUduBIsDXuwo6RkL6mWHjjRhcYyBfA4zs02MdAPJ
	VpWjwpp3A2udPeikpsanHdNl4iqKnkaHvLo5Jwl0HC5EfkWkxOF8qB5f9LmhlJnzqLacgNsQJ9VE7
	72y0LK7zsc2XQ0u5cDhm0PXUqvdavqksfYuOmnfwoowK2Sb03m/e70sYGBrQzrtsJ25JVPJ5dVX98
	J5lhk58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqPP-00000008mZY-2ohQ;
	Tue, 10 Mar 2026 06:17:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqPM-00000008mYx-0lbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 06:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773123450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=app7xGe8oMjvB71vTCi2tRDtRjSSKrIDsBPuZ+BRhJY=;
	b=fRDM71jFjcq0bTQtSbAC8iSAip7FlN74LIkA3S3Rttk+GDgS8x8J1s6GwH7MTqOzD0RIIz
	4/o5Ek8PiyF5+BkKsTjTKxMwUeQ18JopC9wXc0pH2I+PuEMcWWXu3ebcjfrOI6HQLPIgCS
	THW7amA28yC9iSIgbADQXvSgVE/PJwE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-s4J6FFpmOzKBKnfaFI_B9Q-1; Tue, 10 Mar 2026 02:17:29 -0400
X-MC-Unique: s4J6FFpmOzKBKnfaFI_B9Q-1
X-Mimecast-MFC-AGG-ID: s4J6FFpmOzKBKnfaFI_B9Q_1773123449
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73783c96baso3004378a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 23:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123449; x=1773728249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=app7xGe8oMjvB71vTCi2tRDtRjSSKrIDsBPuZ+BRhJY=;
        b=riiinDOUqa5L/975C8TElJZ2TTt0BdwHzCpTE4gkLIBPpE8DCyOLLRWiO76azW5YHA
         uFhtTWmND8q44mMDygKsPVUQ26Yv/YkUgbcXVF1Dv8raTXTqs6JRnl6q3mJOxNgVncTb
         m6Nf54QwPPZQvmjc74Pvt898ZZaVJOhXDe8h9dmc+Iam0+yvbNYJVYQws3C6U/UOvzIu
         ZdXRprRQiC+IMx7aJzWtzM7dF2v3FmSAngnC6dKU86agQ5ou+2g1ZeqZSHHun9e/rp65
         1VWETKcRch2cK9U1uWXTJ6qNZmvP5oXXe6Gu4w9FdRP8r0CO3VRk0hKGC1+gZjHbSymK
         X7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUt4j3KXV9c++Dv6hpwaipfPRsevsLaUAwTXHS9urgdDMvgtP4BtfAekZxjGrVaotBBi9TaoBG5Z4E1qrCtv7ST@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0RZhaDZjQLNl9acON4CYonFte3dRWDzcVGfft+OSWsJjch5Dp
	SyJl7RLQRXFYUEwHBsaIoUmecLMFHBgXkcNR3tW4gO5HAUCgm2nOhGB5snbGZRFvhBJQqFqtpfe
	z8hy2fwqeA07o7/xu/88o8W8ZU2Ok7ASLG3n+dcdpMaZ2Ol1e9gNW3DlaFqAvD5bhPWa1Djp8VZ
	VD
X-Gm-Gg: ATEYQzyd3CUIM/QZhG/Gll9CEJXx1t1C/69E/+9Tlp5fu7xNa15o2DKSVdIXV8J1fbW
	ZU4BA67eR/CmE45wEjrH+M8sdO/B/2PGhMxbB2mvXzk9xj+HtYC/J1v0sEiRllbZEKnB6ag6nFy
	4l5F7VqC0XrYlyNGmuiDLUI3sqLuT2Ltngh18+X+FN5oAwQOzjzDkJyWgv4WfS8pVrBtem8gOmJ
	7n/zw3UjGKJrUlhtgVw7TjMdu8X21Ech4II4IVhfENghFAYA873tG8dXT8f6o+j+l1Z5yL0A564
	IfUc5jRbGAXBlvIdmOLfyj0veSXsbkx7bi5/BiAqagBN+FnWgGZwdx/23e/MxZT2IBJfiOwYtsj
	s1LEMagb0BY6T6m6Dd4pNlB1kUX7s8bwuNfOV7IyfBOl9SovEmJUA/Kalh+T49JWG
X-Received: by 2002:a05:6a20:9c99:b0:394:a026:4c48 with SMTP id adf61e73a8af0-3985908a166mr13984031637.41.1773123448567;
        Mon, 09 Mar 2026 23:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c99:b0:394:a026:4c48 with SMTP id adf61e73a8af0-3985908a166mr13983974637.41.1773123447985;
        Mon, 09 Mar 2026 23:17:27 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a70f9sm10886942a12.6.2026.03.09.23.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 23:17:27 -0700 (PDT)
Message-ID: <5a1429a6-c551-4d49-ae65-1ac7fd5e4715@redhat.com>
Date: Tue, 10 Mar 2026 16:17:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/41] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-14-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-14-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CRh5nXhYH2w59xsrjUEfZi9CWcEOx8_zg6c8fiK1FE4_1773123449
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_231732_714988_7DBA7642 
X-CRM114-Status: GOOD (  42.57  )
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

Hi Ben,

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl has its own data structures to describe its resources. We can't use
> these directly as we play tricks with the 'MBA' resource, picking the MPAM
> controls or monitors that best apply. We may export the same component as
> both L3 and MBA.
> 
> Add mpam_resctrl_res[] as the array of class->resctrl mappings we are
> exporting, and add the cpuhp hooks that allocated and free the resctrl
> domain structures. Only the mpam control feature are considered here and
> monitor support will be added later.
> 
> While we're here, plumb in a few other obvious things.
> 
> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built even though
> it can't yet be linked against resctrl.
> 

CONFIG_ARM_CPU_RESCTRL isn't valid. I guess you're probably mentioning
CONFIG_ARCH_HAS_CPU_RESCTRL?

> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Domain list is an rcu list
> Add synchronize_rcu() to free the deleted element
> Code flow simplification (Jonathan)
> 
> Changes since v2:
> Iterate over mpam_resctrl_dom directly (Jonathan)
> Code flow clarification
> Comment tidying
> Remove power of 2 check as no longer creates holes in rmid indices
> Remove unused type argument
> add macro helper for_each_mpam_resctrl_control
> 
> Changes since v3:
> Add and use mpam_resctrl_online_domain_hdr()
> mpam_resctrl_alloc_domain() error paths (Reinette)
> rebase on x86/cache changes rdt_mon_domain becomes rdt_l3_mon_domain
> etc
> 
> Changes since v4:
> Set rid in domain_hdr
> Use rescctrl_res.alloc_capable to determine if alloc_capable as the
> decision may depend on the resctrl mount options (cdp)
> Squash in arm_mpam: resctrl: Sort the order of the domain lists
> Move out monitor/counter changes to a separate patch
> Commit message update
> ---
>   drivers/resctrl/Makefile        |   1 +
>   drivers/resctrl/mpam_devices.c  |  12 ++
>   drivers/resctrl/mpam_internal.h |  21 ++
>   drivers/resctrl/mpam_resctrl.c  | 327 ++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h        |   3 +
>   5 files changed, 364 insertions(+)
>   create mode 100644 drivers/resctrl/mpam_resctrl.c
> 
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index 898199dcf80d..40beaf999582 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
>   mpam-y						+= mpam_devices.o
> +mpam-$(CONFIG_ARM_CPU_RESCTRL)			+= mpam_resctrl.o
>   
>   ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b400a7381d9a..b45743c5fb46 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1628,6 +1628,9 @@ static int mpam_cpu_online(unsigned int cpu)
>   			mpam_reprogram_msc(msc);
>   	}
>   
> +	if (mpam_is_enabled())
> +		return mpam_resctrl_online_cpu(cpu);
> +
>   	return 0;
>   }
>   
> @@ -1671,6 +1674,9 @@ static int mpam_cpu_offline(unsigned int cpu)
>   {
>   	struct mpam_msc *msc;
>   
> +	if (mpam_is_enabled())
> +		mpam_resctrl_offline_cpu(cpu);
> +
>   	guard(srcu)(&mpam_srcu);
>   	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
>   				 srcu_read_lock_held(&mpam_srcu)) {
> @@ -2516,6 +2522,12 @@ static void mpam_enable_once(void)
>   	mutex_unlock(&mpam_list_lock);
>   	cpus_read_unlock();
>   
> +	if (!err) {
> +		err = mpam_resctrl_setup();
> +		if (err)
> +			pr_err("Failed to initialise resctrl: %d\n", err);
> +	}
> +
>   	if (err) {
>   		mpam_disable_reason = "Failed to enable.";
>   		schedule_work(&mpam_broken_work);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 4632985bcca6..28ac501e1ac3 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -12,6 +12,7 @@
>   #include <linux/jump_label.h>
>   #include <linux/llist.h>
>   #include <linux/mutex.h>
> +#include <linux/resctrl.h>
>   #include <linux/spinlock.h>
>   #include <linux/srcu.h>
>   #include <linux/types.h>
> @@ -337,6 +338,16 @@ struct mpam_msc_ris {
>   	struct mpam_garbage	garbage;
>   };
>   
> +struct mpam_resctrl_dom {
> +	struct mpam_component		*ctrl_comp;
> +	struct rdt_ctrl_domain		resctrl_ctrl_dom;
> +};
> +
> +struct mpam_resctrl_res {
> +	struct mpam_class	*class;
> +	struct rdt_resource	resctrl_res;
> +};
> +
>   static inline int mpam_alloc_csu_mon(struct mpam_class *class)
>   {
>   	struct mpam_props *cprops = &class->props;
> @@ -391,6 +402,16 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
>   int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>   				   cpumask_t *affinity);
>   
> +#ifdef CONFIG_RESCTRL_FS
> +int mpam_resctrl_setup(void);
> +int mpam_resctrl_online_cpu(unsigned int cpu);
> +void mpam_resctrl_offline_cpu(unsigned int cpu);
> +#else
> +static inline int mpam_resctrl_setup(void) { return 0; }
> +static inline int mpam_resctrl_online_cpu(unsigned int cpu) { return 0; }
> +static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
> +#endif /* CONFIG_RESCTRL_FS */
> +
>   /*
>    * MPAM MSCs have the following register layout. See:
>    * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> new file mode 100644
> index 000000000000..2ffba7a15d6a
> --- /dev/null
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/errno.h>
> +#include <linux/list.h>
> +#include <linux/printk.h>
> +#include <linux/rculist.h>
> +#include <linux/resctrl.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include <asm/mpam.h>
> +
> +#include "mpam_internal.h"
> +

The list of included headers could be simplified since several header files
have been included to mpam_internal.h, for example <linux/arm_mpam.h>,
<linux/cpumask.h>, <asm/mpam.h> and others.

> +/*
> + * The classes we've picked to map to resctrl resources, wrapped
> + * in with their resctrl structure.
> + * Class pointer may be NULL.
> + */
> +static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
> +
> +#define for_each_mpam_resctrl_control(res, rid)					\
> +	for (rid = 0, res = &mpam_resctrl_controls[rid];			\
> +	     rid < RDT_NUM_RESOURCES;						\
> +	     rid++, res = &mpam_resctrl_controls[rid])
> +
> +/* The lock for modifying resctrl's domain lists from cpuhp callbacks. */
> +static DEFINE_MUTEX(domain_list_lock);
> +
> +bool resctrl_arch_alloc_capable(void)
> +{
> +	struct mpam_resctrl_res *res;
> +	enum resctrl_res_level rid;
> +
> +	for_each_mpam_resctrl_control(res, rid) {
> +		if (res->resctrl_res.alloc_capable)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * MSC may raise an error interrupt if it sees an out or range partid/pmg,
> + * and go on to truncate the value. Regardless of what the hardware supports,
> + * only the system wide safe value is safe to use.
> + */
> +u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
> +{
> +	return mpam_partid_max + 1;
> +}
> +
> +struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
> +{
> +	if (l >= RDT_NUM_RESOURCES)
> +		return NULL;
> +
> +	return &mpam_resctrl_controls[l].resctrl_res;
> +}
> +
> +static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
> +{
> +	/* TODO: initialise the resctrl resources */
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
> +{
> +	struct mpam_class *class = comp->class;
> +
> +	if (class->type == MPAM_CLASS_CACHE)
> +		return comp->comp_id;
> +
> +	/* TODO: repaint domain ids to match the L3 domain ids */
> +	/* Otherwise, expose the ID used by the firmware table code. */
> +	return comp->comp_id;
> +}
> +
> +static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
> +					 enum resctrl_res_level rid,
> +					 struct rdt_domain_hdr *hdr)
> +{
> +	lockdep_assert_cpus_held();
> +
> +	INIT_LIST_HEAD(&hdr->list);
> +	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
> +	hdr->rid = rid;
> +	cpumask_set_cpu(cpu, &hdr->cpu_mask);
> +}
> +
> +static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
> +					   struct rdt_domain_hdr *hdr)
> +{
> +	lockdep_assert_cpus_held();
> +
> +	cpumask_set_cpu(cpu, &hdr->cpu_mask);
> +}
> +
> +/**
> + * mpam_resctrl_offline_domain_hdr() - Update the domain header to remove a CPU.
> + * @cpu:	The CPU to remove from the domain.
> + * @hdr:	The domain's header.
> + *
> + * Removes @cpu from the header mask. If this was the last CPU in the domain,
                                                  ^^^
                                                  is

> + * the domain header is removed from its parent list and true is returned,
> + * indicating the parent structure can be freed.
> + * If there are other CPUs in the domain, returns false.
> + */
> +static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> +					    struct rdt_domain_hdr *hdr)
> +{
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
> +	if (cpumask_empty(&hdr->cpu_mask)) {
> +		list_del_rcu(&hdr->list);
> +		synchronize_rcu();
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void mpam_resctrl_domain_insert(struct list_head *list,
> +				       struct rdt_domain_hdr *new)
> +{
> +	struct rdt_domain_hdr *err;
> +	struct list_head *pos = NULL;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	err = resctrl_find_domain(list, new->id, &pos);
> +	if (WARN_ON_ONCE(err))
> +		return;
> +
> +	list_add_tail_rcu(&new->list, pos);
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct mpam_class *class = res->class;
> +	struct mpam_component *comp_iter, *ctrl_comp;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	ctrl_comp = NULL;
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
> +			ctrl_comp = comp_iter;
> +			break;
> +		}
> +	}
> +
> +	/* class has no component for this CPU */
> +	if (WARN_ON_ONCE(!ctrl_comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (resctrl_arch_alloc_capable()) {
> +		dom->ctrl_comp = ctrl_comp;
> +
> +		ctrl_d = &dom->resctrl_ctrl_dom;
> +		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
> +		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +		err = resctrl_online_ctrl_domain(r, ctrl_d);
> +		if (err)
> +			goto free_domain;
> +
> +		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
> +	} else {
> +		pr_debug("Skipped control domain online - no controls\n");
> +	}
> +	return dom;
> +
> +offline_ctrl_domain:
> +	if (resctrl_arch_alloc_capable()) {
> +		mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
> +		resctrl_offline_ctrl_domain(r, ctrl_d);
> +	}
> +free_domain:
> +	kfree(dom);
> +	dom = ERR_PTR(err);
> +
> +	return dom;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
> +{
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	lockdep_assert_cpus_held();
> +
> +	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +int mpam_resctrl_online_cpu(unsigned int cpu)
> +{
> +	struct mpam_resctrl_res *res;
> +	enum resctrl_res_level rid;
> +
> +	guard(mutex)(&domain_list_lock);
> +	for_each_mpam_resctrl_control(res, rid) {
> +		struct mpam_resctrl_dom *dom;
> +
> +		if (!res->class)
> +			continue;	// dummy_resource;
> +
> +		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
> +		if (!dom) {
> +			dom = mpam_resctrl_alloc_domain(cpu, res);
> +		} else {
> +			if (resctrl_arch_alloc_capable()) {
> +				struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
> +
> +				mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
> +			}
> +		}
> +		if (IS_ERR(dom))
> +			return PTR_ERR(dom);
> +	}
> +
> +	resctrl_online_cpu(cpu);
> +
> +	return 0;
> +}
> +
> +void mpam_resctrl_offline_cpu(unsigned int cpu)
> +{
> +	struct mpam_resctrl_res *res;
> +	enum resctrl_res_level rid;
> +
> +	resctrl_offline_cpu(cpu);
> +
> +	guard(mutex)(&domain_list_lock);
> +	for_each_mpam_resctrl_control(res, rid) {
> +		struct mpam_resctrl_dom *dom;
> +		struct rdt_ctrl_domain *ctrl_d;
> +		bool ctrl_dom_empty;
> +
> +		if (!res->class)
> +			continue;	// dummy resource
> +
> +		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
> +		if (WARN_ON_ONCE(!dom))
> +			continue;
> +
> +		if (resctrl_arch_alloc_capable()) {
> +			ctrl_d = &dom->resctrl_ctrl_dom;
> +			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
> +			if (ctrl_dom_empty)
> +				resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl_d);
> +		} else {
> +			ctrl_dom_empty = true;
> +		}
> +
> +		if (ctrl_dom_empty)
> +			kfree(dom);
> +	}
> +}
> +
> +int mpam_resctrl_setup(void)
> +{
> +	int err = 0;
> +	struct mpam_resctrl_res *res;
> +	enum resctrl_res_level rid;
> +
> +	cpus_read_lock();
> +	for_each_mpam_resctrl_control(res, rid) {
> +		INIT_LIST_HEAD_RCU(&res->resctrl_res.ctrl_domains);
> +		res->resctrl_res.rid = rid;
> +	}
> +
> +	/* TODO: pick MPAM classes to map to resctrl resources */
> +
> +	/* Initialise the resctrl structures from the classes */
> +	for_each_mpam_resctrl_control(res, rid) {
> +		if (!res->class)
> +			continue;	// dummy resource
> +
> +		err = mpam_resctrl_control_init(res);
> +		if (err) {
> +			pr_debug("Failed to initialise rid %u\n", rid);
> +			break;
> +		}
> +	}
> +	cpus_read_unlock();
> +
> +	if (err) {
> +		pr_debug("Internal error %d - resctrl not supported\n", err);
> +		return err;
> +	}
> +

This pr_debug() could be dropped since @err is set to true only when
a error is returned from mpam_resctrl_control_init(), we already had
a pr_debug() for the reported error.

> +	if (!resctrl_arch_alloc_capable()) {
> +		pr_debug("No alloc(%u) found - resctrl not supported\n",
> +			 resctrl_arch_alloc_capable());
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* TODO: call resctrl_init() */
> +
> +	return 0;
> +}
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index 7f00c5285a32..2c7d1413a401 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -49,6 +49,9 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>   }
>   #endif
>   
> +bool resctrl_arch_alloc_capable(void);
> +bool resctrl_arch_mon_capable(void);
> +
>   /**
>    * mpam_register_requestor() - Register a requestor with the MPAM driver
>    * @partid_max:		The maximum PARTID value the requestor can generate.

Thanks,
Gavin


