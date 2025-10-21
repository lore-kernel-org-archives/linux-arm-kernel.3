Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760FFCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bAnhawfaXG8Qx2JwD0PMBr94jzfSZSvQTY9Zm9gmAtw=; b=CIHlTbXRcYCjXXVNs359ETjV8O
	dEliTDdW8D/YSTdpCb9WcCtWVW/YUmp5DD+xZ6HxeROsbfW12aQHMSgLpH7UymkLAMpihV81RAuBb
	W5dDl8vaKGizUwJ0rVuSaKckz7sA2dhmmtYD4XzxlqcLwlZ6GVKmHApF48FqAHiR2SDBWP9Bxuf5c
	rmkO5dT9QN0Y16EfLdZCwpZsCbvYfPWxZf0V6gq/+h+AYIaXLfHOe2PoAx58Lb1niGR2OOxsnwaCp
	ZB+EcgTAZUa1W8Y01l+87eWoQZUY+jRu8sjitAsleyHhnghK22G1ui3sux26HaSfDuV6lXzgyIKhm
	naBXw+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJto-00000000imn-33Cy;
	Tue, 21 Oct 2025 21:28:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJtm-00000000imQ-0q5l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 21:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C468040BC2;
	Tue, 21 Oct 2025 21:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FFFC4CEF1;
	Tue, 21 Oct 2025 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761082082;
	bh=7DJTlR2G0EM6flcfPIzx+BstQxm35mBy6ZxDp8G+Ikw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rYILZj0zajYYKNolxEYq945LMlng3mB6nL71U4ToThg2FGUKoR/mjJwlZOLQXeFBV
	 dAD1ksrur2INevocfXapVPZ+taCoP9FJqSKNNtQq4cg74wPTjTJ1q+PJEVSkmwgZBu
	 bt98hvQr3fvkgAIocQl4fkv1P7hsuRRgUJw9otfglMOq3zG3XbTVVamxREIn3QzDtY
	 JmN7OsIYBhI843iNNmUx+bZog6s4+LTknYMXUCtpobN05nu5jUoTCR2se5UaabtnU1
	 02ddpK9/LNi5FsZG+Job33luBQkvd1uSQDuKSWFAVVKx2jyrHGEQVwcIBa7OiHzDe7
	 qC9/yZ+QtLzzQ==
Date: Tue, 21 Oct 2025 16:28:01 -0500
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
Message-ID: <20251021212801.GA1224310@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467D7D30-DC05-4612-87BA-7E980A9C0A4A@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_142806_309262_A5DF0671 
X-CRM114-Status: GOOD (  34.84  )
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

On Tue, Oct 21, 2025 at 08:55:41PM +0000, Bandi, Ravi Kumar wrote:
> > On Tue, Oct 21, 2025 at 05:46:17PM +0000, Bandi, Ravi Kumar wrote:
> >>> On Oct 21, 2025, at 10:23 AM, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >>> On Sat, Sep 20, 2025 at 10:52:32PM +0000, Ravi Kumar Bandi wrote:
> >>>> The pcie-xilinx-dma-pl driver does not enable INTx interrupts
> >>>> after initializing the port, preventing INTx interrupts from
> >>>> PCIe endpoints from flowing through the Xilinx XDMA root port
> >>>> bridge. This issue affects kernel 6.6.0 and later versions.
> >>>> 
> >>>> This patch allows INTx interrupts generated by PCIe endpoints
> >>>> to flow through the root port. Tested the fix on a board with
> >>>> two endpoints generating INTx interrupts. Interrupts are
> >>>> properly detected and serviced. The /proc/interrupts output
> >>>> shows:
> >>>> 
> >>>> [...]
> >>>> 32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
> >>>> 52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
> >>>> [...]
> >>>> 
> >>>> Changes since v1::
> >>>> - Fixed commit message per reviewer's comments
> >>>> 
> >>>> Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>
> >>> 
> >>> Hi Ravi, obviously you tested this, but I don't know how to reconcile
> >>> this with Stefan's INTx fix at
> >>> https://lore.kernel.org/r/20251021154322.973640-1-stefan.roese@mailbox.org
> >>> 
> >>> Does Stefan's fix need to be squashed into this patch?
> >> 
> >> Sure, we can squash Stefan’s fix into this.
> > 
> > I know we *can* squash them.
> > 
> > I want to know why things worked for you and Stefan when they
> > *weren't* squashed:
> > 
> >  - Why did INTx work for you even without Stefan's patch.  Did you
> >    get INTx interrupts but not the right ones, e.g., did the device
> >    signal INTA but it was received as INTB?
> 
> I saw that interrupts were being generated by the endpoint device,
> but I didn’t specifically check if they were correctly translated in
> the controller. I noticed that the new driver wasn't explicitly
> enabling the interrupts, so my first approach was to enable them,
> which helped the interrupts flow through.

OK, I'll assume the interrupts happened but the driver might not have
been able to handle them correctly, e.g., it was prepared for INTA but
got INTB or similar.

> >  - Why did Stefan's patch work for him even without your patch.  How
> >    could Stefan's INTx work without the CSR writes to enable
> >    interrupts?
> 
> I'm not entirely sure if there are any other dependencies in the
> FPGA bitstream. I'll investigate further and get back to you.

Stefan clarified in a private message that he had applied your patch
first, so this mystery is solved.

> >  - Why you mentioned "kernel 6.6.0 and later versions."
> >  8d786149d78c appeared in v6.7, so why would v6.6.0 would be
> >  affected?
> 
> Apologies for not clearly mentioning the version earlier. This is
> from the linux-xlnx tree on the xlnx_rebase_v6.6 branch, which
> includes the new Xilinx root port driver with QDMA support:
> https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v6.6_LTS/drivers/pci/controller/pcie-xilinx-dma-pl.c
> 
> In earlier versions, the driver was:
> https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v6.1_LTS_2023.1_update/drivers/pci/controller/pcie-xdma-pl.c
> This older driver had no issues with interrupts.
> 
> The new driver introduced in v6.7 and later is a rewrite of the old
> one, now with QDMA support, which has issues with INTx interrupts.

OK, this sounds like out-of-tree history that is not relevant in the
mainline kernel, so Mani did the right thing in omitting it.

I think the best thing to do is to squash Stefan's patch into this one
so we end up with a single patch that makes INTx work correctly.

Ravi and Stefan, does that seem OK to you?

> >>>> +++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> >>>> @@ -659,6 +659,12 @@ static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
> >>>>             return err;
> >>>>     }
> >>>> 
> >>>> +     /* Enable interrupts */
> >>>> +     pcie_write(port, XILINX_PCIE_DMA_IMR_ALL_MASK,
> >>>> +                XILINX_PCIE_DMA_REG_IMR);
> >>>> +     pcie_write(port, XILINX_PCIE_DMA_IDRN_MASK,
> >>>> +                XILINX_PCIE_DMA_REG_IDRN_MASK);
> >>>> +
> >>>>     return 0;
> >>>> }
> 

