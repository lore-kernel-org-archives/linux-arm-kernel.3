Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F294C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSIortSLz+rDmPiic3Xz62c0Hjg34gwIBpyNu44lTZw=; b=18M4x9e6yHR75FORxD8jjeg/4W
	BnWjx4HzWrgzqV/dabO2NJ0EMr9lIRgMaymUtkG3uBIZlSIzUL8I9DZj0yDZMlvWa7jkJ9fhWGWPp
	lpRote0Mefj5vQRhXVeC+jAyB7mzbqT+KIvYtkYBQifrd4Bnucjg3pOhuxMcLhm0NnHo2Rbq6FaJ8
	KC6yWBN2Atya6AMN0axv80uY8Nf7MdRqzRIXZgecUrzUWbBMHbi2MF8vbFSASIlSkh6vG7kq3wxK3
	vu9vYRbqKaq1rVQzhPxHTO4UtgO5jhHC/7yKl19XbXg9Ylvmwb48x2WEgykE2cz4IJaVtUeIiXipk
	tNoVcs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9M-0000000BC1R-1gGs;
	Mon, 06 Jul 2026 01:29:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9J-0000000BByS-0uMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cace7da66eso21674885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301368; x=1783906168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSIortSLz+rDmPiic3Xz62c0Hjg34gwIBpyNu44lTZw=;
        b=ctKAXBiKhc1ZZ3VrVqR9ATZDkVQBsCahRdNrkAT7zB6EN3lQ9QD19jeuiBs6hnjoQ4
         0Fey5kdCyiVDAqry7t/sL9zf5Hnq+T2tu7XBZkIPgrwaKrV5w2IJNKk7i6jXuJ9T4B0v
         jWoeHwCvEX8d7H3rhAu1u4tGBzII2GKcHPscM9HW2YK3QxuAQM7bV0WYnck5Aa78Fh2H
         5B11XQLgo4f99ZwMoJV549j+6XOaB9NGd7z6W2B1/rQRzm4IGxbzWWwTb+ZQM77x1CcQ
         TtDMRQivJZ86+5uBD4gE2yRRyfswFkeShbUjERNE8hcEibV9dB/WcmLu/iMs+zTe6T6X
         sWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301368; x=1783906168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSIortSLz+rDmPiic3Xz62c0Hjg34gwIBpyNu44lTZw=;
        b=X6aEVVPv8NrS6yrD8SGeOP5rY764my2LWSNXlpLAl3Z3cfIrL6lUOLaElLGZ/tt77b
         Z/Z74hXEctfOszxv7/EtbjpOD5KfvbE4cKOhFwsTZHme+6erTpeD2KLwnVlNQW4p/6mc
         yHzFDMR90B/a6WB+MIhdACA2hpONKwlWvDySdAjqu+wgMgqZ2f+6Zdwtjp9nR08K1zwT
         jrCkhu2bvUUQpSvbkT7jYsjo97XzLxGVnhybiMgBR2ptXbdWxrE/L2bmnGyqe754DT5y
         KC+/k3Evy22pu+UP9aXIcOwrMFXbyAQLEf2OesicOYBqQjMSmuRze/oAlSJf5i8TyVq4
         ZfZw==
X-Forwarded-Encrypted: i=1; AHgh+RrZEqy/ANO0IGUL0w0XWIhz4fapcFJtuMvu5IGyRKQqd3mYkGNTaqFDK2OlgVEoxFMnHHbw0kfYbf0J6clZ3d7n@lists.infradead.org
X-Gm-Message-State: AOJu0YxhdcXrWo9WixYjXPqugG8JLC4ymp/N8yPu53jpf+ExF6ALhgSu
	jRcCHj3IGXg5GLDuJpZxVJdb1GrmC/xZ+s0tBAhkNcEvggEM88GrPkJ4
