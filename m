Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB9C3600A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbl1bzwd72WBMUHQVUL0sGP9LINKYez4xzgILWcrQd0=; b=MjV9hgFjY2yu4AJEKxOnWaBjqY
	vk80JprfLW0FPmkEQb1DuPPhNZDKHv8YkDlgkclesAXjLXZCXJ7UytAgrDUwaglBeXVAH0ottve48
	FuPIrE7Mm2JCJW/KI38d9feZT6ekbgwaz2W5H7EBg87W5eRbOv88m509uFmqqAD9grPotewQXmzZ0
	X8KbYULocxeQpkt2ff6LbKROZYvgaE8e7m9qyC23uSmd92n7DBIRRLGUKGti2BPpJ99zLEx9uYpQT
	qn5im9xyAQjdk9PkaN45zTDupe1VZ3aNJJuQcU8bsLO33ENBLCYH8KAu4MnRSzCWb3wYKj0zqqEzF
	akGA44zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz0-0000000GAKM-1Ii6;
	Fri, 21 Mar 2025 20:28:46 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvie9-0000000G7Tb-1gjU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:07:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46EF310206773;
	Fri, 21 Mar 2025 21:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587631; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tbl1bzwd72WBMUHQVUL0sGP9LINKYez4xzgILWcrQd0=;
	b=Ujh3YbJpP0w6d7Vq3HH9Q30e9e0u1qTMHdtq9Vyg79Vb6a4W2PuiLeQJ7PDrgp0QIRoBYn
	hqoNE1AGZ3HPtUgaGbGXHzJM/LZfXFqVRQPSMH59yZurKeJQ1p6ClZGURG8can0C36aQJi
	I4VyO8rBrbPYSAUPosCoJ6rKTRmxtzGi15XRyfEUG0Kkwg11l8BFjTEFkzmD8xz3gy7TVN
	Mg8/V70meiqDVRvhoSsIaqmF75S4kjGVipBKH9b7w5wG0DxyqzhYVW0o5NX/a0eNa1iXIr
	pMfEogdxrjt6VOXYT6rEpn2rq/svVdni5lsfJbddgnL0lsXE9Yw6UfoPhbXqFA==
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
Subject: [PATCH v2 4/9] drm/panthor: Implement optional reset
Date: Fri, 21 Mar 2025 21:05:54 +0100
Message-ID: <20250321200625.132494-5-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130713_731193_813ACD60 
X-CRM114-Status: GOOD (  14.91  )
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
V2: Drop the select RESET_SIMPLE from Kconfig
---
 drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +++
 2 files changed, 26 insertions(+)

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


