Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F91D3F076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaXGWUlQt5aWXpN/gwz11v6r56272vTBmwSk7M3j6FI=; b=1ZBYzIuL05ptuoWvbqib0gjkTs
	yDIoETxQFQ4FhZgPnqTM8QsEcY1gZlU6Z8IoAl7fDr5oHbH80wC0UKFNx8BQsQ2znjK0nfT7lzemv
	ryzlFEZ/aUIBZox69AzrFffHHTaejkuMl+BOm8hH/Pl+ZJw7nMNNQ1zhl8oNsEgSYyAKtDa3qkhsB
	5CQSRTqdPIBxsaJa9/Zmd/wDuOxB6L8koqqpXg4CUsuMdkY3UeQsUvXrYK+vXIVkqTRmy4PtG3YOB
	gwzBdKR2He6V+Sp0FcKrh3ZEI/dVGwPXIn9josIdlYaUHV3f81UyAIIrLEy7Y4W195lIN9t+GYQKs
	0MO6+fDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6pN-0000000GCjB-3Fi7;
	Wed, 28 Jan 2026 14:47:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6pM-0000000GCiU-3con
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEDD860097;
	Wed, 28 Jan 2026 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29CDC4CEF1;
	Wed, 28 Jan 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611647;
	bh=poIiBnPQsoRCMsAh2wEVBSolxetqZX8EqXjaVucmFcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vN3n21+QoojivHeZ/EmZbanlbJy14SRyElmm6rdhBef5w4QUV065wzTrTnDE7sKzH
	 Lb78OKbw8Pj/ai4uWxYha5z5oBRhqhD9QVXlhtr80EZV4fPHI4jKKFVN3A2u8EWpEN
	 43BeuFIO8SIxUEeL2/QRI4uGvwIdINqIZG10+ma1ZaTzL3/y9ueGNpnEDy7kCbSYRT
	 x5PPFf7OemVW7EgD2Bvi0Qsnei4HaiTR+A+1Wb4u4EmhFrk1iMlZCqIqpBImoLFlby
	 mp9B3Q073W8+PdyzCf2YEqEU/0SD/+YOZgPrbBVG9msd+pmonngT6V01YrPIWiBa/+
	 vNTHD9QPhn2bQ==
Date: Wed, 28 Jan 2026 08:47:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
Message-ID: <qg7hyicnyqcoi7jktalyfecfgxnv4elilmmmfkzvb2jbzrhisd@bq3pngh5n2a7>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
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

On Wed, Jan 28, 2026 at 05:10:43PM +0530, Krishna Chaitanya Chundru wrote:
> Add pme_turn_off() support and use DWC common suspend resume methods
> for device D3cold entry & exit. If the device is not kept in D3cold
> use existing methods like keeping icc votes, opp votes etc.. intact.
> 
> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
> in the controller.
> 
> Remove suspended flag from qcom_pcie structure as it is no longer needed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 114 ++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
[..]
> @@ -2016,53 +2030,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>  	if (!pcie)
>  		return 0;
>  
> -	/*
> -	 * Set minimum bandwidth required to keep data path functional during
> -	 * suspend.
> -	 */
> -	if (pcie->icc_mem) {
> -		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> -				ret);
> -			return ret;
> -		}
> -	}
> +	ret = dw_pcie_suspend_noirq(pcie->pci);
> +	if (ret)
> +		return ret;
>  
> -	/*
> -	 * Turn OFF the resources only for controllers without active PCIe
> -	 * devices. For controllers with active devices, the resources are kept
> -	 * ON and the link is expected to be in L0/L1 (sub)states.
> -	 *
> -	 * Turning OFF the resources for controllers with active PCIe devices
> -	 * will trigger access violation during the end of the suspend cycle,
> -	 * as kernel tries to access the PCIe devices config space for masking
> -	 * MSIs.
> -	 *
> -	 * Also, it is not desirable to put the link into L2/L3 state as that
> -	 * implies VDD supply will be removed and the devices may go into
> -	 * powerdown state. This will affect the lifetime of the storage devices
> -	 * like NVMe.
> -	 */
> -	if (!dw_pcie_link_up(pcie->pci)) {
> -		qcom_pcie_host_deinit(&pcie->pci->pp);
> -		pcie->suspended = true;
> -	}
> +	if (pcie->pci->suspended) {

I think this is okay for now, but I'd prefer changing the return value
of dw_pcie_suspend_noirq() to indicate if it did stop the link or not
(two different success values) - rather than deriving that information
by peeking into the dw_pcie struct and conclude that
dw_pcie_suspend_noirq() did reach the end.

> +		ret = icc_disable(pcie->icc_mem);
> +		if (ret)
> +			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
>  
> -	/*
> -	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> -	 * Because on some platforms, DBI access can happen very late during the
> -	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> -	 * error.
> -	 */
> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>  		ret = icc_disable(pcie->icc_cpu);
>  		if (ret)
>  			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>  
>  		if (pcie->use_pm_opp)
>  			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> +	} else {
> +		/*
> +		 * Set minimum bandwidth required to keep data path functional during
> +		 * suspend.
> +		 */
> +		if (pcie->icc_mem) {
> +			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
> +			if (ret) {
> +				dev_err(dev,
> +					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +
> +		/*
> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> +		 * Because on some platforms, DBI access can happen very late during the
> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> +		 * error.
> +		 */
> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +			ret = icc_disable(pcie->icc_cpu);
> +			if (ret)
> +				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
> +					ret);
> +
> +			if (pcie->use_pm_opp)
> +				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> +		}
>  	}
>  	return ret;
>  }
> @@ -2076,20 +2088,30 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>  	if (!pcie)
>  		return 0;
>  
> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +	if (pcie->pci->suspended) {
>  		ret = icc_enable(pcie->icc_cpu);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
>  			return ret;
>  		}
> -	}
>  
> -	if (pcie->suspended) {
> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> +		ret = icc_enable(pcie->icc_mem);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);

I think you should revert icc_enable(pcie->icc_cpu) here, to avoid
leaving the bus voted for with the PCIe controller resume aborted.

> +			return ret;
> +		}
> +		ret = dw_pcie_resume_noirq(pcie->pci);
>  		if (ret)

And Both icc_cpu and icc_mem here.

Regards,
Bjorn

>  			return ret;
> -
> -		pcie->suspended = false;
> +	} else {
> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +			ret = icc_enable(pcie->icc_cpu);
> +			if (ret) {
> +				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
>  	}
>  
>  	qcom_pcie_icc_opp_update(pcie);
> 
> -- 
> 2.34.1
> 
> 

