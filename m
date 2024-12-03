Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B1BE77160
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gNAEeZNh41LHb2RGq54N5u0LUnIN5Um+MmBmlp7k5gI=; b=O9VHVo7HXqgemD
	866rBe6iqW88J8KD/BNN56IOC8PHoswykr/iR9qYzzZNMXJACdaf4KYJ2ihmKdZ4waLR32NCpCOmd
	VT97zI6HQlQtC8eXYwf1+mKYJmR/4THFVycCgc+SqZDsbEBlWlA5nGCNz6oBMgNojO+ijS0EBOr21
	NV7LMihVmSrlSDLannL9/8GtlNvBdJm81a4TCZU0Bbqj6TVRJCXS7ELljH9lt/7cDJ7KC6/mVutQR
	Ajy8dbr3K689c1zLuQlpNvl2Y7UTEIbpcmbWXPUupQb4x/63CCoATlmGjd7gRCM5i2dhLDFXIR5c6
	m7XGSPKT+VO1Jc1RZF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbZB-0000000AwPd-2b9h;
	Tue, 03 Dec 2024 22:40:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbYB-0000000AwJf-0pbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7425A40C4F;
	Tue,  3 Dec 2024 22:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9C8C4CEDC;
	Tue,  3 Dec 2024 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733265561;
	bh=wKj6FXFllNBDaF5OSfRBHXGeyHVdbB1UAA4vOa8B/yU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=M+Oamw/NYy+DFLqyJxR/dJ/vewk97b3hm56heP86XNoADsAj9LwNVSg5mfa7aVwFV
	 P8nNRDpOF1beu9AGtqQgfQVog68tmtYdkBjEk8oWFaGrT6dH7CZdPjdOHEyntkZXay
	 yuPq7xu3pR7qVcGxdVwF0eTyMc98bDqCuTXvaQogxXiOG8Gj0Bi1Qc92jHMXVJiFZa
	 mtL39MAgLaEu+tkKWt5WuUmu38wDfq8JCyQMtQaRTxgQwXFvGAMbbVkDiSJ33oUfrG
	 lIHCujR5DIVQNUeoNUqY0Hnlmbu+vOibhxsHndJy1VYRLeHBeiHkIQuUdJ2PoKUm9y
	 xVuhTRGHwfF/Q==
Date: Tue, 3 Dec 2024 16:39:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v5 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <20241203223920.GA2969750@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z09tOGxAK6nBB8wV@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_143923_302773_557F2565 
X-CRM114-Status: GOOD (  21.13  )
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

On Tue, Dec 03, 2024 at 03:42:32PM -0500, Frank Li wrote:
> On Mon, Nov 04, 2024 at 02:22:59PM -0500, Frank Li wrote:
> > Some PCIe host bridges require special handling when enabling or disabling
> > PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> > Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> > to identify the source of DMA accesses.
> >
> > Without this mapping, DMA accesses may target unintended memory, which
> > would corrupt memory or read the wrong data.
> >
> > Add a host bridge .enable_device() hook the imx6 driver can use to
> > configure the Requester ID to StreamID mapping. The hardware table isn't
> > big enough to map all possible Requester IDs, so this hook may fail if no
> > table space is available. In that case, return failure from
> > pci_enable_device().
> >
> > It might make more sense to make pci_set_master() decline to enable bus
> > mastering and return failure, but it currently doesn't have a way to return
> > failure.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Bjorn Helgaas:
> 
> 	Can I keep your acked tag? Compared V4, just use static helper
> functions.

Can you rebase this to pci/main (v6.13-rc1)?  This would go via the
PCI tree, so it will need to be rebased anyway, and then I can ack
that.

Bjorn

