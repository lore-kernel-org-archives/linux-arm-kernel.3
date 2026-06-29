Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEfPPsM3jAKLcsijf/AG4TNyIA2dGpwBNq8rgEHqEis=; b=GuHe45FYHYt4N684geL7HIeFx3
	Ss/QM3PXYJUPnhM0OikPkTbbs9ioOKGsJL2SPHUjkJbj5fAg9o/6dpfqzyKqnoFh+iWQ2plVyGQS9
	YbD2gbajxeelLuDR5HdUr7+Tq/1TvDr9A8v7wtL0Y73y7gG6Dy5cndMcK13LT24LJuAXQy/1aoqUl
	UY9Yyglds5u4slc4bPTDktJfYySV3P0VDKpRPkTmPEhQSGmQl2xt6pgoX/5FCxLelPJlPZs4ZQysd
	4vl0Xa5sYVXgb10Li5zN2+a8BLEHAZsTOBni/9irzrOUaOXWR5z6pqMyDdc5E2MHxj1JOryOn8Hob
	4WgBdExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEXI-0000000FASv-0Lg5;
	Mon, 29 Jun 2026 16:08:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEXG-0000000FASn-1xQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:08:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5CA403BB;
	Mon, 29 Jun 2026 16:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6551F000E9;
	Mon, 29 Jun 2026 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749316;
	bh=FEfPPsM3jAKLcsijf/AG4TNyIA2dGpwBNq8rgEHqEis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OQ3JsP621KGe/TOc4kdvokUJw6kAgo20QUzkiEX1kd066aIXDElMGmCie7KItne4g
	 qIo2Vl+qI3bWkQR4A8IUI5PSU9OoefyKUJIm+6erQBV74LG7ZPqvcrxc6aAg2Zaws6
	 DtORRJQEY1q3YSu5m/4+DJgyg/7RjwJX7fx6fJNnpqs131GqGXLXau0IblZ0OU+Ow5
	 Cfv7mvZxBIyrK0BcTv2CxCCxL2lMHnVmx2SuYzz9+B3nHHdGptuygCIqXGefNt+c4n
	 Qr4T6//BZRikzNhijn44GWvSkHxO0nwTRx4LcTdvf3DP0A9NspA/WMJJK6nLKWUmJa
	 LreGiTOC/9+0Q==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, 
 Lukas Schmid <lukas.schmid@netcube.li>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Subject: Re: (subset) [PATCH v5 0/6] Add support for Baijie Helper A133
 board
Message-Id: <178274931239.2343857.3591668827233792429.b4-ty@kernel.org>
Date: Tue, 30 Jun 2026 00:08:32 +0800
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

On Tue, 23 Jun 2026 22:48:12 +0200, Alexander Sverdlin wrote:
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
> 
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
> 
> [...]

Applied to sunxi/dt-for-7.3 in local tree, thanks!

[2/6] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
      commit: c3600c97eb9c1a20a933a7fba08272955f7a7ccc
[3/6] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
      commit: 1d81cb06c30746448deb73b6ce9ceccc9fb6ca37
[4/6] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
      commit: 5e5e8a2e5a5e31fbe8858f08ef7ac44dff9ee351
[5/6] arm64: dts: allwinner: a100: Add LRADC node
      commit: 8fa3a2bf77f0adb5440f25c3e2951543691e1536
[6/6] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
      commit: 7204944dcb8f1131b6303a5e9ca11128eb20ac21

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


