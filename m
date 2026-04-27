Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E631CFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqqUHJ/5XZ8IpQaHkA/f23LHDUIE51dJbyQs9T3z0zU=; b=3JQ+Zdeywx7QaC/VDvND+X2SLk
	G1yTWKUHgI27hLu+sTG1UjuNnrC/VTwvCj+FIauMD9JvTO+fVpvTDkLpBctVayl6c2Czv0unOu67f
	fMd0VkMW58JBE6E/SHC1BPH7r3A5Z1vXf/n8wbAnq6rwiyimjZtAFelCQ0WXnopE3PiEXPYB8330F
	ELbBJs6rt7nyy5At6SuEcnMm5MOjXX0K3iXNK+WyLFRi5ZQrSqztao4gW9o9lPzPIu15cwroPqC0U
	WqOxtWoYPtEzRQDtrksjpPZ4j2oEfuam38rTmsgvID2WrfZvcPoy9qGVV+i5H1/xET++mvKMa7Ajg
	/GuWSX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUc-0000000GieV-11bm;
	Mon, 27 Apr 2026 10:47:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUT-0000000Giaj-3Ia6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:47:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3mgv3123487
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqqUHJ/5XZ8IpQaHkA/f23LHDUIE51dJbyQs9T3z0zU=; b=Xlc3hfrRaQX1xhjd
	Gv1Uz0bBKCGHLpf5UHNyHNqbIHZA2aI5pB8+0f0lW4w/qO9VaBI4xSykUd5T3kLC
	ltwMAafV9RcTbxG8rFM9m2LPehvVuTIOFGnw2IcGnmwd7aU28L9uuTntqTahF1X7
	51HVtDrct7UIZZf4LAb0OsP53GjtwKcvgS6Cwsp/IhFifi2mYcUDvRCIgWGbeY8R
	t2GO57mUB8iHTOucH0gkMyIWhbL1AZ9rHfcKIdhpt9PqtNwVasgGiQISyZS2TWXU
	TaS/IVUOoVdNlLynaR/Sk0lXMzHRIZg9/8Af+1krGwTzV/WDoDg1bn4727oxG3H6
	M5fz4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgg4xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:47:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso140475491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286820; x=1777891620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqqUHJ/5XZ8IpQaHkA/f23LHDUIE51dJbyQs9T3z0zU=;
        b=hrccXLQ+bQcqLQxY6AnG8YvYcNy80dROwmjoJYJ2y9xo87gfLnviBjPMULFwPPU9bY
         zKuRFDfk7bfX7bvus9XxBP3UHs6kFDvcOcHRTGI7y0XmNjLC9ggyMTRnLvp30WNoDgRR
         vvcOsrGHUcIsr8u6EF/cg9HYc+e+81Rpl950qbJPGmdz8RzFZTxWOJNRWEfOughRFfKQ
         9NxrMziWoEIWK53j7vyuWljU6j32eYXiO/RF8AcoE6EP1zpSmbXXPNmRZtMlDWEEE4IS
         b5F+FI/b+QNGXIG+6MN0K9RdcrlfgBS8ggBQV8GxsMKhbDqXUJoyhUTZ7TrA6RkbwPx4
         TU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286820; x=1777891620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqqUHJ/5XZ8IpQaHkA/f23LHDUIE51dJbyQs9T3z0zU=;
        b=bK3uf0+cwakhEkYykxF+n6+TvOholhu4A5aJme/z4i/znOwlQTb6puTtOQA200B8xg
         onurC+JbdIAz0UppHrPm0ZnV90FYVfUJ1emkHXmQzoHPZ+yuAhXdbundQtOVerZhRaac
         VtjKTAUaVQQpSbOfCEIIeMQDnpIjzofof5MGBVf0wlurEkXTDmm7DlVXSmonfDw1Rs1t
         uTQY6IRp5XWm0VHS1jb8NxlFFMwcX5NGrqliKZZjv7xt5VJib86aq96zRZeny098qbgk
         QGtRE588GSaU3DGnhgP3npc/iIpZAmQihLK3HRKa8D3hYdnkEQgLpySLXWpueW9jl9YD
         FMGg==
X-Forwarded-Encrypted: i=1; AFNElJ+4vkmksLHFKIFkVoZjFWIr4V6TjIRVHVtLv5DVCW9scTS/pYk8Hsq+hTMG8L7hBg9/sitlMzexFi2O/WsWRWKE@lists.infradead.org
X-Gm-Message-State: AOJu0YyzVmySII4K2U4HvdeJbxqMsM21jeIjLsQdviCJ8zn1LiF4lmXk
	k3FQAIiN2IXS2ZjDfiKeLy3gBn4lPR+FM5fMpTAtKi0OsjqgTPGAPBD+OOmNPFlFJa7mo5CR/f/
	C8BPQk8azv5qQsJFrzfBtG4Gx1rf1UYa0KjUod2DrZb7wcxJifFp9wPMgNaGgGywyvb+aIya+zA
	1uSg==
