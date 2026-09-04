Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6B3C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsx3F22b54j7nOzV6Cd1dVpKZd9BXlB+FemZoo7yI+w=; b=KkNNWMr+cRThvSAtCUv4mH39vA
	4allwOx51TvxVRQnaKdPRecexhOBeCN6IX+VO4T3KZg4njY6mYdaMSlZEguyHYxdHYapRZRlVY2sy
	6HA8BzgJqc5h0oRypv+xQNr5KCbgQQ1Ca+TqUBicYrT4jc05D+uCb1GINtENof9/LjTXdRyVW+cEi
	u12eZq8hBUn+QaTUsaX/Wvxr8YwdEEnX04guX+6gvHNs6BKtZgF3BtZC/vyMGlFxkf4aiL0IfLrcX
	ae0WZuLZ75maRYFPkY+F3Wm/DG2yPykm354F3V/N2fci/shS3MKcpsyISTyVVvrTC3naBK/ZfpN/T
	4U0oqKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Txb-00000002Azl-12XO;
	Fri, 04 Sep 2026 13:28:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tx1-00000002A22-46iu;
	Fri, 04 Sep 2026 13:27:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132725euoutp023b927545ac8fd105a8924be21065423e~SISVFWUtu2507225072euoutp02X;
	Fri,  4 Sep 2026 13:27:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904132725euoutp023b927545ac8fd105a8924be21065423e~SISVFWUtu2507225072euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528446;
	bh=Rsx3F22b54j7nOzV6Cd1dVpKZd9BXlB+FemZoo7yI+w=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=T2rjYjKVkEk/bfmbY7gL+C/9He20gZgv6RzvRP3iZzvwpIdNbw2gIIXyJX5ilRpnB
	 fxc1WTOvvgpw3CmOagB99e3130j+nJztHdyIPM/8X4MgQclg3tgD7Sbl2xgWT73kXW
	 lRSjHvNwbEIqOeAjL5dCQ3NLs3LySLmSJ9eEFMSQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5~SISU4JP5_1857218572eucas1p1o;
	Fri,  4 Sep 2026 13:27:25 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132723eusmtip1b6082a36d93cd1731475a3375390118b~SISTLouDv1747217472eusmtip1S;
	Fri,  4 Sep 2026 13:27:23 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:10 +0200
Subject: [PATCH v3 09/19] drm/bridge: inno-hdmi: Add .disable platform
 operation
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-9-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5
X-EPHeader: CA
X-CMS-RootMailID: 20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_062729_890371_ADC00324 
X-CRM114-Status: GOOD (  14.46  )
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

The Innosilicon HDMI driver supports platform-specific behavior through
the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
platform-specific power up sequences (like enabling PHYs), it lacks a
corresponding hook for power down.

This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.

This allows platform specific drivers, such as the StarFive JH7110,
to implement their own power down sequence (e.g., calling
phy_power_off() and clk_disable_unprepare()).

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
 include/drm/bridge/inno_hdmi.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 8bd771761180473d221f59d5c0cd2a636e96ac4c..410a9eaa13541dfdacc5c96ba9a4d9dc021bc271 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -886,6 +886,10 @@ static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					    struct drm_atomic_commit *state)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+
+	if (plat_ops && plat_ops->disable)
+		plat_ops->disable(hdmi->dev);
 
 	inno_hdmi_standby(hdmi);
 }
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 81da9d9bcd79db8fe26c6dff4569371e484df608..5fca651c56b056d814124aa9c7e91aa7fd7ed1cd 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -16,6 +16,7 @@ struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+	void (*disable)(struct device *pdev);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1


