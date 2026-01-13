Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECEAD2F347
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eavvu1t15qKvDTI2jSsLTlj8ivnyPIJR0TkymEC1eF0=; b=FY7mvTZQ/jiVlLm0urpTJp0obT
	kA2CmGTINX15mdnldRp02n2CFvtD9WQzP0wvRvULAh0WY28x5O5+8Umo/z0kzF7g4DsMUHMkcuEZ+
	fUT0Qa2OMcCp3ggyVuAy3u6VqgqVKMsE/5YRGgaPtJtw+Svj0LW9ZGEMmUipsnd5wEKX6GdIrwht5
	0vmLFY4FxmgZREx4sqSCNjiYlbAOZXNw1aXHI361Bs3yqV5wRkRlhx/9d4C99bDyybBLQ4SUVXxlR
	i19s9DhoOcmd+QV1h/o0qRJd/4Qxk2Zc7Fzqz4qCnCIEegNVM6OI3c50jlFdlCcFHqX5iigAfi7Xj
	sQZsdVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiS1-00000007YIP-2JzZ;
	Tue, 13 Jan 2026 17:45:05 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRw-00000007YDS-30yK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:45:01 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b87113bd83bso453849766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326299; x=1768931099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eavvu1t15qKvDTI2jSsLTlj8ivnyPIJR0TkymEC1eF0=;
        b=p2IIWdrMhn4pLWcd/2tzxaE/GoftlPEAwU8vNG80hvAQFWFZhC8lbTKUA3pNsiTvJI
         tgZ+azO6DSLKWqSJRN98hpSbcHhlmphyyt13j2Iku/L5pcCj5zngdlrmWnmClFahXaiZ
         DvIUmvRZmlCM5ozp9IJHgFapON+vGDcsY8WlKF/FvP+2EZEFoPOXVqqpGBRih6G4QtJh
         l6NmmdYm9aLfkcv5oykmJDHEhxtNtK649oVqILx/tMnyYiEMRpUUWP4YxAjS5tZt6taZ
         k+/NbuW0cKjFK3jlokuwED9bwa2iQhgPL9s1cpoc98RfI6pP1gMBXTfh0N21A2TY33L0
         oBaA==
X-Gm-Message-State: AOJu0YzC+S+nsVefhXSqV+kzDpOruKxMeZCcEFIXfIvHeScDZcp194xZ
	NY45E06OVPVHaXgc8cEbiKn4qw/PKo5MzUA79wNUqqtOM/wA6U4e7+do
X-Gm-Gg: AY/fxX7ujL/KlvAwXt0KInKgfegX/PGbpb2VQPnnRo+7zoY8ni+UTDl0mqgujXNV9bv
	yedoiq3R8UjDkrdncvF2aajDOGUzVrF6zGaRMqa9FoS054lESGtMsRsgpR2CSzoF0HonRFGtc3C
	JGRHmdCeb1LnDcjy2qFBif6OKXXDhqf5SGXyqREeWxjyvLGe/ZpuWkx3AZMuGwHxREan45Al+nI
	C3h+i5QCja0cthKf3Y6lE/PXWqMq8wbswwCriyoVR7NnaZ/o273NAPZ98Z7yZ3cL+yJV3XW/M0Q
	U7HwIK95I/NFc3cPd3l+OvLZASIxrX0/Ey4RWu522eeJbSzJ2B3jmswgvAY3gyqO4gyQwhamWKz
	SD9GJQqmmPwkF3pv5gE2LGZ/KBjZWj+G65WQveQntiYcAzaNEbdt/VRyasll4pJVP733+OylOG9
	nvigHgwvLATMY63sduyXmHL/Cz8nfaNK6uQIIaTKy7VZbaDg==
X-Google-Smtp-Source: AGHT+IHjwdSSN4mTRKXDjSC9xCBKsqwskTn4GwaR+B+tRXZTp9WDKqbrL/GHsxrwpYwUo4qku7MY+g==
X-Received: by 2002:a17:907:7742:b0:b87:1eaf:377c with SMTP id a640c23a62f3a-b871eaf3facmr466107266b.38.1768326298728;
        Tue, 13 Jan 2026 09:44:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:57 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:39 +0100
Subject: [PATCH 5/5] accel/thames: Add IOCTL for memory synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-5-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094500_787729_DF90C061 
X-CRM114-Status: GOOD (  15.23  )
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index bf7355832241d5a671e196f465d891effaa4a8fb..9b72db433fbb8f9239a16a047a52520f0a01d125 100644
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
index a153e73a15253e0f955d74020b4765a1fa833fc4..2ad5a62bea275eb38a96b9d9bea804ed94ffb011 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -353,3 +353,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
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

-- 
2.52.0


