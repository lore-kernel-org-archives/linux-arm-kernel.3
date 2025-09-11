Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8492CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwP4Pfqhx716rCz39glNS+iz77FXYpoealdboOxYnJc=; b=E7f8R35+5JzcLwWR+bp0tU5s/q
	cdsCh+SC7qFyDtOxqLamrbi16UvuFjnBKZIlPqiKJcQhvcsPtWI75UL+BDL78mCWYaeVZ9KhC+IJZ
	cEgXljpaIz58VKFy1CZILLxuv4s9BXtCla4SyCil9fY6CELm+odi1puZYPY2mJjgWsXC73GGxIqXi
	fAqQkM5NXsqcjWPemeSlmwUb42+Ejv4wzo71rEnYdQqTWU5XCLTISrDtJnnhMiq7h11l6GA5Hh4YW
	4dl9W4X139leHUtau4+4r74Sw2d0wbQUtCzrxp1zXsP4mxUYxjwn2TCwWJzOdDqQd/RyYBducdkog
	tgcX8IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwijK-00000003i5y-1lz3;
	Thu, 11 Sep 2025 14:56:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwijH-00000003i3V-1ebb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:56:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C51F8433AF;
	Thu, 11 Sep 2025 14:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00485C4CEFA;
	Thu, 11 Sep 2025 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757602614;
	bh=kh/+eNC2qNg9eJRgcYWYw/8eyPc3xvaGRPNgKVRdqs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYVFlGeWBVforg3iHHIBbqQ65fHUDVkJCuYnhU4cOCw10fV1uiTrjJ2Sa/vgyFWBn
	 8+R6RCRloPurC1Q3e+M7TkaIxRScnCZj5jToYcfIiyYzZxG/V+PCzea/bJew9dGEUh
	 wOxcysiAlEnCwyJKNxR1Le6ohq/704/PuUoFiD3Bdc5kfoWZ/tMLIkskjhNKe2dMxL
	 2WhoqnWGtj/jHrx9eM3LoVvum+4FNc2jlmFBNp6bvVdCdFWLxGMPfjZk5CQvZwhYW/
	 hXdJ3eadLHzKJiuYcasPkxNFDu2v/AuQezDr9f34s9Z3WnXPrpW6VvQ8/6essSmDrF
	 ygpXG2s3eFgiA==
Date: Thu, 11 Sep 2025 16:56:43 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 06/29] ACPI / MPAM: Parse the MPAM table
Message-ID: <aMLjKzGsGE7rlpKn@lpieralisi>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-7-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910204309.20751-7-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_075655_489406_5AEA10FC 
X-CRM114-Status: GOOD (  47.23  )
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

On Wed, Sep 10, 2025 at 08:42:46PM +0000, James Morse wrote:
> Add code to parse the arm64 specific MPAM table, looking up the cache
> level from the PPTT and feeding the end result into the MPAM driver.
> 
> For now the MPAM hook mpam_ris_create() is stubbed out, but will update
> the MPAM driver with optional discovered data.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Link: https://developer.arm.com/documentation/den0065/3-0bet/?lang=en
> Signed-off-by: James Morse <james.morse@arm.com>

I have not noticed anything wrong - just some remarks/questions
below.

