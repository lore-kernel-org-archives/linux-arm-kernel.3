Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC84C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TbgArsRKHv5sOQzDNwVakhYRxBErq2BLBd9O8Ca1bzs=; b=t4VyLJLe96CSpfvisWZD2tyC/6
	eSwQYps4TZZrACv9fcSyr5t9X0uGHym3J2Vo7UfWTkPar7cXaFZCyVpYTpo7obJB9dn7DWrBQGm4W
	409UQ393d6ksT1sB/4zYKHLiS4OauuzqD3Dq7AJZjxB9InDSvooxeLDLhF2WZ9ViCeTM2v75poc/v
	lWX0rI7Jwi9LuLcCaJvwvVeaBni/Hv4Ip1GseQLUobqNpIGc42+av9nG1tzhRz8I6SneT++UZyfoC
	r5jPdea/ontjhEsVX4tzu3DL/lECN75y9OXJlQjO/XIH46GTEzdM4YgmzRGWzWD89x3U1pMlia8In
	WE+Dwz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKLD-0000000DmA4-22no;
	Sat, 01 Mar 2025 10:45:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKJd-0000000DlpK-0O3z;
	Sat, 01 Mar 2025 10:43:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2D81B25DBB;
	Sat,  1 Mar 2025 11:43:24 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC3Mny1iksiZ; Sat,  1 Mar 2025 11:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740825802; bh=WnMErFQKGyzYsxdI0ujG7rvJaR/CFTazd4MxR3w0Rdw=;
	h=From:To:Cc:Subject:Date;
	b=EZiQOsYqB3kMpB6EpYaGSf8co4UUq1tvB9+SYpPqC6XHSQA2L4QNRzW8yl7nB72f1
	 GqPDxGQz6ElTk0i6U7eFTdWU6EOm+DDiuw9lksbmJdZtNiPXzRzUjpmCNiF386isKQ
	 putn946KHxayUU9Iym2nHZmjGtKacKO6izBgYIcU5nACc5Nlk7XAkhNhfWpCbCFY2q
	 jzTUVsCic9/AI8mtLUaErntianqZUvhp7mLy/Z258dmNF1/2yWN0LbcPt3t60cfgOs
	 vytP3zPP1Q9+6lpX5hhgQf9wWxE02zFKufcVkWxAbyrSa5bMgZOLcs++jzOL8lrOMV
	 /0CQyjINCzeAg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/8] Support SD/SDIO controllers on RK3528
Date: Sat,  1 Mar 2025 10:42:42 +0000
Message-ID: <20250301104250.36295-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024329_526234_627C6CF7 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

RK3528 features two SDIO controllers and one SD/MMC controller. This
series adds essential support for their tuning clocks, document the
controller in dt-bindings and bring the SD/MMC one up on Radxa E20C
board with pinctrl set up by the previous bootloader. Both HS and SDR104
mode are verified.

Yao Zi (8):
  dt-bindings: soc: rockchip: Add RK3528 VO GRF syscon
  dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon
  dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for RK3528
  dt-bindings: clock: Add GRF clock definition for RK3528
  clk: rockchip: Support MMC clocks in GRF region
  clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
  arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
  arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../bindings/mmc/rockchip-dw-mshc.yaml        |  1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |  2 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 14 +++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 62 +++++++++++++++++++
 drivers/clk/rockchip/clk-mmc-phase.c          | 24 +++++--
 drivers/clk/rockchip/clk-rk3528.c             | 56 +++++++++++++++--
 drivers/clk/rockchip/clk.c                    | 42 +++++++++++++
 drivers/clk/rockchip/clk.h                    | 23 ++++++-
 .../dt-bindings/clock/rockchip,rk3528-cru.h   |  6 ++
 9 files changed, 220 insertions(+), 10 deletions(-)

-- 
2.48.1


