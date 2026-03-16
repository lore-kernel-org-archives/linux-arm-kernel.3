Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647A6D58B21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+MXNHD3sicekVlpoKxFy6pTl6XLuBxB5M3tHo2bUZg=; b=QVWiDctR88BROvfiE4mLPXEkOg
	pgCWEx4/Y11ECPiJd+6L1bjYdkmSx5khXc/cTcQ7nAxQeqVPXWEidkF+T2fCk5QKjvc9dXOAFaXx2
	HnAe26gBQpuP5RhkRUctwbpCydoeDYqt3EsK5hogdVN4SZIbqUcDQEho3muBeMJ065vJQrnoY1HOY
	ggo4s4Y0a5ISOcVYwk67FtYD6XauHCF2Bmg1d6tCQ6P7CPh2zjciv3UhrUUgZPVTelZgo4VBDBTEw
	JH5hWeysY3K4sI6XpZcajF4TnEAZJGA4dJw+lQ0SOzcpEwRarUlEpN/K+vseG0b8txmNpSFXdwh07
	ci24Zmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Kd-00000003KAe-0hxu;
	Mon, 16 Mar 2026 05:17:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Kc-00000003KA9-0CHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2587260008;
	Mon, 16 Mar 2026 05:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8ACC19425;
	Mon, 16 Mar 2026 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773638252;
	bh=8Kq0QOVq5TW1W5RtFpnmQ8CbqgCezmXcnXqBqPSEbhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2KdofcFE+0r8caqCK4Qc58hKhA89QcGGeZ7c30zCNgqXyqq8Kju6WpdCYZsrtb2Y
	 Vbvaf8wJWEGPcszKoBavx+1OQqtmGFh5ob8nHXjRAQAKw1BIJa0xfZhb1PyczKcXCg
	 VNlYsdQ+ri8GUJz2c+uUs/wgjlrMJQ+B6hLEoEaoloeLnHx/HoWqess5/GeWN3Caed
	 DLJb+6vpUKYj82uZ4N6YBOp0FADEVS4D9t25W2cJzRAB9NCym+LyDedAlY+6xOaGVt
	 CosZIbOipnqtzZsanhNqTgfZKMCvE6cryVwHAVdsbQc0b3HB9UDDLdYL4WL0y8PnKC
	 I+LBUEDzFUzaA==
Date: Mon, 16 Mar 2026 10:47:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v3 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Message-ID: <de4eszg7j54ijsbxaajnldm2zccxn3vcmxxty4zn5awwtq3w5h@7lisdbxc6la4>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-1-4d85dc7c2695@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-d3cold-v3-1-4d85dc7c2695@oss.qualcomm.com>
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

On Wed, Mar 11, 2026 at 03:56:46PM +0530, Krishna Chaitanya Chundru wrote:
> Add a common helper, pci_host_common_d3cold_possible(), to determine
> whether a PCI host bridge can safely transition to D3cold.
> 

Host bridge cannot be transitioned to D3Cold, it can only transition the
devices to D3Cold state. You need to reword it throughout the patch.

> This helper is intended to be used by PCI host controller drivers to
> decide whether they may safely put the host bridge into D3cold based on
> the power state and wakeup capabilities of downstream endpoints.
> 
> The helper walks all devices on the bridge's primary bus

What do you mean by 'primary bus' here?  The helper is supposed to walk through
all busses starting from the Root bus, no?

> and only allows
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
>  drivers/pci/controller/pci-host-common.c | 47 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..bff23bcdb5d032d2781d963eebe4a3fac0505517 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -106,5 +106,52 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>  
> +static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
> +{
> +	bool *d3cold_possible = userdata;
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
> +
> +exit:
> +	*d3cold_possible = false;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * pci_host_common_d3cold_possible - Determine whether a host bridge can enter D3cold

"Determine whether the host bridge can transition the devices into D3Cold"

- Mani

-- 
மணிவண்ணன் சதாசிவம்

