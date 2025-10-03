Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A76CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 03:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqXBGsEvLB/eC0uyHIzRTOrZF87Gi56IDylcMc4Mqyk=; b=E+gENBYfz0GaXoyv18FS6/MtcY
	KWOAHLELKKZEP6zHosSRT7iQm/Q0XdQoa1eGPhbChQ+ReVJAPMvkpz1PNaODosjki0/XmziTrjZxg
	eI1aRGFuQR7LV7iwhJyO0kRcew8Xg9quRrbquGA29Wu9k3h3V+U0/gpY8/+QxMzgnw2NgZ31ljzsc
	6OBzwB1yqyQs4r3msdCnkJmEijOXWZlrUPqSu1K6fRDtqbQlwnY2f1pMqrNFWUZUHvdO5ehi22Ssn
	3XEqE3uWlmAMzVYTZW3g6xulhW8e9Jfx5+Fz5dekQmvcUZF129L3OKzyaOnK0RTs6yEP8/DwBeH7j
	a0AOVoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ws8-0000000BcPt-057q;
	Fri, 03 Oct 2025 03:54:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ws3-0000000BcP9-2lDC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 03:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759463653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqXBGsEvLB/eC0uyHIzRTOrZF87Gi56IDylcMc4Mqyk=;
	b=PAEcurTEUYztvPw10z0e8Hc91SQFPPTPaKuvz124+gEBBC90NhWBLRzLuZWRp9RPbtCYP1
	K8ns08udLGNC9ZfXpzCPlHoF1wbFmkvw5eTKKYp2xqrEpBEM6TYhAOLy7vV0OTu/p7/7HB
	07mvyNoptPaSVTZVabhfmSTB0q+JFCM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-5C0IZFwOOcu6pab-In4Yrw-1; Thu, 02 Oct 2025 23:54:10 -0400
X-MC-Unique: 5C0IZFwOOcu6pab-In4Yrw-1
X-Mimecast-MFC-AGG-ID: 5C0IZFwOOcu6pab-In4Yrw_1759463649
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5529da7771so1187597a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 20:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759463648; x=1760068448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqXBGsEvLB/eC0uyHIzRTOrZF87Gi56IDylcMc4Mqyk=;
        b=CGT7iZl3SW6LZMXXaxRNwxQ+dCGA6JucOnItQgVVNdb2pdi3fWp6DMGVTJL+7ZM60q
         z3dKWMmfG9n1l85xtkW+dPKwPafTAXWboJLAIzRy4UMYsLtzMhGK66TNW+nOdUC/WLb1
         d8S7MDKGXn1I/UGe5a5SnsLD+d9iCDTWzCb4pS+kTdjwaoKcpeGvJ194h1BWExHyv5Zm
         eSZ09cuGYl7G921TPrQNokkb5PB8Mo/n/sFrqEa+mHbvAdzT3AuPC4qFKtdoFmQgSZzO
         3XK7ArSmkqQq6eHuZx/Q+bMT4Cc0YC5pTkYanHQYwXX7Vd3ElycVKdkhuj2ftI+Rx84H
         W0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiMJYnmt/X7ad9ROjVHGYQhbrbG4CGYKxRTvFWu98PtuEkUsDU2E6W81kBAG82g2TvmHviMYGuyt4vcNE5eAb0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr0s2zs30HTsITOIRaRcjjc9eOpBIy7joPDhS8doYFbw6vDxr4
	ovjysomh8GG9QogQPSefTv3GMdKj1HL6/V4pBZp21FaRvJbjYunEDGat6vZPhVTWWOTL01R8cBh
	KXqY1xvX2u+F1jTO+sMXzaTDvSHBn/uMtWiD65tGzlMggWZ5quLEgUiUOGBCy/3y9kGgj4OkCnn
	+xxgOnleDD
X-Gm-Gg: ASbGncvJ1bblCxY1VD4uQqR14ADUjlI7rE6uXW8lVkOY7okuTnqjuEgQy1+5pzrWQ/y
	KVUUZWGbxr6+4lia2VUT0H66V4HhoQmV6VM9rY7PpvhCwr4Q9VgA0EM2Z3JMDB2VrDJ4qAYnYPd
	B1e2Q/lUt5YgmsnV6CcOr2yZ8VUBmXubmJNUsQ0zXfUWrS1ynMmc06HpWjnyOKje9NV+zl1srxZ
	3e35W1YlPoHufc4IGyFdQPOYSFvoNF/rSJpeRRN9+D5z6Oj2BpffWSo2NTX4N/2gJKzJbtho60x
	4Xcv4Nrg6zwloy/w2+Y0RgutVRuEIFH5Xf+Okbmb7rpQI+DyN0U1hCAmckJ8i/JnZH2LQXZ8/qR
	nIw6GhJxYzg==
X-Received: by 2002:a05:6a21:32a8:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32b6212a95amr2324638637.58.1759463647693;
        Thu, 02 Oct 2025 20:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO1eVNkhxjeEpcrSCvF3IK8zgy7mUiMHjQ5jYBycjzCT0xV0FuBp/gmh5QAf2pAUHLGCkC3w==
