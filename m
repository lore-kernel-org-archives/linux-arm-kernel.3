Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D414DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i5dxxm940H2oOUUNhD8Sa5E80jy/5NUyBR36hP8GDM=; b=H2sYCvouoM7rGTCao8ZmViNXw9
	9Mmi5L3lIHvBikfbEekpEK1aBZGstA1JW0kRRVykhZwjIMFuni1aV4duS3WAYozgm3ins7HgJA+qI
	5KYqzjz1UyPtCfzqd36PQQw5zcUSHGPBBev3hZcYaysiyJAHRJXJTZvkRhyD5hJRKbMyfuNaltvbL
	H7tcw2Q8fjufgF8nYMKpsvkuK2gt6Ce0NPOMrbl7gDuv0iFiB9rL1dW3lSoPE1Sm62i9r4q3HY4Fq
	dGMMudfCXA7JPH4tbWb7SqMyRnyZnZXuPjNYXIbMvZm3fUB7H4CNSdCCv+yOBw2fEL2EFcdw1aguT
	TzkdCChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfFp-00000002y8h-0jI7;
	Sat, 08 Nov 2025 09:29:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfFm-00000002y8G-2nZf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 09:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762594141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0i5dxxm940H2oOUUNhD8Sa5E80jy/5NUyBR36hP8GDM=;
	b=RXC3Yi455KfbdShHBmv5ekkkIbCB5ksZJRm+xe5OR/yC4kcidmlfmoaalVZcjQjg4PPZOr
	JO2N718fc1t4m5uoCRgre9/7Av0P0RnN5qUc3C6v6Wi55S7nQsgNjuFArKqIp+WsI70YQZ
	lWdDD08kZ497hbwOxPyTR/AcqUYxytk=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-SC8crlq4NiekVb5bB8w6wg-1; Sat, 08 Nov 2025 04:28:58 -0500
X-MC-Unique: SC8crlq4NiekVb5bB8w6wg-1
X-Mimecast-MFC-AGG-ID: SC8crlq4NiekVb5bB8w6wg_1762594138
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a2885329beso1514747b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 01:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762594138; x=1763198938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0i5dxxm940H2oOUUNhD8Sa5E80jy/5NUyBR36hP8GDM=;
        b=w75hmGg71cF+Pp+ZN8jaO9ACJADg/oZX4p0rLFn8zlMhuV+d2VjAIdWMHnKMPQ/4KW
         WGbopA1cFIm1AOh7D0Ax4MO+BzPD5qX7xOKI5v1QX7ovo8qtodQGd/z8orwFTgluSLw9
         aUSjPwK+jLOaTgdK1zW+yxt57iIXkKEhJP0qiB/LeSu7EP7iDv7HMUueQ0Wgl45P+jRg
         kH3v052uR/oFKMHiXS67R9/kA8Ew/kSt1H+HXtEKP0fTlodOe5Soemljq5ZUsirqy7JR
         fmr5m1ZZqWXiS1GJjf/E0G7TMAag1ChtNF6/gZv6kUsstfSMTAAREqPVV4DL+UyxRCXu
         eUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+lOevzjFoTnuBZgiLSur9IXqTiYYnJcPI93GIB8R7HIN00JoCtYvUF/TR9NGWP3kmxEPqxsn5YFMX9TJU0hOw@lists.infradead.org
X-Gm-Message-State: AOJu0YyM6FgXrZ/ZCl37wnK1pbpzshj//nPsD5G0GGt+JOdPfXf9+IvS
	f24b/s+g3wdPkIR03JHIIpT3m6X+Wnb5tVpObWXyU0PwNPwqchO/i46ci2kBSWW2pz3tSq/8mXA
	Fbhg00jOS1xkXByOrKbTBKrF93v28n0wXT+iNq++c67wGKbO5Wl3y3RZwEKngNHrGE2pT7lx4OI
	kz
X-Gm-Gg: ASbGncv3/YT9IJ7xozrm9uKhwsSPc3s6/BTXHXJsg9/5fe4DFNslDXR/Ga9ITWzpxCs
	2BbLFC7T+W7+xNWEl+jasYk2uBUOdwpAfUzRJgpEwpR9mxPvhTomE4rKY+1izYLR0yoNZWAmDYo
	nyZ0nVYgVg04QKcQdFSKzgGaGwZM+R/x8w+M5PwXXqapPBdv1udhDdIaP2LM1yt/SRpzkOdb7uH
	r5w04wPQ/+DLlu194tcwpb80u0nMU1wsFRNe34rZ7qDfoD0nMIW75u8PLR7cja/M9NmKCI9kGO8
	quNc6DjzRBuskVRAwyyqQDEB7mCjUAd162sRVDRFFJrQGt2HgAnFpVbleKc1RfXT/SuDv2km9s6
	37mm7TY69iRlEZLEzzO+NF86K6djoMUpnaFjQ9dA=
