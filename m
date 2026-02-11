Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D5E9E305
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oc7w6KRnWeD4Y91Cp46b21ZXPP82c/8BhiJcCxFw6OQ=; b=f128YTJyVarmRZuYMuN56utiaM
	73QayWGd08gx6+GQhWoz9FM8VrE046UEQ9InfjKqY7IDOCvIwExFEYFZWFSL4+m0BK38eWBy2P/Lx
	mM/KqS2KzzVo+pMIf26lKuW5MtGy0L/h54Jcccpn6ylBW+apE9vu551sKhKM+XGDec3MAmNoIvgRH
	80611Q04FtBNzdunfoc3s5NDnTcML8pEzIk1nLSZDdClyCmd5Ls191g7oNMt03FiyKOJl83MtfBF6
	qUXx1UHn41ijN4uz43UlbFEA9aN7IpI/5roDX+JfN/3CYfk9fcCCJ+Xlxo3SWOu4s3vVQe2+qo6A5
	n83BW7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqA2l-00000000flB-0ljq;
	Wed, 11 Feb 2026 13:14:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqA2i-00000000fkZ-2v8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:14:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8w1hG3320981
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 13:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oc7w6KRnWeD4Y91Cp46b21ZXPP82c/8BhiJ
	cCxFw6OQ=; b=TjHMslnwA1GShAvUkxVOTp4sdahdvLXPXLm1K24argbpNcTvfM0
	n926lNCZdyfhS66+BlWmtiRkeaOc9oPm8GGHQB49ec4z7PcaK6LP8+9aCfGY07dL
	ibTcd3Ae7v4fb57mqqOxs5KLH+UPfcksDWrHyaV6BFnB6JQ76TsrStCQTPCYGX/O
	dNXHrj8JWbk5LMwgRjTb6LiNSc0lDBb3pRU4iqzd9p/cSJ/U78cI2H/ltFW7UBYo
	MB65RIWT+F/4C2HJejuetC0o8KMAPknSPs+tSUjNf+9IU2rPZOj6+1jgxekbjDLx
	ak8t2QkF0okg39GaAoQo7ODMqUobd3nWs7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epsj6f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 13:14:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso2458831485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 05:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770815643; x=1771420443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oc7w6KRnWeD4Y91Cp46b21ZXPP82c/8BhiJcCxFw6OQ=;
        b=QWzQzWZvkj4rl4GEo46d/RY1rDOOvDyIKUNgeKcQoNGVHrxcSKaymaY4dblXQ/QKjH
         hZJTzWgcWKBDYbSWZa4lTwG38ssRJxuo3t0eaYP4h6aCdcokKYU3+4H62tVldmOlkciC
         Jcu9Ebx4RFWmeHNBNpUyAGkSAGy/xoIUXgadmxEWHT4BQgLgYSIBRCdb/vytGRvlUBdE
         wmxiwndQKmnttVkar51c+LW7LLouze+x0FriH7O2bkvXFEd9YVN7RliRnpoWPQ9ar3vT
         4Tq+RkMDE/KfpuHRc/r/71Os8jDuoVVVo9SGlBOcSWLR/13ktG8c2bt6JOzQ4XCUYolA
         Z3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770815643; x=1771420443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc7w6KRnWeD4Y91Cp46b21ZXPP82c/8BhiJcCxFw6OQ=;
        b=OVCeET8shUHXCWW2KcDkRpA5o8KCr0X+jetHbz9sbWvDv3eh71gDBp56KU5Ur1Hw+P
         P8XZNxa6v9+uLnKt6agB/8LSU5Cp510L7RXjMPzJv0t71sL7F7lqekMSmtaXIgLmGrdt
         YHa1eaYxe7nnyEhMXM4TR6Ebm5zk8BeJxdvjIHZYFWrL/xfSwN4sOAJkIocGQ8g4/tBj
         rwS2GVWGlzJoC9Kl8hLpDAii1lm/Is60lYuqi+HBTkqd9lYPlF7OP4sYR3zOcQ6sboNe
         7JUxHD1n6P2vo4zLgPxxDIaEHUBjlXPi/Hy1Wh/tpllPxq530LviCdVEsQ1sFBobTMHu
         FNAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnzagp9Zf44o+eG/gjtSrq75co1pa37uB7BpjiiYNW1+5061MQyJh+A3zfOc5g5BYKINbVSr+PoaWkBMVdgOxC@lists.infradead.org
X-Gm-Message-State: AOJu0YwxAgmKCavJSZjxhS6VCfeXmlvqeDRLtjsD1WB9lRfWme7mbDV4
	AF3IsQg2rvc3+Rm81UfAyWdvB4Ks/s0KX6DawFroRmg6O9a/ZCaueHCfBK3hNn4SCexN1+jgWw0
	W9vjc43/MDBd7N6R/Q0Rz/IznvGvXNGbwYwFmW+bYMDqk8loVoTvekQBSewVB6v8BcrJ5E7g/8H
	pRmw==
