Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB635C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=W7eB43MTeq7nWFW3XTR+enu6rx63bjAX+CaOgmEs9cw=; b=mTkBLCgTiQ2sCt
	0empqW/vtuIfOEVAZiFr0xTR9n3VjLjpXzpKJ/HwyO2ITYZuF9SNnEDyQQqkDahX8NH5ax4UcoLW/
	UV0N8P01KzOI3g4ShyrsbUj7ZsHy/TxH0zPBPEpGPNo4jgOwjkgjDOZdMbkJWxlEI5XxIGGss2Nj4
	I0nz+/YlVfJOk1+oyVFNZukQqla21ev324WICn1aoQ01H6hIliAufyy1niQqo94lTwI3XrBWP2P3f
	PBglIeXnHk1gMXSohmw8XoWfUEB3iK+RY0L+LEzXHQLOKiduynHGnyHY6YE4r/DszK3kxQf5TrKKu
	km4NOby72utk7c/VHYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWAF-0000000BYzS-31tM;
	Tue, 03 Jun 2025 18:15:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMW85-0000000BYpm-0Vk4;
	Tue, 03 Jun 2025 18:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B72361127;
	Tue,  3 Jun 2025 18:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F5CC4CEED;
	Tue,  3 Jun 2025 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748974371;
	bh=l7hazKp9x8Xzw0tllu2vo2pbAlO+wqbtKbXlvyCvQbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lTRLQ9RAjg2032UQ3WcGEkJraC27pGea5D0O1+9saGh01CsKarRaOhO9GnaSzW7RP
	 dBT90A1Stsb5fvRCythAVMy/raiTRdQYEYlTZJ7H+h/NaeO+R67lbnVxJ8JpWLz5dG
	 /Mymjs1NOGHedhNSaGEWGa/C/gADuBZivMkFjPyts10XrpDw/q8Tvafx+xHWOpn9zQ
	 PhAvcHi85CaYsiu8h2nt1/1VYHmf7f9AFoySdft6nwylSsvej1uO0WDsK9wtAqAIna
	 Ve0W6oOVQLByKO22AfW6bq4bpJ9RkWkOQv/MGcWKQNTyhZVbV5iub6Md3L/Fw+HHx3
	 H+nELnSQSBctQ==
Date: Tue, 3 Jun 2025 13:12:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250603181250.GA473171@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD8Bz4CkdnAd8Col@ryzen>
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

On Tue, Jun 03, 2025 at 04:08:15PM +0200, Niklas Cassel wrote:
> On Sat, May 31, 2025 at 12:17:43PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, May 30, 2025 at 02:43:47PM -0500, Bjorn Helgaas wrote:
> > > On Fri, May 30, 2025 at 07:24:53PM +0200, Niklas Cassel wrote:
> > > > On 30 May 2025 19:19:37 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > >
> > > > >I think all drivers should wait PCIE_T_RRS_READY_MS (100ms) after exit
> > > > >from Conventional Reset (if port only supports <= 5.0 GT/s) or after
> > > > >link training completes (if port supports > 5.0 GT/s).
> > > > >
> > > > >> So I don't think this is a device specific issue but rather
> > > > >> controller specific.  And this makes the Qcom patch that I dropped a
> > > > >> valid one (ofc with change in description).
> > > > >
> > > > >URL?
> > > > 
> > > > PATCH 4/4 of this series.
> > > 
> > > If you mean
> > > https://lore.kernel.org/r/20250506073934.433176-10-cassel@kernel.org,
> > > that patch merely replaces "100" with PCIE_T_PVPERL_MS, which doesn't
> > > fix anything and is valid regardless of this Plextor-related patch
> > > ("PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
> > > ready").
> > 
> > It is patch 2/4:
> > https://lore.kernel.org/all/20250506073934.433176-8-cassel@kernel.org
> 
> Hello all,
> 
> I'm getting some mixed messages here.
> 
> If I understand Bjorn correctly, he would prefer a NVMe quirk, and looking
> at pci/next, PATCH 1/4 has been dropped.

Hmmm, sorry, I misinterpreted both 1/4 and 2/4.  I read them as "add
this delay so the PLEXTOR device works", but in fact, I think in both
cases, the delay is actually to enforce the PCIe r6.0, sec 6.6.1,
requirement for software to wait 100ms before issuing a config
request, and the fact that it makes PLEXTOR work is a side effect of
that.

The beginning of that 100ms delay is "exit from Conventional Reset"
(ports that support <= 5.0 GT/s) or "link training completes" (ports
that support > 5.0 GT/s).

I think we lack that 100ms delay in dwc drivers in general.  The only
generic dwc delay is in dw_pcie_host_init() via the LINK_WAIT_SLEEP_MS
in dw_pcie_wait_for_link(), but that doesn't count because it's
*before* the link comes up.  We have to wait 100ms *after* exiting
Conventional Reset or completing link training.  

We don't know when the exit from Conventional Reset was, but it was
certainly before the link came up.  In the absence of a timestamp for
exit from reset, starting the wait after link-up is probably the best
we can do.  This could be either after dw_pcie_wait_for_link() finds
the link up or when we handle the link-up interrupt.

Patches 1 and 2 would fix the link-up interrupt case.  I think we need
another patch for the dwc core for dw_pcie_wait_for_link().

I wish I'd had time to spend on this and include patches 1 and 2, but
we're up against the merge window wire and I'll be out the end of this
week, so I think they'll have to wait.  It seems like something we can
still justify for v6.16 though.

This also means I don't think we should need an NVMe quirk.

> If I understand Mani correctly, he thinks that we should queue up PATCH 1/4
> and PATCH 2/4 (although with modified commit messages).
>
> As you know, I do not have the (problematic) Plextor drive, so we go with
> the quirk option, then we would need to ask Laszlo nicely to retest.
> (And to provide the PCI device and PCI vendor ID of his NVMe device so we
> can write a quirk.)

