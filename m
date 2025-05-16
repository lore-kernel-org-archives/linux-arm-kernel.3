Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8557CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3AKkmJ6KTn3pXL4mTIiS6i8Myi2NWAG2U8GI/Bqtpg=; b=K9pwKYSHD80h852mH+CeYnUEHX
	W6AQyOxnagZndw54qiq0C129chxJAHZe8QyzWgz9BAiVWE63zq2fszbc7a3NJ8GhxyVb5HwGAiQhV
	feWdzmPmfSrF47jRUBSs3eiK5tCYxsK+tnd/YjflsOeeYZd73VCp7ik0UXcfUhXigy135WKV+5Qr4
	XjagOeGyK7F5dBj8XPmngy61bSVP2PzO2XNuXLIq6qwDTEa54iXWKxko76HrvRHkFohf4boMCttbt
	Oh4HhoEtE/QO/BaY9ktyW/eXb4nSrQr8QlENNqP7WDDaleA8Y66eUkqanNc27yvolVcZ1rc5F8zTB
	f1/8x8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyR0-000000046NM-33RV;
	Fri, 16 May 2025 17:01:22 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyJW-000000044Yv-1cE2;
	Fri, 16 May 2025 16:53:40 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b933f214so1545462f8f.0;
        Fri, 16 May 2025 09:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414417; x=1748019217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3AKkmJ6KTn3pXL4mTIiS6i8Myi2NWAG2U8GI/Bqtpg=;
        b=UGIZad0cxVo0EaTLnx2BTWfImhdyuilhc5TvMFrxs4AEwtmI9hoBl21U1iP8e+iGyo
         McYWO4CnsQ6qt8ySSUBXhCnjsu8e+JaqwKUk/mbyZuQ4tCFsaN/UAaNO2RXvSnbOlWQx
         /JqcRqY3zBm4HBGsM2r8cJb5DEVxorMEHuQQ0Pof/bblXG42tHJ+5c0D0gXqLF40meVH
         69Qn1Tb+RkEavNaXcaGd/Yqdxx1FExde01dab2yzqlwY7OrFMvWK4g1qq0fn0e/u6+iI
         1wEp0jzRwtIs950zPEXNYezrNYZQdtwb4YRzIjCyOWMLDJBL79+yu1K0NGVEuyAFA/rv
         lMvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNdwm962b+qu0NTF9VqSBPl8EotqqJFASqsN42amxrBpRUswUciH1MBOJM+Qs7A5IooKZFOR5+Olb43nl9P5s=@lists.infradead.org, AJvYcCUZfNnFUFrjT8L5nt5lt3KHAbo3PyL73IRe0N4KkH2kONwY479H1a1VLuyWGGztHgL4TXRilxb6hVZpu9uyB+fa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4I50AL5tP7fmrY7h6sMLuBmL7EKJcV9IrNI4sCxWey4G5XjjA
	httHgV3ONDKGEHXWcgMZ+43A2ntddR1Yn/YmjLxizWiJdn/bfRg6aOvn
X-Gm-Gg: ASbGncvCTO7K50hOohMJHs/HU9+8+NknZT8Xtqvx2XThc/EO79qFVEn6eu60mPzUAGh
	ZHQFBKw+GzpMzBzAXySEqpMD5Ctv9Bbu+ohWGfu/kh8Z5YTffT0udbTykQBvWqda+3h+W4PUcFl
	RioowgCqTAAAoV1McSZnsFAXZ9mateQgrgc627Ka0VV1AGv9UbL0b9N/SfYdZrNVdnpFa5qZGIc
	9HHQwP0Fev+0kHH5Iokl9hFJXqTe33yd3DTF6VcrEV8xiIfeiJi//51tJspbSr4TKK6NpBRoil9
	PZ6kazMJELfXuPrLCv6/OFBZut8ceCnxnS3LEapxxz8PVzCtoM7qclyF1n0qLdpiXYAfM5go6Zt
	sCX/hsnL5XQ==
X-Google-Smtp-Source: AGHT+IHzoWLzwzO2W2fm1thZA94ysK8T2GSYVy0vng6VTKDV/nvGjQXC7ZxL5oELv7BUNtZhxcNclg==
X-Received: by 2002:a5d:59af:0:b0:3a1:fc5b:2d93 with SMTP id ffacd0b85a97d-3a35c83598dmr4382329f8f.22.1747414416702;
        Fri, 16 May 2025 09:53:36 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:36 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:19 +0200
Subject: [PATCH v3 05/10] accel/rocket: Add a new driver for Rockchip's NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-5-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_095338_621234_607532D0 
X-CRM114-Status: GOOD (  28.32  )
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

