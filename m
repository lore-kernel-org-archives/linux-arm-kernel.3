Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48096CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGEpde/WcN2mOnAGcJm57uhoIH5udb9bO/gqHiAq7GU=; b=seknjN6ZgpPcPT
	4HmFOGzySx5V2jCANjmmOSsy/g40WWtw/+c/v5i3z71tgSYdbk3pY50duycWp6HoB0rV2R+IKaDFw
	1GcOguwO1uVz0hC+yrLBfpApOKwXMlVjVu+AoEJ5YiCU3fdROfVrvNm73AKRpO4kWhPMS62Id7Bpo
	UDpQJhBWFYkVSrV0hICS/dUHKyK9ycfSfpx/Ov1I9G3M0uVgWmSRNYTLQeiZiO9g2xsIIZ6n1URyl
	g3HuLUmZ+KAWl+7ywzGQyphOSJ8cfh6+T7NQmE9DAzRSxwdCWNdc8vKGIlFSmxGHqiH3vGzGImPPJ
	VcYWVWs+oVI1eC+nIVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvMr-00000000CM1-3BKT;
	Wed, 17 Jun 2026 18:52:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvMn-00000000CIt-3E7j;
	Wed, 17 Jun 2026 18:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722318;
	bh=nf6NkIlR7n2XLzubJdyTlml008+Sq48Xj1YMgHt8MX0=;
	h=From:Subject:Date:To:Cc:From;
	b=Cz60rWKvjgZKWs1Nt2pZGoXpNC9WdCKRF08s9piwZMrPqTDWW0ezC2srPnh6w0e7Q
	 /LvneQAFMBvGV2q7nqNqC6mN9Fxp1AOOL7Ab0ZBCBCydeYuA4AuXeHeOMjdwNj0QxR
	 wB/ms2KKfnU03vRaPKGjPb4TU4da532H8u1iyAxTVEcrPsZrnGQ0+cgY94iL3gptrU
	 uOCbcb4s3AN2DHHhzVdqis2brARiTzkgmjJPK5QkAfvDoCKxal/e6zIfeetAO1qq5w
	 72kPTAc+rMShT6wu1mrMvto6XtuPBQ19XQqSnzljZ4Q3THZLGaSyyyDrWZd/GITLBo
	 0zmTRgjwSSjwQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC17717E045E;
	Wed, 17 Jun 2026 20:51:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/9] Support 10-bit YUV422 and 8/10-bit YUV420 color format
 on DW HDMI QP
Date: Wed, 17 Jun 2026 21:51:53 +0300
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqEMBBA0atIrS1IAg54lcaFZUotQdtOHBHvb
 lqXb/H/CZ6dsIciOsHxKl6+Y4COI6i7amwZxQaDUSZVqc7QbtjZQfA34bGsaEg1GVFCVa4hRJP
 jRvZn+Clf+4V6ruf/Ba7rBqXfq3pyAAAA
X-Change-ID: 20260617-dw-hdmi-qp-yuv-2b0f7bb5ba81
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_115201_984326_08471025 
X-CRM114-Status: GOOD (  10.34  )
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

This series extends the output color format support of the Rockchip DW
HDMI QP controller to cover 10-bit YUV 4:2:2 and 8/10-bit YUV 4:2:0.

Please note this has a runtime dependency on the Rockchip Samsung HDPTX
PHY driver bug fixes posted separately as [1].  While there is no build
dependency, those fixes are required to address clock rate calculation
and synchronization issues that arise when changing the color depth
(bpc) while keeping the modeline constant.

Patches 1, 2 & 9 improve VOP2 robustness on RK3588, helping recover from
exceptions and preventing random display output glitches observed when
switching modes that also change the color format, e.g. from RGB to YUV
4:2:0 and vice versa.

Patch 3 avoids an incorrect DCLK source switch for 10-bit YUV 4:2:2 by
forcing 8 bpc in the bandwidth check.

Patches 4-6 are independent cleanups/improvements and can be applied on
their own.

Patch 7 adds MEDIA_BUS_FMT_UYVY10_1X20 for 10-bit YUV 4:2:2 output,
configuring the PHY with 8 bpc.  YUV 4:2:2 always transmits two 12-bit
components per pixel regardless of color depth, so from a clock-rate
perspective it is equivalent to three 8-bit RGB components.

Patch 8 advertises YUV 4:2:0 output, now that the bus-format and VOP2
support are in place.

Tested on Radxa ROCK 5B (RK3588) and Radxa ROCK 4D (RK3576), up to
4K@60Hz YUV 4:2:0 and 4K@30Hz RGB.

[1] https://lore.kernel.org/all/20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (9):
      dt-bindings: display: vop2: Add missing reset properties
      drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
      drm/rockchip: vop2: Avoid DCLK source switch for 10-bit YUV422 output
      drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch
      drm/rockchip: vop2: Switch to enum vop_csc_format
      drm/bridge: dw-hdmi-qp: Log resolution and refresh rate in atomic_enable()
      drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format
      drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
      arm64: dts: rockchip: Add RK3588 VOP2 resets

 .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 12 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 10 ++-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 13 +++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 90 +++++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |  4 +
 6 files changed, 141 insertions(+), 30 deletions(-)
---
base-commit: 2bfa2e7f19a106966ca97e0aaaad49e17f614cbb
change-id: 20260617-dw-hdmi-qp-yuv-2b0f7bb5ba81


