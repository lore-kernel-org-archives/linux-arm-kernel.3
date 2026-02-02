Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2780AE7315A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiX6sc+bte0/E+dFVuNXwgpx22zYYyWdASCMsSYGK9c=; b=swjJTPMmM0r6WgJ7rZ1RUVun+p
	b/MgdK19JHEaPwN0FVpXbOPIlwjnOpn1SofgwRhmaxBKlcq6k9JS97doYs4XRlMYy2ucrLGMNe2WD
	pH+JXB4X1TYJFltrMpBlIXNRih+ep0x9yLsppkguV9jCfcxkARTYrwLKP634fuRkjMxB4WhcOkVcr
	LyNN8G+Ic4Y0jJYX4Sx3Sdf1/j/n8pV24AYT4JJPvrW82/ufHLJPeEZL9+G7zmBDYdJxiW9h0q1Lr
	JuogAdMY8vxRx8QfEGW6CF8uK9BptK1SNE1t6XFo8LOKQukzo7TfOYFYRqhruexp12CikS88TCsR3
	u+UJR/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAn-00000004uAg-100x;
	Mon, 02 Feb 2026 11:32:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAl-00000004u9X-25fR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:32:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8230d228372so2259523b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031970; x=1770636770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiX6sc+bte0/E+dFVuNXwgpx22zYYyWdASCMsSYGK9c=;
        b=kAGjw86kBnOCJTf60A7RfVU8ORWKjHF6Lk9L4Y0sqChZPpcqZhN79XReKtObnyQZhz
         10+44g4ImJbJeudXB7Hba7TE8PqlI3+XLLaFfljCfo97d2FetNHcLcl2kNfw/HPW6QAU
         LuD67rpbg2zLqzWShr9lgdLlwUjLW9FM+l6YBEnB3C40u1b1SkTTLKQrnvHTkDv64izi
         slLOSDlW8VV1s2s53+jreUo7k7W+ICmO9h5SJfKW0MYJ2RKvrpsmuVrrOXc5gimBnSxq
         qlK3soRA5TSadyBYPVI4ueMPCOj4FsnLwdmpZbz7EfN1NCWGpiCmJdc4k5ZajmgGl08n
         0CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031970; x=1770636770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiX6sc+bte0/E+dFVuNXwgpx22zYYyWdASCMsSYGK9c=;
        b=IbAGqUbgA6BONTy0E1a5AGCY5q2SeAj7m51z0m0RW5xg5z9yJc0tBOHnAKEwmm0UZH
         8PGBztoXh3Bo0hn07SPBYzJ/vKFU2LbaGUv5NOJ/4kCMGjUJtDY+Lj22o6KNcp21H2yL
         QJHitgHcijY89CbQ4rYXK8yNmGEL4yP2012F/25E+6ipRBipCqaYHgB48VM8eBdxDUcG
         TXJWHEXVzQ1GfDGkvEqq+3oydTHXEmoCbTWUEnM6zbHZGuRRQw+J5evd95t/oFLfyUs4
         t5AKfWWN0gzy75Wwut93S65M+MgyhKekSEAYK+7tGz6qm0SRUtO5rzbALCQ/ffhtmQzb
         TCPA==
X-Forwarded-Encrypted: i=1; AJvYcCWnkVad4nZvdFR85eg/13wCycc6/3SAeEHoTd+NQjP+GcNjmv5MMAbVky0ST3y51RWDzUaVoSZlSL8Zsx6bsuvu@lists.infradead.org
X-Gm-Message-State: AOJu0YyESzGNofmLe6GnxtwVGB6+GVNjiWTp5wc7gEmy9R6FnYJGqT1k
	8/AmEVQoye76pJQ18ZqOv0YR6rArZ0ebodXx8cGLPc1bggE6nQ1BzPRV
X-Gm-Gg: AZuq6aI80XX0b467bSu0ucHMociYsebaqy1bsx8oUoQ6CeRsx1F4Ikj1ga0eNa9LBSS
	rvV6dKCQpyLUZ0PnPM1gWo9KqGo4Rq2yeUajdMTyZ3yb0cTcq1lCj7qhQjd43eJfjShEIutojWV
	ON9lHhNtYXlfujVz6DHuGBO2fH0Aw5UOYZcAuP08cRcwiI1+ugdLSqWVEw6NYggTsuAMZ7jSttk
	nbLG773ryixvqmNzR9IydnR1snU/w5kVFFw2x/bQ87XsX/NrU6JuvbnPPd/22zKoog39jKiapaC
	0v6eAzTa7JvYd5nW84ndi0//4nOBBb8BfA4lWu+PrYdtboZiwpvDsu21moPjJ6pTgvDf7NbW8E+
	IwMdVTzCCJURLGoxDsdjSB7tTg+jEev7L43PDUi5f4fGiuAdZju/2kPSEKajqTxFsUbmZjtW4BN
	UFFDqaBcNmghwu+WaWXbg4ScUiQFbMMf4IiiPUBg==
X-Received: by 2002:a05:6a21:483:b0:366:19c9:b6b6 with SMTP id adf61e73a8af0-392e0000539mr10085643637.11.1770031970541;
        Mon, 02 Feb 2026 03:32:50 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:50 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 3/3 v2] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Mon,  2 Feb 2026 20:32:34 +0900
Message-Id: <20260202113234.183393-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033251_539908_9125B64D 
X-CRM114-Status: GOOD (  18.96  )
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

