Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C80DC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c7Mq+4jeD+0AjZvUU0ifAce2FJ4b4rWJu/o4FoNZs8=; b=nuUiYUNKhwTvbLHFP92vgit1eM
	whb+mEjyT1261DGOoLUQZfuf8lEM3HE1sEn0BgwN43cZCV74Ad3vPpEwXQg+CwS4hJ0E+mnUnvKDB
	dTt9nVAji9q2xZJ/SM3lqSCGwyIR/dKcsMKkKwRpYPpFa0pXopWneqz/it+OVDKvtZm7SFis0uT7p
	aq7S3Enr/9jq2b23XHjpScVUbX+7b2h7mDrIg0Bl/1C0tq/QEl2ZWeLrJ73k6Wu15IODR9fc/HM0L
	E3WmrFOkxN2/dQI1FFAJCW2wW7vc+J5we2dHrinvXaGLTJZycSmp3w90cEZZgtXg6Gx1Uc6zQh5Hm
	tuUBnyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8x-00000004gzD-2pQl;
	Thu, 06 Aug 2026 00:39:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8l-00000004gc7-3HEL;
	Thu, 06 Aug 2026 00:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=YtwSpdUg10a+Zh7F9mpv53UF1+K0mBdt/GcnkH2c5S0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YrSVKIBsL3UAzH4iyqz9towasTAvvNikfrQYgw6Mp0B4DlEX57dwv45xO6+8oFzLV
	 Ok3YpkEa9os6EDtYgzN/E8bfRUfgA3kNsr/BpR+92XCe0zPTYUkX7RdyDPz/+DAOV9
	 KGjWdrwZTj2l2yKhVERsOwkaHM1xduPP+IgZ4vV/5pkck60B74lBXetKDufPi7GquE
	 3nsJtD4VX0L8l75aRTkwIvU0X8FzgEqJPawf0vyArzlXSoTDjEQ2of2mDb9EQuaZZk
	 6OrC14seQ2yQVchynAU4Xy82EKtT3Tl6aSGOQIM89BUTlbkEEiiL3Mk2FHMa62VSxK
	 ob4WH8hVgio/A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3402F17E07C0;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8F68A480035; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:12 +0200
Subject: [PATCH v10 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-6-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 bh=YtwSpdUg10a+Zh7F9mpv53UF1+K0mBdt/GcnkH2c5S0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz162dHmPHSH5OwKJMuULkSdkV4R/oh1Wwa
 hHaP8SVhQj8yYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9etAAoJENju1/PI
 O/qak4MP/ihUzR/v3EZRGp9uA69x1hROIypOCp8djBQxs6Yt4oFJL64X1GbAVno1vaHfatvAzoN
 Z50MD/jofo01ZVO7ykVvkPggQwv6XeDJYw29rkCAHOaIemxmGXkVIZ3Dx33ecZ9OEyeCLmoQt0v
 K/BXg84DM7SwRHf05UDY4r+N4RV74xX26UfmBK5xpHHObsTWt8oIxwLRh8m9T/2xDA0ysm+UwU0
 7F4XXUXe/wrVK9bKxel/a4wFObGsWhD1qCouX6kIzcxXX2phFLlhiqoMRpX/YxbMQTPZP60xXTZ
 Gaf20e2imPi0HBvad84ldOWwM/lfDuUCn1N/hFWVG5JNlbUVu0bCHYId33SROgNF6kVf9vz236u
 guPnJAFAMf7QKmT9jt3bD/fOIyudzxtmE1z86belUZ0zgNNUZ2wA3+11BbFHNCC6V4QwgWjYr8c
 AH/0Tpm1BF/1mzMS32ehpQKH3b1pL2A+qscl1QqoQptSVC42hrmuFc+CZunDANbZsPEpgRL8AT3
 3PqH24414R70Z1MbuyQCmION/70nNrSNranGhD/++9dxUccEBhKsg0oAizJup0hrX2nvIs/7nLv
 EZK2hwgYBwXo84ZTHXW+zCdGCSBfs219SxNnYCs5KZad6OW7SbFUgKgUSck49RK26h9XXnrQwcj
 Z3W/QEiRhT247o0JIpWgn4A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_173920_135706_22E3D0A0 
X-CRM114-Status: GOOD (  14.15  )
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
index 7bd4befd84c8..f82330640380 100644
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


