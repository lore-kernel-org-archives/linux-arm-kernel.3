Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C96C982C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy++5hODMX5p5YzKM/q7CyLQreC3FF6dizPunriWDeY=; b=XMxopk20uBP2Su1Fnt6URcOcfR
	XzbR5Lx1/k/leClc1cAa2EIDplnwCs6EhNqdL6+Z7ZHrkSqs3S/ObP2LEMng33NNyQEVPgCfAuOi/
	xG28YEALJycbuku5s/cpxcItu6L2/Dk2NIgMfq9l1XlYHCMblP6BEo2pHPkcEhxdOXJ28C5FzcwHk
	rKKqA8uDVtTlu52fp5iEPAkmAsPnKL7uYJcQ2/5xbfuHqCVnCfM8MlBEj87UgAzhsK2qmoabQ/ukj
	6RQ5V9mqhXtvwBWiNIe4PAWl8CDPToVu5fYQrqgoGSe/rrMp0UWKJwJ1FbA7Vu2AW7bcU6RrZOqSv
	ZlpAjwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqIl-0000000Eo0n-2moW;
	Fri, 16 Jan 2026 20:20:11 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqIe-0000000EnwZ-0nX5;
	Fri, 16 Jan 2026 20:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yy++5hODMX5p5YzKM/q7CyLQreC3FF6dizPunriWDeY=; b=DYHUvL393OJ+xbIZws/6ylBopN
	QZB7Ki0GETveZ1kNA8U0shbJGPXR+FDKt81LHAsxn48j/8zSky0vPuysK46tsAS3/0zWN1RR7cHPU
	HV2o9JqWSHI1ehH6KSZ3oNF+IeXED1vY4+0hbagg4YdrzOwEFxgJiS20fBrRtg2faislsaayMnqiT
	JPfG5uj19QUecdFyIrSeeQHhh/NIzr9cz5OoP4WRpIelfSC2k6XVw6IVlBm+cZwyrKeKysGUbKUQd
	mM2ic37DcI2SwiZWbwLvQHKSKg7SVugdcwbV63dkjH9Qo5yViy/akBDi/BxHGtPv2jMZn2PYoUpPN
	GUl9eO/Q==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vgqIU-006Ixj-Hy; Fri, 16 Jan 2026 21:19:54 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 16 Jan 2026 17:19:23 -0300
Subject: [PATCH v3 2/4] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-v3d-power-management-v3-2-4e1874e81dd6@igalia.com>
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
In-Reply-To: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=tKaBTKihufGpzplKTdtgDCmbllpsjApfHUu/YWFSm9c=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpap1cYiK+StQMlHBkqjaDzA52CLRKYITCDTkro
 gjI7KvkC5qJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWqdXAAKCRA/8w6Kdoj6
 qlnpB/9JA2Kxcwd7zMxAPVaMFaLF184UTVMzsZ6CEqfvBljDYWpC1FJxGVuimqMyxmOuWCqiPdq
 X3b37c5W1dpXU0FgDL1HPnaG+XkceMwa23dGgVfcLXFgrOckRjbYON50D/Q0Bm6o5oZDMWfBo4r
 wohfBpNotfCw45Y456T6IRW9uIQBhU4mavrN11QW7cUwyu2kM/76uIfCEYhKVwkxIcu4jzZFvSE
 i1MfAU+N+xg9NhAkGUGNiXdfku2zeOes2Fbfdjl1O7Of0IQ0rWSzZ13Agg6iZ2NQpnxgCtGDbOr
 wG/Q1S/Rv6y0xJhbhz4+TTvbvLJg9FXOUv84jAqIx4HJ8arm
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_122004_229622_12E78BC8 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
HSM initialization, which would result in a bus lockup. However, those
clocks are consumed by drivers (vc4 and HEVC decoder drivers,
respectively), which means that they can be enabled/disabled by the
drivers.

Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
drivers when appropriate.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9783385d5859836898683209e320fcc928dfdc71..41f058bf44e8a5257e4b2a90389b5e9525f2fffb 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -139,12 +139,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,

-- 
2.52.0


