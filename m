Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTm3whJEPVR1V6vQN57Lc8lY18BNxkH1NXZKiaHL+cg=; b=gzToXYNymnzlzo25OcqzitqT/c
	TDSTt/V5SsJHG2+xTy+3E3caVvK7nBcvBoIcZgLFDcCQ9tCU6jlBcatxlGwHnZ3Y6Yo2vB/e/DEwl
	JTtwthNc3gVSeF6PlKT1gRnokc4YphPIQXO+tY7X2VyXe71cqr4l90zZIWJnKQzPqRLJPnsu8Dula
	E3kuCX2v9wBuMNPA+uJf+52zNCnVQrIvwso+ibZQbI5fEmh94HWpuFqYdn21fIQfi5uPjdMWtqSQh
	AXm2pC0TWMpdUj8zwbNJhrLBfUun1cKR8/Ge/2eo76vqb3qV+k9vyRRLuAYAzdXmHyR9bfsh8OkMx
	ntVslvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUa-0000000DWWM-2ZLY;
	Tue, 02 Jun 2026 17:01:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUX-0000000DWRy-3Ero
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:01:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso108199465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1780419684; x=1781024484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTm3whJEPVR1V6vQN57Lc8lY18BNxkH1NXZKiaHL+cg=;
        b=Y+yAHm6Atn/Om6qbhvo/mNJJOpGAsxzTzdtBcGbZRgMHuVwzMhTOJLyP/PDAtIHpk5
         o98RDhNllmUAOatiK7l9EBIGYpB4O277zptx24wYHaJI+q1gPUdS5J260AJJ3zLWXzC9
         N1y7ndM+WjWdtK5L47dj8ijEC5pxT92mjqxlnjkoFG5nFnd8bCN8Pc2YylXqWD7ktxYE
         0XTZtA14Jpm/5NiKJmaz16POG3VF0DRUkbfojRsQGjWfzvUctlWpUO3PSWcawzo0Iw11
         SzZNWV+ds7GytidHeOO9VpShaMn9irtE2UeyHZcvBbpmruQVXtxnMqqWZQfN0egQX8qK
         u3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419684; x=1781024484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTm3whJEPVR1V6vQN57Lc8lY18BNxkH1NXZKiaHL+cg=;
        b=r6NmxywoF6bdbFiRRSbLLFbTOGKyMMF56+OUknDWfuDauqEpfLVj1vLVOTkNLVVU+L
         c/4AF+JabQjeYIcOaKYXiB6UOSh6Jm/eTqjEzKmJ3LW/vmh6h1lTrdcbN/ht/kRpODkE
         tJMJEcVduHhJ5/+bAxpywA7RPgNTKctCr7TG9Swh2iYVuZsdkXxLi1fSC5/lrTbBL2ZJ
         FE+q+psouxF6Jsx/71eJNxIkYPJikF0mmL9+ku79bSe3A32TC0MVNgmmPlrMHWyhNswo
         9vYnRElvAl5NontgxPyUkjskDHtAtX/bLBV/4gLr+jQPJen7pY4d2T6z07AAaUOAgYMG
         3Gjg==
X-Forwarded-Encrypted: i=1; AFNElJ9vF6HOdFdu33QjK3UOWbEQyjznl+5nyq8wGgxs6dcP+/V36ryhDlLfIhgUl/XgvJ7BlQWrbLy4AnjMZhd4YpgL@lists.infradead.org
X-Gm-Message-State: AOJu0YyrB0mIAABYqqmYz2ojfH1NmbX+VfBv+t8P67U661QqO6AiNMmh
	JQoj2FZxhGfxzauWMfx5bE9QtR+gRb4NQVziWbx5ZDFos12E7nOhoF4c9JvxHvtCwrw=
X-Gm-Gg: Acq92OGXegMSVM6+M4s0WmWIm11OE6y8yvX8GxutqmgY5zCSR0ZyBfdBedY6RVp99gP
	5xnZQr6EXJPC1mQRwucarxohPssjcczXow6Xs9RizvxokCMlKyehEAE+73N9guvKXScCCJ4Kz76
	IPrkdf1lCLohTpU6wcbrmBfCI0VyVUIc7Hnm+8OcYsk9+6Yzqr05Bqlaj0O8aUwKQBa8bUj9pj7
	mFhglW4CB5cehqR5acl269stS3araxyEK3GHyhFhCWEZdz+25smZNYaKeoWiMWmYiCjouqQyFG4
	gWCUUd5gVj+hETsCx6KQCP6+iarJRttJRqSlb3pw6M/ue4Hqjs5atsLk38W8jvbNAsvjhLuqLXn
	2mrfYinVB1TxnXgRZhDmrMbSTa/3vJdSQyjYeLuOu0LIoAubV0BW9lQU3YeOjp3+YWtt6T/urSw
	8DuzaeX2v2wERukty8fbhn+ahErE/yXgB01tM65ulvikGfN8jh7yLTks+E/3uIVQ==
X-Received: by 2002:a05:600c:6211:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-490b505e6bamr11024685e9.11.1780419683944;
        Tue, 02 Jun 2026 10:01:23 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm588495f8f.8.2026.06.02.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:01:23 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 02 Jun 2026 21:00:40 +0400
Subject: [PATCH 2/2] drm/rockchip: dw_hdmi_qp: expose "overscan" property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-hdmi-overscan-v1-2-31f71b817c80@flipper.net>
References: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
In-Reply-To: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=alchark@flipper.net;
 h=from:subject:message-id; bh=tHygaxsktj42z30dgx6UrKlEC5FoIMQxcKQ2lQcmua4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTJ84QWFpevzNSVk3KbHC56Jr/59YE7c9cfbMmaquPyU
 WPBI+3MjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKY6vJKR4UhqqtjB4/6f1iwr2uOiUxorJcHYPiX05ukJaUuZAht04xn+Ge4taNm
 kGF3z68uU2DUrlLr/aCsWxnl6+h7Q/tQu8F+PCQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100125_847090_0DE29152 
X-CRM114-Status: GOOD (  12.36  )
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

Expose the "overscan" connector property as recognized by KWin and the
likes to compensate for TV overscan cropping.

The CRTC will use the margin values derived from this overscan percentage
in its post-composition scaler to add appropriate blank margins on all
sides of the output image so that the TV doesn't eat up visible content.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f35484715c2d..fae44d11dbef 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -137,10 +137,18 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_connector_state *conn_state)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
+	const struct drm_display_mode *adj_mode = &crtc_state->adjusted_mode;
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 	union phy_configure_opts phy_cfg = {};
+	unsigned int overscan;
 	int ret;
 
+	overscan = min(conn_state->tv.overscan, 100u);
+	s->tv_margins.left   = adj_mode->hdisplay * overscan / 200;
+	s->tv_margins.right  = s->tv_margins.left;
+	s->tv_margins.top    = adj_mode->vdisplay * overscan / 200;
+	s->tv_margins.bottom = s->tv_margins.top;
+
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
 	    s->output_bpc == conn_state->hdmi.output_bpc)
 		return 0;
@@ -603,6 +611,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	ret = drm_mode_create_tv_properties_legacy(drm, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create TV connector properties\n");
+
+	drm_object_attach_property(&connector->base,
+				   drm->mode_config.tv_overscan_property, 0);
+
 	return 0;
 }
 

-- 
2.52.0


