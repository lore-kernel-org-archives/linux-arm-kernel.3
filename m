Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MroTOxMmgxwRAhtMlsJpCRSnugYklaOaOLCLE5+XIJ0=; b=JDvmWxM/v3GAH5qAGHH5TPJlud
	b/yLpxBgecgDHh5E++xrPAhRwbqutcVSt8W/w7x1PLW7fI2n/vjimtYmvlRQT4Oc95X4IozUd2MYy
	XZBaeph8LfEp82bQzSx2d9qaZ5V6SH79p8/pbTWNCNcos7fHiKhuNdk+0WUEZBkNqY91/Xb40BEzc
	9t3YUvd5vtyIMGonWiEv//it8lXGOLApUnpq+Ie4brFosHNOAMaFs6lNuEjF707aSYU/V7/sgigvb
	bkHti5xLO0+WVu0qhdVmmaG+g/Duu2SV3o3t67fmbi6NTqkFqTUa/zy9ggGCq5cvV3OuT/a+FRaZk
	ZSfBWo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpFf-0000000BbaF-1rld;
	Thu, 10 Jul 2025 11:15:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnYv-0000000BLDl-0i8Z;
	Thu, 10 Jul 2025 09:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MroTOxMmgxwRAhtMlsJpCRSnugYklaOaOLCLE5+XIJ0=; b=eHA+B6I8H4ThyYpE9AGVQ0VVyS
	oBNaC/b7eWo69WNjLwIoWi3o83F9XieyNQb6GLcAC3RX9OXghV9TWUZrZCKn8Hpgv5hnatx4lHfZU
	K2jBfvGckT5Yf3JGZQDQBmStl8Mju2N5OFV6C8nF28v5qsX8QGiZRq2L3yxkh+DT9Gr3yj0/dlGtz
	voPJyo5eWhrgOsA8Zpx2+d7Rsyz8lvihXeKrlEAhfMMK1WtmoXhQifzqiFvgx0gPNMR/Aldp8SaeX
	Vgw8BRh6QYCAGcA9T7ZVaecx0Aexak9VDKw8OcEyKfOtslTjAp1Kr15ofXOxtxad8+CycyY2pAg8S
	GNcUv38w==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYn-0003fo-Rd; Thu, 10 Jul 2025 11:27:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] rockchip: rk8xx: allow to customize PMIC reset mode on RK806
Date: Thu, 10 Jul 2025 11:27:14 +0200
Message-ID: <175213962005.1887379.11523516137151032329.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022729_204532_8CD899D2 
X-CRM114-Status: GOOD (  13.36  )
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


On Fri, 27 Jun 2025 12:53:52 +0200, Quentin Schulz wrote:
> This allows to customize the PMIC reset method (also called RST_FUN) on
> RK806 PMIC from Rockchip, mainly found on RK3588 devices but also on
> RK3576.
> 
> Finally, this is required on the two RK3588 devices from Theobroma as
> U-Boot changes the silicon-default (which is suitable for us) to
> something that breaks our companion microcontroller's reboot detection
> which breaks a bunch of assumptions in the MCU FW code.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: rockchip: add header for RK8XX PMIC constants
      commit: 92056b3afde6599f0e125a89c9483bad6930ea85
[4/5] arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      commit: 03b77bbb428250d8359bc76ff5032534d33f8499
[5/5] arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger
      commit: b5c69adb3e27a5d31b733fbfbc32e5f036e21bed

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

