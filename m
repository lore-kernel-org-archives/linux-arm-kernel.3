Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1134CA5FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfhCcDimQydckibdghCTJJWOOyfGObrpnuJon29Aw7A=; b=AdxXTVZpWxzeEOUyPnqlaB2Lvi
	AbeYpR1bHHA7UXF0aY/gWvXoBDZW87qRanndiOuUcDFpO43/4xzDAhZZaAaKacAMZwV1js1T93KSk
	zFi08pR8W0S95AzdXN90C4qqyzL+ooNmILDGyv6Cl5U+wZ8GNFd0pB7FnWqSiRLleMuvvoZYxUjmi
	vX0q/WOcC9m0hf3k/N+6BYXoWPhkgtsFMPcBU0Hw95RyiR0A+JueceIJq+TgxLc15jWm0CdsJfycP
	WAaGysViqE9WYqvCnRVHgAOw2SKGLNlEy6ZPbJcTOxuXCY79PTmdHUqDrpr/Pd6sk9BCVzg4lVjAU
	RkYYiwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwI5-00000006WRD-0fOe;
	Wed, 30 Sep 2026 15:32:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwHw-00000006WNB-2INu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OfhCcDimQydckibdghCTJJWOOyfGObrpnuJon29Aw7A=; b=jtDk1S1Bljjm/d8JEpY1f8CMPF
	wuiEvpV7b5EMZQRDxML0kyoYxZjPekR/kexCephT+uLE2crgR2G7ydXoQDCJp+TvAbxTDSRDG86wd
	fH7rBOLUnylsG//uXII5AO4ywtJ5L7XK0Y4sHS4oAVyNdFohyVvvyYcX3lDBab2PZeBkL465TU8Th
	mW3/mP1ieYCsKO8kYsFi+BL+X6/1mUm1MTJZVJQCZPmyYpeciv7Xqq9VVsWY2GCK3w5VKjbzupxRo
	/8MgUhQMynlOycE0hsNKTj03eQdAusQdFLEvH3TdewZBXp6YjUPuskgfmsc3W33kVoAUZ2C0ZWt8S
	qjDUFE+w==;
Received: from mout02.posteo.de ([185.67.36.66])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwHt-000000040H4-2KrX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:32:07 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3D1D9240106
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1790782315;
	bh=OfhCcDimQydckibdghCTJJWOOyfGObrpnuJon29Aw7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=Qf29aTO/IvnOtI+13M/ELRbk94kVAD09n/3McKLxyTQmJHSq+SnhhQ4E2S6LDkLv1
	 BqJMHLfJJYexdP+7DJTAqH/YXDC+b79UbE391dQZSRrIRGZB6LhnzBVLt2STIn6G5l
	 OauZhvYuMJ8O3me5gipm9oyfiAwO4U186kCKBY48hggi8L38lMkrMQTZ3DpDgI0KRz
	 SR5SuBrZDXEUlS7hlui9aI9YZm5VaDqZfrNDfi73ECrt5+LU4iqcvc/SJi+RIeztMx
	 Oc5BRkZZ3Va8VqNO4KrVzGAzk+HPBHyinOxwFY+zI7QO2bvPZO7j27zxhEZwou6yzI
	 hMuqzA//KH4fA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hvzYN1vvLz9rxM;
	Wed, 30 Sep 2026 17:31:52 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Wed, 30 Sep 2026 15:31:53 +0000
Subject: [PATCH v10 6/6] rtc: s35390a: Add synology quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-rtc_s35390a_int1-v10-6-e7b1cbc50a7b@posteo.de>
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
In-Reply-To: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Langer <michael.brainbug.langer@googlemail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=UeH8IT8dr/3TVi3DglHaZFIOqlvZBpR7RvdSiyHbxgg=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqvStfj/zX0JPzILdG+u3jmYAFvEMtb9Es2Yfpy
 nXEW81MK9SJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCar0rXxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9L5qxAApe/ZSEgwmFs0BanfqNGU1LwJXE15vw/
 88+zbaMSH0dPJ2CWvIst2XHQhHpMJ3XYQ6gepbT09BCXWaKdkmJ9+TV2OGCphBV5XojNvzNYObV
 Ez84EmpOxPj1dWoR2UbYreZIVjISbUcc29I3S0bzSdRyzPiDCF9XkrHYBgd/S/LsERooZ3esJbG
 H+sl0cnMkJ3JwLhxUipJDrll+Ar0jLvF8HngWjo9lYXEPRaxzaRoWdm/bLaC1C5cyy6T145pDwC
 EDEZnV0dYuovXbdM+0YZ64j6nSWgYW1Ijqxz58Pyqtm2JmxdsHs7A8Sz4H1R2OTAnlKXlIbO8Ws
 vfdcTOmm9OPas0v/bYtbfZrxLA5aWRYp8EtZ3ZFxWPNzNiz5eiIVImPfvBQpCKEHFJLO9IKRL1x
 MvEk2caN+kS6yulMmPKmtbzOGNWd3Od/CKCfIKY472ZjSMle3M3laANT49NkuXvNFm9GFS0VoTI
 JZXqKBRfJ2dTplCU22h6V9c8ef+3pzPMVFfdDN1hYWgr7u3k8H/IuIMN0xKdgEqfoqToeNfWxDf
 sR+HGIFbRq/YEt1+Yl0EDKoyiLCOZvqIoknYMxmv189PWGgYd71fPqxTOwY+ESpSpnvC3qU8Zjd
 Y738321035CSFw/Ng7TSAOkQOQO2baGfixxX9PyAjti2OYdSdE8o=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_163205_986887_D09930BD 
X-CRM114-Status: GOOD (  15.87  )
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

Synology NAS devices use interrupt signal 1 for wakeup alarms. On ACPI
it is not possible to configure pinctrl.

Use interrupt signal 1 for wakeup if no pinmux function has been
configured in devicetree and dmi sys vendor matches "Synology Inc.".

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/rtc/rtc-s35390a.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 649d36d37f1f..d3e829052927 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2007 Byron Bradley
  */
 
+#include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/i2c.h>
@@ -778,8 +779,18 @@ static int s35390a_probe(struct i2c_client *client)
 		return dev_err_probe(dev, err, "pinctrl enable failed\n");
 
 	/* If no pinmux function is defined in DT, fallback to previous behaviour */
-	fallback[0] = S35390A_FUNC_IGNORE;
-	fallback[1] = S35390A_FUNC_WAKEUP;
+
+	if (dmi_match(DMI_SYS_VENDOR, "Synology Inc.")) {
+		/*
+		 * Synology uses interrupt signal 1 for wakeup. Since pinctrl cannot be
+		 * configured on ACPI, we check against the dmi sys vendor.
+		 */
+		fallback[0] = S35390A_FUNC_WAKEUP;
+		fallback[1] = S35390A_FUNC_DISABLE;
+	} else {
+		fallback[0] = S35390A_FUNC_IGNORE;
+		fallback[1] = S35390A_FUNC_WAKEUP;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(s35390a_pin_groups); i++) {
 		if (s35390a->pinfunction[i] == -1) {

-- 
2.55.0


