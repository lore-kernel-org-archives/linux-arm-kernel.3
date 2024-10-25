Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C1D149F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4PS3Xdn/ydqCFUi7a6mJ6LNGIQ69DaKLDBbmtpqBvXs=; b=tWC50olPMRfzFy2gP+6IVfzUJm
	zfDYM9Fon/ZmBLTqZwkiDaA+rx4rCejL/wVvTtXMGmANgVTDzMZsr03+lOyStQVkDmlk9TPAJUwHy
	b6Betabuo22NV67/BYqMSD5HpzS58RdtzoILIAvBdiqesr8CIlnmecinFt42DFYymWgVwzkAYDmQ5
	cRIzWlsooTGdJf1gB8W7BRuMtCGyfT77TLPxOBUfbKdPHCBwZFgkdYVYgo8ETlhZQbGdKjcBhghae
	tvqFHh8aEujHkN4a3pPpP8xp890o/FBxmEbZE6BjksN8VqpNMTo9ImkafYuj3fDomT7T6Sok/D3Xn
	OrHFPHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4S0Y-00000005KK2-0E2C;
	Fri, 25 Oct 2024 21:38:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ryv-00000005Jtc-2YQ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 21:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0C775C5890;
	Fri, 25 Oct 2024 21:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AF3C4CECC;
	Fri, 25 Oct 2024 21:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729892188;
	bh=0VXLkxh/2Ecsv6rIIKWkGlW2EIFOBXyj7cfyt2r+xLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Lyf/v0GP/E2zd0MG4qbYJMsm3GH3QEQ2KMOyNh3zfnsWD+lCIlZyurAiQTgGyODMq
	 gpjNp9BULeC1T38Gc+WKexKxJWC0h3XMps1GjZp6U7BJ3JQOqfruzmZ/mtWrEsRJaA
	 /rGTwHlhfo6Div0SvSBfMLULLsudg0gEZf//trY6n13+0FAkwwT2oIWxZNoyE/S5HS
	 imKkGLdyMSS+KgpkS2UuHJNPNzUKE0hrQ/wJGAmHUP8AbFcJBHI1s+LArEiUOQNpxz
	 ZEHXNYhKRCTZVXiAv5XmZzehJkVwV2ZjJj3OlvX4saCmtTiR26pWiPXTaPSOghHnxV
	 BeSsAkGJsW/8w==
Date: Fri, 25 Oct 2024 16:36:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] PCI: ep: dwc/imx6: Add bus address support for
 PCI endpoint devices
Message-ID: <20241025213626.GA1030542@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxwH//clayRL2emF@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_143629_762003_D4DE819C 
X-CRM114-Status: GOOD (  21.59  )
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

On Fri, Oct 25, 2024 at 05:05:03PM -0400, Frank Li wrote:
> On Fri, Oct 25, 2024 at 03:48:18PM -0500, Bjorn Helgaas wrote:
> > On Thu, Oct 24, 2024 at 04:41:42PM -0400, Frank Li wrote:
> > > Endpoint          Root complex
> > >                              ┌───────┐        ┌─────────┐
> > >                ┌─────┐       │ EP    │        │         │      ┌─────┐
> > >                │     │       │ Ctrl  │        │         │      │ CPU │
> > >                │ DDR │       │       │        │ ┌────┐  │      └──┬──┘
> > >                │     │◄──────┼─ATU ◄─┼────────┼─┤BarN│◄─┼─────────┘
> > >                │     │       │       │        │ └────┘  │ Outbound Transfer
> > >                └─────┘       │       │        │         │
> > >                              │       │        │         │
> > >                              │       │        │         │
> > >                              │       │        │         │ Inbound Transfer
> > >                              │       │        │         │      ┌──▼──┐
> > >               ┌───────┐      │       │        │ ┌───────┼─────►│DDR  │
> > >               │       │ outbound Transfer*    │ │       │      └─────┘
> > >    ┌─────┐    │ Bus   ┼─────►│ ATU  ─┬────────┼─┘       │
> > >    │     │    │ Fabric│Bus   │       │ PCI Addr         │
> > >    │ CPU ├───►│       │Addr  │       │ 0xA000_0000      │
> > >    │     │CPU │       │0x8000_0000   │        │         │
> > >    └─────┘Addr└───────┘      │       │        │         │
> > >           0x7000_0000        └───────┘        └─────────┘
> > >
> > > Add `bus_addr_base` to configure the outbound window address for CPU write.
> > > The BUS fabric generally passes the same address to the PCIe EP controller,
> > > but some BUS fabrics convert the address before sending it to the PCIe EP
> > > controller.
> > >
> > > Above diagram, CPU write data to outbound windows address 0x7000_0000,
> > > Bus fabric convert it to 0x8000_0000. ATU should use BUS address
> > > 0x8000_0000 as input address and convert to PCI address 0xA000_0000.
> >
> > The above doesn't match what's in patch 1/4, and I think the version
> > in 1/4 is better, so I'll comment there.
> >
> > To avoid confusion, it might be better not to duplicate it in 0/4 and
> > 1/4.
> 
> Yes, cover letter don't come into git tree. This part is common and
> important, It is not good just said ref to patch1 commit message.
> 
> Add do you have addition comment about this and
> https://lore.kernel.org/imx/20241015-pci_fixup_addr-v5-0-ced556c85270@nxp.com/T/#t
> 
> The both are the pave the road to clean up pci_fixup_addr().

I think it would be helpful to combine the "PCI: dwc: optimize RC host
pci_fixup_addr()" series and the "bus_addr_base" parts of this series
together into a single series because they are doing very similar
things, and it's easier to review them together.

And split the dt-bindings, PHY sub mode, and new endpoint support
parts to their own series because they're not related to the address
translation changes.

Bjorn

