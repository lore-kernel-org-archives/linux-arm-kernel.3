Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28CAD4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ayIrx1XrjOsCWld35EEmZX7uFjzAN1pNLoPdBYxtnq4=; b=aFA6RU7y05HY8G
	nWPahNMpXpj+GXd7zVGtm8gKyginTdj9yuf44Gap1UPbmLx+uYyZ95aESQ6rG8yLpoalng/Av35bD
	DIcwMx7PAMWguUzNNuLfxGbbyBU78ad2+weHunO2x5j7SWpPqAzl/DYxnUKbgY2p+J+DrWG8d3kXj
	4+ILEJsLqJ4+BlIr7YIDyxy184O8z33tuDIygpD1fykBVIaq8epJg04J/bYsdmd2MeSyybv7AsWz7
	d2Uf8Tz1rFklxnoberbl0F7MX6DomcVbv8rSTyozH499aP7G2HTwY7lsGHQZ13OigbCCOSL06YIqW
	jxPAF3XCNDknXS4UkCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95md-00000007jE1-0f60;
	Thu, 07 Nov 2024 16:54:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95eP-00000007hUG-06Un;
	Thu, 07 Nov 2024 16:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 131A5A448BF;
	Thu,  7 Nov 2024 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595F2C4CECC;
	Thu,  7 Nov 2024 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730997987;
	bh=GZHWeP89CUKrAe3MvpLoueZH/R99ojWtvbeyFfi7yj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Dql3DcdiSw6/w7rk8GoAlnLI5jh2cZBXjjhWoLwNBf+/GdHMPonOD9UzeB4iCMyTF
	 lAmTyLyimvHtMztSWzboGnqigMuXV3j6FQzHwJ+ShPSCkovNPd0L74a3vaynKnR+2n
	 UQi7zJzODcelksrznG50+NHfaFiKvM305FehRCXCm8edyq8AupKpqqsrDL60T5cq4B
	 GlFZBItAKrfRPuhIOspE+Q6hcdqDgASwQlJjJrbsJrk5qH8SeU5jyqhmQzCEKgbfgg
	 tb4RVylua4obd8Wgh2FBkSoFMHUC959fBxncGWpklUukNZwBYhugy02bU5/vbL6yiD
	 7Fs8zgD+Mm8JQ==
Date: Thu, 7 Nov 2024 10:46:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20241107164624.GA1618716@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyzpGSyAVe6bz9H2@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_084629_223728_17B448A5 
X-CRM114-Status: GOOD (  36.31  )
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

On Thu, Nov 07, 2024 at 05:21:45PM +0100, Lorenzo Bianconi wrote:
> On Nov 07, Bjorn Helgaas wrote:
> > On Thu, Nov 07, 2024 at 08:39:43AM +0100, Lorenzo Bianconi wrote:
> > > > On Wed, Nov 06, 2024 at 11:40:28PM +0100, Lorenzo Bianconi wrote:
> > > > > > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > > > > > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > > > > > PCIe controller driver.
> > > > > > > ...
> > 
> > > > > > Is this where PERST# is asserted?  If so, a comment to that effect
> > > > > > would be helpful.  Where is PERST# deasserted?  Where are the required
> > > > > > delays before deassert done?
> > > > > 
> > > > > I can add a comment in en7581_pci_enable() describing the PERST issue for
> > > > > EN7581. Please note we have a 250ms delay in en7581_pci_enable() after
> > > > > configuring REG_PCI_CONTROL register.
> > > > > 
> > > > > https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L396
> > > > 
> > > > Does that 250ms delay correspond to a PCIe mandatory delay, e.g.,
> > > > something like PCIE_T_PVPERL_MS?  I think it would be nice to have the
> > > > required PCI delays in this driver if possible so it's easy to verify
> > > > that they are all covered.
> > > 
> > > IIRC I just used the delay value used in the vendor sdk. I do not
> > > have a strong opinion about it but I guess if we move it in the
> > > pcie-mediatek-gen3 driver, we will need to add it in each driver
> > > where this clock is used. What do you think?
> > 
> > I don't know what the 250ms delay is for.  If it is for a required PCI
> > delay, we should use the relevant standard #define for it, and it
> > should be in the PCI controller driver.  Otherwise it's impossible to
> > verify that all the drivers are doing the correct delays.
> 
> ack, fine to me. Do you prefer to keep 250ms after clk_bulk_prepare_enable()
> in mtk_pcie_en7581_power_up() or just use PCIE_T_PVPERL_MS (100)?
> I can check if 100ms works properly.

It's not clear to me where the relevant events are for these chips.

Do you have access to the PCIe CEM spec?  The diagram in r6.0, sec
2.2.1, is helpful.  It shows the required timings for Power Stable,
REFCLK Stable, PERST# deassert, etc.

Per sec 2.11.2, PERST# must be asserted for at least 100us (T_PERST),
PERST# must be asserted for at least 100ms after Power Stable
(T_PVPERL), and PERST# must be asserted for at least 100us after
REFCLK Stable.

It would be helpful if we could tell by reading the source where some
of these critical events happen, and that the relevant delays are
there.  For example, if PERST# is asserted/deasserted by
"clk_enable()" or similar, it's not at all obvious from the code, so
we should have a comment to that effect.

Bjorn