This initial version supports the NPU as shipped in the RK3588 SoC and
described in the first part of its TRM, in Chapter 36.

This NPU contains 3 independent cores that the driver can submit jobs
to.

This commit adds just hardware initialization and power management.

v2:
- Split cores and IOMMUs as independent devices (Sebastian Reichel)
- Add some documentation (Jeffrey Hugo)
- Be more explicit in the Kconfig documentation (Jeffrey Hugo)
- Remove resets, as these haven't been found useful so far (Zenghui Yu)
- Repack structs (Jeffrey Hugo)
- Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
- Use devm_drm_dev_alloc (Jeffrey Hugo)
- Use probe log helper (Jeffrey Hugo)
- Introduce UABI header in a later patch (Jeffrey Hugo)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)
- Move registers header to its own commit (Thomas Zimmermann)
- Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
- PM improvements (Nicolas Frattaroli)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/index.rst        |   1 +
 Documentation/accel/rocket/index.rst |  25 +++
 MAINTAINERS                          |  10 ++
 drivers/accel/Kconfig                |   1 +
 drivers/accel/Makefile               |   1 +
 drivers/accel/rocket/Kconfig         |  25 +++
 drivers/accel/rocket/Makefile        |   8 +
 drivers/accel/rocket/rocket_core.c   |  93 +++++++++++
 drivers/accel/rocket/rocket_core.h   |  45 +++++
 drivers/accel/rocket/rocket_device.c |  39 +++++
 drivers/accel/rocket/rocket_device.h |  27 +++
 drivers/accel/rocket/rocket_drv.c    | 315 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_drv.h    |  13 ++
 13 files changed, 603 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index bc85f26533d88891dde482f91e26c99991b22869..d8fa332d60a890dbb617454d2a26d9b6f9b196aa 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,6 +10,7 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   rocket/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..a3389f9a284c0975bc201f6e09082c01970e08a3
--- /dev/null
+++ b/Documentation/accel/rocket/index.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+ accel/rocket Rockchip NPU driver
+=====================================
+
+The accel/rocket driver supports the Neural Processing Units (NPUs) inside some
+Rockchip SoCs such as the RK3588. Rockchip calls it RKNN and sometimes RKNPU.
+
+This NPU is closely based on the NVDLA IP released by NVIDIA as open hardware in
+2018, along with open source kernel and userspace drivers.
+
+The frontend unit in Rockchip's NPU though is completely different from that in
+the open source IP, so this kernel driver is specific to Rockchip's version.
+
+The hardware is described in chapter 36 in the RK3588 TRM.
+
+This driver just powers the hardware on and off, allocates and maps buffers to
+the device and submits jobs to the frontend unit. Everything else is done in
+userspace, as a Gallium driver (also called rocket) that is part of the Mesa3D
+project.
+
+Hardware currently supported:
+
+* RK3588
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe1d31fca1a558473d92b90027088c..b4940d6476618d164cfe1bf1e98dbd9143f9defb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7273,6 +7273,16 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ivpu/
 F:	include/uapi/drm/ivpu_accel.h
 
