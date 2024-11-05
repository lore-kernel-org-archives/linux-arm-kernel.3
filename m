Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497C5D40CE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/dpj45Wj4SyIwo7i9D3SK+9GRD+edSfTLXTW4lyMZDI=; b=sVyPq4AKYNMwyG
	WgydRnKiS5WmiTgFHfQQHVQKzr39qqzhCnHkMuhnKwibs91/ds4Gv8AlpmJgCrkek9eDwAwTYz/mI
	3rBSEJK/UpsdGwhJGOMbjPp0mKmB568tGFLrsqP4ec7qXLfpNt5LJmaNdsRTIHbZ1RhnTw292KMBQ
	ChgZ5gsKUVKZ5pZ3zP/ZaiwCFhej8rksKIhfg+d9E7wRb3v8uaR53Pfzl+3jcAJ8LdT60Vzq4XZ2t
	5miGoaw97lm/FJyMixLcidiMI/LS0D+XKvbaBbe0+S3KH/UYN3UxJJEeZ1bf+6DL+oMUZDCKwsoeC
	SAsF6klSlkkPyTZNp9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Szi-000000016ZS-0lJD;
	Tue, 05 Nov 2024 23:29:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Swy-000000016I2-2a8Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC87C5C5783;
	Tue,  5 Nov 2024 23:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219AFC4CECF;
	Tue,  5 Nov 2024 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849223;
	bh=UkvquMl7XDzAUrgt8bEdxCreNSRkuPZxntXUk0Q5qT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ItX1lqbddjjJBLKfroS5uE/8N6rGlilUk0vqQmKsqt3ZQFip037N+gV6rUt8GbS4N
	 NG+xvj5Eybh67ymoaYzjRVS/MmEHcPM/56mGv7R9MkER8wwp6kruNsw7+4Ro23/iZk
	 Vl6XA1c9so009WImSIdyDnlRZTID2yj9VV9wXnT0qKTn7f2mp+Nda8rnoB/vjLLHqi
	 zJAXSQD0FQYvlHlaooc4+Cyno+w+c7XIfXStgzFov96do97p46huWe0p/YBDeJjSNr
	 cMRRthfXWLe+ZinbqnM4BIMfsY8iRHVtU5UEuewz4MvFQkxE+09zYv5yomE93b1pk/
	 EJYktAZBv6o1g==
Date: Tue, 5 Nov 2024 17:27:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kwilczynski@kernel.org, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
	frank.li@nxp.com, mani@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241105232701.GA1495103@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_152704_806423_AACF0D1D 
X-CRM114-Status: GOOD (  23.83  )
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

On Mon, Jul 22, 2024 at 02:15:13PM +0800, Richard Zhu wrote:
> The dw_pcie_suspend_noirq() function currently returns success directly
> if no endpoint (EP) device is connected. However, on some platforms, power
> loss occurs during suspend, causing dw_resume() to do nothing in this case.
> This results in a system halt because the DWC controller is not initialized
> after power-on during resume.

dw_resume() doesn't exist.  What function did you mean?

System halt?  In dw_pcie_resume_noirq()?  What causes the halt?  A
NULL pointer dereference?  A CPU hang because a read of some
controller register never completes?  Feels a little hand-wavy.

Another comment below.

> Change call to deinit() in suspend and init() at resume regardless of
> whether there are EP device connections or not. It is not harmful to
> perform deinit() and init() again for the no power-off case, and it keeps
> the code simple and consistent in logic.
> 
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index a0822d5371bc5..cb8c3c2bcc790 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -933,23 +933,23 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_ACT)
> -		return 0;
> -
> -	if (pci->pp.ops->pme_turn_off)
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> -	else
> -		ret = dw_pcie_pme_turn_off(pci);
> +	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> +		/* Only send out PME_TURN_OFF when PCIE link is up */
> +		if (pci->pp.ops->pme_turn_off)
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		else
> +			ret = dw_pcie_pme_turn_off(pci);

This looks possibly racy since the link can go down at any point.

> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
>  
> -	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -	if (ret) {
> -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -		return ret;
> +		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +		if (ret) {
> +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +			return ret;
> +		}
>  	}
>  
>  	if (pci->pp.ops->deinit)
> -- 
> 2.37.1
> 

