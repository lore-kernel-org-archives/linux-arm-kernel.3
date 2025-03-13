Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEF5C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bCA3Qv0qYffYQlZSnpLb3/a0rUhfEcbbXPnG9t6obpA=; b=0PAWloF4/N/GbE
	k4oS5xi2VJ2Sasl0AIPqOuyjI1Qsy40HGX6gp287P4sQAj++IgnIF+Mv1WaSXY3G8zIbHw+2yplkm
	PbHYsWhEx28BaRW37i7no15ERPKd8fjpfAnnx+0JejdoNgdVuCw+xl42JwvHohU9LZKYI55ekZ5Qw
	9w45iTB8HRwoXMIhbT98dUHftuA2BW3yryIvGGKXBRoGWS3mL0qV0cDbqzOmZljf/GIMIvIo0XDsd
	1e1ElpGI7fWVYriBmItSyRD2b0H9NtRdQ2ER3K4rB3TiUgcCSNlPqqysdUT5WIE7rxhHUKrKV+Unm
	zAKAgEWRjAdSnQElIYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoB1-0000000CJdr-0DcT;
	Thu, 13 Mar 2025 19:25:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tso8u-0000000CIwf-3dG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 19:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AD235C56B8;
	Thu, 13 Mar 2025 19:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA799C4CEDD;
	Thu, 13 Mar 2025 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741893776;
	bh=TPxMt3+3ya/xiakX1ZCCMTSMgWKwulEPWUUTcrGsWsg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PwAdaVuI88bABqmdfBg5C1kTVcvgUmvX7VqesS1VWd0Ud8riwvyk+HvI2t4gYSCsF
	 d41BZvSxcnz1lQAmsDr3hBfnCdaZHzh0r2qhv+n/iIj9GqZ5cKXS0NrVM8ObiV0fPn
	 m9DkUeXjo6ZcsFiHos9vgjfyS5OHJSUWozwiIoR2A6gVYnsQqooIAl+jBHwyBpBhQ+
	 7YByORQoccpAEsbytgrm9nX1z2sov8VX73UEfGXFO9FUSeNYhAcIdPxls9tndIA7+m
	 T6QCBwUA6MqW8XpKg1RxqeBANdPXBbueMGPTRW7Bx+1GLuXrlaXZtOafVvGSzZWZIa
	 GQqLBeCwkR3Yw==
Date: Thu, 13 Mar 2025 14:22:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 04/11] PCI: dwc: Move devm_pci_alloc_host_bridge() to
 the beginning of dw_pcie_host_init()
Message-ID: <20250313192254.GA745234@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-pci_fixup_addr-v11-4-01d2313502ab@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_122256_943942_9BEA63EF 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Mar 13, 2025 at 11:38:40AM -0400, Frank Li wrote:
> Move devm_pci_alloc_host_bridge() to the beginning of dw_pcie_host_init().
> Since devm_pci_alloc_host_bridge() is common code that doesn't depend on
> any DWC resource, moving it earlier improves code logic and readability.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index c57831902686e..52a441662cabe 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -452,6 +452,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	raw_spin_lock_init(&pp->lock);
>  
> +	bridge = devm_pci_alloc_host_bridge(dev, 0);
> +	if (!bridge)
> +		return bridge;

This returns NULL (0) where it previously returned -ENOMEM.  Callers
interpret zero as "success", so I think it should stil return -ENOMEM.

I tentatively changed it back to -ENOMEM locally, let me know if
that's wrong.

> +	pp->bridge = bridge;
> +
>  	ret = dw_pcie_get_resources(pci);
>  	if (ret)
>  		return ret;
> @@ -460,12 +466,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (ret)
>  		return ret;
>  
> -	bridge = devm_pci_alloc_host_bridge(dev, 0);
> -	if (!bridge)
> -		return -ENOMEM;
> -
> -	pp->bridge = bridge;
> -
>  	/* Get the I/O range from DT */
>  	win = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
>  	if (win) {
> 
> -- 
> 2.34.1
> 

