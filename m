Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C0CF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmOvStNmdrckfoja8JaqT3vQDzn5OUwL0BcHOQj8moI=; b=mGgJLCuY9lNr8Ap0JSQTqSRr0X
	a9fRS2eIlkfdNVlT4x7yIc564XrELOC6/p64/CNGP4AfrJyYeyjiEfzFK3rObNOQhMGT8l0ocP/BZ
	K6W2UNnCCwQ3fibqjHuueSE/45OL26CWpStwk8SeQF753dmYF4DnFoRedraC0hpzlRlG6Gq6KE55r
	FuQOfpW55hUHnZFExKv5cdBuw9OdJrkKicfsr8sZXUrVLMUCVOGYZmxSmO58/cBDsHMXP0X2/9gjk
	OsdGllfYL8+RxbsboLyzUzpQCrSgvPyIE6iLrFbXT3mzJRmQWToYtEjSm5J/MoX16ABCFCwNWBEaL
	NkbSCLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUSX-00000001CEz-3U3A;
	Tue, 18 Nov 2025 22:46:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUSV-00000001CEb-2rAP;
	Tue, 18 Nov 2025 22:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD1743EE4;
	Tue, 18 Nov 2025 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFE8C2BCB2;
	Tue, 18 Nov 2025 22:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763505958;
	bh=lPmYAC5UhGq5csm5w1kpo4lzZfCH3Y5ufvUShymSFxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gf6l0GI2o2/EgE75LRuMBYxnQT61mUg8fexr0O/NLCVyFl0crqJh8ZyF60v86MbBV
	 oRyn3uZVM0CBaL8BGFVh4+c74IYt02Yal5tJJ1D06rwYgtUqwst9j2z0COSsZ9jZk/
	 OpTjOdbthQxGucQOfJqVgQbQeHeep42OYY7t0jaoPOtJERc3uAkFuSdmmlSV8JS8Q6
	 dMIt2Gbe6UsjWWkJL1pHh2lO891xUxdcoqW0UwqOy44hvWKNawpVvKhm3LPOSF5qQc
	 xsUfvQfQMN0mYU+FoMwH86p+YunCirxNYJbXMSsAckDLL8HITuWUhl823GeesM2N+M
	 VQINgYUfjydsQ==
Date: Tue, 18 Nov 2025 23:45:46 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
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
Message-ID: <aRz3Gnw-0IRtUj9f@ryzen>
References: <20251118214312.2598220-1-helgaas@kernel.org>
 <20251118214312.2598220-2-helgaas@kernel.org>
 <aRzxNMJ+byxZiF3i@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRzxNMJ+byxZiF3i@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_144559_740553_BCD81731 
X-CRM114-Status: GOOD (  11.47  )
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

Hello Frank,

On Tue, Nov 18, 2025 at 05:20:36PM -0500, Frank Li wrote:
> >
> > +	dw_pcie_hide_unsupported_l1ss(pci);
> > +
> 
> Need call dw_pcie_dbi_ro_wr_en(pci) to access PCI_L1SS_CAP.

I disagree.

At least when checking two different versions of the databook
(one very old and one more recent), the register fields that we
are touching are all marked as:

Dbi: R/W (sticky)


There are some other register fields in PCI_L1SS_CAP, e.g.
NEXT_OFFSET, CAP_VERSION, and EXTENDED_CAP_ID that are marked as:

Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky.


But since we are not touching any of those register fields,
the current code should be good as is.


Perhaps your version of the databook says differently than the
two versions I have, but considering that they seem to have
intentionally made these R/W without the need for DBI_RO_WR_EN,
I don't see a reason why they would want to change it even in
the absolute newest IP version.


Kind regards,
Niklas

