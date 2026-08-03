Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A916C55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dinXkqAWFSwOM5XgkRc5b4ZHXh1PiVN6eM6Zp9Z0hDI=; b=S68uFZKRwDrWjGIUdscUQ6jXGc
	73L194SSzwh/c1ayzyzw7sjc/KjeACXkklQ0o++H31csa4sKAU3duYZkyi8h2LOBamiArNRa08VhW
	WyC2j1zINUr/IS0aGV9jn1sznG0GUare0lNG77i+RkW5EUYrP869aiWtAR/aYzyxoOLY+vAF+h+Ck
	gxlbc00f6wOShO5eDxq5tYJj0REqEEu9XUt1Dwkw+jCIPSbKjkz+HIaw++ZYO0payKXsS1wYuZ4N0
	kg3uVMysBksn1FqcbCWrBvP99jiereQ1TkgHIBxqXoJJaROYhPyaxWIi/Y9f8PXEsB0WauBzu0Mf3
	yRwtjT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx7q-00000000Kzk-3hwB;
	Mon, 03 Aug 2026 18:10:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx7n-00000000Kxo-1pWC;
	Mon, 03 Aug 2026 18:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780653;
	bh=Aruh5826b4wtnxe+k2RSV4tTeWw4FEiWIslPr3Y+k4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mSJ0pTHHWVV8zTxw2HDA7G2WZ2FmevEUbcTX+haILU+Be7mpnV6tqNr6n1PMDE2Tz
	 AlHH+WwgCPFmf1lYn+5Q4ThKWGXEWaRYvQh2BfnCD8yWx/hTmMK5h70Nilm++ZY6R1
	 fInBfBtGV95r/NIY2kdnABvdm9c8k5lwkBlZHg/LDBzs0uvRzZ6p6emEhGCZUVDlrn
	 aLwiVs9xyLWf/v6ZGCZdAnErEHBBqcbZCjp1zFxc7MLREO4QD47FtW5z/Wejuh1gB7
	 w5mKtL1KePGwEm77lwpVgDnfVKitDYXwatM9jAnbtuC+vuaenDJrOZHp7cpDr7vQFD
	 vQ0LLS+AFt8Rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 489AC17E0235;
	Mon, 03 Aug 2026 20:10:53 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 79750480062; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:18 +0200
Subject: [PATCH v9 17/22] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-17-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Aruh5826b4wtnxe+k2RSV4tTeWw4FEiWIslPr3Y+k4Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E8yhIO8BZ7FGnbgyT2xSBAKvjm6mFpTL
 BuKe2JvfIqWLokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhPAAoJENju1/PI
 O/qalewP/3Aqct1OjEEN3uR0AqUaagiH4nkmlfmNLkdgMATAie4QKABebBRbo9LqcQexWr3KOUc
 0vzosJEJgcOJ48kzuC6DqKwRBYtzrlXKJGkw2ofyQ0S7EQ1sNYzLgT/SomleK0qwHGaK178Gh/O
 TERFAKISEWmXm+9KLIMGkTryeeyRPl5pouhHI40nU3WzZvtcpYXZtgoenM7yr1BctmTd7W5hhYi
 C6ZDT/kgMcV/RGj534lrsEEIs8t5mMMB/sAZTMKcaa6XMR4VjCngEJhkjHBRtE8u8UqwYWXYoFm
 yLOJtKm7qCo1yoYcQ2fpp+Ek/st5O0HdUAHF0OxZAd6S2GjK9yIJGa/M7J9Jdc7lTlnKDL5HuBJ
 TcRTVjDGVxuQ4OEj7hKInq4AqVfMx6fRWWBDQQKVE3EasqZixFimO25Fsn6vMySl1MxZ/FqAlnP
 FtzGloXy28cTA3bEF+4JgvvQyfCf4V2YBfNUjV5yJt9j70geblLWQ5VR7mJHvHJo6E0XVvw4mSd
 2acNR5QaY5I1bn5lyECe4UfQDRStrPy/wn8ON8Rflmm90qbv2Dj0aVhYBDYrSJjbyDUhg9Ye/Aa
 TxQ/2VubkmdyYGHytMNC7n7hSJIxfbChiSxhLfHk5MyU4ay9yrUK978Ekk0qmA3v2vEz0/0lkr9
 H6VXUCdllBVLhDpRkrFwrcg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_111055_630818_984A166B 
X-CRM114-Status: GOOD (  13.11  )
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

Right now sdp_reg_bank is only used during atomic enable/disable and
thus there is no risk of two threads accidently claiming the same bit.

This changes once more SDP users (like audio support) are added, so
introduce a mutex to protect concurrent access to the bitmap.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 501b28abeca2..19b6c11f672f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -323,6 +323,8 @@ struct dw_dp {
 	struct dw_dp_hotplug hotplug;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
+	/* Serialize sdp_reg_bank access */
+	struct mutex sdp_lock;
 
 	struct drm_dp_aux aux;
 
@@ -1048,11 +1050,13 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 	u32 reg;
 	int i, nr;
 
-	nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
-	if (nr < SDP_REG_BANK_SIZE)
-		set_bit(nr, dp->sdp_reg_bank);
-	else
-		return -EBUSY;
+	scoped_guard(mutex, &dp->sdp_lock) {
+		nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+		if (nr < SDP_REG_BANK_SIZE)
+			set_bit(nr, dp->sdp_reg_bank);
+		else
+			return -EBUSY;
+	}
 
 	reg = DW_DP_SDP_REGISTER_BANK + nr * 9 * 4;
 
@@ -1702,7 +1706,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1746,7 +1751,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2249,6 +2255,10 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(dev, &dp->sdp_lock);
+	if (ret)
+		return ret;
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return PTR_ERR(res);

-- 
2.53.0


