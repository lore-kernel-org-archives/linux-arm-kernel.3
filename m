Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DCBC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKuWMTI2dzOzCXQw3jDccQODVjo4nS6LfL5oCRndHeQ=; b=NzNs+VtOhNlGsTKuWqvc+nii+f
	TEizsAa7nGV1Kp/6n99GD8jbw9rb/Fuj1mODoOgQNnnoIGZ6Z1442Q01XaycAVkKz8prRzwqyNbNb
	FvLothAO6nn/+H9QeoPI5BAiAPlfnwg5Ntwn8ms2GobkiNemyMmq90ATY5HfBlf1bHteXHx+GqzK9
	/IxL83Wg+QJCNuIAlsyASg/e9XLIldvgmTwM+NvzCwczGAFjliKL9NVt6KqwMoijBHYzHt4fqrIDH
	dNai+TMy1bu3w8o8kFYan29WB6fMQ3ZSeC/4SHS7uGk3mCnnd+xILI3fZ4kJYDgFnyFJRXc7Ck8Xn
	YwVFvX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ck-00000006K8s-2vcX;
	Thu, 06 Aug 2026 17:11:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ch-00000006K7Y-2Ndo;
	Thu, 06 Aug 2026 17:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786036273;
	bh=s1hZgDXLqbyiz5DUeUQwLn7ax3yO4EnYmxwrae79gCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WirvFm+RiFTu0g9N6PYyyoEDVGBf3ahkeemyMnrf86kTn8SLbBqsdw8aGsPy7Pyi4
	 KUclVAdkWwGEzZe47tjCH5aVL/ltDuUM18LNGsB86NMDgPcof1d18/2Nlw+ad2AJN/
	 f7ikQIzv1LtyxJN1Ubn5nlQl2LBPLX4IpktlMUUFFYZQFUDvXtMlJYfnnoAjMr+iWb
	 XpEFnm8cQC6t6wxjB8d5SY/nbRwzdlvj+rGLeoeh0rzlXXEd2rklq/iMbwrkE2mHGS
	 Bb+uFXd+h1yZDuyu9nfuBkvlS2gHjTY2EyryHL4/iInoCLcqy+NcmQ3+DK1VDBDf6l
	 jAVFnwQKoSdsQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79DBC17E0110;
	Thu, 06 Aug 2026 19:11:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 10DB5480062; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:23 +0200
Subject: [PATCH v11 17/21] drm/bridge: synopsys: dw-dp: Drop useless
 reservation of first slot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-17-0d508505f383@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=s1hZgDXLqbyiz5DUeUQwLn7ax3yO4EnYmxwrae79gCo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viDeDCrcqe3xFH7Ml1Fvih4SvSx6fB36l
 LeDp6SlArrrSokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qagycP+QGDG9sRV0ehMVE29lObtT8rRU+RPEVABIH1rhf7J04J8EztEjPvIkgCM+ckgFlaUVz
 ed5rmMfbmffqrBKnMMo4zHJ6Gj4Q6nEJ9bZNZvqcIPvzaMT+EsMXKIdBe2GhIejsKXMu2LlGLYI
 jSHNuFsqVnk8M+F0nj2xnijnxmjPWDMNMf2ElaeBg/xeMpON2lUOoyUQ3Hk+B1vyTZnueog+206
 hus7H2KgFyLW85TEnd8P+DRGIgWv2t5HFDmCqABhC5yQ6i9C08JqpZII0zQMHCXDaqm506eg72z
 Bdojs5fun+4S4lz6q9gRP60ffAJO3eOXeEvrFA8Ji9dCXkPmHNqs8aQsC04OjYKa6a0awXCe+Kd
 BurOV364IvW5LdWgO8Eb7nR/EsqlY6iis31FJ0xKvRrjBfHFBy/+E6pYHhIWoDRbVZipN9vyqM2
 7+6M6l45jrqqXNI8/L8JujNZZA194GJmfoINW7Iuf3gBnU9U096obX+uBsMsNRLSEvIbP8wu47o
 iRJwM1i9rcB0V71gVat8iz/BMsMvTBNb94mRpGDMAwxbm4xzgjBWAFARY0I/VyPn7C9AVH6jEMp
 bRdx8n9BkNDDOXlaTs/5JaNBUK3PF4n8rir/cTmEo+VNZtgCyrNB6bVC+rfmHo5xEmB6gUjXO2N
 iOQpII00KZDQyaPP1xfct3g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_101115_759400_387402B1 
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
index 31495a813e40..d8682ccdfec8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1713,9 +1713,6 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
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


