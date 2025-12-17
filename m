Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EAD65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGj1Iz8fP7j1sriJri6rEXbeQOcxivFvgqwECO6b/Kk=; b=uamogVEXduhl0EQVpZUpuJO9vy
	5UvjzxszVNard0tYH/ru6qvRAXODftpTmE/rXIBQOCMa34MTjbvMeNSRsvSLTiio45B0+IdkKFwQT
	haVFAiEhwihYDLLxtRIwcQrSqGDDm5aTIT2Afcc61v1A4WYjYLYWnp7hi269FiPvCL7tCcN/j+D4Z
	/LKi+jFLIJmahIvP8XTuEn/MPzGBU8rr5GaOviAGAI+Kw5r1D8a5RfDiLM042ac1wL2GWcv52RrqW
	fj9QAowO7v/ETdLY/cQBA24Px20l2mean6dV0onLq5gm7qQrJtN1kvTmHIWsPIweCL7K5M1jBSa/H
	QNEqofkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuww-0000000791f-415N;
	Wed, 17 Dec 2025 17:04:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuwt-000000078zJ-0fon;
	Wed, 17 Dec 2025 17:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765991056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jzgx6lqJR14JQih6FJdnyOcRHLbOCDxbzeEjWYAWViyh9xuYdhx+6eJ7m9CD1HnK7gIcPn6skUNUJnhgpayNQS3MXvvwIjRd1hSnqq+S34IKtxBhLuwh/4RcPNmtMcb9neImJGDaIsLB8LW+mJldjHTZVhmELWZHlYsSZDxF37Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765991056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oGj1Iz8fP7j1sriJri6rEXbeQOcxivFvgqwECO6b/Kk=; 
	b=GZk50L67nxhR6wmRUtdZgQxTTZgbwDj31hMO4JOzoI2zbJn/jRHpzz5J5stsekUTjgDoMxaPZIKzwGx0g2hbC7NANOEsQBRxgjif1QrIzTBTPbTxExp/JMKvtbluuxzYJK4RNRkluYtvTWHtk10MxAVNe3pAfgQ1HdPybbA4l5Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765991056;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oGj1Iz8fP7j1sriJri6rEXbeQOcxivFvgqwECO6b/Kk=;
	b=fwCPkhnWAV8gqlC/LquoK+DfvZ/wQtXxFvtqHlAbDwH0bf/CWTYXExm+HrUbp+Ss
	X53RpplfSNh8v2XOX9aJiHn83p2Afd859SDtaFHtT8VHpMTeSQkjwgcvB4FidLAWkwu
	Hdgw2e8kGGFbobsnKMq9YnQ5zARpGO6a/XBLWClk=
Received: by mx.zohomail.com with SMTPS id 1765991055390303.7583910605715;
	Wed, 17 Dec 2025 09:04:15 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Dec 2025 18:03:29 +0100
Subject: [PATCH 3/4] drm/panthor: Implement reading shader_present from
 nvmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
In-Reply-To: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_090428_915862_19345174 
X-CRM114-Status: GOOD (  16.97  )
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

On some platforms, notably MediaTek MT8196, the shader_present bitmask
in the Mali GPU register for it has cores enabled that may be faulty.
The true shader_present bitmask is found in an efuse instead.

Implement reading shader_present from an nvmem cell if one is present,
falling back to the Mali register if it's absent. The error codes are
trickled up through to the probe function so that probe deferral works.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 87ebb7ae42c4..eb44c8b108aa 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
+#include <linux/nvmem-consumer.h>
 #include <drm/drm_print.h>
 
 #include "panthor_device.h"
@@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	return "(Unknown Mali GPU)";
 }
 
-static void panthor_gpu_info_init(struct panthor_device *ptdev)
+static int overload_shader_present(struct panthor_device *ptdev)
+{
+	struct device *dev = ptdev->base.dev;
+	struct nvmem_cell *cell = nvmem_cell_get(dev, "shader-present");
+	ssize_t len;
+	void *buf;
+	int ret;
+
+	if (IS_ERR(cell)) {
+		/* On platforms without this cell, use the Mali register */
+		if (PTR_ERR(cell) == -ENOENT)
+			return 0;
+
+		return dev_err_probe(dev, PTR_ERR(cell),
+				     "Failed to get shader-present nvmem cell\n");
+	}
+
+	buf = nvmem_cell_read(cell, &len);
+	if (IS_ERR(buf)) {
+		ret = dev_err_probe(dev, PTR_ERR(buf),
+				    "Failed to read shader-present nvmem cell\n");
+		goto err_put_cell;
+	}
+
+	if (!len || len > 8) {
+		ret = dev_err_probe(dev, -EINVAL, "shader-present cell can't be length %ld\n",
+				    len);
+		goto err_free;
+	}
+
+	memcpy(&ptdev->gpu_info.shader_present, buf, len);
+
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+	return 0;
+
+err_free:
+	kfree(buf);
+err_put_cell:
+	nvmem_cell_put(cell);
+
+	return ret;
+}
+
+static int panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
 
@@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 	}
+
+	return overload_shader_present(ptdev);
 }
 
-static void panthor_hw_info_init(struct panthor_device *ptdev)
+static int panthor_hw_info_init(struct panthor_device *ptdev)
 {
 	u32 major, minor, status;
+	int ret;
 
-	panthor_gpu_info_init(ptdev);
+	ret = panthor_gpu_info_init(ptdev);
+	if (ret)
+		return ret;
 
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
@@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
 		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
 		 ptdev->gpu_info.tiler_present);
+
+	return 0;
 }
 
 static int panthor_hw_bind_device(struct panthor_device *ptdev)
@@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
-	panthor_hw_info_init(ptdev);
-
-	return 0;
+	return panthor_hw_info_init(ptdev);
 }

-- 
2.52.0


