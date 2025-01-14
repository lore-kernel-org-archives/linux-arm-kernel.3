Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6618AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9CdsmnJl5aX0L+3MqRS3f3dS0mcweThdi1+oJ2V9Dpw=; b=yC7R+DKpjuL5/E
	XI3Z6qI07k1A3OOEHNHG7hgAWDbqsGQmonk0bGS6f6IqH9aQDofwCgTlF/c3Sf+IevNDLmSHlaA5h
	kH5c3mJfDWTR1j+FHCgwojNo4eRofPRxrrcfGABz5uyBeU/omi4kb9TG7l5P76wM/xUC3870X8qQf
	pvATycgYCdJlH7sIC/fN/h17DHjvyFJQ9apssgxqN+KEoFDk/oefWic3L+foTFya0jljpKMrmV8Fr
	heWqAaLXoueyslJElnIUSIwFLIjrKfrypDVbcqkswoIkZ97D/hpncplYUnpSfwS0JmyNYbfXtG7n1
	JKh3aFY0+EJW96q8KTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkNQ-0000000988v-0Kdg;
	Tue, 14 Jan 2025 17:06:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkMA-000000097xq-2TkD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACE23A4190A;
	Tue, 14 Jan 2025 17:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AF4C4CEDD;
	Tue, 14 Jan 2025 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736874333;
	bh=4l1I+oCpVV7aVqBA/IRj6rgmTYIBnLenVcNim925x0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lDVH8LkqBChhnuAGdV3aOQRdWR9sekjlr8og2bRGHplaBVZoyD1txgGW1pwALmvQq
	 Hk1pk0EOjmzDMuh8/NRG65sEqF9Zwc0gX7ZSucljn7YKUxU88Cu6j9F2fMYpBKNHNN
	 PqON+4tUWgo/5Dye6ShWYBh9PLNgsMKL6iYUwXOTED7Zf77Wsw8p8TmBJ/zR/X6uRA
	 zFEtYX0laUVdmC3xya+m5cgWeu5KI1rhgVN8bF3loS+XAGJa7YZoaWYUKaWs2ZE3cW
	 5sCdeKVBH8rbx29Dajlly0m5urNK3D3iTGsi5VlgvyP7nNh1EKXi9FSBRCftlmEDh9
	 TIqh1LgB7cS+g==
Date: Tue, 14 Jan 2025 11:05:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
Message-ID: <20250114170530.GA464935@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef02ddbf-0838-4616-a3c5-ef7ab55de3c9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_090534_694016_8B04577F 
X-CRM114-Status: GOOD (  22.16  )
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

On Mon, Dec 16, 2024 at 03:00:58PM +0100, Christian Bruel wrote:
> On 12/5/24 18:27, Bjorn Helgaas wrote:
> > On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen2 controller based on the
> > > DesignWare PCIe core in endpoint mode.

> > > +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	enum pci_barno bar;
> > > +
> > > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> > > +		dw_pcie_ep_reset_bar(pci, bar);
> > > +
> > > +	/* Defer Completion Requests until link started */
> > 
> > I asked about this before [1] but didn't finish the conversation.  My
> > main point is that I think "Completion Request" is a misnomer.
> > There's a "Configuration Request" and a "Completion," but no such
> > thing as a "Completion Request."
> > 
> > Based on your previous response, I think this should say something
> > like "respond to config requests with Request Retry Status (RRS) until
> > we're prepared to handle them."
> 
> OK thanks for the phrasing. This is inline with the DWC doc:
> "... controller completes incoming configuration requests with a
> configuration request retry status."
> The only thing is that the PCIe specs talks about CRS, not RRS.
> 
> so slightly change to
> "respond to config requests with Configuration Request Retry Status (CRS)
> until we're prepared to handle them."

This terminology between PCIe r5.0 and r6.0.  In r5.0, sec 2.2.9
labels Completion Status value 010b as "Configuration Request Retry
Status (CRS)", but in r6.0, sec 2.2.9.1 labels that same value as
"Request Retry Status (RRS)".

We changed most usage inside drivers/pci/ to align with the r6.0 term
with https://git.kernel.org/linus/87f10faf166a ("PCI: Rename CRS
Completion Status to RRS").

But with respect to this patch, changing "Completion Request" to
"Configuration Request" is the main thing.

Bjorn

