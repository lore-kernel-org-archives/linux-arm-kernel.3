Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1194C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=; b=FQy2F9ul/sOl5ljPnUokmiMjhH
	/QQ7WKLwCx20mC0LcDy1Tfq9V9NRqX25sNVKou/W1PrSGqFmqV+ourx9a7HnnMEqYSh1Pj2Gy9clY
	pzWk9FRQtn6wYxb5fejK7/RKog2sAuGsMD3mrWaxwnT5SKFOOjo0ONd1Nsgu7N1wh2TDfAtWIjoLI
	iaF1MwZuj29AyC66R4T0WDsM70Ai4JoYrwumCbPtYFxIJ/gh/JMRk9RNwv1z8Rny9YtejgR7Y+422
	eKutLuMFbyieHGV8mp7YVKn/iWMwVktOTBFXf9rNYnLq3hu2GzcbYX474j21haSi/skNc0SK7tRLm
	tEgV/YHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHa-00000004iGv-1Zzz;
	Tue, 11 Feb 2025 17:42:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3h-00000004fvB-1Hu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so2581160f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294907; x=1739899707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=1y++KU2NkQaKLpDyz2gNYp5cL48Ar1k7CKk3NhzfVfjDJ5isTxzfVAONJq3wsFOZDn
         iZthoOys1geYFN63xVNffAF0MbZgKCFMJ8vP+VPKo3G3IIeZWA6qZTrjn/SNN0oxOc/T
         pgjSbL0miPF07fEDa+yCY6YDGviFfcaxthU0sB8NyZZv/WAXo70l3Qg6VHLqCp2jFW2E
         hr0PJ4r5ViiuX+uPINH3mDyRFn/6QXgkPmkp3R7r4u5aLtPwsXqROR+gIQaAVzZnuoRG
         k/Gmfw3ikpl/S3W4rsaImN6oJwOnX5V1SRq40cW8A8puvR4sb8tQ9DDtRLi3LhjhbDqb
         k+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294907; x=1739899707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=U+KpYU/V7foXDu5WSR80oVKAjDf2tQ17KO1AK5cxNTIyVdB9cPw9wiFeHNUTBnQf5j
         6JbUNJ9It7AYPQwdVjLcUNw6bMBsw1G49gSsQVxbxuoLeqrgNigdiEAGORAPw44KC3tt
         b6zl8nHefnVHjWjEbFFLtyE5Hh5tS6trSARI/eWUGMinQM/9/HLX1XpNekHHJhsKvN2t
         IG5sn1u5DKZTm0xIZIh8Fi976JDPV5UNcvhd0bUzw9qvyLrLE5FUJiaCoYAY/JRykWKE
         C40hHYG07wQmiV0d4ufWyE95X4s9TpdDvSkp7+LV27k42GIgdn8Q72j5sOK+FYrpT2RJ
         hccQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWJtPpUwLKXWKAOAD117d1bVM02VQqnKsHaWopmw/Ol4+vNpiFu9TAS2+oEc9JoJjbI8qZOz41OSga+lcyq1Og@lists.infradead.org
X-Gm-Message-State: AOJu0YxwRN0ep/I5ggUeEU6jIoUdQmqK/2rhYlF7sgvNPvU1A/zz1qML
	O9FIB5kNFxHlwQi3jSc6GJPp99n8XoHWc1DyqQX1uXTrgokCKyqAXZGQTGHqo1o=
X-Gm-Gg: ASbGncv1LN/A9BDg52JLq1dCZ0ISwrFn2ePraCAbrqxSIpwPu6E/+VwiF8smMhmuTtl
	Fxlj+VRiz12eGWXQZ0mg2mzAOLNVemm5B773Ubo6WQ27WPioqDQrMV4F8C7ZfHkhfH3oOuNwCwR
	NWwtpdiaVzfmMqtq5v6gMNKhM39TfBGPzVx9BBm9N20WivCn5IeNl+SFWB3qKOwGReNjibgnteE
	Qgq0jSI7sVIEbqT0X5gc1m9M9xlD+VY6GQ7Gm0BRV85i9J55B5Le7TYZ0m5EDXKmAbi6tZmfJKF
	CHP+4yfawJnL3hGwng==
X-Google-Smtp-Source: AGHT+IGy2T23PgwDmJGcN14Q/mCFh4UYzD0ptO9o4GXW666CumGfNzzI0RhLancAMnBStTnS1c8Jkg==
X-Received: by 2002:a05:6000:1f82:b0:38d:e1b1:be99 with SMTP id ffacd0b85a97d-38de4193da8mr3997996f8f.23.1739294907528;
        Tue, 11 Feb 2025 09:28:27 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/7] driver core: auxiliary bus: add device creation helpers
Date: Tue, 11 Feb 2025 18:27:58 +0100
Message-ID: <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4290; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=L2mc7++2m+KbwXPJfmeanEsMndjpINIhEyR+p/vnM+0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2Jb64zhGo4nYo4f11I5GNQZEAzlSZ9Yo5d
 ngkcisRo/6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hf93D/9ySJRRpTfhwXJWNiKfMhcJCrBwzYVVixaTTNiJUGMkApqchMSmB0zNWhrawPaDlId3Qiv
 auxx3nD/C8QUQGOe3pmyimoKTtJX68sya3tWzYS13H4Sa0H9qFl2RM0zYZ2KeIfFaB5bXjAyZbp
 8AafPJDeusV3rANuFGpxeUk8OJf2I26NERiAMf4JIeYfEk+DdUX/qaaekow/K+zX0friJeeHzfS
 n3nNP0mPksNRZ70HmTScJgvfPOEIO1hH8exi8I+Ge5RadGPr4ZAvrdduyqDrUcI+eC7Vw/vJkNh
 sW2YMStxssdA3V4ydPTzpH9vn+vlpXW1isL2h2lNUHHsZ6qQneIycJfGJCCYP1GDRky2C6AtPib
 l71wFmbfhXQPTnOmW1byyhQNUf2DG0Kse6unCPxWmU2O+bBwnBvUp3XtMEU/LOPI0MGCpZctNwz
 teda+aTYeFlWq/IRpLHb256e0QTj8OwBd64Y8+cWTJlY3OJswpzqv3zklJ0nKa5VDXQDUjv8dE/
 3Z3LHSVu21jO5GhGjKjzeZeJVnbohnbeTurbB9m0HLLQkVNy1b6qdMD98Y9uIm1F0V6fv5ak8Ji
 vqYRsnbb3UUjcLUi7RMxyNaRwF7lp8opYquywNB5WMkoWzbD21tWKnQOr6ID3hMTihGNxCRzIyH O4UjCmzh9bo+k5A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092829_346299_5A1C8337 
X-CRM114-Status: GOOD (  18.01  )
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
 drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h | 10 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+static struct auxiliary_device *auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
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
+		return ERR_PTR(ret);
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * NOTE: It may look odd but auxdev should not be freed
+		 * here. auxiliary_device_uninit() calls device_put()
+		 * which call the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return auxdev;
+}
+
+static void auxiliary_device_destroy(void *_auxdev)
+{
+	struct auxiliary_device *auxdev = _auxdev;
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+/**
+ * __devm_auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device create matches driver 'modname.devname' on the auxiliary bus.
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
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..c098568eeed2a518b055afbf1f1e68623a2c109a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,16 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data, id) \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, id)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.45.2


