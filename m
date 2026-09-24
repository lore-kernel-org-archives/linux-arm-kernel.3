Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725BFC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=; b=fwEJjFalATHjQ956+QR6UTNPnZ
	teVk9+kaUmXy/bsQz3qYaaNgcoWRU2ZgPiRUy6PS6BxtORkxEDiA43SoN9wnBJzzYLsKw4pDDqjvK
	M2UVuLtvvvBWbUyfPHDkNh7xRCHXNGRzYnrd/eC3eBRFIkMDJEdKCFntxKMGTBawten68ZEVgwiX3
	VeLTkeC2ec+5RetxC3f1GbX7Vu9Z0IbPjFod67VP14sLuhbSHydZXFsg8eXsjvC1ksuzzC+UtqUac
	oteQss8Rwg8YZEOLeEb/9DCtvK6Ix3D+N/Duh5XIeNT7khHbQJUs+9yxKbQ0hH1nBxZuLYdtzE/4p
	Hjj6cXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1Z-0000000COBm-0AQM;
	Thu, 24 Sep 2026 23:38:45 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1Q-0000000CO9Q-2iOc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:38:37 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb751so201078a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293116; x=1790897916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=oXxJA5O0Ae/nGPmmoO9hKMsaKEgaawupqUBY6e8IyMCqL5oxReVCuOaijqxb2Cp9h6
         /NYjlDr7tx3NePOBSEQx+Xm7HQHNwEjP2LCwjVd9t0CW5e1VRWlqHNfj6ydvK9jbaW5e
         HVMJ6AJB86wHPvDPATV8yAXYogsAOozQ6M+4t85JzOJxspb/rvRreLszB79VDuJckrh7
         DgZWOQG6EMVrfsheGA4Nvpz33jeoyrGkJ/SUs/aJa8eSL1P/7MeZad9xmOHJhC+p8Hrx
         N7cKTHwTJeWoIvPtXyK/B3rUd3t/JmKwyD/qpgPV5cWTPB8/X7zlFbmL2nsV03cBIWUk
         BXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293116; x=1790897916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=eb7p4tit0L090pfNriAK/4pyluDLEHnV7c9+XnsmwBNVDmrsT5NH9ZCdWHL23pp1L0
         VyKc+XZ1ekWcxZmvTl3GOVMP2qzYbdAO/mcWVJJbhJFh7DvtT7nh7SoafTAjw3HdbtiN
         1jhTRIY2pHxf5PYswOJ5HvrSYZQjkOdBBT10Q1aNFUCa/Wk3pSD5zx0V/qmlD8euu6EA
         V6WBn4a/5I+NuC6RFxk1QtDQAspchDMiA3T9dkWdJPK5kxqIS8QhysGy1fjnkp+zE6+5
         CEpYnLo2FEMxIuU+XEEhAf2q/Ps3Wz7u+hif1ajxU/g4djUkMmxxPkzQOb7HTJL2SK0e
         0JVA==
X-Forwarded-Encrypted: i=1; AKwUvBxDi3eSWxexqQ9TaJC//POLpTtIhfx8NGW6YQ+LXBy7sGS8WUVSw5k+PUZ1nOPfG65vdepQzrBginV2bmZ8n/OC@lists.infradead.org
X-Gm-Message-State: AFuF++kGpdBNrjNQ36PPVT/bkMAIp/VKUPDR/tYvh540ArcKo8T+8+Cb
	hQg6ciwe/8KWcelvNpmqD9StLFl8MAOwgs1MgNh/LNwmno2P1kVy8ibW
