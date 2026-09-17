Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3014AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VMuIqdf58whRQjARyNRh45d2VJkJgHaiJ7/sfPxyN00=; b=3kyKlohGSfgmMK1zAt/Rk0j8aD
	RG7CcktjjQFhbQyRw3KaU3XtnebppiZVCSw9GIeGiizTjTwu67v+LA77W+8P7xuG7vhvcp7tZ1MSr
	veptrjji5k7I5KiHlJghFJEeZ8bOen4QA9bRVAZPA22w0UAl7yVwrAAW2XdgGPqLrNyTrDwyMv6yD
	OEfZ68WZnthsbVae7pF1hXYvehGBN9oGiLLQneRTXkmsQS9Hjr9WvHS+k3nxuK2qowxyGz06Fs/K7
	sWw8COPUjzGYPlaSoIsy5DmM5kduWwdJTa6LTgiId9PLcCRVadHQxprbyOEB38t4Q0EFHNIPVEbqj
	QGMpaApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gxq-0000000CEyx-1jfR;
	Thu, 17 Sep 2026 18:36:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gxp-0000000CEyr-0laM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:36:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 804F343382;
	Thu, 17 Sep 2026 18:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358911F000FF;
	Thu, 17 Sep 2026 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670164;
	bh=VMuIqdf58whRQjARyNRh45d2VJkJgHaiJ7/sfPxyN00=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=TNLdW7SvlO9XQo7SLg+Cjq1f6IPm2PtSLg5P/LY4YJbLKi/nqQO1HS0nA3Z/1szCf
	 DPkSrvyFZ21h3lgVp4iUqEO2zDGGDHmeFDPwQEqjdqdhVsDE9QUhQ0clrfPAh3Sph/
	 EV7DvBW4jiPSvI9DvRxx216mrV/YK+zIn2muToEr2+BPCpUyHE/+mvu7M2Vl9rwnpG
	 7HkGpPciP+pQlLeSShO1kBsCdI5/mVOGa1GMuvsRtQGU/P5IZxZblhLnBPNsfI4dio
	 luuu9jrVathR962wMg3H+Nb2+fEgp2FM9H1uvv/7dkYUiq6CH1tM6sqEUExqoI95zT
	 OyS+jIJ4L9eqQ==
Date: Thu, 17 Sep 2026 13:36:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com,
	arnd@arndb.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rosenp@gmail.com, rani.hod@gmail.com
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
Message-ID: <20260917183602.GA1036092@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAsRjRmmPanAjpquZ4VnDDw9jqRkxPkLsu+KjrpwsOMj8-TE-Q@mail.gmail.com>
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

On Thu, Sep 17, 2026 at 09:02:23PM +0300, Semih Baskan wrote:
> On Thu, Sep 17, 2026 at 10:59:29AM -0500, Bjorn Helgaas wrote:
> > And why do we need pcie-iproc-platform, since pcie-iproc-bcma.c will
> > claim them?
> 
> I do not see anything on Northstar that needs it. I think
> pcie-iproc-platform is the front end for the iProc SoCs that have no
> bcma bus.
> 
> > Is there a requirement that pcie-iproc-platform must be able to claim
> > the PCI host bridge if CONFIG_PCIE_IPROC_BCMA is not enabled?
> 
> None that I can find. Neither symbol depends on the other, no in-tree
> defconfig sets either one, and multi_v7_defconfig gets both from their
> defaults. OpenWrt builds only the BCMA one. The one use of the
> platform driver on Northstar I know of is Rafał's: 767012397976 says
> it was tested with it on BCM47094, and his test in the thread on the
> axi ranges ran both drivers on his board. The platform driver
> enumerated the two BCM4366 devices on its own:
> https://lore.kernel.org/all/93ee7456-4179-4d78-b980-1df0b7e0278a@gmail.com/
> I have not looked outside the tree.

Then it seems like we should remove the "brcm,iproc-pcie" compatible
from DTs for platforms where bcma can enumerate it via EROM.  Those
platforms can enable CONFIG_PCIE_IPROC_BCMA.  They still need the PCIe
controller node in DT so they can use the wifi nodes below it, but if
there's no "brcm,iproc-pcie" compatible, pcie-iproc-platform shouldn't
do anything.

Arnd, Rafał, jump in if I'm in the weeds here.

