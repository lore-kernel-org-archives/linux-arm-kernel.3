Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=; b=rlO006FKlRzar7iSsOJUYZXO93
	t6siIWkrRGXXDCZvlcJu+7GAol+aV/spQMKkRKBMZ15dPxvSJmt6rkHfGwkIicYBWhm661gnJW733
	ahkK4eAO6DGozRQlFG+yAJrtni3GRTsPjMpL+GUKfiF6nUaDXpjFkgOleh2zQ/HHhj4T4Dj9Xi5fu
	YwFT4z2XDV/QorCjMBq5WwE6JiwnDWMyUYha0c79fFJKm4WJan3sXHwSkUpg3+mM5m9YuXtRbD4Uh
	Cz6uRv9nyQdD7owAKR5dpRUIIa2jPHFZ938hDGJ7Nt7Bcy8c7q61VVLVqv0ann94OosL6E7WB7Tlj
	XBEhXVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUMZ-00000009o83-2y4p;
	Tue, 18 Feb 2025 20:38:39 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIj-00000009a1A-0Urv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:38 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so5445435a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907035; x=1740511835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
        b=dGaND6zi8N7U2dKKFPefnzNoxH4gmpwM7r4/77HRloHkLiJaoehTYaYwmPbKl1d1uc
         HFYlpAPBu/BxGWtUbUbQ7ApBC0oduZeI8MmG0JEfv98tn9cVEUX7MG++x79T+aORgtCK
         DV2Ls6Tb1GK8gz4i3K71yo4mm6peXJARSyK9O/U7PfX522RxNrnSmUdyKLsGPT6JvPAX
         DOLa54ACcEu8cgS8XOnop0OV6d7YBNAAcU/K41Q+AyWX5Vj6Cm0HW1lOglV5AGo57lpa
         cRQm+Q2HwXUErV+iZUS38qGWHs5f6wx8rQKbDBHVmMqeBMbIT2z1XZpTxpEQVttY+vUw
         SLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907035; x=1740511835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
        b=PPV6TdgalQccTC2LcZEygOaKdAqC4gHu4QlldviPf1qKNYI/L4qX5T9/47pYza8SrK
         E4Kv6O7+vLGwG4D7Pnu+4y3sxc/nGlrPnu69mim5cbUsQx84KRTgB3EZxRzjzYKuU13y
         bP36MemGkgXZeNslgVVVo425f/RSU8QFFYQ7qudfhY7VuEdmPhw0Hc2zGxrgRYz817Nn
         l4IUqNISAzm2VJfMLN+g/MNBHNWlr3eWfKsiSvjZ9Nghhp3Mrx5K3aD33h2KtB1ThIXd
         FavysANZwEqZVksB9ZYMxagoBD7ZYLNz6qCgkNEqpg9rjmh+kf7dLcS27Rb25RGsXiRt
         WsXg==
X-Forwarded-Encrypted: i=1; AJvYcCXzo5LjTUzurLnfpb4ZPsYUpOigxjwlSlU6C6qepHcjzr703iVCfjW39X/yFwatH5vSC+YWTsd/MlTfZy3DmrdR@lists.infradead.org
X-Gm-Message-State: AOJu0YwpTG+cIKEkIFuXyDSpGycHoX4GCUuLHXHNRG2cy7fF9v2kyQsP
	iziDcsIzAEwTdyb0d8sW5P1S89eXjYH+rlEzaqRGXXDMKKbVGQZe88QB2faPiQc=
X-Gm-Gg: ASbGncsgYt0+tXhVSAOTNuHYxzq8cCyXmPLPAW7leUAKZaMcM/HHxSqUWJJc+KO6u+A
	gdDXgDIF9MrPq8i+83rDHGU80S+JetH2v/rWPQqmNx1qzDXBYQ04UQxEe20EOH8x1gxXwg8sBX8
	IyT+m/hdpl0IUBG/tmdq/Odu9PewY6SK7DTiXI+5EO6yJIG6mILEAScqtKvIgeMEc6HxVHhXsrE
	vmoTJNN6NFr2J7tHBc1KmCD1Mo9CIvBm3L4rlNS0EyAN4TQh87Jn1g05bE+3V9Dc1NvhV6lPGkR
	MpHWJ7f+6GNXwYpvOOiFgBkPysSh
