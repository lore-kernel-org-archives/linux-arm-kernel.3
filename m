Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCDAEB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PDGpXXd+WYqIC3XZToRU9plHqBK8VSdCl2nLvQovpI=; b=Af31d2DHJ0JMh/aaYXnEEFyTVH
	GUf2gD7pDh/p+pEsQw8XdFpVmnnYMiSEtfWZlefaDmMrh6K/NZSe6mf7DFWQQfEowQD7V4Ro/23QG
	MxTUfWNjmMPn7VF0dvnib4DQqybz0wihyfg+XhHtzSaQHkJs4kc+PlvLkiLz3pbe24QjfkfuwwtFa
	qCQpx4RO27t3OXTnKorUvkZ2/G5yP0/4FRruM+qx/0zMoiENVRCUUehrmadMZ0txIWrG7137MWzxC
	dsKr/9LhqqJti7paR4xfXuEYJ3SmnfSpbC/r9s+MvirToZGtUhzzuAGD+5LHwwVBAphAPACUWnmZm
	cW+uLADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUow-00000001zgj-2tMM;
	Thu, 12 Feb 2026 11:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUot-00000001zg1-3nWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:25:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CA0S1B2640742
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5PDGpXXd+WYqIC3XZToRU9plHqBK8VSdCl2
	nLvQovpI=; b=aguKT32Zh9CL5EEIJgDfEwKangY/qi/i/qNExPwDzTEdND8YvHF
	uumIn88o7F0Vb63SG/gFMb1BrDyKFLkeMkqQ8BEwqVaQiuUg96yX9eGqmipxMIsy
	GWPMZBQSOgq91zggXN5nGBc9KXGOMdTmBt6MWBAMdB749bxWOEeQLLG34HTzfpd4
	ViTPh8OhQM2QoJIOOjU/3OMN2cTzjWETV3qk2VL9D0pdgjLQXiUbH13vGWiLynUq
	WeuJBzGRiY++Fuge3CGsecO9PXD0+ACT+0tCPXDNHyzxxu8f2k5tv+JWhrsduCBO
	XOukPyc2ehgUMoVvSpLP/tzk2F4zPag8ejw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90d6tf50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:25:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so2202172785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770895513; x=1771500313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PDGpXXd+WYqIC3XZToRU9plHqBK8VSdCl2nLvQovpI=;
        b=etH3yfdfo9vhXDyAgSvFuKP7OmEc6jCdGZdRdkkMhXc8qrVJ71trjXtd5JxdPySNg1
         BSYwHgUUB0hHykay8oe+PEJ1iGNPSNT2hKvjgKbPUgUfrFclQgSeMMCEFV+noON3yKHB
         isFRrELbrBZ+pCf5tJ7f/KddsLzEXaeEVo6egB9Rbk0khlukI+qCoZ7fPSrqSFOOhd5Y
         dqVfEeAyiJ56TBY2aFpCWuKdsMo4ky9jt00y4p0NowYlPcPIGBSvtXSk/r5QHFAS5sD3
         iJTDde90mYYOh8QABSzrMkAHMSJpPPXX1A6fdvTAHk9LVyTnzz4Npjn7rxH6AkwEHSAK
         d5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895513; x=1771500313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PDGpXXd+WYqIC3XZToRU9plHqBK8VSdCl2nLvQovpI=;
        b=ZiLQsesVCJYZqlSYGG+x9uH5jrgZ63X3VM4HcxDM0GrVh4Xs0IbV6Wfr5atTmQ8Yla
         B5sq4lrcceuUmAPu3aYUgaTctvu/3YfrX1TjpJeASPv3WfDohy2+i4akD1uIs/1QFU65
         V/ZTOePCSxQA+oWZ7fmopsJJSsm5KAFP5Qvs/x1BG2vtT+UxVeMztkAkXv1VTPIQgBiU
         ktQ/QOKLcxXfTM5EBb5Si/DYjowxLKSNNKwX9G47Ss2LNs74EL6+u0Wmn2XGdpehEyA5
         TT98Q4NRY4hMKC6px3Zvx6Re1Yy4Ew8oq2wLHFWamwQ74yaBSJszPsYDi0kxkE8pXYjm
         i8fA==
