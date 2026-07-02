Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3128EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFUrymzCxIlXSKKHUUINqaKFNsAdVN6u1E+DIq4Sfn8=; b=JvaedUjYv197AiYLffpTGP5K44
	Rv6XIIHE94UHRkkYiQnDBfOsOLannFbpVDr+qUeJAjvR5AtipHSBz79VmkkV1V/3e6zT7b8FwwoeV
	5IUUhAYM/f+UQWQQcAx8T8P7FwE2ZKy/SWoobd+b+QDQ0X6C0LIYb5rlnZ0qcPr+0vuaTbQ+kEjEn
	ApnAAzcoVuhYhcxk/GLcrREllsbfgaRljIM1a0fLGXRpQsY2hUKBffqLNhqJ4unHZZULffzqKqWNp
	AlQUDVFVnqs5U58v9rkFIEO9AqiCz7qxXA0blgwA1SEx+ogl5x3pzjaQsN2iRo3BOalxal3ckyQw0
	mx8t1p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgh-00000004elB-2YjB;
	Thu, 02 Jul 2026 14:46:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIga-00000004eYK-2wEG;
	Thu, 02 Jul 2026 14:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003598;
	bh=x4u2dfItxzoFU/CVPWRWwnjc6iScRuYMltXDcS6NYEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8Roq17UJ01nVsa3g4nK5z3fCr28YdWISG/w9oXNZGpxvT7eJLfDNo7zff6djXsKA
	 JxboBlJAKi6cCOOW7rjcUMkn2IWPb6ezclgKDfAgxbX8eK8Hvik339fTMi8JK/4PLy
	 vvHl5faTxPWNrCvNSHMQ7vWB6vXtZSUPmkxO3+p39tOTy70DuzCTr+KGhYyA3zr8K5
	 3oNOROA/qKGz0eo0h2RVodO8itWycYVAYRS1r4sjuaQWs1kPuXm52bjCP54m+qRPmr
	 qIS6vL5j55JoeccxfQ7S1xN922G3ziZqksf2TuDirufT/owKb5jY4s9NDSj8baYK1m
	 Th3RoYYMbLKzQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2DE8817E15D0;
	Thu,  2 Jul 2026 16:46:38 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:22 +0300
Subject: [PATCH v8 09/39] drm/display: hdmi-state-helper: Add fallback TMDS
 rate validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-9-d79890d00b6a@collabora.com>
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
X-CRM114-CacheID: sfid-20260702_074641_808760_BBB49875 
X-CRM114-Status: UNSURE (   9.85  )
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

Validate the computed TMDS character rate against
connector->hdmi.max_tmds_char_rate when no driver-specific
tmds_char_rate_valid() hook is provided.

This gives HDMI connectors a common fallback for rejecting modes whose
TMDS character rate exceeds the connector limit, while still allowing
drivers with custom validation requirements to implement their own
tmds_char_rate_valid() callback.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce17eeefc2da..db76699093e8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -566,6 +566,9 @@ hdmi_clock_valid(const struct drm_connector *connector,
 		status = funcs->tmds_char_rate_valid(connector, mode, clock);
 		if (status != MODE_OK)
 			return status;
+	} else if (connector->hdmi.max_tmds_char_rate) {
+		if (clock > connector->hdmi.max_tmds_char_rate)
+			return MODE_CLOCK_HIGH;
 	}
 
 	return MODE_OK;

-- 
2.54.0


