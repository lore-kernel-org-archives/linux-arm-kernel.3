Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3744EC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYvkwWgOoTHqSMKs+uOvBb6xRZ3jjBTtb5fdAS18f1I=; b=WOWsYA/1PNZERrtX5jxLTWw6Wm
	vBhA1Mk6c0JisQzgQcAOsl1SbQ+HMu4xHBQgKwnb3xWP+uSjhbPfmk7NK0vWtfCbwVERedaR9JbtM
	zfQKKSX1uVGME/G7vlgnR2n9ftT71NiUvoUkMp6u1yd123qGqSzJl57yEch+hOMYKgNbyDACwcvPg
	Fb4d7OR7nUowBATfiSbNe4VWm1OXIg9JwVkwDup3V1grfPHW29LfL03UxfOQT3lpEkNi6sEdo0bsg
	oo7w8UOmtOmhbD/kUbeo+yAJJukPa53sVPeMrIt/hVrMLqjHXz34BY8JYa3THsR6YbGvzJIeEVdjm
	MgRpZCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8llk-00000003UEX-2BXz;
	Mon, 21 Sep 2026 21:41:48 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8llb-00000003UBF-23Vo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:41:40 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2405501a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026898; x=1790631698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYvkwWgOoTHqSMKs+uOvBb6xRZ3jjBTtb5fdAS18f1I=;
        b=nMQA5LoornlbDKan9gazF23eSmdpxClwDIRRqZrlnCSR0dC677NUWh6LXtG8OrZ705
         khCAWYl12xGe9ySaJ0OsWjKX7/8bn8dSVKtjnSZbJOsiqyog00ZKV7zfK3oXKgndDrf6
         HH8IdvIrqYcg/Jpd29q/hjyJ53QLiEt2JiZh/K7ByHzZ4Lnni1vTHwNwnK4HzZGH7qc3
         P5uoI6/xw500bD2NIe1RRp7hbEekv74Z3Yvpm8FUAGkkdw9t7JNsr5X14QmwgMEYK/Hj
         N+5siU1d1Sqrriy/hnp0SNeIqTBC7O8JGHax//Zbrj0SY2T6bk6fsFAOkxppAnOMNSl/
         9Rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026898; x=1790631698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYvkwWgOoTHqSMKs+uOvBb6xRZ3jjBTtb5fdAS18f1I=;
        b=T9KqGQ4Qz1o5oJNgCd/W0kXiJStrjyo9hIjYPkPX3Ul/uVX6Jms+vrX2ZjrlZ1BlnE
         FLv6M0YBr7zc4uai54JZZ+KwqtynUzStqdojrK93R0xGOWio5uXqM7ucHhvs7jCvkqsi
         wSYgc38II9IBjm2V7rP3EG7SQPJFljUW574fz2UxCLfiGFH4Rig27UONagFvAzy7bKSj
         iXZiHrApb4JTbbXiisAYwuDDzA+LE98jwUBSPnjePfIvi8pU1rPvBLdgAKzbOb4uYQws
         1DRXTpfEMPsXVApgI1/yCkMwYIkp1NsOX3FcLNkWOebx+XSz/19USAidEtZTyh6VG56x
         GP7g==
X-Forwarded-Encrypted: i=1; AKwUvBzANlniF2JGPNfOh9CaI8FUHW3O5he1oZDP4uR6WZ2CkCjD+lGffZGolSHy73EULQQMhvavwDCpS3R+P1Xwx1JC@lists.infradead.org
X-Gm-Message-State: AFuF++m8HOZf+6ZH4JtdqiFo1GLx+m3SShSIMeEwbsWO3L0rBXgNxX12
	tmMVYZGU4h1zSUCtNTCK6gC5RG5IyF2t4TJ267j6Rfp0YkaV4qy5a3c7
X-Gm-Gg: AYBFou0BlyL+bFrSowwlvXN3xlXkMGr/XAzUQBHueufojqNR4HKtAC5ioxnvXPs/uqO
	DH+8IXAFecAmbYSikWBNyxoNDQrfqViFje/ZAy1r7dewkJMk9XpFvWpyrq9A8inXUXmPBi9dCdV
	N/PTBxMCZo0dgAUDUTpSCtSEJAhmvcc1y/39AdGUmaUORQdkUpDGOdZ+1fkJttRYMxK0ToUm7UL
	i+MiJVmxyi3e+2fUtUecQ7v5YbL5eqdOpRf5abQoBujfPGxl27svgVqXWrOjglDl/FcX3NNBCFe
	L6Pncx/XhishHUZhMuULEsfB+hprackqe6uzwaHDWBEyvMzcwhUONMQ7lZ8bsKFqLbiQBbblHoS
	DzW4PNOwCGU7SW9ICr4cKW2OGyi1Cxu0n7Xzq3DkEmy6nWv9YTtajeG49w+gNbCSjBjzgUANb1J
	gWeRpSFCHutMkz+qxTU+FbePq//W7R6dLJAK2AUWL78itoPKRBBs5uI1vwn2R12+/whIYWqU7/k
	bxdFWsA87gU/Fqe/ZdzSitEAE0pfLKKdBCVahAE1Rcbm2nbSgfPQhJawrGZw0kDpVmnD7hLIXum
	MpewIPzCA/+q0QUK5RIT9uEtTXU9q/AElEm1BD1cIp1h0WH2
X-Received: by 2002:a17:90a:d00e:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e54aeed0emr16493965a91.2.1790026898410;
        Mon, 21 Sep 2026 14:41:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 1/2] usb: bcma: add regulator support
Date: Mon, 21 Sep 2026 14:41:32 -0700
Message-ID: <20260921214133.16519-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214133.16519-1-rosenp@gmail.com>
References: <20260921214133.16519-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_144139_537143_05F98A09 
X-CRM114-Status: GOOD (  20.64  )
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
 drivers/usb/host/bcma-hcd.c | 54 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..0d5a220b6988 100644
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
@@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
 				     "error obtaining VCC GPIO");
 
+	usb_dev->regulator = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(dev, err, "error enabling VCC regulator");
+
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
 		if (IS_ENABLED(CONFIG_ARM))
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
@@ -442,6 +464,8 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	struct platform_device *ohci_dev = usb_dev->ohci_dev;
 	struct platform_device *ehci_dev = usb_dev->ehci_dev;
 
+	regulator_disable(usb_dev->regulator);
+
 	if (ohci_dev)
 		platform_device_unregister(ohci_dev);
 	if (ehci_dev)
@@ -452,7 +476,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +484,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
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
@@ -468,7 +496,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
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


