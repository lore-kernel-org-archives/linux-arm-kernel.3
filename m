Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59187C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr2T/qLGB0lwW96DWD8/vn79iF6uSlhDoMgeSvZtY94=; b=DzPTyAlTScRAlU33cSMzxEcygF
	IflRV65oZPnIMx2kYx5nloeqJcl51ffnhZq+8rjLjCYM0x7VJnqAJVvEGeWjw62AJ15WkMzKcbXL5
	pTolsaqoKTSfkXxs7vK4A5afD3QAOu7TXRV1OpHXQtNGzUF8Oxryf/UJqwNgQhhwkHQH6AyDhPJUT
	HbL7v0t/TdsdqhaPkIQL+z9VOcfhAqm7nE1jiWTiROkw41dRppBRsEy0cp+b38NfvEOXeRu540yse
	oWDfAOKsOkrGWr1FGjoU1NXaniqtb0J3h7cZGM2XRQkHOBSYj8GqTM84BQ8sGW79a10C+f5GW+Fx8
	xSY4qqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjk-00000008Yub-43oA;
	Thu, 27 Feb 2025 19:40:01 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFk-000000089lP-3LWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:00:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3656710382F22;
	Thu, 27 Feb 2025 18:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr2T/qLGB0lwW96DWD8/vn79iF6uSlhDoMgeSvZtY94=;
	b=C9u7OYl/kCgGFNXv4fgqJPN5xUljK3pSWs9pfuRzXI7Z2Ok0IBxAIkJopoHgkFZgm6oqU3
	RCT16E2KiWU/pBZFZtinFrdrOjU4CwXCJ79ddZzqAMPLHKQbhE8Rp3StAkdrXd1XhudYkR
	8qmj+dtW3bJRAPRzmWkRKEKPfeBzPvH6kvZoJncJslrOSam6RzGrFcCpRo7DqQzUKgZ0ic
	18ZNB0MGmhVymPTifxaRH30Sh2K4PEQ1iWAgjRoTwMpo+lbc0iw1xK0q+A61eShDVoy4Hn
	GLmr37DUmqNoMpgGNpAqK/Crt1lqH8WDAX1KoeoFZqhJHp2F8ys6kyFrv9dOjw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 4/9] drm/panthor: Implement optional reset
Date: Thu, 27 Feb 2025 17:58:04 +0100
Message-ID: <20250227170012.124768-5-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090053_123410_6F92D170 
X-CRM114-Status: GOOD (  15.84  )
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Implement support for one optional reset.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/panthor/Kconfig          |  1 +
 drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b0..ab62bd6a0750f 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -14,6 +14,7 @@ config DRM_PANTHOR
 	select IOMMU_IO_PGTABLE_LPAE
 	select IOMMU_SUPPORT
 	select PM_DEVFREQ
+	select RESET_SIMPLE if SOC_IMX9
 	help
 	  DRM driver for ARM Mali CSF-based GPUs.
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb707..51ee9cae94504 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+static int panthor_reset_init(struct panthor_device *ptdev)
+{
+	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
+	if (IS_ERR(ptdev->resets))
+		return dev_err_probe(ptdev->base.dev,
+				     PTR_ERR(ptdev->resets),
+				     "get reset failed");
+
+	return 0;
+}
+
 void panthor_device_unplug(struct panthor_device *ptdev)
 {
 	/* This function can be called from two different path: the reset work
@@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = panthor_reset_init(ptdev);
+	if (ret)
+		return ret;
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
@@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
 	if (ret)
 		goto err_disable_stacks_clk;
 
+	ret = reset_control_deassert(ptdev->resets);
+	if (ret)
+		goto err_disable_coregroup_clk;
+
 	panthor_devfreq_resume(ptdev);
 
 	if (panthor_device_is_initialized(ptdev) &&
@@ -512,6 +531,9 @@ int panthor_device_resume(struct device *dev)
 
 err_suspend_devfreq:
 	panthor_devfreq_suspend(ptdev);
+	reset_control_assert(ptdev->resets);
+
+err_disable_coregroup_clk:
 	clk_disable_unprepare(ptdev->clks.coregroup);
 
 err_disable_stacks_clk:
@@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
 
 	panthor_devfreq_suspend(ptdev);
 
+	reset_control_assert(ptdev->resets);
 	clk_disable_unprepare(ptdev->clks.coregroup);
 	clk_disable_unprepare(ptdev->clks.stacks);
 	clk_disable_unprepare(ptdev->clks.core);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664b..fea3a05778e2e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -111,6 +111,9 @@ struct panthor_device {
 		struct clk *coregroup;
 	} clks;
 
+	/** @resets: GPU reset. */
+	struct reset_control *resets;
+
 	/** @coherent: True if the CPU/GPU are memory coherent. */
 	bool coherent;
 
-- 
2.47.2


