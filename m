Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9FEE64A84
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54YjK1PSCj3noc28mh1Eh19wlGr7iBDWYo9sjvHvK0I=; b=HpJWoib4olA8V1RJifouY0mqrL
	xSAi3tjgDP+s7yZtETkPSDIZy3tqLQ6e3fZoad7iLwR5CUJnmpkH8Lk+PjcAlL9/81BoH9APUByVi
	Jy/1KSduMvZcZnZH8PKlaMIIjxk5wrO09vejcAxZmSAmyBIpsOF2X10PO6/SguzNrNkboqzMKzs+g
	UcCVhYhJWjqnfAy1GbuWzfdvCt9TEw+4B2X6XTtIjEyKIp0C2lvBxmyB42yq1ln9G9bSJtTKVu5Y0
	Nyrq2Whhu/2hUuqqF/4tf8cJGJ2Rfo/TlWsksmH1SW3ieV2LrqhC0EaEwCsmlv0MEaB0SDBc0GuC7
	df6KeQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRui-00000009Pbm-0afy;
	Tue, 03 Dec 2024 12:22:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmu-00000009NgN-3UKE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:58 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa55da18f89so821987466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228035; x=1733832835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54YjK1PSCj3noc28mh1Eh19wlGr7iBDWYo9sjvHvK0I=;
        b=ObPG3kFAsrMpqc3XKVzstTOH75yCAgaxQQf7QrncbzVBBH82qXsG1+EzP7tfPiD2y9
         00j1tWmkMaLbmIP4VfBu8gt4tpwGibDGUObjsY84AWRuvScftHjR49XO2hOEKeTGfPFg
         72mImbAW4gELHBLxlouCtbGa+iD6/JPeB0iQmBnZFNIhZOVFcAtVjhI1O23bC83qrWRw
         lkEBAvgAgfmm3Y3oObZbacjsThigYPbW8YxCXce3Mm04u6nIVhyBfPCCYZg9XZDWCUB6
         IlrUGi4WtA1uQNEPyMINMgm58R2xiICwg/3o5rRQE9NF5Bk70Ti+cwTkdGTML7yGma1g
         zHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228035; x=1733832835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54YjK1PSCj3noc28mh1Eh19wlGr7iBDWYo9sjvHvK0I=;
        b=RecQlyoWkMhThBb5ZlEJ9YhQ5V5F5MFx4/mH0UbP78KqBlTaLzLc4rZU3HEpWMXOyG
         pQNh0twAaC8FxBT9xEfYdXJEOCTQs/EO32YPmD6R9LYCghBiFFkjiHwZjug23O2DgHBy
         FScOlq71KZTNgi7m7V5ENfdJvM90f3FXOiYLv7Kd5bf5AHXB7OvmtRi43ZkkGQq9sPIC
         oTmnysQQqhJAmjTjo5uY/0+tg334QsH9k+2WqI6j/OpHeAWh8j9PKd63Ub+XeY7fW174
         Z4ZmS9Dl0Es8KoYuEG6e4xLmhS9HuMBfS28wWr73UPoRgt82s0VxTOFU/ux7fPDaJsM0
         qsww==
X-Forwarded-Encrypted: i=1; AJvYcCWnVyUZozFRLLN6u1Cnk6OimzZhKFfzgpBmLk41CH9MqyNJrQwEGbD8Gem0tWfVa+K0+ZvTiR4p5VNonPvtQb6Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxdrNb5xuBcSrqJAcjUQIA2IX7Br25b3TUMsWlFPFAkOKNMcuol
	ePcXhlmh8Emhg1GvPPcyoOCe0y7R7LUO7jobn5rX5+/lVFeLUhEjQzKbhHEzQYQ=
X-Gm-Gg: ASbGncti+gy2WUIY2NYBcaZCwleIB+PvjgdA5hCAVvsJVa2vxptd5smUhKhjvjcYU4e
	G09Yfg2MP0ZrzaU/vz43641AZYgBTShRy7z7EdYELoZqf/CQ1wfdw1P8MnvfC5e+2BpslhsAgJe
	D/qPtai9nSnkSVnhj+8U4S2xf1VgXGzX46aXhyO9t0qNB823eEpXcU2YWhPrCVFaP381YW/4NuR
	CSYNKXuUdOd1V54gFg6z/J0jBReEIUUG8CD1Rc9xCZPQFkI6teUd11ICKWzvMOFrzrT/4ei+DGY
	i3AYrvQax7EP8pY3aOAU9A4FYF2GigflxA==
X-Google-Smtp-Source: AGHT+IGlYONH0INC2ObUF4IvK3DPpOMeryroZsQD2npmBCwLgaYdxtB/m6WRr2IlPYlTnp1MvA4eXw==
X-Received: by 2002:a17:906:3ca2:b0:aa5:f39a:bd7b with SMTP id a640c23a62f3a-aa5f7ccdc77mr167906966b.4.1733228034789;
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:55 +0000
Subject: [PATCH v2 7/8] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-7-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
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
X-CRM114-CacheID: sfid-20241203_041356_945267_D3FDFBED 
X-CRM114-Status: GOOD (  22.51  )
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
v2:
* move #include typec_mux.h from parent patch into this one (Peter)
---
 drivers/phy/samsung/Kconfig              |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

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
index 206483c7ca55..b1914c6c806d 100644
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
 
@@ -1400,6 +1403,60 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
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
@@ -1789,6 +1846,10 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
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