X-Received: by 2002:a05:6a21:32a8:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32b6212a95amr2324606637.58.1759463647199;
        Thu, 02 Oct 2025 20:54:07 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099add290sm3271259a12.6.2025.10.02.20.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 20:54:06 -0700 (PDT)
Message-ID: <29886bb9-bca3-4f26-ae31-a339b8d001f1@redhat.com>
Date: Fri, 3 Oct 2025 13:53:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-8-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-8-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7-HBwnNZld7IhuuRHiDYgjw2DjGwE6CMlgeOSBkDis_1759463649
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_205415_863125_0B36205F 
X-CRM114-Status: GOOD (  43.26  )
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

On 9/11/25 6:42 AM, James Morse wrote:
> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> only be accessible from those CPUs, and they may not be online.
> Touching the hardware early is pointless as MPAM can't be used until
> the system-wide common values for num_partid and num_pmg have been
> discovered.
> 
> Start with driver probe/remove and mapping the MSC.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Avoid selecting driver on other architectrues.
>   * Removed PCC support stub.
>   * Use for_each_available_child_of_node_scoped() and of_property_read_reg()
>   * Clarified a comment.
>   * Stopped using mpam_num_msc as an id,a and made it atomic.
>   * Size of -1 returned from cache_of_calculate_id()
>   * Renamed some struct members.
>   * Made a bunch of pr_err() dev_err_ocne().
>   * Used more cleanup magic.
>   * Inlined a print message.
>   * Fixed error propagation from mpam_dt_parse_resources().
>   * Moved cache accessibility checks earlier.
> 
> Changes since RFC:
>   * Check for status=broken DT devices.
>   * Moved all the files around.
>   * Made Kconfig symbols depend on EXPERT
> ---
>   arch/arm64/Kconfig              |   1 +
>   drivers/Kconfig                 |   2 +
>   drivers/Makefile                |   1 +
>   drivers/resctrl/Kconfig         |  14 +++
>   drivers/resctrl/Makefile        |   4 +
>   drivers/resctrl/mpam_devices.c  | 180 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  65 ++++++++++++
>   7 files changed, 267 insertions(+)
>   create mode 100644 drivers/resctrl/Kconfig
>   create mode 100644 drivers/resctrl/Makefile
>   create mode 100644 drivers/resctrl/mpam_devices.c
>   create mode 100644 drivers/resctrl/mpam_internal.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 6487c511bdc6..93e563e1cce4 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2062,6 +2062,7 @@ config ARM64_TLB_RANGE
>   
>   config ARM64_MPAM
>   	bool "Enable support for MPAM"
> +	select ARM64_MPAM_DRIVER if EXPERT
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
> index b5749cf67044..f41cf4eddeba 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -194,5 +194,6 @@ obj-$(CONFIG_HTE)		+= hte/
>   obj-$(CONFIG_DRM_ACCEL)		+= accel/
>   obj-$(CONFIG_CDX_BUS)		+= cdx/
>   obj-$(CONFIG_DPLL)		+= dpll/
> +obj-y				+= resctrl/
>   
>   obj-$(CONFIG_S390)		+= s390/
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> new file mode 100644
> index 000000000000..c30532a3a3a4
> --- /dev/null
> +++ b/drivers/resctrl/Kconfig
> @@ -0,0 +1,14 @@
> +menuconfig ARM64_MPAM_DRIVER
> +	bool "MPAM driver"
> +	depends on ARM64 && ARM64_MPAM && EXPERT
> +	help
> +	  MPAM driver for System IP, e,g. caches and memory controllers.
> +
> +if ARM64_MPAM_DRIVER
> +config ARM64_MPAM_DRIVER_DEBUG
> +	bool "Enable debug messages from the MPAM driver"
> +	depends on ARM64_MPAM_DRIVER
> +	help
> +	  Say yes here to enable debug messages from the MPAM driver.
> +
> +endif
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> new file mode 100644
> index 000000000000..92b48fa20108
> --- /dev/null
> +++ b/drivers/resctrl/Makefile
> @@ -0,0 +1,4 @@
> +obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
> +mpam-y						+= mpam_devices.o
> +
> +cflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> new file mode 100644
> index 000000000000..efc4738e3b4d
> --- /dev/null
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +#include <linux/acpi.h>
> +#include <linux/arm_mpam.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
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
> +static DEFINE_MUTEX(mpam_list_lock);
> +static LIST_HEAD(mpam_all_msc);
> +
> +static struct srcu_struct mpam_srcu;
> +
> +/*
> + * Number of MSCs that have been probed. Once all MSC have been probed MPAM
> + * can be enabled.
> + */
> +static atomic_t mpam_num_msc;
> +
> +/*
> + * An MSC can control traffic from a set of CPUs, but may only be accessible
> + * from a (hopefully wider) set of CPUs. The common reason for this is power
> + * management. If all the CPUs in a cluster are in PSCI:CPU_SUSPEND, the
> + * corresponding cache may also be powered off. By making accesses from
> + * one of those CPUs, we ensure this isn't the case.
> + */
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
> +
> +	return 0;
> +
> +	return err;
> +}
> +

