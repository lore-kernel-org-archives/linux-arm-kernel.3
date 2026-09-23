Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8835EC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qgYEofzcD0eUBX9qHujAnDMeKk0KiqVJqZ/6o5oZEs=; b=O+R64Lm5RqL5SjQfJzBmWXum0q
	HeArg3OSJAMQid4EGbV4vIUG4bHUsC140x9AcMPOLKVW8SdRVFA8gVaPSsR3xL6wNjXAMjaGxBjGT
	sBlrxsb3g8CxoMxsN2d1assPWracrA9l+59mOf/6xVtHUr+tEjCDrphGx1865bc+LHQcfAL1WKAYF
	d0aIR3Xm/XIdchsbUA8Nr/ESL8VCp1/s1L75mtq51q/K9yKfK5fwgD1aB2+FhEy0Tv/qO0IQ92vdv
	CRCHPoM2HqhQOPHaWnmdknyH/6oa28uV7p6IaIoVpkXNlvRFRTimmMq/Y+p43mmPB1ZXR3S3JwWK1
	hZusWekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oq3-00000008jGr-1n43;
	Wed, 23 Sep 2026 15:24:51 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Opx-00000008jDU-0OMk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:24:46 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356256so392298f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177083; x=1790781883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qgYEofzcD0eUBX9qHujAnDMeKk0KiqVJqZ/6o5oZEs=;
        b=UWyGfrjQqGv1ksMJJOKhb1OIANZ9D7FBWpv+vkt/KDBzIAAcPv5pvpNT7++WzWB+bu
         DBdOelZkXjrAFbiXIY0fYdJ548UwDaZTKPJjRTl9NeRfKiz9WkndUlYNIOmCEea4JXRT
         2Rs089gcEh6qEr9hkWsOSQ7lEKbgw1YhwXvN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177083; x=1790781883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qgYEofzcD0eUBX9qHujAnDMeKk0KiqVJqZ/6o5oZEs=;
        b=E997QmA+LabFEEhdOYNQs4qCPr6S7zmyUnyv+/RiNIIfSyCmWPqH/406NtjbfqYg50
         Xjq0RSzixKiihDwzLn7h31HQ34brJYuQx0+yLzVr+STxRtlfggK4TQktwbLOkSE2Gd+q
         cnwLD10WmOO8IIY15n4KiXFv/uD3O19r0gxmhBUgORQQhmhVFJa+lqrkoT71FQAOzZFV
         STBYT4w7Ry00hSxyusbrR6Fr5V3UFp1+JECCTHJAGgZfgzfqKwNyMqbn6ZwDdd8h8PhL
         zrcrkHSyfPr/py/roDxK3UFRuZPdV7bEgESOGrjt6cG7bbDMr62a8gjk9PQ6bpzAx7oA
         9+gQ==
X-Forwarded-Encrypted: i=1; AKwUvByaMnn+b3Fj2Gy37tortK/Bfmi/DEXMGPTBH5TDHJG9zQnchhAtWkZVgRkdUmgJWDsS1//GVqEepczO/S8rJn2A@lists.infradead.org
X-Gm-Message-State: AFuF++l1Zm67d3YjFp8u0SSxR/XkDzPSW1J56LmpKodW6UQntyF+OuCu
	izFoeM6tnyMNBStQ9nqDpGpbWerK8NwT8VM/zx1InEYF6C5MylQAUS94AJKwdtuuMS0=
X-Gm-Gg: AYBFou0Tm8ZwW09/MMszCoOw9zPNpRZ179lfd/MdaAKg+wxm4b+B0U4/V02XPkjng/w
	Lu4+82muuYVl7LKEYP17nuGCxtiYkTga22oXLiC7aX3LpN9y69yHKbvPbur3eHSdWaoMP79HvQ0
	gJeWLzNqUtvHPz8dArvFA+H2GvswhRMlCFwzy4iqvWdY9RoKODxM5GW0cLwVCk2TFIn2AgOrRvD
	UiEFybjZSEh1lM6nxXbtStk1BPp515HITE35b+DMvav/6M/Zbw15NgLdt0lztXScgFkJxroPpeN
	+ASjlgpOFiAlnsErCmIH8TZJsZ3Y0T3l6E4QAgQ7LEIOdmsAiaT+Pdw2rPF00ftF2+YoEGZqnNU
	fjLV/ocSMxJmCbypMAoWRWjEQKvjQGZMsUbdL1l5y9MpMKOi830g3+uuetcaPMZ5HJTn5qr9CH4
	nFEvTn6yQb5IB6/2ULvB+xCESAaLT84zkfV4L/ixRLcJW5+5x7+GbtI0lYHdeX9S2kHMzjxyjez
	OAMuokzNXDoM0lyLfzojRWaTMaV5etTAcBrw1JYwqK69+2cmYB/82XLZHRw6ynz0pTxesx0wcJL
	Oou4XEOzmWyU
X-Received: by 2002:a05:600d:8491:10b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fde4acce8mr34646275e9.17.1790177083240;
        Wed, 23 Sep 2026 08:24:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 2/2] arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay
Date: Wed, 23 Sep 2026 17:23:48 +0200
Message-ID: <20260923152435.563925-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
References: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082445_208688_E4E0C032 
X-CRM114-Status: GOOD (  16.35  )
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
index 4b39b6c482d6..87d4bac1c89b 100644
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


