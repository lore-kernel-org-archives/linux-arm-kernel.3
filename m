Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1610FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dWbuXPSLohRB/M8EIN/JzhKRKCDqHb+iOVssm+yt0m0=; b=FF1ZpD6oZYK6GrQz0BZPwhLIrR
	qcRT7+D4RjL4gtuCoU8KHx28UKrSuLsY875KXDhRfs9RvPyzh7f+PKKX+38iWMn5UUJcAl6i03OFL
	Nd/jowS2e+xKjdCiJqMOBogFYf5d6Y+oyusg33b6gCV9dMdx0Se+7DJZ/R5J/n4n0vGOJp9CPFRh1
	R1EyQv8d+nV/oUrdQRR6X8K5FUEBCbI67mS1ZlchrsYnEbzV7VaXzHfChUJjFc/OeHLY1U1WyBckP
	bPyBy5QCUdo5GSoZOIAFg8uqVrokDxPdwzRaCiCjOXXfOclP+y0LtxOREI9u7Gg0s9z/qbdupaga9
	8FR59JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIy8-0000000GEyQ-2oQa;
	Wed, 08 Jul 2026 03:29:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIy5-0000000GExj-23np
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:29:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc61541f8cso18703615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481340; x=1784086140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWbuXPSLohRB/M8EIN/JzhKRKCDqHb+iOVssm+yt0m0=;
        b=M/OjDZF/eYgw1XMoyQllqyL1Ytuold3HdCqFlhMceoQdAvOk8S5aN6oU7s3lT0p72l
         Zp+gzGi/uSOQ9ZghuF0SnhaagvYAYJnvJJbORXbx3e8rLOm9c9zy41UCI0HaKyHUUjDF
         pT8bpLr9qqjel3qmrKXITR4o6Eh8KcU8mlFNDuS/5oQLY6QBZmcApaEh4PQyyAJkACb8
         0rP9N3wY8dM2Dn3wHxbVc2nthEMXIZGkeb7oRkOoqkS5RnRoZ5Gecs76c2ji2rj7UTod
         Fjd7+8g1Ub537LM8+hfxKOiIgp9Lg8XEDhrxGZVZcgLqDcGPoeT1eeVclFB3Y5035SP1
         D7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481340; x=1784086140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWbuXPSLohRB/M8EIN/JzhKRKCDqHb+iOVssm+yt0m0=;
        b=U6sP4kiruT/OR9XvgxdwM1KwGL3Smf9IHaXuMf/LV5w4zVhFgXfOUTJXa0gVaOko8t
         bEvZnPQYZDgn2Vg2Ye9EUeFwEbHG30izrzH3XOgh1uHLDfjKLUW88gnQj6cVjFUx2PLm
         JB3EUKK6xtrjJQbkIrjRfAJNleLNI1RPv2ETn9ERLuOTJ8zLPpl3g7PwPXHmUxkCtLJv
         6NSvGOeG61q0/i6lblmuvFvOv0GGtpgq+DGYUNZugdAkMrdONgIKh5wiEpXEhMujPe5V
         65lh2b6mBzWC8pG6AHQuhdSnrJlXdDiftWmE2Im7LwIMaH1LZ6i8ixdUHuDbjaiV1Hbx
         g0qw==
X-Forwarded-Encrypted: i=1; AHgh+RrO257iiNRyFfSIl5rVPM6xB8OQYgFtMyJeN/grNZgiVEPiGdY7Hc4W7wzDZexv/g7XBPupCwgVJS56OR9f0z8D@lists.infradead.org
X-Gm-Message-State: AOJu0YykSuRfIzZmAgSSxaOUjyfs5nXEMlFdMQMPKNPUTPtYVWLt8KYK
	JLENQHzhztrjx2IJ0q/xaSmicv1lc4++OS9EDLggkxUIU73ZjlXwpnRu
