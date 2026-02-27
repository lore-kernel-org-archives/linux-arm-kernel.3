Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3562FD9E1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=; b=Qkn/TdzXgMxRW2EUkLEUIWTa6L
	db56UOqc2uW+d/N7rasQ6XPPe8Ptuqp6McEwyGgOFZufVjGtB8mF2PQ4wSOlavMxtgChBQ27+yCS0
	WfYLToJRVbZtNYGXrIIrn1OJAS0VYYEEw/fJNE2sEWCLcpZHtIquYm208LHplojYhGypeOaFe+k3v
	6JPLEzFn07aP2SOYtigQAM9xAb1UrYZ3dh6UF7eWMpIJvGaMUujvZgfos8WYWdBMg9hLVALN/EFS+
	VDAHi60STXeTutVbeJrPgMBCDUSIuzN4zHHZK5Pf5ULnCrw7+sJujue9+S14KaMOHYHmIX2F+lGmm
	33jtYXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxT-00000007fwm-3xQW;
	Fri, 27 Feb 2026 05:00:11 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxP-00000007fur-0iqP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:00:08 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824a3509a12so767006b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168406; x=1772773206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=b/OUBgnaduxzs9f9GCOKg1AdAI9BdYMbfIVktXHUVXk/fwZSvO8SzjYSqu/JE2KuHP
         m/GVA8mKILkFm6czPszvfzstnNH+Svg8dOtSq60fAj2FKFP+giQsU9h6SkwZ/6EPiBPw
         62QLqIR2nGFvSWM/0hUtsLMWkNSf7GENYiPNYkxaXQQfHBci8cQQMVY4B3TTsiKxOkVC
         JtJ78PNFQFoehEnWsMYnlAmg6mcfGPvfDfux09SnjGaI/UyppowewWzr5a8AOSxyPoSJ
         VwV1AoXBVQZnjOZXP/jUqwgWNA7k1B0Zzdd1YuHaGAJ0fU8JfuTlyEpcNc6CB6xDnbG7
         tEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168406; x=1772773206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=kvMyqN5tKxWdFt31+MymQABuvZxBVhTqcRk1AaeFVHGz1Dr2JPbiuvzVQGuZKc60CG
         eGKwvaDZl5tLuat9KcRWVM1juaHiQlCfE3JvqbpxHa9vz0JhQpzdqPLdZxWAmU39PHmG
         fqs3XsyhxT0cYEftJisxqDDvakTKVKyZsQx+csu6FHxxMUQeB0j62+E6jyp362bnFspu
         tXoF+O3MDO/NOmRwv0rYC+DTVG/AEdnewNDJBan71WTMpYrMlhLp9tPYzERqX5s4uHKK
         U4LGpg3qcE1unQAmirMWPWxkOUKdNU2gubrS9Z7D/NKB68zQG8jZNAnGlQ3KVfeyRNLa
         skOA==
X-Forwarded-Encrypted: i=1; AJvYcCWFRvKh2ofDe5o9JsLvqvZsP8idvcGrcsLLf7a4eFDD54RATvj4g4Y4JgUy8FBomiWXC/xXmMBGndGExUgyeQOc@lists.infradead.org
X-Gm-Message-State: AOJu0YzH7MRL4NwuvfXXdHXjIrdDfOvrEShWykUrAY5OUCxXdJawdfdD
	RRy6/AisauzWoE4XpfkaSUG7jsSuTDz7CnU/5CAWTUnNbVBfWsOeCNZ1
X-Gm-Gg: ATEYQzwEbEwnjprS9NrR/fqQ68Fk242GWBbDXkcrlnRqz3plbz66GBcqhmTDppBXtA3
	n+i4e98jCJcbuXBHpeaWtOshlwj4L9BreOyj1ozYePcZtlwa0wc3EWgIxI2TYzODfwll1IJHNCx
	9mEvmgF2H+eRD6Em28m1RCX6CfYiNVLCXXXLBc/eW4qlXNojXQyYopqRheGIxAgGJhg/8oY9GvH
	djK+B1B+bbxsNyRNeX2qU1DQg9D5K4eAVaOe1uLW7XApoApOggTEo9Py9CtEVn8pwyJBrMjF+7w
	ty1A7sspLcPDxug5eY6Hy91K1HKQWl1wlBNNHkBzZ8ctgZfl1PRe1K8NxMSbAk27+jnwOeN3FLu
	0iD5G7Bu0kWsvpGBdjb51NWsar7mxHVze8ONjwlg4T8ifHOBifyadODK2pYSbmkJpgrdBZUBNEV
	zkVzYOtJOe/T/NkXaNzA505IHVPZa4IKcE1gJRxiudfPC5It806w==
X-Received: by 2002:a05:6a00:7615:b0:827:2a46:685b with SMTP id d2e1a72fcca58-8274da07311mr962288b3a.46.1772168406150;
        Thu, 26 Feb 2026 21:00:06 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.21.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:05 -0800 (PST)
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
Subject: [PATCH 6.6.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 13:59:53 +0900
Message-Id: <20260227045953.165751-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227045953.165751-1-aha310510@gmail.com>
References: <20260227045953.165751-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_210007_215049_F1C98D86 
X-CRM114-Status: GOOD (  21.68  )
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

