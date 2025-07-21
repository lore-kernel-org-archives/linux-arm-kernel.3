Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794BDC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6g9i/MXfV7ELkiP6xRrn4Jo4yTTf+koCXJ5M0o2kZc=; b=ujcz+GcW4HfVFBtvOQ2dKQLPln
	XPife+F17IPRDej9z9j3+ogmXrMsNTeh20XKMRFRRmYNyyugxUNqfzCRTRg2Cnp8vaEVZx7m5h73w
	C1iKjuBzLk+ZsXhS7cBB1kN583ocDVuDRXNGJlR+TqD5gAEJ2cYZj/IHBate+Wwd9nWZJITTs2RFD
	F7l1RNRpXjnOzyagHOPZjwge2Vv0w86MJM7U8bBAcBrjx7yxy1Vb/fZpPPqLBCCeRFZfxkmjqQUts
	DGktNRcw75IFEJbJGHHZRFVKhNJMJfJHpwxo4EkDO5mfZVHgNeoheytCBFovSUFqScNS6a1im1A0B
	DH/C9MNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduuU-00000000OGG-0rkS;
	Mon, 21 Jul 2025 18:06:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduTw-00000000L62-0azC;
	Mon, 21 Jul 2025 17:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753119558;
	bh=FDxPF4OT2bcKXd+eUAvhu2FvLoFP0u3RBFHt6nkW8Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BUtEsEU1O/71WkTafKm74yVOPcszS9eeyMS6tKeZYgfHzO1y8AnY8WoQFGtRi9Cp+
	 Uyf/DYYJmSx3eUC1E8MNYrsqiAXUXb0hddQ2T2c6ygy3hLewHC5M856xhJmJrWM4/Q
	 eWpN/3Ojg/sYagdecKE9yBR3Pue7SKOvI1qKYcmzSBY4Q4kg2G/yJ7nixfGhyrp5wt
	 ej5JNj7cHR3vST640/KUX/xGl3m3h/vxZzUJl1eNry8wBtPyRcGI1g+rXfTdP7lcp1
	 s+YUumTqonDcNjiXUxqqiCa2PPMwcDYe3Mamr1gpxJhu+AJw96oU3pfZD4rcP/t97s
	 bmgYOFivgctDw==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 89AB817E14A9;
	Mon, 21 Jul 2025 19:39:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 21 Jul 2025 20:39:07 +0300
Subject: [PATCH 4/5] drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576
 regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rk3588-10bpc-v1-4-e95a4abcf482@collabora.com>
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
In-Reply-To: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_103920_364462_23D20F9A 
X-CRM114-Status: UNSURE (   8.69  )
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

For consistency and improved readability, redefine a few RK3576 specific
register configurations by relying on GENMASK() and unshifted values for
color depth and output format.  Those are not used at the moment, but
will be needed soon to support the related features.

While at it, drop a few other defines which are unlikely to be ever
required.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index b2dd29347338d58640387adb2b455cc1558d4272..578ff5eb87f1e27b9bb9a6a299347b24b45381bb 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -38,21 +38,16 @@
 #define RK3576_HDMI_HDCP14_MEM_EN	BIT(15)
 
 #define RK3576_VO0_GRF_SOC_CON8		0x0020
-#define RK3576_COLOR_FORMAT_MASK	(0xf << 4)
-#define RK3576_COLOR_DEPTH_MASK		(0xf << 8)
-#define RK3576_RGB			(0 << 4)
-#define RK3576_YUV422			(0x1 << 4)
-#define RK3576_YUV444			(0x2 << 4)
-#define RK3576_YUV420			(0x3 << 4)
-#define RK3576_8BPC			(0x0 << 8)
-#define RK3576_10BPC			(0x6 << 8)
+#define RK3576_COLOR_DEPTH_MASK		GENMASK(11, 8)
+#define RK3576_8BPC			0x0
+#define RK3576_10BPC			0x6
+#define RK3576_COLOR_FORMAT_MASK	GENMASK(7, 4)
+#define RK3576_RGB			0x9
+#define RK3576_YUV422			0x1
+#define RK3576_YUV444			0x2
+#define RK3576_YUV420			0x3
 #define RK3576_CECIN_MASK		BIT(3)
 
-#define RK3576_VO0_GRF_SOC_CON12	0x0030
-#define RK3576_GRF_OSDA_DLYN		(0xf << 12)
-#define RK3576_GRF_OSDA_DIV		(0x7f << 1)
-#define RK3576_GRF_OSDA_DLY_EN		BIT(0)
-
 #define RK3576_VO0_GRF_SOC_CON14	0x0038
 #define RK3576_I2S_SEL_MASK		BIT(0)
 #define RK3576_SPDIF_SEL_MASK		BIT(1)

-- 
2.50.0


