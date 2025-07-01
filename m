Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmlFoe2aym4eeL7Hz5sMKNcWh8dSGY8xkumy4xR8mSk=; b=TTHLtv4dseC/52xs2FqjYJqzkG
	mr18vsJCf8rharV0yuNVtHNYQ0BQ6pQRkL8izNimEk0xx+d/3pLNqKLXH7dCOevQn6owL1Ix/eQQo
	Tu2Z6IBx6sgm/OTprGFITTn9Gt+ESK9+WneXC+o9qQhSUREfWRn60UKLYMsdrqgcceDwlieQ32bF8
	dh/svi+zyclRm0YE2yXNZjaC1ygZ4aADPPLjtTeGGVHKHfTJFdi+mh1sFy5gxjQEgOm4v66lGdStr
	oyI+VtkEURmMWZ+/gVy0q+7vPEtw2uVfzp57GmsP/GWLqG3GMhAwLZ8occBvveSJIBxyNmB+1z9UO
	n7/06+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaa4-00000005Pko-12D2;
	Tue, 01 Jul 2025 12:59:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUl-00000004vIf-2O7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45348bff79fso31044225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370590; x=1751975390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmlFoe2aym4eeL7Hz5sMKNcWh8dSGY8xkumy4xR8mSk=;
        b=djX1RNI/8AUhKPw11PlTBBfhxRh/lKsaheRr+3g0nVBALYJwnQVVi+KJPyxMyY18dk
         0WoSFsl9qsNhQUlCLkAqZ8IlMs98YaIVdo1zEASzryPABvi5Hv8oRfBldGizdHUMeXjh
         9Xm/r3jeuVQAGsjqiDmEy+ifM4Jp+Dd0iODwQB6714Sr3gY70eDvFneRqy3QbaQKcmnf
         65PHjokUGx2hSOcp+Up46hihfSuRdMzWrTNluD+XeD3/ZfSwoDg/RgMr2/yn6R3Cp4uo
         UQtlalbU9d+94aAZyeDBUPSX7Du4a1ZPE3E6QqLhPJP+0qUdei8xiu4JAD3dvEZeJgC5
         9vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370590; x=1751975390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmlFoe2aym4eeL7Hz5sMKNcWh8dSGY8xkumy4xR8mSk=;
        b=ag1dGznIBiu9KNavDlshhBVMMVuR5Bme3499vUH/iFvBpkfiRAVk3saqosBkRlCfom
         oXIinqS6VTGjtn63FzSKJYeJm5ss8tqDGvbL5X6FVALu3bOMhnjDxCe7ZIdjudiK4GUp
         umUO+ti0jHV8FharTwPV6z3Z7SctvyLwus+Zw7OEEAdqR1CsPVmu0Lj+D6azGEzKEIZ4
         S1RBwcDm+eq83fW8evwWoqWgBEn4Rz5CzXBE67KwiHxfjYmioU8ARmUzs7hZ97dg6aMe
         zMX2kalyv1bwUA5H4dUwvm/9z1ioXGvfXAl6GBQ0Tblkz+9GufOaJAJMy6h7ktOWtwHd
         w7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV4nDBhX+SzA3MkI9T27/zbwvVeweCy9wR51/pSLI/f/OUIjY8c59YbBihqWN1WNQsage0aYBQbz42C3ae/o0JI@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1vddRCI/MSjvtaNvYzZfmqXWQX1/vhCGHOuyde2/a6XNTT31
	BbXXNuA+/k4FUSMTG6C/B8SXwWfOCaiqVo6w0cjNVwyfFzt/q1neWyubnJoAxDOaxB8=
X-Gm-Gg: ASbGncu0LzqNjfPfqUMWUXbV91qBE0GYbX0iF2uLgaXiVPvgcMb3plC8fFcpnZWoPEl
	w8EgqcHggcJj2PskYaopMVjc+dvddrufR0pCFIc82uBJMxge6UfUoedOvj0JO1WNqxIijg+hj2q
	Gbsdy0utJROJhR+fg6cYaaKu1RhxKmx1mzj4SZwNzACpFVLvqDnb7eTCJkAlF387o/yTZ5rZwbD
	DgfiEA7ZAKEWktRt0sOcCWf2wq6hB6ZXUYB5qU+fxArnFJzh2rcnDVGAWyx4RSyvR9SULYq1Tnh
	hwcOfdTFtFKCReHVCOEbdVIubsujoTW5CWa73LkEx5gM5MGVjDrzWw==
