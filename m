Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF1C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VMO8u6ITbHz3dtOqznuom0tqAuyBCj5ypIb878/wt1g=; b=a68cpYIzD8gVDP3nIFiAf9p5K5
	1wRP4hRWHEKbV41Q6/NZXrSM0+1fQdm6VqqohGQ2iEOr/56B9f8NqrKjZy3l3BOktNz4zoiuWvJm6
	swXAbRriwWKIW8oS0GVkzbYZHrVYJRDpG8ha1mUaHMLMHg5j1Ny3gxf/00c4fD1ExUf+1pIUSbE01
	mU8623u9E47gir37j0BA1+WR5NEfaProEFSccijaSURvz1GpAQJGxk/kbrLEJf80k2e5eOcWoktbD
	oIF24Ddt6vONwc1qeqmJBz/1ijfrPSn6YpfK0tzAZ3LrP17ccidiHU3+auTqg2shi3KEY3dceLXTn
	grj9iX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoL0-0000000BpIt-3Ca3;
	Mon, 05 Jan 2026 17:25:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoKx-0000000BpI1-0Jjw;
	Mon, 05 Jan 2026 17:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C4D744110;
	Mon,  5 Jan 2026 17:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26B1C116D0;
	Mon,  5 Jan 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767633945;
	bh=yECq9Pg5qwIQCTGjYI+cgz+yczoMQEDsLhbkf0Ix9/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AofVgm4INyuCrEfqjmcCQK+Rz+kAJlDEzMrErH+w9xwVYvVFiP/LJ3/EPtoo5xP2a
	 WDvS81SE99+mRj/6WHQV8U7y3tB/BQGPzMiskZXg4OpEgI/WytPH28zCjDerp85LHW
	 kXbpGYZo0lxcZDDJmZltcdjyvVxs2SFOAbeg/MZfNzFGfi9LrI4rnf5TzrsSSin8f8
	 oQK0hySnBbGyGIGoWp74sItIIsI5ckyt4IzRRGTzQDf5fTo+JsyqkLK3fHo85NQSbj
	 oqeA/GjJp4p32ReA4/rcJ7qf432O1OwnEVqfoeMfjkHFpbpgNX+v4w3PkVvKEXvgGX
	 lShUYdwzpVzRA==
Date: Mon, 5 Jan 2026 11:25:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linnaea Lavia <linnaea-von-lavia@live.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	stable@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-ID: <20260105172543.GA320987@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092547_137927_59081AEA 
X-CRM114-Status: GOOD (  18.67  )
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

On Mon, Jan 05, 2026 at 05:49:00PM +0100, Martin Blumenstingl wrote:
> On Thu, Dec 18, 2025 at 7:06 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >
> >
> > On Mon, 03 Nov 2025 16:19:26 -0600, Bjorn Helgaas wrote:
> > > Previously meson_pcie_link_up() only returned true if the link was in the
> > > L0 state.  This was incorrect because hardware autonomously manages
> > > transitions between L0, L0s, and L1 while both components on the link stay
> > > in D0.  Those states should all be treated as "link is active".
> > >
> > > Returning false when the device was in L0s or L1 broke config accesses
> > > because dw_pcie_other_conf_map_bus() fails if the link is down, which
> > > caused errors like this:
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed check
> >       commit: 11647fc772e977c981259a63c4a2b7e2c312ea22
>
> My understanding is that this is queued for -next.
>
> Ricardo (Cc'ed) reported that this patch fixes PCI link up on his
> Odroid-HC4.  Is there a chance to get this patch into -fixes, so it
> can be pulled by Linus for one of the next -rc?

The Fixes tag is for 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic
Meson PCIe controller driver"), which appeared in v5.0 in 2019, so it
was a latent issue since then.  v5.0 kernels built with
CONFIG_PCIEASPM_POWERSAVE=y or CONFIG_PCIEASPM_POWER_SUPERSAVE=y
should show the same problem.

But I think that latent issue became obvious when the following two
commits essentially made CONFIG_PCIEASPM_POWERSAVE the default for
devicetree platforms:

  f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
  df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")

Those two commits appeared in v6.18, so I think we can make a case
that it fixes a recent problem and is thus material for the current
release.

Moved to for-linus for v6.19 and squashed your unused
WAIT_LINKUP_TIMEOUT fix.  Thanks!

Bjorn

