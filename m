Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493EFCD13D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=; b=QoYNrft+LhIOx+nCxUl6brNSR6
	R1DjUs6KIam76APckMoC7VvsWMBtVbWfW1mY0ENPzV6SyoUGZHEsv4oLeQlg5jufwMkGGNDWKekyj
	ehQfyD4XgbA82F1iSFyKAqJycx/XLwA2wZ7cpmdO3V//i+t7JX5eaFGVD8v93JdC1cVvKPbs5Eysv
	oYXWMIZKlfe+0yE5vgA0pgmoWcivsxQhsPhkx6qcUxlztSFqjm4oyA7tpqqBtcK9DFa35erazXWV4
	hObjn7S+xJpwcgQaY8+nBqZBJgFRE57i5GsgxrvC+vI27YdCuXvEue6feN2NNy+Gibozx8WgEHeMt
	qtlCzehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrp-00000004syb-0cJQ;
	Thu, 30 Apr 2026 07:31:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILre-00000004su4-3EMg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:31:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNeV1J831469
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=; b=iXSSTh4vb6vFfiGh
	kAwA7D6gzyp8Z/21HeaPenKEgwmXQ+7vcmQ2L1C5Q0QKqBWomHzLkSTPydNZX/a9
	kGteRX7ZG7Nc1u0GQ8Oki+EvuZ+TMevrmbLGz/mkVEGLtb4fnreyEHaLgZAuUbWx
	lztofw4C8QEWbGetGAfcNi1c37M76xDG0ISgCLtl81jSqE9A+lkyyVOmpUmjkA0C
	MtoqAs8ru//DaFBhEzo0DkLwAVMwD/gsqcj3foLE0FN6Zn8NdyxyK6b2VmKMXJf/
	qUotdgBsOfJX9NqSiEEdk00iSWhPnIkmbm9Ws1xWJQMdzn4IAB07xPNiLdYtpTge
	4QNGFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duuvb1d7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so34443381cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534273; x=1778139073; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=;
        b=KWa0HCNnkAKEQbKSZX/uah/hSromlQkYBJypS5DhGbqcAErWpYuT7Fw6mxH5XT9kdr
         PUV0USEwI5tMcoX0liMU5JZ1/iuUY9za6elHjqSzKpIGZLwL8eaV2uUtzKRvHjdU52TY
         QS252AZpZHwukeCz76fQnbWMdUsaY39Y29v1+TqpctSbfCKhp6xoRis5um54Hv+KBSCX
         0+chqzFlExAVrZA4aCOgzAUCWj25cpbGV6HIlBmlVdJVJrl+ShYCMOSvvFbPGbLYRPKk
         hLmxeDNad9b8TtqfVEC5JsgsiRiJBdJ6x7ZFfP/JQzo5b/5UG4GaNbZUCy4JSADhKVb/
         Y2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534273; x=1778139073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=;
        b=dd6hld49ZtxGsIYMJFNVWz2q3/Kd29uiRlvfwOpLr8uN8xvlOiFwA1Otptgtx56tds
         xrhFzHfHG1tygKZq+IjDwveA+E9iNFjj/L1SXqZO95UbXsTYbCVODGZB96JiR1OgIMie
         4vth8HHqVot0u/wpLurK7tT6IPMZp59ZwawkGRJ0i2vJIsqcaeBjB7oZ8fFfxMOPXt9G
         ezQ3U4syD7JpydnW13fJe1sX0R1c/QPwmwMhSUG1CQTSHNg9WnfUfDNzS/cKHyd/yq0k
         rX4Wj4h7iA6MAEJcSyomlC/wy+qd9bWP6NWiGDosWPiR6s82lE9EpKKTDy/5ak+jDYKC
         8U0w==
