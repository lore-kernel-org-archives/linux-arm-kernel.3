Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F78C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNwZQCkHKwYFKkrNjWZTS93nuqW+VicG7takxDF9Vgg=; b=AHcyXw2ihE4qMbaHleTv8J1+ts
	NMXKVy858r6ty3eyxaNpyvJbTotQ9Z99ZJI06u/+510X5Eql/39+UKqXVwxlM3je5/vDYUJp2U4J/
	7w5s18nmyB0Q9ntz96ma342adzJ84YXZcwMSX41JpF4wTefUOrWqIWzH+b+FjURRx5pOZFIZHgmsW
	NmwYngizWkZJaXCXRkV0zcwFU2SikQoCehTm0nFEOzRt/EpkU26hPTUZJjltjgkue+wX5+pJk1ozP
	HwFTJc8Hlds2DE7Ek1i2n+tcLg39Z8KybzGKr+jExiAsTwRD/rDRe0HUPyYEQj3zNs+7H8CbC8NJk
	0NLNAF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogQC-000000059Pm-1S8q;
	Tue, 28 Jul 2026 11:56:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogQB-000000059Pc-1RGp;
	Tue, 28 Jul 2026 11:56:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1407C40E33;
	Tue, 28 Jul 2026 11:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78B81F000E9;
	Tue, 28 Jul 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785239791;
	bh=eNwZQCkHKwYFKkrNjWZTS93nuqW+VicG7takxDF9Vgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eASZFug7jzWnrOF3OuHWC4dJIdUSnjJMhAZUEWqUVi4S7MXbtF5ibFVRSy4+s537i
	 XUoY0kXJCaCx8MxtLhr+lrqq7NBntmoWdrBHhwp89a1vo6ad9Be0OIxrxYWGthQELk
	 RqQ0blwKXaXTZmXrJFZgO2OKqLo7ZWy1fBwW1QPIGDXU1mei6Oh2U7348bqhX6Ij1F
	 utV4CnZhplr9TkSvfz0vgnkLdUys67sBj2wznd3JK92mKYhvuAzLwbPqxgom8dj0rh
	 GxzUUzbP6wspjvSYYLHIQ6Tlw8fhCAnoo+ZdRHNGcd1kuoMAUM8GVTYLJ4ROhBtRXu
	 isnidYxLb535g==
Date: Tue, 28 Jul 2026 13:56:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>
Subject: Re: [PATCH v8 1/5] PCI: dwc: ep: Clear MSI iATU mapping in
 dw_pcie_ep_cleanup()
Message-ID: <k5zkz2wnvkb2kzwyazafghgncqefv4cvuzrwwek6xi27vvldej@o4ostebesrbm>
References: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
 <20260518-pci-port-reset-v8-1-eb5a7d331dfc@oss.qualcomm.com>
 <ameE3SBWqbiE8PJp@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ameE3SBWqbiE8PJp@ryzen>
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

On Mon, Jul 27, 2026 at 06:18:37PM +0200, Niklas Cassel wrote:
> On Mon, May 18, 2026 at 08:29:13PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > The MSI iATU mapping is currently only cleared when the endpoint is
> > stopped via configfs or when the host updates the MSI address/size.
> > This avoids redundant iATU reconfiguration every time the endpoint
> > raises an MSI interrupt.
> > 
> > However, a fundamental reset triggered by PERST# assert/deassert
> > resets all iATU inbound/outbound registers without going through the
> > configfs stop path. If the host also retains the same MSI address/size
> > after PERST# deassert, the driver never clears the stale MSI iATU
> > mapping. It then continues using this stale mapping to raise the MSI
> > interrupts, which can cause IOMMU faults and MSI failures on the host.
> > 
> > Fix this by clearing the MSI iATU mapping inside dw_pcie_ep_cleanup(),
> > which is already called as part of the PERST# assert/deassert sequence.
> > This unmaps the MSI iATU region and sets the msi_iatu_mapped flag to
> > false, ensuring that dw_pcie_ep_raise_msi_irq() performs a fresh iATU
> > mapping on its next invocation, regardless of whether the host changed
> > the MSI address/size.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Doesn't this need a Fixes tag?
> 

It needs one yes!

> 
> Side node: It seems like this series does no longer apply on pci/next.
> 
> Perhaps need to rebase and resend?
> 

Yep. I'm preparing th next version. Will post it asap.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

