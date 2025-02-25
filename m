Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E30C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhkWeYCo8ghdLkTMjf+93H9t5mIr5lFb9LP3nVrsIlg=; b=jb6v2/bWRQwDoDGtJwVlz7hf51
	1zpJNEH3rLiVJyf/A1Wy5rqWyY6LHo+4iK52x3GHnEWTvgCryerd5GgyfUYMPRGt6VVErrrwPogMv
	wLYVZcIlL/Du0hfalBjgrZVBlxhyNbS3N6iWeGgfZlivYWZh+QQcaEk+rzHW8SBCfne3r4mMjrVH5
	V9bglC/6A240pvw9MPABwtr0IibCTh8HQVb9BAjy9ErVYzpDRPFRBQ23F6OsQ655vq/mBZmFe43AI
	V5cbg3JsOQv75T9bPOBqRqisim1BbIGY/S1omc4PvT9hkNmNS7hm11lARXUuXUMb6ECjIgHzkRFK5
	YAKPr/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpxr-0000000GJwb-0SKX;
	Tue, 25 Feb 2025 08:06:51 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpnc-0000000GHkR-34r9;
	Tue, 25 Feb 2025 07:56:18 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948021a45so45774745e9.1;
        Mon, 24 Feb 2025 23:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470175; x=1741074975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhkWeYCo8ghdLkTMjf+93H9t5mIr5lFb9LP3nVrsIlg=;
        b=Sv5m3IQFabmETyRbnsVskK5UKrRYmUHhNOEhJODI2pjyYGv/iNtQQF8pujjFeF9SnT
         OblqB+HBAMqZETqnrxqtbUDFRR/wBpKY87AdVLhpTYYkIssfFE0CIYfC7LuZGQunTFT5
         KUdRp2j43jTuRNXonmyyKrdLIvBik+ZKo2jRpBs6MVkgta+0qkfqM7w/8APRWh6mf5ba
         yDdtG8V1ISg1xuzTuacBrffpa1vuy6utTS2iiOSTDwL8cbzlnGN8pad4FWoRgmhsySYq
         d6/ondCZSX31WG9ji3+td9KkpcXfKr4j7CTfgs9VcHVkzuCuHNTV49MwborDcF5MD4rW
         PPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvsN5IKOLIbnJDIHgDqx2VzPSiD95M7UN/vP2fEEctlUI9XpWFX77ShiluD4wdSz3EhoTj4gSXg4+tD6mwC7A=@lists.infradead.org, AJvYcCViXHyDm6qFTO8NbVo4iuPkPLZCtcXwmFVIKvZ2b7AkMdyy2Qzgnq16VZvnXWbmbJW5Iqs45kBxokcaP8yTrskA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1SqwW6LlqVHGTJWPZaBx1s8+z1hhEHfwiTQ7urKGVZxkxw52a
	0CoRep84CbWLCNUhC82k+Jn2eoF2QTeCzZPAx4qsQia6EMXxUDHS
X-Gm-Gg: ASbGnctEZzdUxAajOHe1HcRdfHCzi4B6cnzH6Ssi+VQrAUT1lwDkatET3rvQpOIqJNv
	g9mEGHWJ4YEE9qo0X167Aqi4cEAQ/myeTei8Y8GooMKijFN/RyJecFYmR2alC/J6PgVaT1HLqgi
	x3kU0yJF36sd59LFjVljJ6YVeKlGp56UDTtmE6Bd9rqrNjlegyeGbXrh+g16HcAJZz+Go/lgKQf
	WId4oGdt9IOPpurhXH93Wv2a8MmfyTg8v0e3limp/HCRXFEh6l2n18r6jqBsXSq4BayPFuB0MzB
	QrVKrIG8lrPVCCs7mFX6LzDILDonAVKn51+XkxyLOYXOHFipb0pGm3yXKA==
X-Google-Smtp-Source: AGHT+IEBU/UREEsAZGJWloCHExe7c2hHky/VEEmIamwDzrYWwzyacyIuHiNhHtllqz0/KaZJonVUtw==
X-Received: by 2002:a05:600c:3ba8:b0:439:8a44:1e68 with SMTP id 5b1f17b1804b1-439ae21f822mr125937265e9.28.1740470175202;
        Mon, 24 Feb 2025 23:56:15 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:14 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:53 +0100
Subject: [PATCH v2 7/7] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-7-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_235616_828736_79C64C1D 
X-CRM114-Status: GOOD (  19.38  )
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

The NPU cores have their own access to the memory bus, and this isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Don't break UABI by reordering the IOCTL IDs (Jeffrey Hugo)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 ++
 drivers/accel/rocket/rocket_gem.c | 75 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 18 ++++++++++
 4 files changed, 100 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index a6b486e2d4f648d7b1d8831590b633bf661c7bc4..cc3531f66839b777e7abc1d41cb50cffd9685ea0 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -58,6 +58,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index d5337cf1e275c249a1491d0dd28e6b8ccd2ff2cb..6a0a7f6958c34bce4611cfdf033590029c3ac026 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -139,3 +139,78 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	if (op & ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op & ROCKET_PREP_WRITE)
+		return DMA_TO_DEVICE;
+	else
+		return DMA_BIDIRECTIONAL;
+}
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	bool write = !!(args->op & ROCKET_PREP_WRITE);
+	long ret = 0;
+
+	if (args->op & ~(ROCKET_PREP_READ | ROCKET_PREP_WRITE))
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, dma_resv_usage_rw(write),
+				    true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_cpu(rdev->cores[core].dev, shmem_obj->sgt,
+					 rocket_op_to_dma_dir(args->op));
+	}
+
+	to_rocket_bo(gem_obj)->last_cpu_prep_op = args->op;
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_fini_bo *args = data;
+	struct drm_gem_object *gem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_device *rdev = to_rocket_device(dev);
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	rkt_obj = to_rocket_bo(gem_obj);
+	shmem_obj = &rkt_obj->base;
+
+	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
+	}
+
+	rkt_obj->last_cpu_prep_op = 0;
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 19b0cf91ddd99bd126c1af30beb169d6101f6dee..1fd11441f5856c4b10ed77b63f34f157cd13e242 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -12,12 +12,17 @@ struct rocket_gem_object {
 	struct mutex mutex;
 	size_t size;
 	u32 offset;
+	u32 last_cpu_prep_op;
 };
 
 struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index eb886351134ebef62969b1e1182ccc174f88fe9d..ad6589884880126a248fa646aab7c4034600c11c 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -13,9 +13,13 @@ extern "C" {
 
 #define DRM_ROCKET_CREATE_BO			0x00
 #define DRM_ROCKET_SUBMIT			0x01
+#define DRM_ROCKET_PREP_BO			0x02
+#define DRM_ROCKET_FINI_BO			0x03
 
 #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
 #define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
+#define DRM_IOCTL_ROCKET_PREP_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_PREP_BO, struct drm_rocket_prep_bo)
+#define DRM_IOCTL_ROCKET_FINI_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_FINI_BO, struct drm_rocket_fini_bo)
 
 /**
  * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
@@ -38,6 +42,20 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+#define ROCKET_PREP_READ        0x01
+#define ROCKET_PREP_WRITE       0x02
+
+struct drm_rocket_prep_bo {
+	__u32 handle;		/* in */
+	__u32 op;		/* in, mask of ROCKET_PREP_x */
+	__s64 timeout_ns;	/* in */
+};
+
+struct drm_rocket_fini_bo {
+	__u32 handle;		/* in */
+	__u32 flags;		/* in, placeholder for now, no defined values */
+};
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *

-- 
2.48.1