X-Forwarded-Encrypted: i=1; AFNElJ8O8v+2Vb/VI0Jgmg1a+Lbm9oQe6hlMRCvDvQvgd8y1kWJAtnAFeDhuVwPDfsQAr2KNGDKV66R/yYh4IGuxk5lO@lists.infradead.org
X-Gm-Message-State: AOJu0YxTu22PKWiIZ2750qjvf6j0lCaIJ2MpxYqudoh7+bkV0PWMnP3r
	EGRcO2z/H9NZIvlX4EfrF/7OrTs9UsvbkyOVp9g08AY8Z3bggMS25ep7DmUMw7Ju6KnMrhwusZ7
	tVF29iBrPjFl1FyOfQY97YYUdx5LGw1ad3+CrjVCXgjTg4erYqedDK6rYkQGkm+C5Hxllz8rOjJ
	dpHw==
X-Gm-Gg: AeBDietsJM/gdt4EUeXYpBgsoo7t3pma6MOTlpvb49J3BBaC9p0vrIoubRTLj9APxgR
	r7cCEWIF1SAVLrY6JeuIrifhrjbmxrbKYNx8xVGtfq1b8zSm/famXBrV+qiMg5lTD8gIpfH/Ilq
	/gkpuklzsEzAuyJ0+973aRRLWK6Cf9YFQqUzXdmhLT1Dx7wD+SKHat06dL0vo1wLOM57/l/Mqe9
	ywPMM0yjqgLx1DnGZ1w0SYAmR1vZicj2ExUBuewS+LjVe/FfpNGBel3knD2v5R2DW7u/TF+4asM
	TQMMnW2DkNDuqNWFDIfqwN7k5C3QqbLvXGfpcgCM/tMLsE3aEnpumAspEXvAUvbsAkdUXn297RK
	iQSveGtev17lLNOHD0wOHlXUyrYny7xBD3aX2vMMgMrPHH+qlrwnLdBNp59MT
X-Received: by 2002:a05:622a:8310:b0:50f:ad91:8906 with SMTP id d75a77b69052e-5102d1d0a24mr10843901cf.20.1777534273182;
        Thu, 30 Apr 2026 00:31:13 -0700 (PDT)
X-Received: by 2002:a05:622a:8310:b0:50f:ad91:8906 with SMTP id d75a77b69052e-5102d1d0a24mr10843571cf.20.1777534272725;
        Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:57 +0200