Double return here and different values have been returned. I think here we
need "return err". In this case, we needn't copy @cpu_possible_mask on error
because the caller mpam_msc_drv_probe() will release the MSC instance.

> +static int fw_num_msc;
> +
> +static void mpam_msc_drv_remove(struct platform_device *pdev)
> +{
> +	struct mpam_msc *msc = platform_get_drvdata(pdev);
> +
> +	if (!msc)
> +		return;
> +
> +	mutex_lock(&mpam_list_lock);
> +	platform_set_drvdata(pdev, NULL);
> +	list_del_rcu(&msc->all_msc_list);
> +	synchronize_srcu(&mpam_srcu);
> +	mutex_unlock(&mpam_list_lock);
> +}
> +
> +static int mpam_msc_drv_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	struct mpam_msc *msc;
> +	struct resource *msc_res;
> +	struct device *dev = &pdev->dev;
> +	void *plat_data = pdev->dev.platform_data;
> +
> +	mutex_lock(&mpam_list_lock);
> +	do {
> +		msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
> +		if (!msc) {
> +			err = -ENOMEM;
> +			break;
> +		}
> +
> +		mutex_init(&msc->probe_lock);
> +		mutex_init(&msc->part_sel_lock);
> +		mutex_init(&msc->outer_mon_sel_lock);
> +		raw_spin_lock_init(&msc->inner_mon_sel_lock);
> +		msc->id = pdev->id;
> +		msc->pdev = pdev;
> +		INIT_LIST_HEAD_RCU(&msc->all_msc_list);
> +		INIT_LIST_HEAD_RCU(&msc->ris);
> +
> +		err = update_msc_accessibility(msc);
> +		if (err)
> +			break;
> +		if (cpumask_empty(&msc->accessibility)) {
> +			dev_err_once(dev, "MSC is not accessible from any CPU!");
> +			err = -EINVAL;
> +			break;
> +		}
> +

This check (cpumask_empty()) would be part of update_msc_accessibility() since
msc->accessibility is sorted out in that function where it should be validated.

> +		if (device_property_read_u32(&pdev->dev, "pcc-channel",
> +					     &msc->pcc_subspace_id))
> +			msc->iface = MPAM_IFACE_MMIO;
> +		else
> +			msc->iface = MPAM_IFACE_PCC;
> +
> +		if (msc->iface == MPAM_IFACE_MMIO) {
> +			void __iomem *io;
> +
> +			io = devm_platform_get_and_ioremap_resource(pdev, 0,
> +								    &msc_res);
> +			if (IS_ERR(io)) {
> +				dev_err_once(dev, "Failed to map MSC base address\n");
> +				err = PTR_ERR(io);
> +				break;
> +			}
> +			msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +			msc->mapped_hwpage = io;
> +		}
> +
> +		list_add_rcu(&msc->all_msc_list, &mpam_all_msc);
> +		platform_set_drvdata(pdev, msc);
> +	} while (0);
> +	mutex_unlock(&mpam_list_lock);
> +
> +	if (!err) {
> +		/* Create RIS entries described by firmware */
> +		err = acpi_mpam_parse_resources(msc, plat_data);
> +	}
> +
> +	if (err && msc)
> +		mpam_msc_drv_remove(pdev);
> +
> +	if (!err && atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
> +		pr_info("Discovered all MSC\n");
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
> index 000000000000..7c63d590fc98
> --- /dev/null
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +// Copyright (C) 2025 Arm Ltd.
> +
> +#ifndef MPAM_INTERNAL_H
> +#define MPAM_INTERNAL_H
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cpumask.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/resctrl.h>
> +#include <linux/sizes.h>
> +
> +struct mpam_msc {
> +	/* member of mpam_all_msc */
> +	struct list_head        all_msc_list;
> +
> +	int			id;
> +	struct platform_device *pdev;
> +
> +	/* Not modified after mpam_is_enabled() becomes true */
> +	enum mpam_msc_iface	iface;
> +	u32			pcc_subspace_id;
> +	struct mbox_client	pcc_cl;
> +	struct pcc_mbox_chan	*pcc_chan;
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
> +	/*
> +	 * mon_sel_lock protects access to the MSC hardware registers that are
> +	 * affected by MPAMCFG_MON_SEL.
> +	 * If needed, take msc->probe_lock first.
> +	 */
> +	struct mutex		outer_mon_sel_lock;
> +	raw_spinlock_t		inner_mon_sel_lock;
> +	unsigned long		inner_mon_sel_flags;
> +
> +	void __iomem		*mapped_hwpage;
> +	size_t			mapped_hwpage_sz;
> +};
> +
> +int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
> +				   cpumask_t *affinity);
> +
> +#endif /* MPAM_INTERNAL_H */

Thanks,
Gavin


