Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8745DC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=; b=Mz6YipYXZc+Tmg/Nr73nwwXOVX
	zxqMHk/c3y3FCBCqSIc9UJFlO2qvHd5d19Q0ZhHoElztw7c70DE5iL/oadb6JdEn4bNbcMplp42BC
	iBCQRo+PgyTwKi3fdU8SOJcJvuYIKpZ4F8VNBt1jIOrxhk94i5QHbSnP9t58WfV8jlCHq6Koj/hyx
	oJm3GQYNGgn2K6YIYt3HhmAexP0BqzARdWjY0/fBUHRUsL1DETlRFLCh7ZqkhmFc9NGVkqpZYtLWw
	H2bWuqfPyhQBWskLmViAIUkvrWMrjHEV1fgHv0GOlzGqr444LrYSk/2AIBwrRJ6mNIfhRydIsTUkM
	d6i04ZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PI6-00000008oGf-3beU;
	Wed, 23 Sep 2026 15:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PI0-00000008oEy-0qfM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=; b=Bup5jeVKhUvyYfARm2kRKbrdlW
	JbsfgBeTRtbefvfUgxFEsGvelJNNTDGWOqQKNVdaYpF7+bbxuaCfjngryPwi2VCv6SuRo4IDUJ98O
	9kibgYTPToAeW3D8bCebR+t+A7ye+iRH+P2wc0xv9ExctXxD+MPpPUBJaKWz2xia8Pzqow87MbCxj
	MRIaU/+sUIqDgXYIggD9pTHI9s788Zxma+1ask+kk0CAjoMLG457ONRUM3QyR7MS0z8DvI81cQfiT
	JTH5lG1sDBuP0ewxLdOBKoTVcmporrs7oZqgOzoRsyd6BMpqhThfOtEXl4P7uyep2CcPsAklAov1C
	CcgAEDew==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PHx-0000000EyTa-0tAT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:53:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so6669475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178820; x=1790783620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=TvxU6G5uR/SmOMwrZ+5bDtjCQ+cfF0/6+JDUAJvpRVDi3EDhQxgcohi8NcoXIWfGog
         AGmcaj3ua2RBfI/Si7w/iNvz1SCgb2G06iavXmaK04rvoNCqF+r7q/jnxfAu+uWenPzd
         RURUes1sRM3UIEcB9x3+eVI/ANa2sn/mKVwF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178820; x=1790783620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=RUMP+N7C4N6ULNla0hvY0nd5QxwbLPpVm2oOD0Y9IsT5ROEk1FZoMaXC8iDOENqV9L
         gBBYAlS+32vWmouN1cPXJ3w620cI2cPhs6+8jUCPLD744Y/HtkOMz/RaDHmJSVvie7zB
         cS9lQ/oT2P9sybpdlETVC9VwXvwfDVYJdKMjibMhFifgoMFEkOibZpiQgz6p0LG8S3Wh
         Sq4nKH7ohF9C8ZAKdyu63vyb3Il0kcwz4xfkCA/evV0SqJNMFs+HsJVMdfj+TEsAvtbH
         55lsrCeEeJzV/tGWDRDIQcBY/Nh9lakmdjJVRvw5ZpZVyqfMVG5PvIjT+OdtCULtuYKi
         nbjA==
X-Forwarded-Encrypted: i=1; AKwUvByoS0QaD6vBR6EMzHODs8OOX911Qj4iiTKbNhHboOc1TU3Qj6Oo1ArhCbQ/K4R6Mcyx8jZKt1SsF8W5zCpmHVR4@lists.infradead.org
X-Gm-Message-State: AFuF++m/HEI0CoW4P5KNdksNSW4exwL9ifB6vPM0ujpyLbOdWqXZoWg9
	dGb+fSek+D5HvV84kHhmG8tkEi7KYVKyxfd6KOzubDFqbz+jAy+9/gSokd9hwJxaduM=
X-Gm-Gg: AYBFou0Z6+g20zFS6sQIvnqIfEjnJdotsF2fs5+drB5Ofm44P3eYLv+Ww/PSL5wZQgh
	p3Qcb9MiGX3KNongn0RYRp8E0TNm6lBi4cRTFTCcT9EV6nONDsCidw6st53XSaNQP+0h1XszIxk
	yA0CEJlyyXu0XXpSDV9jcHVLyCocjYfDvRvU4v+dEEMHbBK51aI449gEwpTASgysjIOBpC7CTr2
	UnuCWgw68khfishRvlbpySNRJmQBheiM3dmysGruhPIH9Q1oycR5DvHVpZhaWCxHku1ZT1fsUAO
	k9fUh8VZRTHI2ZmHaa7xM3PmZGEvsRHC1PLG8Oh4F6WeRJ80cSTlQbXPU2pRjAKvjJ9phRzylNg
	/2ULGX+gU+Mcyg6jgfl5Uj1wTtfXYuEYyqJ09a/65y1Ar3wxoeufKIzIe5hrXnYg6EQTbRMqij+
	gnIrbTtdSps54gXdbyxkGDENifilbz4bsnjO+Q/bWp4RdiZdBXW/GVYnRGpTYZfRDdLWSEY4kRd
	Xl1JVEbJvd9mZjHWOGCz0AxGtDxrZ0vAqs9n0nd7ATPgQOE3kxWeMrd0xrCzMW/F0Lbwbi8DByW
	xTw=
X-Received: by 2002:a05:600c:1382:b0:49f:ce78:3566 with SMTP id 5b1f17b1804b1-49fdeffd72cmr43711015e9.23.1790178819775;
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 2/2] arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay
Date: Wed, 23 Sep 2026 17:53:10 +0200
Message-ID: <20260923155333.610134-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_165341_421764_5B960D30 
X-CRM114-Status: GOOD (  15.83  )
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

Add an overlay for the variant fitted with the AM-1280800W8TZQW-T00H
10.1" 1280x800 LVDS panel. Its touchscreen is connected over USB, so
there is no touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   |  2 +-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 218ff7fdf576..7f657d2bd629 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo
+
 stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
 	stm32mp257d-engicam-microgea-rmm.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
@@ -7,6 +11,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..7655c1bf56b1
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_out>;
+			};
+		};
+	};
+};
+
+&framebuffer {
+	clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>,
+		 <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index faedddc2c914..96b7cb6b5bc1 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -43,7 +43,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer {
+		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
 			lcd-supply = <&reg_3v3>;
-- 
2.43.0


