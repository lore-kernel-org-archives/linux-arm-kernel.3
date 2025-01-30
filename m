Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E09C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfBoQBtIm6LuUyIYzDiAdmpv2Un5tFAApIf8KFtG8F8=; b=Ss1ZjDFfO2XLDelnmp0yNxZ9ig
	DUhsRyfNlvZNGXOp8V+SG8Wz/un0R7iVnpuuhVXVlGTQnugB+nG6ktM3O1hPdexJGXOr3NfMWbuzx
	Zk4SYHgqV3hWslQBldAnlzLpAUAdPcL75EJppGRljhUIOxdw/u+kIGhSegk5elJn6eE1PR93lRAsx
	3z8zoFpAgGR4R+2+h5qqcKugkzmRmVzfSa3DXUXWxZCEmQU9qTMz4lFDfbM2Hcq1OaVoaVbas5rIm
	oMVrPfQ3YWDmByAEqKyUFlhwAGT51gLyH8fx445+ByKREMXi9KYL78+ABMXD10risBQTa2M68IaUm
	kHk2u5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdY3B-00000009EyX-2qOb;
	Thu, 30 Jan 2025 17:09:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdY1r-00000009EoJ-1y1N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:08:37 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YkQR23HZFz6M4JS;
	Fri, 31 Jan 2025 01:06:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9BBAC140391;
	Fri, 31 Jan 2025 01:08:29 +0800 (CST)
Received: from localhost (10.195.245.124) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 30 Jan
 2025 18:08:28 +0100
Date: Thu, 30 Jan 2025 17:08:26 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, "Bjorn Andersson"
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "
 =?ISO-8859-1?Q?N=EDcolas?= \"F. R. A. Prado\"" <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <20250130170826.00000299@huawei.com>
In-Reply-To: <20250116045911.3382537-3-fj5100bi@fujitsu.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-3-fj5100bi@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.124]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_090835_808337_C8237AD5 
X-CRM114-Status: GOOD (  29.29  )
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

On Thu, 16 Jan 2025 04:59:11 +0000
Yoshihiro Furudera <fj5100bi@fujitsu.com> wrote:

> This adds a new dynamic PMU to the Perf Events framework to program and
> control the Uncore PCI PMUs in Fujitsu chips.
> 
> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.
> 
> This driver exports formatting and event information to sysfs so it can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e pci_iod0_pci0/ea-pci/ ls
> perf stat -e pci_iod0_pci0/event=0x80/ ls
> 
> FUJITSU-MONAKA Specification URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Hi,

As you can probably guess, similar comments in here.
Assuming those little things tidied up feel free to add
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
to your v5.

> diff --git a/drivers/perf/fujitsu_pci_pmu.c b/drivers/perf/fujitsu_pci_pmu.c
> new file mode 100644
> index 000000000000..2ce2ca19b5ea
> --- /dev/null
> +++ b/drivers/perf/fujitsu_pci_pmu.c
> @@ -0,0 +1,553 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for the Uncore PCI PMUs in Fujitsu chips.
> + *
> + * See Documentation/admin-guide/perf/fujitsu_pci_pmu.rst for more details.
> + *
> + * This driver is based on drivers/perf/qcom_l3_pmu.c
> + * Copyright (c) 2015-2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Fujitsu. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>

mod_devicetable.h probably should be here.

> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +
> +/* Number of counters on each PMU */
> +#define PCI_NUM_COUNTERS  8
> +/* Mask for the event type field within perf_event_attr.config and EVTYPE reg */
> +#define PCI_EVTYPE_MASK   0xFF
> +
> +/* Perfmon registers */
> +#define PCI_PM_EVCNTR(__cntr) (0x000 + __cntr * 8)
> +#define PCI_PM_CNTCTL(__cntr) (0x100 + __cntr * 8)
> +#define PCI_PM_EVTYPE(__cntr) (0x200 + __cntr * 8)
(__cntr)

