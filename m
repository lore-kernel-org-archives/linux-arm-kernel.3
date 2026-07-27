Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F35C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/U7VrTEi0vsV9VceOwFXfFqZdMwqeaVHPjJeSjzlTw=; b=nfeCF09FiYIkydMANUS8laMDpt
	PWUAwXoaPz9/7jBg+5NH2DvOQ8sr/ZNriqz/OiJaguI0f+mQ5p39/snP0SlW3u2XDvztX0gb5oUTY
	RbldoK2dFVHDVaSJfsljOGxB1t7V/ZOUj/uQ/HYCmUUd8Vy8b35Tee4bfiQ5KhMGOHcuIBSKoy3p6
	0/KXYrMsjcGAPJs6/OzV4yOUx/RePL3Fyj11CkQu74fxXtOgPmfIBTWZhZc2VwuNZ79haQCA/dGqK
	NfuzC+AD83kN0c8S3ltvSXYy7a3SlyqiLDywNoeL04Oz0+rEtm9+buSp9Ilg8QFuSUx+KnbjqVKfJ
	J10DxqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKBG-00000002dpk-3iEm;
	Mon, 27 Jul 2026 12:11:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAn-00000002dSb-1nHz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954aff6088so22246955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154267; x=1785759067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/U7VrTEi0vsV9VceOwFXfFqZdMwqeaVHPjJeSjzlTw=;
        b=qYntXHZvPshIklQrwfAQF9Ev93h05VRX2zsVfix+3txjLBVHPrapfr6t+9cXFSxDs3
         sZTWaHV2aESzqurjcT2Xf1GgPBH1DSJjB3jcxSFkeYon0L3LIvbQ3HTvxMsLQ64pTHrk
         WruoEAJH8+NXzgkJVypFYv840/JaDDoBotUnSyfwOqrL79ilTlW6vCxhCurmsomIEoXO
         zFvHxnrdPe4S+KBximTUkg0g29CfleDfr9sKSWMqBxuAx+3Y3cvkMolKqW4Ny4OXf45v
         +Fw/yquQokFs/UJr8gJbMLh8qrhSlHoVEPBbqrrvW6VlYC938txHnxUifYuACEvKP3eh
         x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154267; x=1785759067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/U7VrTEi0vsV9VceOwFXfFqZdMwqeaVHPjJeSjzlTw=;
        b=UbKEL0rzaW2XKfw2owQXqk835xx5VPGuSYIG0WUpyL+HkTsfQ8Iz70fcYJ48k7q8lV
         y38PnGjinLuT3ADULDKftVrQ1Hf3hdLncHCMgcsceA+dBc/Db7Znk2daCLRuaiLAOiyR
         ou4v1RsD/yiaUZMJgT1OCZxpAO4cXJgKE5GefvRd8kBuS/THRdZ5Za8DWcqTqVzX0cya
         njlJdqjnKBvDS9e+NqGP8khlFHryvgMm6X83NLuTvo1ohDjofqkH3DlaiMEaB6QFFIAG
         691x2Xx7gFAyOkYzNZ37BpRE8yBvgW9g+bqy40J/lN9iPh3ZxS29Gl6a//c2as7oOC+v
         kibg==
X-Forwarded-Encrypted: i=1; AHgh+RrfjRdFLu+rBiLrO1asLt9zW2Zaox2r5CHqcwf3HLAAT1io2Akwt/qgmyGnRrB9VrH/+Arwxt39W31SrsheZ/lA@lists.infradead.org
X-Gm-Message-State: AOJu0YyU1QVN79AdMlgBQ3rWRvk5wL4tUgRHBgjHOlseP4koy4z+7rt0
	sakPw9lRUrO7SzdcR6YQ17Odwppd5jEblYjrbdQ5kDcwqcUMmhATM2+ynepFVeU1Pbs=