X-Gm-Gg: AZuq6aJro50hSvSpY1lL+glO5bUfRxXmnyz8Zt+eDZqD48103gpNQ1KyX/KA/lFH1Yw
	QXeDDRTRbEO0oHferfYd4f7B1fDZU0Le2kkSxdIo4r84eJZSSpJdY0Y/wJqUA9LbyXvujtYmDkg
	Cfvr5WerydSusQs0mQpqEUcoyry5cf++yO1yXHpq7OiwmUcClKy9WN2Q+OAMqaXrWcCsISZnlWm
	6HrJno6EnEh3IXWOblChu6vwU1LCYTey0RpK45EdxM0iDDvxmo26iFXivQHki/qqiUfOshepzHt
	tcRK+DPGvkoxj5muPioWeAXL4fQJlLQlOr1bK8lt07GEFgFSZlSSDmOC7mF9bnlUafyjbLuan6X
	Ck3Bk6hjQkwugfbJdqAklXu0LOIIM+0GcNqdl3X+QCxFgdT8/lfY=
X-Received: by 2002:a05:620a:1a10:b0:8c6:adfc:48f0 with SMTP id af79cd13be357-8cb27fb7e9dmr366247785a.28.1770815643198;
        Wed, 11 Feb 2026 05:14:03 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8c6:adfc:48f0 with SMTP id af79cd13be357-8cb27fb7e9dmr366243785a.28.1770815642713;
        Wed, 11 Feb 2026 05:14:02 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5a57:1eea:fbcf:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm137651345e9.7.2026.02.11.05.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:14:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [RFT PATCH v2] ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
Date: Wed, 11 Feb 2026 14:13:50 +0100
Message-ID: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwMiBTYWx0ZWRfXzkRTwa4X8qrA
 mLfqS7NWa9A+bfTnmWdAE8V41qmRksXbYYT2+B3WNkA2jZjd3jHlGP00I1CIx2KHc4tbtwFMjqv
 ORZmWxLHkmLnYhaE202dc7UKC6xuVhSjeLbrRie9Ay9Ugjif+Rn79BIKzBNfRRf0ZqIjaru9l/s
 0A2nT55b4mCcotzhXs2S4iV+2s93dvuNV7vCkD2j+k/ieeajL9/C9h8Irj+QQn1bN+PVYiyEs/S
 Z3UUJviNHEwrog6FcmxfJgju2Q/P7+4BzLJcNS2+/BZRj+Hvlxqrfy68VdhoHA0Q8mXXXy8iuEt
 hoKz9e+73/ipQDd3SwKf2eiVO0cIbmAblZP2of8O81K9if5H1T5ndiAy++YT9F+pPS7zsYFBq2e
 KMq+/4flgItZEBtJg7XwXsks47THQ/cJdg29oNwLuxI6IO4mdOyUG/YNdGtELpFuCdUHZssD2lU
 dOlbOfxwisZtisLJaGQ==
X-Proofpoint-ORIG-GUID: um3dHcF4RIbqsMev_9WDxXfjYMb-lZQb
X-Proofpoint-GUID: um3dHcF4RIbqsMev_9WDxXfjYMb-lZQb
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698c809b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mL5-Ybe71cLVbzrCEFIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_051408_883200_017914F8 
X-CRM114-Status: GOOD (  25.94  )
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
Changes in v2:
- fix build with CONFIG_I2C_CBUS_GPIO
- only export the two symbols that are actually required by the nokia
  board file

This is a follow up to the following discussion[1]. I don't have the
hardware for testing so only build-tested it.

[1] https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/

 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-----------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 29 ++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800f..a840934d4d15 100644
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
@@ -225,9 +206,9 @@ static inline void nokia770_mmc_init(void)
 #if IS_ENABLED(CONFIG_I2C_CBUS_GPIO)
 
 static const struct software_node_ref_args nokia770_cbus_gpio_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 9, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 10, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 11, 0),
+	SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 9, 0),
+	SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 10, 0),
+	SOFTWARE_NODE_REFERENCE(omap16xx_mpu_gpio_swnode, 11, 0),
 };
 
 static const struct property_entry nokia770_cbus_props[] = {
@@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a..c0f6e231fdb4 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -35,6 +35,9 @@
 #include "soc.h"
 #include "i2c.h"
 
+extern const struct software_node omap16xx_mpu_gpio_swnode;
+extern const struct software_node omap16xx_gpio1_swnode;
+
 #ifdef CONFIG_OMAP_SERIAL_WAKE
 int omap_serial_wakeup_init(void);
 #else
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4..177621cb4784 100644
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
 
+static const struct software_node omap16xx_gpio2_swnode = { };
+
 static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
@@ -155,6 +162,8 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio3_swnode = { };
+
 static struct platform_device omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
@@ -183,6 +192,8 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio4_swnode = { };
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