+DRM ACCEL DRIVER FOR ROCKCHIP NPU
+M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/rocket/
+F:	Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
+F:	drivers/accel/rocket/
+F:	include/uapi/drm/rocket_accel.h
+
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39fd12d35a8d9021768aa186c09308..bb01cebc42bf16ebf02e938040f339ff94869e33 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c515430175c5e2ba9190f6dc9158..ffc3fa58866616d933184a7659573cd4d4780a8d 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..9a59c6c61bf4d6460d8008b16331f001c97de67d
--- /dev/null
+++ b/drivers/accel/rocket/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_ROCKET
+       tristate "Rocket (support for Rockchip NPUs)"
+       depends on DRM
+       depends on ARM64 || COMPILE_TEST
+       depends on MMU
+       select DRM_SCHED
+       select IOMMU_SUPPORT
+       select IOMMU_IO_PGTABLE_LPAE
+       select DRM_GEM_SHMEM_HELPER
+       help
+	  Choose this option if you have a Rockchip SoC that contains a
+	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
+	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
+	  networks.
+
+	  The interface exposed to userspace is described in
+	  include/uapi/drm/rocket_accel.h and is used by the Rocket userspace
+	  driver in Mesa3D.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rocket.
diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96
--- /dev/null
+++ b/drivers/accel/rocket/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
+
+rocket-y := \
+	rocket_core.o \
+	rocket_device.o \
+	rocket_drv.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
new file mode 100644
index 0000000000000000000000000000000000000000..a947c3120558e8af90bc0730a4d30ac796d5683d
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/clk.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_core.h"
+
+static int rocket_clk_init(struct rocket_core *core)
+{
+	struct device *dev = core->dev;
+	int err;
+
+	core->a_clk = devm_clk_get(dev, "aclk");
+	if (IS_ERR(core->a_clk)) {
+		err = PTR_ERR(core->a_clk);
+		dev_err(dev, "devm_clk_get failed %d for aclk in core %d\n", err, core->index);
+		return err;
+	}
+
+	core->h_clk = devm_clk_get(dev, "hclk");
+	if (IS_ERR(core->h_clk)) {
+		err = PTR_ERR(core->h_clk);
+		dev_err(dev, "devm_clk_get failed %d for hclk in core %d\n", err, core->index);
+		clk_disable_unprepare(core->a_clk);
+		return err;
+	}
+
+	return 0;
+}
+
+int rocket_core_init(struct rocket_core *core)
+{
+	struct device *dev = core->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	u32 version;
+	int err = 0;
+
+	err = rocket_clk_init(core);
+	if (err)
+		return err;
+
+	core->pc_iomem = devm_platform_ioremap_resource_byname(pdev, "pc");
+	if (IS_ERR(core->pc_iomem)) {
+		dev_err(dev, "couldn't find PC registers %ld\n", PTR_ERR(core->pc_iomem));
+		return PTR_ERR(core->pc_iomem);
+	}
+
+	core->cna_iomem = devm_platform_ioremap_resource_byname(pdev, "cna");
+	if (IS_ERR(core->cna_iomem)) {
+		dev_err(dev, "couldn't find CNA registers %ld\n", PTR_ERR(core->cna_iomem));
+		return PTR_ERR(core->cna_iomem);
+	}
+
+	core->core_iomem = devm_platform_ioremap_resource_byname(pdev, "core");
+	if (IS_ERR(core->core_iomem)) {
+		dev_err(dev, "couldn't find CORE registers %ld\n", PTR_ERR(core->core_iomem));
+		return PTR_ERR(core->core_iomem);
+	}
+
+	pm_runtime_use_autosuspend(dev);
+
+	/*
+	 * As this NPU will be most often used as part of a media pipeline that
+	 * ends presenting in a display, choose 50 ms (~3 frames at 60Hz) as an
+	 * autosuspend delay as that will keep the device powered up while the
+	 * pipeline is running.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 50);
+
+	pm_runtime_enable(dev);
+
+	err = pm_runtime_get_sync(dev);
+
+	version = rocket_pc_read(core, VERSION);
+	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
+
+	return 0;
+}
+
+void rocket_core_fini(struct rocket_core *core)
+{
+	pm_runtime_dont_use_autosuspend(core->dev);
+	pm_runtime_disable(core->dev);
+}
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
new file mode 100644
index 0000000000000000000000000000000000000000..3bde8ad8e6e45f9000ee377d7a5ea9ca01f9ac53
--- /dev/null
+++ b/drivers/accel/rocket/rocket_core.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_CORE_H__
+#define __ROCKET_CORE_H__
+
+#include <drm/gpu_scheduler.h>
+#include <linux/io.h>
+#include <linux/mutex_types.h>
+
+#include "rocket_registers.h"
+
+#define rocket_pc_readl(core, reg) \
+	readl((core)->pc_iomem + (REG_PC_##reg))
+#define rocket_pc_writel(core, reg, value) \
+	writel(value, (core)->pc_iomem + (REG_PC_##reg))
+
+#define rocket_cna_readl(core, reg) \
+	readl((core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+#define rocket_cna_writel(core, reg, value) \
+	writel(value, (core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
+
+#define rocket_core_readl(core, reg) \
+	readl((core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+#define rocket_core_writel(core, reg, value) \
+	writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
+
+struct rocket_core {
+	struct device *dev;
+	struct rocket_device *rdev;
+	struct device_link *link;
+	unsigned int index;
+
+	int irq;
+	void __iomem *pc_iomem;
+	void __iomem *cna_iomem;
+	void __iomem *core_iomem;
+	struct clk *a_clk;
+	struct clk *h_clk;
+};
+
+int rocket_core_init(struct rocket_core *core);
+void rocket_core_fini(struct rocket_core *core);
+
+#endif
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
new file mode 100644
index 0000000000000000000000000000000000000000..bb469ac87d36249157f4ba9d9f7106ad558309e4
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <linux/clk.h>
+#include <linux/dev_printk.h>
+
+#include "rocket_device.h"
+
+int rocket_device_init(struct rocket_device *rdev)
+{
+	struct device *dev = rdev->cores[0].dev;
+	int err;
+
+	rdev->clk_npu = devm_clk_get(dev, "npu");
+	if (IS_ERR(rdev->clk_npu)) {
+		err = PTR_ERR(rdev->clk_npu);
+		dev_err(dev, "devm_clk_get failed %d for clock npu\n", err);
+		return err;
+	}
+
+	rdev->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(rdev->pclk)) {
+		err = PTR_ERR(rdev->pclk);
+		dev_err(dev, "devm_clk_get failed %d for clock pclk\n", err);
+		return err;
+	}
+
+	/* Initialize core 0 (top) */
+	err = rocket_core_init(&rdev->cores[0]);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void rocket_device_fini(struct rocket_device *rdev)
+{
+	rocket_core_fini(&rdev->cores[0]);
+}
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
new file mode 100644
index 0000000000000000000000000000000000000000..ba2301e9302120ae338c07baa7d12dd99cb925a9
--- /dev/null
+++ b/drivers/accel/rocket/rocket_device.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DEVICE_H__
+#define __ROCKET_DEVICE_H__
+
+#include <drm/drm_device.h>
+
+#include "rocket_core.h"
+
+struct rocket_device {
+	struct drm_device ddev;
+
+	struct clk *clk_npu;
+	struct clk *pclk;
+
+	struct rocket_core *cores;
+	unsigned int num_cores;
+};
+
+int rocket_device_init(struct rocket_device *rdev);
+void rocket_device_fini(struct rocket_device *rdev);
+
+#define to_rocket_device(drm_dev) \
+	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))
+
+#endif
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..82f4cc374bfaa92678da791849537d51bb4c0ba8
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_of.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_drv.h"
+
+static int
+rocket_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct rocket_file_priv *rocket_priv;
+
+	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
+	if (!rocket_priv)
+		return -ENOMEM;
+
+	rocket_priv->rdev = rdev;
+	file->driver_priv = rocket_priv;
+
+	return 0;
+}
+
+static void
+rocket_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	kfree(rocket_priv);
+}
+
+static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
+#define ROCKET_IOCTL(n, func) \
+	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+};
+
+DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+
+/*
+ * Rocket driver version:
+ * - 1.0 - initial interface
+ */
+static const struct drm_driver rocket_drm_driver = {
+	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.open			= rocket_open,
+	.postclose		= rocket_postclose,
+	.ioctls			= rocket_drm_driver_ioctls,
+	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
+	.fops			= &rocket_accel_driver_fops,
+	.name			= "rocket",
+	.desc			= "rocket DRM",
+};
+
+static int rocket_drm_bind(struct device *dev)
+{
+	struct device_node *core_node;
+	struct rocket_device *rdev;
+	struct drm_device *ddev;
+	unsigned int num_cores = 1;
+	int err;
+
+	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	ddev = &rdev->ddev;
+	dev_set_drvdata(dev, rdev);
+
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
+		if (of_device_is_available(core_node))
+			num_cores++;
+
+	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
+					 GFP_KERNEL | __GFP_ZERO);
+	if (IS_ERR(rdev->cores))
+		return PTR_ERR(rdev->cores);
+
+	/* Add core 0, any other cores will be added later when they are bound */
+	rdev->cores[0].rdev = rdev;
+	rdev->cores[0].dev = dev;
+	rdev->cores[0].index = 0;
+	rdev->num_cores = 1;
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return err;
+
+	err = rocket_device_init(rdev);
+	if (err) {
+		dev_err_probe(dev, err, "Fatal error during NPU init\n");
+		goto err_device_fini;
+	}
+
+	err = component_bind_all(dev, rdev);
+	if (err)
+		goto err_device_fini;
+
+	err = drm_dev_register(ddev, 0);
+	if (err < 0)
+		goto err_unbind;
+
+	return 0;
+
+err_unbind:
+	component_unbind_all(dev, rdev);
+err_device_fini:
+	rocket_device_fini(rdev);
+	return err;
+}
+
+static void rocket_drm_unbind(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	struct drm_device *ddev = &rdev->ddev;
+
+	drm_dev_unregister(ddev);
+
+	component_unbind_all(dev, rdev);
+
+	rocket_device_fini(rdev);
+}
+
+const struct component_master_ops rocket_drm_ops = {
+	.bind = rocket_drm_bind,
+	.unbind = rocket_drm_unbind,
+};
+
+static int rocket_core_bind(struct device *dev, struct device *master, void *data)
+{
+	struct rocket_device *rdev = data;
+	unsigned int core = rdev->num_cores;
+	int err;
+
+	dev_set_drvdata(dev, rdev);
+
+	rdev->cores[core].rdev = rdev;
+	rdev->cores[core].dev = dev;
+	rdev->cores[core].index = core;
+	rdev->cores[core].link = device_link_add(dev, rdev->cores[0].dev,
+						 DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+
+	rdev->num_cores++;
+
+	err = rocket_core_init(&rdev->cores[core]);
+	if (err) {
+		rocket_device_fini(rdev);
+		return err;
+	}
+
+	return 0;
+}
+
+static void rocket_core_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct rocket_device *rdev = data;
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		if (rdev->cores[core].dev == dev) {
+			rocket_core_fini(&rdev->cores[core]);
+			device_link_del(rdev->cores[core].link);
+			break;
+		}
+	}
+}
+
+const struct component_ops rocket_core_ops = {
+	.bind = rocket_core_bind,
+	.unbind = rocket_core_unbind,
+};
+
+static int rocket_probe(struct platform_device *pdev)
+{
+	struct component_match *match = NULL;
+	struct device_node *core_node;
+
+	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
+		return component_add(&pdev->dev, &rocket_core_ops);
+
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core") {
+		if (!of_device_is_available(core_node))
+			continue;
+
+		drm_of_component_match_add(&pdev->dev, &match,
+					   component_compare_of, core_node);
+	}
+
+	return component_master_add_with_match(&pdev->dev, &rocket_drm_ops, match);
+}
+
+static void rocket_remove(struct platform_device *pdev)
+{
+	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core-top"))
+		component_master_del(&pdev->dev, &rocket_drm_ops);
+	else if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
+		component_del(&pdev->dev, &rocket_core_ops);
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "rockchip,rk3588-rknn-core-top" },
+	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static int find_core_for_dev(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+
+	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+		if (dev == rdev->cores[core].dev)
+			return core;
+	}
+
+	return -1;
+}
+
+static int rocket_device_runtime_resume(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+	int err = 0;
+
+	if (core < 0)
+		return -ENODEV;
+
+	if (core == 0) {
+		err = clk_prepare_enable(rdev->clk_npu);
+		if (err) {
+			dev_err(dev, "clk_prepare_enable failed %d for clock npu\n", err);
+			return err;
+		}
+
+		err = clk_prepare_enable(rdev->pclk);
+		if (err) {
+			dev_err(dev, "clk_prepare_enable failed %d for clock pclk\n", err);
+			goto error_clk_npu;
+		}
+	}
+
+	err = clk_prepare_enable(rdev->cores[core].a_clk);
+	if (err) {
+		dev_err(dev, "clk_prepare_enable failed %d for a_clk in core %d\n", err, core);
+		goto error_pclk;
+	}
+
+	err = clk_prepare_enable(rdev->cores[core].h_clk);
+	if (err) {
+		dev_err(dev, "clk_prepare_enable failed %d for h_clk in core %d\n", err, core);
+		goto error_a_clk;
+	}
+
+	return 0;
+
+error_a_clk:
+	clk_disable_unprepare(rdev->cores[core].a_clk);
+
+error_pclk:
+	if (core == 0)
+		clk_disable_unprepare(rdev->pclk);
+
+error_clk_npu:
+	if (core == 0)
+		clk_disable_unprepare(rdev->clk_npu);
+
+	return err;
+}
+
+static int rocket_device_runtime_suspend(struct device *dev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(dev);
+	int core = find_core_for_dev(dev);
+
+	if (core < 0)
+		return -ENODEV;
+
+	clk_disable_unprepare(rdev->cores[core].a_clk);
+	clk_disable_unprepare(rdev->cores[core].h_clk);
+
+	if (core == 0) {
+		clk_disable_unprepare(rdev->pclk);
+		clk_disable_unprepare(rdev->clk_npu);
+	}
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
+	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static struct platform_driver rocket_driver = {
+	.probe = rocket_probe,
+	.remove = rocket_remove,
+	.driver	 = {
+		.name = "rocket",
+		.pm = pm_ptr(&rocket_pm_ops),
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(rocket_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
+MODULE_AUTHOR("Tomeu Vizoso");
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..bd3a697ab7c8e378967ce638b04d7d86845b53c7
--- /dev/null
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_DRV_H__
+#define __ROCKET_DRV_H__
+
+#include "rocket_device.h"
+
+struct rocket_file_priv {
+	struct rocket_device *rdev;
+};
+
+#endif

-- 
2.49.0


