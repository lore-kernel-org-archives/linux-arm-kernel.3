Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653E3C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jER90X0vOVbmxQ0WqaAx8gxthsxXxykm0w+EZEcHHps=; b=ms3OxAYCVpOxLc0dZCbdzzJU7V
	9spAquyD/zinwtKqSFPgqo5f8YuEzzT4hj+rXE3Ga0q6z8J2fuDcA6KPmzygW5ppGc39Ewrsgb9RL
	0dLXE4j2Lk9YOb7sM4dNhMWCuRNqXhr9FHRXLDgO7PokxDZn+/cK1QunD5P+fZoeO0j0D4vjOKcGj
	JTfe2SUgjMKZThOqhEN3Vurd5DhHDOq4VVUCQzUJw6jzSdy0ScdGJeRghXx53ry02MaN72o4SYYLh
	9xyLrnIQwj3dEN+GZhStZ8PL/ctmjpbwHi5Tc4ZA5hAliJd29IdK+yZTN1HaBdEDvaXYfRFimhgoc
	YtNlh1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UM-00000006HbF-0mQ1;
	Thu, 06 Aug 2026 17:02:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UG-00000006HMq-0R8L;
	Thu, 06 Aug 2026 17:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=Wq0t6zadtzVfczUZxnimhZ2697Ml6eWsrsvM4IRkEqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qgdplyniZWudnlpCHdAe/URJjdKKHgYxho32lI/YBytXc1ZKc9H6k+GnFptr9Vrpo
	 P2LmOHy6JU1EGfXpclK9GTQWX/SV4h5bxHY1OAxQB40e01u687mNHj9uQd0IMhCNRD
	 lyREf8Bq1KvjXHBYC+K3qBB71Rj+WbRtCz99hRh36FB5MHH7GmSef5vHG0VrrqY5CV
	 Se4oW6YzTmuEseH5/jyl4Iyx46JdSx+riKMhvOWTlu/7xvdw/m36bDRFubP7szYHCL
	 TmJDZYn58o7hCqMMgYsvSYoJw45mu1wFDq9+ylD04NTNtGTfVyFj8SbFpl7kygrfJS
	 I4Muez4lNelPg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E41C17E10C0;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 021C5480038; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:13 +0200
Subject: [PATCH v11 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-7-0d508505f383@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Wq0t6zadtzVfczUZxnimhZ2697Ml6eWsrsvM4IRkEqA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viD/SwIKGDa2Ylbx0PCEGnkRYct+Kci6b
 wLO36pEPuNHyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaK7YQAJFSR2laobDWJ0Eow2zYbYu6d29M/QzqZqMcNS9+CjgbnHsPtHwBhtFnQFAN0jBKysY
 WOO9nBP/bh95lcBz7/Ux5l7Vn4M0GJuuQrFpgDrOPpXsY+oAnhuewtN8BmDWykYjS3G9S/4xA+a
 Hv0kSorH5gm7dnKMAuHwsHHSokViGqSyBnRELPChYnE8kT2YRRcqCzfJvnkdVAXA5w9wQ8x7KFY
 Fwa5GOu+T5HSwC+5vRpYuPLT+Z1jbO37NtBzQLpeMxIArFlAEmUqbvVBS7nzQ05UhslCyxF/chX
 usMrsW51QdDm34Jv3n5BMdt7ALyIh9AbpxqIBCdDldBcDVnLAkKk0H1Sf8c2qHjfCkywVgoLD6C
 AnEiXJc2orQwWbaIv6hToCqhnq6k9Y8a9wll5b+w5vdkqOD9pHS5IOQSdedHEp2i81e1gI2OtzO
 Ups1x1FWo7oQxnOGNVsnUmu6kDfFnHOHsGk0YNBKgswbY/kAXJFb7sltG+KKgVzQw+rkFoti6L+
 k7RgjEaqh7NkXOy14otyhyXKa4DzctWP2Ab6pVKhvO5BjvC+rodAthGP6u6Y644dPSCeeHtRoEU
 LMlxuNIA97pcKZzSIZdCijv5coYtcgTdSCr701xEXnzL1fnK0nQ7fd0C4C54W2KVC3DeiKRyQXn
 Z/Do0WW6s/YaoNMGA/xwjCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100232_328546_FE06C6B7 
X-CRM114-Status: GOOD (  14.43  )
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

The transfer functions returns the amount of bytes read for
DP_AUX_I2C_READ. By returning -EBUSY for short reads, the caller has
less information available what is going wrong and possibly simply
resends the read request. On sinks not supporting long reads, this will
simply run into the same issue again.

Instead it makes more sense to return the data from the short read with
the length information, which allows drm_dp_i2c_do_msg() to read data in
smaller chunks and succeed in the end.

Due to lack of a sink, which only supports short reads, this change is
effectively untested.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 2573ea2bb574..8ceb139f1a72 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1513,7 +1513,7 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 		if (msg->request & DP_AUX_I2C_READ) {
 			size_t count = FIELD_GET(AUX_BYTES_READ, value) - 1;
 
-			if (count != msg->size)
+			if (!count || count > msg->size)
 				return -EBUSY;
 
 			ret = dw_dp_aux_read_data(dp, msg->buffer, count);

-- 
2.53.0


