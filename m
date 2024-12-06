Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C70DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXCLmnvsdZndLgej1FOJpSFQm/25z8Ym6KzN52uYasw=; b=S/UgMnWtzpdnkfpFYtXEVIRo7s
	w/09+kB5XJZgexrpHHk+ddnMMeFAHsuRwxao7Fr4OcGsUBmdNAezlIlviiqWC1mhyh7h/bXAB9tmN
	ERAT90Otq+Zvii3huYnHlEtAwC/HKOy/vGWwCnF0Mq4UPbOefgFMTThcjzDcq3OsOECx7qGYjhCj3
	PMhiefvIl1/UkfQIOMwoVZJrR0yTvjn2UiOkDvAdBGeHzy4CoLb2chlqxZ77SgHiWdHyzUMnIX/fx
	UANttgPYt/WiynRw/hAmbkguxonMZOHunwYaF+5eeVQZne/OK9hfVOHtQrgbIeLADvZHxYkO73Ud2
	s68PD2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbKR-00000002C3U-09ho;
	Fri, 06 Dec 2024 16:37:19 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEQ-00000002AF3-0o18
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9e44654ae3so365599066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502665; x=1734107465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXCLmnvsdZndLgej1FOJpSFQm/25z8Ym6KzN52uYasw=;
        b=McPxZ9z8Pa71EdrFKQvo/Gr9RgYXjsJqqpD9flocWiIxoSTsBqut7/pLGKKesdR4jA
         HH4SDCfoxGQGWALCr+RrMLkKtCxF6PHzzMZVTEVpE2T8eyTTeS5wT6t9q0JLMLoMQKB0
         OjIrlXhAklEzYnHgtGZ8wd6+TCudJlqJmG4+NgOnaA1o/dYRn+fiYa4pReMzPOavsMpp
         JIyd9gp3VpwVhyGOX7Cgd+dKBwGOoZNlipzFSDO05u1C9q5rvIT4KybdjZ6nsvYQvjR8
         mPoEMQ2ThxHhMpGcsrcXWIQoC3Uh4IW6dALI8ESyWj6f3vVNc4gebdgUI0Q/5k0Gnex7
         ygTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502665; x=1734107465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXCLmnvsdZndLgej1FOJpSFQm/25z8Ym6KzN52uYasw=;
        b=qcXF2O4i2z7YCnATRlNp+UcCmuInINOh1l0CGFdwOZUHjI7GifSAH15OP7Zvvp8op/
         d81ScojOxHMjRDbONQQ3peIT2lbUffH6vjds/QLy/fSBjq3OP2XZL0R35uiRTNq/txpy
         z+RASXPb09l/W7R+Qn3SzHTx7oMy+24XdWsCFsBnH1g1sGW8Uie8qmM+x3sHt0DdlGrs
         zExU8RAQUBNNiyFR6ambX6kYft9fDNZRkMu6TPfc6rIMMyhuB4gnt+h9iw8hWDKhxziu
         ewC/u/HWlr/YqJYgIreLWRX4xvgbhwRLxlx4NBO0SMDg0NAUR2LCz82yXMnFvnXsOWdt
         KDwA==
X-Forwarded-Encrypted: i=1; AJvYcCUuBTRWrUBNnvhthSe3DVp+gqWwiiT19v94hj/0OawTKqyubD0cYH94fNwGP9CWvS091/KosxmPmjdcxQK0Z9pa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw24xQsdDouCz7oFbEpQy8rmhLFBBaSlkDAb6Y1rhagKuTBriJM
	hEcXmTFpJhjpWOfGaojyU+SQ0kCqroo5ncD44iF0pjlBXakjWxBemDYFgCYNwXE=
X-Gm-Gg: ASbGncu+Au1pfWONM15tQgI4WAtuI1/hHhZOWKNvk8P4BaFCq+DJxNZo1ctS7eDLHqs
	m5whwJcEavG+vsIq10Wf9JAGteYF4tu79guBYnphF83+VnMxiq31fdp5a45f9tOAD1m2vVO9VSq
	uWWgE2xUZPhuRV/A9omT4UIlwUCoC47onYM9+IctoWS2vciEY3f20OdJDDi7bX2YIcLVJVHl0rR
	bHXPU/yenDtq9t6mFpih0FngEQMRtyjKs6GdCG9cpLOgqE0DYqxYBCUUlqsASPexHDOucAW8+kH
	K1dQSNHgqaOHPyKaVmIvbTpjxmCkmLb67A==
