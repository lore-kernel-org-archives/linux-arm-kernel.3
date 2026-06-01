Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB72CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhigD3f+fda/ScP3vl2nfanXCi9uUGJUqNSi/GrzkZM=; b=X4y3KWoNsRl0yT+oNyShA001te
	3bRYo1xE1r8JrKJX18xZD2luJT5Ieyczey2zl5D0mHcMQeRBQjNUUFEGSsfRPBoZxxnyOfxm5UM9L
	/fxXrsZMOTElCNmH0kpCvsQ++ypXLxanpi5MCxrcRYGxyYImKpaK7/9CbX0qmJ5boo/2RfuIKIjWw
	WGsMvMe1lKL6QXORRbL1VkmsOh1MA9M++2u/lu49hT8N6iMYHsimlNiGhTtBC04nN+Dh3oKa8z7n7
	rVZUeCM6nDmoRv6kcd6e5AvU4S3HmNNy/dBxzDG9P3uEAkhkttVFwId/lg0NEsNcE1YWdfRu1ETlo
	NnIBnfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNq-0000000ByDf-3oBm;
	Mon, 01 Jun 2026 22:45:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNl-0000000By2S-176e;
	Mon, 01 Jun 2026 22:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353915;
	bh=nrOKDTe1HmXsLH2kqmhLmoDqq6g4GvbMXtZ492I514E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pa9AIksVwxUHazLrV3OYVJTlSkSaPcg3SetCh2RRQsKs9jjbtIF6AobBvXV3iShS3
	 UFYagSZfJbu9XTry7vFY2Ah7P/4GmUYkn3K8jYu3qinBL/+NYtuVknXQVPtO5/wCt2
	 Phkq+mkZ9sel5Sx8E2WLlQKIMvAVd0+UTKMADf0H+thvxrDBumeC+kwCpA0dNsOxXA
	 yr/gMxk2IH3l4YsgHvFSIS5sSZgpzgOKtGLpuw8Sjat+wgi5wD50JtSODmbutFs1Xo
	 3FwPLBBfOvvPcnXQ3+RpzxVnoUeLA3879sw2xwbkdcJLFfvRpfY9euV/YUrjOmPJtG
	 TRf+jPUyK99pg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C244517E0C54;
	Tue,  2 Jun 2026 00:45:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:06 +0300
Subject: [PATCH v7 06/30] drm/display: hdmi_state_helper: Plumb HDMI 2.0
 source scrambling capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-6-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
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
X-CRM114-CacheID: sfid-20260601_154517_492144_3B5C9414 
X-CRM114-Status: GOOD (  11.58  )
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

Toggle drm_connector_hdmi_state.scrambler_needed flag when the TMDS
character rate exceeds 340 MHz and both the source and the sink advertise
SCDC scrambling capability.  Drivers no longer need to open-code this
check.

According to HDMI 2.0 spec, scrambling is only mandatory above 340 MHz;
the optional sub-340 MHz scrambling path is intentionally not requested.

Once all drivers are converted to advertise the scrambler support, the
unsupported HDMI 2.0 modes could be simply rejected.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a96d81cbf94f..7cb880dcedfe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -588,6 +588,21 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	if (status != MODE_OK)
 		return -EINVAL;
 
+	if (clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ) {
+		const struct drm_display_info *info = &connector->display_info;
+
+		/*
+		 * TODO: Reject unsupported HDMI 2.0 modes once all drivers
+		 *	 advertise their scrambler capability.
+		 */
+		conn_state->hdmi.scrambler_needed = connector->hdmi.scrambler_supported &&
+						    info->is_hdmi &&
+						    info->hdmi.scdc.supported &&
+						    info->hdmi.scdc.scrambling.supported;
+	} else {
+		conn_state->hdmi.scrambler_needed = false;
+	}
+
 	conn_state->hdmi.tmds_char_rate = clock;
 
 	return 0;

-- 
2.54.0


