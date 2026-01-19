Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6662FCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbmEw0xI5GEkCsxaHsMMe7LmACI8y/oSXqbnzXdllII=; b=toZg+t7e5pVxRz3R+oqSD/YYNO
	ngLOayPk1toW7pVraGRFmmufq6C1wsRLOvDzZzI3kCGWKaCWDLWHQLgQP0WHLVPVTqp2J28OeUA+F
	Hrp/dw8aRcv0u8Uhjw4FgdL4fGDbrSqH6h+1muFbVtidEP/fv1WD47Z/SwWz9qjuICYlz425QiacE
	6rONhqIwKbzZXKkkHHSem0eEnVwCVRpeLaFZYSwMPVF3LW4SYx9J5gVawTcrms1LHrJcgC+dfsLsc
	BPJsiYqp3mOAE2yRWwDm0YHQ/NtVOK1nPSMMlfpmseq+HsMEYB7Epq5s7nQ6NOYjQH2m/WiSgFP8P
	r79oPtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkae-00000001YkC-2LAZ;
	Mon, 19 Jan 2026 08:26:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaU-00000001YhM-19Th
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:26:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a58f2e514eso25499385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811173; x=1769415973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbmEw0xI5GEkCsxaHsMMe7LmACI8y/oSXqbnzXdllII=;
        b=BP65lJxt7FZD+fBV15DK89ibs2NT++LaGcZsKgUiPEIlu/ekKs/nl65lx6S4ZCOJcG
         geMJFCqDPOj3X10HxTnipS7+fhClyPUAQ47D4+jKl+hPOUnK3YPb6gLJ6nMa1aQSHXr2
         5Ep6JKgTLYHyeLoihDyNLm+lLtexVWYtTVo95aCRyLWFFQLgBufjPQbVxucS+ylqrIK4
         +kotZRYrOWIVhGWnLZAIfTKvT1UZ7VxDHtNMSG7hWVEkZLX6Wpr1cVv2kkTSNXGQM/3Z
         30aA50DokdD8zcCKdo3aS5VSsVuN7aU8mLn6RRYlkH2Btqo0hsBE3pEipdyfKy+zsQls
         ur/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811173; x=1769415973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PbmEw0xI5GEkCsxaHsMMe7LmACI8y/oSXqbnzXdllII=;
        b=OFm29ryVEJHE8KSuP7b7H7g3mnt7LFAf228re2cl34cgoC1zafzrpyoN4TOM5UznY+
         iezUNjgYneMVp5ybujX+KdOdkCR+o6ax5vsEGno18qettoaVGl1cgQW31S5ZmyUXtmpq
         uObWSwRdu0UveKgg/DCunhws9bGiJwWW8JhvyVQJEl4cAEvrtqnMxWEAa+WkQlh6kD3y
         QwcqVXPgGplm7AIp64x9iPjt7F6s5h2ZPkIHaC2gZSWObTgtdUC2V1T2QpAF+66ReODG
         SJmt1+q3Llc/2w4wueEG1844j20ItoFIAQXjUfmUFp9xWUL3mG6ekZ3KolBDXbjD79Eh
         TI2A==
X-Forwarded-Encrypted: i=1; AJvYcCVWIrOq1Z0JN1sJr3GVTzH0N4bjKnr7ya/kUYj/JGf2cnsalai9ZPNH+fbDQM0MTezuJQcH+Stdjgt68DpNkERJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwxbyCPyzXAq+EkrpCAoqZRPACE4+4VPgnIE0DGrdd98vPlnggL
	OW4jLlQLZte635qNo4I47+a4993F7RtxhoDQgHHVLQUU04Z6Y1WvmINVg0sCZw==
X-Gm-Gg: AZuq6aI/3HISGCIprSCPq3/cJCOnFmiVSpqwLPwfMu/fsQtbDw8RBTEp8ub+myvjxEO
	RFDEHHFn4mTB0r0ee7Ju1NmuvXzzLLISzXLz6rMXAa89JnfQKE3ZjjvMDf3W3Lg1YGszC+gZ3fk
	Vhl49ZpzUnoMm7qRAGz2AmfdnKNgcpquylYnxU/xjLp8gRHr08lZOWQnuytjlmw+Ga7VPkcZKuZ
	eQ07yyIV3tmRXub0qwUsotVuoubklp47KpvPboF8WlW5g0Eod4du/soBANx+OEIx0vN59GNI7pB
	0aO4QPmi+HaG0vC4rHUQqgGjThR3mNfc3PDuRyXv8Cya1owAG74tv02GwUYBlmYKCL4AWsxJjhS
	t7jG0ReCBeqcTFzOjGK+JfqCuWid9wQ5kYeCgKv9eyYrlqQx5OscxAphZWqZM+4568iqdUbmr6g
	iIshmSpnYQBRXzEtulrNcZ3VQXavEYkewTUqdL8w==
X-Received: by 2002:a17:903:138a:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a7188fd789mr97024985ad.33.1768811173364;
        Mon, 19 Jan 2026 00:26:13 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:26:12 -0800 (PST)
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
Subject: [PATCH 3/3 RESEND] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Mon, 19 Jan 2026 17:25:53 +0900
Message-Id: <20260119082553.195181-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002615_122602_19A2FFF9 
X-CRM114-Status: GOOD (  18.72  )
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

