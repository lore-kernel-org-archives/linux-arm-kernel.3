Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DKHoUI5rsEgC8CKUFVmIpcolh9d7kWkbYUPPXC/HcMA=; b=VckY9sDWgr0C1EddyHzmgYNuKZ
	0eVH6cgYGBxFUGsX9UQ5OhHGBl4Q1H57E6K+sDgAOYoVQ88ta1qyvG2EvGf0bgpbrjYVLFR2twpmo
	yst/UEvPNpEtgBFq5m5nd65qrfr4hVRU4A4phSVlm/83TPX2twXWorbOP3fBjY5kzjq5zzqudvo9i
	I2ed8ydIz6JIFLH3+prPR0bY+cbMJeJz87nWZdIGaxTugdxhpoW2UroyhibdfuNBf3FT+ROiSwAoh
	JkbyuDAIdcaU42rXNNpLCPQyOxo3+S0bEfw/Fg6xXZX2bTZN+tnmx2y3hwJErm868CS11TWUlZr/0
	9skaM1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHkG-00000000RhN-2lxf;
	Tue, 21 Oct 2025 19:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHkF-00000000Rh9-0X5d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11FAF6038A;
	Tue, 21 Oct 2025 19:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91784C4CEF1;
	Tue, 21 Oct 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761073805;
	bh=OlM+hp5liynWD7x8TgYwNOV4Zf2KLGwQL6h+7jLysUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=u2I3Kyukg/Wif1wUoptuz5TgrwRmfk7omZ+7pSbwDV8VJh4ZKmmg6jbknZp3kDthA
	 8x5+cMD+KsRJ1QpuNTaCLO7J9uNmQtf+osMB4Qpq+euqRl99kqmgTJFrcjUnXQTSU9
	 I2BtKqHN8sMMxk5FW7/41y3nTiLTt9wlSMOgJKvbYP0PNhJhFUOdKYzH49cLv0xXiW
	 lj3r4OmNqQlxvW4/AfxxtgPTpgOpaRevzbkIQZ8+RSk1mCXq4Ld0yX9x9pEaSsXhd+
	 tSRZnzJeZOZNbczRtKmE8XDucUY2vIY02W3EzKxDQbZ2ehGrR5Yv2NMCeAEgwBZcmM
	 SLKdchcqT9Klw==
Date: Tue, 21 Oct 2025 14:10:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Bandi, Ravi Kumar" <ravib@amazon.com>
Cc: "mani@kernel.org" <mani@kernel.org>,
	"thippeswamy.havalige@amd.com" <thippeswamy.havalige@amd.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Stefan Roese <stefan.roese@mailbox.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Message-ID: <20251021191004.GA1205652@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB5963BB-A896-4CFA-AF27-31164705DF5A@amazon.com>
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

On Tue, Oct 21, 2025 at 05:46:17PM +0000, Bandi, Ravi Kumar wrote:
> > On Oct 21, 2025, at 10:23 AM, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Sat, Sep 20, 2025 at 10:52:32PM +0000, Ravi Kumar Bandi wrote:
> >> The pcie-xilinx-dma-pl driver does not enable INTx interrupts
> >> after initializing the port, preventing INTx interrupts from
> >> PCIe endpoints from flowing through the Xilinx XDMA root port
> >> bridge. This issue affects kernel 6.6.0 and later versions.
> >> 
> >> This patch allows INTx interrupts generated by PCIe endpoints
> >> to flow through the root port. Tested the fix on a board with
> >> two endpoints generating INTx interrupts. Interrupts are
> >> properly detected and serviced. The /proc/interrupts output
> >> shows:
> >> 
> >> [...]
> >> 32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
> >> 52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
> >> [...]
> >> 
> >> Changes since v1::
> >> - Fixed commit message per reviewer's comments
> >> 
> >> Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>
> > 
> > Hi Ravi, obviously you tested this, but I don't know how to reconcile
> > this with Stefan's INTx fix at
> > https://lore.kernel.org/r/20251021154322.973640-1-stefan.roese@mailbox.org
> > 
> > Does Stefan's fix need to be squashed into this patch?
> 
> Sure, we can squash Stefan’s fix into this.

I know we *can* squash them. 

I want to know why things worked for you and Stefan when they
*weren't* squashed:

  - Why did INTx work for you even without Stefan's patch.  Did you
    get INTx interrupts but not the right ones, e.g., did the device
    signal INTA but it was received as INTB?

  - Why did Stefan's patch work for him even without your patch.  How
    could Stefan's INTx work without the CSR writes to enable
    interrupts?

  - Why you mentioned "kernel 6.6.0 and later versions."  8d786149d78c
    appeared in v6.7, so why would v6.6.0 would be affected?

> >> +++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> >> @@ -659,6 +659,12 @@ static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
> >>              return err;
> >>      }
> >> 
> >> +     /* Enable interrupts */
> >> +     pcie_write(port, XILINX_PCIE_DMA_IMR_ALL_MASK,
> >> +                XILINX_PCIE_DMA_REG_IMR);
> >> +     pcie_write(port, XILINX_PCIE_DMA_IDRN_MASK,
> >> +                XILINX_PCIE_DMA_REG_IDRN_MASK);
> >> +
> >>      return 0;
> >> }

