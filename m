Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93543C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFJM6M8jN8MQZ/aRTqYrMcr1N10gngLIflf2XW/jHB8=; b=biEvV/xIP1HujGVjcRCI1FySUG
	DY9USEYrVcfkDFT+L7N1gJKTKE+ohMqbULYxpZqZEA9SbrYqrVtZMEMSLs+gNMZ0RQE4jEubD/b8E
	Av72SGOb3/5s51RJB63pDNtT6tAu3l/r8LySmxUjLx8e+uj8uBT1NKmhmYK/NDFVWI9XsnEcDrP2k
	K5c9Uq/JuaZriZVYqLunKzLNBDVCbbiFWayrMb+18qQPdXmY5yPJLyhY4tzShFg7ZmZtw39awcb/t
	BGaqKBMiL7TqgPno/OVb5y4364+IJiBOvzrSjOuzuhkxDNbYNcfXpHv2p//WfJ/7xqcHDASEuZ3Qy
	4sjDBIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsgr-0000000Dqa6-0ncg;
	Wed, 15 Jul 2026 06:01:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsgq-0000000DqZz-1LBh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:01:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89DB5600FF;
	Wed, 15 Jul 2026 06:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CF71F000E9;
	Wed, 15 Jul 2026 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095311;
	bh=VFJM6M8jN8MQZ/aRTqYrMcr1N10gngLIflf2XW/jHB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/E9Eeh2PUzet22YI8O88Iw5baFBKYDNDBG8ReHikoGDDf2ttcBLGE6cmxdzeE8py
	 LZaaNONaEvRNbIpW5V/RXI1rOH9hKKOchXK33MNwRLRRv6T0PDOsWPl6VFrmQHHNdT
	 MBTy3T4g8Zh5gq+0SmKsvGhF2qo9rQ+gExXfy/wl7kmsj1ZRffdQx+AnbbT6GYYpU2
	 2Pxd/ab1CF8RbHYTb3bunLB3gLT3OC6Gndf4VNqJ7tcuYeUZxRxbw/C2geuMiHuw+p
	 N0WH9Q3lH8YNxUheGihosUINGDxpPScQ74iYB1KPzXnOmrH6mj63Z0B7M5GJlTdWUN
	 0fnG5tzeQaIMA==
Date: Wed, 15 Jul 2026 08:01:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, vigneshr@ti.com, s-vadapalli@ti.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	mpillai@cadence.com, unicorn_wang@outlook.com, me@ziyao.cc, 18255117159@163.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com
Subject: Re: [PATCH v2] PCI: cadence: skip the link polling when endpoint not
 connected
Message-ID: <bwaho225txqny2p24nyhezmnc4r3yv3yckurvz2gtzxpbeqs5l@tx4mwgblp65n>
References: <20260623095148.721206-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623095148.721206-1-a-garg7@ti.com>
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

On Tue, Jun 23, 2026 at 03:21:48PM +0530, Aksh Garg wrote:
> cdns_pcie_host_wait_for_link() polls on link-up for 10 retries with a
> delay of 90-100ms each (~1 second). A call to cdns_pcie_host_link_setup()
> during the resume operation blocks the resume operation unnecessarily for
> ~1s even when no endpoint device is connected.
> 
> Add link_down_no_hotplug flag to track link state across suspend/resume
> cycles (for the platforms that do not support hotplug). If link was
> down before suspend in such platforms, skip the expensive polling in
> resume since no endpoint was present.
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
> 
> Changes from v1 to v2:
> - Updated the flag name from 'skip_link_polling' to 'link_down_no_hotplug'
> 
> v1: https://lore.kernel.org/all/20260605071922.1724499-1-a-garg7@ti.com/
> 
>  drivers/pci/controller/cadence/pci-j721e.c             | 5 +++++
>  drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 3 +++
>  drivers/pci/controller/cadence/pcie-cadence-host.c     | 3 +++
>  drivers/pci/controller/cadence/pcie-cadence.h          | 3 +++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index bfdfe98d5aba..48db7a6cf754 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -686,6 +686,11 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
>  	struct j721e_pcie *pcie = dev_get_drvdata(dev);
>  
>  	if (pcie->mode == PCI_MODE_RC) {
> +		struct cdns_pcie_rc *rc = cdns_pcie_to_rc(pcie->cdns_pcie);
> +
> +		/* If link is down before suspend, skip polling in resume */
> +		rc->link_down_no_hotplug = !j721e_pcie_link_up(pcie->cdns_pcie);
> +
>  		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
>  		clk_disable_unprepare(pcie->refclk);
>  	}
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
> index 0f540bed58e8..31cf50cff8f8 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
> @@ -301,6 +301,9 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc *rc)
>  		return ret;
>  	}
>  
> +	if (rc->link_down_no_hotplug)
> +		return 0;
> +
>  	ret = cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
>  	if (ret)
>  		dev_dbg(dev, "PCIe link never came up\n");
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 0bc9e6e90e0e..50abc657a871 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -352,6 +352,9 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  		return ret;
>  	}
>  
> +	if (rc->link_down_no_hotplug)
> +		return 0;
> +
>  	ret = cdns_pcie_host_start_link(rc, cdns_pcie_link_up);
>  	if (ret)
>  		dev_dbg(dev, "PCIe link never came up\n");
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 574e9cf4d003..1561022c1a8b 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -117,6 +117,8 @@ struct cdns_pcie {
>   * @no_inbound_map: Whether inbound mapping is supported
>   * @quirk_broken_aspm_l0s: Disable ASPM L0s support as quirk
>   * @quirk_broken_aspm_l1: Disable ASPM L1 support as quirk
> + * @link_down_no_hotplug: Skip link polling during resume on no-hotplug
> + *			  platforms when link was down before suspend
>   */
>  struct cdns_pcie_rc {
>  	struct cdns_pcie	pcie;
> @@ -131,6 +133,7 @@ struct cdns_pcie_rc {
>  	unsigned int            no_inbound_map:1;
>  	unsigned int            quirk_broken_aspm_l0s:1;
>  	unsigned int            quirk_broken_aspm_l1:1;
> +	unsigned int		link_down_no_hotplug:1;

If the goal of this flag is to convey the information that the platform doesn't
support hotplug, then it should be called 'no_hotplug'. Skipping the polling
during LDn is the usecase.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

