Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0311C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H72rn8ogX3KhM94X5uibatMEZGkDkzHDrTXRw3fgC8g=; b=DYqOnygqSBS7nosxkj+qvkPucw
	jY+jvakcqkVvm67slZadtaLh0vLumdUeX6Hyt8s+puEjjKXPS5oj+pSKW7KO2103e/Ugl72oM/WvH
	Oj/OCwgqrnngiLy7UKyUS0gvHN1PXJa1ZtyuFd6/zM4X6sgSNRqstARUwacEQBfnM33fxot4T2L7k
	+SjVelEF/VRPcJbFxyJhCrnapq2Ugb/6QHObyuawi4dyony/LphSp1pJipSand1icp+/GYpRr7aJY
	q9rBtRFvz7Tkl4wMbfv0N5U1rtMmJrTS5nZHN/BWQmmWPW1bLGqdu9O+BYI5YY6mzyLhuy3VCCnxm
	R7FlFWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasbA-0000000HZi2-0Dnb;
	Sun, 13 Jul 2025 09:02:16 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasEp-0000000HXBc-3sb5;
	Sun, 13 Jul 2025 08:39:13 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so592353366b.0;
        Sun, 13 Jul 2025 01:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395950; x=1753000750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H72rn8ogX3KhM94X5uibatMEZGkDkzHDrTXRw3fgC8g=;
        b=sAZGJ4dWvwNE9X/np9zv/2VhThT/LIExT8SmHOAvonKL5awiCkXFrb0GAkT0ZT3Lli
         ZqoY8Yv9KCyYLens2pjP84Rhwf46mf+8IXSNUk8sMNnb3Za30eYbQdWCJ+uzrixEZTYw
         TegE5673+Yi99uLVMg0XxN60N9Hv9l/lfXjqrsLpkI7DymhnlT/++nf3YjbTLniI7fgP
         vbemJL6xGwDoxbiBLDGmhV6rjVJYjJR8M+yboEOI14aVRj8L+xU1BmCSAYNdob+UP0ci
         NL5zKEwVleakUrChhqGdbSkmgHFB2qqKd53NhI8c+uz3Xi7NWGJHP96dERJfm4y5Wxwe
         Emmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2sWswTQKXIHjPVMOh0Vyi0XeFTgZdKAJtw+lIhbnbmfmf/gfFQdP3dQOMOWOB5wD/6JdlnhbmyOgz9RaS856+@lists.infradead.org, AJvYcCVDRXU1SF1YucRnDr1Dw/ElzOR3y9w3Uh1K//tl/2ybP28Ab4ncExFJMnfhDGVgwVm6uTZVyWvXqCF+oOWC5fw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6bbaiRp/lQ6ReYCFup5wkorMxGCAXzK5kr5++WJVfQdkn9ZYf
	wIAne+67Ln6jj6KdJCyZpSIA44A4JumJwxqC14ter02US+aHUrQ5cha4Xxa4i5dc
X-Gm-Gg: ASbGncurXD7YLrsP8vRA3Wz0pSQq+mv9vgQdAHnSitWBHOLvuihCMouqgVZ+kgth1Jb
	sKDFxDAN61S2W7Efy7FF96liXUQyQpt7UQCHinAxgR09RDDLQOZkpph6MC/Q2mKjVckiOP50KlG
	9X7P56dPEteq81kGMIGOJNqLsrNtzJkqLXf5xfg0VvEj+xHmkxbAgC1mG+b+/ynCONHT96cdDF1
	F9HFkZOvNZvq6teglZ7ZMm4enqiYSNNuqSRWjYBOFo6ONAz0S+C/jMsSzi+RINLvbmzpozSG74k
	Kzy1CC4P5mC4n95OacfpJyw2PxC5tO9q3oWih9TWjhV6n6kmA0HU/KIthXWw33wBK8d5OfsHXBh
	s5ISDyVjF3R1rqYUQIL1qray6vI04t8Ipn9WW0LS+QItXT47i4QoI6EtS
X-Google-Smtp-Source: AGHT+IEnUEEowUGfSdqp7ZjyLw6vDg0ImHNsDuzMVOpeAmqIoh/s37dukeUPYiyw3AirsdVVG4tMDw==
X-Received: by 2002:a17:907:962a:b0:ad8:50c3:3359 with SMTP id a640c23a62f3a-ae6fc6a360emr904292866b.9.1752395950161;
        Sun, 13 Jul 2025 01:39:10 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:09 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:55 +0200
Subject: [PATCH v8 05/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-5-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_013911_970523_336AE7AF 
X-CRM114-Status: GOOD (  18.47  )
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

v8:
- Always sync BOs in both directions (Robin Murphy)

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 ++
 drivers/accel/rocket/rocket_gem.c | 56 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  4 +++
 include/uapi/drm/rocket_accel.h   | 34 ++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index a21aa9aa189ba585c70fbf57d2a41fb578357efd..5c0b63f0a8f00dc71060e7177d0ed1ca15755ec4 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -134,6 +134,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 05cf46040865c01fe14a169c865227780f2db679..0551e11cc184143a582d1718a621e22086217ad9 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -123,3 +123,59 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	long ret = 0;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
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
+	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 91a1fc09c56ce483ebe80959e1a7ff934867bedc..24043033450941cb866a21378875810c6e8b9323 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -21,6 +21,10 @@ struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t s
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 374f8370ac9df6944fdb6ef06e56f15226e072ba..14b2e12b7c49288a84e645570cdeb815cd632d96 100644
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
@@ -39,6 +43,36 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
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
+	/** Reserved, must be zero. */
+	__u32 reserved;
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
2.50.0


