Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30417E85379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHpwaFzytBSibJdwHha8XVrfjAo/zLuVR0mRJ9jxsko=; b=gGk4PDmEFM/70LT6aPNrLTfEqt
	vkd/8OZU7Pm4UlbkGGeS7UFQ/+ucRoqSZmh/TgyBVBFYJ8i7W0Lc5+8n56ijVXZwzYdLX76D2/h5n
	cTyrGB1qaKPB6fpglNxKAGKtvTMiagY1AjrSqX32ba6OpjiqBaZes5lr/pDjC+xSYXy3dOyNkpRnq
	ROJ4mausfK8fKSqqRzafcnyk2CME8/YG78ozIG49r3QMra0kj0tBFvPGMPcWazwvEeDlyXnkM4Ihu
	HAmybj5L+C7jyi5XjdJxaAms0zQ3kr7Kpi5uFNrVqqC/Vj0d2hiM6TGZ+a0DLNliOY5WiXXeBY7SS
	2ijip/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hGm-00000002Jet-0hFp;
	Fri, 03 Apr 2026 16:21:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hGk-00000002Jej-1fi7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC23560008;
	Fri,  3 Apr 2026 16:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CE5C4CEF7;
	Fri,  3 Apr 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775233273;
	bh=lUkTNzulDtlooVfgkDMb6h1qH+67dzoddlhqIdLFbiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6Tghiy/QK+x9O7SpenV2rcmyZSQWQzhRs5PnFYR13Z9wnpj26EKTT+Y9ANcEQh9R
	 xyVdsxtd8w11c32zsZ74dVMAQBaayI5yq6qpRDarKvSU5IkgMCoqBgGAO9SVkiU3G0
	 j+HUBQ3hA/BHlvWb9UDK0USnPy3/YfpF7VxSSYhVMIzj1TUDIDF7rk340YdX/G96as
	 nNHcQhk4RfLpc95WhJ+emUKKtxjBZqBsRNTC6Ne0xhKDA6yJt/eT1+eOb+OAmO+8JS
	 4PeyKHJw/3R/rp/oNNbu1ZMhB5OdR/WpIJ3+B63FVTxiaUuoZ4U6myyjBocha5N2TU
	 At2UpudG9NEiQ==
Date: Fri, 3 Apr 2026 21:50:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 03/13] PCI: dwc: Parse Root Port nodes in
 dw_pcie_host_init()
Message-ID: <xlsfwtcy3wl6nasmx2w2oys6u4bbnvh24qiwr4pf3v5uz523gz@qvhzqfcs5q2c>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
 <20260402095107.205439-4-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402095107.205439-4-sherry.sun@nxp.com>
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

On Thu, Apr 02, 2026 at 05:50:57PM +0800, Sherry Sun wrote:
> Add support for parsing Root Port child nodes in dw_pcie_host_init()
> using pci_host_common_parse_ports(). This allows DWC-based drivers to
> specify Root Port properties (like reset GPIOs) in individual Root Port
> nodes rather than in the host bridge node.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index da152c31bb2e..f6fca984fb34 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  
>  #include "../../pci.h"
> +#include "../pci-host-common.h"
>  #include "pcie-designware.h"
>  
>  static struct pci_ops dw_pcie_ops;
> @@ -581,6 +582,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	pp->bridge = bridge;
>  
> +	/* Parse Root Port nodes if present */
> +	ret = pci_host_common_parse_ports(dev, bridge);
> +	if (ret && ret != -ENOENT) {
> +		dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
> +		return ret;

Won't this change break drivers that parse Root Ports on their own? Either you
need to modify them also in this change or call this API from imx6 driver and
let other drivers switch to it in a phased manner.

I perfer the latter.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

