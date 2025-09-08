Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DDCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2AxZKf8ZmwoYHLXUE0gYagoUd0lTJYooLfNoe3vms4=; b=sJNyWrybPGhuwBuwwhAUOiqPAC
	OC4BIhqAgMKAN7swKdEh4sWo/ijnZ47E3EBzuQwlG0tZMDz2a8B1orP5TjecrCzKv3xGQ9o1rB05c
	zHd2Npo1ffiPq6pAusa5erNxO+GVscfZgmaIrTHRolb4RdOmeUmrAvBvsukLIH5IDIIuC696kdIuY
	8ndw7nDFWCo+UYuVV95U2+w61yrdNbVfsTncB4tUMVYBTwaa+dUzM64YUnkk4hkRlBGnmYjjcyzSl
	NO06pSaBaULJM1OtK62R3gs9TWbL9/B0yKlMukaHXn1QhYeeZwsRMC27QFdM7/dDUaN8OooYp71CF
	esBkrKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvh5A-00000001jkn-0XUq;
	Mon, 08 Sep 2025 18:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uve7p-00000000Yr3-1b8j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF1FC60054;
	Mon,  8 Sep 2025 15:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1985EC4CEF1;
	Mon,  8 Sep 2025 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346588;
	bh=QEkG6MGFd6wCgyTdrMCBAh2H91botqbPD1Iua5pCB8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8dmRxuoPPXoDzHo2FzdAlM6Wn+oBq6eoOkCPnirxucLaTnwKXBbNAxxxF2xxAgMe
	 lk24oN0d7WTo3wyANolZi3fQVDMscP7BBCPtaXIQJt5kHx781aJOwtx0bDjXn+/fwr
	 sVffPrHZIpkjtWVVt7k6TNDApA6bg2a0xpXeihDWmVD4pkmpwe7cuOmdMJHxF1aUZp
	 2xRdsV8tkeeCXsmOJslX1O7Bq+b9/BglGS+4KzygcmjjyUtl1d00EULx8P+aoaf1ox
	 33cV4a4jAiwrIkEZ6NF4K9rgXnF4Bnki3/p1D60gSX0IO21WND2hgPnxER838llfgA
	 rI8G6G82+Xz/A==
Date: Mon, 8 Sep 2025 21:19:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <ruhcvw3oqalrspkbl4ay5vebomatww6wbirwzowxyqxq7sdjou@yba5ri45j24w>
References: <20250820081048.2279057-1-hongxing.zhu@nxp.com>
 <20250820081048.2279057-3-hongxing.zhu@nxp.com>
 <ryvt2k2blew5wisy7edkjqdcmulrwey7lkeriasrmvaigpe3ku@vdgkod2bf7ma>
 <aL71k+CeZEwTnn86@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aL71k+CeZEwTnn86@lizhi-Precision-Tower-5810>
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

On Mon, Sep 08, 2025 at 11:26:11AM GMT, Frank Li wrote:
> On Mon, Sep 08, 2025 at 11:36:02AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Aug 20, 2025 at 04:10:48PM GMT, Richard Zhu wrote:
> > > The CLKREQ# is an open drain, active low signal that is driven low by
> > > the card to request reference clock.
> > >
> > > Since the reference clock may be required by i.MX PCIe host too.
> >
> > Add some info on why the refclk is needed by the host.
> >
> > > To make
> > > sure this clock is available even when the CLKREQ# isn't driven low by
> > > the card(e.x no card connected), force CLKREQ# override active low for
> > > i.MX PCIe host during initialization.
> > >
> >
> > CLKREQ# override is not a spec defined feature. So you need to explain what it
> > does first.
> >
> > > The CLKREQ# override can be cleared safely when supports-clkreq is
> > > present and PCIe link is up later. Because the CLKREQ# would be driven
> > > low by the card in this case.
> > >
> >
> > Why do you need to depend on 'supports-clkreq' property? Don't you already know
> > if your platform supports CLKREQ# or not? None of the upstream DTS has the
> > 'supports-clkreq' property set and the NXP binding also doesn't enable this
> > property.
> 
> It is history reason. Supposed all the boards which supports L1SS need set
> 'supports-clkreq' in dts. L1SS require board design use open drain connect
> RC's clk-req and EP's clk-req together, which come from one ECN of PCI
> spec.
> 
> But most M.2 slot now, which support L1SS, so most platform default enable
> L1SS or default 'supports-clkreq' on.
> 
> Ideally, 'supports-clkreq' should use revert logic like 'clk-req-broken'.
> but 'supports-clkreq' already come into stardard PCIe binding now.
> 
> One of i.MX95 boards use standard PCIe slot, PIN 12
> 12	CLKREQ#	Ground	Clock Request Signal[26]
> which is reserved at old PCIe standard, so some old PCIe card float this
> pin.
> 

Ok. IIUC, i.MX platforms doesn't always support CLKREQ#, as the pin might not be
wired on some connectors. So if the driver turns off the override, CLKREQ# will
be driven high, but the endpoint wouldn't get a chance to drive it low and it
won't receive the refclk.

Is my understanding correct?

I'm wondering in those cases, why can't you keep the CLKREQ# pin to be in
active low state by defining the initial pinctrl state in DT? Can't you change
the pinctrl state of CLKREQ#?

> So I think most dts in kernel tree should add 'supports-clkreq' property
> if they use M.2 and connect CLK_REQ# as below [1]
> ============================================
>               VCC
>               ---
>                |
>                R (10K)
>                |
> CLK_REQ# (RC)------ CLK_REQ#(EP)
> 
> NOT add supports-clkreq if connect as below [2]
> ==========================================
> 
> CLK_REQ# (RC)  ---> |---------|
>                     | OR GATE | ---> control ref clock
> CLK_REQ#(EP)   ---> |-------- |
> 
> 
> >
> > So I'm wondering how you are suddenly using this property. The property implies
> > that when not set to true, CLKREQ# is not supported by the platform. So when the
> > driver starts using this property, all the old DTS based platforms are not going
> > to release CLKREQ# from driving low, so L1SS will not be entered for them. Do
> > you really want it to happen?
> 
> Actually, some old board use [2]. we will add supports-clkreq if board
> design use [1], so correct reflect board design.
> 

Ok, thanks for clarifying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

