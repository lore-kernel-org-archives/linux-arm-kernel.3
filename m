Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tXb9baF9;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=F3FFK/8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Atr7jCw5foNaUR+UTxGp65IaTqEq2+vCnCpbrDPXzlA=; b=tXb9baF9vt+igh
	Xv+cpZSnFI8/vi2RjUYYYmUxTlYHbQjf6jZMJ5XGiV4bWcVIZTiMYRRbWd2me4o4rIyYrbuGkjbXf
	vd9GV4XwRSCiZc1WPnmLZjfkDpglTECM+XdJNlW7d7pNIxIQ7Q5sgH6yJU1L7R4cp03362y+j3sdR
	F3qjow93lIoRPDuw4PxVItdwW6cJlVGbRJFNy4ZNNwa5Skfs/MV5EARCICQtycLazN81147LBB7zz
	x/W6oyJfjQq2tdyTXBsa0/ipauE+QMaojeOlw+Od27H3W1z/pxGADfdMqt0a5WWnNfewep/zhOyzz
	hnm0ww1ecdejyTg8xaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhIv-00000004srn-1GPf;
	Tue, 27 Oct 2026 13:33:29 +0000
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhIr-00000004sr1-2LHe;
	Tue, 27 Oct 2026 13:33:27 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a2a;
	Tue, 27 Oct 2026 21:28:20 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 05/18] drm/bridge: analogix_dp: Check all negative return values for &analogix_dp_device.irq
Date: Tue, 27 Oct 2026 21:27:57 +0800
Message-Id: <20261027132810.1746118-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17d8c2afd03a8kunm87c266213d56ef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQx5PVhgdSEwaQ0tKSh8ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=F3FFK/8e3HcpyES/ytYE8Sx+ej1iUy345GVGh2ahq2T2q+vThfjpULlUzfRYZkvRJZ0mF37Ajr11Jmqnxbx8zzd4hs5yb+iglWjGA69j39zQnMXFlOL53RleBRmu7ZC2WvRnfL5YUEB4zSSPDAIqpABMjqZ9jPbcSYAIqMVP4F4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Atr7jCw5foNaUR+UTxGp65IaTqEq2+vCnCpbrDPXzlA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_063325_815864_B93A4019 
X-CRM114-Status: GOOD (  13.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently only -ENXIO is checked for dp->irq from gpiod_to_irq(),
which ignores other possible error codes like -EPROBE_DEFER, -ENOENT.

Check for any negative value instead, and propagate the actual error
code rather than hardcoding -ENODEV.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260804083307.84ECA1F000E9@smtp.kernel.org/
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Change the type of &analogix_dp_device.irq from unsigned int to int
  to fix the dead dp->irq < 0 check, which broke the probe deferral
  for the HPD GPIO. (Sashiko)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a3871f28b835..c40ab7419f08 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1519,9 +1519,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		irq_flags = IRQF_NO_AUTOEN;
 	}
 
-	if (dp->irq == -ENXIO) {
+	if (dp->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(dp->irq);
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index dc189f0b7a19..cc3466304531 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -159,7 +159,7 @@ struct analogix_dp_device {
 	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
-	unsigned int		irq;
+	int			irq;
 	void __iomem		*reg_base;
 
 	struct video_info	video_info;
-- 
2.34.1


