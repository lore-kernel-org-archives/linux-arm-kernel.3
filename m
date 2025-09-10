Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B42CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgdrM4aJRYrczpVTjbdMrpsxOv5ioO0+n1bSkbQmCXA=; b=P3kl/aAKd2xCxGKEWcQJJCQ6qq
	7z+fVdO1BQKl+1np5LtjH0TwE+PEa4T0QTpOX65g8NFq/S0UK/E9T7tE05qUXahH39MdtCt0Qye56
	i6Pxbjr8+LE8KtimpKSEJ9rg3S2yEHHLx6deRTRL7/PkZVPHUcKI74mmcNoU1W/67/ApXu24+b/xH
	TgdL613AuF4Yony1YxHhEHXM0C8Yy0Y1ARbl0Og00tJqfOji65kk5lj/VtJCin+3hQLk8mW7xPeDj
	0/r/c2BRqZfjmtk3NpXdGGDtJl3DNrLDmaC6KBvRkl/9KBIcfgR4zR7wDl2RzxnOjiRxd44vDXvnD
	CqGbr1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1w-0000000CT5S-1L0Q;
	Wed, 10 Sep 2025 07:14:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1B-0000000CRr6-3Xrw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dec026c78so20364235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488404; x=1758093204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgdrM4aJRYrczpVTjbdMrpsxOv5ioO0+n1bSkbQmCXA=;
        b=e7DPFCBUt6fcQvNjwagnUiAKcVE/Kbfg8WZ3J5XIzl7lRO4wMeX9+n9AyU2PtqBr/4
         NAVLSgpdF7/N/BlpTxlanLAune/VJDVbwUGbZW8k2GRTfJvJec1X0+CEiChsjF35044J
         rZIebb0xLwmIcxJ+Po3tJBbGvRRZ1PaUZrPvmsMyseW9FIWKZ/su83lM/LZt3u3UwruN
         FUCXT2aVckdg7XrkGn4+5X0uYDGh84WGxTuaX0vlZT4l3MVJ7pdBZvB2Weh6RcYgwU6D
         3rPgREoMtgFCt0GGCJUI4KTugePDV8FHYL/NpQISk+F1tW4mtRDfde/TZsNhvxrm05e3
         ZEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488404; x=1758093204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgdrM4aJRYrczpVTjbdMrpsxOv5ioO0+n1bSkbQmCXA=;
        b=q+DX4lIR4ZNh+W+TbClja+/VQdrj/cANmhQMRSqYALn0mvGGuG/8/eKkZi+j8uAITX
         xKx/AUnQBBLz/el1gcITwgcIoulPP126iLAWjRcqA60Q/xkJvmNHj4RjcOMUKeeHyUcD
         5y+JdpSXosmh+0JaAdunb79XZEiPxscsZGPi8KqY6iwjxtm9dzcmeesGKKriDPduCbq+
         +SwHSCaFOCeRGT0McW/TcLgU5FRfutOxaLfqxofy/gFXekiS10jJzm25p9+VLJ8mVANF
         dk2/eoIC8kDw7CmhycgEC+9EODM76hZbo3ISSz+UA0OFAdRAXACv7imLWHbDlG8RAWZU
         HDew==
X-Forwarded-Encrypted: i=1; AJvYcCWaMpMm5Scv5XokOgbwGgprnvOTurCDpHq8HiFX4zn3qq2ISLyRVMaeutO75uOILx6BWqMhuXZkTL/33paL6REf@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUv4AuTKvuE6c4t8ILQwKZTCKsZni1WOvK1VmUtJjxAYLxM4a
	+5tZRdp8i6PBOtKce1D7QoyFmVPaFCarOrgiiizWsoYfAF2WN6wntRgGtNbkWqwv0cQ=
