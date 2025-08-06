Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07D4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hnCMNG0/3rF8Iu0XS2mnY9CpBY/jnWu0X3RBk+8zXF0=; b=PSKRQqoR9NACMWlkGVQtF0mR4D
	Cyhwf4IBo6RU27qUnhPoXzUfUNWU+rcUyvjpMf9J6mFJT0xG2P4canw/rExkjGB/zdjB6GjPTol0Q
	qgpQudeEzicADFQGLqcOwV30yDbiPeYPIOHZ6/EVzoYLe293QokGTurxpktilS2xfPySa2B3rbfG+
	u90bvnqpYJ2j5OO8AWtAIZhjGjjzPhJpm+wTR4s4F97rVvvrQITzyusWmJ1G+i5TMf3/7Wlsi1ja+
	zpSBMdu2lsZn4DOPQPl36mKYtPNhLOb2jNYQi/vDCBvKY1E9nnSmKjXnnPvHDJwTYg3WrH/WZZ4mS
	awW3ojlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjIb-0000000G8NT-0DGK;
	Wed, 06 Aug 2025 18:55:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjDy-0000000G7ol-1z01;
	Wed, 06 Aug 2025 18:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D8DC43B70;
	Wed,  6 Aug 2025 18:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD03C4CEE7;
	Wed,  6 Aug 2025 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754506253;
	bh=kEM5vhXrSGvpRyllOZTd+MbG9Yt0asgCP/TMhfdeB48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BzWAfBgnwZpfljD/W+CsHOSwzED3vJWVnHj6/SK/MH3U9Wv4RpRV6oxiCtte0LY3C
	 yJBDmwZa2u2+nad+38+KrVw//p1RFTwpzlU7WdtGoPifWOIgJA+zlfRF9eFPg3EuDw
	 k32XLonHhU5Iqy6hmeDzKf1ZidUwKDUQFOOZwUHxUegZrCMI/R0BjbAlxqN3T6FzHb
	 /T/EmUJBnHVcvpNmyCEJY7E0gMo3VQmTwucIVB33R1BsQAgWZkXO+NdrwR1YYnOia3
	 hPZVUp8e12wRkxTOrGJ0wU3xugkQafUNoTL0Sw3dtMIsWqKoP7q0Rlz9UIalcj+GRJ
	 PYgVcLbQYzrJg==
Date: Wed, 6 Aug 2025 13:50:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
Message-ID: <20250806185051.GA10150@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNzq_BV_fK9T4LK0ncZuufqp9E9+DUyFU3jKCnSCjN8n-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_115054_551991_3D27D001 
X-CRM114-Status: GOOD (  31.19  )
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

On Wed, Aug 06, 2025 at 02:38:12PM -0400, Jim Quinlan wrote:
> On Wed, Aug 6, 2025 at 2:15 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Fri, Jun 13, 2025 at 06:08:43PM -0400, Jim Quinlan wrote:
> > > Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> > > by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> > > 7216 and its descendants -- have new HW that identifies error details.
> >
> > What's the long term plan for this?  This abort is a huge problem that
> > we're seeing across arm64 platforms.  Forcing a panic and reboot for
> > every uncorrectable error is pretty hard to deal with.
> 
> Are you referring to STB/CM systems, Rpi, or something else altogether?

Just in general.  I saw this recently with a Nuvoton NPCM8xx PCIe
controller.  I'm not an arm64 guy, but I've been told that these
aborts are basically unrecoverable from a kernel perspective.  For
some reason several PCIe controllers intended for arm64 seem to raise
aborts on PCIe errors.  At the moment, that means we can't recover
from errors like surprise unplugs and other things that *should* be
recoverable (perhaps at the cost of resetting or disabling a PCIe
device).

> > Is there a plan to someday recover from these aborts?  Or change the
> > hardware so it can at least be configured to return ~0 data after
> > logging the error in the hardware registers?
> 
> Some of our upcoming chips will have the ability to do nothing on
> errant PCIe writes and return 0xffffffff on errant PCIe reads.   But
> none of our STB/CM chips do this currently.   I've been asking for
> this behavior for years but I have limited influence on what happens
> in HW.

Fingers crossed for either that or some other way to make these things
recoverable.

> > > This simple handler determines if the PCIe controller was the
> > > cause of the abort and if so, prints out diagnostic info.
> > > Unfortunately, an abort still occurs.
> > >
> > > Care is taken to read the error registers only when the PCIe
> > > bridge is active and the PCIe registers are acceptable.
> > > Otherwise, a "die" event caused by something other than the PCIe
> > > could cause an abort if the PCIe "die" handler tried to access
> > > registers when the bridge is off.
> >
> > Checking whether the bridge is active is a "mostly-works"
> > situation since it's always racy.
> 
> I'm not sure I understand the "racy" comment.  If the PCIe bridge is
> off, we do not read the PCIe error registers.  In this case, PCIe is
> probably not the cause of the panic.   In the rare case the PCIe
> bridge is off  and it was the PCIe that caused the panic, nothing
> gets reported, and this is where we are without this commit.
> Perhaps this is what you mean by "mostly-works".  But this is the
> best that can be done with SW given our HW.

Right, my fault.  The error report registers don't look like standard
PCIe things, so I suppose they are on the host side, not the PCIe
side, so they're probably guaranteed to be accessible and non-racy
unless the bridge is in reset.

Bjorn

