Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50EBD58B21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDtdZgzI+o/4Pg+/fS4n4RgpzTDOzFfJPdglVTKio7g=; b=Q7yaMbdpM/Wbl2Q+yXCWbqebkF
	PYTPeUjDlIKmK0SxikBcF52wx1PdZ0FsCcNkbP1meIikf7KlGW+piDjn6p4AHezV8MWEUV7TBRAmS
	eGtqFXDvNZn3OjZb86RoX+JJz6Hf57WNdU2wtQ61TphnmGFKIZYHzevtVPaNraa9P3v+7HDEDsQPf
	VsA53Uiqfxla1qrd+eSh8YVuEZTuZK9dvA7RDLJ9DGT19ofCX7V86urlfg7KRvFHFPY9GU9gQKuSB
	8YFAd30IrHwORdA2D6M2l2mMCV873RH0Z0fGVD8I01k2aUjnf0FqwhNnweZPwdnQKtF4QKle+q9H3
	s0hSvwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20wp-00000003NNj-47KH;
	Mon, 16 Mar 2026 05:57:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20wl-00000003NNX-2eda
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2D7E6013E;
	Mon, 16 Mar 2026 05:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC19C2BC87;
	Mon, 16 Mar 2026 05:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773640618;
	bh=SwzpCrbIkDioR1DKJbXddik0hn5OVTncX0rioRVyncQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkoNH6xDSyJwuB6aQ+JUOxk62iI7GZNJAuVtawOyb+u09qkWc7gFrZoQe+MG0eB1Y
	 jZg3tAt0oiNARCN7E+4SYySbDBI/RLwxIUSVOzK3VgUx7QLTPAMFcmkcLNyuhVw3+Y
	 A4aw1koC+uWBmBC2z2PRqPMoUYGjBR1+8GqNr/BZi0qc/i26YjDjcDcdDcH/xkBLo0
	 fHBGmYSFqqiirEnMrNuhlNX42SJv9wA7APd3eZfnsXbc7QnVTAaf8B1ro1lxY1yNbT
	 0HO/1spRN11nXNNkQk/6mz3D0qnV++qxnMtH3uAXXCXUWG5wpZP03++q+GeBRSpYe6
	 hEnpjfyeWUKNA==
Date: Mon, 16 Mar 2026 11:26:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 03/13] PCI: dwc: Parse Root Port nodes in
 dw_pcie_host_init()
Message-ID: <ay67y5hr7sn5zzugb4swkujao3bvz3puaee4bc6qqr67eyk74t@equoecxosaen>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-4-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313020823.1592389-4-sherry.sun@nxp.com>
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

On Fri, Mar 13, 2026 at 10:08:13AM +0800, Sherry Sun wrote:
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
> index a74339982c24..9608f9fcd1b3 100644
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

Is there an incentive in the -ENOENT error code? Should the API just return 0 if
no ports are found?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

