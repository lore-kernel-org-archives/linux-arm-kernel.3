Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F85F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVTbYNSjOxxg+4kmMtT5v5UAYCoQXAy793YoUjYD1Sc=; b=TsaBhF8IVWSFeREBE1StQmoFan
	c5YUQpotUPEveFt59ZujE1ULtNtqCbBtDBstb+6CxL30Ls52odWS7OuDTdol8QawszQWpOgmENxvj
	WVZFSgKxe+9YXEa21V/1RRVLaHqOGdbNqM4rObGpU28D8XzDIUQ7SxosPOAxX9r4bfr//49oK35po
	nC5aeSoYrhcP6+64Edq25jln8RQGlxMovskO6YK/K7rcrgxxaxbL9FPXjg7hSvf7A5yoGln3vK7nH
	gaLFgvrlSg2q/ZsyyZeK4atPw5LA0Zm2K4ezpqXv58SOncfAfAlpMNCqcrPzcm959EnEuY2PEBmtW
	47AsmfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJn1-0000000G1I1-0Ypu;
	Mon, 13 Apr 2026 16:05:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJn0-0000000G1Hn-1nur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C41161336;
	Mon, 13 Apr 2026 16:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BB9C2BCB0;
	Mon, 13 Apr 2026 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776096329;
	bh=VC6YVG4xvB3uWGofxiLkJwCx9Wf3xHXSXBXwyzXleEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8B1y4yZHPpZVer24NmGLVfYVkQwgxrxXm0Nk6xI1CS6eBAXdh6hJ/7IwwQ12orTC
	 wnzBYGDs6koLzdqCLnYIb5j5M0ubQqu6hMhO/524XuH57XXdqQ3j+kSm3e1ZsqoKTQ
	 F0ThPnDC7ew8M34bBmx2zRe16FGg8d8MuG+9T+hvK3cTHWULdAAPxiRmH6GszB766N
	 IDn7YZ6MPRKWLvAh/4/JVsYALVdyTgLN7NkWHNdpQARJgMbjJJpJ0QxkNyoOpm1Cud
	 SUUlewb+v/DooQ8yb9+AZqgnwFifLJ+/jFf7KKQtn3wTGKwACjUL6fL52OA6NhCaQq
	 J42R3DzzwavtA==
Date: Mon, 13 Apr 2026 21:35:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, will@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, vidyas@nvidia.com, 
	Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: host-common: Request bus reassignment when not
 probe-only
Message-ID: <d3xtqtnhki7qxebbnqkwezdu3g4ln4q3l5t56ecy6k6sq2v5oe@3uwp5rsrv7ci>
References: <20260410142124.2673056-1-rkannoth@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410142124.2673056-1-rkannoth@marvell.com>
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

On Fri, Apr 10, 2026 at 07:51:24PM +0530, Ratheesh Kannoth wrote:
> pci_host_common_init() is used by several generic ECAM host drivers.
> After PCI core changes around pci_flags and preserve_config, these hosts
> no longer opted into full bus number reassignment the way they did
> before.
> 

So pci_assign_unassigned_root_bus_resources() only assigns the unclaimed
resources, and do not reassign the bus numbers. Probably the offending commit
confused PCI_REASSIGN_ALL_BUS with PCI_REASSIGN_ALL_RSRC.

> When PCI_PROBE_ONLY is not set, add PCI_REASSIGN_ALL_BUS so
> pci_scan_bridge_extend() takes the reassignment path: bus numbers can be
> assigned from firmware EA data (e.g. pci_ea_fixed_busnrs()). Skip the
> flag in probe-only mode so existing assignments are not overridden.
> 
> CC: Bjorn Helgaas <helgaas@kernel.org>
> CC: Vidya Sagar <vidyas@nvidia.com>
> Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
> Link: https://lore.kernel.org/netdev/adcXzcz2wWJFw4d7@rkannoth-OptiPlex-7090/
> Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index d6258c1cffe5..860783553cca 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -68,6 +68,10 @@ int pci_host_common_init(struct platform_device *pdev,
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> +	/* Do not reassign resources if probe only */

This comment is still wrong and could be the source of confusion that lead to
the bug. PCI_REASSIGN_ALL_BUS only reassigns the bus number, not resources. So
please reword it.

> +	if (!pci_has_flag(PCI_PROBE_ONLY))
> +		pci_add_flags(PCI_REASSIGN_ALL_BUS);

This forces bus number reassignment for all platforms whose DT doesn't provide
'linux,probe-only' property. Maybe that's OK given that this was the behavior
before 7246a4520b4b. 

- Mani

-- 
மணிவண்ணன் சதாசிவம்