> ---
> Changes since v1:
>  * Whitespace.
>  * Gave GLOBAL_AFFINITY a pre-processor'd name.
>  * Fixed assumption that there are zero functional dependencies.
>  * Bounds check walking of the MSC RIS.
>  * More bounds checking in the main table walk.
>  * Check for nonsense numbers of function dependencies.
>  * Smattering of pr_debug() to help folk feeding line-noise to the parser.
>  * Changed the comment flavour on the SPDX string.
>  * Removed additional table check.
>  * More comment wrangling.
> 
> Changes since RFC:
>  * Used DEFINE_RES_IRQ_NAMED() and friends macros.
>  * Additional error handling.
>  * Check for zero sized MSC.
>  * Allow table revisions greater than 1. (no spec for revision 0!)
>  * Use cleanup helpers to retrive ACPI tables, which allows some functions
>    to be folded together.
> ---
>  arch/arm64/Kconfig          |   1 +
>  drivers/acpi/arm64/Kconfig  |   3 +
>  drivers/acpi/arm64/Makefile |   1 +
>  drivers/acpi/arm64/mpam.c   | 361 ++++++++++++++++++++++++++++++++++++
>  drivers/acpi/tables.c       |   2 +-
>  include/linux/acpi.h        |  12 ++
>  include/linux/arm_mpam.h    |  48 +++++
>  7 files changed, 427 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/acpi/arm64/mpam.c
>  create mode 100644 include/linux/arm_mpam.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 4be8a13505bf..6487c511bdc6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2062,6 +2062,7 @@ config ARM64_TLB_RANGE
>  
>  config ARM64_MPAM
>  	bool "Enable support for MPAM"
> +	select ACPI_MPAM if ACPI
>  	help
>  	  Memory System Resource Partitioning and Monitoring (MPAM) is an
>  	  optional extension to the Arm architecture that allows each
> diff --git a/drivers/acpi/arm64/Kconfig b/drivers/acpi/arm64/Kconfig
> index b3ed6212244c..f2fd79f22e7d 100644
> --- a/drivers/acpi/arm64/Kconfig
> +++ b/drivers/acpi/arm64/Kconfig
> @@ -21,3 +21,6 @@ config ACPI_AGDI
>  
>  config ACPI_APMT
>  	bool
> +
> +config ACPI_MPAM
> +	bool
> diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
> index 05ecde9eaabe..9390b57cb564 100644
> --- a/drivers/acpi/arm64/Makefile
> +++ b/drivers/acpi/arm64/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_ACPI_APMT) 	+= apmt.o
>  obj-$(CONFIG_ACPI_FFH)		+= ffh.o
>  obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
>  obj-$(CONFIG_ACPI_IORT) 	+= iort.o
> +obj-$(CONFIG_ACPI_MPAM) 	+= mpam.o
>  obj-$(CONFIG_ACPI_PROCESSOR_IDLE) += cpuidle.o
>  obj-$(CONFIG_ARM_AMBA)		+= amba.o
>  obj-y				+= dma.o init.o
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> new file mode 100644
> index 000000000000..fd9cfa143676
> --- /dev/null
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Arm Ltd.
> +
> +/* Parse the MPAM ACPI table feeding the discovered nodes into the driver */
> +
> +#define pr_fmt(fmt) "ACPI MPAM: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/arm_mpam.h>
> +#include <linux/bits.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/platform_device.h>
> +
> +#include <acpi/processor.h>
> +
> +/*
> + * Flags for acpi_table_mpam_msc.*_interrupt_flags.
> + * See 2.1.1 Interrupt Flags, Table 5, of DEN0065B_MPAM_ACPI_3.0-bet.
> + */
> +#define ACPI_MPAM_MSC_IRQ_MODE_MASK                    BIT(0)
> +#define ACPI_MPAM_MSC_IRQ_TYPE_MASK                    GENMASK(2, 1)
> +#define ACPI_MPAM_MSC_IRQ_TYPE_WIRED                   0
> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER BIT(3)

Nit: For consistency, not sure why MODE/TYPE_MASK and
AFFINITY_{TYPE/VALID} aren't but that's not a big deal.

BIT(3) to be consistent with the table should be (?)

#define ACPI_MPAM_MSC_AFFINITY_TYPE_MASK	BIT(3)

to match the Table 5 (and then add defines for possible values).

> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_VALID               BIT(4)

