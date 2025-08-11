Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D86BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vP6CLqsZ+bQou4nuw5cX24SIOOypHExNoIBs3b+sOhE=; b=tuqqCZ3k204kwP
	FljkrrEgzJyDBqjzGZ21ceWTiOGA7GOUUZTkZAwrF9YijZIxIbTlcFY1y/h/sY4sRQMjgehg88Nv2
	tk/6wQmbQ/e02BhpVaU/jF51DzvjBVPnMntT21ndeSuFlxzyhvDIvgG4TKMaxWvnQqgC12PCyRTza
	vZ36Azg3Ef2w0Pwvf+GApiqk5qyNqGu/p/h55TYrWKj7D3AdMcO4h74/SsIQM1h66qE7vs2PwdjTx
	Z5DxR5OU8iJJiGonQ2wOT8RG/KntP39mAjNLyhfGsV+ekQ0qCnGUziyfCw+ChPUkv4OW482u1ftEL
	JWtj8oTSFe9kzAPZ9NEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulb41-00000009IRM-2psf;
	Mon, 11 Aug 2025 22:32:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulb1Q-00000009I77-2W7O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 22:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 058445C0601;
	Mon, 11 Aug 2025 22:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84261C4CEED;
	Mon, 11 Aug 2025 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754951379;
	bh=9QOYu+vrn1OXsKmRJdnSIusXEkLswl7SbWENU3CK9xc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ckap1J4Q+omZepYwIU/J2wV/7RdJ7AFY1PFUKM24xsfyq07oeJdjnApgKS85eKvmd
	 JjUdT01b4YfEUHcZ8nDqeHVSWM+K0ePvHZ13DXxP2cR9mpgQ4zvWsjtdTpQXN1LnY0
	 aAvdhKdV9WinOLg8vJN5QdvWS4on+ZGN64zPeYuCl7pFR2ONpz+svT//ADPnKfVOv2
	 mTT24UKWQuCFJ3vG6hp2wVbaEtVBSvxITYGm6U7q7KMECKOcJM13qIwrhuSu6spOkx
	 TON7xU9Ll0qPZTLH1YVnoelu7hjNOgTpbHZvN8Fx4zXuueuplKmoeuXbMSXBuKw4s4
	 WrBpvqKfVqUmw==
Date: Mon, 11 Aug 2025 17:29:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: xilinx: Fix NULL pointer dereference
Message-ID: <20250811222937.GA167215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811054144.4049448-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_152940_675249_4344A5FD 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, Aug 11, 2025 at 07:41:44AM +0200, Nam Cao wrote:
> Commit f29861aa301c5 ("PCI: xilinx: Switch to
> msi_create_parent_irq_domain()") changed xilinx_pcie::msi_domain from child
> devices' interrupt domain into Xilinx AXI bridge's interrupt domain.
> 
> However, xilinx_pcie_intr_handler() wasn't changed and still reads Xilinx
> AXI bridge's interrupt domain from xilinx_pcie::msi_domain->parent. This
> pointer is NULL now.
> 
> Update xilinx_pcie_intr_handler() to read the correct interrupt domain
> pointer.
> 
> Fixes: f29861aa301c5 ("PCI: xilinx: Switch to msi_create_parent_irq_domain()")

Since this appeared in v6.17-rc1, I suppose this should be merged for
v6.17, right?  I provisionally put this on pci/for-linus for now.

What does this look like to a user?  I assume a NULL pointer
dereference in xilinx_pcie_intr_handler()?  Do you have a dmesg
snippet from hitting it?  It would be nice to include a couple lines
of that in the commit log to help users find this fix.

> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  drivers/pci/controller/pcie-xilinx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
> index f121836c3cf4..937ea6ae1ac4 100644
> --- a/drivers/pci/controller/pcie-xilinx.c
> +++ b/drivers/pci/controller/pcie-xilinx.c
> @@ -400,7 +400,7 @@ static irqreturn_t xilinx_pcie_intr_handler(int irq, void *data)
>  		if (val & XILINX_PCIE_RPIFR1_MSI_INTR) {
>  			val = pcie_read(pcie, XILINX_PCIE_REG_RPIFR2) &
>  				XILINX_PCIE_RPIFR2_MSG_DATA;
> -			domain = pcie->msi_domain->parent;
> +			domain = pcie->msi_domain;
>  		} else {
>  			val = (val & XILINX_PCIE_RPIFR1_INTR_MASK) >>
>  				XILINX_PCIE_RPIFR1_INTR_SHIFT;
> -- 
> 2.39.5
> 

