Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CDC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvS5JzE6aj+obtagsKU+2a1dR/38jpCgs8rW9/5eOfw=; b=AY6afviB5PLj53AfhnU/SNRPTR
	2m3w8bsoWWoDCDrhOA+kGQWZU66o28uy749FS0FkqQnCD+IwJFrhy7e6efGf826Gm8u77TwohgmoD
	UZEfi4H3dXQa7lTpQwYBvwUCqUMxAuFlvkn+tmlmMuJhHTkHPg8zl8qg7sXnhSxLF0G1xLhdsXFdh
	IKkTlOvAkWjv/rNrT9M7aZdLXjVRhifvwKcvWPciK++VJxFEdXdM3Qnw6FVTOvbT16KQQBQ4NkrDI
	OKig5UH/37+CB0HlTEAytZsGWe+MlOl+UiKJFe23dAK5+nLHNSzE+N/E6PvzZnjXzEpqLyq7X0Fbc
	oL/gsd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UP-00000006Hn2-3rtV;
	Thu, 06 Aug 2026 17:02:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UI-00000006HPj-19cy;
	Thu, 06 Aug 2026 17:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035746;
	bh=HJ4BFYGE+BpWSg5pZ0L+h8cPm9Opa0kg25ZJyYX3+8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BDGHBD4svxhT6TLZPCNKHZQ21TQdz7sAqGDBo9nZbEaP/Rm9PKzMv+9+4jlH+EI4P
	 sbUT6T9naqBl2xRVqGOqvT5vUQsqqgNmvjSpIpfDCVx0zJ1qKL7iCl/aTX7k8e0613
	 M86pXTB87PcxmWQwa46RU+koT6mUTzs/fpZ5RSFWW6e8KkDKYkRNMfw3P+mDg4LaYW
	 eHhEaEFwZS9prK80/4vHOR0tPfZ5H5Z7rM62M1lstzpMN/r2dm0Apq4FP4+rWxca+T
	 l+eaWZ1Yhlf9JRSjKWkQwwZDAb3tDs1warnr+Ojr85tx5MPGYiTU3iX01lHqSU4uJ4
	 mrPWnFX1ssfEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06BF017E12A2;
	Thu, 06 Aug 2026 19:02:26 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13FB0480065; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:25 +0200
Subject: [PATCH v11 19/21] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-19-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HJ4BFYGE+BpWSg5pZ0L+h8cPm9Opa0kg25ZJyYX3+8o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viBeQd4T3g+Pzh1w/HSWJWhpMgYegO+Iy
 +9eatZnJLF9lokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaLTEP/jVCr7EepydxLo/fMD/IdC1O0pgOGN9qsBbUljW+VAJ/GsyuKlQrhzvOXjBdaqJBOAG
 EE2kyD2KlLdPNd7RXU70h7NthOt/H3oiIA5rtRZsaXzGbGmnhT+kxNIKiEORLHQnK4iQQ/WSN9l
 LpH/bVfKyWJv49sDL8B0iLb0FS4YasU0LjK/nlhZoKizqZmJ3u59ZtqJq2bpz5ZnijRhrK7IQFe
 M37ZouER21fd/0esH0V8up7JkPk9lJGfNpgP0tR0X5tjFs8UXEr0rgP53ykJS3Lb0o9O8IFr/S6
 bnusAf+i38UEJF1APuGlW8eaArlJ8j228zcDip58D0DekagNGE+SHW+CVFbSeEQR33+u1tLt0VP
 uw84JdCBJ/mNpvx5P/mHkCpptCSH87GQxRBLqF/u9i9gb1u82WJR1lMYxTbMEP0dC1PY4n7nAjY
 30/yfHuUTktTH6Sdb41x6yP4neBpyKR512ppIEiyM5NVhkq/VWR1ZLtqWF5Oi+Ij9k5TAJvFDJV
 DE+j3QIIUiyMwX6W4erupPzOe1aMIdFaurTNufu1UBTMXaiOOQf2mo5YCCMWRiVn5YGC+RE/T30
 U1+1ZqrSd0BdandxE191wmQQ59I3gC4TAZMxW+hPXEK/xlf7Eqp9qr1K3S3SzhPSbCPokskxATE
 PHLtFwpn42sgWaLKTvv0oEw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100234_622582_F8DA326F 
X-CRM114-Status: GOOD (  10.36  )
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
index 39e21524a965..b610abf76ef7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1070,14 +1070,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
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
 
 	return nr;
 }

-- 
2.53.0