ACPI_MPAM_MSC_AFFINITY_VALID_MASK ? (or remove _MASK from IRQ_{MODE/TYPE) ?

Just noticed - feel free to ignore this altogether.

> +static bool acpi_mpam_register_irq(struct platform_device *pdev, int intid,
> +				   u32 flags, int *irq,
> +				   u32 processor_container_uid)
> +{
> +	int sense;
> +
> +	if (!intid)
> +		return false;
> +
> +	if (FIELD_GET(ACPI_MPAM_MSC_IRQ_TYPE_MASK, flags) !=
> +	    ACPI_MPAM_MSC_IRQ_TYPE_WIRED)
> +		return false;
> +
> +	sense = FIELD_GET(ACPI_MPAM_MSC_IRQ_MODE_MASK, flags);
> +
> +	if (16 <= intid && intid < 32 && processor_container_uid != GLOBAL_AFFINITY) {
> +		pr_err_once("Partitioned interrupts not supported\n");
> +		return false;
> +	}

Please add a comment to explain what you mean here (ie PPIs partitioning
isn't supported). I will have to change this code anyway to cater for the
GICv5 interrupt model given the hardcoded intid values.

Is the condition allowed by the MPAM architecture so the MPAM table are
legitimate (but not supported in Linux) ?

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
> +	u32 flags, aff;
> +	int irq;
> +
> +	flags = tbl_msc->overflow_interrupt_flags;
> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
> +		aff = tbl_msc->overflow_interrupt_affinity;
> +	else
> +		aff = GLOBAL_AFFINITY;
> +	if (acpi_mpam_register_irq(pdev, tbl_msc->overflow_interrupt, flags, &irq, aff))
> +		res[(*res_idx)++] = DEFINE_RES_IRQ_NAMED(irq, "overflow");
> +
> +	flags = tbl_msc->error_interrupt_flags;
> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
> +		aff = tbl_msc->error_interrupt_affinity;
> +	else
> +		aff = GLOBAL_AFFINITY;
> +	if (acpi_mpam_register_irq(pdev, tbl_msc->error_interrupt, flags, &irq, aff))
> +		res[(*res_idx)++] = DEFINE_RES_IRQ_NAMED(irq, "error");
> +}
> +
> +static int acpi_mpam_parse_resource(struct mpam_msc *msc,
> +				    struct acpi_mpam_resource_node *res)
> +{
> +	int level, nid;
> +	u32 cache_id;
> +
> +	switch (res->locator_type) {
> +	case ACPI_MPAM_LOCATION_TYPE_PROCESSOR_CACHE:
> +		cache_id = res->locator.cache_locator.cache_reference;
> +		level = find_acpi_cache_level_from_id(cache_id);
> +		if (level <= 0) {
> +			pr_err_once("Bad level (%u) for cache with id %u\n", level, cache_id);
> +			return -EINVAL;
> +		}
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_CACHE,
> +				       level, cache_id);
> +	case ACPI_MPAM_LOCATION_TYPE_MEMORY:
> +		nid = pxm_to_node(res->locator.memory_locator.proximity_domain);
> +		if (nid == NUMA_NO_NODE)
> +			nid = 0;
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
> +				       255, nid);
> +	default:
> +		/* These get discovered later and treated as unknown */
> +		return 0;
> +	}
> +}
> +
> +int acpi_mpam_parse_resources(struct mpam_msc *msc,
> +			      struct acpi_mpam_msc_node *tbl_msc)
> +{
> +	int i, err;
> +	char *ptr, *table_end;
> +	struct acpi_mpam_resource_node *resource;
> +
> +	ptr = (char *)(tbl_msc + 1);
> +	table_end = ptr + tbl_msc->length;
> +	for (i = 0; i < tbl_msc->num_resource_nodes; i++) {
> +		u64 max_deps, remaining_table;
> +
> +		if (ptr + sizeof(*resource) > table_end)
> +			return -EINVAL;
> +
> +		resource = (struct acpi_mpam_resource_node *)ptr;
> +
> +		remaining_table = table_end - ptr;
> +		max_deps = remaining_table / sizeof(struct acpi_mpam_func_deps);
> +		if (resource->num_functional_deps > max_deps) {
> +			pr_debug("MSC has impossible number of functional dependencies\n");
> +			return -EINVAL;
> +		}
> +
> +		err = acpi_mpam_parse_resource(msc, resource);
> +		if (err)
> +			return err;
> +
> +		ptr += sizeof(*resource);
> +		ptr += resource->num_functional_deps * sizeof(struct acpi_mpam_func_deps);
> +	}
> +
> +	return 0;
> +}
> +
> +static bool __init parse_msc_pm_link(struct acpi_mpam_msc_node *tbl_msc,
> +				     struct platform_device *pdev,
> +				     u32 *acpi_id)
> +{
> +	char hid[sizeof(tbl_msc->hardware_id_linked_device) + 1];
> +	bool acpi_id_valid = false;
> +	struct acpi_device *buddy;
> +	char uid[11];
> +	int err;
> +
> +	memset(&hid, 0, sizeof(hid));

Jonathan already commented on this.

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
> +	if (err >= sizeof(uid)) {
> +		pr_debug("Failed to convert uid of device for power management.");
> +		return acpi_id_valid;
> +	}
> +
> +	buddy = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	if (buddy)
> +		device_link_add(&pdev->dev, &buddy->dev, DL_FLAG_STATELESS);

Is !buddy a FW error to be logged ?

> +
> +	return acpi_id_valid;
> +}
> +
> +static int decode_interface_type(struct acpi_mpam_msc_node *tbl_msc,
> +				 enum mpam_msc_iface *iface)
> +{
> +	switch (tbl_msc->interface_type) {
> +	case 0:
> +		*iface = MPAM_IFACE_MMIO;
> +		return 0;
> +	case 0xa:

Worth giving those constants 0x0,0xa a name ?

> +		*iface = MPAM_IFACE_PCC;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int __init acpi_mpam_parse(void)
> +{
> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_MPAM, 0);
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
> +	if (acpi_disabled || !system_supports_mpam() || IS_ERR(table))
> +		return 0;
> +
> +	if (table->revision < 1)
> +		return 0;
> +
> +	table_end = (char *)table + table->length;
> +
> +	while (table_offset < table_end) {
> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> +		table_offset += tbl_msc->length;
> +
> +		if (table_offset > table_end) {
> +			pr_debug("MSC entry overlaps end of ACPI table\n");
> +			break;
> +		}
> +
> +		/*
> +		 * If any of the reserved fields are set, make no attempt to
> +		 * parse the MSC structure. This MSC will still be counted,
> +		 * meaning the MPAM driver can't probe against all MSC, and
> +		 * will never be enabled. There is no way to enable it safely,
> +		 * because we cannot determine safe system-wide partid and pmg
> +		 * ranges in this situation.
> +		 */
> +		if (tbl_msc->reserved || tbl_msc->reserved1 || tbl_msc->reserved2) {
> +			pr_err_once("Unrecognised MSC, MPAM not usable\n");
> +			pr_debug("MSC.%u: reserved field set\n", tbl_msc->identifier);
> +			continue;
> +		}

This is a bit obscure - the comment too requires some explanation
("This MSC will still be counted", not very clear what that means).

> +
> +		if (!tbl_msc->mmio_size) {
> +			pr_debug("MSC.%u: marked as disabled\n", tbl_msc->identifier);
> +			continue;
> +		}
> +
> +		if (decode_interface_type(tbl_msc, &iface)) {
> +			pr_debug("MSC.%u: unknown interface type\n", tbl_msc->identifier);
> +			continue;
> +		}
> +
> +		next_res = 0;
> +		next_prop = 0;
> +		memset(res, 0, sizeof(res));
> +		memset(props, 0, sizeof(props));
> +
> +		pdev = platform_device_alloc("mpam_msc", tbl_msc->identifier);
> +		if (!pdev) {
> +			err = -ENOMEM;
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
> +			else
> +				pr_debug("MSC.%u: missing namespace entry\n", tbl_msc->identifier);

Here you are linking the platform device to a namespace companion.
That's what will make sure that a) the ACPI namespace scan won't add an
additional platform device for ARMHAA5C and b) MSIs works -> through
the related IORT named component.

Correct ?

> +		}
> +
> +		if (iface == MPAM_IFACE_MMIO) {
> +			res[next_res++] = DEFINE_RES_MEM_NAMED(tbl_msc->base_address,
> +							       tbl_msc->mmio_size,
> +							       "MPAM:MSC");
> +		} else if (iface == MPAM_IFACE_PCC) {
> +			props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
> +								tbl_msc->base_address);
> +			next_prop++;
> +		}
> +
> +		acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);

