Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1B7E9E2E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFOHX3QhsTEHsBp+8Bj8FeFIaQREW/GahrFWdSGC1Ac=; b=jNtxa99EZn8OaIhB9zC/Fzou9L
	dcnY/WvQPJlpgSGNn7JWSwowSgOZGKMdJM60lt+z6TikM0uRZ5W9SBQLsp7o0qefAVQ3h34aM8fuM
	ebW9EjDlo3hp4E8N8KmM4S+wNMmj6dt5sprGq7NvoU25AI/ULonDRMsOtcJUrhjlYLAfeFuUeALGs
	FQ6s/CuRmtc4gAlcjW/JYj60L1ptXDSzr0Tn6sVR74zH31Bg1mjMfvtVqiohKH38vuvu5qlbeHniX
	0w/MQXX4xBnu3QMPsXcQH5UsAE8NdQ+0W+GcvBba87YAUX/ybTqXtUE8YsHhxMJLnWmbRcwx+w/tG
	02rJ3mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8Ba-00000000ZCw-1tQ9;
	Wed, 11 Feb 2026 11:15:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8BX-00000000ZCY-02Cq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:15:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B47H444013953
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GFOHX3QhsTEHsBp+8Bj8FeFIaQREW/GahrF
	WdSGC1Ac=; b=K92mR5gpg72mdc2VdRGSEfvnFJN35ZqDrumWFgvOFeVgj9+eLkl
	ynLTVJ15ndzNJPLcfC9J/pp5XWwA5U7lkz6XaIUhbW5J/+tfE0KRaQZiKpsrARFB
	QqnsCZ29joa/z/3ZD9abwJ2w7hBLps2cOZLDjlFFOdbr91ve0uaXMSUtAqB8mN41
	ZAJs+l/8wH7C3i2XTsARgHZXbQswEx5B+e8dTF3B+xP5upFC7E5UGePjyVqmSkze
	xqFZ6GjfEAe7UotYkqLGG+ylyOBV5spPI7LBMoa+zpdh9delr1121uXH2jhKlhNU
	dwmIKpnS9/7VFB9q+P9zpBqXBiChbukP4oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8aadaseu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:15:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so2018293485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770808503; x=1771413303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFOHX3QhsTEHsBp+8Bj8FeFIaQREW/GahrFWdSGC1Ac=;
        b=AclQEaI/S5EdCyfoI/TwaOr0arw8pP7UvgpdWYJ4ROJQZezIn/cQlnyW0imWpkhVW8
         FnD0FiNisgXojW/J66aZkOILaWJyxQgWWiv+L95izRzikY3SGAkiubbIBE3nna0OVFsO
         +69VtyY4/wmX3tgWuPV/0qjHQbE0N1NZteMoyfKZJdpvBG5jGIa703yAiBzOvb1kp2Z7
         CholhMUUyjWxK90xej5svHc4oYQek6fjKB96vE8VCJIaiCKCmCWI5Z2aNaSP094E88ns
         aQb4raavz5TiDZWt3f8/13B89LAIK6J59aqYCnDahU6TLYcZIRQuamZ8BXpXSMtt+SSr
         mzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770808503; x=1771413303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFOHX3QhsTEHsBp+8Bj8FeFIaQREW/GahrFWdSGC1Ac=;
        b=fz53iZGoNyAuBrTcSoDWHnQIJkIuaqJPXoOn6C6hm6W8tIVBL71ZxesdfbR3nOGpCZ
         CJnQkffYO/z7agCKDEn6QLEZgZI9UcYMutfvqxwt5cbtZVBQnsArrTy7aWQMFiOahUq0
         XVlpUZYvAstt0dD+OBct3aet9S8ypATW77+NZ55OgUDSZrTduXs2F3m3J6q1edPAGJmU
         J/GqSPQAEd/4Qy1pNZC6IN5X/nZTKAUJlkeHFUWnHKLIKkZYVWfkPsiCe9od/0fBV/2i
         MSChekkrgFs2Nz9NhKNX+HV/Rj4Ji33TRs+3Ke6zXapdT6XXb1j110gM67F9D1686+K7
         go3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSa8kKrihxBf3liZZlu0gHkUnLgaVcF1D4Q56Q5+TB1KwabPfITGOs93/Qxe0K4Ib67ros8QlC2n0W7TmVB9We@lists.infradead.org
