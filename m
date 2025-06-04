Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB0CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjGAp4K6EAFuzCeA2yYheVwlWI/pfTpiZgviUJcgmaI=; b=O+aPNIZ+749BobsyXHnuNUhr5y
	FuF3io5j1Tk3uvfq0VL6mjzbhxfmB7sQ1ZWEo3DWk3uOnGAC4sch1GYX+FaUjULQ/xnqRTRWM9rMf
	2RCmzxo4sR94b6YqPOeEPKwvlXAW0LXm58nJxlUIGBnUuCAg4MJ92PftDoeO18zTOnB8PStRN52Kb
	b3oyY58jHCR39w8wPtpZ3FmyUo7M1YKEooyyh5gAumTaA5AKIrRDb4B9Kxx2kvhEtS0P+HP12ylK5
	1ceH81bJrtyz4rNbTvIRNw3uqRimKIFJ4yu65dsU+hAAcEBp0IHMLApxdcLfzPAdqPW0/Eb8dcy8e
	4QyIF6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjGm-0000000Crjx-0cCf;
	Wed, 04 Jun 2025 08:14:44 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj0E-0000000CoaJ-2Zk3;
	Wed, 04 Jun 2025 07:57:39 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so2045388a12.1;
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023857; x=1749628657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjGAp4K6EAFuzCeA2yYheVwlWI/pfTpiZgviUJcgmaI=;
        b=M+9Ya/+GvY5PDC0MqGS9wmFfBS3r44jnM9wfFppHODFcRiw8fW4WzkHR/lgNPEo9eg
         r05ELKs3m2EfyZ7WEBoFF+06Gegb3RbR6bfMHelquXDQYzMPU0y0HlAprOHCjggI4hnJ
         zJ2c0gYd5sVA5ImqHrE3b/OuuyHx4GVsx3aR+MbJ2XFGuDwmjIFXw3JJow0JgiRqAjA5
         m0ItB4DRt1licyyTLqHSFJVxREoGPZmM71FiFG0E5ggDDHLT93ZiZQTf3MJO1pYbDNk6
         BC2YOOSYQxNJb7jmzWFwsou4gzgk41PXI5Atg2gowfRCZj0qfJQ7rN66OgoyQgddXv3z
         Jwag==
X-Forwarded-Encrypted: i=1; AJvYcCUMM0LRCELDXwgZzjdkUaXsfv/GtbrvEozYaNeIx6i2uYxzn1aUAOd/ApQPfrxYSKWes/Vc3JnJQZXY6zXqAaw=@lists.infradead.org, AJvYcCVZyTkydjb7I2wog5YYc7YKX09VucaKZaApMJK+hUU2l6YuN981gsos5xFfAyGDXFYbpGXQLkWiHKKN9lXvSZKj@lists.infradead.org
X-Gm-Message-State: AOJu0YwmUZ6dQwLrp0VMt052NZRyGOnXIx/AmSGSfMyJs56a3O+87dv3
	BlK4NP0V4WtbJ04QuxH7AagV9wEKHhUV/bTUOgAiKi93pY3xOEY81fWDmwfSYIZP
X-Gm-Gg: ASbGncvKRreUyJkb5DL0F5Nw9G9Hy2M+Q/mciZBuwVLhMyIPjR7eg7dY96ni4U9S7N3
	uhv4AnkG0cGGpHaP8isCH/tiqQq5X51EKjK+/JeQffHdIo03LNwhbbjIs6XyznZ5nAxzaGfyytY
	xvPWVTuLEIm+fzj3Hc0s3QcP8f9tYI9JAS1D2H9K7nb8ujBp25/Rgn36/6FzCU9FT5Lvl7CDdAp
	e7lqUKNevxx/+SYWl5acj8+KaEwX7wBg6uKZjlpBQUTfIf5SpbFvdP+GxW/y/31EKjZP4HfmphB
	R+Zu5n04S+ZrkrfvRqBsgGBTldo2R+0JXMrNWUoQd7SuZ3TuvHUGeDgUG1NLgGNvR0n1KqIQb42
	b9kXnNdbBqQ==
X-Google-Smtp-Source: AGHT+IE18LKhlLWixP/vDAIIlTQKQ2PwLrw4DCdir4yOt3MyS5X2KyT0nc1LL4Ay3oR9i8+0GcyvGw==
X-Received: by 2002:a05:6402:5202:b0:602:cef9:a63e with SMTP id 4fb4d7f45d1cf-606ea3a7ad5mr1897117a12.30.1749023857162;
        Wed, 04 Jun 2025 00:57:37 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:36 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:21 +0200
Subject: [PATCH v6 08/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-8-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005738_660238_6D5A77ED 
X-CRM114-Status: GOOD (  20.86  )
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
- Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)

v3:
- Check that padding fields in IOCTLs are zero (Jeff Hugo)

v6:
- Fix conversion logic to make sure we use DMA_BIDIRECTIONAL when needed
  (Lucas Stach)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/rocket/rocket_drv.c |  2 +
 drivers/accel/rocket/rocket_gem.c | 82 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index e6e257e01cd83a18abc2817135ffd97abe3104b3..adc142facdb357c461f29b16aef77e401d87c9f6 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -61,6 +61,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index fa07c494fd845f98ac759407677a649ed2c97727..4325e6c39d5df35601d4820cd0a5c829ade585d5 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -124,3 +124,85 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	op &= ROCKET_PREP_READ | ROCKET_PREP_WRITE;
+
+	if (op == ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op == ROCKET_PREP_WRITE)
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
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_rocket_fini_bo *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_fini_bo struct should be 0.\n");
+		return -EINVAL;
+	}
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
index 41497554366961cfe18cf6c7e93ab1e4e5dc1886..2caa268f7f496f782996c6ad2c4eb851a225a86f 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -11,12 +11,17 @@ struct rocket_gem_object {
 
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
index cb1b5934c201160e7650aabd1b3a2b1c77b1fd7b..b5c80dd767be56e9720b51e4a82617a425a881a1 100644
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
@@ -39,6 +43,39 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+#define ROCKET_PREP_READ        0x01
+#define ROCKET_PREP_WRITE       0x02
+
+/**
+ * struct drm_rocket_prep_bo - ioctl argument for starting CPU ownership of the BO.
+ *
+ * Takes care of waiting for any NPU jobs that might still use the NPU and performs cache
+ * synchronization.
+ */
+struct drm_rocket_prep_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Input: mask of ROCKET_PREP_x, direction of the access. */
+	__u32 op;
+
+	/** Input: Amount of time to wait for NPU jobs. */
+	__s64 timeout_ns;
+};
+
+/**
+ * struct drm_rocket_fini_bo - ioctl argument for finishing CPU ownership of the BO.
+ *
+ * Synchronize caches for NPU access.
+ */
+struct drm_rocket_fini_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Reserved, must be zero. */
+	__u32 reserved;
+};
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *

-- 
2.49.0


