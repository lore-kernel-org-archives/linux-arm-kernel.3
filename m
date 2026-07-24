Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5453C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM86yO5uSASG1SFIWJDvoV05p+gXSdwTlsqVkrwyqmg=; b=hueCjDGPL6wPnNuIU/e7/Wr33/
	BrYDf22ZQjzV3jOf/sgA59TgDyAoRJzQeB7mNjkYWH81GywtsMRuJWHD7qHeCg/+zO7kviqPos58H
	Fq+mcVD1CLWW3n5cHaAdbTB6K+c0AkO/s7UCe+ntj3t4PInvC+1NHlNesyXHY/6QEPC/VDTmiUa6R
	gDBOdAJd8bhOkQqSD+BgJfysZrrJmnlHD5G4iJqxTwhM7tENx8C7eLntqBcdaWkCHrAEfGD5j0eED
	DqJ5GYvJ01mPPkm6qb72ZVAVf8myKEG+Q2RuqZQLg89cAklMKHBK5qcAatntvfwTzbDizYsZHodY/
	mmwFpQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFK-0000000H0K7-2gH5;
	Fri, 24 Jul 2026 18:03:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFB-0000000H0C8-1XgP;
	Fri, 24 Jul 2026 18:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=GBB+Lg8R2SnT+UdP5XDerp6qRWg/p9sK7PZSNKuO9xQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kIeu7AxLBHHoztESwR0GOhVOqtMqigvPVR//wws4csDnXk2KAO2spKmF0AU7QLzU/
	 vYtqIb4lHqHRfXUZMCCJhutp1pNQIn8CQRXl0dnZV0nbGao0dmgUC+tQNIBWv4lVjQ
	 ZlPQ02fVjb2GMskc7oT5meDFenkCbH74lIhnUqBXLL6rZjieBecYET5aQ6az2vp9fC
	 NR0z3ugmpLKnbF0FxEOpnnbKS3+LpTKjf935rkQRcM93mq4TwGwE+EoQrf38hleS//
	 jD3N4p1OmC05EwgzqqfhRAZwEUi4kC6ddzw5XjcX3zKVLhwRf5lt8IKxqSEZFyjV0N
	 cSD031f6CFpfw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DBF17E023C;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E09C0480030; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:26 +0200
Subject: [PATCH v6 04/16] drm/bridge: synopsys: dw-dp: Add missing
 reinit_completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-4-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GBB+Lg8R2SnT+UdP5XDerp6qRWg/p9sK7PZSNKuO9xQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPCVx7dzGMvZV6H76jbyaGQIx26k+zHTi
 APYYT4iPdlkOYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qaxl4QAKQdLUWsfAwNqjJiyESFy/nTlsH4BGWR3z1BU0EKwkSQu9XF1lvEzSySoSsiKdznyVk
 D1buzhAti9vbSEOI3YNzbrSrwvo3B5wbIjeAdVdo19r/Cdu/K607o2kBKcVbHVJ84EdO1ivxm8M
 +barG0gNo14jQCxeAcngFZcq7PegI7cCVFy1De/3jZOm/B5SvhGMwRtXigxpjd7bDpGgKHPJM7L
 /sK4fIGSDThz/mZ9A923xzjPYLEVc8SC/Xz3QFm2IbwlCaGxqFxD0dzEKEHqgorBvVLyivmhnOG
 ejQ4OFbTxQXRiIhWGE3un8WuRmGL+tg7J+TWQGXXn/3xY/wUXUi7TmEOlxnnmLccWe36ydq9KVH
 AS1slcvk9pa6a5JliQosIhEuVXlPvXkodEiKH3J2v9L9yMQFEQXpkgn6KhgUT7dT8V5vd9NgZQ3
 pHNFZkdAuflcnmhy7QTMc4WNzUEpwRcNrkT0N9fh5NpkMstkVe1zJFV5gx67gcN5HFzylZNXL1f
 dql7VHEpGWesfUrqhIFyrZUzMUuuWWmh7rdEkL8QgJlXHRGeI2FQrrkmP1WmXp3kUaGk7wrl0qo
 j5GMKXJeA58mCDwybkZhQha2L35hjyZQozUiBdY1VNc1WQyYy7A45ct51LFZXTk/x5xtdMESNoT
 46/BGhGPBRo4idDqgoogyGA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110333_578820_B340130A 
X-CRM114-Status: GOOD (  12.14  )
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

Fix this potential issue by re-initializing the completion before
sending the AUX command.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index b28040d69fab..2f0ee7ab7feb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:

-- 
2.53.0