X-Gm-Gg: AR+sD124X0IwZQcw8UyTJFQ3/7kFMsqnImpstbQfAufmviO4NIZM/VhD73PwSguTQQu
	0UN46b4pxH7du16nLt53CejBoXVfHRTzlsMVT0yvbNbyZnOASF622F2GfZ/W6bRS1KLiU150nA0
	4CtMgw/fYnBmYDaIkdDXXLW4f9Y97s017fC59npWa/++bjSFpcUWftvU6WgmWbuSlXF1RV4LyX0
	QvQ+pxYiTj65JusBsyXbfKVXNPK0qrIoyA47m7KzU4+5rgPBJApaquBpC2lZT+WGKKZhZw8aaeS
	ozApTH0Mnb2EYRNkFs7bFoa6TfdqlEsYwQRq5RgV1/4hAPa3/YQHhBrWtmhBVLpIQx9lOB9DkuQ
	4yEvYmGgYXWzIe8PPFOh1ZEgw+sfStwsEWY4z3viYoKmaPrNRL/2Lpl/RuVumf4p68NwJSGqhQr
	drqxsSkZ7qkTZHgC1+ug8cp1N7/ReRFzGeZNxpF7Bp
X-Received: by 2002:a05:600c:8214:b0:495:5e07:649b with SMTP id 5b1f17b1804b1-496b570dbbemr101595295e9.24.1785154267469;
        Mon, 27 Jul 2026 05:11:07 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:06 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:46 +0100
Subject: [PATCH 8/9] ACPI: x86: use a named initializer for
 acpi_device_id::id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-8-ff900aa326ee@thegoodpenguin.co.uk>
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nvdimm@lists.linux.dev, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=7104;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=q1sapSQQK4AuvJxhLybez7xMW8BCU+2x792Tr/WVaBo=;
 b=MI5X6Mq6pkzQ8U1kUgUHv2AZNnfgYLmN5i9MXfb/oyE4NgRZdijr8KOymitKFXx58Yvd4fvNy
 4eACf5fvIPzBeGp1ZRG6myj6dMucjYGNloAWtUlNTlQatAqcwImBgN6
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051109_537695_2C8178DF 
X-CRM114-Status: GOOD (  14.13  )
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

Use a named initializer for the acpi_device_id::id field for
readability. Also drop setting the list terminator fields
explicitly and unify the type of the list terminator to be
a single space between the brackets.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/acpi/x86/cmos_rtc.c |  2 +-
 drivers/acpi/x86/lpss.c     | 54 ++++++++++++++++++++++-----------------------
 drivers/acpi/x86/s2idle.c   | 14 ++++++------
 drivers/acpi/x86/utils.c    | 16 +++++++-------
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/acpi/x86/cmos_rtc.c b/drivers/acpi/x86/cmos_rtc.c
index ced334e19896..d9891b00d090 100644
--- a/drivers/acpi/x86/cmos_rtc.c
+++ b/drivers/acpi/x86/cmos_rtc.c
@@ -18,7 +18,7 @@
 #include "../internal.h"
 
 static const struct acpi_device_id acpi_cmos_rtc_ids[] = {
-	{ "ACPI000E", 1 }, /* ACPI Time and Alarm Device (TAD) */
+	{ .id = "ACPI000E", .driver_data = 1 }, /* ACPI Time and Alarm Device (TAD) */
 	ACPI_CMOS_RTC_IDS
 };
 
