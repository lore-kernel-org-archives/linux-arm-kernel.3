Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9270CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ904ivttfHdS60TN1sr5eWp6rmZB5uxbrG2ujQs++w=; b=FMeVzCvCycO3E2K2C6jG3XBRXN
	Ht19VSxcL7XJIQg96h/fxk6y6xwLYbY0iaXMoAPmQEGJTRuiqyC3+s6/qtWhdmhChIJxMh1KVdXeZ
	9JVvGLBaeGp3PytnBFD3Y9ZophsvQZITnGTkVPgGBV9PTOs6YfO/kSwpA3BZrG9xkLxCN28U6UbCb
	c7QzD7hn36BVHs6aSwRTL8V0xK1RgPK5+IGxKmTB9irlWwN9x7f0f+gHnIRUe5CZHsPLpvqY7mIbv
	B/6/5ydy3frDioUerTyitXbZL9IjAwZr+ssm7NbdQ6n8zEA9NfuHmqmhX+5yu5VjovQxpdPBGESVf
	cdMBUVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTat0-00000009LIV-1fR9;
	Sun, 31 May 2026 07:47:06 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTasy-00000009LGO-0SfO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:47:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so721460b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213623; x=1780818423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ904ivttfHdS60TN1sr5eWp6rmZB5uxbrG2ujQs++w=;
        b=d9KAH8dK+x69Gn5kCzc5CB8ed0cY/GwC5XsgCrs1YElnG3X/8CYNBQQsheb/YfGpZS
         YzvYiBcW9YlE0P90kpn9bF0MamnEU0psEZ48CYvwFn004YWf/4Hfgbq5dWDYyr+ZqUrd
         UMAbZjZOVCcS/ds96/tjYQcXskul9yW3saPoUBwYwQf6J4A78cMdXe3aK4sMxGEo4iq6
         65zq6aDqzMkqzz9u+C7i5+0UV61j4ZiCDZHywAfuBgLHy21ZPIAX0d3hHv4lFzy0sUrx
         W++8vtmz8+PXABbCVXs7GN/2d+rNlbBy2t7A3ICpSmkXAa/wuopeQxlo39s8NUVUPzvG
         jafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213623; x=1780818423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZ904ivttfHdS60TN1sr5eWp6rmZB5uxbrG2ujQs++w=;
        b=gvMU9dGqa1UmpihtuakCdGv5bjoT5dxDW3iani/yTCQ/e/cnWA5g6bXr7pjVYjyJXd
         subPrRExOwQxqVQRKWQW0GR5Z+AWwFPOnqG11apG/EIhRt9GdcB3f4n4FXF8EOpBx9Q0
         GPOJyQO0CftNDoqnc834R9zi4v7Wxgye4rsP3BiAWImJntEw+4UzTFXZJCLKDuCzr5Ix
         ewPYShFS4TrBE5ZgyhPt+fyQH6mhZy0QylFuud34RtrfbsiKPX9dp7v16QB85j0sDIlh
         h2Kv+gP5nZsCrsgq4M3tj0c2xZn3LPnCEkOKliYtwqnVFV8ksaXxxEvep0W0ee8cr4PZ
         iWhw==
X-Forwarded-Encrypted: i=1; AFNElJ9iJX1kJZ26/I2VbFpWoLTW8IDA57L6+eq/y6/EqXcfZ+IVm3I4z3z8UHQf4znT8IADV7jYp6ORXxz4UOorxax+@lists.infradead.org
X-Gm-Message-State: AOJu0YzqGqaKmhLXOiqmEIgpPm4A60MZx6obhIXWHsvj2EpU/dbGo+6f
	r8htfNZSzee6rJAj6a4+0rdRKVWQAchmPRRM6f5u5StaRMGnLhoLY1tk
X-Gm-Gg: Acq92OEkaYUNnmkzOia/LPvVYhqhkwX238xIPK+IEaA1ELIemN5QxzVCfmnwxC72AhJ
	x9gRiG6cZIH2YRzHk3rfuF7ew0ZUPhwZORqKl5pXrKD7UBXQQcshl6QfVHoDc0WqPA4Y9usvE7n
	kpfex7ZQ1B7fA/Xq18pykv+FW8jJEaJ/DUr3kZiiah7vPG7pAwQ6vGk+2sF1GVUhEWjd7TEUy3i
	JR+awRLrSpkvwTqS5Qry9FQLZNwILYEXbYmgq0g27C38ttNkK8kIzDU+jKkw+jcX9Dpa0aTTdP1
	3roORscDLCXbfpK91eV8wS7jM0/UwpV1hhiTY5y3IgfPBL8b15afc+8wpyNLnKV8/gOfkCgxU9h
	jjkh6llf0lMV7q1Riluni2n0OiPvrKhpQiOjJyQGKOGl/BP53pQhoMOOH9Juwlswin3AaT8qOFF
	p7nEN0FU6OVd5RBfyDy9MHjPmLwrHaZO+LHXSINuWZTg==
X-Received: by 2002:a05:6a00:a211:b0:82d:162c:581f with SMTP id d2e1a72fcca58-84225a087c4mr5251686b3a.48.1780213623224;
        Sun, 31 May 2026 00:47:03 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:47:02 -0700 (PDT)
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
Subject: [PATCH 6/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_dsi
Date: Sun, 31 May 2026 13:16:27 +0530
Message-Id: <20260531074627.8936-3-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531074627.8936-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
 <20260531074627.8936-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004704_149740_DF8204C8 
X-CRM114-Status: GOOD (  12.08  )
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
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index eba246791..e14da1f71 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -10,7 +10,6 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
@@ -99,6 +98,10 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_dsi_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
@@ -133,8 +136,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+			       &meson_encoder_dsi_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init DSI encoder\n");
-- 
2.20.1


