Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E293ED6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BsgL1s33q+YM3PDiKGIZyu5wsBKu033pAFJcCdn5Gco=; b=h9lwT1c1m06LMh
	rDqzes/85FWJOkdorOLPRua6IJ9kKbhhFEz9l7E0bukNQXoh+AhEujiDNOqB6Ol9qpZtlND/ja0sY
	zFUjvdyQzyJzmSdXvJhaQ5uqXnbP+67TZpi+4m5f9v7o1ahWCbwSa2EFANPRE9op15fhHehNYJG4O
	+Vxq2/713frtx+Lp0/wCRv9S5+7RBDPs2+MZHpMqAnlRD6jRewdDk8o5o8EqRqahaVfRPx11gwwcC
	mBofcA9DBVfOiWoFBIID1vBXgInacSR1DWLwUoW7h60ByfGnBEW22QBfzcYKq7N34ywtGvI1EbhzK
	+GswzXr7c/KBFanIpBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sf4-0000000BN4K-0Fib;
	Fri, 08 Nov 2024 17:20:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sbg-0000000BMhW-3PNJ;
	Fri, 08 Nov 2024 17:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB0CD5C4687;
	Fri,  8 Nov 2024 17:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA24C4CECF;
	Fri,  8 Nov 2024 17:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731086232;
	bh=8HG59M124RFlrjV+ts8vrVvvJqG6N9I7IeFFJaZ90+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MiY6rnqG5QpUZhzQ9P6UXTncPAkwwkHtwQPVH3TrqaChe0MswOGEcyZ5ao1yIPLBW
	 IqpMOqbYYj1rggkiogb8X6nP2i54rRD0Xx30n0hmeb561BBh6EUgjqlein3bkFzJmJ
	 VMFxU/eAdfgWcljOkmqElAj2gFw1W09EHLe5uXfxrS8P0lMHWPPqpUxCdyxsrli6Am
	 szVb42VDXy6jSOdb8ihxkKRINQlHlAZl32oYryU63DdoYfZuAD2U3iqlB0feWG/o7t
	 ZWkDtQzJ4RGqYC3ERFBaGgLFytRG4YGDj3+SxtrhNUtBTDbb8ODRdFink55+lnOHlD
	 vVay2AiMFLBcA==
Date: Fri, 8 Nov 2024 11:17:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <20241108171710.GA1667022@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy5EjY_oQaRbb5MY@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_091712_916085_2203E8B3 
X-CRM114-Status: GOOD (  23.38  )
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

On Fri, Nov 08, 2024 at 06:04:13PM +0100, lorenzo@kernel.org wrote:
> > On Fri, Nov 08, 2024 at 09:39:41AM +0100, lorenzo@kernel.org wrote:
> > > > On Thu, 2024-11-07 at 17:08 +0100, Lorenzo Bianconi wrote:
> > > > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > > > > In order to make the code more readable, move phy and mac
> > > > > > > reset lines assert/de-assert configuration in .power_up
> > > > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > 
> > > > > > > +	/*
> > > > > > > +	 * The controller may have been left out of reset by the
> > > > > > > bootloader
> > > > > > > +	 * so make sure that we get a clean start by asserting resets
> > > > > > > here.
> > > > > > > +	 */
> > > > > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > > > > +				  pcie->phy_resets);
> > > > > > > +	reset_control_assert(pcie->mac_reset);
> > > > > > > +	usleep_range(10, 20);
> > > > > > 
> > > > > > Unrelated to this patch, but since you're moving it, do you
> > > > > > know what this delay is for?  Can we add a #define and a spec
> > > > > > citation for it?
> > > > > 
> > > > > I am not sure about it, this was already there.  @Jianjun Wang:
> > > > > any input on it?
> > > > 
> > > > This delay is used to ensure the reset is effective. A delay of
> > > > 10us should be sufficient in this scenario.
> > > 
> > > ack, so we can introduce a marco like:
> > > 
> > > #define PCIE_RESET_TIME_US	10
> > > ...
> > > 
> > > usleep_range(PCIE_RESET_TIME_US, 2 * PCIE_RESET_TIME_US);
> > 
> > Unless this corresponds to a value specified by the PCIe base spec
> > or CEM spec, this macro should be internal to
> > pcie-mediatek-gen3.c.
> 
> My plan is to add it in pcie-mediatek-gen3.c. Do you think
> PCIE_RESET_TIME_US is too generic?

It's generic, but so are most of the other #defines in
pcie-mediatek-gen3.c, so I'd follow suit.

Connect it to language in the MediaTek spec if possible, i.e., if the
spec names this parameter, try to use the same name.

