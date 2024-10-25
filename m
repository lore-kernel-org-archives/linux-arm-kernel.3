Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA45D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=; b=R+49eUCAWPm6BFy1epOkgNvW9h
	nDTLSavNlDqEVYtnPta+9NCXaq2XY4EbhepvVTGvy50HlFeOhAyn11oFrGN4QcsWZIdOSyS6Xgjq3
	vfniQrZUfYHnIXeZywAQ8L9XBNlHI/yYMO2Fec6i+aXbcFN/PWIXs8hSLvyBISjeGquyb2e5Q/65c
	HZTwAy/ksjK44vezfpx8jLUq7NxTtPMseUjygg8I4D1GYjUKo5nYylqsDgH/zFf08rStciItnIbmS
	eogLjOmuu0+9Dpb5KYR4RimIidSZogdn4I7YvGkuiOjYcv3PYZq5asJDIzoTbFsMBikh0Kc4TFK+w
	fav7UPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OwC-00000004mCB-0C5J;
	Fri, 25 Oct 2024 18:21:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvR-00000004Y7e-2Hw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d518f9abcso1664558f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876596; x=1730481396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=qi+b9iyle/w1O78ejPbW5KW8Q8vjN5PS1h/rsZ9vtorbq2qqcVXnPofe/v5E4bKSVy
         hlgWhCy6lrzEKlfRYFn6By1htv11TYf99E4RU9I9nvFvC0hEs/9pe1INOnPpw5M98TcN
         hRUu0xbQQcH7LzPH9lTxHHCjfur0+VD0QWqiBTxH8Ey/YDhz5VN0sjvnWoeI+EYeM5Ly
         cjTDIyJz7MblZ9xmmJ/Y8DHO/uFZ6p6JjY/pWDkQNzPs5XoHLR+RLNTDNjgcKsfwfvXf
         mMsjSHYeEFVRtmjTzAxUAaqo5jtPonS6SD42b4kFw7ZN43VCQTeBMXbuqg9PocLZW9C6
         6bLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876596; x=1730481396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=llTEvjULAPpsLZWiWa2PJvpq/NB8dAgS+a8V6lxXOD3KBaCKKmgmJB5h0HkM0pt0oj
         NCjKFY9H4gWGzx24SrkmJ+mz0iOxlPhrVQpX53NCmROswwG+lDIHVFtJS0o4KTrAUvGJ
         cxjtVaVjQ8zi+oCLpliKaNMc1a9LoFb63tLv9tTErwufVJTsuEdT7WbGWfY58THaxwul
         04zaPXc1hOiWYm+Ca6V52AZglIjReYdRsFW5wPWoS9Jfs+qS47/PEArV5T9FvdsdjwIX
         Aqr6oFV3GAPT1h2qqiW0e46q/Fqu2t3aNMUjZAgy/BLSUzqYUAWTpPUzcpZPLm4svpD2
         /VVg==
X-Forwarded-Encrypted: i=1; AJvYcCVD0r+RbCYC7jvYLo8G4yK9EeysHxabLX4WXdr/8kLvH+DAlOSrZRhFQjsJsicMrFaZT3sbzhg9+krIViRND7fW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/pFu9BXUv2cOzDpk5NCXM7C0z39HYbgO5oJidupHhjd66L2GJ
	Ggt9kmQBk5ngMcwcalojyuG+DYCC0cZpk2x5yAALV5ByvmP1MHiLFMOVkPVcuiE=
X-Google-Smtp-Source: AGHT+IHM4SY0KfVAQSpJ1+ccDJ+C4lsK7yh/l9hYanouQQltriHwErlFPV65caR05fmBTRpW7n50vQ==
X-Received: by 2002:a05:6000:e42:b0:37c:cec2:23c6 with SMTP id ffacd0b85a97d-38061208e5dmr101866f8f.57.1729876596081;
        Fri, 25 Oct 2024 10:16:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:07 +0100
Subject: [PATCH v2 36/36] arm64: dts: broadcom: Add DT for D-step version
 of BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-36-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101637_645616_E3C7C138 
X-CRM114-Status: GOOD (  15.12  )
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

The D-Step has some minor variations in the hardware, so needs
matching changes to DT.

Add a new DTS file that modifies the existing (C-step) devicetree.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/Makefile              |  1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 92565e9781ad..3d0efb93b06d 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
new file mode 100644
index 000000000000..7de24d60bcd1
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "bcm2712-rpi-5-b.dts"
+
+&gio_aon {
+	brcm,gpio-bank-widths = <15 6>;
+
+	gpio-line-names =
+		"RP1_SDA", // AON_GPIO_00
+		"RP1_SCL", // AON_GPIO_01
+		"RP1_RUN", // AON_GPIO_02
+		"SD_IOVDD_SEL", // AON_GPIO_03
+		"SD_PWR_ON", // AON_GPIO_04
+		"SD_CDET_N", // AON_GPIO_05
+		"SD_FLG_N", // AON_GPIO_06
+		"", // AON_GPIO_07
+		"2712_WAKE", // AON_GPIO_08
+		"2712_STAT_LED", // AON_GPIO_09
+		"", // AON_GPIO_10
+		"", // AON_GPIO_11
+		"PMIC_INT", // AON_GPIO_12
+		"UART_TX_FS", // AON_GPIO_13
+		"UART_RX_FS", // AON_GPIO_14
+		"", // AON_GPIO_15
+		"", // AON_GPIO_16
+
+		// Pad bank0 out to 32 entries
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+
+		"HDMI0_SCL", // AON_SGPIO_00
+		"HDMI0_SDA", // AON_SGPIO_01
+		"HDMI1_SCL", // AON_SGPIO_02
+		"HDMI1_SDA", // AON_SGPIO_03
+		"PMIC_SCL", // AON_SGPIO_04
+		"PMIC_SDA"; // AON_SGPIO_05
+};

-- 
2.34.1


