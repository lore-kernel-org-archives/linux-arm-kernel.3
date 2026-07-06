Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ECDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSikxvuz0fdarLrs2WLzUhq/9C36cPYevojeibE+zuk=; b=P8Fbve3sCFUNKc9XNVPyQSMjg3
	F7qxoPkJ+vT4PtyiIVdYJ6bKMWuwbkBfZ2dJkInaE6P+YZP1qNAdYiD3jO6Oug8UXL4zUMXIkOWkO
	fBLAP7x6tFH6ZsQ2N5lyv8zhkoUSagWPMYddxIk5xGwVjw3e8VDgqFMBwopqpiyZ0WHcw905lj2qW
	VARF6hHXA3zz/yx4LWJG+i844zdQ9f0B4zMsX0jy8KHevvxQhrWraXKr3uuDH9/pBW4OayEOaDEbU
	+WQxXvrlx3RR07I3tN+WnGaBMi7bWj6kYtA4lAS8WCq5IsMU/+1+f+HIsVHa/pNHuM3XKGjgQE0KJ
	qk1rhgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglPD-0000000CvBL-2eQc;
	Mon, 06 Jul 2026 15:38:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglPC-0000000CvB2-36yf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:38:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EAD94199C;
	Mon,  6 Jul 2026 15:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AE51F000E9;
	Mon,  6 Jul 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783352326;
	bh=RSikxvuz0fdarLrs2WLzUhq/9C36cPYevojeibE+zuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EPY9l92BO8O5jYYnl7h9lLRbSlM0BEJa0uue0aFoOPStybvib7DPxEXFDhCT+/87B
	 yFDDSSH4qFc8BCqDrkinXt+2bQ4aLt5Y5iSoigcYq4fFFmmCEhIC1kseBeMaLAyZ8v
	 gFuMzofG6T70blVK6EPNMTncsGWWv/WjzDMB9DQgHdcfFyJEsuhclX92JoFgrDLhaf
	 WhcUfPJez+GKPnMMvuQKkL+kXGW9ZmeZOJKbF0z8yx7t71U/aeVfPiTnLUdk8IRw4v
	 QbGps9GIFsnFluaOH2xyhsq879YyNdu/TZ/VwmHRR/yrbxz+7Y/hnZImqhCuxN8pEG
	 FlCpnEx4ehuKw==
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
Subject: Re: (subset) [PATCH v4 0/9] clk: sun6i-rtc: Add support for
 Allwinner A733 SoC
Message-Id: <178335232274.3929059.7231678940771555249.b4-ty@kernel.org>
Date: Mon, 06 Jul 2026 23:38:42 +0800
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

On Mon, 06 Jul 2026 11:32:08 +0200, Jerome Brunet wrote:
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

[1/9] dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      https://git.kernel.org/sunxi/linux/c/7b9f8fe9c9e0
[2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
      https://git.kernel.org/sunxi/linux/c/38d6b194a21c
[3/9] clk: sunxi-ng: fix ccu probe clock unregister on error
      https://git.kernel.org/sunxi/linux/c/81f4ddc9f7e0
[4/9] clk: sunxi-ng: sun6i-rtc: clean up DT usage
      https://git.kernel.org/sunxi/linux/c/192c6220e14d
[5/9] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration
      https://git.kernel.org/sunxi/linux/c/d2fcd82ca07d
[7/9] clk: sunxi-ng: mux: remove unneeded export
      https://git.kernel.org/sunxi/linux/c/c52b5090bf1e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


