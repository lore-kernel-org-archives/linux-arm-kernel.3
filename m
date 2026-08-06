Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360CC56203
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMt0+9uy4Sy3hmsBB+ZoMtwaM1B3fnFmRxiHH3bAOfI=; b=jtFIeq+O+NpNTxsE9nP+rT9yDJ
	km82n/55Qs5c2T3CMZR+Fk7vF25qZgQVAE4KvgDFPRgoWNfjmhtrOJXB070AAhFL8XGsWaleJhOJh
	risJnZ1bYadQQP9IDEVMACoZcosev4ZGo/X/fwWyY/i5HN9Jkzkup2YE6zpMONzlwukk5ZfaKeUqu
	vTrxFzmeECGYtNbXLhgqHOvCt28Epto+6kK81uLpSYqBWS/1BGE6KMSMlIj2DUA5PfxNhkFGkNnfr
	tDMvSVQMrLbjik1nXCIAy7poWyWdOQVz8x8XdvTQKtu8Bjd094A8uLTeWqrH6zOs685cx2I9StlPU
	1S5KB5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmFm-00000004j0E-3a0F;
	Thu, 06 Aug 2026 00:46:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmFk-00000004iyq-1wWN;
	Thu, 06 Aug 2026 00:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785977188;
	bh=PLIm9h3gU4IggjgGaEHpfMBzz245EqybIu7YjjboNDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MSxKjM+Zj8f6fX5Mn4ekbP5WyFd7LifwnVoOy1wZLoqkXrCWJopTinNIVXhFReSLQ
	 PJVUZWx4tXinacyU7NYN0L7I1Pc4MPh2t0UiSZw2rPrPRlW7j42l8XCgkq4TUnRy88
	 6c9G5DnRt8a4XW42gE5SpRgrRBUXk0t5vwx6MpGBAzjZ5kgevTcp+Us92wIRSPceC5
	 LtERCjv+pcIMjCU1KAipuyRTPmaUXtbgH3yixBFT0sZ9RTs9GcuzkIJiOEtOZyMJzg
	 PX4trX7oJzBYGgZKSgHrtIeoUqLDFb3HSRJ0VugZfbV0obGhOKDGU3r1i89q5C2sFa
	 p5VMbB3a8W6ag==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69FF217E0739;
	Thu, 06 Aug 2026 02:46:28 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9F889480062; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:23 +0200
Subject: [PATCH v10 17/21] drm/bridge: synopsys: dw-dp: Drop useless
 reservation of first slot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-17-d84a26c303d6@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PLIm9h3gU4IggjgGaEHpfMBzz245EqybIu7YjjboNDo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz165fHEm38M1E4PGMvPdA5LMMZG45yzMr4
 UNc8Lgzt2ywr4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qaEsUP/jNVsxtUZOdin7EbfNqYp6bck6y7Hii2pXq9dghhqfUiFIiWzb+nHX/Es/sK6pvxou5
 f/u9yDjbCb+OdcdQhr8OGT1vq0VSOPGc9k6sHE8/vnUbbH+pHJaUy8JZvKuIGh0+dNTtE5d9AAN
 o/iVzwZhJdBQOqNGSCQoX3wCd7Fe7dNoavQ706FrIG4g5qQ2yB725377aokFU8u+ChGau4BJ010
 O1nMLY8Deer2W7ykFp8LNGVbxCmR1RSfjaULqWvIDO7iPvPujAco3pbrD+q+a2NH31WZkyp57n+
 x7YLOU47zu2D3dT7UuG78rvDV9iI60HywtjkYRBwU5bAHKRtkkAI07Nc0YRm48OQ2kkpZ5o2rp+
 NDVS4y97/Ad3AVrX0K6qWuABLSKn3oJ0jdSdZHdNYMTEDEcMnUpyjtKityQwuK2MUeL2XpV52qX
 zloMziO5r6InSXFfWY+da5e/UAG3k8khtWBiM/eYIw7IbFihr322tknqS2sLiUolagCUrOxO7j3
 7+Rdm2NZImiwXDiJYVNp0J1dM1aZbMgaDaZHYuJj3DKTvmmW+xNwZFMV2tO2Ul2HY07xqjx2CX/
 +93hSi/LTLftp1uUe2Tft/8OeWufniUqqbdm3FlT01HxYWeGtp9Vf5i0p8cDIsd5wkSsLqAdVim
 LbPM9tjJ/o3udjHN8cUg7Qg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_174632_664385_01486572 
X-CRM114-Status: GOOD (  14.16  )
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

The origin of this reservation is unclear, but it is a problem in the
atomic_enable code since it potentially races with the audio SDP
reservation once that feature is added. I suppose it was either meant to
be bitmap_zero(), but that is obviously not needed (and would also be a
problem for audio support) or some left-over development code before the
VSC SDP slot was allocated automatically.

From my tests SDP slot 0 works fine and can be used. If SDP slot 0
really needs to be reserved for some reason, the bit should be set in
the probe function to ensure there are no race conditions.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index a63fe1fc0969..425bfcd3a37d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1712,9 +1712,6 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	scoped_guard(mutex, &dp->sdp_lock)
-		set_bit(0, dp->sdp_reg_bank);
-
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
 		dev_err(dp->dev, "failed to enable link: %d\n", ret);

-- 
2.53.0


