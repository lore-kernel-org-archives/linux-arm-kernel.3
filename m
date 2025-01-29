Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BEAC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9entXrM8s3O7hnQLnPg81HwIjJedvRpLkUXihiMSMI=; b=zwbtqfffozHCqgCObU05CLrWLj
	PStNnjmDXeAtpMRhzWqqStId/QQL4tj4LlXdMk5Mjs/KqKRHDAY4m3rEURxxGL1G/gd/3KuoAnwD0
	ntjuCi1S9fAUojYooGs9AOnhKHW5MQntSazhcJL77sW+C82D+pT0EcJp/5DbpEMjpsa/ytBX88qif
	khUp7qpp70gszvQJLwSmMnf0q//Y3HdHFrVpwdlcAKxeCf0K5L2cOamvJst9O4Cp60WmrM0L0bW53
	r+x68r4CuC8d2nV2lNtZKwAdn6vnBjw6Hnrp4QcHxcSE+oISr9B+pA2eu1TWOup9VQA+/jNYRvT9d
	WL3wEx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td56H-00000006jOb-3rq5;
	Wed, 29 Jan 2025 10:15:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td54w-00000006jFc-2xdX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 10:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78BAAA41723;
	Wed, 29 Jan 2025 10:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D92FC4CEE4;
	Wed, 29 Jan 2025 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738145629;
	bh=h+J5mA+WmvhsE8mIU9p7eCMpAO/Myt/o9nAE8zizNZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaQKGXuncS+9M95nztFSZNUpOV/3xkX1UIn8ndUKBemW5eEaO9TD1i0DV60imXHOv
	 /RD5qK8IbnevUYj2u2/clYCmOF20OBp8XC57IjvKh6nCMqMIRlPBEaSSwKcMQV3ld4
	 +yeEwdtCsJ/zWz3naxUTsCivcDuAFXJ6bcgg5Z2+aiXH/eguM2bl9tiwiQNuFpvPOl
	 dO4kBbiljuDVaak1TvmjTwsZmALIu4yRpGMaWhFqK1o497PpG+O654aT3oRGduWm4v
	 UGJyOScDxBfu/lW67/i8zfOOK3NUfqGIbrJVgo7bDGH7kSxgzmXTR7FFZ5GHDu8Fic
	 oP6HHKeTWuaCQ==
Date: Wed, 29 Jan 2025 11:13:42 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
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
Message-ID: <Z5n_VrN8HUmdVPUq@ryzen>
References: <20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_021350_875495_080D152F 
X-CRM114-Status: GOOD (  21.39  )
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

Typo in subject:
s/opitimaze/optimize/


On Tue, Jan 28, 2025 at 05:07:33PM -0500, Frank Li wrote:
> 
> Bjorn's comments in https://lore.kernel.org/imx/20250123190900.GA650360@bhelgaas/
> 
> > After all cpu_address_fixup() removed, we can remove use_parent_dt_ranges
> > in one clean up patches.
> >
> >
>   ...
> >  dw_pcie_rd_other_conf
> >  dw_pcie_wr_other_conf
> >    dw_pcie_prog_outbound_atu() only called if pp->cfg0_io_shared,
> >    after an ECAM map via dw_pcie_other_conf_map_bus() and subsequent
> >    successful access; atu.cpu_addr came from pp->io_base, set by
> >    dw_pcie_host_init() from pci_pio_to_address(), which I'm pretty
> >    sure returns a CPU address.
> 
> io_base is parent_bus_address
> 
> >    So this still looks wrong to me.  In addition, I think doing the
> >    ATU setup in *_map() and restore in *rd/wr_other_conf() is ugly
> >    and looks unreliable.
> 
> ....
> 
> >  dw_pcie_pme_turn_off
> >    atu.cpu_addr came from pp.msg_res, set by
> >    dw_pcie_host_request_msg_tlp_res() to a CPU address at the end of
> >    the first MMIO bridge window.  This one also looks wrong to me.
> 
> Fixed at this version.


I feel like it would have been easier if you replied to Bjorn's comments
directly in the thread instead of pasting them here (to a cover letter).


Please don't shoot the messenger, but I don't see any reply to (what I
assume is the biggest reason why Bjorn did not merge this series):

""
.cpu_addr_fixup() is a generic problem that affects dwc (dra7xx, imx6,
artpec6, intel-gw, visconti), cadence (cadence-plat), and now
apparently microchip.

I deferred these because I'm hoping we can come up with a more generic
solution that's easier to apply across all these cases.  I don't
really want to merge something that immediately needs to be reworked
for other drivers.
""

It should probably state in the cover letter how v9 addresses Bjorn's
concern when it comes to other PCI controller drivers, especially those
that are not DWC based.


Kind regards,
Niklas

