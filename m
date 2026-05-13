Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7964CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8GJRk982Y2HrNKc5fBED+iVDMrlYywZENblJYokhXo=; b=RiZb2rN3Xbz1e2VMPv1FDi9sQ+
	k2w3QfkvaBjWqAdZnyGxypUgE5IsJtmrokBj3SUA95z2PVVZmJBtrFZSwyfTqCho/G7Vw700ZcJ0H
	oouwI4LXHHBgaGKxnSJU5EBJFRdWLhChJzWTrFuI3aztD4+BBObz87fd44gy1Xc3pl8BswcE4O6bj
	x3bq4UTZhF7w44oFNi7MO4jQQ+v6uy6hDRHNwLOMSDg1GihucFWkOe3/ZBtaKXTiw3iKHdy7OT0FT
	8dRtMYMdTedS4x8gQ+gSVtFimSVf+/mqLOcdgOX0XUPUKhZelpSDlnHxW3yh8AJsFN1M1te4m+f8P
	j15P/KPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WB-00000002h18-3OhU;
	Wed, 13 May 2026 13:20:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9W8-00000002gwn-3XnY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1765060121;
	Wed, 13 May 2026 13:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D35C2BCF5;
	Wed, 13 May 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778678421;
	bh=S1BvYYSJE5VcerFQf1EGsA9bOPQ2bXNuvJNtcspmZMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOOXw93GvA6+1amZ9s2I820J3rT+oiFMY8pXrlRLSph1Y05NEtpVVjTwU3pm2zIA3
	 8WLw2KH8MCz2Tjgv9MmyxPsKk/vKWWLTemrNznjiwMO/vFohGAIiMUPUhP++TekKqC
	 UjgQsTi8/RkFcTuAGVGvQ9lSHA7oBAfRnrHPYhnx7rNTy24tjiFD77+DvqyktiEyXG
	 wVznEz3Wo99Wx7BJAOVWbhhD5i5CfOcMfTQKMqryi5lg/qsBsI3QHttObxelPJRsxu
	 asYHMW+pPgFIDlY8cU2maG/pMooJ/OFAnulPM2P1DbHvJFlbX/0wYOK314MRR7HAqe
	 4ip8G5aDODncw==
Date: Wed, 13 May 2026 18:50:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Message-ID: <psbhxfox2dwdwv7m773xociaq3z5ns2ktognhu6hvoyptkoxvy@x6s4rkdq3dhj>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
 <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
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

On Wed, Apr 29, 2026 at 12:12:26PM +0530, Krishna Chaitanya Chundru wrote:
> Previously, the driver skipped putting the link into L2/device state in
> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
> low resume latency and may not tolerate deeper power states. However, such
> devices typically remain in D0 and are already covered by the new helper's
> requirement that all endpoints be in D3hot before the devices under host
> bridge may enter D3cold.
> 
> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
> the shared pci_host_common_d3cold_possible() helper to decide whether the
> devices under host bridge can safely transition to D3cold.
> 
> In addition, propagate PME-from-D3cold capability information from the
> helper and record it in skip_pwrctrl_off. Some devices (e.g. M.2 cards
> without auxiliary power) may lose PME detection when main power is
> removed, even if they advertise PME-from-D3cold support. This allows
> controller power-off to be skipped when required to preserve wakeup
> functionality.
> 

But you are unconditionally keeping the devices in power ON state even if they
are not M.2 based. We should be able to get this information from the pwrctrl
driver through an API since it has the knowledge of the power supplies. But it
can be done in a follow-up series.

I'll add TODO while applying.

- Mani

> Update the suspended flag in dw_pcie_resume_noirq() only after the PCIe
> link resumes successfully, to avoid marking the controller active when
> link resume fails.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++--------
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index c9517a348836..9e409a1909e6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -16,9 +16,11 @@
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> +#include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/platform_device.h>
>  
> +#include "../pci-host-common.h"
>  #include "../../pci.h"
>  #include "pcie-designware.h"
>  
> @@ -1218,18 +1220,14 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	bool pme_capable = false;
>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	/*
> -	 * If L1SS is supported, then do not put the link into L2 as some
> -	 * devices such as NVMe expect low resume latency.
> -	 */
> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
> +	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> @@ -1273,6 +1271,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	udelay(1);
>  
>  stop_link:
> +	pci->pp.skip_pwrctrl_off = pme_capable;
>  	dw_pcie_stop_link(pci);
>  	if (pci->pp.ops->deinit)
>  		pci->pp.ops->deinit(&pci->pp);
> @@ -1290,8 +1289,6 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (!pci->suspended)
>  		return 0;
>  
> -	pci->suspended = false;
> -
>  	if (pci->pp.ops->init) {
>  		ret = pci->pp.ops->init(&pci->pp);
>  		if (ret) {
> @@ -1313,6 +1310,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (pci->pp.ops->post_init)
>  		pci->pp.ops->post_init(&pci->pp);
>  
> +	pci->suspended = false;
> +
>  	return 0;
>  
>  err_stop_link:
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 3e69ef60165b..e759c5c7257e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -450,6 +450,7 @@ struct dw_pcie_rp {
>  	bool			ecam_enabled;
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
> +	bool			skip_pwrctrl_off;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