X-Google-Smtp-Source: AGHT+IE3dSSPOFbEcuaDJ4aqvtGwpINMyqS4vaGKxwRrqFEWJNjc/LOYtTgNWvcadsFJ1ENxhoDVuw==
X-Received: by 2002:a17:907:6196:b0:aa4:a3be:28dd with SMTP id a640c23a62f3a-aa63a254ab9mr340005666b.55.1733502664857;
        Fri, 06 Dec 2024 08:31:04 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:06 +0000
Subject: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083106_240238_C4F39C0F 
X-CRM114-Status: GOOD (  21.83  )
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

gs101's SS phy needs to be configured differently based on the
connector orientation, as the SS link can only be established if the
mux is configured correctly.

The code to handle programming of the mux is in place already, this commit
now adds the missing pieces to subscribe to the Type-C orientation
switch event.

Note that for this all to work we rely on the USB controller
re-initialising us. It should invoke our .exit() upon cable unplug, and
during cable plug we'll receive the orientation event after which we
expect our .init() to be called.

Above reinitialisation happens if the DWC3 controller can enter runtime
suspend automatically. For the DWC3 driver, this is an opt-in:
    echo auto > /sys/devices/.../11110000.usb/power/control
Once done, things work as long as the UDC is not bound as otherwise it
stays busy because it doesn't cancel / stop outstanding TRBs. For now
we have to manually unbind the UDC in that case:
     echo "" > sys/kernel/config/usb_gadget/.../UDC

Note that if the orientation-switch property is missing from the DT,
the code will behave as before this commit (meaning for gs101 it will
work in SS mode in one orientation only). Other platforms are not
affected either way.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* drop init to -1 of phy_drd->orientation (Vinod)
* avoid #ifdef and switch to normal conditional IS_ENABLED() for
  CONFIG_TYPEC

v2:
* move #include typec_mux.h from parent patch into this one (Peter)
---
 drivers/phy/samsung/Kconfig              |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index f10afa3d7ff5..fc7bd1088576 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 61e0de4b3d4b..8fc15847cfd8 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 /* Exynos USB PHY registers */
 #define EXYNOS5_FSEL_9MHZ6		0x0
@@ -394,6 +395,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
  * @regulators: regulators for phy
+ * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
  */
 struct exynos5_usbdrd_phy {
@@ -415,6 +417,7 @@ struct exynos5_usbdrd_phy {
 	u32 extrefclk;
 	struct regulator_bulk_data *regulators;
 
+	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
 
@@ -1397,6 +1400,55 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 	return 0;
 }
 
+static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
+				       enum typec_orientation orientation)
+{
+	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+
+	scoped_guard(mutex, &phy_drd->phy_mutex)
+		phy_drd->orientation = orientation;
+
+	return 0;
+}
+
+static void exynos5_usbdrd_orien_switch_unregister(void *data)
+{
+	struct exynos5_usbdrd_phy *phy_drd = data;
+
+	typec_switch_unregister(phy_drd->sw);
+}
+
+static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
+{
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_TYPEC))
+		return 0;
+
+	if (device_property_present(phy_drd->dev, "orientation-switch")) {
+		struct typec_switch_desc sw_desc = { };
+
+		sw_desc.drvdata = phy_drd;
+		sw_desc.fwnode = dev_fwnode(phy_drd->dev);
+		sw_desc.set = exynos5_usbdrd_orien_sw_set;
+
+		phy_drd->sw = typec_switch_register(phy_drd->dev, &sw_desc);
+		if (IS_ERR(phy_drd->sw))
+			return dev_err_probe(phy_drd->dev,
+					     PTR_ERR(phy_drd->sw),
+					     "Failed to register TypeC orientation switch\n");
+
+		ret = devm_add_action_or_reset(phy_drd->dev,
+					       exynos5_usbdrd_orien_switch_unregister,
+					       phy_drd);
+		if (ret)
+			return dev_err_probe(phy_drd->dev, ret,
+					     "Failed to register TypeC orientation devm action\n");
+	}
+
+	return 0;
+}
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1786,6 +1838,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
+	ret = exynos5_usbdrd_setup_notifiers(phy_drd);
+	if (ret)
+		return ret;
+
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {

-- 
2.47.0.338.g60cca15819-goog


