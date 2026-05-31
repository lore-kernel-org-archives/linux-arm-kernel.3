Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F6ECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl7/bz2Wt6XngU1VBihi/m8AgI7wZRM8055uUzVh3Uc=; b=oNNn87DuM46/eVO8TG2b/Tp6Uq
	BOqKNplWBn+XrKGZni2I5SDJ/OgBFq1L0eKxB/gWNHTfVG4LVjB7MCrkUlwInjdv3bSKmvcKwy5Wi
	thKGEtFUVgJqvQlxDHdI2nZwAAQN2dxDH32zZwvYyoTUtNvPNmp7rF+H+fcOJ8XM9FqyaV+s33ZZq
	7hBvkFf9bcMNyweCOCwEnZX0G1zIn8tgj/UgLtnuh/xxUJWYSdS+/bXyxI2NnxsQYtosX55Wx9LT9
	E2WyAmPd+T7Ogb6PomBGUN7jO0NJXFCVG1GEgsCilUfXs9HXLyTlaMIhrvYWP15bUngxjLyHux2iF
	oTupw8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTasr-00000009LDY-43Rg;
	Sun, 31 May 2026 07:46:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTasp-00000009LCN-3x1o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:46:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so366388b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213615; x=1780818415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl7/bz2Wt6XngU1VBihi/m8AgI7wZRM8055uUzVh3Uc=;
        b=JHl81HBh3y8X2OwtfnuqIjM0Pslk5sMppdIB70QQVY9kqvMLdHJ4NSsRWuwvxb8kno
         fx9UKjfNfOiPbVUiBW/QlTf73umBiFOHZSOb/zWnr3kbT7STjqdQNNZkxTOeLdr7WhwN
         klHYHeHjM+0EapGxAH8dzqscNyt8guYse4TBVM+6eRsSJujH/PlzX8mTCarjaaw9vJ7d
         LxPwHL95O+E1gQinBUC1KLwYXJWU3wLOOHJDE1C+UjQqrPvJnTLuC/a4LaJ0IPb+fP2W
         ZMAVHBDR9lrx0PDnw7nI8mjLF1n+6UO8W0HzzUycURlPpz8yaqnNzqrnyvxb+iMVz+g6
         4KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213615; x=1780818415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hl7/bz2Wt6XngU1VBihi/m8AgI7wZRM8055uUzVh3Uc=;
        b=QJkMCJ6i3GIpNuMcqh8J3GjIkGIjt9Qx+d961bDJmehbQMrzRSI2UuxIq7esv+0Q6N
         qBq7h189Dvm4SDel4XkI3Xld5fvOgFxPTS7T+rn8lydVYOFKiYR9O40peLUjE520zfyZ
         YYf4kjcKeO6F9piMRQw1gWEt5vwEguyl0hIbTgeQYil4As47BO8FmbCz3ScgkP1OCt4w
         VM2397pjU26LqCrp31wNMEF2LmQXnbbxFBLJJaKIhz0gLuJ4xFI5CiA1dlFUUGw0OYb6
         VIxk1hDpr06p8ssKF/o5/iLT9WrKCkSgixkKwYjy3Ma4KX+CybAqa60C65rrZZStLj3B
         BxaA==
X-Forwarded-Encrypted: i=1; AFNElJ8s9Wmc9M3NOvdtH6QbN3pdp/QUNRRoLwIkgsHpJZTXS6YhwWC+M0wCQw+YXLxQVTmP0OBHl1EWmWAayhL9vtnn@lists.infradead.org
X-Gm-Message-State: AOJu0YwmRcvYyiYJYTkYgE9Y4izhgQ+TOs/d3ayWFs94gB6O9uxiWslh
	eNdN+J/h14Az7tE+bs8XeuQRVT5fKtFEthn6Wk60cD4NsohLtdmABw3U
X-Gm-Gg: Acq92OH96ijUrymECDaIt1gL6xUEo62i7MgASDJfm3YHtf/ZwRD4Ru/sV8POke6N6W+
	nZ+yk6YYjYUxVnl34K21XDkP4feElJmI56VHyISpXGPvcZ+t6nycuwNiO5a9jMjyPohd6dgYWhc
	LXuH/MtN37uBV0/SX0o/+Gdx6hJX4rDcTFkdEjWEK6hXmRMCZxmALQ1SMDyOEHgm2vg0PmjGDro
	yIILQjZM0HQfNsyqZq863UQ0/QUeTgtErc7zArJJmKOw9GWTZ64YoxQ0cqdYMqn7Yyk1ZM0y69e
	BwvI9GoOtRCxI+4CQxBmclyMRntfYHCI3JZfBkBm6Uy6xu3kwLxPxHj/A1Zij5YHvKtTGy6tmrM
	2e9A3fqtPoae9dzY1TFQe2dfU7JCW5CpX1ddlGYFbJuNj7P7ZzjNqCof8AWY6nXpHkfBTJWbrcJ
	jZRfpeBAokDtkEWCYINTMEE2OkmLhFa3Umtpx7KD6tXw==
X-Received: by 2002:a05:6a00:1d06:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-842258ccae9mr4697323b3a.13.1780213615399;
        Sun, 31 May 2026 00:46:55 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:46:54 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 5/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_hdmi
Date: Sun, 31 May 2026 13:16:26 +0530
Message-Id: <20260531074627.8936-2-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531074627.8936-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
 <20260531074627.8936-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004655_987343_640A6228 
X-CRM114-Status: GOOD (  12.06  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 1abb0572b..0a0ec34e3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -24,7 +24,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
@@ -369,6 +368,10 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_hdmi_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
@@ -407,8 +410,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &meson_encoder_hdmi_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
-- 
2.20.1


