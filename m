Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AEDE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ru7RwyL+CJ7uER1akGvQqx3XdofyG46q6eKK9gXYfks=; b=wuNTLO/g4Qz2cI2eDnmCsJqwNz
	1ys5VU2fjhl1MkX7RoMxlELfNL020efr1+/kHXAwvVw8uq4c5UnGVeITxNenzw6lczIRQMdJQZf3x
	Mf5R3X4VtqfLmPauwGtcsWM3cRtkniLh6gtreHyb1a09UjHuZKKqZ3BxBtiAQ082eUV48DaQ0p0t9
	zwpJ/Zj7r0NOH49SeoGSxMdhv+zd7KzwmSE9+aZsSSrV61urfy5Rspo9Ny3cuiEZ4gvL7HP6JMpmN
	SScJcpSxSztM2ggA6GF9MU22NO95s9vJeZD3PdVqiYpJ8UF3F9KNSABwBgJrjawZc+0gw27sHEvY7
	uhqTptgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVEh-00000008RL6-4Ar6;
	Wed, 08 Jan 2025 12:32:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUWc-00000008HGn-0idF;
	Wed, 08 Jan 2025 11:47:05 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 17E3325BA2;
	Wed,  8 Jan 2025 12:46:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62j2bRBfL7xo; Wed,  8 Jan 2025 12:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736336810; bh=d8i3e95o3rWAn73rKvyELQujij+rsxIOx8XWtH3VseA=;
	h=From:To:Cc:Subject:Date;
	b=TznitHwwVV+ARyAEY8k4gEocPC/w5PG9WCk6+gvqlcmtb0SmbADj4bdPaiggilc1o
	 mR2DjlwJ1fJq9M4TsnRTMTjSCXWl8IlL4V5lbwuMrkVzIb5lmRPgNW9SeVkp9XreDz
	 nqkNSj6cbwuoTb32flBVk2mz9yJB5sGDdGO3GGI1N7leEFdkNi0bodmcRvjzSvfRqo
	 XlxR5saFyx0h+dX0U2LCQJuHGkk4FBmnajM8WcVoffxnyEDwCgMbB+Mq9+gL8uXw+/
	 PRKJWkNV994o+clr4DUgDoXiRBIEDKfEDNALCWPkIQvOSTawFDt/x1zWEx8m7Z2oWr
	 OoSQa0NTftC2g==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/5] Support clock and reset unit of Rockchip RK3528
Date: Wed,  8 Jan 2025 11:46:01 +0000
Message-ID: <20250108114605.1960-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034702_612518_25591F0E 
X-CRM114-Status: GOOD (  12.39  )
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

Similar to previous Rockchip SoCs, reset controller on RK3528 shares
MMIO region with clock controller, combined as CRU. They're represented
as a single node in dt.

For the reset controller, only bindings are included in this series
because it's hard to test the reset controller without support for some
peripherals (e.g. pinctrl). I'd like to first make dt and basic
peripherals available, then submit the driver.

This is tested on Radxa E20C board. With some out-of-tree drivers, I've
successfully brouhgt up UART, pinctrl/gpio and I2C. A clock dump could
be obtained from [1].

[1]: https://gist.github.com/ziyao233/032961d1eebeecb9a41fea2d690e8351

Yao Zi (5):
  dt-bindings: clock: Document clock and reset unit of RK3528
  clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
  clk: rockchip: Add clock controller driver for RK3528 SoC
  arm64: dts: rockchip: Add clock generators for RK3528 SoC
  arm64: dts: rockchip: Add UART clocks for RK3528 SoC

 .../bindings/clock/rockchip,rk3528-cru.yaml   |   67 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   68 +-
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-pll.c                |   10 +-
 drivers/clk/rockchip/clk-rk3528.c             | 1114 +++++++++++++++++
 drivers/clk/rockchip/clk.h                    |   22 +
 .../dt-bindings/clock/rockchip,rk3528-cru.h   |  453 +++++++
 .../dt-bindings/reset/rockchip,rk3528-cru.h   |  241 ++++
 9 files changed, 1978 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3528.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h

-- 
2.47.1