X-Gm-Message-State: AOJu0YzasD31DPMvP6lHZm0npnmEluvbFagZba43k0cp1VYjG+OeFWHE
	r5dhV16iAKCTGJo07iGTTc5DwsvQA5TPObhtefIUGUHoY8sO9bWSv5EO+Y5eF98GBa6TxdHsHoQ
	+ywZWtlphrAfguwiLdYB1fPAC2th4gAyUeKGIS4+v1pJPwWI4QeOYmrW1CttKcHYGzgfjW9DnDt
	hTGA==
X-Gm-Gg: AZuq6aJMIgX72gXjv6amd5/RkfIj4hqGN89u9iYr+Q8mUkjdG50ROsuTU7NZVUrX4Vx
	scFxgStyOaTMOIT2TiM4sZG9ibbS0UxAGejECTGkYF/z4n0uvsLeS0hpz6676IOOBpOZI30L4v0
	5ilnXPNnZCblSgz7+P+qIFqqV5M2L1BoFjWBTc9BcW+vfYmjPurRYsFZafh1H2U50yk3OOAUU0U
	sml8Y6KfRlE7uHYRR44T7wsZHtarvAMJ1mTq2uKsMurK8sx1RfMAmXsNFa4Pwp1wi/Jn4GLlkrQ
	y0Bh7yYKZiHq8SZJdv9WO6f55OaquJ/EJZAE/0iN5+Y/atMZXTv7nqyXmkBjX4pOcCMKlKsNgu6
	DfHduBLocTRIesu+x5kmiUAX0ryXWOG5TZVEX29nX5eK3GlowHQ==
X-Received: by 2002:a05:620a:29d4:b0:891:bde8:56d7 with SMTP id af79cd13be357-8cb2acfd5f2mr126694085a.50.1770808503198;
        Wed, 11 Feb 2026 03:15:03 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:891:bde8:56d7 with SMTP id af79cd13be357-8cb2acfd5f2mr126691085a.50.1770808502721;
        Wed, 11 Feb 2026 03:15:02 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d772:ba4c:782c:2fd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba69115sm15647725e9.11.2026.02.11.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:15:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [RFT PATCH] ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
Date: Wed, 11 Feb 2026 12:14:49 +0100
Message-ID: <20260211111449.122593-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yiRiVT1K04qMB03ApSQ8PU0RaF2ZhETz
X-Proofpoint-GUID: yiRiVT1K04qMB03ApSQ8PU0RaF2ZhETz
X-Authority-Analysis: v=2.4 cv=OoVCCi/t c=1 sm=1 tr=0 ts=698c64b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mL5-Ybe71cLVbzrCEFIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4OCBTYWx0ZWRfX6/RZs1r+iCGv
 GfDAG6zTa3sBR0LTqwndDdkW13ya1z2NMh9nyEm+meOUcSy1USOAELJ6tmB5mIC08tjUBKBZpDi
 XX4ArjazlmqeAAYcOWvnxp8wRE5Ia9X5PN5DCkR7EVsHGgxOyVB6CZrQyLJEmaV39XO83TJVQ65
 bb4lunpkPJnWX7yYwWZQ46RL6cmTi1ZqTD91p5dvxNEL/YiByYNomqDVwjV8e5318tl8ZOo9jdl
 sPC4lvCmohxQunYD2n2uYAbO9z1+OUOGuJ3s5GKEuEggWrWh/yjWmaoRTYGT6V95FQFHgJyDuLW
 JbqUzsON0F/WNHjwsAZPOCUX5ccw3ectM80PBP273AZt3wyTRH1eVyJfvLlV5mz41eHCvAN4rID
 yjva0QA4Iv2YgYS7ZRIY0W17YBanSQ0BC5vifV5W9oq9u37xHP7L9EObMKx3+cycbIhylLKH9gn
 WPOeZS4spv4uze4GDqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_031507_182854_29A834D1 
