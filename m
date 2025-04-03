Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=; b=GFHAddcjQZvL8ppvs8zvKDqAih
	Mi28kvieTxhZjLCd52OJBypotyXOvvvs8P7VoyOvdaECgTSUBfWjyi57hR0MU2FLXhW18DuJi5t1H
	nfVvIKD6MSbKFxosJ6EZBFo7JTmKWViauIsYtdlpN17uUzsSZfst0ZVkPxWlg/PDM191cVdOQHd3r
	H9I2pDB6HD/PSTzHJtwUNEA4dWTAGBAP9OQLkGg82Ll2Vlx/xYz3l+/Sth+2BicaadXi+5oRdXMk1
	LI8gKTJs63LeH1w5yaN+DQhs90HEFON7Z5CRZzHSMiAsJGEJxoHRc+ffGJWtLW+I3ZwitOMoN/gza
	QEisGi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H1l-00000008Qbh-1l0l;
	Thu, 03 Apr 2025 09:38:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPq-00000008JnF-3pCT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:16 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac345bd8e13so108742166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=Wt2LGHK44qgnVrC+ColX3KF344gKuw+UVc0kjVP0D6nnThT7gS+9AqOIsLZ03lqSRe
         i4ucEf+CxFcPhWJ71z/xjw02keYaELFNRRRGWAWrMUH9WHOSH0De0n3PnMQZUIO9sVAW
         1QV+ejNDLai2ylwKjGFjrRw28nY20mEOizJnaeDeHbvSknGkSg0EsWIg+g7lLm+vy2wQ
         ykHCu5QT/4U7mvqrg0nVV8j6rWHv7ENGIJy1oy1f1xwLtf2FKAEWVR+k2foKZtyPo+GS
         DMXB1tmzLaSbimuZyUtDRqF4B+c55ZfFYXgPy+pL1hlAaW2DuqRnMx69k498J0wWtBTf
         kmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=Ia4YykOAeiHBmIPkxcnjAQFMWBA+jqy891ufhMzv9EIv4tKkiH0KKkRUbAp0mSQoi9
         agBIXgFZ3uaIeJ50X+KHtPmjDAwIInIfRoU7201wDNc4Jy8c0ARCNuuDby/TNdS4pFZz
         a2GUfqxquzi4MznErP4C49DmoeqNzP5MTQnSKJNuDTyclADyp3etgAriUa0qzI/vDTza
         aIEhflFq/DMkDNFDhC4uxJpfXEeS2YNFsgIeKsqUfZV6xum4TBvc6UyXih3f6NoQ2gd0
         dcsgH5LvdGMp2IbILm0pF1reP8aoHC8hYx0pjp2UbhcXduCY5sSiHa0fqVloMUd/g34P
         eveA==
X-Forwarded-Encrypted: i=1; AJvYcCXjakXpmsjRyudVU+KLHWANzZg8MF4lOgCYRbc5dQjY9+T5nqqxBSx3UXAUiMclWHdnl7EK3ky1KB7vHR1GVPLK@lists.infradead.org
X-Gm-Message-State: AOJu0YwY72PPSMzQKAsczeNia3OU67MTtuhDJyddk/yYI0XvmEJKpJSN
	ZbsoWMlI6YqBxzbox0vaCmitxVG3TVgrRSFgFUCQrfJqyHUDa7ox+Nm7rqUajRQ=
X-Gm-Gg: ASbGnctjG3D8bF97l7ToE0fM+5tdJj4zskFsZc54/3PQVpUS2NI9jcoMmTKeTclXpyX
	R6PWnQDMbvgIFRpj7hhOgoLoOapFw3+2GVGhzbl2KG+oYe+4dj/JNpmyKAhkNUg4LkEZ1c9YDnC
	NAZiiDVOtQ1oLE0Tw5zxiI7ELfq4wZHRx3YT1+nEWvE4meJISYTMGsDMmtNe/wh5dp93hKMAET6
	n0R+YriTsiCUuwR5FaObx1yaUAOl1U5vnPWrIVrDMvto1hr9ryNVeOSv04i/fhomSSFr8Y/ikMX
	cHcZ3H/4+TwPYNIYIh4OCJpqlw8rOpmZ53WIa/M0z7R4WbA62x2qAppX8IxsgfTrYW52xCLE6MP
	LTTjDIx/dYmeG9Dtb3FvR6Ksp2rKw
X-Google-Smtp-Source: AGHT+IFRyOdwPcEz80NSYeNSO9OIEAqrNZz0SsyzqP2x0gvOEZiZralRMKMAb8SO2ti+oPAesT2BCw==
X-Received: by 2002:a17:907:cc1a:b0:ac7:c59e:fc3e with SMTP id a640c23a62f3a-ac7c59efdf6mr46064366b.25.1743670753150;
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:13 +0100
Subject: [PATCH v3 21/32] mfd: sec: convert to using MFD_CELL macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-21-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015914_949855_BC0D0D47 
X-CRM114-Status: GOOD (  12.71  )
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.472.ge94155a9ec-goog


