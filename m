Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F17EDEBF6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nl0xQMQW9nNsLtGMpecUcETgmMdqXI+PnDpH91pFv6U=; b=rpwiWlaan0H+z4
	YeSEfS8nH4mieHsRy+UtQ5YeXqCYwYj2poUDtHMzl2ElyriX2pcNdc5HcydM+TKxw9GSKCjehY1z8
	wDrgezrZa84i+PmriSyyNrqwk5GLvHvr+FVOK0DaxRu3p+3ky5s+5hAdkdzSINkLt8hfpW0LW3KRI
	MYQ3lS8U6Xi2okevWm7WcTFcBTdOODQ28ki20jQQLuwTNd7lvlYwTE9mb+bXymBo54SSYV716fjqI
	hH6/UzdbaenfoKtgdbxJQzVmM6QIT5rGvrH2uGs4317leP3Xe6BAP5SMAIWAFNA2h4GxSAcUrsiHO
	lL0FDcFCW/aQ93dHThIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXQn-0000000FzdB-14El;
	Tue, 03 Mar 2026 21:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxXQk-0000000Fzcf-3Sdm;
	Tue, 03 Mar 2026 21:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 678AC4387B;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16850C116C6;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772573845;
	bh=M78l9HR2fJaBwC1AYnZPHhHEUHYVAhTg67OYlSD26Fg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LB3wcnKAGww15fEsToiIVqeqsdTq+g32I0+Qg7uSECBZHRb37F2PVjMiJ06rx8CY3
	 cKTEXLVavlUWASAjzQK1XUWsJSBR2OCvi90rREZB+nZtBy2qchVeqFNXazeXLkWwtv
	 hWOZvVF8U0LL1MsXABPutxqriK0F40EtzFdMDyD0SNBD6vPMwGqLhh0UH82XLmvdR8
	 dgc/aFqS0YBn/wlnBi6cTRuGZlj25DywRIZwZ2WUhJzO7L9imj6k8E9OJP5751hh6E
	 D2V9E2ITwu83htBgYekdOnYr1kAwmVcwIjJBrihSE66lAnCiixaSuE3DBNoSfURZcN
	 X+MpsT9tg7C6w==
Date: Tue, 3 Mar 2026 15:37:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <20260303213723.GA4075286@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-8-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_133726_887229_691A5695 
X-CRM114-Status: GOOD (  16.30  )
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

On Tue, Mar 03, 2026 at 07:09:47PM +0000, Caleb James DeLisle wrote:
> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> registers unconditionally. If the registers are hardwired to zero
> (not implemented), both base and limit will be 0. Since (0 <= 0) is
> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> gets created.
> 
> pci_read_bridge_windows() already detects unsupported windows by
> testing register writability and sets io_window/pref_window flags
> accordingly. Check these flags at the start of pci_read_bridge_io()
> and pci_read_bridge_mmio_pref() to skip reading registers when the
> window is not supported.

BTW, I'm still interested in the details of how we got here.  It
shouldn't be too unusual to have a bridge without an I/O window or
maybe even without a prefetchable (64-bit) memory window.

> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/probe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..4eacb741b4ec 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>  	unsigned long io_mask, io_granularity, base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->io_window)
> +		return;
> +
>  	io_mask = PCI_IO_RANGE_MASK;
>  	io_granularity = 0x1000;
>  	if (dev->io_window_1k) {
> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>  	pci_bus_addr_t base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->pref_window)
> +		return;
> +
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> -- 
> 2.39.5
> 

