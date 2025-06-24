Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F2DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nHGT8Vj0fpnxjALgDAfCT0aQ1Q1r4nSqiXPIo+v18Gc=; b=NEYEItWGv7SOlo
	wnhriIL+BgeIRWZKbMzuCmq4YVya3D3m9ySeHV6PMlegqg3l6cjNlXGZPx+S5nvAJ66wiJmhGF+wG
	iH5GQlKeAZ6g6Lfld9zJUwlU05rPkf2RqfsaCejhKmvxiqPBKzuA2iEtr3ub4gMqGDkocyALkOFvw
	jg5eM9X5J1y8I1acZ98NaPbkfydaAbzg/FwFc/V7FcEmCdeKWj2Xbndpgbjg9oYHmWJvUZes7IJEN
	BU+foLB6US9nXDa7djtZy5xKfzAf6OyKTdel+XJJVY93cUCfUK0iRvTiAlqgF6AQtaJGVbqaILNiM
	aiK/ZcQrSvPwwaL7Bzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCWB-00000007225-1f4a;
	Tue, 24 Jun 2025 22:53:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUC7Z-00000006zgk-3F74;
	Tue, 24 Jun 2025 22:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1762643660;
	Tue, 24 Jun 2025 22:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82D4C4CEE3;
	Tue, 24 Jun 2025 22:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750804084;
	bh=jXEq0Zryo5iWhdDOObD3sH++As83oQggjSwqxjEgGGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iA0eWhzZtQm8KYqXOu60xOUYe58rPuGOKbOApXGwGahTm/Oj78klw/cT8mRksPPQA
	 tR6nH3Xx8P58UK0AUIedLQmj9kFsO962U0IZGcTjLIWSkls7nQaQo4+VVJgfY3Ro5L
	 M+gEYg4qFsa++TmbjGysA9o7B1arJEYNUNm7rAVv0J7NC6cuSdm55gq0Ew7oKBvesc
	 xa7tbWPTAwNItJckvmCgVUjyqeOYmbpUB6s7+EjRrwAhR6pc7m8rLVw4cRWyWNR5W/
	 VII/IFBXF0xndSwav8RZFZ9m6SVqH00P8EH5cmkvDqvy6X76eiiVRXKfsL3BGXu3/w
	 H24EtUZCa3sEg==
Date: Tue, 24 Jun 2025 17:28:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Zyngier <maz@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: host-generic: Set driver_data before calling
 gen_pci_init()
Message-ID: <20250624222803.GA1549866@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <774290708a6f0f683711914fda110742c18a7fb2.1750787223.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_152805_853405_85633BBD 
X-CRM114-Status: GOOD (  18.89  )
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

On Tue, Jun 24, 2025 at 07:50:10PM +0200, Geert Uytterhoeven wrote:
> On MicroChip MPFS Icicle:
> 
>     microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
>     microchip-pcie 2000000000.pcie: Parsing ranges property...
>     microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000368
>     Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000814f1000
>     [0000000000000368] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
>     Oops [#1]
>     Modules linked in:
>     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-icicle-00003-gafc0a570bb61 #232 NONE
>     Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>     [...]
>     [<ffffffff803fb8a4>] plda_pcie_setup_iomems+0xe/0x78
>     [<ffffffff803fc246>] mc_platform_init+0x80/0x1d2
>     [<ffffffff803f9c88>] pci_ecam_create+0x104/0x1e2
>     [<ffffffff8000adbe>] pci_host_common_init+0x120/0x228
>     [<ffffffff8000af42>] pci_host_common_probe+0x7c/0x8a
> 
> The initialization of driver_data was moved after the call to
> gen_pci_init(), while the pci_ecam_ops.init() callback
> mc_platform_init() expects it has already been initialized.
> 
> Fix this by moving the initialization of driver_data up.
> 
> Fixes: afc0a570bb613871 ("PCI: host-generic: Extract an ECAM bridge creation helper from pci_host_common_probe()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to pci/for-linus for v6.16, since afc0a570bb613871 appeared in
v6.16-rc1.

> ---
> Notes:
>   1. Before, driver_data was initialized before calling
>      of_pci_check_probe_only(), but the latter doesn't rely on that,
>   2. drivers/pci/controller/plda/pcie-microchip-host.c seems to be the
>      only driver relying on driver_data being set.
> ---
>  drivers/pci/controller/pci-host-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index b0992325dd65f0da..b37052863847162d 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -64,13 +64,13 @@ int pci_host_common_init(struct platform_device *pdev,
>  
>  	of_pci_check_probe_only();
>  
> +	platform_set_drvdata(pdev, bridge);
> +
>  	/* Parse and map our Configuration Space windows */
>  	cfg = gen_pci_init(dev, bridge, ops);
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> -	platform_set_drvdata(pdev, bridge);
> -
>  	bridge->sysdata = cfg;
>  	bridge->ops = (struct pci_ops *)&ops->pci_ops;
>  	bridge->enable_device = ops->enable_device;
> -- 
> 2.43.0
> 