X-Gm-Gg: AfdE7cll6gwJY5TIn2l2Fxo/wtiFUepV6SV4YsS5A/qiJC22Z/kyKbUtS62TPri4Gky
	w+d92wg1z2EDHoavcMn3S8dv6gU5DEsDmogMHMOqKpUU+ngU4tr9RbfQCjgUy0h618rtC+siPG1
	FWXLRayYhm/jkytelwTVtuuVzK/ZQeyiaSWLueoQV6p2JT3gvWwxu2RqgUrO3OrlNQAQbKInRIi
	Lz0Vz2o20NC6y2/9LWzkr+7QUAvn8wb0rhfhSsASphRAeF2tqjF9LiCSPEqnYGj+5c57NyQHjlY
	u5AJkylhceHS6C4wKvy0rYoz+uEspSF4utorKiCwk5rq742NQTOUS66umd6652FruSsEoGA59JT
	V2XLA6JgA8XtJ490nVAPvBObGdt5RHnjurtRyVlzHM9EO8AQ4UtlWPKpi+26CEnHDAYmrBkb1PC
	W4PqMwUC60MQ==
X-Received: by 2002:a17:902:e84f:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2cce9fafe09mr7101655ad.9.1783481340217;
        Tue, 07 Jul 2026 20:29:00 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c20616sm20602815ad.34.2026.07.07.20.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:28:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jeongjun Park <aha310510@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/exynos: vidi: fix EDID leak on concurrent connection ioctl
Date: Wed,  8 Jul 2026 11:28:47 +0800
Message-ID: <20260708032847.712897-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_202901_532716_B6258E73 
X-CRM114-Status: GOOD (  14.66  )
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

The change referenced by the Fixes tag added ctx->lock protection around
struct vidi_context members related to EDID allocation and freeing, but
vidi_connection_ioctl() still checks ctx->connected separately from the
state update.

Two authenticated clients can therefore issue concurrent connect
requests. Both can observe ctx->connected as disconnected before either
one updates it, then both allocate a drm_edid and assign ctx->raw_edid.
The second assignment overwrites the first drm_edid pointer, leaking the
first allocation.

Keep the connection-state check and the ctx->raw_edid/ctx->connected
updates in the same critical section. If a concurrent request has already
changed the connection state by the time a newly allocated EDID is ready,
drop the new EDID before returning.

Fixes: 52b330799e2d ("drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 33 ++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..bc0af9e6bc81 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,15 +252,6 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
-	mutex_lock(&ctx->lock);
-	if (ctx->connected == vidi->connection) {
-		mutex_unlock(&ctx->lock);
-		DRM_DEV_DEBUG_KMS(ctx->dev,
-				  "same connection request.\n");
-		return -EINVAL;
-	}
-	mutex_unlock(&ctx->lock);
-
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
 		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
@@ -293,21 +284,37 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+
 		mutex_lock(&ctx->lock);
+		if (ctx->connected == vidi->connection) {
+			mutex_unlock(&ctx->lock);
+			drm_edid_free(drm_edid);
+			DRM_DEV_DEBUG_KMS(ctx->dev,
+					  "same connection request.\n");
+			return -EINVAL;
+		}
+
+		drm_edid_free(ctx->raw_edid);
+
 		ctx->raw_edid = drm_edid;
+		ctx->connected = vidi->connection;
 		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
 		mutex_lock(&ctx->lock);
+		if (ctx->connected == vidi->connection) {
+			mutex_unlock(&ctx->lock);
+			DRM_DEV_DEBUG_KMS(ctx->dev,
+					  "same connection request.\n");
+			return -EINVAL;
+		}
+
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		ctx->connected = vidi->connection;
 		mutex_unlock(&ctx->lock);
 	}
 
-	mutex_lock(&ctx->lock);
-	ctx->connected = vidi->connection;
-	mutex_unlock(&ctx->lock);
-
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
-- 
2.43.0