Do we _really_ have to resolve IRQs here or we can postpone them at
driver probe time like RIS resources (if I understand correctly how
it is done - by copying table data into platform data) ?

GICv5 hat in mind - good as it is for GICv3.

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

I read this as: copy table data to the device so that RIS resources can
be parsed later.

Right ? I think it is worth updating the comment to clarify it.

> +		err = platform_device_add_data(pdev, tbl_msc, tbl_msc->length);
> +		if (err)
> +			break;
> +
> +		err = platform_device_add(pdev);
> +		if (err)
> +			break;
> +	}
> +
> +	if (err)
> +		platform_device_put(pdev);

I won't comment on the clean-up here as Jonathan did it already.

> +
> +	return err;
> +}
> +
> +int acpi_mpam_count_msc(void)
> +{
> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_MPAM, 0);
> +	char *table_end, *table_offset = (char *)(table + 1);
> +	struct acpi_mpam_msc_node *tbl_msc;
> +	int count = 0;
> +
> +	if (IS_ERR(table))
> +		return 0;
> +
> +	if (table->revision < 1)
> +		return 0;
> +
> +	table_end = (char *)table + table->length;
> +
> +	while (table_offset < table_end) {
> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> +		if (!tbl_msc->mmio_size)
> +			continue;
> +
> +		if (tbl_msc->length < sizeof(*tbl_msc))
> +			return -EINVAL;
> +		if (tbl_msc->length > table_end - table_offset)
> +			return -EINVAL;
> +		table_offset += tbl_msc->length;
> +
> +		count++;
> +	}
> +
> +	return count;
> +}
> +
> +/*
> + * Call after ACPI devices have been created, which happens behind acpi_scan_init()
> + * called from subsys_initcall(). PCC requires the mailbox driver, which is
> + * initialised from postcore_initcall().

I think we will end up setting in stone init ordering for these
components created out of static tables (I mean sequencing them in a
centralized way) but if that works for the current driver that's fine
for the time being.

> + */
> +subsys_initcall_sync(acpi_mpam_parse);
> diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> index fa9bb8c8ce95..835e3795ede3 100644
> --- a/drivers/acpi/tables.c
> +++ b/drivers/acpi/tables.c
> @@ -408,7 +408,7 @@ static const char table_sigs[][ACPI_NAMESEG_SIZE] __nonstring_array __initconst
>  	ACPI_SIG_PSDT, ACPI_SIG_RSDT, ACPI_SIG_XSDT, ACPI_SIG_SSDT,
>  	ACPI_SIG_IORT, ACPI_SIG_NFIT, ACPI_SIG_HMAT, ACPI_SIG_PPTT,
>  	ACPI_SIG_NHLT, ACPI_SIG_AEST, ACPI_SIG_CEDT, ACPI_SIG_AGDI,
> -	ACPI_SIG_NBFT };
> +	ACPI_SIG_NBFT, ACPI_SIG_MPAM };
>  
>  #define ACPI_HEADER_SIZE sizeof(struct acpi_table_header)
>  
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index c5fd92cda487..af449964426b 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -8,6 +8,7 @@
>  #ifndef _LINUX_ACPI_H
>  #define _LINUX_ACPI_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/ioport.h>	/* for struct resource */
>  #include <linux/resource_ext.h>
> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>  void acpi_table_init_complete (void);
>  int acpi_table_init (void);
>  
> +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
> +{
> +	struct acpi_table_header *table;
> +	int status = acpi_get_table(signature, instance, &table);
> +
> +	if (ACPI_FAILURE(status))
> +		return ERR_PTR(-ENOENT);
> +	return table;
> +}
> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))

