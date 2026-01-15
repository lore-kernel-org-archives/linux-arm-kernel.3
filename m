Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE452D4117D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyB37/toxq58toHO4EdLQaTTIzVTia9JY6nsE78P49s=; b=Z6zLm24Ls5eecj8b3UqBhJQgJu
	ljyua/KH2m6NpMhINKuUZAadZ6N8emD/YUTxYBQt1drRWMUsR5W3pR9DbxUUnvLgrsmo9M/8liOqV
	rI7k6vDjTGdrnaujynmMC9tuJQ7keuEqxpwc3u7gPhOeTHE8GrpxFhSkAOjaEzBiSnCwUYLO/u7C1
	0rqi5SXrv+swsIvlhf8RkeQwZ4M8EoyEWqnRPywHqXJm6SAxnJiwUWiYhFlFr+s4gQ2drrOAFhgKc
	ARrMjDfUY+ngSZ8/suC1j4ZijP9T5H+DZ2BYeoovoujLo4Cz+oBeb+yOqYc3BfNDDY+8+gyT24jTN
	8ZNNC8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMUz-0000000CKzF-1dw5;
	Thu, 15 Jan 2026 12:30:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMUx-0000000CKyb-2Frb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:30:48 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dsMl80L4PzJ46bg;
	Thu, 15 Jan 2026 20:30:28 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E65340563;
	Thu, 15 Jan 2026 20:30:44 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 15 Jan
 2026 12:30:43 +0000
Date: Thu, 15 Jan 2026 12:30:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] irqchip/gic-v5: Add ACPI IRS probing
Message-ID: <20260115123042.000015ad@huawei.com>
In-Reply-To: <20260115-gicv5-host-acpi-v3-4-c13a9a150388@kernel.org>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
	<20260115-gicv5-host-acpi-v3-4-c13a9a150388@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_043047_724418_9EDA7C95 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, 15 Jan 2026 10:50:50 +0100
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On ARM64 ACPI systems GICv5 IRSes are described in MADT sub-entries.
> 
> Add the required plumbing to parse MADT IRS firmware table entries and
> probe the IRS components in ACPI.
> 
> Augment the irqdomain_ops.translate() for PPI and SPI IRQs in order to
> provide support for their ACPI based firmware translation.
> 
> Implement an irqchip ACPI based callback to initialize the global GSI
> domain upon an MADT IRS detection.
> 
> The IRQCHIP_ACPI_DECLARE() entry in the top level GICv5 driver is only used
> to trigger the IRS probing (ie the global GSI domain is initialized once on
> the first call on multi-IRS systems); IRS probing takes place by calling
> acpi_table_parse_madt() in the IRS sub-driver, that probes all IRSes
> in sequence.
> 
> Add a new ACPI interrupt model so that it can be detected at runtime and
> distinguished from previous GIC architecture models.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

