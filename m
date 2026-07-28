Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B96C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlT9fhF2rBOhhmFDXXUOoeGtMETHG0ziNysTxtoJM+A=; b=QimoaUXWV3ZHFmwUEdXdPx79UK
	WPB9oPwm/gRKrRRjRqpHr5Sm8jvc1sOPthVdCzGIHVIlRZjh3UWLf3+4/dXDghK11EL8P2NMVADyV
	VQPObtCmbajpXVa7Sea0xGDCyOip9ES2hrnFiop8tjisvj7UdmdHf6+AqPZCvAg4MTjB4tWgP8rjY
	ndDfaE59w4JER4zHl/hxTSpitTZbDceq1bVCvokTDLitL0BPVSUmki7FBIo9KBH+l7/C4QAB1T6VO
	NeE5RVMwxKR0iJwUnWvIUJqJQilalIPp+eg2eu1N2rq/U8gol0NOk6ysXpmKrcuDjqJNl6FU8Bn5+
	52fNXSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnx-00000005zYO-2Bru;
	Tue, 28 Jul 2026 17:41:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnV-00000005z6A-0nhH;
	Tue, 28 Jul 2026 17:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=0YCsZJX71B73vAdxDS8uxgokNO/lK8lrhxEaeQjUJ7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jI1/8MQcxpPhgdwJWnSUICz6F6lF3ma4Am5PJR+O3qUd4tEBZiKGXbnKRwNgaj7hq
	 fw/o3S/O+oDvfNnuJ9EjslKzWv2i7CZWU6RS8f4wEBDY4l1Qk+0Olk5KUby5Jm4PrD
	 RSBpQibGObKz6He+zIsBhI2F0jj8bdqeyW07OaLtYTcz1aeAcm3BD116PrUOcuDl1W
	 aEk93z+/icrHRYlj2B7Y7wSodc+7YoJKZXy/F+Q9bRS0t4oID0HfKJXYt974ihSeMg
	 AAH5wxXwU2uO7/pcKVroDmIw45b1pgafmYn5nafSN9FrJ0KOCp1vURyFPSOMTdPhor
	 yQjBnt6injHrg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0252417E07B6;
	Tue, 28 Jul 2026 19:40:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1FE5E480055; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:51 +0200
Subject: [PATCH v7 15/18] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-15-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0YCsZJX71B73vAdxDS8uxgokNO/lK8lrhxEaeQjUJ7Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z32oSfdSbmHxGy0bdvFOvtnkqG9Su+Xd
 5LX6mT2nXcvMokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaeAYP/Ru58oYU/vd4ZpInM/v+55BIQSIjtii4grvbhAJpkPKSQC4oxSlTkCBRsPuUbowfs8G
 myZ19mrMrRK+wsqpI4kGRQgDnfG3JxdmuAfFlg6Ih/gg6lnGljWK8YCNE7pTWlYzDdord9cWCMv
 o+1iwwPKQuGUA+ZtQlAG4LUBiUxdmHZ9fsbS+B/82p2XneFZJQB3NYAW14LDM9jfwoN11GlVZ+U
 +E0G5/AUOutV4PQ5EGEfHZHuhiT1hBLtWf/9GuEfA2841zdoGV6ajbJUnU0VEpq1uIs1JqV/vSB
 amp/B+tBh/GBPT3QSDDPve0TIssio0yFsS+spbqrK8xoNf4FO8hdKyb7H7gnRhF5eIsElg7uPvk
 0OO48h+thC14YGbFgI8oaZMUh/puRahRyvbAuXoFGdxmRHQqEq8ouuGlTSzRudVru5wACVS8KkC
 DkVcYh5KSBwqTq0uxU2Iy9CZui7Hne2wq3MGBHJDDbjo3NDzDpItAg/Z1Ix7u792KA4bqFKMf4Z
 +USqr315hX7mZTfQ5cDa+ki43MCfkxF2UTEyDfUzuN/f8ijYWkloBHUF9NCchN7EFMJD07i3NEE
 JfFC9tVgeyfr7KbbKaVP98UY1wna1wVNTeWpG8XyTJT3n1MzAi8xQSrZ5orvjoz9grDq6hc4X49
 onguzuiome75l8KP8jBczrA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104057_406639_E9EF0E3D 
X-CRM114-Status: GOOD (  10.60  )
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
index 50eb7a467932..fcee47c6716a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1068,14 +1068,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
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


