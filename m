Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10B7C982C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfn0qHAXnC5r2c8zLwOe5UjZPw0lxw0YfKvyjJ/Tws8=; b=ha+zHEEX61QC3ztQ8cR9nyyZsj
	lPuWKanx46fkqN0pPI36wXBBQOrTvoR14m6+H6lA8/9i4C7TwmF2cLUQiivUDQjXWBnYJLLf56a6h
	FREQh/35swmZU6utegCnccnKiuuMJDE66lIJsJ/iIaBYKhYFwT6gYvtOvDso8+J0G/csUD+rszcbt
	y4N3WBrg2+tAL/qcwLIcenoGocKFDFPe68CFnigu/JKj9fx50HH7Az8Tkmjg9Pgqn7tV8btMjNm9w
	sLlclE/7KnvT9/e6Sehv9gWcOEGuUO6ENAhI9lot++Q66sAwn2UgQ4Z5tMVlVA3k1DH/VK0DAcneb
	ycrcde6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqId-0000000Enwp-2ee2;
	Fri, 16 Jan 2026 20:20:03 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqIb-0000000EnvX-0AiA;
	Fri, 16 Jan 2026 20:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dfn0qHAXnC5r2c8zLwOe5UjZPw0lxw0YfKvyjJ/Tws8=; b=PSbglL42p7h0UJKFqJSrrQhHeL
	NofEs+cXaA3dM5eh1YxhrGG8MBBesY4D9l1p1dPW9AX75ulZetLntTk+JHvdosWtpPSbUQG3CXfGo
	v7ceEl9YrR5yeJI3dxwbgOPI/6lmoaJKtHNU1CPXcTvirD5/EAmIxw7pJYjx3Pt5E0QCfZdopZGzy
	ESoLAk7f920kDCUnFPgP7pp/LoAA4KICNk1Q2PbcaI0N2pK1zqD+h+6iPdw/EyApmULq5i4xqivEr
	zpeisH1fy8DeRFZfbYLmpnF+BEMNsaYFL11SVmH9+PiGu+QO66bZxYAas8SBKh3+dBi91ukk4addb
	d1dZM3KQ==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vgqIQ-006Ixj-4a; Fri, 16 Jan 2026 21:19:50 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 16 Jan 2026 17:19:22 -0300
Subject: [PATCH v3 1/4] clk: bcm: rpi: Let V3D consumers manage clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=a86ujsJ75WvlFh6AWb20qgMJjaYWLO1/IG/W48O2Xpo=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpap1c6H41PkO94M8KCrXwgsVZGuQlnnxt4UI0A
 QzqWL759juJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWqdXAAKCRA/8w6Kdoj6
 qr0EB/9pzfAJNi7siaK97trfApJY/wPuh1JEKAD3ceTb3DqBmtPB2bczed8FERUooMEjtQKTQWI
 5x3pf+rnTU+9Pypo4eOEa5vR0RMqfymQsDgenaDoqcVdFe4OMMbFDXtWvYlr1iY1qfCmFnF1Huy
 TGnGnS4J5cG/li/vtVibjQ1edKt71z0hySa8kFysV6Wn3zf5+DeRlVFtohaAur8ZJUoK7XM0d7X
 j9mDf54CreIWMaHkUlY+rc510TgCPmnjFR5+mcsXAUJEY8duHKCqtxpO69Xlqx2Elvql+mtO2vH
 CD+U6xTnocfY3vJrBbGU73M4jVLanWtbx85snRVgG3nkeacf
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_122001_462641_266A29F9 
X-CRM114-Status: UNSURE (   9.89  )
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

Remove the `maximize` infrastructure and don't set `minimize` for the
V3D clock, giving consumers full control over its rate.

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power consumption
reduction, consumers need to set the clock rate to minimum before
disabling it. Forcing the clock to maximum rate in the clock framework
prevents this, as consumers don't have any flexibility over the clock
rate.

This change enables the v3d driver to control the clock rate directly
in its suspend/resume callbacks.

Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209e320fcc928dfdc71 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
-	bool		maximize;
 	u32		flags;
 };
 
@@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.52.0


