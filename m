Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AD5CEE351
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XcQg2tzVsKJDIpdwWAnv+WPfrLW5lWwDulro/w5UxM0=; b=a+WK2ehG0hXXus
	rqMid9z1vRDKQiJWvMDMYv+MuBR/1pLUqBXGhOJ1WvTTT3qRkr2a3IzocNEimgr6T0qVshU7BFuOa
	frrSVX872nHLtWGhrJkpSo2dyAcXpzdS64+4+Sj7RQzFyl5AhkEz4gO4tTxZ/IcOQWzPIL7gqQSzO
	IatSPhJI1J5ogtVjgw+mQQBI3cluPKL3XPbDN/tb53NvGIjC5UFWrn7jlb2f7M/zyLculXWrAcdKk
	m8O9yXUtwA8p2Ln6O0n9Xf6bplz75C3H527I/M0MZPObTlJ3bgH9GU2LeJILl5VE+mFclpgF3Qtuc
	T3/jIIGn+cpXg8/s8OPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSRQ-000000015Mk-40kq;
	Tue, 18 Nov 2025 20:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSRO-000000015MA-1LUi;
	Tue, 18 Nov 2025 20:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8911640C3F;
	Tue, 18 Nov 2025 20:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB59DC4AF0B;
	Tue, 18 Nov 2025 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763498201;
	bh=7+fzDFu+Xsrqk+asVMqRrwMUh6tY3yPTNkgieoOI/zM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YUKNJTdrgbSbMX3k+HhtPzZK7EHha3KqXakAdqfJuSLs3e1EuenP2tifpMHMuz+//
	 60L/jEi9R9dpl8wIyag9yLxPtGq0zTZpKEgLH6hXcMG0qZbrpU5/EJQdr/oWBnMSdD
	 Y5jrD4k4lBA0NE+z2nITN35iYooT8yy8YWTL4N9Elww8UNhtZOdhcEPpOzpCW5vUvK
	 Po4zHQQQEzU12iE+do16kxdomaLNC5Q03u19JQrcG4D6V4woIP7u2chMFlEK8QfJBT
	 5/sb9D1QRKk3MjjoVmBZSt6RA2AlSYOBCgdHf6q9TsCgelGKrQA3/os3D0WExgOB+Q
	 4i3wUV1L9RXCw==
Date: Tue, 18 Nov 2025 14:36:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <20251118203638.GA2591575@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRRDzKFVTFTIuvvh@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_123642_381074_9FF30D82 
X-CRM114-Status: GOOD (  12.30  )
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

On Wed, Nov 12, 2025 at 09:22:36AM +0100, Niklas Cassel wrote:
> On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
> >  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> >  
> > +	dw_pcie_config_l1ss(pci);
> 
> The name dw_pcie_config_l1ss() sounds like we are enabling l1ss.
> 
> I know naming is hard.
> 
> Perhaps dw_pcie_disable_unsupported_l1ss() ?
> 
> Or something similar.

"disable" sounds like something we do with a control register, and
here we want to remove the advertised support from the capabilities
register.

Maybe dw_pcie_hide_unsupported_l1ss()?

Bjorn

