Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B4C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgLXppGnaKhRmU6P1gSrKgnSIFK0acz5r/UyuFZ9QpA=; b=DeiXeUFcIfx1nHpY/u0MHPIaM9
	ALrCLLt7qGXZlI4vYiGVPThlI5b9Yrfpo6ZLUkLxXWxu2oVBuCDyqZ2dWF09snJq6JGa1pbqG8KPL
	H9jGs3xN4BCsocru2qLbqZhN2v5ZdgiGTDFNG3M/j+2pJYLVsQLfMk0vgUHrtP3JvYaL09kK53nWH
	Wpu26uEBApkmA8HesJKxpzpjPQSeynGKW6KEE74+KzvAsduN7VjDOPdYa1RHy+ylA028+LZvLhoC8
	jAEGn01uZ++tqgl1b2Psj5wiSAu3LjpT7zzXBD1l2I+XiGkuS3sUFC4hb8AwPx8p6PuDlPSmKlFCN
	kZMeeDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcKo-00000004ku0-0H5p;
	Tue, 15 Jul 2025 09:52:26 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubblY-00000004e0X-2thL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:16:02 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F9FpvU2812962;
	Tue, 15 Jul 2025 04:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752570951;
	bh=RgLXppGnaKhRmU6P1gSrKgnSIFK0acz5r/UyuFZ9QpA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dMuShdJZwTRdU3dH+CMk0jZkaIOWM0MQ2iR7UhN8l7ZOfwSO6xaJxJX4OLU6UYdFd
	 L5NiG7Ff04/C43hEAN3V/BV6xpXRQJdNnV7d/nqMw9oo548nE7D4CEmYkyPJZkxQ74
	 cQ8hnchQ61mdibwO9H/77om7O9ykXBsV9JtCk4yc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F9Fptw1162032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 04:15:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 04:15:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 04:15:50 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F9Fnbd2621763;
	Tue, 15 Jul 2025 04:15:50 -0500
Date: Tue, 15 Jul 2025 14:45:48 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <huaqian.li@siemens.com>,
        <helgaas@kernel.org>, <baocheng.su@siemens.com>, <bhelgaas@google.com>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <diogo.ivo@siemens.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <kw@linux.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lpieralisi@kernel.org>, <nm@ti.com>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v8 4/7] PCI: keystone: Add support for PVU-based DMA
 isolation on AM654
Message-ID: <e21c6ead-2bcb-422b-a1b9-eb9dd63b7dc7@ti.com>
References: <aa3c8d033480801250b3fb0be29adda4a2c31f9e.camel@siemens.com>
 <20250422061406.112539-1-huaqian.li@siemens.com>
 <20250422061406.112539-5-huaqian.li@siemens.com>
 <7c8c29ee-2600-4eea-866f-8fe2d533418e@ti.com>
 <e9716614-1849-4524-af4d-20587df365cf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e9716614-1849-4524-af4d-20587df365cf@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_021600_871546_7EEBFF67 
X-CRM114-Status: GOOD (  35.43  )
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

On Tue, Jul 15, 2025 at 10:55:19AM +0200, Jan Kiszka wrote:

Hello Jan,

