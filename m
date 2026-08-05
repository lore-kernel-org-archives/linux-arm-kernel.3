Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A9C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6/3AIsV0xmrcsPgox9hI/bX0NsF+88akMIAPY+OL1Y=; b=qSHDp8mdgvoPxzlvIafvrtWiRv
	NQiOniQ562IPzcbdnE1Eohg7fT0Xa7sSxj5f/hoRE8usRQJF4NlgAcVasOdbeSuqkPj5rKv60RIkW
	VJNdq3QBJ+yR6ljwMGDni+rK+FiDa1FUXN2+TgZpIH4NzoSDGslWTlB5tvD9YBs141hEe1GLXpVWp
	Jwdfwl4FWXpDnkCWM4vXFGMcHxcU2GEP4hSePv7/EXknd6brBIYddS1ZtMWbZ/KhqtYeFZ0WZxMNS
	ro5fPT7oY+4VZ8JxLBWgQalxUj6qKRhL7TnTeBUPn/1gE+XGMr01Gnac6XH2KvvuKdklQakPmpVi8
	aUBpkiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdIN-000000049Mt-3j4y;
	Wed, 05 Aug 2026 15:12:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdIM-000000049MS-1eB8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:12:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A10600AE;
	Wed,  5 Aug 2026 15:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DEA1F000E9;
	Wed,  5 Aug 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785942757;
	bh=v6/3AIsV0xmrcsPgox9hI/bX0NsF+88akMIAPY+OL1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIRWqDKs0v0CODE0erL+54zLK9/Diq2Vr1LLPIO6/8wCQeFZ/g9z5vAcmz5e/t9ed
	 s1KwfVKSck6MzD15mSHs0Unn5Rdr/CpgfVfbeCzeR/7WOCJ2kNEcsv+49R8h1Tw1lH
	 8HNyCEVi2KKOGVmxbQMgKtmowPlie50r058KgvIi+A8+sNcqEhWWXWES87KfmPWrLS
	 5Uu9f66QZwC1WoD1s91ph2xCzuddPNnGUrCthul3qJc4fCdp+hR5gqkESWUqF6Tom8
	 LZ059vymSRfXXUrQSxOjqpKzYhzOprcMv3CYKhIHCh1mSHGKBwg47BLbEyLRzZX6Te
	 MkgvcU7ToKNzA==
Date: Wed, 5 Aug 2026 10:12:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pci@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Aksh Garg <a-garg7@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	linux-arm-kernel@lists.infradead.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v9 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
Message-ID: <178594272722.905042.3804777775947567354.robh@kernel.org>
References: <20260805-tegra264-pcie-v9-0-fa2ed7350ae1@nvidia.com>
 <20260805-tegra264-pcie-v9-2-fa2ed7350ae1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-tegra264-pcie-v9-2-fa2ed7350ae1@nvidia.com>
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


On Wed, 05 Aug 2026 13:57:21 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Switch to using the PCIe root port bindings in preparation for using the
> standard WAKE# handling.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 40 +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 

You missed my R-by...

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


