Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2363EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEqsPU+rMA7e14yyYpUfODlHdxfwermiKJBSFHBpi4A=; b=QLn2O/GlLi2n+ti9rh/D5qLZeP
	G+tFAM4qhNF9BPQPwb7ECHielgNc14bGbRuRXFamg4bpbQFDG78KY6mR5cdNIzYGzZLCvcF+Yf4MM
	h2LDAdbalRacY6et4B7ES4U1nGJM5gF/1bXFz3xmumjUp4EvYTDYb7NrP5f1XMKI9Y+H8fBq7kBDE
	GIeGbRDmoM5GrQXabfgf1nOVBBZXXXiRvPqksT/KQX9n41UoVISw9fYn5c5OI+VWqCFziIvd54fbM
	Ql0qTKseYgd/4ea3kftIksfY6kQGsE2OL8BfRHfjnZSAJG+5+9RUCUU8FeyeUzNvp27ec2DmbbjOE
	paBqby8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3MV-000000016N0-2zBj;
	Thu, 05 Mar 2026 07:43:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3MT-000000016Md-49h8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 095E361340;
	Thu,  5 Mar 2026 07:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1253C116C6;
	Thu,  5 Mar 2026 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696588;
	bh=Q4hR08jwk8NYDY7pDYXXyrQ+TK/dbIOE1VyLlysisSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIzvDUADoi0KCGyPVVuICFuXDFQEedvvlub8sDezUZrhBcsWFbq8vMpqckKgJvz+j
	 zaxMxIfvYbmFvhLEANJ1hqA844JfUV094ICsdl6COHyjksvnYZNCSAsk3xqodhO+FD
	 nJBN2ab+67h8qBDirUbXPIlb/fT/WJmme2S7gu2V3j0RbHQKKu+2LJT+f7wvoXmnHl
	 645NFwdMhlPACKWsy+QJPfr0PoRQELmZKd5NnwUZ7iXlSgM4eWWKsoE76fpNroMSwD
	 OhuklWjz2pLYBg7QsgFUHhsafcsfQ606ypYOG2kf2/gzkXhh/rS0kafYpYNkbqSsQS
	 u26XVC7SkvTxw==
Date: Thu, 5 Mar 2026 13:12:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <3fnnuxwpvpk6abtjtlp74synz3fk4cbobub27aqvtdytdx4wtd@gknztr4cwalg>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
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

On Tue, Feb 17, 2026 at 04:49:06PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> whether a PCI host bridge can safely transition to D3cold.
> 
> This helper is intended to be used by PCI host controller drivers to
> decide whether they may safely put the host bridge into D3cold based on
> the power state and wakeup capabilities of downstream endpoints.
> 
> The helper walks all devices on the bridge's primary bus and only allows
> the host bridge to enter D3cold if all PCIe endpoints are already in
> PCI_D3hot. This ensures that we do not power off the host bridge while
> any active endpoint still requires the link to remain powered.
> 
> For devices that may wake the system, the helper additionally requires
> that the device supports PME wake from D3cold (via WAKE#). Devices that
> do not have wakeup enabled are not restricted by this check and do not
> block the host bridge from entering D3cold.
> 
> Devices without a bound driver and with PCI not enabled via sysfs are
> treated as inactive and therefore do not prevent the host bridge from
> entering D3cold. This allows controllers to power down more aggressively
> when there are no actively managed endpoints.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0273a349334071013c 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
> +{
> +	bool *d3cold_allow = userdata;

d3cold_possible

> +
> +	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
> +		return 0;
> +
> +	if (!pdev->dev.driver && !pci_is_enabled(pdev))
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D3hot)
> +		goto exit;
> +
> +	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
> +		goto exit;
> +
> +	return 0;

Newline

> +exit:
> +	*d3cold_allow = false;

Newline

> +	return -EBUSY;

I think -EOPNOTSUPP should be returned here.

> +}
> +
> +/**
> + * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold

Since PCI core already has pci_bridge_d3_possible() API, we should try to be in
sync by calling this API as pci_host_common_d3cold_possible().

> + * @bridge: PCI host bridge to check
> + *
> + * Walk downstream PCIe endpoint devices and determine whether the host bridge
> + * is permitted to transition to D3cold.
> + *
> + * The host bridge may enter D3cold only if all active PCIe endpoints are in

s/may/can

> + * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from

Remove %

> + * D3cold. Inactive endpoints are ignored.
> + *
> + * Return: %true if the host bridge may enter D3cold, otherwise %false.
> + */
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> +{
> +	bool d3cold_allow = true;
> +
> +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);

s/pci_host_common_check_d3cold/__pci_host_common_d3cold_possible

- Mani

-- 
மணிவண்ணன் சதாசிவம்

