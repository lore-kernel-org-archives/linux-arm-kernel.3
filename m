Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A824C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFQGI06kexFLiZXhN70EcO5t/AU5IXTV7xLphoVtzPM=; b=B2ZCtCMFKTC0PoazRKRrbYsQnr
	UwjXFfI1Vrq/MSRbQY3NEXtET37vE3PNETju96E5T5xn9jqGNIvUeE069wxB4yhpThZl+xuEfy6KL
	SYVE68DhoaqDXCoxPIIjcqITeM+VuUew+aCCi1kUwms3xriWStOwthcEYddGYbcWmO67BMdx8uwAc
	TeNHDL+vE6dFmuXRyj4tBgrzMv03ZVgHMVedNY1geFRmnYNTXphArT+Q098slUETSLgVyULPkv9fs
	qh06pEN66BiYS8sXnhD7mDSNqwZwuKFBf1VjkXM9s2lprajfq92a78mmc782Uinpsh/n5wF53je4B
	KtQedpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdxw-00000004DYH-0H1g;
	Wed, 05 Aug 2026 15:55:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdxu-00000004DY5-3MQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:55:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EBB442E60;
	Wed,  5 Aug 2026 15:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB5E1F000E9;
	Wed,  5 Aug 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785945334;
	bh=LFQGI06kexFLiZXhN70EcO5t/AU5IXTV7xLphoVtzPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfQdXRbVh2zU0daL1aTm2PkOw3nd2jbX4SNmALPqeFqA9rbj49tHS0IgFRRBUa4K/
	 qDSyTt+0yRHzkEBqc+nC2lhJgL0ZsmbyC3M/SvuvPVhhwH6Q3OSjAwytBxRzxp2+3P
	 8iI+M+Z5GoGb4ch4C8JwGc+OM0aL1gmP4/8InTCLgEkDC7ZIvsKNe5JQtvrzWfvSlN
	 t8lgJTmom++iihD2H1K3JajA7h/ZSzE5Xkq1GMKT7jl3p8MmV1j1YAxyccQyI/MFSP
	 AUh+KkpiyL7psqQSkEjRVQL9HAYrNe8LcGlNBTAwxQHWQg/rZV/CuOGGlXhsJ/EQks
	 T/W2sx51PldwQ==
Date: Wed, 5 Aug 2026 17:55:11 +0200
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
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v9 5/5] arm64: tegra: Add PCIe root ports on Tegra264
Message-ID: <y7bq45p7dmy7zoz3kpwqzr77kmjr6ce52vukjeec2yvpni4twc@ale6wgwp7eos>
References: <20260805-tegra264-pcie-v9-0-fa2ed7350ae1@nvidia.com>
 <20260805-tegra264-pcie-v9-5-fa2ed7350ae1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805-tegra264-pcie-v9-5-fa2ed7350ae1@nvidia.com>
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

On Wed, Aug 05, 2026 at 01:57:24PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The bindings have been updated to use the PCIe root port bindings, so
> the nodes for the root ports must be added.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 66 +++++++++++++++++++++++++++++---
>  1 file changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index cf9760c681b1..31bd29df8e46 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3562,10 +3562,19 @@ pci@c000000 {
>  			ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>, /* I/O */
>  				 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>, /* non-prefetchable memory (128 MiB) */
>  				 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
> -			bus-range = <0x0 0xff>;

bus-range for Host Bridge is still a valid property and the drivers are already
parsing it. Even though it usually pass the default values, I don't see a need
to remove it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

