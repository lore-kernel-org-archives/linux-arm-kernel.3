Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A428CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOvH71uNt7uS8xhhfFmnDFxc/3Aovjmqf/M6vbkDSxw=; b=Bi6Xi47tobZf8nNcaab28yZO5W
	O0zvbBerlP2wqoDsN4F7dUDexKzASQf3fJ6XTWju9A9Yke8wgUVUiUzODWO1q1LOxNr2bbAdcpSce
	9zZT2UCaWm9ACHhCctyyR8W1mj/MquK8fbvT1hJZt97oAasEhsy8erFikd169+c6ry435bITP8rjr
	eRZdz6MIiwDOxQ/Tt3XErqP+g27UgEGOgoEgr+Oi/fR+ShhvIyTKgc1YiCP4QVyi2YtDm1+kVgIgR
	bJyg+ShitzVWTOXvEC17rSD3+dOm4CaYaVl+Du5txwt6GgF4tdHSZU5KYel3uHSMtyXrfM9vsOjcK
	W5T4oXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzdI-000000085yd-2ggn;
	Fri, 12 Sep 2025 08:59:52 +0000
Received: from mail-m49210.qiye.163.com ([45.254.49.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzd9-000000085gx-1ciI;
	Fri, 12 Sep 2025 08:59:45 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298a0eed;
	Fri, 12 Sep 2025 16:59:38 +0800 (GMT+08:00)
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
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 16/17] drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing in analogix_dp_unbind()
Date: Fri, 12 Sep 2025 16:58:45 +0800
Message-Id: <20250912085846.7349-17-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26d0f803a3kunm813a8c8ea46349
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhIGVYfTUtMSU8YTE5LQh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hcrNDAFVgHCnqsQ7PX05oOzD6tFw623+JrVW/+osoJGGf6+DsXXwbVzfdEXGf7ju25zBD39M40MDJ2KVFDIub/P+YVYGaLtjQIgjTLFEnyLMy7a48IoTZpPTNKkGwPmlC8i7A4pP8kBLV2Z76iiNWuHnEvgHXVLcMGPUbOObE7s=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LOvH71uNt7uS8xhhfFmnDFxc/3Aovjmqf/M6vbkDSxw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015943_693881_8C205F21 
X-CRM114-Status: UNSURE (   7.68  )
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

The analogix_dp_unbind() should be balanced with analogix_dp_bind().
There are no bridge enabling and panel preparing in analogix_dp_bind(),
so it should be reasonable to remove the bridge disabing and panel
unpreparing in analogix_dp_unbind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c98058e9c917..5e9e14b2f29a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1531,10 +1531,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	analogix_dp_bridge_disable(&dp->bridge);
-
-	drm_panel_unprepare(dp->plat_data->panel);
-
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1


