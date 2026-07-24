Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F7CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fmuSuFjeGJ5D4WsE4VEXbpB3s/xmO14YMbHHOgGrmE=; b=MYASjp6Xzf0QqdCCLrD/fqT+5v
	h5CAQeZylovhWba8N372gqmRRGe9l2pVrmtHu4SmXHEpuuuqAr8eU2O3vN3S5q1Pjmsl6TpANPViA
	MUZlbwrDtGC4Qsj/V9d3FFis2ZBKiio1UlFFbUoU9qSgut7sajCuXlF7v33D2YfOMx99rw+RWGTy9
	zbUSaEvBOXE/WG0ztvBFSIJxLhLR4EGk2+TuFgPuOWZi/PshWaT5HEws8y4zWB5yS6rf5WAAIfh4D
	GL1/mPL+vxqjDJp4Z8oBpqNIfuJKr6P+6bPT+/EejoQVQ8Hz4XTzwg5ixOhD3uZsJvQHZMF8whzza
	RalVrJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFa-0000000H0W4-2m4w;
	Fri, 24 Jul 2026 18:03:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFF-0000000H0EA-27XC;
	Fri, 24 Jul 2026 18:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=Ah3xn25WaIO3oVjfcohCOIu5yCkZ78AUJGaFQKCziwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eTi6cT3h0U7lfzTcFbv6uZaGA6t/XqdnuKNJCCjiu+7EqRfhryk70dbk/D6CjpLJw
	 p3dY/BIRNxXzkLhMC+3JxxMvvsabJgCeUH3/SK3GEjbmxh7Icf3IkCa2PvMTxelZaE
	 xh7LsbtID+5YblObgT+n8ozMRa2xkz5rB8CjIYiCjDbq36DWN1Z+PTwxQFLmQFVtgt
	 6wupYPDWWrNuCGRjr8sC1C/ud620kJUuVY1YDse60Ccw0eyh9ojiOyWRNejiVMovBs
	 ZNaDZwzdV8i7a0T2+1OIGySFeFCSOfnTIO9USKd/4yd54ENJVsxzJlP9JG/yJlOTfj
	 LOon8b7Cj6HLA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF18D17E0331;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0BD1480052; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:36 +0200
Subject: [PATCH v6 14/16] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-14-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Ah3xn25WaIO3oVjfcohCOIu5yCkZ78AUJGaFQKCziwM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPDVz+r5hy4sKdT3rO9mzWq/Kl4vHqrzS
 GdnWG1f0ODBm4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qaMuIP/0VBkA9aV2TS662kFCLMhWXoLPVngZzgcgOAamader0fo1GM9n4OP2yNAdzS+kJnP8X
 BssXPCZbMTmmZcBQAOrNIkJHrTUkd6kCrAsN4P7pc6MdZcwKgfKKGNEniDRt7wTqXSksZevdI1Y
 VJMklGZCw1iNYiA5hXHxcumd2fJwhZl3mUQT4pn66tySIh4AF7QTgpHTVVYA8/zOAQmOUvcaB4g
 Rljda4W+b89e3ZL0yDJpD5xXZytYQykvbyg7k3QV2izUmPCwpM7+w4Z22LVh1r18T29mcSEoC/G
 wVrA/QeuGy32Hu+ddY5q6pOAJAKlXygG3OeDOsLC2P4rWpltSk8iPfXSGHoPWcj6MP7iy8ZxFFn
 9xjn8bKIMfYkp2nQzkdS0yy3S0T/bLhMUobDwJaE3g5yro/HRGTA64eTlWmQeiEVvp14gCH9ggK
 IlhGlGQuX5ZUK9P1GogjLqUeUk9wu/khYfALHPlUO+3+vXyZHnHxHuOWEs0UefwJ+TjNRdjMwc6
 47KbLklMv91fyM0VTIhhhHw7Zg84FT6mVmOnl98MM++NpUYJ7QXm0bXwPhE0rqqMh5O6GFAWlSD
 FteDrjkgVnHGo8AWAacW0clgmmCXaMGraqSGl/6GOh8BiOBBn6UoxLq7AK+bqdNwaZJIgewsdcH
 1D+g5KzpKs7jQJlz8VawtCw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110337_726143_4788877E 
X-CRM114-Status: GOOD (  10.35  )
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

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 88b95938649a..44a13b5d62d3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1066,14 +1066,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return 0;
 }

-- 
2.53.0


