Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A01C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/iv2AyieqD+wQwL0gejSGdtTP/mLifcPc9iiJuDu94M=; b=ce+J1HQc3xtNJn
	Nwze1/Bu8vIxwdSmc65N+WAYKtv0Uw9Q9sY0CDx7gTLzsxZHluLdGATA+86PJfkpLr2B6HZ3qjnwl
	ruMTWPfpoEklrOwNY2BYpPhM1ADYG8hNdIlau02xaj7J/QQoEkydSCLCAOKoUmz21sC5duQvmeEsM
	xVg5mKrtJFpQOKR6bvjFoPlJqvbCWunX3v8iXbjiYbsLnnE1nSDjQ0CUFyrQRbxQRrpzUtraR4LxR
	ojEv8NIhq+Ds7cLfQZtRmejB2bGRYf5sK8UyPO+z0SrGQw2oifoeozVQevbbkO3gKaaWhGJ3v14sv
	OFIUOg42CBadsEq4MEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjasX-0000000BdGA-3eY0;
	Tue, 14 Jul 2026 11:00:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjasV-0000000BdG1-3goD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:00:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 368A4601DE;
	Tue, 14 Jul 2026 11:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31851F000E9;
	Tue, 14 Jul 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026842;
	bh=/iv2AyieqD+wQwL0gejSGdtTP/mLifcPc9iiJuDu94M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MIFe8qeJETo7Wq9A8nBgLwOqwjMW62COVF1AfM5tzJUUaMLdanyCyL88ks4ZEPNml
	 LLK73UZff5LTqb5R0Q3Tdgf5JMYuxXe6sAlpC4Yc/qUUpK6B6xGdhvWffKD+sjP3C3
	 U5KY06jrIot3FN/VphtEX+vZm0IxOAwAoNLXCRu7Nt2rtixKpXsnSNFrZAQn8OwgVw
	 HtsAiNbMUpDSmXHPF6q0O03vDHcoX8uHAx8nQlz+2T7g475d+faW5QtxymwWLjZGc/
	 FDVU2CkfkI/iL4M11yP7wJ2jF4xMxFFFAcwxZtFmdOKSs2QI82QBQnhR25Tl5LsQ4S
	 3pqgkiUe1PEJg==
Date: Tue, 14 Jul 2026 06:00:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
Message-ID: <20260714110041.GA1349622@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
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

On Mon, Jul 13, 2026 at 08:05:38PM +0200, Marek Vasut wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> > > On 7/10/26 10:30 AM, Marc Zyngier wrote:
> > > > On Thu, 09 Jul 2026 21:10:03 +0100,
> > > > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > > > > 
> > > > > Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> > > > > copy the one GITS_TRANSLATER register offset macro directly into
> > > > > the driver.  This repairs the ability to build the driver on
> > > > > non-ARM non-GIC targets the way it was possible until now, which
> > > > > retains good build test coverage.
> > > ...
> > 
> > > So in the end, it is either this patch or limit the build to
> > > arm/arm64 . At least this patch still allows building this driver
> > > with more compilers on the various build bots, so I would opt for
> > > this patch here.
> > 
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
> 
> I can rename the macro, or ... sigh ... I can reduce the driver to build
> only on ARM/ARM64. Which one do you prefer ?

I think a dependency on ARM/ARM64 is preferable.

