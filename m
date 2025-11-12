Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CCDCCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4r8kdH0pUswhe2luKHJzOMwnpCm6I7LsdwMbrtAnRnM=; b=mu+urwwCSPWpwToKkQ1qcEzJkt
	RE7EOlVkJ0DWyuc7IQwW6V/X+tVbIddLloo9kEBbn5poEgBpN8+ZlhmyMrxvAFyQkenTfjHxl0KMo
	VRGs0lWeMrH5u24fENB1+1bJsvPfc6i2UkwgWQutKAHjaN6XiHjnwRwiAodlck6WmztzWpq1EhvRR
	MNWuEyUM2cT0WhDti39BzcP9csDBZs6aw1i9o7anscVmuMBGqVfp3OlRBAY1Ner/Rw0Tpj15wDMHl
	22+KKRV7XdxY8OKId3o9Ka597N0Y2m8uwBZ39rnVlH4eTXmGOc+rVSr/lXwdz5eHCVWYy3vDRsGdE
	FzxQL1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EP-00000008LQf-0qZG;
	Wed, 12 Nov 2025 08:29:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EM-00000008LNy-3SkQ;
	Wed, 12 Nov 2025 08:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ED69406D7;
	Wed, 12 Nov 2025 08:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36568C4AF0F;
	Wed, 12 Nov 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762936169;
	bh=P/0U373DGH20CkAHJePNGHyKPPEzprJMAMaujhEWE3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6TTndyT/9VXKdEYPZNdVHH1e9mSNLLOM0nt2QNNuy2DF1zpJ7VX1W+XA8x8VBpFw
	 0q6reZVdpYS5+XUTeIlSFeRx/5l+TKy5+5Rh3Jtxytgs3/FTaIUG4PY7L+PNR7D4PF
	 wXiTYDw8GjkAr6Eq8wyo5PlZ5FKT6nEP5lRpV8aqYzrH0DwRY/S2dqMJrFElqiVqMn
	 RIDq1wZTZe7QbeVDI+1y+p6nbUc9YUwzB9djea+Ku5JeccJn6zwmtExUdHKGhMMIZC
	 bN3Wj70GJa9eWKC0+3SeaJ3f5uIehr962xnTbck2guqY5qREURZ8Vegcrhv4M/VpBo
	 +fZ8lRpBqYwzw==
Date: Wed, 12 Nov 2025 09:29:20 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Subject: Re: [PATCH 2/4] PCI: tegra194: Remove unnecessary L1SS disable code
Message-ID: <aRRFYEgBigYDlfQh@ryzen>
References: <20251111221621.2208606-1-helgaas@kernel.org>
 <20251111221621.2208606-3-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111221621.2208606-3-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002930_932592_281B2293 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Nov 11, 2025 at 04:16:09PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The DWC core clears the L1 Substates Supported bits unless the driver sets
> the "dw_pcie.l1ss_support" flag.
> 
> The tegra194 init_host_aspm() sets "dw_pcie.l1ss_support" if the platform
> has the "supports-clkreq" DT property.  If "supports-clkreq" is absent,
> "dw_pcie.l1ss_support" is not set, and the DWC core will clear the L1
> Substates Supported bits.
> 
> The tegra194 code to clear the L1 Substates Supported bits is unnecessary,
> so remove it.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Since init_host_aspm() is now the only place using struct tegra_pcie_dw
struct member cfg_link_cap_l1sub, I think that you can remove this struct
member, and instead make this a local variable in init_host_aspm().

Other than that, looks good to me:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