X-Gm-Gg: AeBDiet19S1K88ZWm3w5pvDSlYCrQ2wyMGNsLZ3GshuqCzaAXmi7lEUAGtWE/NR2jCC
	PCi+crBc452RM564GiP3m2KOwDcUMV6uprH/5NAvTlFV9kuUUWjKYBiMLtgX8EO7m2+CnBuipGt
	q9TlHBfRSmXfXA+Kf96vtYBzSLSeFXv3tAu+gfucXjIqklEuRlNK6ZoZhgP6vLdqQRonAANiQ6M
	y/Grrk0kIjja4fzTtphiACAgAH56ImbHjVFFR2tRsy8hVVhMugGI9RFb0WDZurjMtbUkjr/prKg
	uw9Aq74H9LZAdykeuYOzn0BUv3cTQZkrbRZyI2VublXZqR12pjgplqeszddWG5BzlSC8sEW6gMM
	3Cu1ZUhUbs7IGqx1OqacMcIdVqCypEH211OQTnA3xJjQQGTQvqfI7CZgnpuT1yQ==
X-Received: by 2002:a05:622a:1787:b0:50f:c1f4:e3c2 with SMTP id d75a77b69052e-50fc1f4e5cfmr325747881cf.59.1777286820368;
        Mon, 27 Apr 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:50f:c1f4:e3c2 with SMTP id d75a77b69052e-50fc1f4e5cfmr325747581cf.59.1777286819942;
        Mon, 27 Apr 2026 03:46:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:46:34 +0200
Subject: [PATCH v6 3/3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-nokia770-gpio-swnodes-v6-3-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5755;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OhSErTTrG2hhJvOqcSYjx6uyZSzmpq0bHLQ7dDSdh9s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6YcBfkMt9UuRGEend4nL5byjiGFkmvx6V/F
 oZDtJQO12CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+mAAKCRAFnS7L/zaE
 w3OMD/sFCON3isNQJhXlxtBo3bdC3sjLV9tW/vsgJx/KDJli8B1tIDysvU0H9tzZK2BylD2NRlc
 ZtJEptW0d/aIaQ05UsOWWBpPXun+CJPwn6+/lExQXDjfGsGtPhX5CQqxECiX9e6OQH+9f4T0kzs
 IDQgTdxZrGoX0nhxUYbAC5FPqmR2fbYG81Q6tu9N/5Of9i6xSucbtupe5Yhc35bJ0iFV0Fj4rK+
 Yj/S/KQ5Gby2EjrckOdCP2bdDWjs8Rhk5gKqaYDNTPVAPPfCCTxbkhxIFUESILSPAb4Yt/dPSGc
 D4C7cpIwUFJzgijaeqn7KkhhIPrTfB21sGAZYANDMJq8xKVuBPKGbeUrcChaXqFA5vAnq8xRD+i
 AZXKqdbrd14MpCwPdKQPHwvUVICeNOiG8ERAHFMDhuhaFcqm4feM+bTEGJTEClbKFM9HDk8S9Y+
 hCoLAfmgPG1LOhMH/vkeMp9qmOUvftV7b2uFopbclnyVMYAVQLZ9MOrEWEO1acN0V0FZ8O0Pjsi
 wS/ercEkVGDUljBNAPgLEJWiuoTgYFeM+iKC23K363KH4Q0faE1FP+YP5ziE/dTHfonHPpgCGpF
 HwOmTPIAkJVJ3mwZU7+KtsSBfRsmLgJkS+PVOsnr5XgYQ+ZWxyB9Wp/vRafq2a7umvTpg8+s3T8
 4Xlk5INFlRAirow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX0DhnK4BTIpOx
 WjsGEeHaEu+TJCSIO6smZ/O19N5aLLnAsgDRBPpmZKsOl4z/hIvSeEHycz1hMkxuidRqm7GRmNO
 yOwss2QbW40RuCkFdNP0OyN/QIsULmlJbo0amc69AP/UHaB2CaHgMrmx+fCi40HJ8YxGcHxXC4b
 g6r9lR/C/qD+Oxa9qUJ5z3xK7NyKjfGE0BYIEBTApef7pIlyVZyU3Nh2qvzn2nkm1GFcL2+RZgc
 9W/dburC8Va+8YbOhTIP7q+SxCDqWFpyUbTcnQoUNSi5TMOJ5ByaCbB6vTY8ZngjRFPQkIFsCDe
 sKDSSrL/JctKqSA+0oNWBwJ3xY/pXnfNHSmCLmvF5uEkzqZ+7Kj+ystYQxcp063IjVFm0u6xcsk
 oMBQEr69H4F7SoMRvLH/uE31znhjbag3l0XhpIPnFU/WK3pU0I/Sx3pfvJCAlucQ6+rVmwM1R0z
 Hs4gVZVcA0OBsa9iV8w==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef3ea5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=8ufHpPoMNYqLVR2KE8YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dgPVM_aB08Pitc5LXM9XcTn5aYWpP4zb
X-Proofpoint-ORIG-GUID: dgPVM_aB08Pitc5LXM9XcTn5aYWpP4zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034701_937062_5B03F66B 
X-CRM114-Status: GOOD (  21.15  )
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
 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       |  7 +++++++
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800fe17b430e84ae421ffa8da2bb11a0..46f817f6316b70ff37bb9dfde86c675fd692999b 100644
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
index 2904ce38c001505d48d0996f7053369bbf683209..abc71bb562df18fb1f683c6f216c698a38cf09a9 100644
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


