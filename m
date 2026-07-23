Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8838BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hd35ezz/qRRzqlESySsTjZX8Na6y63xNvZlfn93+y/A=; b=zVcqhij/nDGUmX
	l7h3MQy0//Xj7lbdMMVRaQVRDphuN/TI6CrJyXVikg8BDCCMPCOWYU9UhoKiBltH2hvolQJTFECpn
	HCcXeeWnIn4rzq+ooLiyXss5pE6yN+rSmqcMK+Nno6PqpgeDyIP/AzWILsbMRWXvkjPFbRWqhNgEF
	biMG7s14H94t5JKy2A28K1BdHjcKrMLHuXldJE5juUhS/qnjo8vxwB8a61MQGCYsn1yN9lWjPABgV
	wuZ84e72qfeJXqWbkwxgj0RF48+2QM09ag8d4aNWfJZNYSvx4+94oNe5wou//3husYkRLVdkx3sQ5
	0t9Q9BNtiDkEkDycNDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzQP-0000000F0Gs-3JCo;
	Thu, 23 Jul 2026 19:49:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzQO-0000000F0Gh-2sax;
	Thu, 23 Jul 2026 19:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92CB7600AD;
	Thu, 23 Jul 2026 19:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5B61F000E9;
	Thu, 23 Jul 2026 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784836183;
	bh=hd35ezz/qRRzqlESySsTjZX8Na6y63xNvZlfn93+y/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=oHEyfqKs+qIAGhNg8ku1g8HLye7HRNceaQR5nVhVORDSMRPvDk5wJbiNVYoltP0ef
	 q3c3c1LUZJ0v0v+iHt0YGC0IV/s+1w4CjvF4V+/r69vHOuUCPc1o2j7dIx45ovP4xy
	 Zv3WOK1re0ATDkbTpUQuM+l86aabi0dJ7acys2+7UqhnEKVF9BbNxxw1M4at8UNbjl
	 KSRO8OKGHbwWChQdq2B67fHz9S0nS0SJM5B4gk8tL39wDX1Aq97vhVxFsRJaeIkLkQ
	 nsDUoDR+e2QFZPQwFHXcuSJdBgdaMZNZlzHv5E49nuHfHWmtJnE7uC+mqmfWrL0KD7
	 eh4AIHVTo9MKg==
Date: Thu, 23 Jul 2026 14:49:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
Message-ID: <20260723194941.GA850329@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a626006.4d70c427.b2b96.c939@mx.google.com>
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

On Thu, Jul 23, 2026 at 08:40:03PM +0200, Christian Marangi wrote:
> On Wed, Jul 22, 2026 at 12:40:10PM -0500, Bjorn Helgaas wrote:
> > On Tue, Jul 14, 2026 at 01:58:46PM +0200, Christian Marangi wrote:
> > > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > > mode (2x link) by bonding it with the second PCIe lane (PCIe1). This is
> > > done by configuring the PCIe MUX in the SCU register.
> ...

> > > -	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
> > > -	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> > > -	 * complete the PCIe reset.
> > > +	 * Old Airoha EN7581 clock driver performed PCIe reset via
> > > +	 * clk callbacks since it has a hw issue with PCIE_PE_RSTB signal.
> > > +	 * This is now handled by dedicated PERSTOUT resets with clk
> > > +	 * driver only enabling the refclk.
> > 
> > This reference to the "old Airoha EN7581 clock driver" makes me think
> > there's a dependency between a EN7581 clock driver change and this
> > PERSTOUT change.  If so, please mention the commit SHA1 for the EN7581
> > clock driver change so they're connected and people backporting to
> > older kernels know to be careful to get both of them.
> > 
> > It sounds like this PERSTOUT change might be independent of the x2
> > configuration support.  If so, it should be done in a separate patch.
> 
> thanks for the review. The clock change can go on a separate patch but
> since the hash will change when it will get merged what should I use as
> reference? Also any hint on the tag to use or the format?

Where is the clock change?  Is it the one in this series ([PATCH v4
2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset)?

If so, perhaps this PERSTOUT change and the clk-en7523.c PERSTOUT
change could be in the same patch?  It would just require an ack from
the clk folks and then we could merge it via PCI.

