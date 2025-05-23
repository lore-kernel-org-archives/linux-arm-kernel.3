Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD48CC54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=aMziIgVy4fIRV3qm8qb3SeuyGD
	A8FaSv1o7tdYuoXeGp+FecrR4j0y6CWs66fazxpkI0B0gBFOZmVEYIUnCgPNGI9MeDk8f5C5Dite7
	2O9/dVV2swu1Aa6+tXl24s1NyA8PH+AobeBt9HrbOw8rDRtYF/BFC2eJsxlNEBDj96zWaVsqkDxtU
	iQda0sOvy5srMePWNQg15I+7CJNWn38AWNiYQCcecfJnRRi4jJ8PdXS5ZTIm4rb/FuXhd0JRkY9a3
	VkNS8FokFy3mgw+GGsDSKf5HFowSamyrDkdiToJoY/xiFO2b3SGa00oU7JtpZtbZXb5OUX/YmV+s4
	LCvGIk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRzg-00000003sVz-2ZRJ;
	Fri, 23 May 2025 12:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRhb-00000003pdY-1TOw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 12:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=ITo1h3Akn12Kl7Uyqsg1hkrd7R
	t1E7iWAf3FkuV18AKQ1ei+kKmxKFb4F/xIKrTtOWmwX8MgDiWac1inj7i24sGZJVNLqH6FgBrPn+G
	njYP2cxdr1bracPTSNmeV2pTXj4hnD8AW2cLRuTWlEwCd2SqysAQtp50YfRf6t2Nd/ZHBUbjR1/Lv
	7ubq4fm8JCxCIeNJo2ZUIIi9X5KkvSV4QBJWMORFEiLOo/Bkh8PN82NvOD/RkHk+RS0oXlsdBOxzT
	OMSVAzv7e1ZhwNs2oEp9nODwO+/+vFmKXKifh6Qh5xHyGCzEV3Amvfor6NlBGO+z+91H7oEPhqPn9
	YQ4keu/g==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIRhW-00000001JlH-4Avt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:40:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCdHn2020184;
	Fri, 23 May 2025 14:40:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/fb3UPZu5WN39hqyomy18YDn8fBiBvMNblbm+Y5i2po=; b=F9IwTXXmarj9zcYn
	7sBebl8u+W/70ktx+a2G6ORdsRrTsQ6SxwIT/O6CXoQjGXboV/3f7xZqfn4YtzeB
	mXrE7t8H6e4mSIMefSw4+mgN1u+f+WvTRQ/zo0wjJV5Ra0GW1VcpnLD2kSG8Lk3y
	H0wzyiwWehSJF4N2LnPLfeK42ai7LOMiAAqOFysbtRdNQIZnheKu3pDiCJvLlDBl
	tYnwRqziInR+1Bc5qE03td1IACDA8qvEnkQzChVW48D2j2Es08dQWr+02bdUvenp
	totCqQCpP58PMcHBF65HLZX3krM1UYSXP0xwHSdOlh3ACSaVJLYKgfVO1edeySkW
	e1ivig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffe5nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:40:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F11414004F;
	Fri, 23 May 2025 14:39:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986AEA0D915;
	Fri, 23 May 2025 14:38:24 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:24 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:13 +0200
Subject: [PATCH v3 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO
 gpiochip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
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
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_134039_167155_47E517D4 
X-CRM114-Status: GOOD (  13.36  )
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