X-Google-Smtp-Source: AGHT+IGJrN6PNufVnPsz2OChBPF0nzndAxw1Vgqz8TrakhIeBN1I20xOkzC1J1aLNxuEe6wnZRadWA==
X-Received: by 2002:a05:600c:4e01:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-4538ee4f7cfmr193139605e9.3.1751370589775;
        Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:37 +0200
Subject: [PATCH RFT v2 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-3-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T6LXibepSEWSVZc5pSawHsl5dJjLPLgQMdCiAMb4Z7Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tX3EkD2/+Qls/ylxbJqZ8GBp5rTpjE9xcMl
 GxTjsfzP0OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 cpCvEADPfHzms9P3YOgQRuuTWhfoI9MXVAtI7MQBLr3MoBA4W0MBMbmvFXzZukdAnQlPygwowCT
 hKvSLzZzJtfL9kj2p3QlCJcsyrfKpnbFOcCODQ+ktHV9i36LEsZ1jS8SQTyY72JQbe6LYFAnmEQ
 eEZWT4f1VJbiryBn9b34dsURVsjgVR5A0lgizO/J3R2UyvESZJW1W3jEwCZ5uh3IjHqmCjKUkkh
 AMbPzmyUxq+jM6Irzj89JmFrg2kd8Au8qW6mp+UKJkVzzyvPdQuzc0PPWe0qvu83zbceJnBlGtx
 S6oila3incG4pqEoh3dlwnwArCKvEekCZZjiB2+SYsLkZwhYGYUi8n7kNJAYOZQ2swpVLm9Yt7X
 +39BMZvQTOP45spQWexcRbhFb0n1ehMOY0V5V79jpCE9RSD+Y1zNZZK5c22RNMrXXWIqDB7vQqK
 qq6k+/vydQKjL/gQSZ3CfGWshMzsNh6UHpLHJIPTo/RPcGmsoMcEZOOR/pCCDdUi6A2pCLU/XOY
 ojeStlRrT+kGuYekJyqr07U9tueX+1anJ4zBuI2z+By67Fb2ZRbe1pjMadGtU4BbyfVlw9RWUeS
 29fMfr/NEqeDo1yqwk1rrWwGJpxNX417UDjiPK7Q90BJOOgGiI4DLH8grbYUAazW61aap7lLE5d
 5fKD5bW1I1h8cqw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044951_630035_5A29CDD1 
X-CRM114-Status: GOOD (  14.94  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace struct bgpio_pdata - that we plan to remove - with software
nodes containing properties encoding the same values thatr can now be
parsed by gpio-mmio.

Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 
@@ -37,22 +38,34 @@
 
 /* The sysreg block is just a random collection of various functions... */
 
-static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
-	.label = "sys_led",
-	.base = -1,
-	.ngpio = 8,
+static const struct property_entry vexpress_sysreg_sys_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_led"),
+	PROPERTY_ENTRY_U32("ngpios", 8),
+	{ }
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
-	.label = "sys_mci",
-	.base = -1,
-	.ngpio = 2,
+static const struct software_node vexpress_sysreg_sys_led_swnode = {
+	.properties = vexpress_sysreg_sys_led_props,
 };
 
-static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
-	.label = "sys_flash",
-	.base = -1,
-	.ngpio = 1,
+static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_mci"),
+	PROPERTY_ENTRY_U32("ngpios", 2),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_mci_swnode = {
+	.properties = vexpress_sysreg_sys_mci_props,
+};
+
+static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
+	PROPERTY_ENTRY_STRING("label", "sys_flash"),
+	PROPERTY_ENTRY_U32("ngpios", 1),
+	{ }
+};
+
+static const struct software_node vexpress_sysreg_sys_flash_swnode = {
+	.properties = vexpress_sysreg_sys_flash_props,
 };
 
 static struct mfd_cell vexpress_sysreg_cells[] = {
@@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_led_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
+		.swnode = &vexpress_sysreg_sys_led_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_mci",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_mci_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
+		.swnode = &vexpress_sysreg_sys_mci_swnode,
 	}, {
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_flash",
 		.num_resources = 1,
 		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
-		.platform_data = &vexpress_sysreg_sys_flash_pdata,
-		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
+		.swnode = &vexpress_sysreg_sys_flash_swnode,
 	}, {
 		.name = "vexpress-syscfg",
 		.num_resources = 1,

-- 
2.48.1