diff --git a/drivers/acpi/x86/lpss.c b/drivers/acpi/x86/lpss.c
index 0171eef00484..50b6db40bb18 100644
--- a/drivers/acpi/x86/lpss.c
+++ b/drivers/acpi/x86/lpss.c
@@ -351,41 +351,41 @@ static const struct x86_cpu_id lpss_cpu_ids[] = {
 
 static const struct acpi_device_id acpi_lpss_device_ids[] = {
 	/* Generic LPSS devices */
-	{ "INTL9C60", LPSS_ADDR(lpss_dma_desc) },
+	{ .id = "INTL9C60", .driver_data = LPSS_ADDR(lpss_dma_desc) },
 
 	/* Lynxpoint LPSS devices */
-	{ "INT33C0", LPSS_ADDR(lpt_spi_dev_desc) },
-	{ "INT33C1", LPSS_ADDR(lpt_spi_dev_desc) },
-	{ "INT33C2", LPSS_ADDR(lpt_i2c_dev_desc) },
-	{ "INT33C3", LPSS_ADDR(lpt_i2c_dev_desc) },
-	{ "INT33C4", LPSS_ADDR(lpt_uart_dev_desc) },
-	{ "INT33C5", LPSS_ADDR(lpt_uart_dev_desc) },
-	{ "INT33C6", LPSS_ADDR(lpt_sdio_dev_desc) },
+	{ .id = "INT33C0", .driver_data = LPSS_ADDR(lpt_spi_dev_desc) },
+	{ .id = "INT33C1", .driver_data = LPSS_ADDR(lpt_spi_dev_desc) },
+	{ .id = "INT33C2", .driver_data = LPSS_ADDR(lpt_i2c_dev_desc) },
+	{ .id = "INT33C3", .driver_data = LPSS_ADDR(lpt_i2c_dev_desc) },
+	{ .id = "INT33C4", .driver_data = LPSS_ADDR(lpt_uart_dev_desc) },
+	{ .id = "INT33C5", .driver_data = LPSS_ADDR(lpt_uart_dev_desc) },
+	{ .id = "INT33C6", .driver_data = LPSS_ADDR(lpt_sdio_dev_desc) },
 
 	/* BayTrail LPSS devices */
-	{ "80860F09", LPSS_ADDR(byt_pwm_dev_desc) },
-	{ "80860F0A", LPSS_ADDR(byt_uart_dev_desc) },
-	{ "80860F0E", LPSS_ADDR(byt_spi_dev_desc) },
-	{ "80860F14", LPSS_ADDR(byt_sdio_dev_desc) },
-	{ "80860F41", LPSS_ADDR(byt_i2c_dev_desc) },
+	{ .id = "80860F09", .driver_data = LPSS_ADDR(byt_pwm_dev_desc) },
+	{ .id = "80860F0A", .driver_data = LPSS_ADDR(byt_uart_dev_desc) },
+	{ .id = "80860F0E", .driver_data = LPSS_ADDR(byt_spi_dev_desc) },
+	{ .id = "80860F14", .driver_data = LPSS_ADDR(byt_sdio_dev_desc) },
+	{ .id = "80860F41", .driver_data = LPSS_ADDR(byt_i2c_dev_desc) },
 
 	/* Braswell LPSS devices */
-	{ "80862286", LPSS_ADDR(lpss_dma_desc) },
-	{ "80862288", LPSS_ADDR(bsw_pwm_dev_desc) },
-	{ "80862289", LPSS_ADDR(bsw_pwm2_dev_desc) },
-	{ "8086228A", LPSS_ADDR(bsw_uart_dev_desc) },
-	{ "8086228E", LPSS_ADDR(bsw_spi_dev_desc) },
-	{ "808622C0", LPSS_ADDR(lpss_dma_desc) },
-	{ "808622C1", LPSS_ADDR(bsw_i2c_dev_desc) },
+	{ .id = "80862286", .driver_data = LPSS_ADDR(lpss_dma_desc) },
+	{ .id = "80862288", .driver_data = LPSS_ADDR(bsw_pwm_dev_desc) },
+	{ .id = "80862289", .driver_data = LPSS_ADDR(bsw_pwm2_dev_desc) },
+	{ .id = "8086228A", .driver_data = LPSS_ADDR(bsw_uart_dev_desc) },
+	{ .id = "8086228E", .driver_data = LPSS_ADDR(bsw_spi_dev_desc) },
+	{ .id = "808622C0", .driver_data = LPSS_ADDR(lpss_dma_desc) },
+	{ .id = "808622C1", .driver_data = LPSS_ADDR(bsw_i2c_dev_desc) },
 
 	/* Broadwell LPSS devices */
-	{ "INT3430", LPSS_ADDR(lpt_spi_dev_desc) },
-	{ "INT3431", LPSS_ADDR(lpt_spi_dev_desc) },
-	{ "INT3432", LPSS_ADDR(lpt_i2c_dev_desc) },
-	{ "INT3433", LPSS_ADDR(lpt_i2c_dev_desc) },
-	{ "INT3434", LPSS_ADDR(lpt_uart_dev_desc) },
-	{ "INT3435", LPSS_ADDR(lpt_uart_dev_desc) },
-	{ "INT3436", LPSS_ADDR(lpt_sdio_dev_desc) },
+	{ .id = "INT3430", .driver_data = LPSS_ADDR(lpt_spi_dev_desc) },
+	{ .id = "INT3431", .driver_data = LPSS_ADDR(lpt_spi_dev_desc) },
+	{ .id = "INT3432", .driver_data = LPSS_ADDR(lpt_i2c_dev_desc) },
+	{ .id = "INT3433", .driver_data = LPSS_ADDR(lpt_i2c_dev_desc) },
+	{ .id = "INT3434", .driver_data = LPSS_ADDR(lpt_uart_dev_desc) },
+	{ .id = "INT3435", .driver_data = LPSS_ADDR(lpt_uart_dev_desc) },
+	{ .id = "INT3436", .driver_data = LPSS_ADDR(lpt_sdio_dev_desc) },
 
 	{ }
 };
diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index b6b1dd76a06b..64c4e10e71a1 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -33,8 +33,8 @@ module_param(check_lps0_constraints, bool, 0644);
 MODULE_PARM_DESC(check_lps0_constraints, "Check LPS0 device constraints");
 
 static const struct acpi_device_id lps0_device_ids[] = {
-	{"PNP0D80", },
-	{"", },
+	{ .id = "PNP0D80" },
+	{ }
 };
 
 /* Microsoft platform agnostic UUID */
@@ -431,11 +431,11 @@ static const struct amd_lps0_hid_device_data amd_cezanne = {
 };
 
 static const struct acpi_device_id amd_hid_ids[] = {
-	{"AMD0004",	(kernel_ulong_t)&amd_picasso,	},
-	{"AMD0005",	(kernel_ulong_t)&amd_picasso,	},
-	{"AMDI0005",	(kernel_ulong_t)&amd_picasso,	},
-	{"AMDI0006",	(kernel_ulong_t)&amd_cezanne,	},
-	{}
+	{ .id = "AMD0004",	.driver_data = (kernel_ulong_t)&amd_picasso },
+	{ .id = "AMD0005",	.driver_data = (kernel_ulong_t)&amd_picasso },
+	{ .id = "AMDI0005",	.driver_data = (kernel_ulong_t)&amd_picasso },
+	{ .id = "AMDI0006",	.driver_data = (kernel_ulong_t)&amd_cezanne },
+	{ }
 };
 
 static int lps0_device_attach(struct acpi_device *adev,
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639f51..35580d77d8af 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -463,14 +463,14 @@ static const struct dmi_system_id acpi_quirk_skip_dmi_ids[] = {
 
 #if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
 static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
-	{ "10EC5640", 0 }, /* RealTek ALC5640 audio codec */
-	{ "10EC5651", 0 }, /* RealTek ALC5651 audio codec */
-	{ "INT33F4", 0 },  /* X-Powers AXP288 PMIC */
-	{ "INT33F5", 0 },  /* TI Dollar Cove PMIC */
-	{ "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
-	{ "INT34D3", 0 },  /* Intel Whiskey Cove PMIC */
-	{ "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
-	{}
+	{ .id = "10EC5640" }, /* RealTek ALC5640 audio codec */
+	{ .id = "10EC5651" }, /* RealTek ALC5651 audio codec */
+	{ .id = "INT33F4" },  /* X-Powers AXP288 PMIC */
+	{ .id = "INT33F5" },  /* TI Dollar Cove PMIC */
+	{ .id = "INT33FD" },  /* Intel Crystal Cove PMIC */
+	{ .id = "INT34D3" },  /* Intel Whiskey Cove PMIC */
+	{ .id = "NPCE69A" },  /* Asus Transformer keyboard dock */
+	{ }
 };
 
 bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)

-- 
2.43.0


