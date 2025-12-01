Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BA4D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbyEygpZAA/FA0ADnA0YDHklT+veFhE1ZUCavgKUP9g=; b=V9mMUNpGgiFG+ZEBwAKKxZeA+h
	mdIsrnz0T67Gcr2xosL3xZXrtKgpx71uyvsHOG5H9bPDyex5zaIavfCNDov3cOYnuN7uKByXbH8I3
	LuL+uzC1eM5/bvCD7DDdGir6diiGqvr9ChFCigLT5aKaQ8bOiGBScuSVvMdRlHjspVA54odMeCk+p
	NGtU/KcW5TzYZNPeqqTQYAz1wM1VQMHPjq2AH3pNMyALUfX7sRZTRwckE4XxoRNKaevJUWxYLFllB
	tj0gK2uK6eK8s7qWBLIs1EBbI+DSacpiRHXF6es5zGoslgN12gg+X9Kd3ydQiZc8YzZx0zhSSoYrz
	1/GD4O0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6zG-00000004Ikm-3UtD;
	Mon, 01 Dec 2025 16:42:54 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6zD-00000004Igz-44Bm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:42:53 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2D8EC92009C; Mon,  1 Dec 2025 17:42:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 266B992009B;
	Mon,  1 Dec 2025 16:42:42 +0000 (GMT)
Date: Mon, 1 Dec 2025 16:42:42 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
In-Reply-To: <syg7vpbt3w53s24hgl7b6w64odmif5bq557lwlvzlbvgkukwcn@66jtzzc3vtiu>
Message-ID: <alpine.DEB.2.21.2512011617250.49654@angie.orcam.me.uk>
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org> <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org> <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk> <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
 <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk> <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com> <alpine.DEB.2.21.2511281714030.36486@angie.orcam.me.uk> <a4c6d47f-28b5-40d3-bc82-10aeb14f8e78@oss.qualcomm.com> <alpine.DEB.2.21.2511290428340.36486@angie.orcam.me.uk>
 <h7pgm3lqolm53sb4wrcpcurk4ghz4tulqnr7vgd7rzxy4hscue@jcn5tepevlwl> <syg7vpbt3w53s24hgl7b6w64odmif5bq557lwlvzlbvgkukwcn@66jtzzc3vtiu>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_084252_270536_69B0227B 
X-CRM114-Status: GOOD (  32.23  )
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

On Mon, 1 Dec 2025, Manivannan Sadhasivam wrote:

> > > So it's definitely nothing specific to the parport driver, but rather a 
> > > general issue with PCI/e port I/O not working anymore.  I do hope these 
> > > observations will let you address the issue now.  You might be able to 
> > > reproduce it with hardware you have available even.
> > > 
> > 
> > Yes, looks like the I/O port access is not working with the CFG Shift feature.
> > The spec says that both I/O and MEM TLPs should be handled by this feature, so
> > we are currently unsure why MEM works, but not I/O.

 As I say, last time I checked (for another reason) documentation was not 
available to the general public, so I can't help with that.

> > The issue you reported with parport_pc driver is that the driver gets probed,
> > but it fails to detect the parallel ports on the device. More precisely, it
> > fails due to the parport_SPP_supported() check in drivers/parport/parport_pc.c.
> > This function performs some read/write checks to make sure that the port exists,
> > but most likely the read value doesn't match the written one. And since there is
> > no log printed in this function, it just failed silently.

 Whatever the exact transaction conditions are port I/O TLPs seem not to 
make it through to the requested target device anymore.

 FWIW the defxx driver issues a command to the device's command register 
and wants to see a successful completion status in the status register 
before retrieving the MAC address via the data register.  So it's not a 
simple case of poking at a register and reading it back, but the end 
result is the same: the device cannot be talked to.

> > We will check why I/O access fails with ECAM mode and revert back asap. Since
> > the merge window is now open, it becomes difficult to revert the CFG shift
> > feature cleanly. The timing of the report also made it difficult to fix the
> > issue in v6.18. Hopefully, we can backport the fix once we identify the culprit.

 No worries, I've been around for long enough (short of 30 years) to know 
the process.

 FWIW the original change would've best been reverted for 6.18 as a fatal 
regression, however port I/O is uncommon enough nowadays we can defer any 
final decision to 6.19 I suppose.  I'm glad I've tripped over this in the 
first place as I'm not eager to upgrade all my lab devices all the time, 
and it was owing to another issue only that I chose this moment to move 
forward, not so long after the original commit.

> Can you try the attached patch? It is a reworked version of Krishna's patch. I
> just moved things around to check potential override issue.

 No change in behaviour, sorry.  I suppose it's this range of host address 
decoding:

fu740-pcie e00000000.pcie:       IO 0x0060080000..0x006008ffff -> 0x0060080000

aka:

pci_bus 0000:00: root bus resource [io  0x0000-0xffff] (bus address [0x60080000-0x6008ffff])

that you're after.  Are you sure your code discovers it correctly?  As I 
say I can only see IORESOURCE_MEM references and no IORESOURCE_IO ones as 
would be appropriate for the root bus resource quoted.

  Maciej

