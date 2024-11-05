Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C2DD3E760
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TQPCUdMCx39m0ZTNjhnYCaHxFkfeIc8TU+p5IJ3tkMk=; b=JLYt25hSD/PZPb
	C1zN7kIcKd27mKyRgRmrZeD6SmL8MR29I/RNjzpIh5PMNwr8qs3J+ayKwzqMGa+QquI+j4L6LVClJ
	22Dly4Xjr3ejyVXl91E9gqTnIuBkhZS+TFuARh90r7CrK4wgFUrxqqtW5F5imok+be3ZdDWC2/7RS
	ADwKh79X++sFYOtSz7t3kNfheswOtwcA+MxYVaSVPS3QX7gM9cErX2UYrxFVO17K5yc1xBe2EeegA
	S/xaBjBoVNYKAf7IbwVnh0PMkxwQ0tMKHQ6+M4YV925xu42mFyOrVQHunTVLqbles4+7Ik7d2fZ4z
	B2T3mbtFFSeuTvfv8Z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8QeH-00000000o0h-2mKT;
	Tue, 05 Nov 2024 20:59:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8QcZ-00000000nj6-3AoK;
	Tue, 05 Nov 2024 20:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA119A4166A;
	Tue,  5 Nov 2024 20:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5854CC4CECF;
	Tue,  5 Nov 2024 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730840270;
	bh=DYfBBj3JaDu67bf4HxYtGzC1oE1D8X/KxacexvlRTs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EEGT/NDigZAvieG+NbZ8bVmafnVdv5lQeTu46psHu8LRVQRAKknpPRZj7ox36oM+a
	 QKCPkZYpWKK474piUG0cn5aVOARWAqhjMFdLIcPR0BVAhlStmLCNxfpXTHfB3FkpsQ
	 aPZcOQQ+eU9bk+xj1gemiNL3JxKskhArqKP8OtrwLAIvMzRynQ7UMEHJlTI96+dm7g
	 diX1CzAbC0FSW/Z8/wJAR08KPjX33v6jNGRFT5oF9xE1kg2dB1tthQlhZ9ISslpwgo
	 Z7p5trRutiezgh5W7pXT6zX02+PhE11Wn9bU2gN6jIwiMlQ1nr31LkuzKDsecu3jPD
	 fKv0Nsq6LrHaQ==
Date: Tue, 5 Nov 2024 14:57:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <20241105205748.GA1484220@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZypgYOn7dcYIoW4i@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_125752_148396_28A7FFFE 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, Nov 05, 2024 at 07:13:52PM +0100, Lorenzo Bianconi wrote:
> > On Mon, Nov 04, 2024 at 11:00:05PM +0100, Lorenzo Bianconi wrote:
> > > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > > causing occasional PCIe link down issues. In order to overcome the
> > > problem, PCIE_RSTB signals are not asserted/released during device probe or
> > > suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> > > (0x88) and REG_RESET_CONTROL (0x834) registers available via the clock
> > > module.
> > > Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> > > specify per-SoC capabilities.
> > 
> > Where does this alternate way of doing reset (using REG_PCI_CONTROL
> > and REG_RESET_CONTROL) happen?  Why isn't there something in this
> > patch to use that alternate method at the same points where
> > PCIE_PE_RSTB is used?
> 
> REG_RESET_CONTROL (0x834) is already asserted/released in the following flow:
> 
> mtk_pcie_en7581_power_up() -> reset_control_bulk_deassert() -> en7523_reset_update()
> https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L470
> 
> REG_PCI_CONTROL (0x88) is already asserted/released in the following flow:
> mtk_pcie_en7581_power_up() -> clk_bulk_enable() -> en7581_pci_enable()
> https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L385

So IIUC, you're saying that on EN7581, the PCI hierarchy is reset by
the soc->power_up() callback, mtk_pcie_en7581_power_up(), via
REG_PCI_CONTROL and REG_RESET_CONTROL.

I assume the hierarchy is also reset by the non-EN7581 .power_up()
callback, mtk_pcie_power_up()?

And prior to this patch, we reset the hierarchy *again* in
mtk_pcie_startup_port() via PCIE_RST_CTRL_REG, but this causes
occasional "link down" issues because of a EN7581 hardware defect.

So for EN7581, this patch skips the PCIE_RST_CTRL_REG reset in
mtk_pcie_startup_port().

.power_up() and mtk_pcie_startup_port() are used both at probe time
and in mtk_pcie_resume_noirq().  So after this patch, I assume:

  - EN7581 resets the hierarchy once at probe and resume instead of
    twice.

  - Non-EN7581 resets the hierarchy twice at probe and resume.

I assume I'm missing something (maybe mtk_pcie_power_up() doesn't
actually reset the hierarchy?) because I don't see why we would reset
the hierarchy twice for either controller.

Bjorn