X-Google-Smtp-Source: AGHT+IE5Wa5KJ5irXNEqRMx0DZmNPYCFnRuPmEtxdUqVwUY8iuRTnfmnPlFGCgRgwZYmZjYuGxKlHA==
X-Received: by 2002:a05:6402:3589:b0:5e0:82a0:50d9 with SMTP id 4fb4d7f45d1cf-5e082a0580dmr1610706a12.25.1739907035420;
        Tue, 18 Feb 2025 11:30:35 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:46 +0100
Subject: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PkjdIaC56eTrgW6J5aLTcTBWZbxgsIMKj1P2361ZPvk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/PpRSgjntFL4im0pKu+WkiaMHGJvFgAMlXT
 2MCP0memWuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7TfzwAKCRDm/A8cN/La
 hUPFEACcW0XW9/B/qo7EEmYWuIE8aUcE5HUVtsI0TkkMJMo5YnwHLpUNDoSEEbkKbv14vquBqbK
 Iy+dvIFKZ8BWMQZBDDHhi6jRtAFTgeQEsZMQIg2J0/+IlKhpJPF6AscLdg5p1Dgg1HXCauRxeou
 1VbEV6GrwhuTydry6GLWfyOUlmQju6OvpILm+L4mwrJpX9ykPJ6gwNIuVAlkqcJFHXmKBqJFgj6
 KmJeCGEATTKhIA/om6qi2z2GpvWfCdIjowrVc2yMdeagAGBqUnPLvJxYn6/bwDJ6h742YWZ9goy
 yRyWpO1O2zJ/6uRzZgkE1tCxJhV1BCaER8ZC7ZWzRmZhcfP6T5zY6x8Z33wkUs/HFqTl3HgAfuE
 nZdvMSmzDoGdQe4cDAzwVpup4fg2nKxCgjDq7p19/7CQWZU/HryiyHo6ek/pOAUc0xw9szxXdPV
 pJ7sSRrMpc9RV5K8nGfJW40rcwG+cKC2qkas/TwbNgzYhnn0M7XyVAVMUyQ28Gyhe3nAdEIpfHB
 rdQPj4DLQq3e/67HhncZL8agAL/LVgSmQ2/7PdJB44hJsNi1V7VGMLF9MD8RrZu1m5x/nSyXkq2
 LbPW+TWunsUuPoXm0HIZln4YNEsHFz6LlLOFjeAbeKtyzFEDL2/pqWRat04XTNU1u7RsW1bHRrR
 EFlV+exOQmrhA/Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113037_158259_D0131ECB 
X-CRM114-Status: GOOD (  18.48  )
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

Add helper functions to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h |  17 +++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+/**
+ * auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return NULL;
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return NULL;
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * It may look odd but auxdev should not be freed here.
+		 * auxiliary_device_uninit() calls device_put() which call
+		 * the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return NULL;
+	}
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_create);
+
+/**
+ * auxiliary_device_destroy - remove an auxiliary device
+ * @auxdev: pointer to the auxdev to be removed
+ *
+ * Helper to remove an auxiliary device created with
+ * auxiliary_device_create()
+ */
+void auxiliary_device_destroy(void *auxdev)
+{
+	struct auxiliary_device *_auxdev = auxdev;
+
+	auxiliary_device_delete(_auxdev);
+	auxiliary_device_uninit(_auxdev);
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_destroy);
+
+/**
+ * __devm_auxiliary_device_create - create a managed device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(__devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..4086afd0cc6b96084c190f24acc304cde5d1749a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,23 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id);
+void auxiliary_device_destroy(void *auxdev);
+
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data)     \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, 0)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.47.2


