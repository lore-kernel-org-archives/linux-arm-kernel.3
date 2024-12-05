Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA22E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=; b=t3FTzLUIvMWpTkgV1OvVxr+AbZ
	Voniqc5YhGJM00ELAksgORniaohVDRLZpTh8Bp6FFoDBFtjghcVW7lh0RsgP53wvZPZsSuNP/iolT
	1Fta98G9+VsnXdFmzPxTQMa770nXDK8g/XTJJYssI656ze2ejPR2Jan3TsPEdBwGnA7+rsqmUxVY6
	E5ytlAzf246TSLdyUmHJlYvfdEQoYs+EF1oAcqOJnpA/x7r9nzFc1kI+jUBD0/SqocbDTottrmNoJ
	mZ/iZi7V9bLykodugtx9gCPNS7Wx10MDQpxS23jZQ7QPYDpfOcCiKXLue4tEJtgtPYh0y3hFpK8ve
	MZY9XEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Tm-0000000F3so-2BAS;
	Thu, 05 Dec 2024 07:40:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MT-0000000F1lJ-1XW2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 07:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=; b=fMTzVmK1cuwdCb6tRfUUDNoYQM
	oeeNbFLhYO25FkTgd+EsezMdW811R8/P2ElxES/Z6GTgPJWo5rlCud4+SNjIUjd/lNdImdqpiEdln
	sR5Dx8MOns6oCV6uYOQnRDQl4r+5XrEBE92BnavIIL1K2Y52QUr6U2TQvbuSEF82D1kiWQWhqh1dv
	NaUJ3GZHUY9BZdYL7H1o3TgQdVeDRGvzJ4DwCWEE4clahKkbEeSTlOyD+XEQ6WNrY6/95yNXAqae3
	bwhHTucZvE6usHGaQAq8q9nOQQgtgTEmSxvRJ3gpQjMmGhWcGhzJvLofdVA+/GeZFlWTeepSRoO9c
	y5Ma20zw==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MQ-00000002muJ-1FcA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa5500f7a75so82256866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383997; x=1733988797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=;
        b=TuI8agGINnKArxhMyzw+uApllZr3gTjSJ9duTLWD5b/dfUQxusgx/m6vCHHWsC9w0j
         9K4pY0cSGak5IzEhNmfVefQ4xBk+fe4d6vxtQWV+Y+qktdH+rEYTXPvLgKW0hn6MD9qn
         2IFLBZoWSmXxYcAGSFwh4Le9npJ0UFUEkmRjGrwWLBeOkaBzgq0ZIPPnSVoW12tWeQpM
         kBLnXZ1q3wuV/g2DuSLBmv1QVDdyX9Cd/V5WwCy+OTR1ZgTtsmrwtA5ClO4CU4oXRySu
         be21u4kpMFHn3esgBFntYAwAWy+K8HFRuLh8j1lwftQjan8E8Ra0BgMl37kpvgdJyiUC
         eJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383997; x=1733988797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6O3lCGzSUbOgWyay+aXa9djkwZjywsxQgF3zhLj0KI=;
        b=IgeOzMfQ1xVwRlNp2M9+OMwAHGKEyhk0uLmVLh5XsSwBLzqDp12oKT/Gk+Z986m6A4
         alzrakmhW052Q0kxPv96X/59jkZbR+Hj6HBPPEQwKsA6KT8ouLG9G+P7zMXE9qv/qiqA
         iu7+N4f7jInRtmrtVC/HffVplGoM0Pwk0ck1RUo35LNOzWJgLbzqtXruoO8YPhyllCvA
         ll/ruKLw4HMYiGACDhQP38jN4TCalOsrSniupLoixvn2jH5RPk2dp21ewm09esN3y1v7
         eDhwKnll+d/L2lH3+RkrNKpyCqLN1AqA51hqKd2spmqE7qqK+kjOTC/4H62WSIcwMbRF
         CXpg==
X-Forwarded-Encrypted: i=1; AJvYcCX6etHKL2y9TmKnANw7nCVpkREl2kwjJu4idlUXY/r3b3Eea06ichr3B6BXE56woHXfEwfX5GJE39WIrgoQ1DuJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyElQv/ozO/349nFUIQEgbXWo7Tx5Q3/8tR16gd98T98VOoDdU4
	yGGFy6F7c0ZTZ/O6EdhbEWOoc8pfzBIXgejtKJjeQh4lgcwSQdTvTery5XeX0dY=
X-Gm-Gg: ASbGncvnsiyg3HpkwdYGnCKK9Z986VvWnqS1ZomarO8Vff7uzO8ias70XYXpJqh2N7j
	/TFmk941K1bBuRQfeVGqwNBR5zajkfBsMjzCQn19n5LLtIwQsHmavRVa/+xjPOGzB3CJt5oKvya
	QTXPyQ+9wMXXH8v5j+2Lc8mBOxE8cWu3e4fl5xOpqqjPE1N6AhFlV+qbYkBY7YcG/KRet0k+//A
	xpdOudCMO7LN3eVmIwE+KaXlfenFLZ86p5T4knNGga484cMWdAhwsRqV1LWOQtq1NT8zfmJWXkQ
	CWPGwtMcT1wP4yloaYFLZv5cs8W5edAbjA==
X-Google-Smtp-Source: AGHT+IEi/zCT7Ze2IPO+Cv0zWjyb+MBILaN1VwgbSpJ0ZibfzpwTs9mA6Loh2tFdluQCoQvAqduEeA==
X-Received: by 2002:a17:906:18a9:b0:aa5:391e:cad5 with SMTP id a640c23a62f3a-aa5f7d9a2a7mr737322566b.33.1733383996962;
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:16 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:18 +0000
Subject: [PATCH v3 7/8] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-7-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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
X-CRM114-CacheID: sfid-20241205_073318_502366_4E08E485 
X-CRM114-Status: GOOD (  22.43  )
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

IS_ENABLED(CONFIG_TYPEC)
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
index 206483c7ca55..6dcc3c80c1d2 100644
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
 
@@ -1400,6 +1403,55 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
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
@@ -1789,6 +1841,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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