Jonathan commented on this already - worth getting Rafael's opinion,
I am fine either way.

I have not found anything that should block this code (other than code
that I know I will have to rework when GICv5 ACPI support gets in) so:

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> +
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>  		unsigned long table_size, int entry_id,
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> new file mode 100644
> index 000000000000..3d6c39c667c3
> --- /dev/null
> +++ b/include/linux/arm_mpam.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025 Arm Ltd. */
> +
> +#ifndef __LINUX_ARM_MPAM_H
> +#define __LINUX_ARM_MPAM_H
> +
> +#include <linux/acpi.h>
> +#include <linux/types.h>
> +
> +#define GLOBAL_AFFINITY		~0
> +
> +struct mpam_msc;
> +
> +enum mpam_msc_iface {
> +	MPAM_IFACE_MMIO,	/* a real MPAM MSC */
> +	MPAM_IFACE_PCC,		/* a fake MPAM MSC */
> +};
> +
> +enum mpam_class_types {
> +	MPAM_CLASS_CACHE,       /* Well known caches, e.g. L2 */
> +	MPAM_CLASS_MEMORY,      /* Main memory */
> +	MPAM_CLASS_UNKNOWN,     /* Everything else, e.g. SMMU */
> +};
> +
> +#ifdef CONFIG_ACPI_MPAM
> +/* Parse the ACPI description of resources entries for this MSC. */
> +int acpi_mpam_parse_resources(struct mpam_msc *msc,
> +			      struct acpi_mpam_msc_node *tbl_msc);
> +
> +int acpi_mpam_count_msc(void);
> +#else
> +static inline int acpi_mpam_parse_resources(struct mpam_msc *msc,
> +					    struct acpi_mpam_msc_node *tbl_msc)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int acpi_mpam_count_msc(void) { return -EINVAL; }
> +#endif
> +
> +static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
> +				  enum mpam_class_types type, u8 class_id,
> +				  int component_id)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif /* __LINUX_ARM_MPAM_H */
> -- 
> 2.39.5
> 

