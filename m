Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C28CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNJW2FOcxRMx8g0HwLYlaYvNqq1871lvzmwzJwW0Q4o=; b=4vcyZTfvARdcoH6zEyJt996/Ig
	2dQJHLRa0KSOfX5nj7Zf7m7wJxDIo5+YDqEW63WJa2cMvDC/Vlaq5l7e9LkCyQXOr8Pau0utm+29z
	QSbbeTit32x6y12GJc6Jzaxhb3NK08MS2nEAxU3Tq8PvfByLukpwLvuHN3T95ddMWGuOIXPC+tX6c
	rFsFEjYPZVVBbsETYMpe42WOK/jmBsi375hfjeaO67lrVAE2/Dvh/Nn9hzHLlK52lthlenE9keZ4b
	3nuIjMSIzFxslOX3H2qcN2hYBUyMHb2tnpXCEyYmjUg6HxiGdfZIty5EqVazs2ezuccAlLG0lgZeL
	hz76YM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV8G-00000003Bef-1ycb;
	Tue, 29 Sep 2026 10:32:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV81-00000003BVr-3V96;
	Tue, 29 Sep 2026 10:32:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260929103203euoutp019df4610a93ce04c0ecd32fa3a015b468~ZxBV8RO0J2226722267euoutp01n;
	Tue, 29 Sep 2026 10:32:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260929103203euoutp019df4610a93ce04c0ecd32fa3a015b468~ZxBV8RO0J2226722267euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790677923;
	bh=wNJW2FOcxRMx8g0HwLYlaYvNqq1871lvzmwzJwW0Q4o=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=U5L+kLDT+5irPPeL74/HI6VIwKGOlhZDxLsc46RQpspfNDkhX7KsX8mTfh5iifRtO
	 SP8FMePcmDXLd2pbtw2ZdhXd3L5nW17FK1OUC44dcld+EZ9x6Qr6henV6bRWd0ClPV
	 bS8qVaMWH7W5udIJBUJSHv1wx1n58GgSjimIHgnI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7~ZxBVli2Q51628416284eucas1p1I;
	Tue, 29 Sep 2026 10:32:03 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260929103200eusmtip1e0732c9cf39bc631f62a3f49134213cc~ZxBTMaiQY0171201712eusmtip1L;
	Tue, 29 Sep 2026 10:32:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Sep 2026 12:30:58 +0200
Subject: [PATCH v5 01/21] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-jh7110-clean-send-v5-1-82b4d8e3c6c7@samsung.com>
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Andy Yan
	<andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,  Emil
	Renner Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Byron Stanoszek <gandalf@winds.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7
X-EPHeader: CA
X-CMS-RootMailID: 20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_033206_136033_E8ED32FF 
X-CRM114-Status: GOOD (  13.08  )
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

v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
opposite. Most CEA modes drive both syncs with the same polarity so it
goes unnoticed; it only shows up on modes where the two differ.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Reported-by: Byron Stanoszek <gandalf@winds.org>
Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
Suggested-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index dd35f5a875d3d842fee6d2ead0de88503f9914e1..d7c33b92e2ddf4ced84d17304463f44be52270b8 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -122,8 +122,8 @@ enum {
 #define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		((n) << 3)
-#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
 #define v_INETLACE(n)			((n) << 1)
 #define v_EXTERANL_VIDEO(n)		((n) << 0)
 

-- 
2.34.1


