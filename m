Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=; b=mIKcvC6mioYyEaFYVDbA/SN8RW
	ndz7vPoObws80TuMqREiM0ScLrCEb7hFGVCoW0ZkANkDdE4y7NvJbbWCYjZ8bOHQos5NtOqLfI6Ch
	gKBkbVxeF7AnrCJggnusB9t6fniBtYa7oyhTYKwfXw7Hl6bTJ6B25w9AbjogvBKnubtjXPg+9l5CP
	HAowNBC0gjYX9oBHXY5V+sNdmC4OOFUfWaHwuHzUdW37slSvZn40tlHII+6WYjsSygTL5NqGyPq/o
	vNgSGA70Er7zDzCo3RKv2LrwgnNPhI+APkvjEfvG3pl1p4SukY2AVNOhg59OY4vq3gTmRjXlnuEeT
	2bY49w7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCf7-0000000F1lF-0QJL;
	Fri, 10 Jan 2025 10:54:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCdt-0000000F1Sq-0TuD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:53:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21680814d42so25891155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506408; x=1737111208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=AWDYqkNtmHMR7hU1ITKELfkK03ZpZBwHeZ8gzDuUOmpZ7J8L7oRA/z1al3U4j5vKkB
         2+CrlTFc0t4peaFOXMWaKJ3yFetGQWHif8RmZAOVW0Cz1yaDbxnzUQ7UJtFpS5JCnUgW
         ffux8b/vfPpQZUR8TreJ167Xn71Tttsw/Vb90xmgWR7bG9LV6KcYbsUi72k21B7T9Zlh
         lwv9NrV22+PlGMKPTlfr01ZrbF9231uKHo3sX1d/UCUX5knlPyWdI5Q6jYlFskJR8HTT
         ePbdlq0WSRo+YzQ+dmp9m3lM0vXBcgSQh1vmupYWnH/ZbsRZ/CUB7WU3lX5U6nZZXwnk
         vdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506408; x=1737111208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=sgUzSNufONwEsDV5znJj5CDJ6aKaDdnCYbBfeWm2kapZpETClTP/bdSVspAC3SXvlD
         OcgvM3BdmP2Bb9h0I7jXlOAeK4Q0rk69H5tDkHO+GBgC9Ih82Yc3OoHlEqBpfUjkqEZW
         sIUWWPhQWgGbaH0mAgJpxmQBiU0Mxj7Rma3doAh4mfapofdYnG4c2OVgJ4obbi13qKS/
         um+AKMSUEUz3AeYpjz+PXlNMVlB6KYPw39exIpSTOz705V2SoEdaHAfmCgQjHh2eZTtx
         k3UrjhlMWmne/SIS+5voTayoeavcZoipNFbQ6r44f64ytb0j7/4FV2ad8BUyjdtPneFC
         bIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcq+8AYBIk3o3jGQ8sKlHXB8btjT/1rPy0+3VWkyTf2u5Vr5Gb60qzXMrOb0mamxABge3RhqIp2vpKjAr3DWM1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu1htv0WXo36a9kXtfcUCxpWOJCs1qtuaVWr8CSink8AiHuDo1
	JKNlP5rECYhh/wHrb298eAcYLY24qDs6zznDMOOUzxnHyVcif4uq
X-Gm-Gg: ASbGncsChVbQkbcbvyTX9Dkv8sjmcgGWIRgS13ZdKnZc80vJR83fB36PKHDIMleGzR7
	c/8Ca6IhXPghQ4j46I2CVqzY+9AoPZSYlw34Ql54VRddvU7huB50cCpTewH07dkbSScGZfvIt11
	58JUwSqdjD0JssKfVg9/NmYTFF8Cd6dNtJB3k75gk8DJjGAwVEwYHv+le3t5lRrMLEceKfRfQir
	IXopYJiM8vrPVg4tcC6EtK8owdpHzFm0WyZF8uKMI2J7wDtxmTQHnFgbg==
X-Google-Smtp-Source: AGHT+IEbb2zrjQUcRpFceG3h0m+QmzccmW9rBwdvM+e9BHDcwkzyX5aRGRbjkKUMhgcXHh+nuBGACw==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72d21f4b05emr16485016b3a.8.1736506408063;
        Fri, 10 Jan 2025 02:53:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:27 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 0/3] Apple DWI backlight driver
Date: Fri, 10 Jan 2025 18:52:03 +0800
Message-ID: <20250110105304.71142-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_025329_161774_85F70128 
X-CRM114-Status: GOOD (  16.94  )
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T
nick@nick-mbp:~/Documents/m1n1$ cat e.txt
Apple DWI backlight driver

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: apple_dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1


