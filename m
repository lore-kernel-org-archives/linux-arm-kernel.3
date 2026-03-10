Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3CDFCC9A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qcQ7gNd/FYZLVi0CLYQ36BgxuUYuY4ez1oRTlI1iEA=; b=fTqp8YrLfAwdV+SlegUGnB2J0T
	SsO4rEwfLW6zQS0Y0uWpV7raewxHT52zZFAddIJA9rx8YJy7J0J4B86Of/TM8YI+JJgmUw3KfWVMg
	REcx6C/ud83gRZNEFqIufjJUnn4iLEtd4VRf1zT0NTbB7BXON/t72JaFfsvZYam50M9n4nobHKOVY
	/uAI/NkfoDrURnbra8WWQMhbHudkJnT/fhiS8XOnLJKk6rzF2L+Gksd+HsNUTPcWbv0nt4GvCcphW
	VpRx8q5XCSpmgB5KWNArNgg4VCiHjYhwW93Tu05lpouhkkAq4F3Gwp3uyVg8me3pO7ozofxom3Y8V
	WWiFObpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlqn-00000008SnR-1DSJ;
	Tue, 10 Mar 2026 01:25:33 +0000
Received: from mail-m32107.qiye.163.com ([220.197.32.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlqk-00000008Slt-2gW3;
	Tue, 10 Mar 2026 01:25:32 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3653ae7a1;
	Tue, 10 Mar 2026 09:25:22 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v10 01/18] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
Date: Tue, 10 Mar 2026 09:24:41 +0800
Message-Id: <20260310012458.169272-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310012458.169272-1-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd55941b003a3kunm2771af5030dec5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1OSVZMQxgdTUpCGEwYGR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bVsByBz3UcWWVRewBCDwyTidxSsFZAUXtWjgvxbgOVfqYpYJLiWvLNh83My5h08MTC8oOvZcCQ3VKW6D/8KPwDv6CX2rfqxjkg69XL8AtegdE8DNH4oxOpMGJSEnvp8BKzYyPjYgf35GlFYr3KcNIJuSVQSElQOc3o/vZC0tG8k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1qcQ7gNd/FYZLVi0CLYQ36BgxuUYuY4ez1oRTlI1iEA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_182530_879364_4ADE9F71 
X-CRM114-Status: UNSURE (   7.84  )
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

In order to move the panel/bridge parsing and attachmenet to the
Analogix side, add component struct drm_bridge *next_bridge to
platform data struct analogix_dp_plat_data.

The movement makes sense because the panel/bridge should logically
be positioned behind the Analogix bridge in the display pipeline.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 include/drm/bridge/analogix_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index cf17646c1310..582357c20640 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
 struct analogix_dp_plat_data {
 	enum analogix_dp_devtype dev_type;
 	struct drm_panel *panel;
+	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	bool skip_connector;
-- 
2.34.1


