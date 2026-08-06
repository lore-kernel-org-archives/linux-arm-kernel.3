Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6552DC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxGidgA7xckcv2dpzayBIxDZOg5Jdp1CDNQyflCpP44=; b=Es6zxfrQAePLVSQK6QKPrlfV71
	xFgQPcPt7865bblZ3d5or5a8KI3eDNU8br8Eo3WyvZPBgJaJOlmm8QgKfRVlm2je1Yx57mawHrJgD
	12UwYkqO5YNqTsPqLU6iSsYyQkiV402ZSV2NdT7OJXmfReULeGPRk0wy48neHuTbmDJhtukOSv80D
	NRmEEKLV9wm8CDw/0YeyiuS1nZ4ywOTdWT0YZ6H6NcSv8Vornv2aRXRKXTyrglYfEH5NU22oq1C6J
	ngdMQsRrn/lkiQPOMRlWdH8GvZkB1LaRdDxvDDA3o5BT+YDNi3OB7JePqeJFfA+qQBH1WMHmHO5FM
	JmgnXzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UI-00000006HSF-1fpG;
	Thu, 06 Aug 2026 17:02:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UC-00000006HKi-0wxq;
	Thu, 06 Aug 2026 17:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=ZiVqmaGM3+H99exZj4TcN/QyJvPS1u6+KkUwem6kKEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C3EMcZAqreml5h3m2Ml6fRxe0X3k2bu3WHtdMH1W1676QUWC/QS/6mj+CD0EiOjmM
	 kzuE23Ch1ZPIOrSbtrLGPvsgdTFk6ItWtfOYR0prJG0mu0zezTW3YRPhU6zCtYTsRN
	 b8Qolru8aAodz8ZjB8gwWGxlwaA8qAKTy8EjN6cboeI6+V5fwvKxAgI0V6tfDruFhE
	 U1nJrf/q4S9cnK1qvSXl5aNaZBhfrQKsgfLciPXlPoX1LS8IfmZamq3GLKMN+lcvAf
	 wRBeKZnXqQim2IywvifE3EyizY6Wkp1+s4VfFEvgj9rTOg3bFUo4PVQ/2ym8e+fQhb
	 ZWiynw57noV4A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4675717E0B39;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F02D248002F; Thu, 06 Aug 2026 19:02:24 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:09 +0200
Subject: [PATCH v11 03/21] drm/bridge: synopsys: dw-dp: Fix error handling
 for DP link enablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZiVqmaGM3+H99exZj4TcN/QyJvPS1u6+KkUwem6kKEk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viD9wrbCV2uQtPhobuEDk+7q82oZiJ99N
 Q6StU0enFhCb4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaeU4QAJejIz6YLbMl0+CJgjTL2X6u+TxIhEyh+NgWc+eLf9io6OPqZPWPNbSsrlKEofdAdrz
 LAmseWMGIPoQmvbyV7Q5JeqjLUzDufRBEtBOF33/2U2fGaU9RhZtho+p0Scw5e+L5bDnKvOkkYM
 oBb9e+2i+3ZlpB4TyjWZG3257Bq9NwaK4UBtUUdiiPgkarf2EjPyn755NZw8f//vGWnrQOwo/yW
 aFVZawEj/H4MGtO2HoR933ZOBbBk55Nju33ef69kZxHYL5ceVP1FxSIQYtQeCFmuSyOkpnhta/q
 /bRGQh2a4R59s0o421VpiNEARfcCndmhjUx1Z+KNiPt8ekn5V17OUht58bVfQOcKpTY1DOmjkiL
 CytknU1u3Fk7dkbyVGb3vjWzwlt0nO9yEIwc3RKhcTfbzNbntHCj8q+FTOKtWoSj/BBN8ekkxqF
 ClVxWbyH0pCqW0UUWU5DmiGS2ZH6Fk6WA5JpidaFqDQxV5Humr//WOIWv4iLhiQb/3IVid+q+xX
 zLwjOlxpQqRrpa2Hfrr9A9mAzH/MNzJullIxIEi1qzp+9l3pjyFiaKAyYvwy7mVoKSzo8fGit3/
 dd6RUHbKy9CaVI0Ji/clU+xned40y9yoA9VWUw/5TRCr8iSRmYBOc9DlvLn3jdiHhzCO38O0jfC
 MLiOpMFTtBm8y0wiT/B4/gA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100228_433691_DE491406 
X-CRM114-Status: GOOD (  15.59  )
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

dw_dp_link_disable() may be called in atomic mode disable even when
dw_dp_link_enable() (or an earlier step) failed during atomic mode
enable as there is no error tracking. This would result in broken PHY
power state.

This is fixed by introducing a new enabled state in the link structure
to ensure the link disabling only happens if it has been properly
enabled in the first place.

The patch also adds missing error handling in dw_dp_link_enable()
itself to ensure the link enablement becomes an atomic operation.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index d7945f7fe9f0..21d60e89126f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -280,6 +280,7 @@ struct dw_dp_link {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int lanes;
+	bool enabled;
 	u8 sink_count;
 	u8 vsc_sdp_supported;
 	struct dw_dp_link_caps caps;
@@ -1615,6 +1616,9 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 {
 	struct dw_dp_link *link = &dp->link;
 
+	if (!link->enabled)
+		return;
+
 	if (dw_dp_hpd_detect(dp))
 		drm_dp_link_power_down(&dp->aux, dp->link.revision);
 
@@ -1624,6 +1628,7 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 
 	link->train.clock_recovered = false;
 	link->train.channel_equalized = false;
+	link->enabled = false;
 }
 
 static int dw_dp_link_enable(struct dw_dp *dp)
@@ -1636,10 +1641,22 @@ static int dw_dp_link_enable(struct dw_dp *dp)
 
 	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
 	if (ret < 0)
-		return ret;
+		goto err_phy_power_off;
 
 	ret = dw_dp_link_train(dp);
+	if (ret < 0)
+		goto err_link_power_down;
+
+	dp->link.enabled = true;
 
+	return 0;
+
+err_link_power_down:
+	drm_dp_link_power_down(&dp->aux, dp->link.revision);
+	dw_dp_phy_xmit_enable(dp, 0);
+
+err_phy_power_off:
+	phy_power_off(dp->phy);
 	return ret;
 }
 

-- 
2.53.0


