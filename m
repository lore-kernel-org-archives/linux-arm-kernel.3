Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69994C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Cvu/26UDdkGdDY4mscZKZUHl8jDc3jBrTjY2YhOFw=; b=Bnj7F+eeYJr4oKlw/gKKz3TE+p
	aJ1QRoY3z+rhtA9I4XwFx7Qi8yKmuY0W12T0R9rp7ZpIuEvcxdXzGCFSunHQYEeRP+YfpK8K3GXNM
	1JyqpzRKjgwTq1pXmvn78FvyVzJtC47wQf3Sy9jftEwXLoGn+KQODM+obLKnV31j1syZHDLoMPfuU
	X8i7RKwoQJRuLw+S6aRlkOYKskCXQNG0yMvcShtGnQXq7ySEufSPdGSNfipCbr32vN7fM+9xzVJkH
	UIP34E4iO0BKM6/+xyxLdJkr4GiZrGNqD/nLyjWjve5JrVfPwF6H5F2nKXy5Cm3PVn1veQHpPBvB2
	S+cOXtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5dw-00000008GMW-3PUi;
	Wed, 16 Jul 2025 17:10:08 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5bS-00000008GAS-2BSz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 17:07:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bj2T6481gz6L5DR;
	Thu, 17 Jul 2025 01:03:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A607B1402F2;
	Thu, 17 Jul 2025 01:07:27 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 16 Jul
 2025 19:07:26 +0200
Date: Wed, 16 Jul 2025 18:07:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 10/36] ACPI / MPAM: Parse the MPAM table
Message-ID: <20250716180725.0000452d@huawei.com>
In-Reply-To: <20250711183648.30766-11-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-11-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_100734_856503_7DB6BAD1 
X-CRM114-Status: GOOD (  42.43  )
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

On Fri, 11 Jul 2025 18:36:22 +0000
James Morse <james.morse@arm.com> wrote:

> Add code to parse the arm64 specific MPAM table, looking up the cache
> level from the PPTT and feeding the end result into the MPAM driver.

Throw in a link to the spec perhaps?  Particularly useful to know which
version this was written against when reviewing it.

> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/Kconfig          |   1 +
>  drivers/acpi/arm64/Kconfig  |   3 +
>  drivers/acpi/arm64/Makefile |   1 +
>  drivers/acpi/arm64/mpam.c   | 365 ++++++++++++++++++++++++++++++++++++
>  drivers/acpi/tables.c       |   2 +-
>  include/linux/arm_mpam.h    |  46 +++++
>  6 files changed, 417 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/acpi/arm64/mpam.c
>  create mode 100644 include/linux/arm_mpam.h
> 

> diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
> index 05ecde9eaabe..27b872249baa 100644
> --- a/drivers/acpi/arm64/Makefile
> +++ b/drivers/acpi/arm64/Makefile
> @@ -6,5 +6,6 @@ obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
>  obj-$(CONFIG_ACPI_IORT) 	+= iort.o
>  obj-$(CONFIG_ACPI_PROCESSOR_IDLE) += cpuidle.o
>  obj-$(CONFIG_ARM_AMBA)		+= amba.o
> +obj-$(CONFIG_ACPI_MPAM) 	+= mpam.o

Keep it with the ACPI ones?  There doesn't seem to be a lot of order in here
though so I guess maybe there is logic behind putting it here I'm missing.

>  obj-y				+= dma.o init.o
>  obj-y				+= thermal_cpufreq.o
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> new file mode 100644
> index 000000000000..f4791bac9a2a
> --- /dev/null
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +/* Parse the MPAM ACPI table feeding the discovered nodes into the driver */
> +
> +#define pr_fmt(fmt) "ACPI MPAM: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/arm_mpam.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/platform_device.h>
> +
> +#include <acpi/processor.h>
> +
> +/* Flags for acpi_table_mpam_msc.*_interrupt_flags */

References.. I'm looking at 3.0-alpha table 5 to check this.
I can see why you might be reluctant to point at an alpha if that
is what you are using ;)


> +#define ACPI_MPAM_MSC_IRQ_MODE_EDGE                    1
> +#define ACPI_MPAM_MSC_IRQ_TYPE_MASK                    (3 << 1)

GENMASK(3, 2) would be my preference for how to do masks in new code.

