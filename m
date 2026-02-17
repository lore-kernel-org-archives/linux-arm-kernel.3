Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC2E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8eC0Jy1RfB3fSEwuwiF3FP9X0RgfqHQZYxmiFqJgjA=; b=Y8Q26cdCDmrpgfM+Fnc4kBDm1N
	5vVw/6S9xqNkXSabJNLYxR4l/V89Ym95i3lYEnE2vvsQiFvjcvIr7j3fkmXCIKBXkwG9LKiCxBjEs
	R9xufV/El0IJRC/UVasn8xNsqaoFXfmNdPP33galwhWRijje98NxMyRCBBjNqY7yscoPV2Ug9vem1
	3GPVafLgV50NJL+uggsV09ywraUNIxfxnE3lpk/S1wYX16TlQTDi/4+75duzJ+stMM69kyAfx1EWN
	TFLLDHI8BaGeUrzEckPXhvZW3tzaTUx1fCPgsqHOuobCfyQCNMnk4Q+QEFbQgdJzTkhMCJjwEcveF
	i5QgwbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSmE-00000008vpU-0RXD;
	Tue, 17 Feb 2026 21:38:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSmD-00000008vpO-0tab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 21:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F6B60128;
	Tue, 17 Feb 2026 21:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F798C4CEF7;
	Tue, 17 Feb 2026 21:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771364315;
	bh=63kU7skAW2FXPyHSnSl/BgF4w/Fj3RPxttwsh3pdBTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5qHgFoMTrN5wDKyuUSnwhoqHL3xDOLZilXEPCEy1ZhAxdsthPHUlLSspWWUg9DCi
	 JhKS50irmxbk1HJpoqZYjik+nAAm/cuWspxe1SwgIGcqTurxZQKqa39aWIWRAnKqJI
	 EIy0x10tYDXNIS22KN9Tlv8K2r9YuWGQ1e/abbwtOjN20Ah6xmKPvk+il26suRlGP9
	 5jAlUu8npvhslJ8eWAB9QbpnqS14anCOfPkcGCPxfGWGP5UjAFZz0C5aZ7HwRzRETs
	 ffzSWSi/1H66SJMFa/i2YY0M87GKyZ0EoFZaVQWvHVYbz96Y/srK3uCWYuM52JbOYD
	 YvOqheFqvY5Fg==
Date: Tue, 17 Feb 2026 22:38:28 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 0/4] PCI: endpoint: Add BAR_DISABLED support to PCI
 endpoint framework
Message-ID: <aZTf1K4p7QS8-R9k@ryzen>
References: <20260217-master-v1-0-727e26cdfaf5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-master-v1-0-727e26cdfaf5@nvidia.com>
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

On Tue, Feb 17, 2026 at 11:24:40AM +0530, Manikanta Maddireddy wrote:
> When Tegra194 runs in PCIe endpoint mode, BAR1–BAR5 are marked BAR_RESERVED so the
> EPF does not allocate backing memory. The host-side pci_endpoint_test driver
> still ioremaps all enabled BARs and runs BAR read/write tests on them. Writing to
> BAR2 (MSI-X table) or BAR4 (DMA registers) corrupts controller state and breaks
> CONSECUTIVE_BAR_TEST. A prior fix reset all BARs in the EPC .init(), so only
> BAR0 was visible to the host—tests passed but 64-bit BAR 2 and BAR 4 were no
> longer available for real use (e.g. host DMA via BAR4).
> 
> This series addresses that by:
> 
> 1) Adding BAR_DISABLED and clarifying BAR_RESERVED in the PCI endpoint core.
>    BAR_RESERVED is used for (a) HW-backed BARs (MSI-X, DMA) that the EPC may
>    leave enabled, and (b) the second register of a 64-bit BAR. BAR_DISABLED is
>    for unused BARs that the EPC must disable in .init() and the EPF must not
>    use. pci_epc_get_next_free_bar() treats both as not free.
> 
> 2) Updating Tegra194 endpoint to use three 64-bit BARs at indices 0, 2, and 4:
>    BAR0+BAR1 for EPF test/data, BAR2+BAR3 for MSI-X table, BAR4+BAR5 for DMA.
>    Only BAR0 and BAR1 are reset in .init(); BAR2/BAR3 and BAR4/BAR5 stay
>    enabled so the host can use MSI-X and DMA.
> 
> 3) Adding a BAR skip mask to pci_endpoint_test so endpoints can skip the
>    destructive BAR test on HW-backed BARs. Tegra EP test data skips BAR1–BAR5
>    (test only BAR0). Adding NVIDIA Tegra194 EP (0x1AD4) and Tegra234 EP (0x229B)
>    to the pci_endpoint_test_tbl so the host driver can bind and run tests
>    without corrupting MSI-X or DMA registers.
> 
> 4) Converting unused BAR_RESERVED to BAR_DISABLED in the Uniphier Pro5 endpoint
>    (BAR4 and BAR5); BAR1 and BAR3 remain BAR_RESERVED as the high halves of
>    64-bit BAR0 and BAR2.
> 
> With this, CONSECUTIVE_BAR_TEST and DMA tests pass while Tegra194 keeps 64-bit
> BAR 2 (MSI-X) and BAR 4 (DMA) enabled for host use.
> 

Hello Manikanta,

There are quite a few things that I think we should implement differently,
please see:
https://lore.kernel.org/linux-pci/20260217212707.2450423-11-cassel@kernel.org/T/#u

I'm not trying to take credit from you, for all I care, feel free to take
over the series and add you Co-developed-by on all the patches.

I just though that it would be easier to explain with code rather than a
lot of back and forth.

Hopefully we can send a V2 that includes more detailed BAR_RESERVED
descriptions, that includes what are behind each BAR_RESERVED (including
sizes of each backing MSI-X table/ATU regs/eDMA regs/whatever) in
pcie-tegra194.c.

I also have a Nvidia Jetson Orin Nano board that I can run in EP mode,
so hopefully we can collaborate to get something merged for v7.1.


Kind regards,
Niklas

