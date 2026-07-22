Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48ADC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=; b=0A6/UNVuXxBgV/vtB0qxF9AKZG
	AzTpx3ssRPLHZ2tAITernGNZivAjfXisJx44CQRx/ehFr9o8THnHdHb8hXe3Rox1AgSFTJ2m8uFAI
	1jZCJ+Wq2WpEWAq4qLhSmYpBsBK9BUtBWjC1faWET9Uqs6tbiyZUpo/amwza+Ae1EOrvyc2MiQ6t0
	SwvWiFodEGxvz0uPjuu+X/NEafYrypcC615j6bBwzwgn/FG34+NvQ3L6mN5itH7ENHZjPgLHd90Z5
	JFL32Bcsw8p4phNebX962Zt1vkxxnkN0HkRGmfVEh3XdUN1iKXnxUMsRGad5BSr5mYK4ya2Wa0bm2
	h5dgjFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgg-0000000BT2k-0WfY;
	Wed, 22 Jul 2026 09:56:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgU-0000000BSxL-17eq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:56:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954afac04bso46336385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714172; x=1785318972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=q1FXothOgYSNlzAYYhRqGAHT0KpVKl+xPxj/0IrdkGDvXerzKo4hAf6M8LvTsyd8ly
         RIeHZhjbo3MW00UH9O+8nqLMdSbG+3angz5eRRWea7aR3d6xtjjnXU0GKoYNifccu3LH
         +7ve5qxH1z2V06M2ETxCWs3EOg9sEsAISQ3pDOKSfDOh1CC3I5L8JwyM+66mAYZPggVU
         1AdQaJuK5f8uBGVG54MGb59jqnQ+lNKVmi4MtMgm/Zyu3MfRrnD6PZEAR/zNTN5BlOMe
         4chP/s/0FAezQkptezQ3bX/JuEhOAIXAHkiffag+F7VRPESEhiLX+WTdd/FBkCpqj1Wl
         UDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714172; x=1785318972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=AzQqA/Xi7ynZnbPyBLnqNvlPKVTniDih7kuoXt9cN6uju95iZWlMzZie76g50uZgRT
         9wyRdgj7dbWXSb0jBEn+iLvNKqhDxCWue4WdzYaN9Ips8b5rU8eqavRIuL7a4OJkbbei
         lHQhUPd3LRGNTGi8BFc4Gvmw231v48VnSgqfaBcY5yYKxDwdX2tsgC3p9G5cWwkvuAHk
         XEYr5BSDzGdkejpU56D5dCyER6KvWPEKfMO7HiNeKL9EUpZYtCs8Cz2M/zzepN9q0aJY
         KOO1kwO6DtlMI/st68vt+42D8cj4bGIHAfGYZAnfTlS1TFFIqcLpvx8VyF/5NuSn7zDZ
         U+xw==
X-Forwarded-Encrypted: i=1; AHgh+RpkWKbWBz9WlTuPivLv8xsS/p+Le+HHZ4RUDfLVujH2/m2wbXMDEGyk5/weSJu2yfnCOL83ZfBJUmsQU6MSEtl/@lists.infradead.org
X-Gm-Message-State: AOJu0YzQWIc9qekrD+RXPcduT7aslqvX7P0MShp2kvcgksw/l2ay5E5D
	P8VYlJUf2re37dW+Q/GAeew/IX2XsE7bW8cVrvQzxEEVs+2Iyw1vqeOY0z1duBzFbWw=
X-Gm-Gg: AR+sD11tKNeDk0Xeclcv3BxqA/mMF6LBfNNKM8Z2890e/Db6anR4tSGhU6V/pYBQ3dc
	MbSpemwrwrmnWS8BZy8Bggd7ExCFnwkKV496qI6zUZOlZpLsGIg0GbxV6QHBIYWdMue+4RyvUW3
	EWPSeGt+NOXljtifiKv8/+trHCqIz/R0KAYMhFG2io67WZLMK+UwachLEM5B+az5SyYBLI5vdeH
	QoWI9D2/8yQwWiNCsxgQrAMbYqInkwPh5Oxgw0BTpmn1nn5TXMLwAtgLbqJ+y/7McX0Pxq6vURk
	VgZMWyCkoxPkrNIxm/c5ccQnT8iZMNVjUQcMJSCMyaWZjU9p4I1rWOzyS1SOA1sopUmsWZhq+j0
	BL5EX9bIXC2uvTzu64fp97O1YKZG2c9NxiSyE+I/Z3BJbpBOEZJB4UKOjr2zlAvG32gQ6vPIyQv
	5gK1pNdLFPPWi3Z3+lkOzYRO77QJztikGw4Z5Zl2RYRScD
X-Received: by 2002:a05:600c:2156:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-4954a411570mr205769225e9.23.1784714172235;
        Wed, 22 Jul 2026 02:56:12 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:54 +0100
Subject: [PATCH v2 3/5] arm64: dts: google: Add dts directory for
 Google-designed silicon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-3-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2691;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SHnnOHycO1M3KzDLgoFhcyeeohmukEIp6feU5iRFhhM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO2NOwczhyNRIb4wdxPQ/5deipkuZ22m7G6C
 3osSGVwLVSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtgAKCRDO6LjWAjRy
 uoP6D/9xSTEuwM0zy6yW60c2SdWiUsBjFzss9dmvogtPOMldBMfPCutZSeoZh/UMm7wb8dfBGu8
 wSUn1z9D0BA9VaE2oOtE6wgKfjEhJ+liXJbqwGG5rTwcGOBAyKItpqBNuKEH1JoAbMuQ3JY/m23
 61bcf2dT3PPPM8C/MVaIeII1H2NO56X4HTEq/LQEULXAphVi6UX1pSTS8MYoBzhTpNjTAG4Nfwu
 LFxEnqs12faS/yylh9vn+m2W0jPUpThWUCsmysRf1lVnV70iTP9Cvfli+tJm8Evonit5/zmCPgF
 uAWoJTAv9vBY8tHVneok2tVV3W0a5W5ky6fWntstAZSLTTLjb5OGx9OGaMVUovYhvFUb/KsDWIS
 ItlfYpSSzbfV49aBqxJ4LG7B+NlR0JesXlCbvDVOks0b3/CRMBuGmcgUDXZAZkGu02RNsfFlt6B
 ynDfop26Vyu4+1I/vg+53vcqwCaY2vVOLgrwJ1DyxnP40V42AgPjpGWgkrfO5F0xBS5gG74eA8a
 mIvMoqRXD4tY/DciX6hWq6jNso6V3v12ijydSKmHs5OMfLB2tZdjw/BW79Bj26SmiLb+Ut8cyd4
 ncBUPXYTfujc1RQIC5N41vL/IdnT/KHI2FME21v9mCxdd1yKjQj9Wa8b0B8U+xgvuota8afu2/r
 0a/92dGFDVfSitQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025614_341637_01E0D068 
X-CRM114-Status: GOOD (  18.67  )
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

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c61ef65d71ef..010d4de81a1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11012,6 +11012,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 72c812e76b0b..f83eb4ea878c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -147,6 +147,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 98ec8f1b76e4..566f0c863d55 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -18,6 +18,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..a6b187e2d631
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.229.g6434b31f56-goog