X-Gm-Gg: ASbGnct1D3EO6qo5xEWOESqAuSKtKjQGcqRGCnfWJAtsf0wvGYFvPqNlvxuUn9FaXMB
	UdkD3GsDKNH4lfuMO3pPGH8qGt6caeI8mcRNhYVHgtVmgsNBigStbe5+kVFculpsHyVzneIrqWd
	wYACLZDRtUIi7w/N3oQSF+AcT9k4r95bu5i8wkQtevdNUAAOBlt3cnlw8LPVeb/d+qV1qfUCx50
	VdRdodUdLq7Q+2VzGkNWZKIBBIA+5C+OpvvKSO6rKeJZ+qc4b4Capb2jfAVYBU25mkyqg5/VWx8
	Nk3viLov/BabigNVWex4A+qIrmxa5sq22pPjTdhEl+rJ2gu8YswRWF9L1NOCmU22uI0EaXEqSls
	H/5PIgMyt5GPddmVzJ53ZFh0WvFgXESa3HKkxkw==
X-Google-Smtp-Source: AGHT+IH52c0NDjTg92BlFI1StBbf2SlfXbs3hSBtxvJaf6s0LfTwWHF4zDme3188iCv7fISkb9TvkA==
X-Received: by 2002:a05:600c:548a:b0:458:bfb1:1fb6 with SMTP id 5b1f17b1804b1-45ddde6a471mr110866285e9.2.1757488403590;
        Wed, 10 Sep 2025 00:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:50 +0200
Subject: [PATCH v2 14/15] gpio: mmio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-14-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jTYzXHXb5czFalzYciLNM7kw2y7Wfknx1rBEQWD7H2o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTvYeCo2U5//1kw2eyb8GaFucYbACnhM1h1b
 j06xC/+zTqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cjZVD/9AFqlvniqbT8HvF7F7bzr3GPnqTQ0kCgmRscqp7Q9nkhIRz798jAllvC7arbNGc6Bd/RR
 C64IshK/9T6PmCTb+thHDxg39m28kKBoWH+p2PNkHLz4ekmmyLblZKGwCzUYg2qMavLi1t7OOgr
 3QuG/P4WFoXwe9ty7Z44O2ZITUKFWF+aq45RponrykKQtLfyg+257GPvlx+qj5oTiXV5jxsaEbM
 0Lptqy1v/MepVKY7QL9OW5xP4U2OnpLLHcIaxF7bN9z28L4JcII4h3oJn6B3NDss+cLn3uVNSX2
 4vCnNMIiibPIFdgzJvDuIU0HP4Rgvge9/sJZdobf/KwcIf1ZlrnqH7trBjzQ+v8tXlMhY44M8mE
 mSYlYN77g00pU1hZMXt2ptHkrBwtY+oknQfieQe31B9bzQT4nLf/yW7hohCkD8oR1YcVIPEoHGX
 4zh+hMw/Z9e6srBa1u0J0TMB7l6igulBC6BiOqd1qoxvJzxS1KvcYCKGv0bnjbEDiu94Ad+KF4F
 JUSl6rEBXpdR4lLTQ8P0T8cgh+b+v0l9cz6IpL2gRujbwWSF8wWko1Oe+l8Ob9qw673A1dV2UTI
 ELiQzt6TSguDmVitgU2Yu2NxFJAoOQfbuBnYqdqbb7DaNGlNAxUxeZNc8EpHHrdQNm5PMxraSAM
 iP+AJ2/RibBc5cg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001326_054529_74A1953B 
X-CRM114-Status: GOOD (  18.37  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 79e1be149c94842cb6fa6b657343b11e78701220..b4f0ab0daaeb11bd88723f8b1c15bd09225f1d97 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib.h"
 
@@ -737,6 +738,8 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
+	struct gpio_generic_chip *gen_gc;
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -748,7 +751,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long flags = 0;
 	unsigned int base;
 	int err;
-	struct gpio_chip *gc;
 	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
@@ -777,8 +779,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
@@ -787,13 +789,24 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "no-output"))
 		flags |= BGPIOF_NO_OUTPUT;
 
-	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = sz,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = flags,
+	};
+
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	err = device_property_read_string(dev, "label", &label);
 	if (!err)
-		gc->label = label;
+		gen_gc->gc.label = label;
 
 	/*
 	 * This property *must not* be used in device-tree sources, it's only
@@ -801,11 +814,11 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	 */
 	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
 	if (!err && base <= INT_MAX)
-		gc->base = base;
+		gen_gc->gc.base = base;
 
-	platform_set_drvdata(pdev, gc);
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {

-- 
2.48.1


