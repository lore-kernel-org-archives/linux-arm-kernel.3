Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F347CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AptuEM6eGjHvUS3aWo1FiH8jUU8Yeeux1DBWCw1eemo=; b=uv0IZXIkEteBkJo1k9JMQHp56C
	pH9gVXLu5MtcheB8ERq5PDELcHhFpYUBlyMaUqVIbhcKVezGcPi10/Mnw3WxBqY2DYpSUTKDnht4d
	x9sNxKjpFH0LkTE8ya9ZusHAISy89NM1cE9g1Y/9izbmAgKy46uKd6gGvGsFSoiin8qMhU19E0FBr
	qKPAEAJMMbihl8YZPAT7GCkFmOxKs2TE92K0nvwkrnSEX99iZ5FqlA6q5Ieqxcl+ieY91RgSZwnCE
	qvSReCloscYQC2Busj8RW6dXtC50Pj4rQ1FJduvZdGRWxGGl0DSHoeKN0RfGNXY+0R5OS0vQ810uX
	IjWfd5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fb-0000000B31g-479x;
	Fri, 12 Sep 2025 18:38:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fa-0000000B2z3-2PFo;
	Fri, 12 Sep 2025 18:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AptuEM6eGjHvUS3aWo1FiH8jUU8Yeeux1DBWCw1eemo=; b=bs74W/gTPERbykK++XH7lmYfM1
	6VXIZEogByhRHOVK0BI7ERhQnsLNi3ZL2hLFzo/0xM9IkZOhwSXBtgl0Vpj3E7qu0WhaGa/K+Wlsm
	CLXfz05hross3neeCXzkdOnr/Hb0V52M3B1LIM1P+1iNQgY6+n5bxbWuPcEvqwmwUxhgtNbtkpliN
	HFLi5k76eVJ32WA2OjZzz4Z1KsBPV27xq7TlWTTL38h3Akwr37AAKXPfzwY0w/pu1Aw4jk1vlfVrC
	LwRbyYNSoDk4MRY/gp51xvlchPIg8dhyKRTGgGMPKR9CcjdZN7SZXKBlwYuSIpJhImqFWLvvUtKs5
	2uMEFHOQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fW-00000006PTm-0wza;
	Fri, 12 Sep 2025 18:38:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R3DvJYaoj1BUnHbfe6uM3o2Ogobavoh4l1FaRO4FIeGRKImX1aSPgN1ZXOUgALqTKziT9TiN0WylkUKECT1zHaqs24PjcyPBCl//vVvWIh/zfoxtzsrFiKp68ra3CsQQ1DYEhc7EjPitSdrSTbXtlBjooKAvqv9X5euZjNSkAB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702311; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AptuEM6eGjHvUS3aWo1FiH8jUU8Yeeux1DBWCw1eemo=; 
	b=PmQdd57aGiE34GNnRETM80hEfkg7rgTgEJ6ACZvPuSH3E6EMu9VUpkQq0BNtY0JLnny3DvNeOOuvuYyCWVsGeg6c+SZqCONJb21owAyaST6q/x7Q6IFj+Y0KGSmPvNbnCUnGnCY+hgWBubTYk4yTLvhHmiGmr3KVya74pN+wKrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702311;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AptuEM6eGjHvUS3aWo1FiH8jUU8Yeeux1DBWCw1eemo=;
	b=YH+cFnNWZugtBZCChnD9/4NvJrYtEZhzu8s36nm0iUOuFtj7XYJxypYwfM2IzE+n
	P08riJAcQGJ+JDzgj+1Hq2BsCyLHHccR/t2/Lv9lQBvNDH7Aj+1au1KrOld20dwCEi1
	Ebb5+vk7QuiYH5JJy3MFqEIU/CEENZ6Hth7Uu/NE=
Received: by mx.zohomail.com with SMTPS id 1757702309074253.43093313248596;
	Fri, 12 Sep 2025 11:38:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:08 +0200
Subject: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_193846_557791_DDF3B97E 
X-CRM114-Status: GOOD (  21.20  )
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

On some devices, devfreq is not controlled directly by DT OPPs and the
common clock framework, but through an external devfreq driver. To
permit this type of usage, add the concept of devfreq providers.

