Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9923AC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ws6z16cX5b7DSK0LMoCkJvqtneDRoM6t8h5n5l6yRPY=; b=zrxansewTufc9wa3mAY998fXO4
	zImkvsxOl9mWJMfWRg/TltJi7QJnvi9iiCOGLlpoJ+Ms7v0c80qv0cVlzI5ZgbPFOw39c1UfyWmLc
	K7ytzvRKlkhDBjUzP+1Nh5bW05+o4lHTQMKM2j7vuLYJ+R6s/zIg87w+bn6wdIgL8iY1/K9edh68G
	yagelYK5YCz3iZWFujtHmAaKJLTyAJMZWq3QkoGf2x1Q77tTXvmXTFaaX2EonXJ1/O7hLvy1tDNsn
	k6GTSeOSPIy1wfwkClO2GczMEybXmErVTsPWts2u7BEhvkvT3v7r6kGHhsEoYJNXx/KkNTZsonW8E
	MIhjGXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhNY-00000006Xad-1sJH;
	Tue, 01 Jul 2025 20:14:56 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhLC-00000006XOo-2qUr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:12:32 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D96B31F00036
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:12:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 44223AC968C; Tue,  1 Jul 2025 20:12:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5A449AC967D;
	Tue,  1 Jul 2025 20:11:30 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl fixes
Date: Tue,  1 Jul 2025 22:11:19 +0200
Message-ID: <20250701201124.812882-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_131230_875623_2EA54248 
X-CRM114-Status: GOOD (  12.24  )
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

This is a mixed-bag of minor fixes for V3s clocks and pinctrl.

The last patch is a weak attempt at accomodating using both the display
engine and tcon along with the camera subsystem. The main issue is that
the tcon and de need to have the same clock parent, which may not be
the case depending on the pixel rate. Bringing the de block to the same
clock rate as the csi block helps in some cases.

Paul Kocialkowski (5):
  pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
  clk: sunxi-ng: v3s: Fix CSI SCLK clock name
  clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
  clk: sunxi-ng: v3s: Fix TCON clock parents
  drm/sun4i: Run the mixer clock at 297 MHz on V3s

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  2 +-
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  2 +-
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml       |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               | 14 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 12 ++++++------
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |  2 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  2 +-
 8 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.49.0