X-Gm-Gg: AfdE7cnKnaeV3XxKLidrKG4kxM6Y5r+02Lsi1+K2Je+ofBiT5m4muAaREenakZVzmmg
	qgKItojDYK15WCcavt8y1DALbvopnxP9JHl3toE5YVH/rH8iXgsS8J2EcRulO8CNDq3xCLYWLhO
	QMvqjHkNrqshMhA64hxNbGQoIFI6wO0rZcNmoEytCBLc6n7paDTGti0bNMqg4LJcrOwnBdLxaq2
	CLO1c4jWqoJ25/keOSOoDzJ4xZ2n5KSOoqsyPp8t0gQ758T94jPJ62rs4Ml+P35GiCeVaZ8H/fa
	htxGQY2vW5qpTiseL9aDHLYlPcDAxVCWOx/EM7uzYZUw0321u/3zvUTgzpiW/TysauaysR2Z43E
	wwUsZrb9dBfRq7waPmolg/zVySwYmPKEG3ILFT1P55g/zZr+JPVEwEnEQ6FvbgWrrF+3zku5aOx
	4F/BJlE+z6lYGZdNzn7+CZMwlk0HZCWy8oeePn52BsbIfH1kdFXjhp/3yJGRB3Iqxo5R2LdHQ+7
	Is=
X-Received: by 2002:a17:903:32cb:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2cbaf43ac77mr76872615ad.6.1783301368314;
        Sun, 05 Jul 2026 18:29:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:18 -0700
Subject: [PATCH 1/7] ARM: orion: register software nodes for GPIO chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-1-07d95ef4f447@gmail.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
In-Reply-To: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_182929_263103_3923769C 
X-CRM114-Status: GOOD (  14.16  )
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

Register static software nodes (orion_gpio_swnodes) for Orion GPIO chips
during gpiochip registration in orion_gpio_init(). This enables board
setup files to reference GPIO controllers using PROPERTY_ENTRY_GPIO()
when converting legacy platform data to software nodes.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/plat-orion/gpio.c                    | 10 ++++++++++
 arch/arm/plat-orion/include/plat/orion-gpio.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 49e29b7894a3..7e3e755cb85f 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/property.h>
 #include <plat/orion-gpio.h>
 
 /*
@@ -93,6 +94,11 @@ static void __iomem *GPIO_LEVEL_MASK(struct orion_gpio_chip *ochip)
 static struct orion_gpio_chip orion_gpio_chips[2];
 static int orion_gpio_chip_count;
 
+const struct software_node orion_gpio_swnodes[2] = {
+	{ .name = "orion_gpio0" },
+	{ .name = "orion_gpio1" },
+};
+
 static inline void
 __set_direction(struct orion_gpio_chip *ochip, unsigned pin, int input)
 {
@@ -522,6 +528,7 @@ void __init orion_gpio_init(int gpio_base, int ngpio,
 			    int secondary_irq_base,
 			    int irqs[4])
 {
+	const struct software_node *swnode = &orion_gpio_swnodes[orion_gpio_chip_count];
 	struct orion_gpio_chip *ochip;
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
@@ -554,6 +561,9 @@ void __init orion_gpio_init(int gpio_base, int ngpio,
 	ochip->mask_offset = mask_offset;
 	ochip->secondary_irq_base = secondary_irq_base;
 
+	software_node_register(swnode);
+	ochip->chip.fwnode = software_node_fwnode(swnode);
+
 	gpiochip_add_data(&ochip->chip, ochip);
 
 	/*
diff --git a/arch/arm/plat-orion/include/plat/orion-gpio.h b/arch/arm/plat-orion/include/plat/orion-gpio.h
index 25a2963e0e0f..e3dac6e8a1b7 100644
--- a/arch/arm/plat-orion/include/plat/orion-gpio.h
+++ b/arch/arm/plat-orion/include/plat/orion-gpio.h
@@ -16,6 +16,9 @@
 #include <linux/irqdomain.h>
 
 struct gpio_desc;
+struct software_node;
+
+extern const struct software_node orion_gpio_swnodes[2];
 
 /*
  * Orion-specific GPIO API extensions.

-- 
2.55.0.rc0.799.gd6f94ed593-goog


