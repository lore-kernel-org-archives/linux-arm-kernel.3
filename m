Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF30EC1118
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uOEh8pTzrvbiLp0EENKL+eTbWRA4d4VaMNHqI/qUDUo=; b=pWqCH4XtPrBLju
	Eyv4r+iiViINkp9DfHZ9NtODMoVOxwQgQFzPw+WWI6oPMn9tasCOnQToEuRk2so91rS0+p0h+LVf8
	M8fX55kKQToG7tF4UKUUSYQhBA7ruXAvSF7nmVDxQILCBmyAynFrqi+rSTxUW/aTazq/cqbanhAUR
	f4IoasyxePZDS+TR7GL/O3vXkGvO3Qze/aL4Hv46MW1lOJO2J5N38QTUObDMGBMjEZhxU3EFrV8hK
	xYNRVahAkxM4tUQDslH4Smq2fl3GnZUJogFgJvMhGtgPWIsIVDA3byWopZrJfdkMpdvh5DlurIyoC
	/uynC1wmwBcTIoNT5Oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaNz-00000000qWx-352t;
	Mon, 23 Feb 2026 18:10:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaNy-00000000qWO-07GG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA6C140B58;
	Mon, 23 Feb 2026 18:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E68CC116C6;
	Mon, 23 Feb 2026 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771870220;
	bh=16cOUP8C9o+EwrZvc78geBBZllCsV2dgigYYBQoJhoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ge7InMPiu+LiA49+/qUlTyPFdeX/VLo2FmpjYMVekRpxG8DwIpZZLLJGHvuciBb/F
	 BiJbJRfZ3kyZVGu/ykJQJhBc/X6DN7getwKS8cmKu2D14oivJw1HQW1Q4JQdodyBbd
	 lygozEiECso5Xb8cBqTojfUQ0r1Dk5v9ZEa0Pk0BODbUW3jC6ov7L/fL30hC033jDC
	 fpLzenRyc4/7FrizehKsOF9cqmj7Ikf0+8XfVRJv84rmU4HoQigfciiXUXI7C6ZyfA
	 jjiu537s4GsdsHayFjk2RtLtInMQQYEyhHdtzO8h6kpQ3m0RoBCpgieQBWlD7nPLki
	 W6xQbOZiQTarw==
Date: Mon, 23 Feb 2026 12:10:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
	bjorn.andersson@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <20260223181019.GA3700351@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_101022_137942_282096EF 
X-CRM114-Status: GOOD (  28.25  )
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

[+cc Rafael, linux-pm]

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

This series is currently structured so it's only applicable to native
host bridge drivers, i.e., things using DT.  Is there anything that
prevents using D3cold for host bridges in ACPI systems?

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
> +exit:
> +	*d3cold_allow = false;
> +	return -EBUSY;
> +}
> +
> +/**
> + * pci_host_common_can_enter_d3cold - Determine whether a host bridge may enter D3cold
> + * @bridge: PCI host bridge to check
> + *
> + * Walk downstream PCIe endpoint devices and determine whether the host bridge
> + * is permitted to transition to D3cold.
> + *
> + * The host bridge may enter D3cold only if all active PCIe endpoints are in
> + * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from
> + * D3cold. Inactive endpoints are ignored.
> + *
> + * Return: %true if the host bridge may enter D3cold, otherwise %false.
> + */
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> +{
> +	bool d3cold_allow = true;
> +
> +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
> +
> +	return d3cold_allow;
> +}
> +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
> +
>  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
>  
>  struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>  	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> +
> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
>  #endif
> 
> -- 
> 2.34.1
> 

