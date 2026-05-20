Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDE6CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 00:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0ubYMzKkPwIELjCKI6Oon/usrmm5Tf+jdhwqr1a+Dg=; b=wo7nFozMWnu91ST6+ato2fRUAS
	vvDd11be9bi+qrluzfOjR50DybQZdGDsSEHxSN12WTR5fENy1njoBju4hf2+MfldZpAbDZyZWtnKG
	AvJBXoFGbFIncUfHRyaTyNQdZ2u0Up+yj+8LQZSJFOHIxNKNgo/WqwYOzC5xGinf6vYkLVCsC4CeZ
	iecuQMdvUvCfFdt1monruVgu06ZrWK0xBzSDPNfZ5nPUO6zi9XHjnbCbBD9QFCOKFFVj5x9a17Kgc
	OgpucFoor6yIrzbCmzLUTMlq+cMsHr1IwUyZiksaRFXYUiajsqy+ryGebjjmDU5+QQn8AKcY7M2UZ
	Uk8ING8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPV5N-00000003B1P-3etI;
	Wed, 20 May 2026 00:46:57 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPV5L-00000003B0r-2gf3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 00:46:56 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12c19d23b19so5854139c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779238014; x=1779842814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0ubYMzKkPwIELjCKI6Oon/usrmm5Tf+jdhwqr1a+Dg=;
        b=Kf2bgmpLt9QbcZTQDOQrHuk5UziP61HC8l0LpjG/L0/CUNKt1nU01QdgV6SkhKz5JK
         rUv32Nuoux5+tFt8aE4A4LI7lWbc+Cya6yMO4O9iY651WeXHwN8OYgEOR7tyIwjpNUmi
         mIIu0Hruc5maXvbH5Knj1DAaDJVQoODidsmgKTYMqpTgbuQuNkWfw3Nyrjgelx2BZ9ed
         hVko84dKI8ikY5vIZ/gBjvDSBF5eENNClakWEUXnRJZBxh+8/EB7cicv36H9INlLqitT
         8xgGzK+ffC7j1vqHzEvTTZ43M2ZW+aVZYyluKDHJJgVPcgf8F9GakRnu9ghvhMDchZE1
         AUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779238014; x=1779842814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0ubYMzKkPwIELjCKI6Oon/usrmm5Tf+jdhwqr1a+Dg=;
        b=T/86YNkWs/6gcOAgOrRZ+Os75xQQH+GDPKDzmryBaGWBXkg8PTzB7EOb2gBxAKQcYD
         cIqHs5oGXOHsdno95CzVprezsi07m/apbBFzpNgCi6DWDzIzZo3eZrjAVuyQmca1fG8W
         I3DljxmV/uwv20vgSpFJbPF5dq6gsPBfdpQ9FG1sjAwhUZZX9xzgxmpXYXH9fhv7PNw/
         SgjZt01z8fKDH1XCT8U3XLPKdHzqdRX45O3RapBfnjpjj6h8bZFF6hpmnYEKI4IJ+xbV
         lzM8n3bd8tC6VbUBm5Sg5LBY8z8KrzlcdhsTFXubxMoTQEfYmThyfR4bvmLgZ9y1VmZQ
         TMJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K+drYrqNdLMfPPB40YnZJcJz9dWMq86i5K5Yy/9N4Vih2buudB5QOZ/8gS/jse3eN+OTyZXPNY0lpwPIFRsQq@lists.infradead.org
X-Gm-Message-State: AOJu0YxvFQv+DYoeoW8hugBHuHQFt4rxh2I6A86hU8mYLoKEhZYZ+K6L
	jtV2CmEzKCi2GtoWMfba/hlHo2E8hPMoPCfvb0XzQw3QzFnNE3s3whBG
X-Gm-Gg: Acq92OFfVRG6eABgiVY4gmmewu/33Fy2yI+PEsEkBthSbwbL3wzz7xA1U1bLGaa+cww
	H1/naMoHOxEdMuJtGlJbUGlSu+mjndSg7c0Nv/GuK/s1tW56aR8vjFlyM7RKmBR/E68VjEAnM0j
	/21JKEGbzOFrNWfxLmfu3lqFtcPHEgJ4dYWE7aMUIt3o2tAk//+y+yGkinRMDPzZT/cmVvorEKA
	MV9oyrZ8L5qsj8wcuy23MMgs6SLuanPVnNsiL1yilzgOowibeMlePs9WvWharD6/JdpNCiC0rJX
	X+i/8RsMTaFod+PxGb21Yvc1Dsrv7dzjRl1Fw6o+RJ9mE4l/f8qgt/ITqVPKv7Jo/MAKFYe0EeQ
	hPQX4aAeo+70VTLuRLo3CYfaIC2/B1U6GEHsH5lY0/oYiwfTvM8u5myJrPVTFfqVgg1avNYpLuP
	f1EEcBtPNvwmxRg6UJfNDEVMe95EfnP4r1yZIhjSDnagWgvy0aBUnsNuVkpWUvmxOc
X-Received: by 2002:a05:701b:271b:b0:135:da70:c2d4 with SMTP id a92af1059eb24-135da70c454mr1271166c88.25.1779238014087;
        Tue, 19 May 2026 17:46:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7677:c3e6:c92a:e780])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm25928705c88.7.2026.05.19.17.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:46:53 -0700 (PDT)
Date: Tue, 19 May 2026 17:46:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
Message-ID: <ag0Dn66ZVnbTc7J2@google.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_174655_683132_7F2DAF92 
X-CRM114-Status: GOOD (  18.28  )
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

On Mon, Mar 09, 2026 at 01:42:41PM +0100, Bartosz Golaszewski wrote:
> With no more users, remove legacy machine hog API from the kernel.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Argh! What is the replacement for this? I have patches for rsk7203 to
use them to get rid of legacy gpio use, like this:

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index f8760a91e2f1..5bbd3b31cffb 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -12,7 +12,7 @@
 #include <linux/smsc911x.h>
 #include <linux/input.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <asm/machvec.h>
@@ -165,6 +165,19 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
 	},
 };
 
+/* The base of the function GPIOs in the flat enum */
+#define SH7203_FN_BASE GPIO_FN_PINT7_PB
+
+static struct gpiod_hog rsk7203_gpio_hogs[] = {
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_TXD0 - SH7203_FN_BASE,
+		 "TXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_RXD0 - SH7203_FN_BASE,
+		 "RXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_IRQ0_PB - SH7203_FN_BASE,
+		 "IRQ0_PB", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	{ }
+};
+
 static int __init rsk7203_devices_setup(void)
 {
 	struct platform_device *pd;
@@ -172,12 +185,10 @@ static int __init rsk7203_devices_setup(void)
 	int i;
 
 	/* Select pins for SCIF0 */
-	gpio_request(GPIO_FN_TXD0, NULL);
-	gpio_request(GPIO_FN_RXD0, NULL);
+	gpiod_add_hogs(rsk7203_gpio_hogs);
 
 	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
 	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
-	gpio_request(GPIO_FN_IRQ0_PB, NULL);
 
 	error = software_node_register_node_group(rsk7203_swnodes);
 	if (error) {


If there is no replacement maybe we can resurrect this? Or shoudl we
have add swnode support for hogs?

Thanks.

-- 
Dmitry

