Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B56DC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdLI7i6NmXhs3e/8wzfrAbBJfvcATmR4O7TZTLdEEwc=; b=4841ge4xHwNzwzQhYQQKR7mHCS
	olqrGDkbvWehrjH+5NbFIG1zqIEkFmbSBmGybN15zzIkJeIR/36kcv4AhWz/bwLeXk9b59/lCfDNS
	ViAYF8QprobYUF9wPp/9431WfIxF6Oa9b+2NUnnCKKvw9nqJ8gh217ObOor5wgAEUy3HJIWui0k8/
	KTNhB+gHV++g0JUB6WMEWCwTK7AawCjjkx71vEET+R+igXiicanlQ1FCEsMMw3WTMZXSjTDDzQ6Ub
	m4qu3BBIlCPGyXePXB7XS+kLQRljQpa3hgCkUHM89E+NtBZRDo7yGMjghMmDKulkXVNCOJopUE0gd
	nNyTnsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquan-0000000HWzk-2VZB;
	Mon, 03 Aug 2026 15:28:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquam-0000000HWzd-3SNq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 103B4419FC;
	Mon,  3 Aug 2026 15:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0601F000E9;
	Mon,  3 Aug 2026 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785770919;
	bh=QdLI7i6NmXhs3e/8wzfrAbBJfvcATmR4O7TZTLdEEwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PGOUOCC1neYO3Pj4JiiJrbKXQu7xg5ou/DxwOvC8Li/WTLMVSPngejogWVDXh4lZR
	 o5bW3UOxG/IuF+QF2qPsY1LW1K/zfd0SoXyYuF8X+0ulzNhMHv7ExardoOJHlTtPWt
	 RqJS7X4CqBlc/ahI3b4A2sDHu0dLS2mJSvBrR1c5HyGFHhxa/sq31KhQgr4yyRDRUi
	 3JEjnWx/ror6y1x+T9wqMB84v5zRvBSMnxDiGHa6cUSuG7ioq/mdJ6F8sm7Thn6VUF
	 icNrO/9xTovcpfPudJjTQ8kBQvpl3Oj0AV4pEh7s6RHuymMKvKU3oAnQfLtW/oO9bu
	 MEpXY9FrW9VRA==
Date: Mon, 3 Aug 2026 17:28:30 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Message-ID: <ducc6fhoe6t3bivbpdanmojgtnntwykzwfog7vasps7tj6mp5t@vifnuyn4fjtn>
References: <20260716205811.800920-1-rosenp@gmail.com>
 <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
 <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com>
 <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
 <CAKxU2N-2Vj1pugC_L=jhMS06CA34_-a-txZCrAoUtrRwFQ1Stg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-2Vj1pugC_L=jhMS06CA34_-a-txZCrAoUtrRwFQ1Stg@mail.gmail.com>
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

On Thu, Jul 30, 2026 at 11:54:29AM -0700, Rosen Penev wrote:
> On Wed, Jul 29, 2026 at 8:48 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Jul 29, 2026 at 11:18:15AM -0700, Rosen Penev wrote:
> > > On Wed, Jul 29, 2026 at 9:00 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > > > > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
> > > > > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
> > > > > the previous call, but uses the generic firmware-node API.
> > > > >
> > > >
> > > > What is the benefit of using fwnode API for OF only driver?
> > > I get conflicting information. Apparently of_irq_get needs a call to
> > > irq_dispose_mapping but fwnode_irq_get does not.
> >
> > That's not true. fwnode_irq_get() becomes a wrapper to of_irq_get() if OF is
> > used. So both needs a call to irq_dispose_mapping() in the error path.
> I don't see  irq_dispose_mapping() for fwnode_irq_get() in the codebase.

That doesn't matter. You need to check with irqchip maintainers and see if those
drivers need fix or not.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