X-Received: by 2002:a05:6a00:992:b0:7a2:83f4:1b5d with SMTP id d2e1a72fcca58-7b21800c3a7mr2839641b3a.6.1762594137700;
        Sat, 08 Nov 2025 01:28:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+zwxwjibEt64LEQj3V7SsxX7f792G4FQ4eCFL3ouTG/ujM7reC+2DTff72riVqEB11ER4KQ==
X-Received: by 2002:a05:6a00:992:b0:7a2:83f4:1b5d with SMTP id d2e1a72fcca58-7b21800c3a7mr2839624b3a.6.1762594137250;
        Sat, 08 Nov 2025 01:28:57 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c963586fsm5368479b3a.10.2025.11.08.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 01:28:56 -0800 (PST)
Message-ID: <5b9136d6-b6c0-4f24-a8d2-05d7700140a8@redhat.com>
Date: Sat, 8 Nov 2025 19:28:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-11-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-11-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WbU2EPJ6YfSfyH4mev-zii-QQYzXfKmm1eQcvGsMLqU_1762594138
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_012902_893877_91437E93 
X-CRM114-Status: GOOD (  42.09  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> only be accessible from those CPUs, and they may not be online.
> Touching the hardware early is pointless as MPAM can't be used until
> the system-wide common values for num_partid and num_pmg have been
> discovered.
> 

I'm not sure if below commit log is more clearer as I'm not a English
native speaker:

MPAM probing is convoluted. MSCs that are integrated to a set of CPUs
may only be accessible from those CPUs, ...

> Start with driver probe/remove and mapping the MSC.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
>  From Jonathan:
> Include cleanup
> Use devm_mutex_init()
> Add an ERR_CAST()
> Fenghua:
> Return zero from update_msc_accessibility()
> Additional:
> Fail probe if MSC doesn't have an MMIO interface
> ---
>   arch/arm64/Kconfig              |   1 +
>   drivers/Kconfig                 |   2 +
>   drivers/Makefile                |   1 +
>   drivers/resctrl/Kconfig         |  15 +++
>   drivers/resctrl/Makefile        |   4 +
>   drivers/resctrl/mpam_devices.c  | 194 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  49 ++++++++
>   7 files changed, 266 insertions(+)
>   create mode 100644 drivers/resctrl/Kconfig
>   create mode 100644 drivers/resctrl/Makefile
>   create mode 100644 drivers/resctrl/mpam_devices.c
>   create mode 100644 drivers/resctrl/mpam_internal.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c5e66d5d72cd..004d58cfbff8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2025,6 +2025,7 @@ config ARM64_TLB_RANGE
>   
>   config ARM64_MPAM
>   	bool "Enable support for MPAM"
> +	select ARM64_MPAM_DRIVER if EXPERT	# does nothing yet
>   	select ACPI_MPAM if ACPI
>   	help
>   	  Memory System Resource Partitioning and Monitoring (MPAM) is an
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 4915a63866b0..3054b50a2f4c 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -251,4 +251,6 @@ source "drivers/hte/Kconfig"
>   
>   source "drivers/cdx/Kconfig"
>   
> +source "drivers/resctrl/Kconfig"
> +
>   endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 8e1ffa4358d5..20eb17596b89 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -194,6 +194,7 @@ obj-$(CONFIG_HTE)		+= hte/
>   obj-$(CONFIG_DRM_ACCEL)		+= accel/
>   obj-$(CONFIG_CDX_BUS)		+= cdx/
>   obj-$(CONFIG_DPLL)		+= dpll/
> +obj-y				+= resctrl/
>   
>   obj-$(CONFIG_DIBS)		+= dibs/
>   obj-$(CONFIG_S390)		+= s390/
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> new file mode 100644
> index 000000000000..ef2f3adf64a9
> --- /dev/null
> +++ b/drivers/resctrl/Kconfig
> @@ -0,0 +1,15 @@
> +menuconfig ARM64_MPAM_DRIVER
> +	bool "MPAM driver"
> +	depends on ARM64 && ARM64_MPAM && EXPERT
> +	help
> +	  Memory System Resource Partitioning and Monitoring (MPAM) driver for
> +	  System IP, e,g. caches and memory controllers.
> +
> +if ARM64_MPAM_DRIVER
> +
> +config ARM64_MPAM_DRIVER_DEBUG
> +	bool "Enable debug messages from the MPAM driver"
> +	help
> +	  Say yes here to enable debug messages from the MPAM driver.
> +
> +endif

I am asking myself why "depends on ARM64_MPAM_DRIVER" can't be used here? :-)

> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> new file mode 100644
> index 000000000000..898199dcf80d
> --- /dev/null
> +++ b/drivers/resctrl/Makefile
> @@ -0,0 +1,4 @@
> +obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
> +mpam-y						+= mpam_devices.o
> +
> +ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> new file mode 100644
> index 000000000000..6c6be133d73a
> --- /dev/null
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +#include <linux/acpi.h>
> +#include <linux/arm_mpam.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/srcu.h>
> +#include <linux/types.h>
> +
> +#include "mpam_internal.h"
> +
> +/*
> + * mpam_list_lock protects the SRCU lists when writing. Once the
> + * mpam_enabled key is enabled these lists are read-only,
> + * unless the error interrupt disables the driver.
> + */

s/when writing/for writing
s/are read-only/become read-only

> +static DEFINE_MUTEX(mpam_list_lock);
> +static LIST_HEAD(mpam_all_msc);
> +
> +struct srcu_struct mpam_srcu;
> +
> +/*
> + * Number of MSCs that have been probed. Once all MSC have been probed MPAM
> + * can be enabled.
> + */

s/all MSC/all MSCs  (?)

> +static atomic_t mpam_num_msc;
> +
> +/*
> + * An MSC can control traffic from a set of CPUs, but may only be accessible
> + * from a (hopefully wider) set of CPUs. The common reason for this is power
> + * management. If all the CPUs in a cluster are in PSCI:CPU_SUSPEND, the
> + * corresponding cache may also be powered off. By making accesses from
> + * one of those CPUs, we ensure this isn't the case.
> + */

s/An MSC/A MSC (?)
s/from a/from the
s/isn't the case/is the case (?)

> +static int update_msc_accessibility(struct mpam_msc *msc)
> +{
> +	u32 affinity_id;
> +	int err;
> +
> +	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
> +				       &affinity_id);
> +	if (err)
> +		cpumask_copy(&msc->accessibility, cpu_possible_mask);
> +	else
> +		acpi_pptt_get_cpus_from_container(affinity_id,
> +						  &msc->accessibility);
> +	return 0;
> +}
> +

