Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6CCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3YrQycCMssUUaW1PgEx2hgbBLYtuMZ7xWwhbHkNepc8=; b=eFilyknDG/g0qw
	O/E2lEKp3NyI/cxK6+LCaWFD/UrlYPCMZWvIg+0IzfvVnY1ZqoQEts/wE99xbI3VKc9nlIGHRL1ks
	Jyg57UajXILV2ft+ZV/G6XwwXffD/QqOa/abx3FsIdADc65DLz6dx5iKKHvSxbewt/O1zEBfWnxjC
	9JnMcieX0rI9rhNyo7vT3xQMR+rM5gUVwCCrTCsj8KNOVBnAvibri5CoRBSzsTeeSRltyLPi1D8yS
	tFbBE+EYjReMQ+/E2spakMb4dodI0zM4KdYDUtxMI4UaTnfmsVeOV8Wf7GKmB8oH8JN2bSHkhPTHz
	H3RHAQ8hUIK7SRlfbqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBT-00000004oZi-0Qd5;
	Tue, 09 Sep 2025 06:50:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhn4-00000001yOP-0ICg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACA9A60051;
	Mon,  8 Sep 2025 19:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A808C4CEF1;
	Mon,  8 Sep 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757360676;
	bh=o/DTnsN33P7EIb8svR5PswkHMaTvVF4k4Q5vDtNgxPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RBIgm7ACPdwtYByH86t0ZrIf7ELUqsMHKrWCcR4cWQo8QslgZ2EY3frdu5RHNh46M
	 xLGb2Qpm+8GEUZSMugDPXMOzcRiETPeZ1bYHRUiMbNy+gifYsEhpvz8qFFWIMaQUCz
	 GCZuxnIrsZZTCv6fHTr0sWvJLDayjJ1A51t4+fJc9M/MJVML53uNE7yFdPjgek5nuW
	 26QqiwXToR5EmFiLowT/xFfnDI+Vl941ArQcDnvQdTTclwoz04d2f2Z8yxGGirWUeh
	 KBRoGNMR8cAs8UpEP5mCauIussB0K++mPeoa1AeVN9MvBgM7u2oISWg5Q+50GiIUFb
	 yTj89j0efGncA==
Date: Mon, 8 Sep 2025 14:44:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH v2] PCI: mvebu: Fix use of for_each_of_range() iterator
Message-ID: <20250908194434.GA1454201@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907102303.29735-1-klaus.kudielka@gmail.com>
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

On Sun, Sep 07, 2025 at 12:21:46PM +0200, Klaus Kudielka wrote:
> The blamed commit simplifies code, by using the for_each_of_range()
> iterator. But it results in no pci devices being detected anymore on
> Turris Omnia (and probably other mvebu targets).
> 
> Issue #1:
> 
> To determine range.flags, of_pci_range_parser_one() uses bus->get_flags(),
> which resolves to of_bus_pci_get_flags(). That function already returns an
> IORESOURCE bit field, and NOT the original flags from the "ranges"
> resource.
> 
> Then mvebu_get_tgt_attr() attempts the very same conversion again.
> But this is a misinterpretation of range.flags.
> 
> Remove the misinterpretation of range.flags in mvebu_get_tgt_attr(),
> to restore the intended behavior.
> 
> Issue #2:
> 
> The driver needs target and attributes, which are encoded in the raw
> address values of the "/soc/pcie/ranges" resource. According to
> of_pci_range_parser_one(), the raw values are stored in range.bus_addr
> and range.parent_bus_addr, respectively. range.cpu_addr is a translated
> version of range.parent_bus_addr, and not relevant here.
> 
> Use the correct range structure member, to extract target and attributes.
> This restores the intended behavior.
> 
> Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> Reported-by: Jan Palus <jpalus@fastmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220479

Applied to for-linus for v6.17, thanks!

> ---
> v2: Fix issue #2, as well.
> 
>  drivers/pci/controller/pci-mvebu.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index 755651f338..a72aa57591 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1168,12 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct platform_device *pdev,
>  	return devm_ioremap_resource(&pdev->dev, &port->regs);
>  }
>  
> -#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
> -#define    DT_TYPE_IO                 0x1
> -#define    DT_TYPE_MEM32              0x2
> -#define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
> -#define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
> -
>  static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
>  			      unsigned long type,
>  			      unsigned int *tgt,
> @@ -1189,19 +1183,12 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
>  		return -EINVAL;
>  
>  	for_each_of_range(&parser, &range) {
> -		unsigned long rtype;
>  		u32 slot = upper_32_bits(range.bus_addr);
>  
> -		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
> -			rtype = IORESOURCE_IO;
> -		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
> -			rtype = IORESOURCE_MEM;
> -		else
> -			continue;
> -
> -		if (slot == PCI_SLOT(devfn) && type == rtype) {
> -			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
> -			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
> +		if (slot == PCI_SLOT(devfn) &&
> +		    type == (range.flags & IORESOURCE_TYPE_BITS)) {
> +			*tgt = (range.parent_bus_addr >> 56) & 0xFF;
> +			*attr = (range.parent_bus_addr >> 48) & 0xFF;
>  			return 0;
>  		}
>  	}
> -- 
> 2.50.1
> 

