Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0778C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Hr782mSZI5ceafdgY5VkMwdJdBi/UGnv2pjWHVQ3L8=; b=gDvVgsX+Lc6z0RRByNPK4wfP1x
	l8dIEAnnnAzE5PEBA+L34G6g/uYZFc1s5A7rV7uU54VR4nRhjvexQ3TDWm4apFQ/ca7C9xazXMKnz
	c7/MPxueaeRvxdomsci0jNU9kdqIycE+pM53cydbC375/YFGuc7GaSK6ovjer5nyB/KlXAwr4i2PL
	eEup7AYYBp4FN9cKW5b3o8VKrVsbUnZ9l+4s+9/pn8t09dFO7DbV1z+YfDzBJwHa/R7eP5ZYZ691H
	AGpdT+8nb/k85Cc3dZLW74oXtsrNC7LNtm5rrTdie3OqVm7WuD9RL9Tf7psXKTHgTfQlmHpYLs7wc
	6knHYw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhZ7-00000006ZZ9-0jey;
	Tue, 01 Jul 2025 20:26:53 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhRN-00000006YZw-3FOp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:18:54 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 298F81F00047
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:18:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9CC87AC96A1; Tue,  1 Jul 2025 20:18:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id F0064AC9688;
	Tue,  1 Jul 2025 20:11:38 +0000 (UTC)
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
Subject: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Date: Tue,  1 Jul 2025 22:11:24 +0200
Message-ID: <20250701201124.812882-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_131853_982026_77FED26B 
X-CRM114-Status: GOOD (  19.10  )
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

The DE mixer clock is currently set to run at 150 MHz, while the
Allwinner BSP configures it at 300 MHz and other platforms typically
run at 297 MHz.

150 MHz appears to be enough given the restricted graphics capabilities
of the SoC (with a work area of only 1024x1024). However it typically
causes the DE clock to be parented to the periph0 pll instead of the
video PLL.

While this should generally not be a concern, it appears (based on
experimentation) that both the DE and TCON clocks need to be parented
to the same PLL for these units to work. While we cannot represent this
constraint in the clock driver, it appears that the TCON clock will
often get parented to the video pll (typically running at 297 MHz for
the CSI units needs), for instance when driving displays with a 33 MHz
pixel clock (33 being a natural divider of 297).

Running the DE clock at 297 MHz will typically result in parenting to
the video pll instead of the periph0 pll, thus making the display
output functional.

This is all a bit fragile but it solves the issue with displays running
at 33 Mhz and brings V3s to use the same frequency as other platforms,
making support more unified.

Also align and sort the fields of the v3s mixer config while at it.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..35fdc2451060 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.vi_num = 2,
-	.ui_num = 1,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.scanline_yuv	= 2048,
+	.ui_num		= 1,
+	.vi_num		= 2,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
-- 
2.49.0


