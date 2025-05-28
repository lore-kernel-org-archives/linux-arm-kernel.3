Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E47C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=a90DR+kxpUk21K5c+FSpeRDK4x
	4/Td4Bde/Ch0kkqabyrPIgZfjb2corBNdYkWUB45zelDrdsssbJe/sGM+hqOewt/y572bDMJKPo5M
	gpvNkbjuOKNZH+eIkG1S1oAAC9FfKhb+Dz+xsD7u+SMpx4UhvwMpZuQF/UTgCWJ6K2hxIOSybcDJs
	YNpXajfeeKwWU4lTft+3ojFOVPQ+7pOUmoAshLXwx1EsLC6SticzZk/JMCbF8YVoqiraM8LPA+KtP
	/0L7P/EIPXfE7UL193Pync8JxX0Myu14FeqgZojKH8BkIdbQdWEilP9VB4p/g1JCnv1/ZsTm/uFc8
	RLGV4ZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH4o-0000000DGvU-2Rmc;
	Wed, 28 May 2025 13:44:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuD-0000000DFjU-2a4J
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 13:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=kGULi8jBw6umYP27f+i9+FycjV
	oRhB8KK0iPtC0u0ntmlfcYvjV3dGOYOt7Tbw2L6vU8kIgMAUfDgOLL0WP8KtU9EOJIJY97IEsNxYQ
	wyMirlXkHlfw80zps0Q9v/2FGaESX8vShl2eqDLKXDzA/fAihD4ucvi4NqNJJhSMHcJddfw2TRDa2
	3jQyeiFRE9YWz8E5bIo7+S6byLUu6gO7uzNajxywMUQfCVMmJdz2wnr3sApebs1UrrjPbIxbu2qVm
	Gwzfq6sEL4JptY3ScVRrhY/zX/JbEcgb53GUaJGJUxK6Xwk8NfdhvhK32ueYBxDHs3HyaVk0Tw6uc
	MoPrNpxQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGu9-000000000XV-1kwl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:15 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SC8uDa028907;
	Wed, 28 May 2025 15:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=kl814dqGPeFuSLFL
	npVSgaX618J4kCsu13eiO+jS2rH+UwlnExum79SSgzu8sVDRqxWyh43XzWFvJNaI
	gp3/uJCyBnwk0T3A8g97n+0TSMTKgThX4gdhYb8iNevZ4+h7TzzeQsyXevcrSEAO
	jg2wWKkt/39v95TeHUDp9gyUs+CPJCklub2/iMzG02TOpBxpJBgiRtzdMYIQU14L
	f0tdL9RGS4sFMBULRG4S/EoXeapvNYwM/94/Y9Q2Z+9rDI+iEByJ9YpnB55QKb+m
	dTQeq6ik1qNCphbvI87+g61bskosNsIESA0MnzzVtI0bUAowOuM95AwwMQ7Se4s0
	++t4Gw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3891que-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:32:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14C2F4004F;
	Wed, 28 May 2025 15:31:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 066E06CCECA;
	Wed, 28 May 2025 15:31:01 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:00 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:54 +0200
Subject: [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO
 gpiochip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_143313_887249_C0D32513 
X-CRM114-Status: GOOD (  13.33  )
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

When using bgpio_init with a gpiochip acting as a GPO (output only), the
gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
default but we have no input ability.

Adding this flag allows to set a valid ops for the `direction_output`
ops without setting a valid ops for `direction_input` by default.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 4841e4ebe7a6..09b9e1275e7e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -335,6 +335,11 @@ static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_ou
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+static int bgpio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
+{
+	return -EINVAL;
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	return bgpio_dir_return(gc, gpio, false);
@@ -566,7 +571,11 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 			gc->direction_output = bgpio_dir_out_err;
 		else
 			gc->direction_output = bgpio_simple_dir_out;
-		gc->direction_input = bgpio_simple_dir_in;
+
+		if (flags & BGPIOF_NO_INPUT)
+			gc->direction_input = bgpio_dir_in_err;
+		else
+			gc->direction_input = bgpio_simple_dir_in;
 	}
 
 	return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c0294a9104d..42890db9b10e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -749,6 +749,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
 #define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
+#define BGPIOF_NO_INPUT			BIT(8) /* only output */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.43.0


