Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8776EC1EB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWKzf6vrUReo+tp1QBwyrmEp+vwwk6NvvtFGXbT83gY=; b=ky2sgOozyvJo3obMuYyyIecZAc
	3rZm1hyMEQDboPY3/swe5cFjognZbQ/EsQlhBSwphKy6GWVbQwVO5nqILFuQt9aYAP6BdPx7M/Upl
	BOqITjCpgRFjsMm6h94GCNAMn30zsrKtROdvj0u+eRJc1+vdD+KjB9NMW2Tw+ghV4b4iGpcODjQRA
	V6cSVXXyYalbihn216vsic9v5Vq2wA0JLWz1yU3gIEGRVGWoEohnK8wopdc5LHqAumnSDA4AA7AiN
	ux4LyCFhJnUmSR8HQCgSelmWQVjEb7vqyinIuZKKVe42KzWgi89cI+FMwFgR+e5In6i2WI3VIxpbp
	wXyc6JrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzPC-00000009ws2-1Hhn;
	Thu, 05 Feb 2026 13:28:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzPB-00000009wrm-05kh;
	Thu, 05 Feb 2026 13:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71CBE60010;
	Thu,  5 Feb 2026 13:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10184C4CEF7;
	Thu,  5 Feb 2026 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298100;
	bh=RVwIHojJPFtR1L6mECLDirnCU93wad5+Ug+yqXZvlGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCy9lXRU7VwFbtpEzZC8tJW3BxP0Y+kkOtXRSjO0Y/EbAqe2ZZTbmD3BTi+LY6IvV
	 3VDoNHBAthurR5saMIBgCknSgSKPY2kGtXATsfjShk+vrtTpIeuOCp/3+PRWt4h+7V
	 NfsIGMCSL9N8FHQWjGcnLmRfl9x363lCi8STV4b2xUCDb+V5S7N4RZFBFOyHW5eVAh
	 p+nrJ0Y1mgPjQ2mbhzLmSLjkiqokuvr17PC7JJzYeMGiQeTE4nPNaH4ako1HCiqwT/
	 303Cny++W7VOs+ai2NNL3LA5Vh9EvxCBWwE1HqldlEbOWmjNfjQjG11uvFZZKfRlIm
	 Z5WIAf475MuMg==
Date: Thu, 5 Feb 2026 14:28:13 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Ricardo Pardini <ricardo@pardini.net>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com, helgaas@kernel.org,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
Message-ID: <aYSa7d8G1adGho0z@ryzen>
References: <20251127170908.14850-1-18255117159@163.com>
 <f5322597-c6dd-494a-863b-2caf24363f2d@pardini.net>
 <1ff0d069-14f0-439a-afca-4ecc1b569834@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ff0d069-14f0-439a-afca-4ecc1b569834@163.com>
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

On Sun, Jan 18, 2026 at 09:26:45PM +0800, Hans Zhang wrote:
> On 2025/12/31 10:58, Ricardo Pardini wrote:
> > On 27/11/2025 18:09, Hans Zhang wrote:
> > > Current PCIe initialization exhibits a key optimization gap: Root Ports
> > > may operate with non-optimal Maximum Payload Size (MPS) settings. While
> > > downstream device configuration is handled during bus enumeration, Root
> > > Port MPS values inherited from firmware or hardware defaults often fail
> > > to utilize the full capabilities supported by controller hardware. This
> > > results in suboptimal data transfer efficiency throughout the PCIe
> > > hierarchy.
> > > 
> > > This patch series addresses this by:
> > > 
> > > 1. Core PCI enhancement (Patch 1):
> > > - Proactively configures Root Port MPS during host controller probing
> > > - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
> > > - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
> > >    and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
> > > - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
> > > - Preserves standard MPS negotiation during downstream enumeration
> > > 
> > > 2. Driver cleanup (Patch 2):
> > > - Removes redundant MPS configuration from Meson PCIe controller driver
> > > - Functionality is now centralized in PCI core
> > > - Simplifies driver maintenance long-term
> > > 
> > > ---
> > > Changes in v7:
> > > - Exclude PCIE_BUS_PEER2PEER mode from Root Port MPS configuration
> > > - Remove redundant check for upstream bridge (Root Ports don't have one)
> > > - Improve commit message and code comments as per Bjorn.
> > Hi Hans,
> > 
> > I've tested on an Odroid-HC4 with a SATA SSD (via an ASM1061) by
> > applying your v7 on v6.19-rc3 + Bjorn's 20251103221930.1831376-1-
> > helgaas@kernel.org ("PCI: meson: Remove meson_pcie_link_up() timeout,
> > message, speed check" which is required to get the meson PCIe to work at
> > all since 6.18). With that setup I get:
> > 
> > # hdparm --direct -t /dev/sda
> >   Timing O_DIRECT disk reads: 832 MB in  3.00 seconds = 277.33 MB/sec
> > 
> > I've an identical machine, with a similar disk (even slightly faster, on
> > paper), running plain 6.12.y and there I get:
> > 
> > # hdparm --direct -t /dev/sda
> >   Timing O_DIRECT disk reads: 764 MB in  3.00 seconds = 254.26 MB/sec
> > 
> > I repeated those a few times, not very scientific, I know; but anyway:
> > 
> > Tested-by: Ricardo Pardini <ricardo@pardini.net> # on Odroid-HC4
> > 
> > I've also feedback from another user running with this series with
> > success on a different meson PCIe machine, will ask them to TB as well;
> > they had reported a significant drop in performance since v6.18 without
> > this.
> Hi,
> 
> Thank you very much for your test. Let's wait for Bjorn's reply.

Probably too late for the 6.20 / 7.0 merge window...

But.. it would be nice with some kind of feedback from Bjorn.

Is there any chance that this gets applied for 6.21/7.1 or is there
any fundamental objection against this series?


Kind regards,
Niklas

