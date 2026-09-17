Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD90AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Y4Stguvv4qisH0fPq1RIyxcBBS2SKpn9CvuMKDsycto=; b=cL2HfZ7ltus4GaK2rvyuFTqjJC
	LwLdHRseZufWOzc895GFsSViyCHGiN+fDQr2zrx9DqbfSs+H6qboDreCweOWaD9H9UacPcdrrDcRP
	ThNV1ylQpsNM6bL7hftIPbvqjaGTJQ0lLgwBaVNWNLPimSL9JjMcZ5PdAoyUzpIebNmBkczL75CWN
	0vpoBBxwK4xF95eum1cRPvakhq7mkj4o1HggdQyU4aY2PmDmI177g7vaUYhH/wxbBbQt5Y6ciS+B/
	UnjyQ7LCKY+Go+ArdEtElTPMChLLlx2OkQTTV9VNaBTau60h5xYbM+6olQiJ3PIhRZOYyMvEXsffS
	CS850AYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jxd-0000000Caid-2cmv;
	Thu, 17 Sep 2026 21:48:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jxb-0000000CaiX-3Rs1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:48:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F17842DC4;
	Thu, 17 Sep 2026 21:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9DF1F000FF;
	Thu, 17 Sep 2026 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681683;
	bh=Y4Stguvv4qisH0fPq1RIyxcBBS2SKpn9CvuMKDsycto=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Oyssc8kfRJtxQUYmZyoym09iRqSHjV6Ctm4UAYxYb0nOQI1xE+zFfWTKM1f+a7SdH
	 dbBENlXzdGniqBn9vVw852O44pLeWh7ykZQV5vmhWbPanI0cadVt0v0Lg8YuD5Uswq
	 5BsyB4l/59kufDS+AmjLEy0Pp1ohALFqZyWeIxdmUsT+ywigcLyIHiyNTn7qnr4823
	 JntxQV14bOpwGPC+3k6OCv3ZlXxWnxHTg/DsgPFQVwiBEfmMxplVQ6JEKpNl/5pAzf
	 II0+6iulADewaFJmvPVkDWnkdz8vt3LuaeY33rftG5F3fAR0Ad6/ttcIckckWYQcpD
	 OU9jOO5q4QoPQ==
Date: Thu, 17 Sep 2026 16:48:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Semih Baskan <strst.gs@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, bhelgaas@google.com,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rosen Penev <rosenp@gmail.com>,
	rani.hod@gmail.com
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
Message-ID: <20260917214801.GA1054958@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
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

On Thu, Sep 17, 2026 at 10:27:54PM +0200, Arnd Bergmann wrote:
> On Thu, Sep 17, 2026, at 20:36, Bjorn Helgaas wrote:
> > On Thu, Sep 17, 2026 at 09:02:23PM +0300, Semih Baskan wrote:
> >> On Thu, Sep 17, 2026 at 10:59:29AM -0500, Bjorn Helgaas wrote:
> >
> > Then it seems like we should remove the "brcm,iproc-pcie" compatible
> > from DTs for platforms where bcma can enumerate it via EROM.  Those
> > platforms can enable CONFIG_PCIE_IPROC_BCMA.  They still need the PCIe
> > controller node in DT so they can use the wifi nodes below it, but if
> > there's no "brcm,iproc-pcie" compatible, pcie-iproc-platform shouldn't
> > do anything.
> >
> > Arnd, Rafał, jump in if I'm in the weeds here.
> 
> It feels wrong to me to change the devicetee file when that arguably
> describes the device correctly, and we still need the node for the
> bcma bus probe in the end.

I don't think pcie-iproc-bcma.c needs anything from DT at all.
Everything it needs is in EROM.

Some PCI drivers, e.g., wifi, need DT nodes, and I think those need to
be enclosed in a node for the PCI host controller, but
pcie-iproc-bcma.c itself doesn't care.

Bjorn