Devfreq providers for panthor register themselves with panthor as a
provider. panthor then gets whatever device is pointed at on its
performance-domains property, finds the registered devfreq provider init
function for it, and calls it.

Should the probe order work out such that panthor probes before the
devfreq provider is finished probing and registering itself, then we
just defer the probe after adding a device link.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 74 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_devfreq.h | 16 +++++++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 34b621b155f1324ba4f0a07c981da669d945a545..84157916350cf506d315603a47bfc99436a787f8 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -4,6 +4,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
@@ -12,6 +13,34 @@
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
 
+static LIST_HEAD(panthor_devfreq_providers);
+static DEFINE_MUTEX(panthor_devfreq_providers_lock);
+
+int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov)
+{
+	guard(mutex)(&panthor_devfreq_providers_lock);
+
+	list_add(&prov->node, &panthor_devfreq_providers);
+
+	return 0;
+}
+EXPORT_SYMBOL(panthor_devfreq_register_provider);
+
+static int panthor_devfreq_init_provider(struct panthor_device *ptdev,
+					 struct device *provider_dev)
+{
+	struct panthor_devfreq_provider *prov;
+
+	guard(mutex)(&panthor_devfreq_providers_lock);
+
+	list_for_each_entry(prov, &panthor_devfreq_providers, node) {
+		if (prov->dev == provider_dev)
+			return prov->init(ptdev, provider_dev);
+	}
+
+	return -EPROBE_DEFER;
+}
+
 static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 {
 	ktime_t now, last;
@@ -102,7 +131,7 @@ static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.get_cur_freq = panthor_devfreq_get_cur_freq,
 };
 
-int panthor_devfreq_init(struct panthor_device *ptdev)
+static int panthor_devfreq_init_of(struct panthor_device *ptdev)
 {
 	/* There's actually 2 regulators (mali and sram), but the OPP core only
 	 * supports one.
@@ -222,6 +251,49 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+static int panthor_devfreq_init_platform(struct panthor_device *ptdev)
+{
+	struct device_node *pcnode;
+	struct platform_device *pdev;
+	struct device_link *link;
+	int ret;
+
+	pcnode = of_parse_phandle(ptdev->base.dev->of_node,
+				  "performance-domains", 0);
+	if (!pcnode)
+		return -EINVAL;
+
+	pdev = of_find_device_by_node(pcnode);
+	of_node_put(pcnode);
+	if (!pdev)
+		return -ENODEV;
+
+	link = device_link_add(ptdev->base.dev, &pdev->dev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(ptdev->base.dev, "failed to add device link\n");
+		return -ENODEV;
+	}
+
+	ret = panthor_devfreq_init_provider(ptdev, &pdev->dev);
+	if (ret)
+		return dev_err_probe(ptdev->base.dev, ret,
+				     "failed to initialize devfreq provider\n");
+
+	DRM_DEV_INFO(ptdev->base.dev, "initialized devfreq provider %s\n",
+		     dev_name(&pdev->dev));
+
+	return 0;
+}
+
+int panthor_devfreq_init(struct panthor_device *ptdev)
+{
+	if (!of_property_present(ptdev->base.dev->of_node, "performance-domains"))
+		return panthor_devfreq_init_of(ptdev);
+
+	return panthor_devfreq_init_platform(ptdev);
+}
+
 void panthor_devfreq_resume(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929edb565a1f13443fb 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -8,6 +8,7 @@
 
 struct devfreq;
 struct thermal_cooling_device;
+struct platform_device;
 
 struct panthor_device;
 
@@ -43,6 +44,19 @@ struct panthor_devfreq {
 	spinlock_t lock;
 };
 
+struct panthor_devfreq_provider {
+	/** @dev: device pointer to the provider device */
+	struct device *dev;
+	/**
+	 * @init: the provider's init callback that allocates a
+	 * &struct panthor_devfreq, adds it to panthor, and adds a devfreq
+	 * device to panthor. Will be called during panthor's probe.
+	 */
+	int (*init)(struct panthor_device *ptdev, struct device *dev);
+
+	struct list_head node;
+};
+
 
 int panthor_devfreq_init(struct panthor_device *ptdev);
 
@@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
 
 unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
 
+int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */

-- 
2.51.0