{} is needed for the block spanning multiple lines.

I would validate msc->accessibility here instead of its caller
(do_mpam_msc_drv_probe()).

		if (cpumask_empty(&msc->accessibility))
			return {-EINVAL, -ENOENT};

> +static int fw_num_msc;
> +
> +static void mpam_msc_destroy(struct mpam_msc *msc)
> +{
> +	struct platform_device *pdev = msc->pdev;
> +
> +	lockdep_assert_held(&mpam_list_lock);
> +
> +	list_del_rcu(&msc->all_msc_list);
> +	platform_set_drvdata(pdev, NULL);
> +}
> +
> +static void mpam_msc_drv_remove(struct platform_device *pdev)
> +{
> +	struct mpam_msc *msc = platform_get_drvdata(pdev);
> +
> +	if (!msc)
> +		return;

'msc' is unlikely to be NULL here, so the check could be droped.

> +
> +	mutex_lock(&mpam_list_lock);
> +	mpam_msc_destroy(msc);
> +	mutex_unlock(&mpam_list_lock);
> +
> +	synchronize_srcu(&mpam_srcu);
> +}
> +
> +static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	u32 tmp;
> +	struct mpam_msc *msc;
> +	struct resource *msc_res;
> +	struct device *dev = &pdev->dev;
> +
> +	lockdep_assert_held(&mpam_list_lock);
> +
> +	msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
> +	if (!msc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err = devm_mutex_init(dev, &msc->probe_lock);
> +	if (err)
> +		return ERR_PTR(err);
> +	err = devm_mutex_init(dev, &msc->part_sel_lock);
> +	if (err)
> +		return ERR_PTR(err);
> +	msc->id = pdev->id;
> +	msc->pdev = pdev;
> +	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
> +	INIT_LIST_HEAD_RCU(&msc->ris);
> +
> +	err = update_msc_accessibility(msc);
> +	if (err)
> +		return ERR_PTR(err);
> +	if (cpumask_empty(&msc->accessibility)) {
> +		dev_err_once(dev, "MSC is not accessible from any CPU!");
> +		return ERR_PTR(-EINVAL);
> +	}
> +

As suggested above, this check would be done inside update_msc_accessibility().

> +	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +		msc->iface = MPAM_IFACE_MMIO;
> +	else
> +		msc->iface = MPAM_IFACE_PCC;
> +
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		void __iomem *io;
> +
> +		io = devm_platform_get_and_ioremap_resource(pdev, 0,
> +							    &msc_res);
> +		if (IS_ERR(io)) {
> +			dev_err_once(dev, "Failed to map MSC base address\n");
> +			return ERR_CAST(io);
> +		}
> +		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage = io;
> +	} else {
> +		return ERR_PTR(-ENOENT);

Would be:
		return ERR_PTR(-EINVAL);

> +	}
> +
> +	list_add_rcu(&msc->all_msc_list, &mpam_all_msc);
> +	platform_set_drvdata(pdev, msc);
> +
> +	return msc;
> +}
> +
> +static int mpam_msc_drv_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	struct mpam_msc *msc = NULL;
> +	void *plat_data = pdev->dev.platform_data;
> +
> +	mutex_lock(&mpam_list_lock);
> +	msc = do_mpam_msc_drv_probe(pdev);
> +	mutex_unlock(&mpam_list_lock);
> +	if (!IS_ERR(msc)) {
> +		/* Create RIS entries described by firmware */
> +		err = acpi_mpam_parse_resources(msc, plat_data);
> +		if (err)
> +			mpam_msc_drv_remove(pdev);
> +	} else {
> +		err = PTR_ERR(msc);
> +	}
> +
> +	if (!err && atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
> +		pr_info("Discovered all MSC\n");

s/all MSC/all MSCs

> +
> +	return err;
> +}
> +
> +static struct platform_driver mpam_msc_driver = {
> +	.driver = {
> +		.name = "mpam_msc",
> +	},
> +	.probe = mpam_msc_drv_probe,
> +	.remove = mpam_msc_drv_remove,
> +};
> +
> +static int __init mpam_msc_driver_init(void)
> +{
> +	if (!system_supports_mpam())
> +		return -EOPNOTSUPP;
> +
> +	init_srcu_struct(&mpam_srcu);
> +
> +	fw_num_msc = acpi_mpam_count_msc();
> +
> +	if (fw_num_msc <= 0) {
> +		pr_err("No MSC devices found in firmware\n");
> +		return -EINVAL;
> +	}
> +
> +	return platform_driver_register(&mpam_msc_driver);
> +}
> +subsys_initcall(mpam_msc_driver_init);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> new file mode 100644
> index 000000000000..540066903eca
> --- /dev/null
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#ifndef MPAM_INTERNAL_H
> +#define MPAM_INTERNAL_H
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cpumask.h>
> +#include <linux/io.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +struct platform_device;
> +
> +struct mpam_msc {
> +	/* member of mpam_all_msc */
> +	struct list_head	all_msc_list;
> +
> +	int			id;
> +	struct platform_device	*pdev;
> +
> +	/* Not modified after mpam_is_enabled() becomes true */
> +	enum mpam_msc_iface	iface;
> +	u32			nrdy_usec;
> +	cpumask_t		accessibility;
> +
> +	/*
> +	 * probe_lock is only taken during discovery. After discovery these
> +	 * properties become read-only and the lists are protected by SRCU.
> +	 */
> +	struct mutex		probe_lock;
> +	unsigned long		ris_idxs;
> +	u32			ris_max;
> +
> +	/* mpam_msc_ris of this component */
> +	struct list_head	ris;
> +
> +	/*
> +	 * part_sel_lock protects access to the MSC hardware registers that are
> +	 * affected by MPAMCFG_PART_SEL. (including the ID registers that vary
> +	 * by RIS).
> +	 * If needed, take msc->probe_lock first.
> +	 */
> +	struct mutex		part_sel_lock;
> +
> +	void __iomem		*mapped_hwpage;
> +	size_t			mapped_hwpage_sz;
> +};
> +#endif /* MPAM_INTERNAL_H */

Thanks,
Gavin


