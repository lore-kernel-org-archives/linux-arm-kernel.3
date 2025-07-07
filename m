Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFDC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=95qtSTC/qWsTSLa9j9zg9DGEk7v1YtKph8l3ru7WuWw=; b=uJbnN1/PCWP74K5fubIKZ7R9K4
	kgpneBbi983+TAstnh1CKoAj3kbFFXreh6tOGKAqHgFDz8dXJZNoaedUoPlRIuN5MVsRNz2mvJ0t3
	G57IV0xtgj96xxvhbSuy5g66WbDA6aDdKSHh7GgqwTdevW5K9xF+i33OaJp5PMm+Q7WysqArQLOV5
	xNu9J3eLnx50dWhrZu6zqse3VDqgPkuup2DF1g7A1qw6Dp2AF3ft8uvbcucqSRqtyXFQTkjEKZpCP
	ZlTLNHiYo0ZV0VlI83VdGj1E/38LV9ZKfeTA+VVZtFRv6SU0t8u8WowCeKqgK6JfpVOSomNRzxwY+
	B/AAzuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpbc-00000003AOV-0czb;
	Mon, 07 Jul 2025 17:26:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2I-000000033tK-1e3Z;
	Mon, 07 Jul 2025 16:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=95qtSTC/qWsTSLa9j9zg9DGEk7v1YtKph8l3ru7WuWw=; b=txXEzBC79RXkkWjmf9rB61w86m
	ebHNPB/2+iYG3yJd4uB84pjPf2+cuyBKBPdQj1+dgULhRtnOxwSvHr5Z/HwNurXhqi45rTBq7QOim
	C9ftmPi2bPIZrH77L9Bke67wO8cUh5VqCRLb9mxdoDbtVW4GfP3agGdSCXtUnfkEAmZmhgMi4ZZOH
	4eGG0Pv7Tj5nG8d5fvOE+q2+QGEXzGS87fFcJiPg3pmU2B6Nlsrj3YFy0Qrhj5yBKyBscQ/rbE2Q8
	/Al6Mz4lHbM5bQ0ebDvAq5tL7sizhnKjU8YO56T+momMV3C8cy8Vd0IU3Tih3nnhIPb0oahDE/pgn
	ivYB38OA==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1o-0004yl-T3; Mon, 07 Jul 2025 18:49:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
Date: Mon,  7 Jul 2025 18:48:53 +0200
Message-ID: <20250707164906.1445288-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094946_429246_28B8FBA7 
X-CRM114-Status: GOOD (  14.25  )
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

This enables all the necesary bits and bindings to get display output
on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.

A bit of cleanup of the ili9881c, because the driver was still trying
to send dcs commands when the underlying DSI driver might have already
switched to video-mode, which caused me quite a bit of headache until
I realized this being the culprit for my garbled display output :-) .

Only the last patch has a dependency on Nicolas' pwm series [0]
everything else, is directly usable.


[0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com/

Guochun Huang (1):
  drm/rockchip: dsi2: add support rk3576

Heiko Stuebner (12):
  drm/panel: ilitek-ili9881c: turn off power-supply when init fails
  drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to
    (un-)prepare
  drm/panel: ilitek-ili9881c: convert (un-)prepare to
    mipi_dsi_multi_context
  dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar
    Electronic
  dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
  drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
  dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
  dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2
    controller schema
  arm64: dts: rockchip: add mipi-dcphy to rk3576
  arm64: dts: rockchip: add the dsi controller to rk3576
  arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
  arm64: dts: rockchip: add dm-m10r800-v3s overlay for roc-rk3576-pc

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3576-roc-pc-dm-m10r800-v3s.dtso         | 134 ++++++++
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts |  16 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  50 +++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 301 ++++++++++++++----
 .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  21 ++
 10 files changed, 475 insertions(+), 57 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso

-- 
2.47.2