X-Gm-Gg: AYBFou13dFrDpU+SD2wCS+sAhLFSQRTT3rbF7Mb2qxFI3dN41wjtEJa2atchcNRlfuG
	p0kba2aT3FbN0H5Q/WUihjf7gYFPbRhyRizFWXlZK2OPbmb9/8gwG3EFhLNluv3eYITrolf8j6C
	IAX8vrNFbMbSmNgaG6aS0UB5lmhUfnKbxdoK2TLJ6OUI75WoRaVP2xj6aojbNptzk1CVejGhyue
	yAZb3eYR/OXl8bw6Wu5KTZ7YQuenFK4krd28qvHyNfVfonE1mShQKikP1I0gi5w1HFbmX7ON48I
	nQs568Se5XFVx+L42UlxK/iYtaxvlxvb675q6UYidUpAZZdXc+iN/ubOujhDtZ37tc3QMjWFovb
	uhN3op/mAH1tG0Pa/zOPRfOiSLx1Mbz+hlNWKcuvKbuc3Mp2ljDJb8KH5WowZBXD2nP8ch0ZdN7
	b7/43gROW8blN2cV4v8g3YpRAoBn/Qm2VheZpxA+w0yfxDIZ7JNaqed7kzpbEnkzi7/maozqxgZ
	hMfq8WTwRC24yy23pV7U9GpM7KSCljRkf6CZe40QLGBup9CHSAQkXnlm3U+n5A5ZtueVAGUTq/S
	VuwGareVEgHdHnT8grJRW9Aqvwi5W+TmIIbaLx/Y9CRJlr/CoA==
X-Received: by 2002:a17:90a:d44b:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-3a098587430mr3610558a91.9.1790293115660;
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 1/2] usb: bcma: add regulator support
Date: Thu, 24 Sep 2026 16:38:30 -0700
Message-ID: <20260924233831.127617-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924233831.127617-1-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_163836_691855_51C76BB4 
X-CRM114-Status: GOOD (  19.95  )
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

bcma-hcd drives the USB power line by grabbing the undocumented
"vcc-gpio" from the controller node and poking it through gpiolib.
Besides relying on a non-standard binding, this cannot work on boards
such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
both the USB2 and USB3 cores: the two controllers each request that
GPIO exclusively, so the second one fails with -EBUSY and its port
stays dead.

Add support for the standard regulator interface. Each core obtains its
(shared) VBUS supply through devm_regulator_get() and the regulator core
reference-counts the enable/disable requests, allowing both controllers to
drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 55 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..cb253cae29ae 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -41,6 +42,7 @@ struct bcma_hcd_device {
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
 	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +282,23 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (usb_dev->gpio_desc)
+		return gpiod_set_value(usb_dev->gpio_desc, on);
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (!usb_dev->regulator)
+		return 0;
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
+
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -395,12 +406,12 @@ static int bcma_hcd_usb30_init(struct bcma_hcd_device *bcma_hcd)
 static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
+	struct device *dev = &core->dev;
 	struct bcma_hcd_device *usb_dev;
 
 	/* TODO: Probably need checks here; is the core connected? */
 
-	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
-			       GFP_KERNEL);
+	usb_dev = devm_kzalloc(dev, sizeof(*usb_dev), GFP_KERNEL);
 	if (!usb_dev)
 		return -ENOMEM;
 	usb_dev->core = core;
@@ -409,7 +420,15 @@ static int bcma_hcd_probe(struct bcma_device *core)
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(usb_dev->gpio_desc))
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+				     "error obtaining VBUS GPIO");
+
+	usb_dev->regulator = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(dev, err, "error enabling VBUS regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -427,13 +446,16 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		err = bcma_hcd_usb30_init(usb_dev);
 		break;
 	default:
-		return -ENODEV;
+		err = -ENODEV;
 	}
 	if (err)
-		return err;
+		goto error;
 
 	bcma_set_drvdata(core, usb_dev);
 	return 0;
+error:
+	regulator_disable(usb_dev->regulator);
+	return err;
 }
 
 static void bcma_hcd_remove(struct bcma_device *dev)
@@ -447,12 +469,13 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	if (ehci_dev)
 		platform_device_unregister(ehci_dev);
 
+	regulator_disable(usb_dev->regulator);
 	bcma_core_disable(dev, 0);
 }
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +483,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
 static int bcma_hcd_suspend(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	int err;
+
+	err = bcma_hci_platform_power(dev, false);
+	if (err)
+		return err;
 	bcma_core_disable(dev, 0);
 
 	return 0;
@@ -468,7 +495,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
 static int bcma_hcd_resume(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, true);
+	int err;
+
+	err = bcma_hci_platform_power(dev, true);
+	if (err)
+		return err;
 	bcma_core_enable(dev, 0);
 
 	return 0;
-- 
2.55.0


