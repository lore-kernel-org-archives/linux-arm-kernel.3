Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BC4CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7DVYqEsZoZIpy8XkT/JPCi4Qx5M1ppN4ovFQN172LA=; b=H9Q36RkY2cwvS11hqxOUZq2hxR
	1d9l0eTd2OWmhIjdedXMzedAvW/Q96/faU5x/fiDQSoawqIQBEbjMTIaARj+JiVZvHVwERbBB3CDD
	I/102ffd3wUjXQh/m/DQWKMIVMC3JJ25FZZgGGy+xTpPHLG0O4FB8B7NvMR02+BNRIyGcoAZxIhmx
	UBQ45qZj/6mH4lr8VvnKt15SC4kWUQBNNao/WUBCKg4A+lwQkyCs6Jm1KAYscGwiGNLFDi00/Ot4Q
	BM/qgd2XjB+x/6/TupM3QOAFZEdWx2yUKfbfkCpmOU3cLneiavI72CwETrp0GZPf8+5ekKsYrA5kQ
	ufAN8mDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nHS-00000008RQA-1ADp;
	Fri, 17 Oct 2025 16:26:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nHR-00000008RPi-02zq;
	Fri, 17 Oct 2025 16:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D4A66052C;
	Fri, 17 Oct 2025 16:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12DDC4CEE7;
	Fri, 17 Oct 2025 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760718371;
	bh=oDHMy3vr+9Qtf5+BxB/LWUM1G0y5BBEx2S+OAkVam68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+8YGTUm5DRRj+PSEOr+b+35C/DdzCkNLCoKTghG4WwSDNg6LWVop/Ebxmmd4xOyr
	 yA9ryLKuB6UzANJSoc/YTxel2IgtGwklt1M7GDQ+Dyaun2QQlfgfekSyOEfD8BgkKA
	 0cbMHOAXnh3faqniTspYQ39jYxjWkL3rARpLy0livogtsRdbnMoNcEUq5/YWeO0GAB
	 ZBgaoEOT1d37lXNejE+0xH/d6F7C+dBtJIM8u1UGPzFmLgWB0p+6LB2R2zd1Uu11q0
	 +qv2HDSlIwe8zyuNVkUAa7WPK12eTDIIcL77VfhOf1lpQcAkt+99At0kta4jN2WBq0
	 yK7502pHdSDGQ==
Date: Fri, 17 Oct 2025 18:26:04 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Disable L1 substates
Message-ID: <aPJuHCuA2QempRui@ryzen>
References: <20251016090422.451982-2-cassel@kernel.org>
 <20251016172504.GA991252@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016172504.GA991252@bhelgaas>
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

On Thu, Oct 16, 2025 at 12:25:04PM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 16, 2025 at 11:04:22AM +0200, Niklas Cassel wrote:
> > The L1 substates support requires additional steps to work, see e.g.
> > section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.
> > 
> > These steps are currently missing from the driver.
> 
> Can we outline here specifically what is missing?

Sure.

> 
> > While this has always been a problem when using e.g.
> > CONFIG_PCIEASPM_POWER_SUPERSAVE=y, the problem became more apparent after
> > commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for
> > devicetree platforms"), which enabled ASPM also for
> > CONFIG_PCIEASPM_DEFAULT=y.
> 
> Should also be able to trigger this problem regardless of
> CONFIG_PCIEASPM_* by using /sys/bus/pci/devices/.../link/l1_2_aspm.
> 
> > Disable L1 substates until proper support is added.
> 
> I would word this more like "prevent advertising L1 Substates support"
> since we're not actually *disabling* anything here.

Sure.

> 
> If the RK3588 TRM is publicly available, a URL here would be helpful.

I couldn't find it on any official rockchip or radxa URL.


Will submit a v3 that fixes your comments.


Kind regards,
Niklas

