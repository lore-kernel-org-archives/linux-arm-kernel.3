Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6103CC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rrMrFMSc6pcLt40LPmCCurhkIdfJvMr0mJ3H4Diuzg=; b=KirhwzL0ct0TRKUgOyfMB6uXnS
	TKBpWM5d7Hl0ldcsJYA7veo38yJ20uFdZImi2oYWBaC6Jk/b+uy8b9oKwaaMd0HTKhORINujZwkav
	e47HESTadfVeixHsVzsyP6fDwoR78ebpiKR4fT8W8E4CfD0wxDGobpcSmlQlpV3QermQ2D7k7FTx0
	iMW6e+Cc56aw+/vdwvAnS8h0Clq5M2FL5JhVz27C5wmNK8bpF+eUuSb43p2Mvxflfz1DgMrPUQ+w3
	6E52ZCxtvEX7yCSq7RCNHzxC6R6+ilQ38KnI3kUkt9iLlCOEZJz2W609dPcnW1XYY05Dtsg3YyKkw
	nfinqduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoT5-0000000Cnf1-3bS9;
	Fri, 31 Jul 2026 14:44:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRQ-0000000Cloj-0qVq;
	Fri, 31 Jul 2026 14:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=kcGvaktytxMdj3Fa+4RFfDfEbkxVhoP/sR/X/1jGUzU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N27ufUO98XhH1nMkUDS+wHMp6VNNcWoO0gdc5IrWwOPNaC+I+xaYfLk9Yhz4WWbfW
	 AZR1V2ej94d1lEBp5tDP9jkb2LLaHSjxvkiSCcHz+y3njhKw5cLmN4WHrcCgnT+/Se
	 GEIvAI9hd5VDLv/0RryeVxImZEpUDlJTTn3xh+kQPC3wenJUcBC9xsKtKnXCCU43Mi
	 bERRSba4slIyO1VgboJYQf00e9Mei5baJmnJuUiLrebCd2lXi9yjd3dhFf7hWINkAf
	 z2o4dv31zOIBgObgBcLXc0Y4LvLtC3lu4RQw+wY+PnE+JmgjEbNUtIyFc2M8ofnGZc
	 3lNQE/1E809kw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA1F217E093D;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 14739480061; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:21 +0200
Subject: [PATCH v8 16/21] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-16-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
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
 bh=kcGvaktytxMdj3Fa+4RFfDfEbkxVhoP/sR/X/1jGUzU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEC2qoQmjtDwD9we6yoS8xgMssFVPw7LU
 I9qXoDwMEnQn4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qacP4P/2YTglCuOW39W/Jjy2SvJa0kH1Eydj16rB+7HH3lDF0n3DTNQnXFHSPbKaEEx/+q+Np
 hvj/wbIRI1bleLTq41R2CSE++10iO6A06IF/hA4VEmtgrj6OwhUGWUYgomQsmB2thFZClE7UzT4
 q+1VUfisMAuzow8H/aGhBsDA88+ZLLoBWx/j0ul4uuIWg9E6Do4BflNbfaZli5f28fxT9c0xlEe
 dJNVsPX0DebyqY/UEsyIN1aYpeIZykfvE70aiPuyM1CjklXsfpxum1/N5zSArp/ieh4IANYEdS3
 vzHzGBILl6axp9wzAT/2vDBOLWFUA1utvq50QcpbbsD9nMFiY2AVdGd3woSeHp9f/733/ScL8wV
 ZvKrBsLq0VhtH5LkXQCjxiYIK4rbKPyshUcheWT06Ec5Vd4DAuR7sCL44fouN451VqyTJIF3PrY
 kCmdOUtIuiR2EeyHEFnhpRcKFWkkVFcLPiKHLNpAl1wUepH78QDyUc2reLLxBBppynGFK7xt5MM
 HKdzqtu2NbAhXokQ2aDoikgw9XUVxj6qiLwiIDXUCWt3SxPJ0uJw8oJR2FP9oRUyyNn4sFZ6tww
 62UUFRaDugDi76uyJUNGawED5EADh8Y+zC/IhV7/FTkt/iu5a1byKuAI9I+JS+FHKv4cOu65lnf
 aw1j4ixIBCc+QUjoavYEigQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074229_202068_077F669E 
X-CRM114-Status: GOOD (  13.37  )
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
index c24a5436e8fe..4d4af6a388b1 100644
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
 
@@ -1693,7 +1697,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1737,7 +1742,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2237,6 +2243,10 @@ int dw_dp_probe(struct dw_dp *dp)
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


