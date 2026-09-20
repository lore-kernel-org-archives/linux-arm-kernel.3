Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AD8C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=; b=G1rjCCTxR+q3nZOApTSjfGJIJf
	rNRf3+vs6dtKqXb7PforcMp8yt6/7SEzJ4nVKX0VVMPI/oKlcgJiXp+F+svINBETR8/Sx/91Xiiac
	XI+Px/zsCoho/2899Nh8SGJbvxAE24NCBUrSZqA/iZa8sHC+NHFjvr4cl0yKNlcN5P7+tmeG4dold
	IZHBkapiSLFWM3tpic0cQYZqyOPYHNIB4xSNxr8zfE+m3rZO0NCrMCKIDg4WCPg1HJ2wmo8hVGIKl
	OANlA5JS4VP3byZt52eEGZkZaSKfqBE21w530BzHozyN3fznTaB281V7gs7NZbQ7BiSY4BDjnu9c6
	sOkOZtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrT-00000000R4j-0EQf;
	Sun, 20 Sep 2026 21:14:11 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrL-00000000R31-2Ze0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:14:04 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so2079475a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938843; x=1790543643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=mae652JiBDI3y3zs6RWYEJATEpJEB0CjiTtUnmNI6I3TBlbKxQIkNuxo60LRLozG5P
         mIi8uIi23NwC9hkt1/jJMJcZYoWu/KeMtIa6qA4JjaDdq4QvEILSyrFgcvFoiKU4judF
         LxYDmsor/TXdZnqJI+d7xebhvm4HU2NEZqBt4l67sEHJQTQaORA3j5uUCnbFQeJWhSbt
         syrQNhLNn6HVv///3bipJ0hLaN1MLXS/B7uukmX7u3PH0ei6udEAZ4Lrf/+QGTxZ3Win
         rREuTo1uw8/No6cIwQSY13mFDOPjTPXez5TQvEGfoRtTwbnCMIgo91Y2M3/c0V5CMXkS
         RNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938843; x=1790543643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=Q7AS8w89xvAnVsY4IghCNzW0SPXj5BGW18a5ufTjDnmt3Mw0RNaUnNR6Ax/RC9w7/F
         cLqnUvLk78xbqLKVuD9Ytw/Ia9NskGb4sweYNhMNtd8zo/FG+7//aCRCFa3p8FJdkvhP
         8YOreSB6PrdmNTRmle1Crf+vudm0QtuDTKSSZQjtBiHqAEp7GQlCARLRTc4n0Za5KjKO
         JcIr2cmHPpNaOPBXfpN8XZhXwXNrSR8y9vilFYs+Vm1LJ4QbOvB3BRcgPDCvX+Nlvi2B
         GPY3QjsAukCATrT2+PcF+rk3ozP0OTLSxXjYQvadAoHAkYjVS0b3RucgZTiO8DsF1pH+
         v1uw==
X-Forwarded-Encrypted: i=1; AKwUvBws37aTS0bzamYP5tF5f6CFRlrFk0haSapTxuyf5/zM8W/rCW+7UUZpBKcogMy1yHAlVnB7EkgRhcmIw/h7y2f5@lists.infradead.org
X-Gm-Message-State: AFuF++nuCBY+AwqKkJz+dWI3PaNOGzeWCuSmgF+yLD61X3clcJbEzhCj
	MgPYzm8NP+32MxzkoN1MQGVIPJbTcYR2iPVBJdG/qByggMLaE71YMHFe
X-Gm-Gg: AYBFou13UtHYSWWYowj89WyQ/a3xBjsph0CRu9+8SFbsGJc8it1iHjNgrZato+fQZsY
	U+wSVlTGkNtcTtSLvDHmfpsyHkh30hLlJcEfZ5BVc325ya63Vbf5id8sgfzPBkDkxVnZ3L8D8ta
	Sy7Q0VB7Xs+H/TcdA32q63DNT+l2TpMww9s3trkVc8KYSEsaugTXmudxIdWf1QJbOTt+LqXyvmO
	Y7alvhzlWvGPhO+ummDYzoxuC5/Tkf8KZ64M+jR4+4yj9oecYvWSyXxd2S97oo5L4VGVyoxCxgY
	93+e6oMGCjj5GEOpcJOKG1rJkwyJbiSDLRsBOKr5lmM/YvR05ZbQ/eHATQGL4+A3R1KVaRUcilT
	EgjVclTye/8+jfUhOuDtXkrK9383lCKvts6IZ3SNMF2dy/jtsBHM6xC7Lqe1PUz/oP0JyvjEJ9t
	elaekMbg3eri7lsD9dsqsSaAFr7F0s+TNwe3VAwE+Td2pd0ddHb0zKqM7DQT52o9eSyH18TuIqj
	b1evbS1GeA5CPWFttUkDWWJNbQ7S7rLuV+tVQA4+bKS+Td05PPr4F4NBZXyyD6WV5LAIjb7SvEl
	/qQf0QnD3n9jMEGvBXb2mPQBXLp2Pxsz67RF6sCuM6MXw1wb
X-Received: by 2002:a17:90a:d40e:b0:39e:6c6a:656f with SMTP id 98e67ed59e1d1-39e6c6a6787mr7048137a91.50.1789938842656;
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
Date: Sun, 20 Sep 2026 14:13:55 -0700
Message-ID: <20260920211356.186967-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920211356.186967-1-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_141403_654722_FB5D8DF4 
X-CRM114-Status: GOOD (  19.12  )
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

Use the standard regulator interface instead. Each core obtains its
(shared) VBUS supply through devm_regulator_get_optional() and the
regulator core reference-counts the enable/disable requests, allowing
both controllers to drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 45 +++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..394ba9e5a7f7 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -20,12 +20,12 @@
  */
 #include <linux/bcma/bcma.h>
 #include <linux/delay.h>
-#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -40,7 +40,7 @@ struct bcma_hcd_device {
 	struct bcma_device *core;
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
-	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +280,20 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (!usb_dev->regulator)
+		return 0;
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -405,11 +411,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return -ENOMEM;
 	usb_dev->core = core;
 
-	usb_dev->gpio_desc = devm_gpiod_get_optional(&core->dev, "vcc",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(usb_dev->gpio_desc))
-		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+	usb_dev->regulator = devm_regulator_get_optional(&core->dev, "vbus");
+	if (IS_ERR(usb_dev->regulator)) {
+		return PTR_ERR(usb_dev->regulator);
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(&core->dev, err,
+				     "error enabling VCC regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -452,7 +461,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +469,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
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
@@ -468,7 +481,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
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


