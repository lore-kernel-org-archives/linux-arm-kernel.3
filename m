Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F31C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYMWwoG+aGYbDAeNtkjiX4sgiIviy2XybeSNdUZXNFo=; b=gSWYmpjeTrEZa/O/aev0laSe4z
	80d7zfZ4N+pA0n5M3UUL/zYTpIYt+yuaYCYXcSqEN5w+NZ4GORBrWHvAnj9WXhOPqjEI9oK41Ujr9
	CkITppVPObPQ00zbIaUyf54Md0HokhAhCppIkRQPxUgy8mvhX4VCxd23rSHN4iw3+N8/de4Gb0YF3
	6Oo7b7TX8BnOovyDFouxz+JohmCMK52cbpe5l/Mo9JPuD+Matd/RMLNBKL6YT+RzCsoMmrtBACexv
	xLnsId/xOoS7mgORyUS0fA7e35zpBwDHX4N3OiYFShK3lcUsCbPp4pXHyQaObbpdf9zE8xddIu+7o
	gsox9wBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhT-00000004gUx-0vQT;
	Thu, 02 Jul 2026 14:47:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgo-00000004f0K-2xIT;
	Thu, 02 Jul 2026 14:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003612;
	bh=S6Q8LDH3QfUyODTJ2AoCLtkLMwF3ThHiyASVglFQcFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m6sOzqvuBdO2NIWXKmJglOcCHDxBIq1L/deKVYHTWoZkqvQyhePlBlYCxdRDuEIPl
	 a2n01mJQe+NyrS3npDXy9wRy3yP06VzNtE6S12NKORcOfKHLUIFl6ufGXE4+ya2GNj
	 F9XFCx/PV6DHCxRvoD7rNCi4ot3G5jomaqzGWdwpbpRCyp0htvlGiYAsoobvQo6LlG
	 EKMLLZfglNNlVM3xlOvGbA59aWPffFZE8H7HYFEfLUEUvgCqFzfSd90QI0RyCMst2J
	 AV2ay1cZClYdrPvIVfkPjhVGUYg9yUzNFLd73POyB8Y2+pYORSesmSQ8oy6Wh9HXgc
	 P1e02aCL5Z/oA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 658DA17E3664;
	Thu,  2 Jul 2026 16:46:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:41 +0300
Subject: [PATCH v8 28/39] drm/bridge: dw-hdmi-qp: Drop unused .setup_hpd()
 phy op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-28-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074654_945883_32495E40 
X-CRM114-Status: UNSURE (   8.71  )
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

With the transition to .{enable|disable}_hpd() phy ops complete in both
the bridge and platform drivers, .setup_hpd() has no remaining callers.
Drop it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 ---
 include/drm/bridge/dw_hdmi_qp.h              | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 4d41ad7319a5..8ce005673517 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1314,9 +1314,6 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 	/* Clear DONE and ERROR interrupts */
 	dw_hdmi_qp_write(hdmi, I2CM_OP_DONE_CLEAR | I2CM_NACK_RCVD_CLEAR,
 			 MAINUNIT_1_INT_CLEAR);
-
-	if (hdmi->phy.ops->setup_hpd)
-		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 }
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4fb1c578a5b..ad33f9cafdeb 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -16,7 +16,6 @@ struct dw_hdmi_qp_phy_ops {
 	int (*init)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
-	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };

-- 
2.54.0


