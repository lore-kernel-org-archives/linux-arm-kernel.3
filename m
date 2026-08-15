Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54005C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOO4PTBjIrBj1DLwftmnetVO7a1uDaMSF8dYKtQH0zQ=; b=fl+5Zffd99IBAqNJLSLv3hmg1j
	485mHnpbEdo6kvLTgcxRv7wfgkl4G5gcqxTtloqdl7v/z9ZdLiWHpPUcT9mbsZ4fOugrfhoBSZQCb
	cDQGMZ4hz8ZwwC3W/5TVLLTK1+IG1zdZzvoayaKKrrVlBSVc44pjtZpGF+Rq6jVLi/F46dBtD4Ecd
	r1ReeMMKlC/p0F605hpsd+iQpZUYn2oykfQoFlT4HHxDejbWrg+5GdpDjEwJjUEIb70hrVA+B/y0d
	npkKyF7sVwCPk2j9z3y6sXS0R2UzYPP+eyxgW7Sk1pWKmtljgz61qWLWPULp0DjA7Dyn47fEO7xSM
	YCG2oLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv8G0-00000003bLo-0yrw;
	Sat, 15 Aug 2026 06:52:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv8Fy-00000003bLg-3i4f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 06:52:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0146541356;
	Sat, 15 Aug 2026 06:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C401F000E9;
	Sat, 15 Aug 2026 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786776757;
	bh=SOO4PTBjIrBj1DLwftmnetVO7a1uDaMSF8dYKtQH0zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G82hCjGqOgxpxNBebL1MWeSdMBlWcWVqL6adEDg7CdG8GxfnpFKa0Q4r5rJSOQoDI
	 tfCV/pIkdlTK+zPm2hJeVxOlFAtH59aX78g+x6rUELzzlXjKHUxPXBMOI+zf/CxPcw
	 5C7iYHM4wKtugqDLvkWCvYLok8HC9ZAE7RSqFVpOVsd3DvFnPyJHLjQoG12b9Am1HY
	 YVAbcS6owau8a4cLSz5+nVR2PfcAZwa2u5MCRNvQgHGB+P4Ju1gCEeGyIovRCWbchk
	 GEIhhZM8nErP1gs4ipZ+s4Lx/n6/bDmF/VFW+WPlrjCnuxAR2ukGYZp9+UmLELA05V
	 RahRwOSEPQNbw==
Date: Sat, 15 Aug 2026 08:52:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v10 3/5] PCI: tegra: Add Tegra264 support
Message-ID: <ajpntb2f62mpevhofuv2mdpgsktzp6gwcvu2euka7qu2n3f7at@fp3q5fowyvgg>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
 <20260814-tegra264-pcie-v10-3-05d08c592b05@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814-tegra264-pcie-v10-3-05d08c592b05@nvidia.com>
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

On Fri, Aug 14, 2026 at 05:38:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> driver is very small, with its main purpose being to set up the address
> translation registers and then creating a standard PCI host using ECAM.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This s-o-b chain is cobbled.

1. If Thierry is the Author, and if Manikanda co-developed the patch, then there
should be a Co-developed-by tag for Manikanda.

2. If Manikanda is the author of this patch and if Thierry is just sending it
along, then the authorship belongs to Manikanda.

I've applied this patch based on (1):
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/tegra264&id=d56131f7a401841c09b6611402a8d2e795da3a6b

If that is not correct, please let me know, I'll ammend it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

