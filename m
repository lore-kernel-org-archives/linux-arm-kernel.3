Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C4C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYfIiTljvUdNCRakllw3Wd86kd4UG5DQ4bHXp1kZS0o=; b=cBbT1YeRvknEYZCyi/ZQX4Voo/
	UcFB6tDZAwqCOD190p255PlAa/0JZJG9T/6Rg2ptjnJB69mZA1jyZseR0zJW5gdHeB+KqdEQly9k2
	2rez2X5sV9mpau2b8W/hisCBscfQkQvQQisJ3flFOyt7lmCvtcplGVydXliDaA91kDulLkPCwMATf
	U8X7Mqf8v0oDt1uM+A7roLhsHTut2ihWIn56srVe2K9TURghMXYNPSUso1mXlUgSrw7qUfM0r05g6
	2t1vnXkIlu/ax5ukBlPe6fAjJ92GSX4ZHVL0DKkZ466oWCOpuoZmckFvWh8bMo1tRHlcqxwY1LkTt
	TshTODCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbmR-00000001DUk-441Z;
	Fri, 17 Jul 2026 06:10:39 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbmN-00000001DUK-3Z5a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:10:38 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A7A71FB8A;
	Fri, 17 Jul 2026 08:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784268631;
	bh=MYfIiTljvUdNCRakllw3Wd86kd4UG5DQ4bHXp1kZS0o=; h=From:To:Subject;
	b=hk4lwR1CZ6JKHAz0z8HOasZPFaSinvtuTwX7pFtN44+cOF4LecRE00r1TcxgaUWLZ
	 MgfS8djpkpTGqBMMr/HLRBFlNiVoA4VcM76YAEMs66Y9G1OhpsNHCjbmbI2X16sdD9
	 KqqX0NUZIqEkE+DQzbGorLWzXhPz5ufx/L+EuvNlhN6dAkPHRdGmRZvzsm1qDNo1dy
	 f1z/Nww6QxgEsaudJoFkzuJRDbZpYEvrEG6jrPhr+7dlZkALaKgMNGIWKiKC0vrF4k
	 F57rZ+MP5O47KU/cuELfIBDeSUAl/fdDmxZoCDJGbpX76XTeJrVE/HqpqRqxcyLMIS
	 UbzhjI4QsNslA==
Date: Fri, 17 Jul 2026 08:10:24 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>, bhelgaas@google.com
Cc: hongxing.zhu@oss.nxp.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
	leonardo.costa@toradex.com
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <20260717061024.GA362793@francesco-nb>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
 <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
 <blkjlbskmfiyprh6wlbfilwlgjw3zkbslh6fpogcc5vcfu5dvn@hcrojgleuxob>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <blkjlbskmfiyprh6wlbfilwlgjw3zkbslh6fpogcc5vcfu5dvn@hcrojgleuxob>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231036_814331_056BBBCB 
X-CRM114-Status: GOOD (  14.45  )
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



On Thu, Jul 16, 2026 at 11:43:31AM -0300, Leonardo Costa wrote:
> On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> > From: Richard Zhu <hongxing.zhu@nxp.com>
> > 
> > Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> > introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> > sequence.
> > 
> > The issue stems from coupling PHY power (TEST_PD) and reference clock
> > (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> > managed together, the timing between PHY power-up and reference clock
> > enablement cannot be properly controlled, leading to initialization
> > failures.
> > 
> > Fix this by separating the two concerns:
> > 
> > - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
> >   logically belongs with reset operations. This ensures PHY power state
> >   is managed as part of the core reset sequence.
> > 
> > - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
> >   shared PHY power management, avoiding code duplication.
> > 
> > - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
> >   (REF_CLK_EN) control, simplifying its purpose.
> > 
> > - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
> >   proper sequencing is now handled by the core_reset functions.
> > 
> > This refactoring ensures PHY power is controlled during reset
> > operations, fixing the boot hang while improving code maintainability.
> > 
> > Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> 
> Tested-by: Leonardo Costa <leonardo.costa@toradex.com>

Reported-by: Leonardo Costa <leoreis.costa@gmail.com>
Closes: https://lore.kernel.org/lkml/20260629143439.361560-1-leoreis.costa@gmail.com/

Bjorn: this should solve the concerns your questions from https://lore.kernel.org/lkml/20260716172858.GA111215@bhelgaas/

Francesco


