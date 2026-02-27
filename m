Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DAFD9E36
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l127qV+2+PHMxahmGck2ATeIukpig7iHOGTiow3YX0=; b=hbruzCAqYDy6T7zEZy/oKwwDWo
	+lDAFPBlC4wzyG49YnP2fhaxxJzW9d/r1UAMAiZJY7qXPOmhHevWg46GvKQ29XaUW0JIArcUUgBgv
	bsqy9aBYylg/2Z7wmPMsGt/tNQv96FxXYWizObFEaAgKEt+tK8Rs/NUZo0uaPdZVte0xU/MHWQX0v
	NVHBU6FGSx+D8Wyxzg0sghvjrdNrI9wBYnU5uu0N0qwoU6Q/EuUxKE7EM5MSEzMkzB3Rvhejh0AmM
	lAekYf4yMwJpaDFfcCAksHolG5n+lMHDCNM2w4nnNKxy+6gV664B+QeoKyVgCUUbiQPUeH6jROXVJ
	MTFlfjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUq-00000007bFb-1YiK;
	Fri, 27 Feb 2026 03:26:32 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUn-00000007bDl-0sFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:26:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3590c295150so589586a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 19:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162788; x=1772767588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l127qV+2+PHMxahmGck2ATeIukpig7iHOGTiow3YX0=;
        b=XLj+PGJQ0QZgKiaRgsOD7SikD1BcJWkLWXYRem9ebm/tfNJO9K2LJdROIr6Ba9ZeQn
         mmDvN3nea6GAKjfRSVm6elCrROAmdv84U/UncGYApXVNqSahHqSiK2XO21FwHNxTSjVr
         Sw5QSnafjiyDZ4uxPgBvxKNtSKG3f1rlEK2YQXoCO+ZfAql+mcLGr1bDT5GZ6mVkSYFE
         ekgxZRWv1F+ZKMoCjQD8jnXeqSGUpi5xdjvxJ9o9okfSutpV+BLgs3Yd26zdB83+pSHb
         glE8V8wY6eDOelrtnHuaQhecN7kFFRA/HPFiDcLPOK+2ErnZflMziuf+cVydcDBGUKYf
         +MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162788; x=1772767588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4l127qV+2+PHMxahmGck2ATeIukpig7iHOGTiow3YX0=;
        b=U5+/YimrQGo1EeuIdfOwSh8XwTuovgCl6QL+D8XP6ZvQiuoMkjsFqVQTuDCwUKXZhn
         cIBEI1aDzA13vNmIWPWwXAbbXK4daYCHvCGxg2S1D6zh1TldUd4b6oP5L+rKf5XV50lJ
         fZaIF04gI/B7ZO/wq6z+ihEchfZ3onEgJG7DGLq+Y3eLqcrc/o6LR0btfPHCHqCBUclm
         OZ79wzBeJqhq0UGx4MrfOGlFzuaEHmptE9dENFoXlnIMHLdwXc5GBiPegdY+o3ZK18jo
         lWdBJ7if+kp2UXqqOyf55p3MFfbQgGdOxl9/qNpJkB2XL/kYu0idqPgDV5Ag/6os06HY
         dSYA==
X-Forwarded-Encrypted: i=1; AJvYcCVzey39Ll4A73Uups7wx1C5n51r3Kh0tlm8+QDZUsaDCC70ekdL6Sf2sqQkVqEFcvb4GPr+bJWc0XCKn406NTl4@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgj/GHEZMPfpBhhvhiu3wDflc3DzanCaoQWT9mtrkWHKjvXOj
	vXyHhMcWiCth3kJvn4o+hMNGiAebAEk4MXS5XeXQoKCIB9LnUENSqXdA
X-Gm-Gg: ATEYQzwSKUYxZNaTGo7h7sIJovBuoJkeWATsJR6bp6iEQ2kCh+pNgvIdBSKR3F++iLW
	y5j+i6NuiFmBqzvvoDsKispIp+KlCcbuw/KBx7OVOEUP1Zc4wxBLRlur/AUdLEVxN+GVezK3BOe
	XhdiWX5jpV5kTUeuGfMbZK9eivolCBLXops/vRlNOXB5ayvS4ai4HAXAySVSCq/ei4fzqmRUrOl
	6l3npraPQQJfQbogncXJ48IHiBE7bg79ZRbz1t7tQGZIgjkEwPvL8dNO75BAeONYtV0GD2KIq2p
	Q3NWc1k5/FM2WN01yGoly0eSB/07nBIbiP2AYzAkyLeqAd0EbCdytf61thLSd/PWkyknE4W/2Jk
	6diUbIYqwib2bhDPrK94/9DFxzYP8aG3j0jGz8ETxFzNMteNo4qwiktJ0dG/HXmK1+EZ+pthfUy
	KWjgCUx/QB+MDokk3Jxi/4ISS4Nzz3ngiFLWqeopJ+TOWt7Bvg9A==
X-Received: by 2002:a17:90b:1ccc:b0:340:be44:dd11 with SMTP id 98e67ed59e1d1-35965cec522mr1364382a91.27.1772162788098;
        Thu, 26 Feb 2026 19:26:28 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:27 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 12:26:15 +0900
Message-Id: <20260227032615.108139-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_192629_251556_A8CC9859 
X-CRM114-Status: GOOD (  18.91  )
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

[ Upstream commit 52b330799e2d6f825ae2bb74662ec1b10eb954bb ]

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Fixes: b73d12303ecf ("drm/exynos: added virtual display driver.")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1f9d8873a63a..151a1b43c20c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,29 +186,37 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
-
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/*
 	 * Use fake edid data for test. If raw_edid is set then it can't be
 	 * tested.
 	 */
 	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -243,11 +251,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
@@ -281,14 +292,21 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = drm_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
+		mutex_lock(&ctx->lock);
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -303,7 +321,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -326,11 +344,15 @@ static int vidi_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int count;
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid)
 		drm_edid = drm_edid_dup(ctx->raw_edid);
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
+	mutex_unlock(&ctx->lock);
+
 	if (!drm_edid)
 		return 0;
 
@@ -485,9 +507,13 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 }
 
--

