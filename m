Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B6EF99C60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OF3pHR3W4s1vzUhbiYevPwTfmnMPMtytKCOBp/UQXF8=; b=jHhRUmZI49xVzU
	QKblJq0KuWRYL0n/PPHBDYChXxZ9pNkiXfQ4k4Meo1camb8hy9vU9rMzPqMYpMj4IDDxsErqPWGKm
	Dvlua4JxeSiuOThXuM1tp5JL4pX3VqiYz5ErB1fsiqMl025nvo32NhQZNHMZxH+qE+i+fi+tBqgl/
	Fw7ZyBm1+Tc8Q6+AXe7mWiLQDSQrUpFkY3tUzcdjmZRVM3mLrGPzjtj2N2uyRXWvmw8CI+yeVg4UD
	zbBjZ1kTX9jQP0sTT8OhjpNE14cq84d2h4fZUI849qux51lK7sEtx2lIzvcRwU/JST+p+Ndl9PaV9
	pTdWWVRWKFEjkMd9HJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpHv-00000004QcV-0xR9;
	Fri, 17 Apr 2026 19:55:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpHt-00000004QcO-2nv4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 19:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62BAD60052;
	Fri, 17 Apr 2026 19:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4050C19425;
	Fri, 17 Apr 2026 19:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776455735;
	bh=l+dL+bsfkqpxw8vBZ2qjjX1NYJoorXmurqTXyqgMrXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oeyODZQ7mydKqug4mEFFqwgFy2wf0FKAlp7sEFJNQSbj1jDtm1VgmE/QiQPf6wMmb
	 D6zt0jL2JMD8k/PnfFAHGgbQYWawCD76DJ6c1cxShv6ZsPixx+NHg+fAHLDx6wWtSo
	 j6P1XSuE4JxbkM/JjIL41MapnGeDAPaBqhHqJ5fdrx+owkVvW5RBdGMUu8YzGH5uMv
	 rr5BQnn8via7fKYmj89e3OfqaLe0mNoiG+3E1vhRhcFZpC42zQZ4HxSVrQXPGd21h5
	 XFp0/tLX+i+3NsVPU0mCh+pOoCIROYgYzKM7j/B3RMf8AwiLoqUpuHStC6GxYRdvl/
	 RcVvpgff6WYVQ==
Date: Fri, 17 Apr 2026 14:55:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V13 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <20260417195533.GA92707@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1211449884AC3BC8E3711F1AB92202@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Fri, Apr 17, 2026 at 03:17:16AM +0000, Sherry Sun wrote:
> > On Thu, Apr 16, 2026 at 07:14:12PM +0800, Sherry Sun wrote:
> > > Introduce generic helper functions to parse Root Port device
> > > tree nodes and extract common properties like reset GPIOs. This
> > > allows multiple PCI host controller drivers to share the same
> > > parsing logic.
> > >
> > > Define struct pci_host_port to hold common Root Port properties
> > > (currently only reset GPIO descriptor) and add
> > > pci_host_common_parse_ports() to parse Root Port nodes from
> > > device tree.
> > 
> > Are the Root Port and the RC the only possible places for 'reset'
> > GPIO descriptions in DT?  I think PERST# routing is outside the
> > PCIe spec, so it seems like a system could provide a PERST# GPIO
> > routed to any Switch Upstream Port or Endpoint (I assume a PERST#
> > connected to a switch would apply to both the upstream port and
> > the downstream ports).
> 
> Thanks for the feedback. You're right that PERST# routing could
> theoretically be connected to any device in the hierarchy. However,
> for this patch series, I've focused on the most common use case in
> practice: use Root Port level PERST# instead of the legacy Root
> Complex level PERST#.
> 
> Root Port level PERST# - This is the primary target, where each Root
> Port has individual control over devices connected to it.  RC level
> PERST# - Legacy binding support, where a single GPIO controls all
> ports.
> 
> We can extend this framework later if real hardware emerges that
> needs Switch or EP-level PERST# control. I can add a comment
> documenting this limitation if needed.
> 
> BTW, Mani and Rob had some great discussions in dt-schema about
> PERST# and WAKE# sideband signals settings.

> You can check here:
> https://github.com/devicetree-org/dt-schema/issues/168
> https://github.com/devicetree-org/dt-schema/pull/126
> https://github.com/devicetree-org/dt-schema/pull/170

The upshot of all those conversations is that WAKE# and PERST# can be
routed to arbitrary devices independent of the PCI topology.

I think extending host-generic to look for 'reset' in Root Port nodes
is the right thing.  My concern is more about where we store it.  This
patch saves it in a new "pci_host_port" struct, but someday we'll want
a place to save the PERST# GPIOs for several slots behind a switch.
Then we'll have two different ways to save the same information.

WAKE# signals might be more pertinent -- we definitely need to support
multiple WAKE# signals below a single Root Port, and it seems like
PERST# and WAKE# GPIOs should be saved the same place.

I'm wondering if both should go in the pci_dev itself.  I guess the
implication is that a pci_dev->reset GPIO would describe a PERST#
connected to the device *below* the pci_dev, at least for Downstream
Ports.

I don't know about WAKE# signals.  When it's in a connector, there's
probably only a single possible WAKE# per Downstream Port.  But is it
possible have multiple WAKE# signals from a multi-function device
that's on the motherboard?  Saving the WAKE# GPIO in the Downstream
Port wouldn't accommodate that case.

