Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11443C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvJzS1Mr7XoxTCJkSoXwv2iNAS8aNrv7rlJxTG/9KbE=; b=M2A0d67awpE9ZRbWE2Msd7ouid
	54zpLlCYDF0oVgNY/bkciA34WCMUQeLvzUPKub1aZ8pIrWEQIsz37gIok5bhPDxG0Rpq6tsym4u7b
	S3ntapnW/0Tj8hgZJMvvqa5I/2gkkzSeb+Kq3xVZaoWEDOO0Z5IZXRTHfJXDipqjl824qifzfhwR4
	DKVfq5RVw6Ux4489Nttkcdug/JU/I+Ox2HSj/6iZylLoLDudQC4Zthy8WCVqEpUJ0wP5BcbWE2Gqq
	ZGrNc/yragLEOmUx2+es/AECsfy1D9T6C8kxWmub4EHABpaqZrW07LffLxebhR84f8V2RGDaRRE98
	IX6sTEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRa-0000000Cm6r-2qLA;
	Fri, 31 Jul 2026 14:42:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRE-0000000ClaH-0bVC;
	Fri, 31 Jul 2026 14:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508929;
	bh=qKOIeTSTf8d+lTXYraYHloW+e1z63oJfKmMqqagcn9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o6NjRxWv46+ke9429PxNetR6kEBdRO4BMdI43VXAwKXowxjnD25CDj3iQMV3KHFkR
	 tt1ozoGkpz/u9C9E86nW7hHbJNhQ0I/3HRRFEihEu3Ream4j+p64wtynZscKHdqCDh
	 wWZXT7xzdCXDlUsZqnd7yvwp1feOXEyZ8k0L/lPAWFgVw0kyRmywWnq6Q1vvxbBks9
	 Ze43fFzLSF6UCaa9ZI44k9SDXL0aYqpK7whGSbqP3+2Evi7/l+bEAVuOmTfnTm40cp
	 JUgi7woXX2f7Peo6aMY/SjLFFN6YovSH3WDW/+lJdNTnIbro29YWn30VjiAmodxkLL
	 Kt0/RogKy39rQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98B7717E0906;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 04D6D480035; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:11 +0200
Subject: [PATCH v8 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-6-ac1e6a75782f@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qKOIeTSTf8d+lTXYraYHloW+e1z63oJfKmMqqagcn9M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEBHFUicZhlEOUlcLoXNvcbdHQ8Ia8/U3
 26C1/s7TwXqH4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaQo8P/Ax6UgFmWEB04GySPwCrM/CC0JyUTEr4hliFpEDpB/oGY73cNyfxv2F89YhEdImGble
 zQ7F8HvkyROWzjSG/auWIMe3TgFTakkGgIYnI+6/58gbvq5u17tTHAXckHjUI50hAOrWKpvAHDZ
 Am4n3Z0D2gQTAdOVn9yygXUZ3yaDazn62yjrs/orfOp1x3J+nf4mvkVOCIxQtsnzBPhfTUbtyu3
 9v1QnOSLAyef9R6+Oy8g3zDMVBu4SbEXnMDDhtNNfBhMUIiXI+gtVzc9hf29RApfVGGqvQEDZFh
 50TJZppomSZllSi8hKKG4qwNJlraCpGpo1Kyv5zvdR1fx8ZoWnNeVa7WjHj6YrErQfgf8kZSe6f
 YTAp/YtvnrpT5kzdbsSLy5hb6q9ROR0ti/mZSD1MfDaoGLdNYSloFvIYq31a+8d9u6nlbnuDb1/
 HlrtqXZJpy5EGWoHUMZQbXNckh+QF4eFHpn09KlKYkqbWGRSpS4FHhdVD7m4kK3wd8tKRJVokSg
 nQPLvmiUiBonI0sW5TUdWw6K7JPgSRhbkZbVvttzPknCuisH34y4IrUjoelakb5RA8VXaOFGb8b
 9gJpJPAtnWe73Wcf9CfAvNCL9eOmLbog2pMD+41qIBZFp6zX+MOLnoMvo1u98osS0mKG50xtQ+G
 fgnYHDBLqDOgDqUUTSDEwIg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074216_392296_1982B96D 
X-CRM114-Status: GOOD (  14.49  )
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
index f373643a9cc1..57b6a8fc98d0 100644
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


