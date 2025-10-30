Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BBECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgZ29HJf5Ryz1t8e5e1TsmgwXjYMow0kq+OZL3m/CC0=; b=GhuQ8s+72/pgE127Z/GDS7hKJZ
	QlmSXP19r6LMpZvf5ttZIhbh/5JcLjKM+/IvpfOFW4QMBFYZOLRzVGlNAHiQXjv0iBhm0QHsulMvo
	y6KXkx76cW41DIoLPTHKfFk1HqwCYe5S81vHxZha9I+BGcpVsMQ5FHdbZ2+r0FQ6w031bHRsB0pqz
	RHzEKscuP24CPwEb24bN74/GD1rYO9XQopSfoJYU667JbPFQh0rYL6ah/tvoDKufS4BIcCaZzHnPb
	MFLGofRVAwLsiaii/jtkjC9/USYn3Y0QUMkGPlMoSwU31ryorb2Glf0LX5lFUI78KbsdoWp9ZDae8
	WL4YWaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzA-00000004kQW-1qyh;
	Thu, 30 Oct 2025 20:11:04 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyV-00000004jYc-2MZD;
	Thu, 30 Oct 2025 20:10:27 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6C88692009D; Thu, 30 Oct 2025 21:10:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 60ED392009C;
	Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
Date: Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
    linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
In-Reply-To: <20251030153121.GA1624982@bhelgaas>
Message-ID: <alpine.DEB.2.21.2510302003120.1185@angie.orcam.me.uk>
References: <20251030153121.GA1624982@bhelgaas>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131023_851480_780C561B 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, 30 Oct 2025, Bjorn Helgaas wrote:

> It does complicate maintenance though.  I think all of mips ultimately
> uses register_pci_controller() and pcibios_scanbus().  Neither really
> contains anything mips-specific, so they duplicate a lot of the code
> in pci_host_probe().  Oh well, I guess that's part of the burden of
> supporting old platforms forever.

 FWIW new MIPS hardware continues being manufactured and if there is 
anything needed to clean up in generic MIPS/PCI platform code, then that 
can certainly be scheduled, subject to developers' resource availability.  
Individual MIPS platforms may vary of course, and with the solely legacy 
ones it will depend on the availability of hardware and engineers willing 
to maintain it.

  Maciej

