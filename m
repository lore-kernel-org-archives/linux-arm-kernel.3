Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8817FD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=; b=h+CQW5KIcWC+rJeJZDVAY5UAJh
	7pfA/Uo4K25gqSEjd330vBmSzKntbXYcuU6Wn+KJiYU54oKeHOYwObnZu3nmoWq3QsTbCjZOHHn0M
	Z+eyiinn6tXU0XiA3GlToA6+abaN2KdV+H7dnGlFHJ4up9T9tKtHD5FeyFYxoWYPf7zXlZQJGZq4/
	CS0UDrammGjpEcw/UYDaDhTqfG1+e5ItcnVc4wcsMgxgFjO9OeDte2y0SrZ8zJaYATl1gorqC+mR5
	sY+pi0lVVZjtAx5ln24+4qhOd7EwTTD+swojyfnxDTqbwVl1mSCZsKBU5o//z0X+UhcW4IwiglZrM
	WYyBr/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTl-00000007ig4-3OC0;
	Fri, 27 Feb 2026 05:33:33 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTi-00000007ieu-3uMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:33:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82748095963so492014b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170410; x=1772775210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=VpSNP08suJ0cSo/sCu/PkjGYWckw9v6mNOjV0YhZ2L4GsBgpMkbG4mNl0cspbcac8+
         gOIr1XnY2QoVruBojzyUuGGCn+pqx9uSaHZx+0IZbGPwurYLBaFoLnY5pF6bkuMeKHg6
         /krBGi1nYGnyib7//8ml/3gMrh0AjmOOTTHjz4N9y35qrp0N9ErEWunh5J8MpeYQvWVN
         uMEXR93GxQqHBn9h2cDgCcaIUMsTiEveF8MM7ZIytGNHiWHLtCgx6PcIl1Ns+P2t9z1K
         dH8plmXRQwwjFtkAuSXg2G0CMcJQQ3hfdQJMwlTE48cbkpfX2m9jI8RVDbe/ztE3BJ14
         WZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170410; x=1772775210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=PqCZKTm18yMcdv9o8kscu5jTex6JuweMuCcEqkMf0vYM0SLuoOupvvxPDUpl613hG9
         hLDRSy3UjeO8J243Hs1CeVUXMbD/TDF84qeR2szPt6U3XF2RITIbadB+ef/I2PSVk2f5
         /+e2O6C8GvZm4k0EsFL7qId0d9ZsESuK1yh83moACxbA1cgy6OZXdFo7ju2hUpdiz5g6
         3VjtwZ1LRSUcHruhqSwbe6rIBzBX9YBQfTVrtZi/gxrKcDnFtiMbBq9LZR5QK2/iI5yY
         pBIw7qMb9vLzSJCO5UdU57d3tU60QK67JczxMDjcZYyIcM8fu63bOkzIdnLygCcQyBzH
         gtyg==
X-Forwarded-Encrypted: i=1; AJvYcCU+eGdR1RJozdgL77c/GJ283pLl62BhkdDmgWAYGmQKypjumM8CxJtD3PeJgrwhkP9ApoZbV6SIxhLr7gG4Vl3F@lists.infradead.org
X-Gm-Message-State: AOJu0YzhXzmmcPRA2pClergYSzYJXvispW5cfX0MBuPMZKiNZfclysVr
	/UGUHU/L3MeER/DHsfNhJivp9boMadZuhMoTA6VyR0iYgs+QI87fz4vZ
X-Gm-Gg: ATEYQzxagcMJwOgOaDxQf2Zv8GIgpjtjVTGqHrTgtKvk+aAp39RnUSQgYgembOD9F+k
	UKyMOIjm9uqkm3LLIZjgf2m7oFmBv94QBSiZJrz0Qycxas1ovhxrB9MOnf1AGT8bt6scRD5hUKf
	6RdVsicYdJOhv77kw2lZCXd/jThSHt3agkuJtB8aBjCAIe2dvkVJCen0N90r5hamiDSmh8gqgct
	/lSXczQqCEaGhWVZBascOSRZXJ6eaWmk1u+sGcJQ+UGyKAdaX6my9XfArqGoh6yznIEycjaOKE1
	xuCWjyFjBTYWeM4AgBYtvawodlbBytauYK2udLhDc7yHzAZmQotWWeQcY6Fs5eA4tkmBiGQI/aT
	HWOo9UPDhxHK7unvTrNuUwW/m9V9BlZNopuboPOOsv/Mr8nL5ohwSBsSX2BF/fUVj381a/KTqUe
	AjN3vyBW1Mym02W+M6AjvdOiVZUVSedGVygUHvtJVkatadYDWAhg==
X-Received: by 2002:a05:6a00:4c84:b0:824:9451:c1e2 with SMTP id d2e1a72fcca58-8274da275b4mr1328637b3a.59.1772170409864;
        Thu, 26 Feb 2026 21:33:29 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:29 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 14:33:17 +0900
Message-Id: <20260227053317.426000-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213330_970548_EEE10669 
X-CRM114-Status: GOOD (  21.58  )
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
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 43 +++++++++++++++++++-----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 576d79ebe9a8..b7eae2469b31 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,15 +186,17 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
 
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/* use fake edid data for test. */
 	if (!ctx->raw_edid)
 		ctx->raw_edid = (struct edid *)fake_edid_info;
@@ -202,14 +204,21 @@ static ssize_t vidi_store_connection(struct device *dev,
 	/* if raw_edid isn't same as fake data then it can't be tested. */
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
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
@@ -244,11 +253,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
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
 		struct edid *raw_edid;
@@ -271,20 +283,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = raw_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
 		 * only if raw edid data isn't same as fake data.
 		 */
+		mutex_lock(&ctx->lock);
 		if (ctx->raw_edid && ctx->raw_edid !=
 				(struct edid *)fake_edid_info) {
 			kfree(ctx->raw_edid);
 			ctx->raw_edid = NULL;
 		}
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -299,7 +318,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -321,22 +340,24 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
 	int edid_len;
-	int count;
+	int count = 0;
 
 	/*
 	 * the edid data comes from user side and it would be set
 	 * to ctx->raw_edid through specific ioctl.
 	 */
+
+	mutex_lock(&ctx->lock);
 	if (!ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
+		goto fail;
 	}
 
 	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
 	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
 	if (!edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
-		return 0;
+		goto fail;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
@@ -345,6 +366,8 @@ static int vidi_get_modes(struct drm_connector *connector)
 
 	kfree(edid);
 
+fail:
+	mutex_unlock(&ctx->lock);
 	return count;
 }
 
@@ -490,11 +513,15 @@ static int vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
 	}
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 
 	return 0;
--

