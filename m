Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FC0C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz0OgPJHskeZCecIhowCqY7VOgUdIoTQSDl165K/eiA=; b=2/jxQN9UIsBtXWOaiD3P//j4a0
	g0UOYSmwe0OgeP7lDhLKLui6vntBMNVdNJdJKjQODps7sms33CannImFx6znnDSu18WduIhhx67D9
	z9pbjmp6d4aIgLeCHxHj25E+0fPBf32F/7lbOnQYMty3JKWsZ/GMye+ugPJ2G5fPdiSqUb7mFNtdQ
	6zqlmf9Nh0gHwh40XyB5v482yN0ygk+rhIRdSYzI/u2GLa2194kiuirH03MoffmzVovIalSAssk/N
	1S2Y/e1QmmbvvJG5FOfOLMbXErg6cR78SYLlaTmWAuIBRFdHvaecqB5t/ZPCTyqpR/RS64+N93bcp
	WZ5xB5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHkv-00000009RyL-06HH;
	Thu, 30 Jul 2026 03:48:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHkt-00000009RyD-1vCv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 03:48:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E32600AA;
	Thu, 30 Jul 2026 03:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530061F000E9;
	Thu, 30 Jul 2026 03:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785383301;
	bh=Fz0OgPJHskeZCecIhowCqY7VOgUdIoTQSDl165K/eiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lh3SI/4G3RDTWRTW0NdHgz98g1xe5CFI4f5qgm15wero2ItllUSHgs45TZPbQYL2Q
	 rCHS6Zze5Q9Y2/ARfhG2TffPAN3NS6mLuKT6e4uzyPXMIDVdwLQ2DDgyYzf0aRy36e
	 CcdN19IHoaSAO4dl38o5KBknoP0CUOlRdYqRBHyzIn73xiP0LwfPnhxls9HSeOr4ex
	 Mr1oKYRbef3TG8pQez/gWER5ZdMct9iKrj4F5ocJlwCd9PrJW9wA9ijlbyLp0uwC9Z
	 bgZ67ckMARrD6Y5ujaicC3KFybE51P26CACDPAeatppWbrZYAoKyLmILliJjeKPUeb
	 S/e3xi5pSTRWQ==
Date: Thu, 30 Jul 2026 05:48:12 +0200
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
Message-ID: <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
References: <20260716205811.800920-1-rosenp@gmail.com>
 <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
 <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 11:18:15AM -0700, Rosen Penev wrote:
> On Wed, Jul 29, 2026 at 9:00 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
> > > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
> > > the previous call, but uses the generic firmware-node API.
> > >
> >
> > What is the benefit of using fwnode API for OF only driver?
> I get conflicting information. Apparently of_irq_get needs a call to
> irq_dispose_mapping but fwnode_irq_get does not.

That's not true. fwnode_irq_get() becomes a wrapper to of_irq_get() if OF is
used. So both needs a call to irq_dispose_mapping() in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

