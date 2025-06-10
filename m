Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E37FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P9zfAgkPGYttlivRuJJJCXYkijFzK02OwIBEU8IpWog=; b=K5mSPnOAGy2nyUlIs/ha42RNrT
	SOEMA1uzjF1D6iMHIWa8eh9aUQyFR1Y6ymMcWOb06HcpFgOiU7gaCWJTmGhGbW2h9PCawM2qjMKbj
	wgagILf/xUsZdtf6A/74yPwXZZ4XXOu6uYP8ZI5ieNB0+s52+TyYRu6+sC1hBywdiIO6bxM90WYll
	NTEUBBBAi34G9Dc21P/qx/fp5kF/VnIUBVIre6XKnPWpE/wHqPF0vVeMZ8QPieRtYlmZMQVG2rbg/
	5QN0ASr98mmQjT7CqwvvR0mkqcTG26g/2WvXIA8A2i1JpJeef07KCm936Ajvx0dP2aXyZkqhgVtkM
	Or2Xsuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lo-00000008Fl1-0H0C;
	Tue, 10 Jun 2025 22:48:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4AD-00000007rVB-2ZPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 18:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA07D6112E;
	Tue, 10 Jun 2025 18:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F16C4CEED;
	Tue, 10 Jun 2025 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749581856;
	bh=OIqP5Jyjh/Zt9q5rwTEUSZK+gMMSTXEdZyQY0v11QIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QV0k40cIaAJN23wkamzSxqlueLdARxjZKy8rxwv2854Oh1h115PUGcDuu6BM3zgMJ
	 spw476G6878zTXSN0E+1aW8qP2lncOpTnABxuIp0aN+0ZMl8Y8Z/xOp+H0DOMMzQsT
	 d3pm2xfNePcu9Dzo1F/UiVapHpvnW5HHhHn0ba3MyAR9KzF69sAg1O4UKp+O3O4i45
	 iVYPQS+W4zkZNscu97+OrYDgOZHpFSfqPIPfMRh+JzNjExkDeyRy08qDdThBuyzFEx
	 G4A+nx6VAbAcu4uA2Ax+N/tZHV+VZgXuI+VG8K4O0T/gPfLYRtgtAv1or3Q1H3eJBC
	 CDPXb2EFpwl5Q==
Date: Tue, 10 Jun 2025 13:57:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] PCI: xilinx: Wait for link-up status during
 initialization
Message-ID: <20250610185734.GA819344@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610143919.393168-1-mike.looijmans@topic.nl>
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

On Tue, Jun 10, 2025 at 04:39:03PM +0200, Mike Looijmans wrote:
> When the driver loads, the transceiver and endpoint may still be setting
> up a link. Wait for that to complete before continuing. This fixes that
> the PCIe core does not work when loading the PL bitstream from
> userspace. Existing reference designs worked because the endpoint and
> PL were initialized by a bootloader. If the endpoint power and/or reset
> is supplied by the kernel, or if the PL is programmed from within the
> kernel, the link won't be up yet and the driver just has to wait for
> link training to finish.
> 
> As the PCIe spec allows up to 100 ms time to establish a link, we'll
> allow up to 200ms before giving up.

> +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
> +{
> +	u32 val;
> +
> +	/*
> +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
> +	 * fabric, we're more lenient and allow 200 ms for link training.
> +	 */
> +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
> +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
> +			2 * PCIE_T_RRS_READY_MS * USEC_PER_MSEC);
> +}

I don't think this is what PCIE_T_RRS_READY_MS is for.  Sec 6.6.1
requires 100ms *after* the link is up before sending config requests:

  For cases where system software cannot determine that DRS is
  supported by the attached device, or by the Downstream Port above
  the attached device:

    ◦ With a Downstream Port that does not support Link speeds greater
      than 5.0 GT/s, software must wait a minimum of 100 ms following
      exit from a Conventional Reset before sending a Configuration
      Request to the device immediately below that Port.

    ◦ With a Downstream Port that supports Link speeds greater than
      5.0 GT/s, software must wait a minimum of 100 ms after Link
      training completes before sending a Configuration Request to the
      device immediately below that Port. Software can determine when
      Link training completes by polling the Data Link Layer Link
      Active bit or by setting up an associated interrupt (see §
      Section 6.7.3.3).  It is strongly recommended for software to
      use this mechanism whenever the Downstream Port supports it.

Bjorn

