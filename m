Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7BC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+33+02q3USD8BW4O6FCHRaLhrU7UZ9PdeyO1KEEy0Bg=; b=ztcTjahxYdq+cPNhGv7vNw0OuU
	vHfSF9Flvo+IB9gQsNhtYhJt6UU+YJ/JiuvRoxoeMmEtX2rqxMH8jABoFwOeyXcQQ/4bD3N9hk99W
	+2d/dv+NrxV2DV5KnOnf1w8fwkZ2CQ2E/y2Sy7fh/XBANV3WeVT95i87Z4QcCchP8p+c3S6p2LSVF
	t8DjQ4SeZl9/hqPTdiJpN2tAuQGEYGMOBG4+Lq0Zwr2xORkEUbV/lnYMxXSmwX+0ZGhEYY8SNBjmQ
	elPm/PLULiarEfJb4pWR62pp0Ayy4U2Pyo02T0Fahh50Z06jZ87gex/cr9xYFJrHakkdIt6zJrlRc
	f03YtKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwH7-0000000Eigz-2Smk;
	Thu, 23 Jul 2026 16:27:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwH6-0000000Eigj-2xZ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3535640291;
	Thu, 23 Jul 2026 16:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A6B1F000E9;
	Thu, 23 Jul 2026 16:27:53 +0000 (UTC)
From: Chen-Yu Tsai <wens@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
Subject: Re: [PATCH v7 0/4] clk: sun6i-rtc: Add support for Allwinner A733
 SoC
Message-Id: <178482407296.3641802.877710077713530621.b4-ty@kernel.org>
Date: Fri, 24 Jul 2026 00:27:52 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 23 Jul 2026 11:39:50 +0200, Jerome Brunet wrote:
> Add support for the Allwinner A733 RTC and its internal Clock Control
> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
> SoC-specific RTC CCU driver to handle the hardware's evolved clock
> structure.
> 
> The A733 implementation supports hardware detection of three external
> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
> the driver via read-only divider operations. Implement logic to derive a
> normalized 32kHz reference from these DCXO sources using fixed
> pre-dividers. Additionally, provide several new DCXO gate clocks for
> peripherals, including SerDes, HDMI, and UFS.
> 
> [...]

Applied to sunxi/clk-for-7.3 in sunxi, thanks!

[1/4] clk: sunxi-ng: mux: fix determine helper rate propagation
      https://git.kernel.org/sunxi/linux/c/4bcba49984ff
[2/4] clk: sunxi-ng: div: add read-only operation support
      https://git.kernel.org/sunxi/linux/c/7bbbfcd4e495
[3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate
      https://git.kernel.org/sunxi/linux/c/176184e7f799
[4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
      https://git.kernel.org/sunxi/linux/c/0a136efc0fc2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


