Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5452BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=; b=284thQLlCq6XH6m4SrMgq0hF6J
	hFJZne2DxW3Rw3m11Tq1VpTXkMni25D6/TTsfsCLb/+th4iQXVeQefF/pW0X35BrZBWl9KbF1xz3W
	RdKjv1HwZ0B2yJeFF5epGmBPHNVciTLtajWjRmpS2IVbDeqYqNOtmpGwXqc7h5G5KJJg6H0X3ahzt
	3gkxFFQj4PI9wXnjk1SCQBgmxDdkD9XPR/RXCJ6YMTNYL6bvoCA/mF6rD/69H6U3hfpeWgB7J3ugL
	Q6J6QCxjEYihL+AKkx5k6NxhRYi4jepPmXqnjJACdZ34HWozdKs5BmulVFPbMqUj9nPXSCyY3jIqp
	1nf5Hh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3fM-00000005huY-1c8A;
	Tue, 24 Jun 2025 13:26:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yd-00000005h4L-3G5f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso424154f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771166; x=1751375966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=0souYEZyYKqMXuM4TMpNdGlYGipd+pRJg5N5AOOaONfFVnxugr6NNZljcJaGDi89jD
         +QaXJjEqBMzuq1ryeGa/Gwg4u3cRywKbrOqben5zPz01pj7of6EeXNEXZ1Ldmluwjona
         9t0tY7mQcoOsZX55G9tAXuGBMgu04xmMWSmVPF5ERYM24oxN06AK1iMHpef6HtRLIO5v
         KwtyjoR/ysETiD+5xBQUJai6LgvuDmxgm5Dk63/raXhVcd/p8fAjMBiitztnktdK5TTL
         Q1rWqf+a1tmCK618uGTlq+dWe7rfGsE3ggKLQVQHG60ynK96fQC+6Ov0nGP+/lXoKpkt
         lx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771166; x=1751375966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd8kBKpFzE1gkS+2PaBdjUJKosglaITysg11GB8BGwg=;
        b=YMjUdXd1SI19nAEWOhJrRIcDHTitLEv1CFJRbOfY60wDLI+T7VHFcURnOwIhS0wAMD
         UBdAcBD8wWwwhnHpf4KHuyDO8yleFUqKG7OUOHNzPuC8aEku3GSs8n7QySpvo2sfKTvj
         AHzlb8bhO2llTDQP59g0tjcH1J31KeDB0W1B03aF0IVLzKF55FIii7DxdXyyw7dIUnPE
         MjLe1L0HJdhVquUUm7QnkVdEwveMk4rXxpGItWOJaVKiOVksxYh7VRPOaHccXSLw4WAA
         8SSKkjDMcOct2tSRp/4C9m6bzaywh2atNDcdKT2E19eH3nLpWvq/3/kKiBcw+zBDroNv
         m/RA==
X-Forwarded-Encrypted: i=1; AJvYcCXUsIR+VBYs17L8PhByK/LjQSF3R1cLpRSP/c8KWIKrgDLqTDe6weqEjHHZRpQ+RZJi8DLx+G2DjkUSwDsgX54b@lists.infradead.org
X-Gm-Message-State: AOJu0YygmMEwy5maI0aVmL7g9FRmOWe1VShzr2CbRgA0bDX84sOrk9AO
	zHvd4etD3wMEULwCz2+r5aeQUlbNI30ZpOS1kE4YTr93k7pN7kUixvFcjvaUYISeMoA=
X-Gm-Gg: ASbGncvqvxeBXb7rh9pHae61loxfd1EhFPhS8YX6IxXyYSTkpKPNVvLbJbC3U3OzBRA
	vLrHgt5XTW/6sjiKkyOmNMbTPeMgq05625Zx8RpEj+oPS9xf+N7O56S3BLdxx0qFRYLdnEBHs8O
	OWap+PdqsDTjkuPI+0y3Mt6vdMa+tS4m0D8ohHEivrJVLFhcAmmVS8qSWCony3UtRNlFFHgCpb8
	Ssv7HsRt3h8g0ld5Na37+W0zq9SgU+Fv+bSJMxce30fxZfvRP2ju/jXO/Eqi+h4cX6Xs2g3hlUr
	sS+LAb9nTL8Rmw9CS38RPOTj2G/MCVbhMaCQboCBMvfBzNJ+5U7mClFDlJPYvviz4g==
X-Google-Smtp-Source: AGHT+IE6Kv/SU+UWtBM7VJQczlIAMoJFCuFxK4Z5BzTohHnuGX8KwrkAv0aXxfyraOvsIUuEerAM8A==
X-Received: by 2002:a5d:5e8e:0:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a6d12c2492mr12092009f8f.20.1750771166160;
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:14 +0200
Subject: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Zivpm93wsUA9kJXUprjnSmisj2JfN4trpIukMCYvtOg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXsIcX49O3O0Vn7qIBdCdKUO4DSQym+RKCh
 2q7Wf2xdICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cjKpEACamWQvhV5Ftf344+uLwE3eRxLALSIK12mth3MQwWxcNhD5+2Fog/n4/74bdZvd+wIugkI
 MPkGXKOFRazn94C155pgLL42HxmV9PQDqspEJb/vMcUCmLwRwjkg7JF53m4FVg4fw1oFeyQ8gCo
 BTaaNJtJoGr64Wa4hphvdie37PAHwUUiE2OuG8n0P1V3Ljy2lraqmOiGRDmRbyD7fb5G6De1Y0I
 f6QYIauiTXgLGtvfj4rTWmilcZhVqeX/vxE+6Z0fMqWZAJHhA33Q60Yw9yXx6M9OMBM3wlqp5Ai
 So6eClCTIDjrZEkbmyBjHKled6SogXnR5Pustqqof17csbbvSIQNI0GIv52rLjJYibYQ65QQzj1
 pGbsrN7/DdF+TZhDiMvCHXwfEhzVqMINiYYPoNY5m1XQJE2M0ePdqKOkgF8QMeax5mQBDd4f8CH
 7ebb4+GoYOOEiLUrd6fo9uuxxqdOr8x3244rvEgnl0SEEDfw5kAUD/CPWmO/n5qoyaEvwD1dAvo
 Q+4gH11IglIaHC9Icuto5MmtnPzkUG8d48bYxmaZlNWxVh+6UKn6K7L26RNcK2ES1WxJxsHIQl/
 1ACV2sR9s+iW2TSk9n/naUCaR5pzieOlQ9MI1XKZT3iQRdMjssC3cL0bXzvsNmcXFJ4H1CuiYYx
 2NApTH8Cqa311FQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_061927_837465_168C546A 
X-CRM114-Status: GOOD (  13.88  )
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