> +/*
> + * We must NOT create groups containing events from multiple hardware PMUs,
> + * although mixing different software and hardware PMUs is allowed.
> + */
> +static bool fujitsu_pci__validate_event_group(struct perf_event *event)
> +{
> +	struct perf_event *leader = event->group_leader;
> +	struct perf_event *sibling;
> +	int counters = 0;
> +
> +	if (leader->pmu != event->pmu && !is_software_event(leader))
> +		return false;
> +
> +	/* The sum of the counters used by the event and its leader event */
> +	counters = 2;
> +
> +	for_each_sibling_event(sibling, leader) {
> +		if (is_software_event(sibling))
> +			continue;
> +		if (sibling->pmu != event->pmu)
> +			return false;
> +		counters += 1;
counters++;

> +	}
> +
> +	/*
> +	 * If the group requires more counters than the HW has, it
> +	 * cannot ever be scheduled.
> +	 */
> +	return counters <= PCI_NUM_COUNTERS;
> +}

> +
> +static const struct attribute_group fujitsu_pci_pmu_events_group = {
> +	.name = "events",
> +	.attrs = fujitsu_pci_pmu_events
As below

> +};
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct pci_pmu *pcipmu = to_pci_pmu(dev_get_drvdata(dev));
> +
> +	return cpumap_print_to_pagebuf(true, buf, &pcipmu->cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *fujitsu_pci_pmu_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group fujitsu_pci_pmu_cpumask_attr_group = {
> +	.attrs = fujitsu_pci_pmu_cpumask_attrs

Another trailing comma missing here.

> +static int fujitsu_pci_pmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct acpi_device *acpi_dev;
> +	struct pci_pmu *pcipmu;
> +	struct resource *memrc;
> +	char *name;
> +	int ret;
> +	u64 uid;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return -ENODEV;
> +
> +	ret = acpi_dev_uid_to_integer(acpi_dev, &uid);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to read ACPI uid\n");
> +
> +	pcipmu = devm_kzalloc(dev, sizeof(*pcipmu), GFP_KERNEL);
> +	if (!pcipmu)
> +		return -ENOMEM;
> +
> +	name = devm_kasprintf(dev, GFP_KERNEL, "pci_iod%llu_pci%llu",
> +			  (uid >> 4) & 0xF, uid & 0xF);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	pcipmu->pmu = (struct pmu) {
> +		.parent		= dev,
> +		.task_ctx_nr	= perf_invalid_context,
> +
> +		.pmu_enable	= fujitsu_pci__pmu_enable,
> +		.pmu_disable	= fujitsu_pci__pmu_disable,
> +		.event_init	= fujitsu_pci__event_init,
> +		.add		= fujitsu_pci__event_add,
> +		.del		= fujitsu_pci__event_del,
> +		.start		= fujitsu_pci__event_start,
> +		.stop		= fujitsu_pci__event_stop,
> +		.read		= fujitsu_pci__event_read,
> +
> +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE

As in previous.  Add trailing commas to all structure field fills that
aren't terminating NULL type entries.

> +	};
> +
> +	pcipmu->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &memrc);
> +	if (IS_ERR(pcipmu->regs))
> +		return PTR_ERR(pcipmu->regs);
> +
> +	fujitsu_pci__init(pcipmu);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret <= 0)
> +		return ret;
> +
> +	ret = devm_request_irq(dev, ret, fujitsu_pci__handle_irq, 0,
> +			       name, pcipmu);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Request for IRQ failed for slice @%pa\n",
> +						&memrc->start);
> +
> +	/* Add this instance to the list used by the offline callback */
> +	ret = cpuhp_state_add_instance(pci_pmu_cpuhp_state, &pcipmu->node);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Error registering hotplug");
> +
> +	ret = perf_pmu_register(&pcipmu->pmu, name, -1);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register PCI PMU\n");
> +
> +	dev_dbg(dev, "Registered %s, type: %d\n", name, pcipmu->pmu.type);
> +
> +	return 0;
> +}

