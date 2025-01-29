Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4FC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnrEH7ymzFj0Eq2zj+qbM6ccXxcYazUhD2Hu1KRlJPU=; b=buy2ER7daM/4GVpiiZ56lL+1Ub
	cDPcKHXuiHHhBq3bpBGAWoH0YueDHi2PAxFMSTFMiaqaqIhNIsuZefoLTJWe6d8axt3/ZF8ZzuH+g
	0bDvlm1Zsot3Y8BigU6T+3fxHsuA9U60Oty25m2IAYR49P8sij/ZXJYsirz/5I33e/2LaunjO5ACT
	JSNA8wILFDMg2rfVXBNihJGNn4PlS/ZEy0EyrLf/HD+10ReqXKfMqMTzEB/qd7Kb207ec2gEowqua
	fE3VGuOnfY+dTQnZvqr4iRZ9wmGwigwCBElfHFhAvFYG+QtR8xOLuxToGQ3IqPMbOEGbhe6xaA2bH
	nh10MeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdB7P-00000007P6R-1qFw;
	Wed, 29 Jan 2025 16:40:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdB66-00000007Ow4-1lb2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93CC5A4157E;
	Wed, 29 Jan 2025 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3BDC4CED1;
	Wed, 29 Jan 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738168765;
	bh=Ah4vFnZwz/yZYDSuu8dtBEFULNvuptTD7Yx7PbHXAxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTnqnlG3+7YHKkHl0AKhQ4j0QCf1CqR4SYyHC+K5JQ17Ztjajn3FWmHT6+TggVeeA
	 ROt86ZitHHnWESUKMRQnUTmot8RyI3/Hc7DcqR/IpBhG+pPwt/DHfTJOI4rJZXeLub
	 DtWBWeV0wSU1n2LBxKn0rYgHcNAlpZpFqNGwtoCZlCvlyftJh+xmmkgxTF1SevIXRX
	 Zn/dbczsl5xpjlJ+dcYNbjphdUTeJqBehOpZDJt4ojjjlOfYYoWTVuROBbvxjDm//q
	 9On77OOIUHWyUzfozR12JD8NqQXaYP5/OtDGe6OmVYJ6AWoZHTkjASi0lkcuawFIpR
	 8RiI1H3ndLOeA==
Date: Wed, 29 Jan 2025 17:39:18 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v9 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <Z5pZtsa4FFKq0AZD@ryzen>
References: <20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com>
 <Z5n_VrN8HUmdVPUq@ryzen>
 <Z5pJF9MGENNDqq/O@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5pJF9MGENNDqq/O@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_083926_524418_04B16D6B 
X-CRM114-Status: GOOD (  22.41  )
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

On Wed, Jan 29, 2025 at 10:28:23AM -0500, Frank Li wrote:
> On Wed, Jan 29, 2025 at 11:13:42AM +0100, Niklas Cassel wrote:
> >
> > Please don't shoot the messenger, but I don't see any reply to (what I
> > assume is the biggest reason why Bjorn did not merge this series):
> >
> > ""
> > .cpu_addr_fixup() is a generic problem that affects dwc (dra7xx, imx6,
> > artpec6, intel-gw, visconti), cadence (cadence-plat), and now
> > apparently microchip.
> >
> > I deferred these because I'm hoping we can come up with a more generic
> > solution that's easier to apply across all these cases.  I don't
> > really want to merge something that immediately needs to be reworked
> > for other drivers.
> > ""
> >
> > It should probably state in the cover letter how v9 addresses Bjorn's
> > concern when it comes to other PCI controller drivers, especially those
> > that are not DWC based.
> 
> Thank you for your reminder, I forget mentions this in cover letter. I
> create new patch to figure out this Bjorn's problem.
> 
> PCI: Add parent_bus_offset to resource_entry

I see.

If you are solving this problem in a generic way, then it would make sense
if the generic patch comes first in the series, and then the driver (DWC)
specific patches come after that.

Your cover letter, including the subject is also written in a DWC specific
manner.

If you are solving a generic problem, then describe first how you solve
the generic problem, followed by DWC specific details.

See e.g. my cover letter here:
https://lore.kernel.org/linux-pci/20250119050850.2kogtpl5hatpp2tv@thinkpad/T/#t


Kind regards,
Niklas

