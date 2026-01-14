Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2136D31A26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFgbGKta1WWetg8kikPQgA/0YVVbzxRzodQq2Gmv8S8=; b=ABUB9qt89UoH+DsjlP+PODGW9i
	+UjcffelmnB8P30HE11BMEO9abp30NA4Gqr+QZlB2jodta6FgcxmOScrgQ79f6B0VG+fvSu52U0rE
	FhlZerG3hVz6RErvnXDOwJf3vVLPCcfwiVphcEYI4ICxr84RAg4dUUpW1HSLHD5rpsg37K5D8OWm/
	8nx/91zWJEjlBAJvwxNLIAVdVGRCBgtiWJ3w4XURlJSK4P/B2xruJsuFhM6s/NQ6sHiqKcN+JloKm
	MFW68ltGVXbOWc4JYtDZ4WVagIHGve+4lkSPLAkGRAOSlEBLwOIdOq81Qmi1WdgNMnLVz006keh6P
	Hyr/jC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwXL-00000008Oku-3rV7;
	Wed, 14 Jan 2026 08:47:31 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwXH-00000008OjD-1Xjb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:47:30 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so13738724a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380445; x=1768985245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MFgbGKta1WWetg8kikPQgA/0YVVbzxRzodQq2Gmv8S8=;
        b=qazZI9LU8mO+9Gd0pGqewED5P1MpGrcaV+p6NDMw92AgqEvnsgQyqj/c1I1+UBpE/r
         uD5DjB49qldbdu2GerujmqxckRmWxZA5UwcQg4z6oe96EwTeyHA60i215JDvVUexeg9L
         vfvOnlB2MVb+J12OnRWwKnhGXh86QZINYe2HXbdVmn8u3p1t6jMPGm8aJH7dEyTeXTKZ
         0Pl1nU1S2+Ohhz055kC4oE57pOFoij9kwvqokkSjitQuCG0QguORvumj/w3TBBqEb8nd
         I/sZqy2p0ASlFt5pPJvuughIpCpLxGqyWSq8L3Nbinh20jrgeoU7gYS+NLhFQT76YqPJ
         zcoA==
X-Gm-Message-State: AOJu0YzMcmpAPL4y1FETJPBOj+j8nY6v4Ke9uoVxyVNcrMixurP0fW7z
	XpK5jk7mKFUInMX0dJZRADMYLWK1D7JN/qf83gKjm0jrYjYiduoWuvfi
X-Gm-Gg: AY/fxX5oYVVFz+SQiYLiaMDmPiaFTlFfsQ0/s3YiDqlUhaXM5lMg3x7MNWuHpaStNBs
	ugZIZpLPDUoQ+CvaFQ16J2a6U7xKcRJ0NAOpLk+bl5XHKEt6tyCphRctAWL5YJWrD56o05cHIKC
	IEmmfMDchMpd63JKODezjK6aFwGKLEzB87ZZbzY2X35zRM3M4bDbJ1HtIO8aI8OkAL+2eA6sKwK
	67eLPFtjP2Choasmj36kDXiTUYc8Am23CWN8qx8h6/0GAJ30qcVLfrPZqt/hanGOSfeCGfLzatL
	yVouGiBV3hR2e3OpLJSZX/f+BKS9cRTycvPYJHXNJtGJGpWQYP9iJxCn0emTOVEgfjKdGTtYqV6
	AdKazTWWI5OJ7sV8KpHHw1nnAegoDqZzNM0WjMKfRRboHhnSaC7ygrXupHj2yatWBgDA4Lww4yi
	WM76yfpUVvM9zSI35AhO2p3nVwL9rNIHXuGYqfsnSDfgRGxAYf0Xhb0zaH
X-Received: by 2002:a05:6402:790:b0:640:e75a:f95d with SMTP id 4fb4d7f45d1cf-653ec12583bmr1081734a12.15.1768380445470;
        Wed, 14 Jan 2026 00:47:25 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:25 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:52 +0100
Subject: [PATCH v2 5/5] accel/thames: Add IOCTL for memory synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-5-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_004727_435041_388E14E4 
X-CRM114-Status: GOOD (  17.12  )
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

The DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Add thames_accel.h UAPI header (Robert Nelson).

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 include/uapi/drm/thames_accel.h   | 31 +++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index 1ff01428e6c80765cb741ae45c67971b7b0f28c8..6993d503139d3aaef830cdf5cfcf38476c5f9d99 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -76,6 +76,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 	THAMES_IOCTL(SUBMIT, submit),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a01ddaeb2448117d400a79e53d2c6123ecb5390..4ded8fab0f3ff6f75a1446c5661fdbc68f1f2ac7 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -351,3 +351,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
 	return 0;
 }
+
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret = 0;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_thames_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(ddev->dev, shmem_obj->sgt, DMA_FROM_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct thames_gem_object *thames_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	thames_obj = to_thames_bo(gem_obj);
+	shmem_obj = &thames_obj->base;
+
+	dma_sync_sgtable_for_device(ddev->dev, shmem_obj->sgt, DMA_TO_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index 785843c40a89a9e84ab634aad77e9ec46111693e..e5a8278e98c578c2903cf23aea1bf887be0389e8 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -29,6 +29,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_context_create(struct thames_file_priv *priv);
 
 void thames_context_destroy(struct thames_file_priv *priv);
diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
index 5b35e50826ed95bfcc3709bef33416d2b6d11c70..07477087211c14721298ff52a1f3d253a6e65d58 100644
--- a/include/uapi/drm/thames_accel.h
+++ b/include/uapi/drm/thames_accel.h
@@ -31,6 +31,12 @@ enum drm_thames_ioctl_id {
 
 	/** @DRM_THAMES_SUBMIT: Submit a job and BOs to run. */
 	DRM_THAMES_SUBMIT,
+
+	/** @DRM_THAMES_BO_PREP: Prepare a BO for CPU access after DSP writes. */
+	DRM_THAMES_BO_PREP,
+
+	/** @DRM_THAMES_BO_FINI: Finish CPU access and prepare BO for DSP access. */
+	DRM_THAMES_BO_FINI,
 };
 
 /**
@@ -127,6 +133,27 @@ struct drm_thames_submit {
 	__u32 pad;
 };
 
+/**
+ * struct drm_thames_bo_prep - ioctl argument for preparing a BO for CPU access.
+ *
+ * This invalidates CPU caches and waits for pending DSP operations to complete.
+ */
+struct drm_thames_bo_prep {
+	__u32 handle;
+	__u32 reserved;
+	__s64 timeout_ns;	/* absolute */
+};
+
+/**
+ * struct drm_thames_bo_fini - ioctl argument for finishing CPU access to a BO.
+ *
+ * This flushes CPU caches to make CPU writes visible to the DSP.
+ */
+struct drm_thames_bo_fini {
+	__u32 handle;
+	__u32 reserved;
+};
+
 /**
  * DRM_IOCTL_THAMES() - Build a thames IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -149,6 +176,10 @@ enum {
 		DRM_IOCTL_THAMES(WR, BO_MMAP_OFFSET, bo_mmap_offset),
 	DRM_IOCTL_THAMES_SUBMIT =
 		DRM_IOCTL_THAMES(WR, SUBMIT, submit),
+	DRM_IOCTL_THAMES_BO_PREP =
+		DRM_IOCTL_THAMES(WR, BO_PREP, bo_prep),
+	DRM_IOCTL_THAMES_BO_FINI =
+		DRM_IOCTL_THAMES(WR, BO_FINI, bo_fini),
 };
 
 #if defined(__cplusplus)

-- 
2.52.0


