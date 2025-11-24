Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C8CFD355
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tdjPnIM6TqpD1FiYWypJzBxdXFMlqjNcIoj6euKiUXg=; b=i+CEggsXwtjUdI
	/K/FRsC5PLFx+NtfUfAHQX4y/0fXVM8ZKN/11XArTplWAqhVJ0Oo/IBCx61dSFLtphx+nDJ/FG1D9
	GvcInsS7OtjzOztIisks8zZxeMFpkOZvaVxBFdzOdp4MDgltAE3ai4iJFaIOI9Q0W2Lp4LVfJv2k2
	7VwSz5qecxV53UX3kq3y4IPvieV72DhelbjMxy29RCOi7lA2CgLq3z6RBTdgUA7f0/JBb1BJqsZfF
	cIYJfT2RO5n0o6iHfIdXKXeSmBU7XjRqIkaC2v3zpd3kFx+vbbFvrUUwvHkPH+lOd+LjoNc5gFkuv
	mjF/CMAi1MrmEFDKDiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdxj-0000000CKUn-2kV6;
	Mon, 24 Nov 2025 21:19:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdxi-0000000CKUb-12IS;
	Mon, 24 Nov 2025 21:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FAC46016B;
	Mon, 24 Nov 2025 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA9AC4CEFB;
	Mon, 24 Nov 2025 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764019144;
	bh=DiDxFX94NXXIUzvxcS2+Fvuf/2KCTsklF/QbVLxONjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DNAG9tPd/4nqTFtv4FYVdApqANdOMIrVWr3lJDe2sCqX42/Zeq4glUcUMsPhjiD+Q
	 t2m7XFOTFBJhBOnUXsp47g2HExxgWWc/M14S26V+yUlO67lCX508xmAuCm2EQWMZw2
	 A9g6zO4z1WS9mllO+NiBHFuu7ogogLgoi+xlWZDuE4PeOTvPRBLrlW+QIX+D4AnHiu
	 ExwSSAnfYbD2Et6LgjBwH1OESwSoyPlL+5t+B8e6G+n+xmDrNVq0ILqfngMEvVR86r
	 a9TEkRX0ihIQi0Sja/eRtaJCbzbtDFER07VnFSBlrlpyMt1OtS6hK1uMjACv6wF2FN
	 5QMXNSJwunAtg==
Date: Mon, 24 Nov 2025 15:19:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/4] PCI: dwc: Advertise L1 PM Substates only if
 driver requests it
Message-ID: <20251124211903.GA2712341@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wja7vxtg7bqq2udepl5r3mvgg5swvuqtuzk6cnimgcbw2aegqs@hru6yzg4xx3o>
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

On Thu, Nov 20, 2025 at 01:10:56PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Nov 18, 2025 at 03:42:15PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > L1 PM Substates require the CLKREQ# signal and may also require
> > device-specific support.  If CLKREQ# is not supported or driver support is
> > lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
> > e.g.,
> > 
> >   nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> > 
> > If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
> > enable L1.x via sysfs, users may trip over these errors even if L1
> > Substates haven't been enabled by firmware or the driver.
> > 
> > To prevent such errors, disable advertising the L1 PM Substates unless the
> > driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREQ# is
> > present and any device-specific configuration has been done.
> 
> Going by this reasoning, why can't we enable L1 PM Substates for
> these platforms by default?

I think we can, in a separate series.  I don't have time to deal with
this before the v6.19 merge window, but you can certainly do that.

Bjorn

