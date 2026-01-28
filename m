Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC5DD3F069
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgMrjGzHFLUO8ARuHMEd9oRrOtTdwAvG2B34qX7UbRg=; b=Er+m9XBzrbtQ6kDi9/ll++ooRh
	pszmCCvQZgoH8N+qJYU1zR5QCrb3dEsx03KLIyIJRHgCSnqNPnn8yPlTpU+MAdwTw7ItGFMc3dhor
	rEmWkwoSl0jpNNza8rr7SEf7pqymjoysBHKJr3N1xKXg0gDcIPUhSits0I94xHvyjZKTsPKcWRhv0
	XetO3s04mVo/0LiANEHd3fyAPEWUMtmt61dp6OJqiGYe8JiYr3SFbo8wQ4qV95qRnOxGJFcqaV7Jh
	9U2JlASSRc/i/GTiQ/yTFSuU41Yjsk9B1QqMsiHoJu3RS7ARI2aKYuQwGDHYj4CfoIAQvD30r41po
	BtRrnXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6XK-0000000GAf6-1pUU;
	Wed, 28 Jan 2026 14:28:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6XI-0000000GAel-3yRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6371B600AD;
	Wed, 28 Jan 2026 14:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E738C4CEF7;
	Wed, 28 Jan 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610528;
	bh=yVK+1rGXEFwbGHm+y9dP2+QQA05aUnWbOsxkvUrgglI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEJ4HdxdHqoT5usmyr5CzYmdSDIUsy2yb8Q7Wfgo4BOctdBuAq+uvmf9k1VbAwJHl
	 2vltzlVx13lerrW/ce+XHP+39ufSDtafc0z170juseGExhSWircnGp94Iw6yYmUxjE
	 fAZjfpVsggYd5VHX3c10z4W8nqnhGl2uP3LY3P7Q/gAd9sKQKwo3gUc2LtOpt0Ji2H
	 EOyY+21K3DKX4gugOVAdIECT1MQTCtXXLyT9cgSVFkMIPc2AIFnjsDUk9HK0bpve7F
	 IP+NgMzRA5VrA4SQDmzKN/FYp6E1KT7oxvS427CAietuBA3ZQg+YJNHmBniit6gWE2
	 M/YZ0MIWnlpog==
Date: Wed, 28 Jan 2026 08:28:45 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
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

On Wed, Jan 28, 2026 at 05:10:42PM +0530, Krishna Chaitanya Chundru wrote:
> Previously, the driver skipped putting the link into L2/device state in
> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> low resume latency and may not tolerate deeper power states. However, such
> devices typically remain in D0 and are already covered by the new helper's
> requirement that all endpoints be in D3hot before the host bridge may
> enter D3cold.
> 
> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
> the shared pci_host_common_can_enter_d3cold() helper to decide whether the
> DesignWare host bridge can safely transition to D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
>  	int ret;
>  
> -	/*
> -	 * If L1SS is supported, then do not put the link into L2 as some
> -	 * devices such as NVMe expect low resume latency.
> -	 */
> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> +	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -26,6 +26,7 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +#include "../pci-host-common.h"

Why doesn't this include go in the c file? I don't see that all c files
including pcie-designware.h now needs this.

Regards,
Bjorn

>  #include "../../pci.h"
>  
>  /* DWC PCIe IP-core versions (native support since v4.70a) */
> 
> -- 
> 2.34.1
> 
> 

