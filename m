Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152FBCDC195
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe01PfpZ9u4Jeuei/DTACSwkqGZ29IbqWmJsh+yrNhM=; b=sR44DH20Qu2CDS+BYTmLPkoU6n
	DRw7waX2bHgYg/4+2aoUAGk8ZAIt46SttDYJj1lwVa8tdTsAFOdsUKHNJzV/u72MdeHgsSLC1GtP0
	OQwPiaMh6BXFacjgigeLd+NqbyQie3CMOggD1zOc+omAUMAW7lHJVnig/TjqwaYohs7GdqebRwy5s
	d85Ic0Twzb+dfqeKdPuVgL6yKjHRuPbpn1S7ttBZKJGS6yNg0HW7tUQvMqCwLJlDP2rE+dlLJYdxN
	OUIs4EuAuzhrH1UpTNcD22ss9870UrhLtdksVfkT4KKOSGN6Leje9p32F+VbV50siYCZU+iEirGKf
	7QFiMQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6a0-0000000D27I-4BYv;
	Tue, 06 Jan 2026 12:54:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6a0-0000000D27A-0Sww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08EBF6013D;
	Tue,  6 Jan 2026 12:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43702C116C6;
	Tue,  6 Jan 2026 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767704069;
	bh=Oe82Dko28Elj2iz2dw44a9YNxq8NU/2D2uNU8P53OZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KN4oqz610r/u6hH1tOaCgWtj2JyIk3YpqEs6IVXdlw5ZZserrRV2qnOUJAjhDeMN8
	 EA1973sY8RCkfakuEgJhX0g5rBystiIKEJkue0fUT59yOgCUnaKf/I+tvs24+F8Itg
	 xerfB9qu2s4y0MhlPlIXMd3IdIVq/t4UYxcNDF5sfbpVwloD+66FZvPR5jLkYnIJZC
	 V2KUnxAvW8q2fxiYkva91OfDw0TFX1xSN8TokROXvJCZlGUhhXv6IFgQ7mUeXWIFdw
	 LXks9wMYH/rc1LcnwIQEMD3+d8IH9kuvkIECy0I70YCL6uILhhIZsZOwJeehUCbslL
	 9PCvDC9tlkB6A==
Date: Tue, 6 Jan 2026 18:24:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/11] PCI: imx6: Add a method to handle CLKREQ#
 override
Message-ID: <inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
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

On Wed, Oct 15, 2025 at 11:04:17AM +0800, Richard Zhu wrote:
> Clock Request is a reference clock request signal as defined by the PCIe
> Mini CEM and M.2 specification; Also used by L1 PM Substates. But it's
> an optional signal added in PCIe CEM r4.0, sec 2. The CLKREQ# support is
> relied on the exact hardware board and device designs.
> 
> Add supports-clkreq property to i.MX PCIe M.2 port since the CLKREQ#
> signal would be driven active low on this M.2 connector by the add-in
> card to requtest reference clock. And, the host bridge driver can enable
> the ASPM L1 PM Substates support if this property present.
> 
> To support L1 PM Substates, add a callback to clear CLKREQ# override on
> the boards that support CLKREQ# in the hardware designs.
> 
> Main changes in v6:
> - Rebase to v6.18-rc1.
> - Add the dts changes into the v6 version patch-set.
> - Fix the i.MX95 refclk enable that was missed in the v5 series.
> - Make i.MX95 refclk enable parallel to the others.
> - Describe the potential CLKREQ# problem on i.MX95 19x19 EVK second
>   slot in the commit, and emphasis the CLKREQ# issue is caused by the
>   board and device hardware designs.
> 
> Main changes in v5:
> - New create imx8mm_pcie_clkreq_override() and keep the original
>   enable_ref_clk callback function.
> 
> Main changes in v4:
> - To align the function name when add the CLKREQ# override clear, rename
> imx8mm_pcie_enable_ref_clk(), clean up codes refer to Mani' suggestions.
> 
> Main changes in v3:
> - Rebase to v6.17-rc1.
> - Update the commit message refer to Bjorn's suggestions.
> 
> Main changes in v2:
> - Update the commit message, and collect the reviewed-by tag.
> 
> [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add supports-clkreq
> [PATCH v6 02/11] arm64: dts: imx95-19x19-evk: Add supports-clkreq
> [PATCH v6 03/11] arm64: dts: imx8mm-evk: Add supports-clkreq property
> [PATCH v6 04/11] arm64: dts: imx8mp-evk: Add supports-clkreq property
> [PATCH v6 05/11] arm64: dts: imx8mq-evk: Add supports-clkreq property
> [PATCH v6 06/11] arm64: dts: imx8qm-mek: Add supports-clkreq property
> [PATCH v6 07/11] arm64: dts: imx8qxp-mek: Add supports-clkreq
> [PATCH v6 08/11] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
> [PATCH v6 09/11] PCI: imx6: Add a new imx8mm_pcie_clkreq_override()
> [PATCH v6 10/11] PCI: imx6: Add CLKREQ# override to enable REFCLK for
> [PATCH v6 11/11] PCI: imx6: Add a callback to clear CLKREQ# override

Squashed patch 9 with 11 and applied to controller/dwc-imx6, thanks!

- Mani

> 
> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi     |  1 +
> arch/arm64/boot/dts/freescale/imx8mp-evk.dts      |  1 +
> arch/arm64/boot/dts/freescale/imx8mq-evk.dts      |  2 ++
> arch/arm64/boot/dts/freescale/imx8qm-mek.dts      |  1 +
> arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     |  1 +
> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  1 +
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  1 +
> drivers/pci/controller/dwc/pci-imx6.c             | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
> drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
> 9 files changed, 60 insertions(+), 1 deletion(-)
> 

-- 
மணிவண்ணன் சதாசிவம்

