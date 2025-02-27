Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD57C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAy9BJopIfDRaRGU70xDkuGWNXBYiG90Up6CXvmcxjc=; b=DpsQUGQvdvOmA3joVZRnf3Q54S
	TENEgLA8NPHHO3LYEmlUNAUNnUjFYM2I9gFCibIUTbtwJZbB+3JE840lughW1BB1ZKe+R3f1bNAPv
	svNBZ7+wME7nz+F7NpitAcg+o6siv6E4us0L0kt4raNuwRKh5Vl2eYkxFiOqcZTpehZ/f337yJOFl
	IZto9q0vu4DekYhg971rINrmWmKlMarN4Om2W/qy22CGqf+fbubbZBXW123reF0lXp8pLffADEqmp
	f00z7kLDYAQ50VcfNDs+vXF7rsBdiy7p1V/TuLCFP9xVYl6CxSaNq4BXFzNVEWqhefEPtZ5+19udt
	YDWZCVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjn-00000008Yzp-1TrK;
	Thu, 27 Feb 2025 19:40:03 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFm-000000089mL-2bju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:00:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6439A10382F24;
	Thu, 27 Feb 2025 18:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAy9BJopIfDRaRGU70xDkuGWNXBYiG90Up6CXvmcxjc=;
	b=RyGTCHUJxyfRnUoIyaSrH53V2swypwkm65CKxKetYqOBRW3syANw3cWlunyEebUq5VoHiz
	42P9966TRmUgufEazL8bs9P5HRwPXh0eWqiwgMpQqAY0SDRjbdhaQYanatU9EggL1VzIks
	rn/2Pn3PBguFlZOj6b/nxEisVdEOZ6ifF/WyC2I6pUf2c8zGaOKh/8OpAnY2Z4tYEKQxGD
	PlB+2RlPxLAmjo7In1Sdqeqw+QSqJcjaIbzk4eCQb7HblxkISnCZw9jtgmrxwtEZ3Qknw2
	V9rWieZQwsjLAnnJPEWCXHZZcSLxYj4aXecCWk2WYYZducR6Gnt5EnWmGDfFQg==
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
Subject: [PATCH 5/9] drm/panthor: Implement support for multiple power domains
Date: Thu, 27 Feb 2025 17:58:05 +0100
Message-ID: <20250227170012.124768-6-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090054_948287_8F0D5E04 
X-CRM114-Status: GOOD (  19.28  )
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

The driver code power domain binding to driver instances only works
for single power domain, in case there are multiple power domains,
it is necessary to explicitly attach via dev_pm_domain_attach*().
As DT bindings list support for up to 5 power domains, add support
for attaching them all. This is useful on Freescale i.MX95 which
does have two power domains.

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
 drivers/gpu/drm/panthor/panthor_device.c | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  5 +++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 51ee9cae94504..4348b7e917b64 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -75,6 +75,58 @@ static int panthor_reset_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledrm.c */
+static void panthor_detach_genpd(void *res)
+{
+	struct panthor_device *ptdev = res;
+	int i;
+
+	if (ptdev->pwr_dom_count <= 1)
+		return;
+
+	for (i = ptdev->pwr_dom_count - 1; i >= 0; i--)
+		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
+}
+
+static int panthor_genpd_init(struct panthor_device *ptdev)
+{
+	struct device *dev = ptdev->base.dev;
+	int i, ret;
+
+	ptdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
+							  "#power-domain-cells");
+	/*
+	 * Single power-domain devices are handled by driver core nothing to do
+	 * here. The same for device nodes without "power-domains" property.
+	 */
+	if (ptdev->pwr_dom_count <= 1)
+		return 0;
+
+	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
+		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
+			 ptdev->pwr_dom_count);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ptdev->pwr_dom_count; i++) {
+		ptdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
+			continue;
+
+		ret = PTR_ERR(ptdev->pwr_dom_devs[i]);
+		if (ret != -EPROBE_DEFER) {
+			drm_warn(&ptdev->base, "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
+			continue;
+		}
+
+		/* Missing dependency, try again. */
+		panthor_detach_genpd(ptdev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, panthor_detach_genpd, ptdev);
+}
+
 void panthor_device_unplug(struct panthor_device *ptdev)
 {
 	/* This function can be called from two different path: the reset work
@@ -232,6 +284,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = panthor_genpd_init(ptdev);
+	if (ret)
+		return ret;
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index fea3a05778e2e..7fb65447253e9 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -114,6 +114,11 @@ struct panthor_device {
 	/** @resets: GPU reset. */
 	struct reset_control *resets;
 
+	/** @pwr_dom_count: Power domain count */
+	int pwr_dom_count;
+	/** @pwr_dom_dev: Power domain devices */
+	struct device *pwr_dom_devs[5];
+
 	/** @coherent: True if the CPU/GPU are memory coherent. */
 	bool coherent;
 
-- 
2.47.2


