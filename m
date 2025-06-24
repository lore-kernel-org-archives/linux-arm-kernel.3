Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BEBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yVl1jBXeKOOdiSgdx9SxjkRUmmR2uIB4d7AOMUyCXoE=; b=2i7IFkLaTv0wNhSpEOLPzlY+/O
	by6uJSTOY9GMBto+OnNi9qzjSgfCMr/Q01K2eCGS5qaCnXB0XYZJIsavAfFLZ/vF40s24xpIsT+w7
	g67DwgdYuP0POO3rmTriUXmSzfGDwzCnnvjVtuNoSLpcbKHdxfsxUFVNaJhn0s2QIcuAFOG1baZJO
	sCE3joGa1WJOSN83Hs2IalGspbiiawiOGKiODwuWuxfa05najthNEPLFIu3FVx50U2006w7gT+b0G
	3y4Q3kY2EanVuEKuZBF160FJj9SWr5qRiqBhpnQvBTjYeP3XKeAQPyT/d8ZXB2y/t/k00+tHgaWnn
	cZlBIhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAo5-00000006pXg-01RA;
	Tue, 24 Jun 2025 21:03:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5lc-000000069ju-47Sv;
	Tue, 24 Jun 2025 15:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2C905C67CB;
	Tue, 24 Jun 2025 15:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D022AC4CEE3;
	Tue, 24 Jun 2025 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779660;
	bh=V4cFT1hqRldsR5zu8HOg3Q2LTneYk9DIMbOYJXD5/V0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SpBF33O5DmWK2ju99YB+4lma9jKXpW06Qy7WaO72fUGRR1bwapxUreARlC7ACWT6K
	 d7vv4X3sGIn9LGbgcTNo3m5HJIra8v37CKiK8VkCbUNooIqlcYyh8VByADcphLjB9W
	 hYlSLlPFnIJKGwnFPitY38ytqBnIwNYFchiWpKgQFsRDQMDIhi5yhHtaKUrJqUIfhI
	 M+utXRuCz03/g3TIw4+WeJGu3yf5PFgqTBHYBduyJ+DgVZQ5TroV2E01VPGEMlzJrk
	 LU61+IsoQyxe1V5snMuI1Aeg04lidkunp9VMazrO8DDzUHZSLfluTSyWQAZA4nsWG6
	 Cps8jR3ACfGjQ==
Date: Tue, 24 Jun 2025 10:40:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Message-ID: <20250624154058.GA1478094@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_084101_065701_2D9F70F9 
X-CRM114-Status: GOOD (  18.24  )
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

On Mon, Jun 23, 2025 at 05:41:13AM +0000, Jacky Chou wrote:

[Apparently you trimmed out some of the lines that show who said what;
there should be more lines here like:

  > On Fri, Jun 13, 2025 at 03:03:55PM +0300, Ilpo Järvinen wrote:
  > > On Fri, 13 Jun 2025, Jacky Chou wrote:
]

> > > +#include <linux/irqchip/chained_irq.h> #include <linux/irqdomain.h>

> > > +/* TLP configuration type 0 and type 1 */
> > > +#define CRG_READ_FMTTYPE(type)		(0x04000000 | (type << 24))
> > > +#define CRG_WRITE_FMTTYPE(type)		(0x44000000 | (type << 24))
> > 
> > These are straight from PCIe spec, right?
> > 
> > I think those should come from defines inside
> > include/uapi/linux/pci_regs.h, there might not be one already, so
> > you might have to add them.
> > 
> > I also think you should actually use the type as boolean, and
> > return one of the two defines based on it. A helper to do that
> > might be generic PCI header material as well.
> > 
> 
> Agreed.  This definition is used on TLP header.  Maybe I will try to
> add some definitions to pci_regs.h or pci.h

This values might come from the PCIe spec, but unless they are needed
outside drivers/pci, any #defines should probably go in
drivers/pci/pci.h.

