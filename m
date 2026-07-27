Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B4EC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06M4KFqCz6SAPpTAamw98wDkXyr1xHgX4OA2w7xESWA=; b=U3WIM9VUxGIXdezyYxRDtjqSMj
	E1JtHn+0MEp5nposq4e3AeGl9YQq5yCBFAv3NmILLkiPViQ4nIBmKjg37xv9jHHvI3yHMx1dD4bHd
	Rs8TaV+y+/hBRWu6KjBbgVQpEMY9IDM1AKa2MlBiL5rsch9TOaggjYCSWtG0IC5RG3xnjCXZ0rM5X
	r94d3QXS72o1WDqVTnoGFMzKRPKJKZSUepe6B7gCguX/eK3zUEKCgAZb1ka7al3APYvUJfc/fPMw4
	ONtIwJ808WqK0lm4PU00+aXbDtOHgJglkYDY6nWmdwUoqme+ZNrZ6C4WW4vDYpoGWItXmi0u+Qk4W
	rbfVEOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO2R-00000003Huk-0DEB;
	Mon, 27 Jul 2026 16:18:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO2P-00000003HuV-1Wtl;
	Mon, 27 Jul 2026 16:18:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B01E743A04;
	Mon, 27 Jul 2026 16:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF391F000E9;
	Mon, 27 Jul 2026 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785169124;
	bh=06M4KFqCz6SAPpTAamw98wDkXyr1xHgX4OA2w7xESWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=enBAogfoOEeCgerqwKDnan2rG4kdIvWwu5OsTjW/wsCXONxI+Bxyz9sJbEtytivK8
	 W1SqHqHvtq5WHHEK8pozmnV/fjtAOJ8Wm72Kan0GUdbUeCASEsYxW3vc5BenWRIMEG
	 lDXafmL0aZzu3g+7qWVcNf4LOmO2bLLgquj2Gs2ImTXhNTokgQQLfD0ltjtKbsQZQ2
	 mUw/5A6qsbsEkCYKXoJMPQiIErI8hUQDkDMbJjJWean18YnrfA/U+G9xH5CpfNEy76
	 rE+vwgin8bbdBr69LnNzDX2/qneNSP4745BhviSWn4t4dXZPaTNN4+N+TE4kNNiDHg
	 Ej8WBel57HFGQ==
Date: Mon, 27 Jul 2026 18:18:37 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Wilson Ding <dingwei@marvell.com>
Subject: Re: [PATCH v8 1/5] PCI: dwc: ep: Clear MSI iATU mapping in
 dw_pcie_ep_cleanup()
Message-ID: <ameE3SBWqbiE8PJp@ryzen>
References: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
 <20260518-pci-port-reset-v8-1-eb5a7d331dfc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-pci-port-reset-v8-1-eb5a7d331dfc@oss.qualcomm.com>
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

On Mon, May 18, 2026 at 08:29:13PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The MSI iATU mapping is currently only cleared when the endpoint is
> stopped via configfs or when the host updates the MSI address/size.
> This avoids redundant iATU reconfiguration every time the endpoint
> raises an MSI interrupt.
> 
> However, a fundamental reset triggered by PERST# assert/deassert
> resets all iATU inbound/outbound registers without going through the
> configfs stop path. If the host also retains the same MSI address/size
> after PERST# deassert, the driver never clears the stale MSI iATU
> mapping. It then continues using this stale mapping to raise the MSI
> interrupts, which can cause IOMMU faults and MSI failures on the host.
> 
> Fix this by clearing the MSI iATU mapping inside dw_pcie_ep_cleanup(),
> which is already called as part of the PERST# assert/deassert sequence.
> This unmaps the MSI iATU region and sets the msi_iatu_mapped flag to
> false, ensuring that dw_pcie_ep_raise_msi_irq() performs a fresh iATU
> mapping on its next invocation, regardless of whether the host changed
> the MSI address/size.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Doesn't this need a Fixes tag?


Side node: It seems like this series does no longer apply on pci/next.

Perhaps need to rebase and resend?


Kind regards,
Niklas

