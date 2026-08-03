Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AD6C5620A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Caridhfg5lHxxXcAMCe2jega7mt5OmOmtlBjBnDTHA=; b=cB2RclnUdK0f+iBzIFn+nbTSQo
	uuzinoOMRa8NTsLU6lmMEOprhLZHUVP1638iOk47lu7ecOTbTvfeRB4E0paktw6T6huwj/eLaPpID
	kitCm1WVQUE8fWl6onN2kUpaBfAWzlRS21Gi3iQgQ97coBh+VXALk7rbo3VwfB9CjFwJjUgaur/Qt
	QBlU6nPKnehpwcUmyso9kQ9+d87GS/4I/uk23TYaPeiSblv7ezB8SvO1AZxhY70fH2poM+4r4bcDm
	RaBe+i8XlidOHRdOU0bpQTDiWpBI/UpRMSrJuOleFCftVyiJMueCXtq0bsDriMVzoNZIvkbn9FuI7
	J/YUJpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2O-00000000IHy-0sqg;
	Mon, 03 Aug 2026 18:05:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx2F-00000000Hxk-2WYM;
	Mon, 03 Aug 2026 18:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=aj9xP0W371VTIzU9gNhnUVMhyeHDU8fdXzCypYpwkGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IbqY1GQbCns+vnR9slEACzRSCW7+JqeWt8FBinIUeMMc2uINkfJfa+ARKXmMhyxd7
	 GGcKIdu2dnn985lpVfTekaKqHN1geF+ztxnye8SQCsaUpuv5Ig/5P/6iQw3T8fm8Y1
	 CVYRoq8Fx1BaAxzTlfT7EFWPIP60U3eN0HOBoJByx7sPVfszmJmB59pdIr6sZr9b1j
	 KYMc/5XyZLcYJygStkjgiJFCxbmhRv4NWgmIhbYpugvSCLChe4LTUPd3itebpjmNt4
	 3cIknqWSx7B8p9GDz2a90D7naBzrtIchvgJg8xqzEJbFNdNE++tCgfHBw/9MErT5cw
	 nE9UiYVLLk5BQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23F0A17E10BE;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6A5C0480038; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:08 +0200
Subject: [PATCH v9 07/22] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-7-2e6e46135312@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aj9xP0W371VTIzU9gNhnUVMhyeHDU8fdXzCypYpwkGw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E54x3JL76iX+9q4bbSf0SnUU3yQk470g
 bUgir9qGbb4fYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qavVAP/AkRZCWTWxGm2TIkh7QqZ6ZuPzGdq02N4mxf0mNHVBNTSxmXIJ2YipqiCqmVX+2/+qt
 SeRw4ctumoMspU5szxs9vx9PhcFTgxo/RdvqxaUj72+IE2o2a3sEBSx2ST6J1UIT3NrQKbzq8pE
 JaI3fmIl4qSpSqkYZNxK/8KgXFJ7Qv7mIofvyAlevEXosBj/QOJltpxjafOsT/ALLdj8+phNTYj
 2GjjFfwC3EM6DKPHIXMI6O+6kHPQFEX+caMS6JjE3ZLlE2OzIw/KALrpFtDxC1ZCvbj3CD3lI3r
 QSzrzOzDxx2KW6l57m+QL0fnYeotTGetdF9YGJkPdhvJBEwcLaLUSI7rlYSRYyXRkGECc8ebSSY
 b3JJasGww5d+i+ZIGk/eoslgY2+9tB1qh4FvT55Qxl4N/HDIxGvtnhiUrLewpQuPjsirKLHUIFK
 3mKNKnW+ljdyhgzpIB6a64Bfp6LiYd9H64OXPfQjYpw6IpkqRuKBUU80JmJvwFSf5ZnRwO6CwgU
 428gkCE3lmdYjUMhVH5Fi9dcAUY0nUEkDQ0KUExzvsul++2mQja3bKVcBpkGH4HGMyKyeDHBBTd
 C0TNph83bz7WOxZyOenIwteba2pXSIKD/rjCSr7HOyI0HKgGI+DDS5d8GtWri8x6EQnXg/K8ZUg
 calKwoWZSRHt8Pn2LBrspOg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110511_835881_52CE13AB 
X-CRM114-Status: GOOD (  14.24  )
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

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion directly
before sending the AUX command.

As this is racy (the interrupt might arrive between the completion
re-init and the new command being programmed), also reset the AUX
controller on timeouts and synchronize pending interrupts to gurantee
that there are no pending AUX transfers when the dw_dp_aux_transfer()
returns.

Due to lack of a sink, which generates AUX timeouts, this change is
effectively untested.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index af3fa7886429..8b587a4c5e93 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1466,6 +1466,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1492,6 +1494,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
 	if (!status) {
 		dev_err(dp->dev, "timeout waiting for AUX reply\n");
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
+		usleep_range(10, 20);
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
+		synchronize_irq(dp->irq);
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0


