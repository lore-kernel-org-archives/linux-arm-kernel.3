Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A62E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=; b=Rw/K/NJ85qKtAXeyHXWf1ju25E
	ZwyzVbOSEuLasDbg7fguc9Ihrq4QU0B79q0axqfH6QrtxjzswrQcTyFug6ufD3wDtYB0FtkYAu2YT
	wtSEKnPQw/4BT2X52Zk5jqvU7+gWm9xk+5+TbwodqMSlkV3b54V6TIQCKh30NENHB/VexuhnDNAzd
	j+F2/E0wpYAb3SuPef39pPrYKL8DZSH3jzWBi/NKehDer1FAwLu4ygHaE8hq7wqDiOuo4F7B3VLu1
	44Vj3tmOgsbJbTkhHX0ul3P0G0FmjQHwm77VcIM/k6YjVSU4n1tQkKcTMORf4MihKOhfg1AcmKDUj
	dgZayg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuYT-00000003yHg-0MKr;
	Sat, 07 Dec 2024 13:09:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuUa-00000003xfn-2Blb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 13:05:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fd24730dadso1853821a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576703; x=1734181503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=fD1Ci6GbcgyPwW3q1zhZ9MWQBjCQcPUz21EhRth7umVdX9ihZbwyVyZ/W0vizK2C5t
         +4kfC7Ot87rYsNeg5Xf5MCCTUblYxkZMVrUXdhEOv1qQqe3TJd07qOWFBhE12VJomqQV
         6HVUDTzh9xl/bI31d62HWJPXg6O/KUCl1OcYOzfj9hVLeVqYP4Db9wUFOdtNj2ZZmCZ5
         RHgNwvJitOP2iq8OfjRAMG+xehpyOL4DBPdp8wGAyYzp/W96XjsCIBTDD0GeLeIsRQu2
         xUa+FnTh1Ig5fX45yA4S38FnFW1zGx/4Uli20cXBsQNO6gw31KPKXoHmuRzSprnn6UvO
         JI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576703; x=1734181503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=gb80Lzo5n8XJ0GCdUchtvghQIGj3KHpKGqZj2B4eqrDCa3DkGXaarac5PG0F9D6Kae
         pxP5J5pFGT65DThIJjSImnGvZgJL25eSm8OErqo5BlgksmCatIlIdGhuDMzmtoAviqEn
         DaQp0LvcNOCcsrux60JTF23rOXCk2SXMxeD5Sv7VOUebUX+ztK8ekpYZpxXtNvefaTZA
         YXBS1WsF8yXlYwZInOXT3qLZvTxg9SvAchBdse3H4eRVZZZzaqeH+03IvLEa6xVds1Wc
         4FG8t01i7qXCF9x9X5yE3FIz2Zf7qYFxaIPygP0PhMCG4yQOFm2d/IVeTSe31V8v6je/
         Gdrg==
X-Forwarded-Encrypted: i=1; AJvYcCWQTaNQx4px3zXS2RbzwThjCDIQDHNClOcNTsL0DBO1p/qlT0mZU9WYscl5j4JgIPF/kXnIOrK2I2tb5uazZXzb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhpo8x9NEug/6yYD6kdNYhnSxBckNmUiADTXx3C/4ICasC6MT9
	jbezvFG3/7vCA9GBKE35ezHTI0PIyKjDaub92jtoifeBlizoicVCC98d4Q==
X-Gm-Gg: ASbGncvSD9BtGOc/oZVdr+6YyrE/h9j4Dyk1aTQ73EF6x01Ckme4DtiwrLuNyQ1C+hq
	7aflg5gy+8w+yT7v7Cxa4pkxVAmRY5KZ2uS89DRoQvCSeqpyrw0oBJ3kqGXK49UVZlKbYCHs9O6
	AuKcI5Lsq8L5rPo8o07IAXC8gl9JvtAp6C7GnYzCX7sXLq2nadRcuiu8HF50syc8HBUg3qJ3kSs
	hqO8TCu60BU/59jjftB3osqelaWj7lyZnHWYRr17uvz4M0Awg6zgEe9IUqVCD30iA==
X-Google-Smtp-Source: AGHT+IH0D/Yd8zXEABvPSshTZ5GdofWvmFimE7bz/L0Dg8+hzOe7KfKe6Ge/tMmMUKD8ETbyZzILpQ==
X-Received: by 2002:a17:902:e80b:b0:215:97c5:52b0 with SMTP id d9443c01a7336-21614dac17dmr93533435ad.38.1733576703350;
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 21:03:16 +0800
Message-ID: <20241207130433.30351-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_050504_553647_0912B394 
X-CRM114-Status: GOOD (  11.12  )
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

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..36de76bc6fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2204,6 +2204,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