Subject: [PATCH v7 3/3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-3-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5847;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pyDEdb+DFpm5kfoA02KDZuG37h8dk0QejYiq94QeCKM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU5rMnQBJz9MQOuwsfHvKzk9TQeTy+CclUe5
 LDV11j9LyaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFOQAKCRAFnS7L/zaE
 w6hcD/9Met5lWK+MDWbROq9YzLzDfujaXzdRBbxuXCaavNyZhQmEfv/U+bWw+i77/2KlKNliaR2
 mYBZUQs/OpbpBNq9jKsGJZjwCWW/1aEcy7c2X/eyP2iq4FXmoEPHZkj3ltT9QJ3udfABH4hw8Wo
 018RnDbk8z9xUAnKuSum8A+NniE3hfJXwBLw6VjE7BA5UGGlI2S4GAmEXl9JUt3FlO2LgF30iDa
 xB3saThymeuMvomarIoKz9FcUwHs0KckUm1Xl4DiElrJigGAr+AdRWRrc0RL0D6yRKCqnkiflop
 xGgc865Uc8rgB3WgB8lduMcyyXpuw1y0vBCGKnsGbZuG8q9rhh3ssdN1EeDGVJYFhrit/6ngzQr
 Mfpven0EgQTTUhdM14DDGOIdtpWhpGOyN8ueuUo+qP9k5MSwJ1wSL/9zmhW4pELpX6xJUC8ukox
 g68m0nQwHuBRBOhcEOs5Fvo34JiloV/rXHkJ8BjGGPE0uT2EBH8zfQ9fsrXogU9UdrUWJfZhdQ3
 R3rPHCLN6VJVYGkeAc5oIuWOElGdRTQzUkZdYl4oQhyfm7HNz+5ANBngLQUbo/EdeWvsG7JMObb
 XHItXUfIMSoSa67NSBCrfwh5U+9wWiMjCHNTD9aQr0HXPyod+PrVkcaqMbgNlEL4KiA9KsPbTuX
 lOwLagATYin8gBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6R9ZaZT6kz6fuUdtLCctwvY0Y6wjZ2Dw
X-Proofpoint-ORIG-GUID: 6R9ZaZT6kz6fuUdtLCctwvY0Y6wjZ2Dw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX16pvyiXFMQkX
 5keQkQuyjtKSziCgTCkb2pBDtLfnUOOXlzzCIy1450iLMiw47H0HePvzNC14NcBGRUSK0qbt5pU
 9fZgLw/JqsnyV1P/lCocr00b4siyuksUEtsUxaJOuZ25cHplah8i7+iFyhNin2zaWP87Yb0wKip
 dPKzl+8tfC2A8++mXykaxex252pdHJzoembgfJ6TdiLmjVli+e1uCZSHWEFFDSmQ4YI47aVPkLL
 vuhh8Jg3975KeavAa8DeRHH4zZuC8ffldwJlFLfa2Y8MKNRYalglncCMcIZzSP+CcfNHinYGuBJ
 jmFYOYeoOtEYvPN+Gymsx6gjQLL6uIYOwV5/77LqUVEmKZvy5djp2fZVlERZWo13lHOxhEQI89o
 GqsUw4tdW+yi2BGTgLbq6P82IzR1SJwZdpWjn+4az5o25vKak7UD9Tjw6TAxHbnX+HgrgLX1dMC
 36Xbtm7RLQWrihWYpWw==
X-Authority-Analysis: v=2.4 cv=V+JNF+ni c=1 sm=1 tr=0 ts=69f30541 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=8ufHpPoMNYqLVR2KE8YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_003115_821955_E77FF8B2 
X-CRM114-Status: GOOD (  20.79  )
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

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-nokia770.c | 33 +++++----------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       |  7 +++++++
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800fe17b430e84ae421ffa8da2bb11a0..72d9e92a1071743cef0020fce750288382fcb0a0 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -36,27 +36,6 @@
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
-#define ADS7846_PENDOWN_GPIO	15
-
 static const unsigned int nokia770_keymap[] = {
 	KEY(1, 0, GROUP_0 | KEY_UP),
 	KEY(2, 0, GROUP_1 | KEY_F5),
@@ -112,7 +91,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 };
 
 static const struct property_entry nokia770_mipid_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
 			    13, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -138,8 +117,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
 	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
 	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
-	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
-			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode, 15, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -225,9 +203,9 @@ static inline void nokia770_mmc_init(void)
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
@@ -318,7 +296,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a06c18fbc70e7c94a161b487cd002..c0f6e231fdb4422c5d2c1aa3e33dd6dd99d2710e 100644
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
index 9cca29f860544ddbec3734cec9b3246ce468543c..0f97972fd248d29fcfc1ed2a8ddb76a6d89f1e7f 100644
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
 static const struct platform_device_info omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
@@ -62,6 +65,7 @@ static const struct platform_device_info omap16xx_mpu_gpio = {
 	.size_data      = sizeof(omap16xx_mpu_gpio_config),
 	.num_res        = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
 	.res            = omap16xx_mpu_gpio_resources,
+	.swnode         = &omap16xx_mpu_gpio_swnode,
 };
 
 /* gpio1 */
@@ -98,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio1_swnode = { };
+
 static const struct platform_device_info omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
@@ -105,6 +111,7 @@ static const struct platform_device_info omap16xx_gpio1 = {
 	.size_data      = sizeof(omap16xx_gpio1_config),
 	.num_res        = ARRAY_SIZE(omap16xx_gpio1_resources),
 	.res            = omap16xx_gpio1_resources,
+	.swnode         = &omap16xx_gpio1_swnode,
 };
 
 /* gpio2 */

-- 
2.47.3


