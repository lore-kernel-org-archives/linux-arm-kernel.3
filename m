Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF2ACAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 00:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm80ilLfnfK0GbUTGqohDWQAf4X+K0zsGOxjXBgYar0=; b=kHeoqaLCE48A8VS/D6Krr15Fj0
	SMidQZ8/DbXM+QYc9OBXZwHzkRdIeFI2vkg9wKPw9yCs0CJ+Lcn/lcsDpkzcEFJbSSGSnz+GOzyHI
	ME9mauFvifKKTEC5q2mUR0ZxNaZ5A0S2tK7WtSGfukMtSUZx2bewNCrv/H10QJLdfldcRjwzSNQ7N
	5pZ3j0forgDeKHOhTqzd+rdHR2p3/+d8Di48dYSeHf0Omr5292wwz01Xq+YRnAoutl/OEWB7m7Job
	7GTCU8wNd9qEc/WPIA8lSgFsWqRkgYGr8e7LBll4XSEM1vJI+0PPA4dAafb7wNp3G4nscUzBmCTlQ
	zwEL7zjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1m-0000000CHpb-3yIG;
	Sat, 13 Sep 2025 00:22:06 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1i-0000000CHla-0sTD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 00:22:03 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-327f87275d4so2481790a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 17:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757722921; x=1758327721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm80ilLfnfK0GbUTGqohDWQAf4X+K0zsGOxjXBgYar0=;
        b=FirBzv1a0lW5toTh8Ql7GngcTw53wKbl7dKZYEW+3p2hQZRaq1FLI8BajhCcLEdpYI
         JfEXWkROLx4cExsPqeC6wW0telSOsVBZVabQcT7enrIikcCNRyd5x2LdiMweKgiNt2g2
         eAepfXTh0bM01+H0ddRKYe6Cm+IjL5AK1xkSZFny2qDAYvkha/Kh7sYYG79NqpMLjMPV
         i9iTt3PSTt8rkXXaqA3Qtody2TJfVK7DovBgdMag1RgC54LC64mkc07KM9lqGki0hLj6
         2/p9H6nWpt6ydRFsvDfFLf81v+w5JfHH5H9/RBRA5ypgex9MEb+jLbwenQTSCeur/J8S
         y8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757722921; x=1758327721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cm80ilLfnfK0GbUTGqohDWQAf4X+K0zsGOxjXBgYar0=;
        b=nfUfawyJJNSt1GcDXr869yyePDzCQiLc8tK2Hm5csGUpTPqw9IER7JQsP0IpWCfSle
         qrznJGPqqr54gR/ZEba28Y1nKvyN6NucSMHr0CdrNWzrxzcNZOhg7orLlDJwasRQXdDY
         AtLlIs6wBHJGrOaOzF3KtrfmgFT9GgM56jFaAL7m0nx3DR4PpVrjst3y+7gnsQGAB3xW
         VG8psGcJ3BJZbs/Vf7WtyEuxkNx4mGiY9wSvz+MacXjos5UIrVFO0+CQE7KS2N2TwhXZ
         GNRxUKVYhIZjlT88ph5KnM0T5X7GZsjU9VTQdaSHzEOfhbGMiegt7jYACcCyJ8bCCf7R
         7qmw==
X-Forwarded-Encrypted: i=1; AJvYcCXjCVGXWs1m2e7qCMx4fwsjxyTguUfJ88X1kd7uU6Iee4E9/Ih+4ZU3ydL38fK4A0GEMmwzD+Maw2QQxqtAeSt0@lists.infradead.org
X-Gm-Message-State: AOJu0YzfCQ8S18aKQz+KjFHgKEvNBOl5oxAD+2m1R6klEQmJpJ4lmcOu
	f1PT4j4mjwdVEu6ueYCsIYt2pKTcRcimAWpr/onuR0V3WNrdxxQX+Y5F
X-Gm-Gg: ASbGncuEaWGI+a3TWaBBBXVSk20AQIR8fO0NI3wa1dd1XBCzq46knFi5OyYNXDXq5ht
	51zDaYL0Ykp6TdCxQPj1iOwduItA34uNhmGoR4ozozQUZOWRbXdpR56qE9Gkvt2YoglDdZnzs5x
	k+uRoaakXk8RXMMOBS6k2Ve8qs/YyTQKbEj9KfMrS48UDRy06LIrI7yk+ywjYJaY6dPpeOFyuCr
	0nRxdx0DRGOqa3uhI68uIGyqSjWW/hUPsUg6ucutwM8qSy/QLyDRkUgWKq5ihjybHy/g6E00Vwb
	zOglRTwLvMgZ7yXztbdJed6JUo6koQ8o0Zo9OcVpO0kuFPQ7g/XR04urHH//OXlhMrE8G01kX4g
	OZKk/o+3iYVYt4EShaDRHGUaE/t6mFghKvsS3vVd7ZpuIrI9L+0S5QmISm5ZkNbzrIvuE1k4G9Z
	+qsK2drJITjA0rczZtcgyv
X-Google-Smtp-Source: AGHT+IEcaqlanLAm9mIqOADYJZgjkBS/hD0ZIdrP7idMoPzA/i4SQfFiZafptr/j8gwT/hhYw6DsOw==
X-Received: by 2002:a17:90b:1b50:b0:32d:d4c8:b658 with SMTP id 98e67ed59e1d1-32de4e5cb68mr5073830a91.7.1757722921338;
        Fri, 12 Sep 2025 17:22:01 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32dd620a64dsm7604593a91.8.2025.09.12.17.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:22:00 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] drm/panthor: add custom ASN_HASH support for mt8196