X-Forwarded-Encrypted: i=1; AJvYcCWcmdRFnDXOU4fD6Ludjk/drI8rJIXVi/1sNnkaLVcFprLi2k4rMSN5LI1PJnWWwMV2ClasjzvoO5TLr0vms02F@lists.infradead.org
X-Gm-Message-State: AOJu0YwyHvFvAgrlTu5fRLJjI1vS7myTb5ln1+/i7sPpaLzLLU+vPJMd
	GAJFw2t6CqW6sCyBsNX6ERfvx8Y0kHlpn7Vs10PnJ0CtEkIAOS8qWiqFgDq3quG2YaRpGAe/aU6
	7EImY36Dfw4Ok9vMFOL8ZNT3JJrQjhgnOhJ0ItYoYzv6SPUWUHYzcBl05tIvRn3uYB8B4YrhY7A
	B+QQ==
X-Gm-Gg: AZuq6aJyeOeWjZH7k3iZlZJSlVm01OwPI9GveCpRjC8PkPXLS0R2H8Cmt968+aoirDY
	oxdumsqJoOOFUaY9ReqGdGbsR0ZGfpR+n0JMcwywr8fCp5YKjaZrUQbNW5PT/Z54RzXFZohkwqv
	ETN7/x5dsfAlF9LLobnofdDe4brBqzgt0T3a8aiGzk8LsPJ7Gr3f39IKfUOwd1DWGWzMRRAfWa+
	dq9/4uRHmEQ//Y5lltnnGFwqC/PmVWdoy3kAaCQG9xVwvwHNQ0QmSoN31UxQ7er2z+5OT3jEQ7d
	j+ARMN1udSFPL5kY6ZWEN4t7YDHNUddMdTi5ifEynlC/+UAv5Wmt71soVux72rPEB5kEzQmr8BR
	xpcORF3S2SR5dKAZ7h8raZMgMNRpX/KyaCWijh6J8vO33xmu5Iw0=
X-Received: by 2002:a05:620a:4112:b0:8c7:fdc:e87c with SMTP id af79cd13be357-8cb330fd638mr288562785a.51.1770895513071;
        Thu, 12 Feb 2026 03:25:13 -0800 (PST)
X-Received: by 2002:a05:620a:4112:b0:8c7:fdc:e87c with SMTP id af79cd13be357-8cb330fd638mr288559985a.51.1770895512532;
        Thu, 12 Feb 2026 03:25:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:afaf:b495:9036:167a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d4785fsm11453572f8f.11.2026.02.12.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:25:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [RFT PATCH v3] ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
Date: Thu, 12 Feb 2026 12:25:08 +0100
Message-ID: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uxxza4rydh1aOVAfhnKU-mASoMIyrPEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NSBTYWx0ZWRfXwyk7EGxkwVc5
 lb5OGIMi+/nO0nzf9kjdSAo8mtNHh6hae2b+vSFXz7SZAPslAvKN/WJlvpi4qbGdVA1Tme6l68/
 kN3drjekwWed47fqX4gZaINs9jyJM61Cw0mp5a5RsjrWNvT07wONL6v07M0Tp9cXYFnWS40rDIU
 IBtvOCrhWRO7Hu8voRZD8cB1InOE80Co0+PxpaOQXO+V2pEQ+lbjN9jdWxz2C9RZ+9SqXs2m63+
 SszUUL85AmSRok9n2gx1dBH/4nyOcIHmKjxw6NXUVn8U/wNkvy5GC7p6GUiz1klxwesyn/b+jzT
 sZmO6D4CxmbivQqc3jl7r0XUdp0VBzIbOqYmYMNompveEHQB0SqW6NzFsi45igBvUekdMpDdL5q
 UtsUl0CcT7HZ+8YUs5cK7ndrWOvYTFlY1JXl4jif+RjpGp9hHgu5ShVy9NJHiMq+sIMHBan+Ymp
 fWx6faOjGdxg8GImKIQ==
X-Authority-Analysis: v=2.4 cv=ZaMQ98VA c=1 sm=1 tr=0 ts=698db899 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AKYXJijLabmKD37pI5EA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Uxxza4rydh1aOVAfhnKU-mASoMIyrPEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_032516_060772_4816794D 
X-CRM114-Status: GOOD (  26.43  )
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
Changes in v3:
- fix references to the MPU node

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
index a5bf5554800fe..46f817f6316b7 100644
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
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 9, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 10, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 11, 0),
 };
 
 static const struct property_entry nokia770_cbus_props[] = {
@@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a0..c0f6e231fdb44 100644
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
index 55acec22fef4e..177621cb47844 100644
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


