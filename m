Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7311BC5321B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTNoAT4XJQ4Z5ejvWgWoL1dzwRDlnQdFQLP+eJJWHHA=; b=xPu9GKVyjFWokyo8VKuzSQGyAH
	kSSA4dQQUFfpMcLRMbgV8q2kR9zep1olTrNvoWGHT+Zp20hBsFsZ/tte3hhAhTFLhzx/LI0A2qhVb
	7RaNLJ7uJvMyX4z9sV4/XuP0AI+Zf2rAnWjH9B/ndYiZZ7v14aC2980puItjB9OyUbXi/SDp5n9Qa
	uZtPOlu+0ONL+Pz4ee4Oap5wsvcxYBGijrm6EpyXzObQExV+vrsb2ozpmOyUQeXhDHpKBs0dajTQ6
	HITGlP0hGPwEXoxER3D9TdovsPhVcgiZOpBDHaPKEs4uTYyTwqlU6dpjj1uwmlYTe3TbCDaRcYptQ
	o7PUAYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1ja-0000000FAOC-0tBj;
	Thu, 23 Jul 2026 22:17:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1jJ-0000000FAB5-3AUh;
	Thu, 23 Jul 2026 22:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=MgTdUT23fOeo4lJpFf5pU2z6Cd/OH2vC6NoaMbjXKuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=diXfHJOQhpat50Yj8UjuPHjcPpMH1Pxbzl/KywdL3a9VLv8Pl/JIhtHtvYYYlQBXB
	 4sHNt80vTdOKdpPMZk0JsBsQB+t+WoJn1sk0TIkrwgW4nP8GpG/bRCBlnhPqQGfhTn
	 sBbPcgKanSsI5vY1lVCfbfyTTGBm7N1ETjAiV2RJ+fajIpXIQmm0sot5GuwQ3STcIw
	 bENUXLq2tlhyLxZkHLfc3CGMpvSI4cKECdy/JsyimQbt/jZ62+rwRHi7ucG3ZuF94c
	 GifmJSSIjZS1fxUcFutE/Y9QR75i9+dP4jysCgr23J7ZDWljnQtAOD2c0iC1bLFrnz
	 KVBsi4fJbtthA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5725617E1029;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0D74848002C; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:10 +0200
Subject: [PATCH v5 02/15] drm/bridge: synopsys: dw-dp: Cancel pending HPD
 work on unbind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-2-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MgTdUT23fOeo4lJpFf5pU2z6Cd/OH2vC6NoaMbjXKuM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvGDjccanOTLYRbt1ooX6YNI1kYURd4zZ
 WL4pxZ1R5gtW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaS2IP/2bRifTSYf+HwS6tZngTO/DbSw9PZS5iVbDAjiMgf69V00V+i9V6lsAFP10WyjuNzs7
 04yFJWp3IoDu95ZjgJBcUUnqpfh1ms1yC8XXuS873f5SaCZ5S4TYYb/FEXPHDfWnWB29A8eRXJW
 UoSBcN3U1BqZE3NV1cilfaB4DdDgtvgWdRDPIgM8TpRGtMED44jHIxZE4jCBijqs7OnjDnjN4b+
 Rc0jqU2VpR8kQI8xB4Hsh5Haj7L+iKYfSbbpTI+Lv+aiD6jbh2kJZ7hmkrIXrWPUmd8WA13g3zY
 4lsdPkfKBlBIT5iED7dXkY7GvaXNs+/hJ+vShs48u00m8KpAeIE8Ri5iT/ajOQR9baBEMdZaJuT
 x4MDqw2qz3Qk9mWJi7qrtm1UXbr2r2Ero3IWMiu3Qp3WiQ0G7GbvRvx5I2xA9OYPTmhT/eugv/1
 4h83W0orfzddi/ZmJGW30tazaJa0zJ+kUxNjDL6b2vbO1RADTN47dIe1jDoZbok5bluWNHkXsDT
 CW+bksDGkImmvJN1KIVWm0JwYU8PlOumlnqmKOBo3VFDHsYDmUbXBLj5VNa2f6XR/bi4CL+5yNW
 7xKrxeWOPHo0WJmNY8O+itEnpjiR3sIH0GqtFrpdrnv9Fx4q8lOZ0lft0YjYcSKLzwhnsfWaPiW
 AlALko9vBs/9IG9UbYc4tpg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_151725_953729_20127A22 
X-CRM114-Status: UNSURE (   8.84  )
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

There is a race condition during device unbind: If the HPD interrupt
started an HPD worker exactly when the unbind happens, the worker
thread might access invalid resources. Avoid this by stopping any
pending work immediately after disabling the interrupt.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 368e1f85e625..21bd08571dcf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2009,6 +2009,7 @@ EXPORT_SYMBOL_GPL(dw_dp_bind);
 void dw_dp_unbind(struct dw_dp *dp)
 {
 	disable_irq(dp->irq);
+	cancel_work_sync(&dp->hpd_work);
 	phy_exit(dp->phy);
 	drm_dp_aux_unregister(&dp->aux);
 	drm_bridge_remove(&dp->bridge);

-- 
2.53.0


