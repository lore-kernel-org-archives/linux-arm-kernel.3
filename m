Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F31D609D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d706DhbkVyX7Vrt0xFDuDzjHOlFjZMBwKWZfTRMnyD8=; b=ByDDza8cbmJ3vHSI5tiiKQ3hcA
	pm1B0aIbbZ6rXiXsIK+R+PLlGvjL0vu1N5Mo97d8hBFRi+G8X2A8sPxbkyZIJKPJtbH8gIWgs6tZX
	ngDJWAg9oo8nam7ZOVzP0qsXI/ouzzLnN6uDb6fg5ULWPtE8rKFJqloTK21TOuD+RpbH3Nw4d/Bep
	wWE7w7BkPqcb/iV7QWMnhQQLI25Pid0ElRE/7YiIJkwwAaza1qI7BsfIWJzOAjItVdJ1qwvNVXLXo
	JCyaEwZUB41PyRbJDuTPwYqFPaKq0GRdl1NfXhupxI1CpteW+RYJL1AwDaNB4OAgHJAflXwNlsKJt
	uY9CtTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFsv-0000000Cx26-0BuL;
	Wed, 27 Nov 2024 11:07:05 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkQ-0000000CvFd-1YLa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:20 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cfadf851e2so8763383a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705096; x=1733309896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d706DhbkVyX7Vrt0xFDuDzjHOlFjZMBwKWZfTRMnyD8=;
        b=X/glmkHQ/1812aI8WCuMd4j9TSpqqcdb1FoetcDB36gDeVUpWtaSPeShKQnMOW4VMK
         X+3Vw8MqnpYu/9gUNI13DGtyQnemdeFRJAKeeGjrmU9IvKK4DRdOuGAhdOK470ecjpJc
         OPXjJ1ZwTS43Q8zKHzT79OzjM++xfQLzdQGLyZODalOcSQ2F5MCKid+2x9K4KSD/omRn
         LNQ349qMzzpaSVcydRsQ4QVZDWowhFQWV6ptXQx10TfzmB93PbrB93amuzTvI6n9GjGn
         EWy0RT0j+CXeeq9V1on1w3SgDd0rAE6uk42aabWcNcCjQMNxtFGbMgaTgIfyNIC4C5Sd
         OkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705096; x=1733309896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d706DhbkVyX7Vrt0xFDuDzjHOlFjZMBwKWZfTRMnyD8=;
        b=Mm2jC7ez3X9YZjP62uL4su/26un4ba1rms26N++ab0OdU4tumzvDkC8hMpX140jtpA
         KMfDlz01mjAspDO/u21iuNNFbxY9mkf47w/1UFKCzKKMAHZqaZKF5IvFd5t785ZytoWR
         l/dIm4KaDDNL7mh/+xE3KjcwjXIxRWGZ+fth/0dtjN9RuEdDFea3hgBVLJkk7W7UpV2j
         iw36UK3M80WWeTObpCzOKZGRyb9X6EfoYabqjh1Vf7glHvmxbuLp0n7v6qqXbh4EaXwq
         7ZFAU9KSdq7cDRzpINmYnKb2nnkGCUVZIUGFgajr9vH91dnnA9KZxX7eAUXZ4G6ugaCn
         Ocdw==
X-Forwarded-Encrypted: i=1; AJvYcCWYsSRIJDn9SL0HyNrrbp/6kkVzSr5x8BToxJCLKzUl1Pvu2gMHKNi6paU8BMk1sK//dqQ5Nrj10bJiN/PCso/6@lists.infradead.org
X-Gm-Message-State: AOJu0YxRudpvW9Gvmrv3IQWQSETmyk1+FgBtg3JijCCWDprTR4xnkcyb
	8u82urpAYz7jGWvJiGdbc0PkKaIwZm8r0hlPGv/ijUUwdILiK35Kf34uOmbskqU=
X-Gm-Gg: ASbGncs+W8UXpOB1vs7tgJojNUchgaU0RUxUBtoB4/vUqv3R1KODJ5w4hPpuEvzQnBw
	d1Y4ab8AuC7PdPHkyfiFT/W6/Phh028LSj2/0czJ8fheszsNEZNlvJOG4LYAKSFhKVFACiNgq76
	pkfu9ydYfBX/JHlAzkKbITj+3s/iZEgmweLqTFGoCYOA+YBKRQYhOin+1rA0DkbExzH3BQBpxvq
	JDfvMLB8hgI1+UolApo//LULdncxRPlRgR+sgAvGHWJDCxC0y1fzpQPVE4hXHYOOqi+zD970N2R
	/lI/2TSxdbuqlK0b8M2safKysYfUeKSA5w==
X-Google-Smtp-Source: AGHT+IFxyNLQvFsWnKU+TtOMetky+Uzt8fcx1BHPsN1RlACtIuFqEyfUvWmlfpzjndBcHn9MinYV7Q==
X-Received: by 2002:a17:906:3cb1:b0:a9f:508:5f5a with SMTP id a640c23a62f3a-aa58103dcf8mr225475566b.40.1732705096199;
        Wed, 27 Nov 2024 02:58:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:15 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:18 +0000
Subject: [PATCH 8/9] phy: exynos5-usbdrd: subscribe to orientation notifier
 if required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-8-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
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
X-CRM114-CacheID: sfid-20241127_025818_424392_24EA2B96 
X-CRM114-Status: GOOD (  19.80  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/Kconfig              |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

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
index 1a34e9b4618a..2010d25ee817 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -394,6 +394,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @extrefclk: frequency select settings when using 'separate
  *	       reference clocks' for SS and HS operations
  * @regulators: regulators for phy
+ * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
  */
 struct exynos5_usbdrd_phy {
@@ -415,6 +416,7 @@ struct exynos5_usbdrd_phy {
 	u32 extrefclk;
 	struct regulator_bulk_data *regulators;
 
+	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
 
@@ -1400,6 +1402,60 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
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
+	phy_drd->orientation = (enum typec_orientation)-1;
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
+#else /* CONFIG_TYPEC */
+static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
+{
+	return 0;
+}
+#endif /* CONFIG_TYPEC */
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -1789,6 +1845,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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