Date: Fri, 12 Sep 2025 17:21:55 -0700
Message-ID: <20250913002155.1163908-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250913002155.1163908-1-olvaffe@gmail.com>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_172202_251937_DFEC4D55 
X-CRM114-Status: GOOD (  22.39  )
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

Add panthor_soc_data to control custom ASN_HASH. Add compatible string
for "mediatek,mt8196-mali" and enable custom ASN_HASH for the soc.

Without custom ASN_HASH, FW fails to boot

  panthor 48000000.gpu: [drm] *ERROR* Unhandled Page fault in AS0 at VA 0x0000000000000000
  panthor 48000000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
  panthor 48000000.gpu: probe with driver panthor failed with error -110

With custom ASN_HASH, panthor probes fine and userspace boots to ui just
fine as well

  panthor 48000000.gpu: [drm] clock rate = 0
  panthor 48000000.gpu: EM: created perf domain
  panthor 48000000.gpu: [drm] Mali-G925-Immortalis id 0xd830 major 0x0 minor 0x1 status 0x5
  panthor 48000000.gpu: [drm] Features: L2:0x8130306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
  panthor 48000000.gpu: [drm] shader_present=0xee0077 l2_present=0x1 tiler_present=0x1
  panthor 48000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
  panthor 48000000.gpu: [drm] Firmware git sha: 27713280172c742d467a4b7d11180930094092ec
  panthor 48000000.gpu: [drm] CSF FW using interface v3.13.0, Features 0x10 Instrumentation features 0x71
  [drm] Initialized panthor 1.5.0 for 48000000.gpu on minor 1

Note that the clock and the regulator drivers are not upstreamed yet.
They might as well take a different form when upstreamed.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---
v2:
 - remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch]
 - update commit message
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h | 14 +++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |  6 ++++++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 25 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h   |  4 ++++
 5 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd87..c7033d82cef55 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -172,6 +172,8 @@ int panthor_device_init(struct panthor_device *ptdev)
 	struct page *p;
 	int ret;
 
+	ptdev->soc_data = of_device_get_match_data(ptdev->base.dev);
+
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed57..9f0649ecfc4fc 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -31,6 +31,17 @@ struct panthor_perfcnt;
 struct panthor_vm;
 struct panthor_vm_pool;
 
+/**
+ * struct panthor_soc_data - Panthor SoC Data
+ */
+struct panthor_soc_data {
+	/** @asn_hash_enable: True if GPU_L2_CONFIG_ASN_HASH_ENABLE must be set. */
+	bool asn_hash_enable;
+
+	/** @asn_hash: ASN_HASH values when asn_hash_enable is true. */
+	u32 asn_hash[3];
+};
+
 /**
  * enum panthor_device_pm_state - PM state
  */
@@ -93,6 +104,9 @@ struct panthor_device {
 	/** @base: Base drm_device. */
 	struct drm_device base;
 
+	/** @soc_data: Optional SoC data. */
+	const struct panthor_soc_data *soc_data;
+
 	/** @phys_addr: Physical address of the iomem region. */
 	phys_addr_t phys_addr;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index be962b1387f03..9dd90754865ac 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1682,7 +1682,13 @@ static struct attribute *panthor_attrs[] = {
 
 ATTRIBUTE_GROUPS(panthor);
 
+static const struct panthor_soc_data soc_data_mediatek_mt8196 = {
+	.asn_hash_enable = true,
+	.asn_hash = { 0xb, 0xe, 0x0, },
+};
+
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "mediatek,mt8196-mali", .data = &soc_data_mediatek_mt8196, },
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be09..9d98720ce03fd 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -52,6 +52,28 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
+static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
+{
+	const struct panthor_soc_data *data = ptdev->soc_data;
+	u32 l2_config;
+	u32 i;
+
+	if (!data || !data->asn_hash_enable)
+		return;
+
+	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
+		drm_err(&ptdev->base, "Custom ASN hash not supported by the device");
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(data->asn_hash); i++)
+		gpu_write(ptdev, GPU_ASN_HASH(i), data->asn_hash[i]);
+
+	l2_config = gpu_read(ptdev, GPU_L2_CONFIG);
+	l2_config |= GPU_L2_CONFIG_ASN_HASH_ENABLE;
+	gpu_write(ptdev, GPU_L2_CONFIG, l2_config);
+}
+
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -241,8 +263,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 			      hweight64(ptdev->gpu_info.shader_present));
 	}
 
-	/* Set the desired coherency mode before the power up of L2 */
+	/* Set the desired coherency mode and L2 config before the power up of L2 */
 	panthor_gpu_coherency_set(ptdev);
+	panthor_gpu_l2_config_set(ptdev);
 
 	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf83..8fa69f33e911e 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -64,6 +64,8 @@
 
 #define GPU_FAULT_STATUS				0x3C
 #define GPU_FAULT_ADDR					0x40
+#define GPU_L2_CONFIG					0x48
+#define   GPU_L2_CONFIG_ASN_HASH_ENABLE			BIT(24)
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
@@ -110,6 +112,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
-- 
2.51.0.384.g4c02a37b29-goog


