Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E1DC79F95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6PEz/+GBTiTaI8HQ9bF9f2Kv+nJnfgwXFw6sEgfGYY=; b=DoM0ugjjt5l5dZAaaicgDHhlZn
	GLcWZB922gNJ5cR1rPoIuAD3EEM1h5+Rur55yyzZ1no/7ibWnFjTTg9PVqLXD/YUJd/srdNrzVQlb
	tdYEvEiUERrYeh8vYyJHJ1o/dm0ISAZBHmmU17LQfgnf4LMJ0hUAmpk8XR3NvtJas6emDUl0uf/KE
	A9ngASIRyas/gBAnCjnmlm6409ouqIcGvSm/ozRcu4lhEAYyD74sG74uTAZZFKs0IRc8MBIWr62p8
	dtyeRjIROI5FqgeTNAnYla4N0aWrOvA17+8tL/ZkbW9umpn9v6wzPn84WZtOa75XScM4Cb4TULRcr
	IkcIY5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl41-0000000BVGA-14mr;
	Mon, 05 Jan 2026 13:56:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl3y-0000000BVEy-0dvr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:56:04 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlG6C3s37zHnGkW;
	Mon,  5 Jan 2026 21:55:47 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id D2A4A40569;
	Mon,  5 Jan 2026 21:55:49 +0800 (CST)
Received: from localhost (10.48.147.217) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 13:55:48 +0000
Date: Mon, 5 Jan 2026 13:55:45 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Marc
 Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] irqchip/gic-v5: Add ACPI ITS probing
Message-ID: <20260105135545.00003a59@huawei.com>
In-Reply-To: <20251218-gicv5-host-acpi-v2-6-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
	<20251218-gicv5-host-acpi-v2-6-eec76cd1d40b@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.147.217]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_055602_484117_84D6A414 
X-CRM114-Status: GOOD (  29.34  )
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

On Thu, 18 Dec 2025 11:14:32 +0100
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On ACPI ARM64 systems the GICv5 ITS configuration and translate frames
> are described in the MADT table.
> 
> Refactor the current GICv5 ITS driver code to share common functions
> between ACPI and OF and implement ACPI probing in the GICv5 ITS driver.
> 
> Add iort_msi_xlate() to map a device ID and retrieve an MSI controller
> fwnode node for ACPI systems and update pci_msi_map_rid_ctlr_node() to
> use it in its ACPI code path.
> 
> Add the required functions to IORT code for deviceID retrieval and IRQ
> domain registration and look-up so that the GICv5 ITS driver in an
> ACPI based system can be successfully probed.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
Hi Lorenzo,

Diff was in a rather unfriendly mood on this one and smashing the xlate
on top of the wrong function (wrt to what was being replaced).

Ah well. Only one minor comment inline.  Not really my area of expertise
beyond wanting this to move forwards quickly but none the less,

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/acpi/arm64/iort.c                |  95 +++++++++++++++++-----
>  drivers/irqchip/irq-gic-its-msi-parent.c |  39 ++++-----
>  drivers/irqchip/irq-gic-v5-irs.c         |   7 +-
>  drivers/irqchip/irq-gic-v5-its.c         | 132 ++++++++++++++++++++++++++++++-
>  drivers/pci/msi/irqdomain.c              |   2 +
>  include/linux/acpi_iort.h                |  10 ++-
>  include/linux/irqchip/arm-gic-v5.h       |   1 +
>  7 files changed, 241 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 65f0f56ad753..17dbe66da804 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -595,45 +595,45 @@ u32 iort_msi_map_id(struct device *dev, u32 input_id)
>  }
>
> +/**
> + * iort_pmsi_get_msi_info() - Get the device id and translate frame PA for a device
> + * @dev: The device for which the mapping is to be done.
> + * @dev_id: The device ID found.
> + * @pa: optional pointer to store translate frame address.
> + *
> + * Returns: 0 for successful devid and pa retrieval, -ENODEV on error
> + */
> +int iort_pmsi_get_msi_info(struct device *dev, u32 *dev_id, phys_addr_t *pa)
> +{
> +	struct acpi_iort_node *node, *parent = NULL;
> +	struct acpi_iort_its_group *its;
> +	int i, index;
> +
> +	node = iort_find_dev_node(dev);
> +	if (!node)
> +		return -ENODEV;
> +
> +	index = iort_get_id_mapping_index(node);
> +	/* if there is a valid index, go get the dev_id directly */
> +	if (index >= 0) {
> +		parent = iort_node_get_id(node, dev_id, index);
> +	} else {
> +		for (i = 0; i < node->mapping_count; i++) {
> +			parent = iort_node_map_platform_id(node, dev_id,
> +						      IORT_MSI_TYPE, i);
> +			if (parent)
> +				break;
> +		}
> +	}
> +
Another borderline comment on what I think is a small readabilty
improvement.

I'd handle the only error case that would otherwise use the ternary below
here
	if (!parent)
		return -ENODEV;

	if (pa) {
		...
	}
	return 0;

> +	if (parent && pa) {
> +		int ret;
> +
> +		its = (struct acpi_iort_its_group *)node->node_data;
> +		ret = iort_find_its_base(its->identifiers[0], pa);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return parent ? 0 : -ENODEV;
> +}