X-CRM114-Status: GOOD (  24.91  )
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

Currently the board file for Nokia 770 creates dummy software nodes not
attached in any way to the actual GPIO controller devices and uses the
fact that GPIOLIB matching swnode's name to the GPIO chip's label during
software node lookup. This behavior is wrong and we want to remove it.
To that end, we need to first convert all existing users to creating
actual fwnode links.

Create real software nodes for GPIO controllers on OMAP16xx and
reference them from the software nodes in the nokia board file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
This is a follow up to the following discussion[1]. I don't have the
hardware for testing so only build-tested it.

[1] https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/

 arch/arm/mach-omap1/board-nokia770.c | 24 ++---------------------
 arch/arm/mach-omap1/common.h         |  4 ++++
 arch/arm/mach-omap1/gpio16xx.c       | 29 +++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800f..a81514c6f92c 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -36,25 +36,6 @@
 #include "clock.h"
 #include "mmc.h"
 
-static const struct software_node nokia770_mpuio_gpiochip_node = {
-	.name = "mpuio",
-};
-
-static const struct software_node nokia770_gpiochip1_node = {
-	.name = "gpio-0-15",
-};
-
-static const struct software_node nokia770_gpiochip2_node = {
-	.name = "gpio-16-31",
-};
-
-static const struct software_node *nokia770_gpiochip_nodes[] = {
-	&nokia770_mpuio_gpiochip_node,
-	&nokia770_gpiochip1_node,
-	&nokia770_gpiochip2_node,
-	NULL
-};
-
 #define ADS7846_PENDOWN_GPIO	15
 
 static const unsigned int nokia770_keymap[] = {
@@ -112,7 +93,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 };
 
 static const struct property_entry nokia770_mipid_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
 			    13, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -138,7 +119,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
 	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
 	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
-	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode,
 			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a..34659b5fc6f0 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -35,6 +35,10 @@
 #include "soc.h"
 #include "i2c.h"
 
+extern const struct software_node omap16xx_mpu_gpio_swnode;
+extern const struct software_node omap16xx_gpio1_swnode;
+extern const struct software_node omap16xx_gpio2_swnode;
+
 #ifdef CONFIG_OMAP_SERIAL_WAKE
 int omap_serial_wakeup_init(void);
 #else
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4..6eedb87cbf6b 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/property.h>
 #include <linux/soc/ti/omap1-io.h>
 
 #include "hardware.h"
@@ -55,6 +56,8 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
+const struct software_node omap16xx_mpu_gpio_swnode = { };
+
 static struct platform_device omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
@@ -99,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio1_swnode = { };
+
 static struct platform_device omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
@@ -122,6 +127,8 @@ static struct resource omap16xx_gpio2_resources[] = {
 	},
 };
 
+const struct software_node omap16xx_gpio2_swnode = { };
+
 static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
@@ -155,6 +162,8 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio3_swnode = { };
+
 static struct platform_device omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
@@ -183,6 +192,8 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio4_swnode = { };
+
 static struct platform_device omap16xx_gpio4 = {
 	.name           = "omap_gpio",
 	.id             = 4,
@@ -201,6 +212,14 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
 	&omap16xx_gpio4,
 };
 
+static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
+	&omap16xx_mpu_gpio_swnode,
+	&omap16xx_gpio1_swnode,
+	&omap16xx_gpio2_swnode,
+	&omap16xx_gpio3_swnode,
+	&omap16xx_gpio4_swnode,
+};
+
 /*
  * omap16xx_gpio_init needs to be done before
  * machine_init functions access gpio APIs.
@@ -208,7 +227,7 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
  */
 static int __init omap16xx_gpio_init(void)
 {
-	int i;
+	int i, ret;
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
@@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
 		iounmap(base);
 
 		platform_device_register(omap16xx_gpio_dev[i]);
+
+		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
+					       omap16xx_gpio_swnodes[i]);
+
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add software node.\n");
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.47.3