> On 25.04.25 18:48, Siddharth Vadapalli wrote:
> > On Tue, Apr 22, 2025 at 02:14:03PM +0800, huaqian.li@siemens.com wrote:
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> The AM654 lacks an IOMMU, thus does not support isolating DMA requests
> >> from untrusted PCI devices to selected memory regions this way. Use
> >> static PVU-based protection instead. The PVU, when enabled, will only
> >> accept DMA requests that address previously configured regions.
> >>
> >> Use the availability of a restricted-dma-pool memory region as trigger
> >> and register it as valid DMA target with the PVU. In addition, enable
> >> the mapping of requester IDs to VirtIDs in the PCI RC. Use only a single
> >> VirtID so far, catching all devices. This may be extended later on.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> >> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> >> ---
> >>  drivers/pci/controller/dwc/pci-keystone.c | 106 ++++++++++++++++++++++
> >>  1 file changed, 106 insertions(+)
> >>
> >> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> >> index 76a37368ae4f..ea2d8768e333 100644
> >> --- a/drivers/pci/controller/dwc/pci-keystone.c
> >> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> >> @@ -19,6 +19,7 @@
> >>  #include <linux/mfd/syscon.h>
> >>  #include <linux/msi.h>
> >>  #include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>  #include <linux/of_irq.h>
> >>  #include <linux/of_pci.h>
> >>  #include <linux/phy/phy.h>
> >> @@ -26,6 +27,7 @@
> >>  #include <linux/regmap.h>
> >>  #include <linux/resource.h>
> >>  #include <linux/signal.h>
> >> +#include <linux/ti-pvu.h>
> >>  
> >>  #include "../../pci.h"
> >>  #include "pcie-designware.h"
> >> @@ -111,6 +113,16 @@
> >>  
> >>  #define PCI_DEVICE_ID_TI_AM654X		0xb00c
> >>  
> >> +#define KS_PCI_VIRTID			0
> >> +
> >> +#define PCIE_VMAP_xP_CTRL		0x0
> >> +#define PCIE_VMAP_xP_REQID		0x4
> >> +#define PCIE_VMAP_xP_VIRTID		0x8
> >> +
> >> +#define PCIE_VMAP_xP_CTRL_EN		BIT(0)
> >> +
> >> +#define PCIE_VMAP_xP_VIRTID_VID_MASK	0xfff
> >> +
> >>  struct ks_pcie_of_data {
> >>  	enum dw_pcie_device_mode mode;
> >>  	const struct dw_pcie_host_ops *host_ops;
> >> @@ -1137,6 +1149,94 @@ static const struct of_device_id ks_pcie_of_match[] = {
> >>  	{ },
> >>  };
> >>  
> >> +static int ks_init_vmap(struct platform_device *pdev, const char *vmap_name)
> >> +{
> >> +	struct resource *res;
> >> +	void __iomem *base;
> >> +	u32 val;
> >> +
> >> +	if (!IS_ENABLED(CONFIG_TI_PVU))
> >> +		return 0;
> >> +
> >> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, vmap_name);
> >> +	base = devm_pci_remap_cfg_resource(&pdev->dev, res);
> >> +	if (IS_ERR(base))
> >> +		return PTR_ERR(base);
> >> +
> >> +	writel(0, base + PCIE_VMAP_xP_REQID);
> >> +
> >> +	val = readl(base + PCIE_VMAP_xP_VIRTID);
> >> +	val &= ~PCIE_VMAP_xP_VIRTID_VID_MASK;
> >> +	val |= KS_PCI_VIRTID;
> > 
> > While it has been stated that we are going to start off with a single
> > VirtID for now and extend it later on, is there an example for how it may
> > be extended? The only option I see is that of associating one VirtID for
> > Low-Priority (LP) traffic and another for High-Priority (HP) traffic, in
> > which case, it might be better to define them upfront and use them like:
> > #define KS_PCI_LP_VIRTID	0
> > #define KS_PCI_HP_VIRTID	1
> 
> Sorry for the late reply, was just reminded of this question:
> 
> When trying to design anything beyond the current use case, I would be
> struggling right now with the how, simply because we would have no user
> of extended APIs around to make sure that the result would be useful.
> Can you envision such use cases? If not, I would rather suggest to
> postpone any attempts to broaden the API until we have such users.

I understand that it might not be possible to extend it (or at-least it
doesn't seem to be straightforward), in which case, we could state the
same in commit message. I had asked for an example of extending it
because the commit message states:

    ....Use only a single VirtID so far, catching all devices.
    This may be extended later on.

without explaining how it could be extended later on. To be precise, my
question was aimed at whether or not the current implementation allows
it to be extended in the future (maintaining backward compatibility). If
that's not yet known, it might be better to state that in the commit
message, or omit the portion which states that it may be extended later on.

-----8<---rest of the email has been trimmed-----8<---------------------

Regards,
Siddharth.