> +#define ACPI_MPAM_MSC_IRQ_TYPE_WIRED                   0
> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER BIT(3)
> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_VALID               BIT(4)
> +
> +static bool frob_irq(struct platform_device *pdev, int intid, u32 flags,
> +		     int *irq, u32 processor_container_uid)
> +{
> +	int sense;
> +
> +	if (!intid)
> +		return false;
> +
> +	/* 0 in this field indicates a wired interrupt */
> +	if (flags & ACPI_MPAM_MSC_IRQ_TYPE_MASK)
I'd prefer more explicit code (and probably no comment)

	if (FIELD_GET(flags, ACPI_MPAM_MSC_IRQ_TYPE_MASK) !=
	    ACPI_MPAM_MSC_IRQ_TYPE_WIRED)
		return false;

> +		return false;
> +
> +	if (flags & ACPI_MPAM_MSC_IRQ_MODE_EDGE)
> +		sense = ACPI_EDGE_SENSITIVE;
> +	else
> +		sense = ACPI_LEVEL_SENSITIVE;

If the spec is supposed to be using standard ACPI_* types for this field
(I don't think the connection is explicitly documented though) then

	sense = FIELD_GET(flags, ACPI_MPAM_MSC_IRQ_MODE_MASK); 
Assuming a change to define the mask and rely on the ACPI defs for the values

This one is entirely up to you.

> +
> +	/*
> +	 * If the GSI is in the GIC's PPI range, try and create a partitioned
> +	 * percpu interrupt.
> +	 */
> +	if (16 <= intid && intid < 32 && processor_container_uid != ~0) {
> +		pr_err_once("Partitioned interrupts not supported\n");
> +		return false;
> +	}
> +
> +	*irq = acpi_register_gsi(&pdev->dev, intid, sense, ACPI_ACTIVE_HIGH);
> +	if (*irq <= 0) {
> +		pr_err_once("Failed to register interrupt 0x%x with ACPI\n",
> +			    intid);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void acpi_mpam_parse_irqs(struct platform_device *pdev,
> +				 struct acpi_mpam_msc_node *tbl_msc,
> +				 struct resource *res, int *res_idx)
> +{
> +	u32 flags, aff = ~0;
> +	int irq;
> +
> +	flags = tbl_msc->overflow_interrupt_flags;
> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
> +		aff = tbl_msc->overflow_interrupt_affinity;
Just to make the two cases look the same I'd do

	else
		aff = ~0;

here as well and not initialize above.  It's not quite worth using
a helper function for these two identical blocks but it's close.

> +	if (frob_irq(pdev, tbl_msc->overflow_interrupt, flags, &irq, aff)) {
> +		res[*res_idx].start = irq;
> +		res[*res_idx].end = irq;
> +		res[*res_idx].flags = IORESOURCE_IRQ;
> +		res[*res_idx].name = "overflow";

		res[*res_idx] = DEFINE_RES_IRQ_NAMED(irq, 1, "overflow");
> +
> +		(*res_idx)++;
Can roll this in as well.

> +	}
> +
> +	flags = tbl_msc->error_interrupt_flags;
> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
> +		aff = tbl_msc->error_interrupt_affinity;
> +	else
> +		aff = ~0;
> +	if (frob_irq(pdev, tbl_msc->error_interrupt, flags, &irq, aff)) {
> +		res[*res_idx].start = irq;
> +		res[*res_idx].end = irq;
> +		res[*res_idx].flags = IORESOURCE_IRQ;
> +		res[*res_idx].name = "error";

Similar to above.

> +
> +		(*res_idx)++;
> +	}
> +}
> +


> +static bool __init parse_msc_pm_link(struct acpi_mpam_msc_node *tbl_msc,
> +				     struct platform_device *pdev,
> +				     u32 *acpi_id)
> +{
> +	bool acpi_id_valid = false;
> +	struct acpi_device *buddy;
> +	char hid[16], uid[16];
> +	int err;
> +
> +	memset(&hid, 0, sizeof(hid));
> +	memcpy(hid, &tbl_msc->hardware_id_linked_device,
> +	       sizeof(tbl_msc->hardware_id_linked_device));
> +
> +	if (!strcmp(hid, ACPI_PROCESSOR_CONTAINER_HID)) {
> +		*acpi_id = tbl_msc->instance_id_linked_device;
> +		acpi_id_valid = true;
> +	}
> +
> +	err = snprintf(uid, sizeof(uid), "%u",
> +		       tbl_msc->instance_id_linked_device);
> +	if (err < 0 || err >= sizeof(uid))

Does snprintf() ever return < 0 ?  It's documented as returning
number of chars printed (without the NULL) so that can only be 0 or
greater.

Can it return >= sizeof(uid) ? Looks odd. 

+		return acpi_id_valid;
> +
> +	buddy = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	if (buddy)
> +		device_link_add(&pdev->dev, &buddy->dev, DL_FLAG_STATELESS);
> +
> +	return acpi_id_valid;
> +}

> +static int __init _parse_table(struct acpi_table_header *table)
> +{
> +	char *table_end, *table_offset = (char *)(table + 1);
> +	struct property_entry props[4]; /* needs a sentinel */
> +	struct acpi_mpam_msc_node *tbl_msc;
> +	int next_res, next_prop, err = 0;
> +	struct acpi_device *companion;
> +	struct platform_device *pdev;
> +	enum mpam_msc_iface iface;
> +	struct resource res[3];
> +	char uid[16];
> +	u32 acpi_id;
> +
> +	table_end = (char *)table + table->length;
> +
> +	while (table_offset < table_end) {
> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> +		table_offset += tbl_msc->length;
> +
> +		/*
> +		 * If any of the reserved fields are set, make no attempt to
> +		 * parse the msc structure. This will prevent the driver from
> +		 * probing all the MSC, meaning it can't discover the system
> +		 * wide supported partid and pmg ranges. This avoids whatever
> +		 * this MSC is truncating the partids and creating a screaming
> +		 * error interrupt.
> +		 */
> +		if (tbl_msc->reserved || tbl_msc->reserved1 || tbl_msc->reserved2)
> +			continue;
> +
> +		if (decode_interface_type(tbl_msc, &iface))
> +			continue;
> +
> +		next_res = 0;
> +		next_prop = 0;
> +		memset(res, 0, sizeof(res));
> +		memset(props, 0, sizeof(props));
> +
> +		pdev = platform_device_alloc("mpam_msc", tbl_msc->identifier);
> +		if (IS_ERR(pdev)) {

returns NULL in at least some error cases (probably all, I'm just to lazy to check)

> +			err = PTR_ERR(pdev);
> +			break;
> +		}
> +
> +		if (tbl_msc->length < sizeof(*tbl_msc)) {
> +			err = -EINVAL;
> +			break;
> +		}
> +
> +		/* Some power management is described in the namespace: */
> +		err = snprintf(uid, sizeof(uid), "%u", tbl_msc->identifier);
> +		if (err > 0 && err < sizeof(uid)) {
> +			companion = acpi_dev_get_first_match_dev("ARMHAA5C", uid, -1);
> +			if (companion)
> +				ACPI_COMPANION_SET(&pdev->dev, companion);
> +		}
> +
> +		if (iface == MPAM_IFACE_MMIO) {
> +			res[next_res].name = "MPAM:MSC";
> +			res[next_res].start = tbl_msc->base_address;
> +			res[next_res].end = tbl_msc->base_address + tbl_msc->mmio_size - 1;
> +			res[next_res].flags = IORESOURCE_MEM;
> +			next_res++;

DEFINE_RES_MEM_NAMED()?

> +		} else if (iface == MPAM_IFACE_PCC) {
> +			props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
> +								tbl_msc->base_address);
> +			next_prop++;
> +		}
> +
> +		acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
> +		err = platform_device_add_resources(pdev, res, next_res);
> +		if (err)
> +			break;
> +
> +		props[next_prop++] = PROPERTY_ENTRY_U32("arm,not-ready-us",
> +							tbl_msc->max_nrdy_usec);
> +
> +		/*
> +		 * The MSC's CPU affinity is described via its linked power
> +		 * management device, but only if it points at a Processor or
> +		 * Processor Container.
> +		 */
> +		if (parse_msc_pm_link(tbl_msc, pdev, &acpi_id)) {
> +			props[next_prop++] = PROPERTY_ENTRY_U32("cpu_affinity",
> +								acpi_id);
> +		}
> +
> +		err = device_create_managed_software_node(&pdev->dev, props,
> +							  NULL);
> +		if (err)
> +			break;
> +
> +		/* Come back later if you want the RIS too */
> +		err = platform_device_add_data(pdev, tbl_msc, tbl_msc->length);
> +		if (err)
> +			break;
> +
> +		platform_device_add(pdev);

Can fail.

> +	}
> +
> +	if (err)
> +		platform_device_put(pdev);
> +
> +	return err;
> +}
> +
> +static struct acpi_table_header *get_table(void)
> +{
> +	struct acpi_table_header *table;
> +	acpi_status status;
> +
> +	if (acpi_disabled || !system_supports_mpam())
> +		return NULL;
> +
> +	status = acpi_get_table(ACPI_SIG_MPAM, 0, &table);
> +	if (ACPI_FAILURE(status))
> +		return NULL;
> +
> +	if (table->revision != 1)
> +		return NULL;
> +
> +	return table;
> +}
> +
> +static int __init acpi_mpam_parse(void)
> +{
> +	struct acpi_table_header *mpam;
> +	int err;
> +
> +	mpam = get_table();
> +	if (!mpam)
> +		return 0;

Just what I was suggesting for the PPTT case in early patches. Nice :)

> +
> +	err = _parse_table(mpam);
> +	acpi_put_table(mpam);
> +
> +	return err;
> +}
> +
> +static int _count_msc(struct acpi_table_header *table)
> +{
> +	char *table_end, *table_offset = (char *)(table + 1);
> +	struct acpi_mpam_msc_node *tbl_msc;
> +	int ret = 0;

Call it count as it only ever contains the count?

> +
> +	tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> +	table_end = (char *)table + table->length;
> +
> +	while (table_offset < table_end) {
> +		if (tbl_msc->length < sizeof(*tbl_msc))
> +			return -EINVAL;
> +
> +		ret++;

count++ would feel more natural here.

> +
> +		table_offset += tbl_msc->length;
> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> +	}
> +
> +	return ret;
> +}

That's all I have time for today. Will get to the rest of the series soonish.

Jonathan



