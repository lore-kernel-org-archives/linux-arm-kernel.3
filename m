Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00473C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8H31uu+L6Iim0WI2Y8wYYkLHekihp84U9rgYyxE8efA=; b=QGocIEprSsxW4b
	ommCzy1owWkW6scONPYRMPSH+Ue/YPwYDHYm3w73fiK6ZWhcoYpsRbptpYymydCxjEA4pl6z7BNd6
	yyaJjmaPJtPOzJX51eyt4q3gZbnCCpTlyuTp5Sxcyk3jZM03ZpnY30JNauk4JDafeu25ftf2fKYtQ
	bfVrwqBquSqZo5SV/maBW6XF6EQirAbx7riynzYAYRETnEBto2nUBFNaPzjcwCul1pSF84zjhwBiT
	Kp/zmMy55HuDrC8rS5K7uebSIrhzIEqAKZCt+f2nhS6GoFGqml3mBXbvQz+N1hQ85fMhYmsJdwgZG
	LcwmtgkMcTuS3z5rj4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihH3-0000000692H-40vO;
	Wed, 21 Jan 2026 23:06:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihH2-00000006929-27xP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 23:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09F466011E;
	Wed, 21 Jan 2026 23:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865A7C4CEF1;
	Wed, 21 Jan 2026 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769036761;
	bh=A3y3v8DhBf8ak97cYRv8mfNLKyWb9oqjh8kDSSAyi+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eZ4AoHFqcJgCaPcUpFywIssmFyLiu3n7l4xZSN+WbDubyVD1PRsJulu1T9Gb3pcB/
	 iHS0db6xUkWF/s8Wx2F0yxIqLcvBCx/sa8lFKQShWqNM07WZQLCGR/t4aCdjGCN+DQ
	 LB12bUXUKoX9l6Cz+RXHft37a/XwydThL/qViFVLvFwgKpsbtxWJMTL4Xmh3C1eVVj
	 r32kU0TJ6XJ/z9MBXjI/LPjYX23CxXEUOE/RkJcB/4Ol8AxUCh6YWZ/ZbyosVmuCkJ
	 PAbWZ9zcZZzjqVKYT8gewvS0yR5k/sXHyDxajxo61KTFgmhoorOxq8MikvFPz/Gop1
	 KMF3LtE4TW0ZQ==
Date: Wed, 21 Jan 2026 17:06:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	frank.li@nxp.com, kernel@pengutronix.de, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] pci-imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <20260121230600.GA1220566@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119100235.1173839-1-sherry.sun@nxp.com>
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

On Mon, Jan 19, 2026 at 06:02:25PM +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].
> 
> The plan is to add the wake-gpio property to the root port in subsequent
> patches. Also, the vpcie-supply property will be moved to the root port
> node later based on the refactoring patch set for the PCI pwrctrl
> framework[2]. 
> 
> [1] https://lore.kernel.org/linux-pci/20250702-perst-v5-0-920b3d1f6ee1@qti.qualcomm.com/
> [2] https://lore.kernel.org/linux-pci/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce903@oss.qualcomm.com/

Is there value in doing this?  It looks like it might be making work
for no benefit.

Certainly for *new* drivers and DTs, we should put resets in the Root
Port.  But this looks like you're moving them in existing DTs.  In
that case, you still have to support the old DTs where the resets are
in the host bridge.

If you are adding support for hardware that has multiple Root Ports
with separate resets for each Root Port, then of course you would need
to put the reset info in per-Root Port stanzas and make changes to
support that, but this series doesn't mention anything about multiple
Root Ports.

> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
> Sherry Sun (10):
>   dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
>   PCI: imx6: Add support for parsing the reset property in new Root Port
>     binding
>   arm: dts: imx6qdl: Add Root Port node and move PERST property to Root
>     Port node
>   arm: dts: imx6sx: Add Root Port node and move PERST property to Root
>     Port node
>   arm: dts: imx7d: Add Root Port node and move PERST property to Root
>     Port node
>   arm64: dts: imx8mm: Add Root Port node and move PERST property to Root
>     Port node
>   arm64: dts: imx8mp: Add Root Port node and move PERST property to Root
>     Port node
>   arm64: dts: imx8mq: Add Root Port nodes and move PERST property to
>     Root Port node
>   arm64: dts: imx8dxl/qm/qxp: Add Root Port nodes and move PERST
>     property to Root Port node
>   arm64: dts: imx95: Add Root Port nodes and move PERST property to Root
>     Port node
> 
>  .../bindings/pci/fsl,imx6q-pcie.yaml          |  29 ++++
>  .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |   5 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  11 ++
>  .../arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |   5 +-
>  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |   5 +-
>  arch/arm/boot/dts/nxp/imx/imx6sx.dtsi         |  11 ++
>  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       |   5 +-
>  arch/arm/boot/dts/nxp/imx/imx7d.dtsi          |  11 ++
>  .../boot/dts/freescale/imx8-ss-hsio.dtsi      |  11 ++
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |   5 +-
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |   5 +-
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 ++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   5 +-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 ++
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  10 +-
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  22 +++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  10 +-
>  .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |  22 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   5 +-
>  .../boot/dts/freescale/imx95-15x15-evk.dts    |   5 +-
>  .../boot/dts/freescale/imx95-19x19-evk.dts    |  10 +-
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  22 +++
>  drivers/pci/controller/dwc/pci-imx6.c         | 128 ++++++++++++++++--
>  23 files changed, 335 insertions(+), 29 deletions(-)
> 
> -- 
> 2.37.1
> 

