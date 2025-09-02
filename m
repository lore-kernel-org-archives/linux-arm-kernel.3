Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB40CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmBFxHhYRsHxUFb6yKl311GgplCtiII3+UFgBt4dL+A=; b=lMQaYZ214OhYnEG4T1+LToZkRT
	G41vE9jdkMx5YxhcrwRRSvyY6+sDP2g9/b6/d+O7eTmTBthdgxvKaIjrE5794AGlt+DkHJgZIxrMM
	kczuxgjgiZPnDnkN51aoxWySVBa6bpPJRD3KQAW17mcYQfjwS7TAwpsjqUcF9WI9qn813Rj8aTm82
	oT1joBmZfTEpMhUnzS0S2FoY+S3hTPdwzGlCcYqLM2hgSjgEEcXSwyAUwFwJymgSLPbgz1s4DpePX
	WkRPW2XaH60hRfVSoiVhBRD//WHjHNpJRZdIswz/6A/H2GYzaay+530G1qTdUHusXzbxUsXQEIASx
	R5JbfXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQee-0000000HUqH-262R;
	Tue, 02 Sep 2025 13:02:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP5H-0000000Gtm0-3q0m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:21:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77250e45d36so1669315b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756812115; x=1757416915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmBFxHhYRsHxUFb6yKl311GgplCtiII3+UFgBt4dL+A=;
        b=Yo04eXiHEOVjKBlSTb2TkGvJHfaFxNB0abApZeq+IYgubQjVghRlS3SbxpWOc7PDHL
         l0WZ2Z30mfTqsQVgNdYZ9GJYy/XxSn1X6iYMu/KLchGtNckCyrqsCE73jHESBJrDuZvI
         cZ1KoGPVjmy1Pr7Y00GLweFj0di6UywhYOfTnKEFw/HljnSro8aOf85gbgxBMiM0npvx
         zo6SHhdxQdSQDSeyAqAAZg3/k9LbWvcZETBF2pr3k3Z5PxnhVBzhSTbo28sUJLr5BPk1
         296R2KjmAaHL5wyMBxS2q9BRB3pMg7mnhhDbeVyPaRbv5jrswURSG27rxFEqEFU/K9aP
         ovZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756812115; x=1757416915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmBFxHhYRsHxUFb6yKl311GgplCtiII3+UFgBt4dL+A=;
        b=EuTWj2C9CEcmSljN2+KYJLXnwNcJ3KToDpNkZuToyY4oXooyHFi5S0JeXiOrPZBYMr
         9ENXytJI0fQniEmfFZTkYaFWHBeNv5Nxptp7ljCq4QNBI4usELE8484M1m6GrWcOyTLG
         xDLJTWpOTzy+kRP5zd0Bst2S3HTqxKiXslRK4J+630PbpOp26EMdlePqKsX6ZYncdmC8
         tCb52lflfwjExZU7VccjnzM9/URoCChbOmtsBUwZYCZziDMHVIT4rZJcVVtn1DLLRdCQ
         NeNQDuduGtK6AxmYceSJohlGHyemMJUnsgWLT+pinFXStqq7cFsu5oolvlmvnwVxK+I4
         ZhTg==
X-Forwarded-Encrypted: i=1; AJvYcCWIdaZyXaxdGVevXKbrE4G98VuBN4aspJh00ahc3BOWcU9BnWXZfYF1a+K/dG5JsEOv1EOQ69X9hdaF/AgPLG+m@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEI5HRGVe6wipDXkX8y9CwsUUVS6xa4AuCsDeYSBEBcs+YbIl
	iDx1f79tWsjoqL1pU1yQzeQzoNY66vP9VcMCia2lT9sEnkuHrc/lvE4GzQF6xY+a
X-Gm-Gg: ASbGncsEXxMbE5S2fdnctuaU1je9HlzZsiqKSa//rAZaPjbGGE1xDRteFzKDXwX3a1V
	7CUc4thhY7vx0/3SsdyVEql6GC4x1PmXaagGO+EmYpBeUsP/P6Y0luPbw+VfPFaRacqavr/o21w
	ysOkNY2aCD55LxLqurxElle0vF8goz3B2hvtl3Gd5bY1NuRYPj453fahQpZvJU0y2ljzzdYfC30
	BkLlbA3veHeeAYszD5UH+WyYxUw4X2gK2XMDE1TmrxZdmPt95vMynPbIn91dgcWbw72OmL8yxX6
	f5TzcDRHVPQWNduBP9Kvghpt9fuVR2E64CP5yw9fEOsb810ie7Jsha/f6he6zJuKU47VPmNyl1C
	lJ8KeHpZeIA0PrT9Wa5T4r7QN0sJAaQJV8JVQ36ISEXH3RlttEvbTusT++kW5
X-Google-Smtp-Source: AGHT+IHagalNzYPov+qToIRn5726tUcNigXXQLmuwNeQCyxqjqgOyE8ZJPIjKB/R2FuzA1JH42ZaHA==
X-Received: by 2002:a05:6a20:42a3:b0:243:c38c:7b3d with SMTP id adf61e73a8af0-243d6e10746mr16673032637.24.1756812115058;
        Tue, 02 Sep 2025 04:21:55 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:21:54 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Tue,  2 Sep 2025 20:20:43 +0900
Message-Id: <20250902112043.3525123-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_042155_953688_A414457D 
X-CRM114-Status: GOOD (  18.42  )
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

Exynos Virtual Display driver performs memory allocation/free operations
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 601406b640c7..37733f2ac0e7 100644
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
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
@@ -482,9 +504,13 @@ static void vidi_remove(struct platform_device *pdev)
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

