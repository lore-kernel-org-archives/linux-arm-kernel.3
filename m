Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E52E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRMeuuECKWEMnQesIIvnmoSPKzOb0/Suyg7J1F2G6gY=; b=X7ohxk9iQeN9dJolJEP/14Xh9B
	IH4x9yHWmNvtYDpNArsM+RyeEsIOqxqzF902bfyKpid8OnDus13F2dLd1yRoHWXJej8/IwM1Tnhco
	TonoTMoCyC9Q6f1QcXVJe7LBe0BJC1JSh6HjQlansp6br6F5j1wNBPER9prKKdao7BbaZOPEOet95
	i8s/TMX8b3WOf9k2zHV6wBqEGxNd39E1IF446CpR6h6VZu1Ft9t/kseG6TObND2a4Neq/1GVgkXBx
	9cWxy29zabVTLVOvouHeMd5XtpL7JCd8eZ4eojCizcssRSg+SjSr0Lch4bqDqrVByu9mD/wMD7/Ti
	ChMkEziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVXz-00000008VPz-1J42;
	Wed, 08 Jan 2025 12:52:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUgH-00000008K9C-2jbH;
	Wed, 08 Jan 2025 11:57:02 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AF3D625C32;
	Wed,  8 Jan 2025 12:56:58 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7STX7QO0Ro6w; Wed,  8 Jan 2025 12:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736337417; bh=5tK6T5BnxOGB8HNkuG5gnenqtrDCvmYdb2Y6OFf9yXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dS67wEdo9Xd9+EPbZHqPmuiPPKjnsk/abCj9X6pJGxK0aY4Ewgh5bpApkWMPK/sHz
	 lPDdsm2UDA6m0MugYuWB/o33inUlCLstXAiS4ZH6Zpi2bFFNLWpSMD7CpUFsalC2IW
	 PaVjXcIPNs9fXSWtSt0E+Kpfb4MSiUJUtxozAu1N0SNmuxMHprefb0zCv0Y9zj+mTG
	 WkuzW1qIVJCYgnaPig+0TOMSe4NRwIJsbRAKIrYKNyB82HxGWhL6+myYIAATOhG0Xl
	 QVPy52GK984Qh8aNroXOEx4MhQd861Lq/wJfyG54BL/Mjc46+qHlTCxTb+8jFz8dis
	 4aVXjh5G5Wdrg==
Date: Wed, 8 Jan 2025 11:56:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Support clock and reset unit of Rockchip RK3528
Message-ID: <Z35n_YBSAxWN-4DV@pie>
References: <20250108114605.1960-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108114605.1960-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_035701_822599_90E6D700 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, Jan 08, 2025 at 11:46:01AM +0000, Yao Zi wrote:
> Similar to previous Rockchip SoCs, reset controller on RK3528 shares
> MMIO region with clock controller, combined as CRU. They're represented
> as a single node in dt.
> 
> For the reset controller, only bindings are included in this series
> because it's hard to test the reset controller without support for some
> peripherals (e.g. pinctrl). I'd like to first make dt and basic
> peripherals available, then submit the driver.
> 
> This is tested on Radxa E20C board. With some out-of-tree drivers, I've
> successfully brouhgt up UART, pinctrl/gpio and I2C. A clock dump could
> be obtained from [1].
> 
> [1]: https://gist.github.com/ziyao233/032961d1eebeecb9a41fea2d690e8351

Oops, I forgot to attach the changelog. Sorry for the inconvenience and
please refer to this,

- dt-binding changes
  - relicense binding headers as GPL-2.0-only OR MIT
  - use gapless integers starting from 0 for binding IDs
  - make input clocks essential, add corresponding description
  - rename the input clock that is generated by phy module as "gmac0"
  - style fixes
- driver changes
  - format in the common Rockchip driver style
  - drop initializing code of the reset controller, as it'll not be
    supported in this series

> 
> Yao Zi (5):
>   dt-bindings: clock: Document clock and reset unit of RK3528
>   clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
>   clk: rockchip: Add clock controller driver for RK3528 SoC
>   arm64: dts: rockchip: Add clock generators for RK3528 SoC
>   arm64: dts: rockchip: Add UART clocks for RK3528 SoC
> 
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |   67 +
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   68 +-
>  drivers/clk/rockchip/Kconfig                  |    7 +
>  drivers/clk/rockchip/Makefile                 |    1 +
>  drivers/clk/rockchip/clk-pll.c                |   10 +-
>  drivers/clk/rockchip/clk-rk3528.c             | 1114 +++++++++++++++++
>  drivers/clk/rockchip/clk.h                    |   22 +
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   |  453 +++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   |  241 ++++
>  9 files changed, 1978 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 drivers/clk/rockchip/clk-rk3528.c
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> 
> -- 
> 2.47.1
> 

